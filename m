Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC1AC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxNMxYyc62pc8VPN8RzPt8M4e75HkjYZ8HN4gzAMpug=; b=WNJQ/Z9T7kdubs
	/F6Q1ZcWW3UmfR+4AcBWHi0xD8dMfPrfoulB839CXg2aswLRw6I++zpLHelA3VWh26ZQ60Oz5pgT+
	o5CrYquwjPZpwable25uSeRcB0trH426WG07b4kMq1/gp6iHjnLw3yff2eR7/Ub9Y51BZYKAm9p0d
	fHToLD5IPWCPLrgdECNjKf07VpHtAauWDZNZuQVMzUSUlp/bNUmrO3c+UQhZf0HX1gdmJmnWbSeb3
	gDM4Q/U74cZjzjBhh1g+Grthz6tZ5/vMUti0XZg7ocx9ZKQ9eBuzsykP/CoGBxlmNt5vWH+CpYN5F
	uue8u1XqTj/UQDn8LpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cK-000000022LF-1enT;
	Thu, 09 May 2024 16:27:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cF-000000022GX-2vdU
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ed835f3c3cso8768125ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272050; x=1715876850; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsGZj+6+RwBmlu/KXoHPz6YMlsBFjDj3jnnuVWHIhdk=;
        b=dRPpobcIZVXCZ2+w2IO64l2ZrTzh47IttvX9dJuwYNIwi8N1BzgIDz2ZBaTdFSZdlu
         gwL2dqcJFFYs/8Q34KoK1fmmVyIRWwlDYjCO34JWz8AicEUMgl3sAwuLsRbb8xgUlKhG
         QDIzcrvd5xNUAcqgOV/8COQzRx1BT4AUmTrXb9pFAnY1GoS9T9hlSPy74cK7EKM9tfNT
         W8DmcLnU62lOVJzZHVgSMYkz7O0bBpEIZ/LE7GlsCF+V7aUDKmfFJAEFQfrK6NGT7AsF
         60jjXPpb5gY9pbsP9332qcZwDzUKwgTZtUbqoItp47F++oF43sdWPvMEyuLuyHpiakzY
         OGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272050; x=1715876850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsGZj+6+RwBmlu/KXoHPz6YMlsBFjDj3jnnuVWHIhdk=;
        b=gttvmZrAjbUy+u85cOtC17ZKwxQKlQf0spDPHLNmY5+YgA3ieLH02AmN9VseusXUiK
         OUYMi4nrBrNJyH9I0nXwT5l8F2MT3HcaDhGBs2bCgVflBdZm37VeNGQFHs6csqcvW99D
         h+lrnYhRVcGZ1qS4P+UBcWBk4zhaj37wNr/iWpodqL18Jxp9qDrtuaE6clxEZOQ+oJnz
         /b29DiIJT2bcHtAXE2WMKLZ+n/kQCk9sEfEUpO1uNysRLmoX7X3PVKJxTeAK6GW6ULV4
         /shH2OyuDKXc1dl1Z6iEk5btBPnG8KqfR9zJZ08YmvQKwVcnmSnw8JvcVegSJsL2953F
         yWTg==
X-Gm-Message-State: AOJu0YxBLVZZiX1EAw3pJZ2hKkBAioH4R6FGIkzmb8Tvo8IB/FQ+JsM7
	vR7JLuBlSjkILpWF+Ke4nEQJY7z41zb3UyOt/PHvXUc/+FM9MFY4e5O7rP7aNjw=
X-Google-Smtp-Source: AGHT+IHfn6hT/473i2wtO2K43xZtY/ybBEPEsMcrOoIPQowXqA7gpNfiBN0DjkayLmip8ShtXDqthA==
X-Received: by 2002:a17:902:e541:b0:1eb:1af8:309f with SMTP id d9443c01a7336-1ef43d13820mr1827245ad.4.1715272050172;
        Thu, 09 May 2024 09:27:30 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:29 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:52 +0800
Subject: [PATCH v5 2/8] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
MIME-Version: 1.0
Message-Id: <20240510-zve-detection-v5-2-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
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
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Yunhui Cui <cuiyunhui@bytedance.com>
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_092731_870340_70C16EA5 
X-CRM114-Status: GOOD (  16.07  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>
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
