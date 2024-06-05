Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448F1C41513
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 20:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLMZii9l6Ua8O5MIGojiC2JBzPWkVBYYdjxHi2LRG5o=; b=Q9yxdz8iYDT+GQ
	jTaw939hLPk6XrjqooB9rvK+4ck1YIpufUOY2izlgA3rvo3qTfNuKh3+1LoC8p3VJWLnteBaDp41F
	vv6D6WbOpSbW2MTBG0sGQpr7hmAdNtTwO1Uxcdk1O3q1Bb8weLXAa9/i7m4FQ5E7aiIG79MS2HcOE
	yC5ct/FR4f2Ah5u6+QD7gma3y9ElebxdizMs9+y/L1u1nc0uOJTG4bcizyN9FecsslTIe/jGz3nOn
	7EXhxp7UmBrg6+xiGQ27zOy2AC0rZbwpiVLyR/cz7IFCSVY6saGc5fnIOhkXV63ozhYUEnCT5U31x
	fIxwYssR9UOk9n5rAxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExh0-00000007Wkc-3ffT;
	Wed, 05 Jun 2024 20:57:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sExgw-00000007WhG-2zg4
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 20:57:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f62fae8c1aso2301425ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717621024; x=1718225824; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uty7FoscHz4fIjCNzqhW6L2ro7Xc7g0lgY7rTZohcbw=;
        b=jfl2JuceX1P8wIOwEBNjeMdCtaaXWGY3bGZ1CZZuZO95H5L3yxPD7me+1xoTLHfjzq
         1a+RogkFTMiPlgba5yAmyym2ZeUZjvdEi+dYWCtZpUxqTXNnmf/EaPV43JT3LkgsyzKk
         sjALZ5hGhDD0fhqQtiHSNa9CMs8rGTwqYjYKbETv9IpWNriVDJzRygeRsOsXOIevAS74
         NhcMmx4Ev4LtyaTMHG4Q4PXIoJPxjbxJhqF6olU1KiaJrYNPnozTSEaMC9IAj3p5MiW4
         Op+wDWlfoPSGcj0oTf5pWurbUeTKNGbAsge/f5NyoPu2fDn8jPrw137wbMc3izlSIiE2
         6mcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717621024; x=1718225824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uty7FoscHz4fIjCNzqhW6L2ro7Xc7g0lgY7rTZohcbw=;
        b=G5TldCRf3886xeHHjkanpJof/NTN9cvc2Lhx10w6UAsQxdzqO8VzIEGEcxLXhTQ9i7
         zxz1Ogx3xp4H1fgqRZcwZZatHj7YIvLVO5OmxI6sAQJypBlkjqEqpXJl3OCSRql05RiE
         q5pCdKSl6fvY1zmHgGgXetZnOk1w9qnAZINd7wChZC0Fuh3smscrs46OZ7JbTjyTpLHg
         MpmvYWtS53mPz8TRo6MwHO/tzfU5UXBt26bdPI0fNE7UpYUXLzfjplH+OYrCPhMFCFWq
         l/8PU/Ac7IGN6f+drqloO1rlNpOnPPlKbv0mRM+WoIZTFJB+nwpw5sXtesOm9Rsd3azE
         U5zA==
X-Gm-Message-State: AOJu0YzlN+1I/YMws58A5WhUaOTVhn/BahQ+cHiBNOnpHzmXUdtkBSDo
	LSAeVRABFE0EHIYP/EpbLa43p1ta3YFh0QPL9uTILsW/VPo9OysyDl3aC8dSRIB9Rf5A7N66vz7
	qa92jpTE/xaCf2n3DtOcrdSmnle1liXIA8gsHl96mHow9nC/J99g8SPJbSx2BunOQYJIjfjm69u
	HuGEhT+G+ojC4zhWKaq67XE6MrEw6n9+JQqfCnmdFiWCprB+ysM1tI+nJ4
X-Google-Smtp-Source: AGHT+IFKrVvHD0aCZ85QY1knnJIWvkOUtWAJ3vKHRJSp/gSnF42JTtt2tr6r7NWF/3DXkYV7sTZKtA==
X-Received: by 2002:a17:903:1c2:b0:1f4:b2ce:8dbe with SMTP id d9443c01a7336-1f6a590400dmr43547455ad.9.1717621024293;
        Wed, 05 Jun 2024 13:57:04 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd86esm107332135ad.121.2024.06.05.13.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 13:57:03 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/3] riscv: Call riscv_user_isa_enable() only on the boot hart
Date: Wed,  5 Jun 2024 13:56:47 -0700
Message-ID: <20240605205658.184399-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240605205658.184399-1-samuel.holland@sifive.com>
References: <20240605205658.184399-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_135706_881978_6364AEB7 
X-CRM114-Status: GOOD (  14.58  )
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

Now that the [ms]envcfg CSR value is maintained per thread, not per
hart, riscv_user_isa_enable() only needs to be called once during boot,
to set the value for the init task. This also allows it to be marked as
__init. riscv_isa_extension_check() sets any_cpu_has_zicboz, so it also
needs to be marked __init; it could have had this annotation already.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/cpufeature.h | 2 +-
 arch/riscv/kernel/cpufeature.c      | 8 ++++----
 arch/riscv/kernel/smpboot.c         | 2 --
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 347805446151..4bf7b7ebf6b3 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,7 +31,7 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-void riscv_user_isa_enable(void);
+void __init riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1153b96346ae..bfe8550c0aae 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -27,7 +27,7 @@
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
-static bool any_cpu_has_zicboz;
+static bool any_cpu_has_zicboz __initdata;
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -74,7 +74,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
-static bool riscv_isa_extension_check(int id)
+static bool __init riscv_isa_extension_check(int id)
 {
 	switch (id) {
 	case RISCV_ISA_EXT_ZICBOM:
@@ -725,12 +725,12 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
-void riscv_user_isa_enable(void)
+void __init riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
-		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
+		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 1319b29ce3b5..3e8ece31c30d 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -231,8 +231,6 @@ asmlinkage __visible void smp_callin(void)
 			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
 	}
 
-	riscv_user_isa_enable();
-
 	/*
 	 * Remote cache and TLB flushes are ignored while the CPU is offline,
 	 * so flush them both right now just in case.
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
