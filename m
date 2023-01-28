Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73637C38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+5GaLkvbYgfWgRSFHwm7EAwxgzv5a2u+AiWtG6aAJg=; b=1Pi6EX8+D4SsGn
	yPWzugmVK1ouMGiFTOBrKNRgAqq8GUTTow/MLORgBZ/fcSrLYaQokvbEzd1HSs9w1NwrTkXuHskXi
	y1I4RrR4Th68jak8+jTjeXvUIlB781Ab07LeVvYFv64Xmv1WY+ZVC4n1RiDyNOS2KZrxIDpf38MiV
	gB+Gf5baYsZQnnjvw6jvda3uBEu8UuU4ezwOBUDndD5brH5bduzQLU3IiBrST74DrMfHxUvR4xtzP
	BTRcKFXo0mp5MNgOI6bzJrk/soo1a0C7ONoPu/V2P0KaPqMY9vilVkGoFoMuV4JOWulScpESreMAo
	i/hjrD887QA9pMcVLmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpBU-000TXw-M0; Sat, 28 Jan 2023 17:40:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLpBG-000TIW-Va; Sat, 28 Jan 2023 17:40:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9C341B80682;
	Sat, 28 Jan 2023 17:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93349C4339E;
	Sat, 28 Jan 2023 17:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674927596;
	bh=s7J/q6ens2rvlMJbJ7trLTcT6RXo2JnK5jMkTSfRtMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=or6Q1P3qk1ryFUh6y0FImUlHZcfNXCDeY0rpPap7KVTCY2YjEI5DTFaw3nKtOE4cH
	 tg6i1O2ma3ObRI6jH0W7/2azYCUb0Zzf6O24dHKXNszSqhNFUUjouRpYG1dP3HTOhh
	 OTOg9ws0qfqJrtnaZa8PVgRITgwDuU1kPDBvwkIHjkRfq+aYt1qgntuq9OIEV4Nh6i
	 1QaLn13sJEbaWGPJHICadre4zBDftCNStlB1iNRx255xVmixR2mYYAhCHL+FTJz+II
	 yd6QE44US6JUVA6jmsrWI0/zrQa09GFfhI/+4j477sRVjYAoBIesbPGKEH+sk+HHsQ
	 CbAF2PWb+KwCA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v5 11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
Date: Sun, 29 Jan 2023 01:28:54 +0800
Message-Id: <20230128172856.3814-12-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230128172856.3814-1-jszhang@kernel.org>
References: <20230128172856.3814-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_093959_213563_B627B6A7 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Switch cpu_relax() from static branch to the new helper
riscv_has_extension_likely()

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/vdso/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include/asm/vdso/processor.h
index fa70cfe507aa..edf0e25e43d1 100644
--- a/arch/riscv/include/asm/vdso/processor.h
+++ b/arch/riscv/include/asm/vdso/processor.h
@@ -10,7 +10,7 @@
 
 static inline void cpu_relax(void)
 {
-	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTPAUSE])) {
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZIHINTPAUSE)) {
 #ifdef __riscv_muldiv
 		int dummy;
 		/* In lieu of a halt instruction, induce a long-latency stall. */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
