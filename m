Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3E3C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7UKB7F+vRknFBM+xs1KYkeu9fTIb/z2GFNRdZ/AX4O0=; b=qpeSyTNzNZ4w+U
	Ji7njFhprlaa6WuarNhJ1hFoOVk4RTdqF++jJa9cAh/i/2wU3MLDtetJUPVXVIOGkrCfNbKxb3wJH
	jVK2H7vkk48gMQ0cVt83L+BEAJO8zXFt6WFSWoQhQl5hAGAva31nFhVcnsfImbNpWPvyNqcKRq4IS
	bnTW3jqaVttWtxebVhZFd6EY/mVUkYtnmmLuBsDyVzNn3+I1Fh8F0+oa4eRgpRr1rCfhG8R89d4L2
	x974Q7pdvGHC/MO88VD0bWO5lWKO4o4+hyyNOUND8PJ7Zqdz+wK1tptXUxveJx2SDEU62EXuC8O9f
	ny/xqlMgg8Z9GsrtQUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemd-00CM3v-Ea; Wed, 11 Jan 2023 17:21:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFemY-00CLxg-Sw; Wed, 11 Jan 2023 17:21:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 05DCFB81C86;
	Wed, 11 Jan 2023 17:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62672C433F1;
	Wed, 11 Jan 2023 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673457653;
	bh=XfFLNWhAd8k4qxV8rXLEBaM1QQgAKaJ6LOhZRHyHg+Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=muCp1adDcrT3TviFaKXdg0Pic8fXJRdvzrirnhFO1zFdeYWn/dET9sP7d1RdUdFAp
	 DWxW08xXfBBtPd1rb+d48sLNkQQPnmss5DhciXz35D4n8UHO1DE1JhNEGLkAKHE6Ah
	 taBSW9mbljzQvG+6oD+fvAHKEKilx/yD8HaAvHvgMPbQAEbjKvGzZEEIvHXTQUX+EE
	 GJNrEsSIE5bWQtkY0U7nD1VanPzihUX3CuDncZoPfDPiG1gtMhGXnBxxQlPtONq+r1
	 5jLS2amJ5VeyhyBDjO5dH5DSMV6q4r8JBsdz9yhre14+cpSkEmEE43VsFskr8J5qEj
	 wx7SU9f2rQEkg==
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
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v3 03/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
Date: Thu, 12 Jan 2023 01:10:17 +0800
Message-Id: <20230111171027.2392-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111171027.2392-1-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_092059_102258_BEFE2ACC 
X-CRM114-Status: GOOD (  10.85  )
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

Currently riscv_cpufeature_patch_func() does nothing at the
RISCV_ALTERNATIVES_EARLY_BOOT stage. Add a check to detect whether we
are in this stage and exit early. This will allow us to use
riscv_cpufeature_patch_func() for scanning of all ISA extensions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 421b3d9578cc..37e8c5e69754 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -328,6 +328,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	struct alt_entry *alt;
 	u32 tmp;
 
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return;
+
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
