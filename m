Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57D4C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CE7GMqQ7F2gIOiP0RQ1ilOCxxJZJVnvHNsr1x8lAZkg=; b=f8lAu4c+pwG4iF
	ILkQxbuH8LiSWfZMuRWceTaCb2GogvCeFS3+P+VIjecz1qGYYV51YMb8ZptnaF333N7X2gnweJW6c
	yf9GIpeeJxPierVsRGi9vkY+1LPLFMJcYeNCfb5DqZw4GfO3rDtUWC+oXjl2qlegft3Fngrp+06hm
	kyYvyAGCL6RAdgyQBKFJpScwbyE2BjPlFFA9LLMHwXopI+XDdDi3l6tpzMGVhFVUAq8TP4rCWeqTE
	K9IerKjV71Lcmd4wq1dVXHNwV/3qk2JGHMkQ1nR78CFrzZ2pMAbCd8eNKmQnFQh7KnM8QLGU7Uyc4
	+tI/B60XOH4REp1bR5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPd-00000008AyE-0P4S;
	Mon, 18 Mar 2024 10:40:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAPZ-00000008AvW-16zK
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 10:40:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6adc557b6so3926328b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710758408; x=1711363208; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQUHrqHWjcyGyF/NEsfpZqczPZC6iW3/Q7JuMvHiRfE=;
        b=g3GALdDQlJzNy2JQnENjVFeOiQ82Vpti0ZmuQK0en/a7ULHwd43EaSzFGTTvKjglMw
         6/lo3S7aIbu87Je0iSYVXtm7mmLq6dciNedkKjyjtX193/3ajgkhpzfNYpZWrYlcvw+x
         0gkguaAPJ8F0wAd80hk/1m65yekhnIaMCbMWeawOLFtwDGtz593ifbBae09KKo1wJ9Xr
         CgwfXEyFogeWdbgrYDbokhYd5dC2F1BlT8DM85hTAhDJCUxMs+w/ovhMYZtCL76FiAp3
         XC5Z4ZgGZE/gZzK5oJn8V3SYgvtNNzOuChHDz6l+TdRc9OaDXc4QclO2ZLvcow3JSBSD
         GYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710758408; x=1711363208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQUHrqHWjcyGyF/NEsfpZqczPZC6iW3/Q7JuMvHiRfE=;
        b=n0jM1HwTs0ZdFBz9zGS0PTrHfe3nilgDaMfI8aarL/AOpPCMGAmCqJbI4N9Nr79W+G
         XvcgpwTbC8WgwTe6r8vhqyeCbUoCbZXyIgCDnQzGrAvutrFAyviN6iUqUY9WEFcC9jct
         RlZ9f4Mfn5DmWZvhb6bAWMqarvtYkjY4ioBvxMLHLnBb9UNFvssd0vWHZqrIx2HCy0Qm
         EeUbbIy52MRl9jhroHryoQ4f6JMqaH8i+oGaiWLzw0tFzDENgCkjBUv30TqwKTXFztKv
         bu95SHaKAFMedWkIt4k5ThFC2kR2OS94eb2OE4PnX6um6VllMtHFUWnZdPPEBzDek61B
         8C6w==
X-Gm-Message-State: AOJu0YwcA2iJXIhsev7nqdDVpXx5OHO7MK7rsHLS4fGPmKt+ZtN3lESy
	PXihCTbpiuT2KIzJ3geVRh7K4mgA0Vx5XxLUPBlamFHftj20QDOXHWpXeL2reAc=
X-Google-Smtp-Source: AGHT+IHBRt10B3JNwV8vX+UWPVBlF2Eg87pHt2EqyuL8zRUXC32dZPfWh7m+ZkrSI2TISV+eofA7Yg==
X-Received: by 2002:a05:6a00:816:b0:6e7:2018:aabd with SMTP id m22-20020a056a00081600b006e72018aabdmr4873937pfk.8.1710758408088;
        Mon, 18 Mar 2024 03:40:08 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c11-20020a056a00008b00b006e647716b6esm7838969pfj.149.2024.03.18.03.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:40:07 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 18 Mar 2024 18:39:55 +0800
Subject: [PATCH v3 2/7] riscv: smp: fail booting up smp if inconsistent
 vlen is detected
MIME-Version: 1.0
Message-Id: <20240318-zve-detection-v3-2-e12d42107fa8@sifive.com>
References: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
In-Reply-To: <20240318-zve-detection-v3-0-e12d42107fa8@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Andy Chiu <andy.chiu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_034009_744033_3D9C658C 
X-CRM114-Status: GOOD (  14.87  )
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
Changelog v2:
 - update commit message to explain asm code change (Conor)
---
 arch/riscv/kernel/head.S    | 14 +++++++-------
 arch/riscv/kernel/smpboot.c | 14 +++++++++-----
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..a158fa9f2656 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -165,9 +165,15 @@ secondary_start_sbi:
 #endif
 	call .Lsetup_trap_vector
 	scs_load_current
-	tail smp_callin
+	call smp_callin
 #endif /* CONFIG_SMP */
 
+.align 2
+.Lsecondary_park:
+	/* We lack SMP support or have too many harts, so park this hart */
+	wfi
+	j .Lsecondary_park
+
 .align 2
 .Lsetup_trap_vector:
 	/* Set trap vector to exception handler */
@@ -181,12 +187,6 @@ secondary_start_sbi:
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
index cfbe4b840d42..1f86ee10192f 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -218,6 +218,15 @@ asmlinkage __visible void smp_callin(void)
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
@@ -230,11 +239,6 @@ asmlinkage __visible void smp_callin(void)
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
