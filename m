Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FCCC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 06:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkJj3vG3sRcSUiGiEl0Spdnmo0ecEDwluIo9Q6L+iDY=; b=DeU0kKoWkNmMrU
	7gI4ksj1Hv46Hf4SwGsKrXXdtGhJmkZhlLGi1hNWJid0j8l3FG3Mstw08s/Qb+k6GQoBl2fnBXrwp
	bkXIw/eRzmfyPmi0toOvC/9aAkmXRAAqSSUvBxpMJko271MlhiUg+dO2E87QpjvDzMbBR004U+T+V
	w4e3Tgx3IBbCh5SbFD49N52Ye5wo3yVqtpgALEmzLq1saUwhpn49+MahxELtizVi51B0Xv7gFbSpC
	SWzkWS9Vp5/qIZJ0oGXyHEBPdPDpFVeUyYQknYi0SXSpSQFpnyzN9frOFtIJ19K1YPYXgYmM2zPiG
	MPFm0N9gKZ/O4PAe7kxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAio-0000000FdJz-2o6g;
	Fri, 12 Apr 2024 06:49:14 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvAil-0000000FdHV-482J
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 06:49:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e5715a9ebdso5788985ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 23:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712904550; x=1713509350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IE7PNdtEhi9KW+zIWld3aHVp99xlyaQhdGOlf9pdhFA=;
        b=J5fzixm0o4pvNdDi296nDphfPTvYhYecGNjC/ua2iLt282QxmFwy6fh2VEGh/IgdN9
         1HqeM2tlYBRqzhQegJ2TbVMGZC59g3lBBoiNOD1BJLFWKZtUY5OfiRBCysYzWOJkFHAn
         S6t6/G0Pn97fd6qwMFlmKTZN9xZBptYMcaDHFNmT7uKGWdegUb+3JDFh/tn6XRNVDFy3
         W7mEaybGR8TMwldkwm7PlJ/tLj4mOX4qZhoGT6iFuh/JNO7jn4BIyQpj5WecXj1W4G1y
         WzzsrEutgbNV/5BVbUTQLX6/5L2EPFXJFWsLDr1LP8e5u4ngTNorPVHevH+4so5g8O5F
         E3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712904550; x=1713509350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE7PNdtEhi9KW+zIWld3aHVp99xlyaQhdGOlf9pdhFA=;
        b=RuHoWWU7g8f4jM918Hn1C61q+m+3XxMTW+xKy0eJsFGwFFJmRzuIFi0QBxFEyIiz6B
         5DJQbrtcr1wT+KK1MQeYWbFDJwJh+nJR3UyoDQrTaWnWfN7e4gRHCdCJT71FP0aZS9Ab
         2XI7mDQ+/QrwTt3dKxmYqGr/MQ0sVJ0maIChtBG8jjX5/MhWGbq06eRQA2mxgKlO6ps6
         NjiOZAiJzYM4qD2ftP6n8A32tu0iSaaWKtPPh8aRHGsiJuHzTR1m16N1gAOv2zftF8PF
         6j7Em6M5QqxdcF999lQ3tTvHXqq9mZLLZzlismXoIDMnLLHplj5Zxv7cRPbm3zJNOQQo
         rZXg==
X-Gm-Message-State: AOJu0YyGCEL2A8Dwjf0gXgoZ/PVffO4gplEMz4pDDwyxCIYaM43bloAi
	SorgjjuenkkYvINDK8P2fvz3vwxyGD89lRkPeos/6XH3kUUZZF5Ny4C2udaDwh0=
X-Google-Smtp-Source: AGHT+IE8CTAbzbIbDZAwGKJBJYZimAcWW4i3f7cikqAXGoGmEwow1T9cytWYxzK5BB3Uu6leAZrAPw==
X-Received: by 2002:a17:903:1210:b0:1e2:adad:75f4 with SMTP id l16-20020a170903121000b001e2adad75f4mr2046388plh.28.1712904550318;
        Thu, 11 Apr 2024 23:49:10 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q8-20020a170902b10800b001e107222eb5sm2258818plr.191.2024.04.11.23.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:49:10 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 12 Apr 2024 14:48:58 +0800
Subject: [PATCH v4 2/9] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
MIME-Version: 1.0
Message-Id: <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_234912_119901_965B1827 
X-CRM114-Status: GOOD (  15.70  )
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

Currently we only support Vector for SMP platforms, that is, all SMP
cores have the same vlenb. If we happen to detect a mismatching vlen, it
is better to just fail bootting it up to prevent further race/scheduling
issues.

Also, move .Lsecondary_park forward and chage `tail smp_callin` into a
regular call in the early assembly. So a core would be parked right
after a return from smp_callin. Note that a successful smp_callin
does not return.

Fixes: 7017858eb2d7 ("riscv: Introduce riscv_v_vsize to record size of Vector context")
Reported-by: Conor Dooley <conor.dooley@microchip.com>
Closes: https://lore.kernel.org/linux-riscv/20240228-vicinity-cornstalk-4b8eb5fe5730@spud/
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
Changelog v4:
 - update comment also in the assembly code (Yunhui)
Changelog v2:
 - update commit message to explain asm code change (Conor)
---
 arch/riscv/kernel/head.S    | 19 ++++++++++++-------
 arch/riscv/kernel/smpboot.c | 14 +++++++++-----
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..a00f7523cb91 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -165,9 +165,20 @@ secondary_start_sbi:
 #endif
 	call .Lsetup_trap_vector
 	scs_load_current
-	tail smp_callin
+	call smp_callin
 #endif /* CONFIG_SMP */
 
+.align 2
+.Lsecondary_park:
+	/*
+	 * Park this hart if we:
+	 *  - have too many harts on CONFIG_RISCV_BOOT_SPINWAIT
+	 *  - receive an early trap, before setup_trap_vector finished
+	 *  - fail in smp_callin(), as a successful one wouldn't return
+	 */
+	wfi
+	j .Lsecondary_park
+
 .align 2
 .Lsetup_trap_vector:
 	/* Set trap vector to exception handler */
@@ -181,12 +192,6 @@ secondary_start_sbi:
 	csrw CSR_SCRATCH, zero
 	ret
 
-.align 2
-.Lsecondary_park:
-	/* We lack SMP support or have too many harts, so park this hart */
-	wfi
-	j .Lsecondary_park
-
 SYM_CODE_END(_start)
 
 SYM_CODE_START(_start_kernel)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d41090fc3203..673437ccc13d 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -214,6 +214,15 @@ asmlinkage __visible void smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 	unsigned int curr_cpuid = smp_processor_id();
 
+	if (has_vector()) {
+		/*
+		 * Return as early as possible so the hart with a mismatching
+		 * vlen won't boot.
+		 */
+		if (riscv_v_setup_vsize())
+			return;
+	}
+
 	/* All kernel threads share the same mm context.  */
 	mmgrab(mm);
 	current->active_mm = mm;
@@ -226,11 +235,6 @@ asmlinkage __visible void smp_callin(void)
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
 
-	if (has_vector()) {
-		if (riscv_v_setup_vsize())
-			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
-	}
-
 	riscv_user_isa_enable();
 
 	/*

-- 
2.44.0.rc2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
