Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9330C27C78
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 17:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82F19uxTGuNTUDRjpEapHakwMiG3bXaKkSF6COYFJk8=; b=i5+v/d/utTciwG
	YZjvUiUy5VyE5QL2OCuXANRFIysqaQ7Vm/La9Gl5BIPxkOtgzCwi52sJSAM45h+wKQyXUCTc7IS5+
	bRj5cqW0cfuk7ZWsBDQhrPu06Nxed64ONFxu46rrM0QGoLLAzxCxNrGS0UgwCz5o9Hzb0ZU5TNYU6
	uvXayAjd4LnrfzeIakaXa/y7cIfZvBigziiRDajFhNuhXJN2U+nJEs9T76ETFiFUiOOjyQ1xXEL/3
	VJafa3rQ+vaCjycgnK06C9SPeiLvc2fG6y5gJI+rpyimzD4zjNgHTVHKWr8OngofaV4AiRWtehH7+
	4cA9ZTpMhV09zT2h+qRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo2N-0000000HTwU-0AwK;
	Thu, 13 Jun 2024 17:14:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHo2I-0000000HTv1-2wkW
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jun 2024 17:14:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f6b0a40721so9366395ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jun 2024 10:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718298894; x=1718903694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PiB/UuEMeERuvvonGAvIVsUp7Uk/id7nJUnnnQyTCfs=;
        b=kXw8a25MBMlcNxLwCnzGHh/UiX0MX6KxPTqC0T0m6iB8Zx/8lwT2AzpI0OG5jzgKCg
         ValypveFVJ2BiHBLXWz6YBy/8A2j6JnrTCGjcnuf/+nTSU6bagCi8bSxHjTJaX5LF+Ji
         +GETHA5kytCEm9wRB+a+lT+YfbcI9xa39WxZOsgX9k0P9h7sjHxyx51ExJ94YmNP39zr
         kLD5s4G42SV+Jn/SWOVZkCCRt3xtRIc7bbqNw2ZF10ozrIjnC6GDRxlvH+JZRNVNaBPw
         OMmkFvd3WUevDStKCuO1Hn0zV8HWo8jKOdJs8YCUXtnTXeqCOP1zqheatEY+Uf9cMFlO
         n3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298894; x=1718903694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiB/UuEMeERuvvonGAvIVsUp7Uk/id7nJUnnnQyTCfs=;
        b=c7Ue6mM7oNn7Y0e96TH3d+REKoyLo8qAFnQcZ0mzVWTBmelH627ebyuoFxGpMxw6MI
         6Qn3Kz2x/RJlT6LzxNvFQlE+N0Xg+7yNSjO9Q2oWtW+4NKm3uSKIbAOctk/QoPF4c4Aa
         KdXfw47ysp2rXZL7keTJF++IZ4BTMmr1ve8rTMo10j4FXV2cAOPiS7wix7UyTG7SnuaV
         PjHFf8r/zNj277gSDXgDYdmXEual3DTjOucRUnqeJi4+Pkpt4sZvX2Pwp2zJX2fcZV4g
         84yLnmN/RaaSzypSCRyaJiavXsAjmvkEVnaKJA1OXhnYTMBrAFbFDs9ya6vtedtqIeU4
         HmTA==
X-Gm-Message-State: AOJu0YzMlV8dl7+/k6n9t8AsaN1/y6dU8BeFt46EJ9hNOSO6KK++hgFb
	/p+V+mwhkpjaDIu22pj/8e3hOg9FaFFRSlt2syoEVmJPY6SJJMyBpAEH45Yl3PCpzE4D5w20fIE
	QVrijzAyyIM96izVlWDaQPblZvaOIKyPc3ZNF6M+eFWeM8V2UTrrJ06qtf+BZMF23ihulcsiBnp
	eyrz0HQ0tUC24y7POGZKNT8APDLICvPbEf6rr8n8c/tlIg4h7LnAzl+Jzn
X-Google-Smtp-Source: AGHT+IEC3ooBkVTmCDBXrUOrLtGQVRJuUPu9D01slJFB79gG+rGaRpjLKGcsWlDV8sqY64x6kc174A==
X-Received: by 2002:a17:902:cec4:b0:1f7:3d44:1f1c with SMTP id d9443c01a7336-1f8625d4e5emr4130615ad.5.1718298893625;
        Thu, 13 Jun 2024 10:14:53 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55eb0sm16445035ad.18.2024.06.13.10.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:14:53 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Deepak Gupta <debug@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 3/3] riscv: Call riscv_user_isa_enable() only on the boot hart
Date: Thu, 13 Jun 2024 10:14:41 -0700
Message-ID: <20240613171447.3176616-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240613171447.3176616-1-samuel.holland@sifive.com>
References: <20240613171447.3176616-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_101454_820860_E86C61A8 
X-CRM114-Status: GOOD (  14.88  )
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

Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Rebase on riscv/linux.git for-next

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
index b5b8773c57e8..d3e3a865b874 100644
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
@@ -769,12 +769,12 @@ unsigned long riscv_get_elf_hwcap(void)
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
index 19baf0d574d3..0646f79e0a02 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -235,8 +235,6 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, true);
 
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
