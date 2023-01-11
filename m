Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70044C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2oARNupNmsHxxNnbJgVckdkOj7HdGCwjqq6W6T6Klk=; b=u0KxpUr4JhJh0V
	EytaBGx6ylYMr2/FgLwDSc3rxsX8FUZBXIBpaItOTuQYbKL9SDyZn3CDk30j8q/ljovD0r21luZCd
	ZalU9xat9wYBd0iHKLR4KTfZcLNKttjgeystPi+lXbivEUyx/eWr8Xyyyr0v0I/QMqvSl+HqZ3tOJ
	tk/7BP/diyaSok6gE37uRZDRHaEt6DlFFYkTOpYg94zKw45jR9cUoKUBOyeXaYratyUYJp10ALW2J
	8fKenZ419qLjY2AUM8zzdbF/fCg9BGSXXjYUGGEU75bm9qOG5UI3dKGjDIPriU7wwCHVoiMSBPxOK
	PiN31EjsDZUtijary74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFen1-00CMXN-A2; Wed, 11 Jan 2023 17:21:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemw-00CMOa-9w; Wed, 11 Jan 2023 17:21:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DB135B81B79;
	Wed, 11 Jan 2023 17:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EE5C433F2;
	Wed, 11 Jan 2023 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457679;
	bh=An7932QyRN88UCepeRWQ6p08wUO6xw7m46s6odwiow0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KKs/0/VFSvU2SnllZ+uG+nxnYXbVkIe8lRcr3KSHKo6td8KIyNPrEPYX+QoGpC/0v
	 IEbh7jBwyWqO20/l1BHxElXPwMPMBVvoezH1TdXTGQoiHcIwGQpsHFy0v3rlQqddgY
	 By77PW+uxHCcFntfWDM/+0mG7/riTiw+S30o/6l2ZOJUBQO0YoFdFC9aEcmFfeRvmM
	 bJTABO8ubZBVg0mlVot9/EPqeoJcuk/QIINFGIiQ/ueeC+sMXAXsIOSDWnLhZ/2L5J
	 irN93MKeyPBSmq6NGqqcrtZ2sLqS2WNNOmDUEKlKjfKfsxSz/V8vsHWLrURyC51ALz
	 y0y3ESvmyldoA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 11/13] riscv: cpu_relax: switch to riscv_has_extension_likely()
Date: Thu, 12 Jan 2023 01:10:25 +0800
Message-Id: <20230111171027.2392-12-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111171027.2392-1-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_092122_544990_4082F5AB 
X-CRM114-Status: GOOD (  12.44  )
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
