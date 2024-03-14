Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62820C54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zgZISaMbNZxBY+YM1Tx6AsNaJB0bP1arGDWw+9Gd30s=; b=eNJG2hPrBMeZESe1viFTeyAL5h
	FQlVq4BUVOnMuUBWqSDQDN7vaC0JmaV3aVQ8gZQrLnt/Khx5+oCZ/oTXIAzOC5ub1E75KqVqQVDmH
	FhVf15R2VDg3mLgdYqprxGlj0efNom1SX8hHVJN6TZmQUE/HSeFKPqOJ6Xj+JetK3KpKCXB5rTTwk
	Rtoc+iDUrRbZyPhWiZKuz24i4aOa93YSYtqXRLVDQE8GNs07e1dOPeJdZjd+fbsdkgTYQe1L9OyJU
	fiSpMu/fWQFgs3Y7X5xW9Sxgp9fFE1aSxDrLA/rArVZbeIhBmGOX4/cGaNGCNIf27xZmvv3X2r+6w
	vaji03LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2H-0000000Ecxz-0J4g;
	Thu, 14 Mar 2024 14:26:21 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkm2D-0000000Ecw1-1HbR
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:26:19 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6ca2ac094so848281b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710426375; x=1711031175; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7eIfPx3uV8lsUcBcwLRk+DN38YJd7k8Ey98w9r/NPtI=;
        b=YLx2XcRuZBODq00ssd9nxocvQeHJSVWlihLeU5KZ0/HaHCJfGwthHj8ou69l9QhPR5
         S+Zg0ZCjAGIn4VJZQxFCig3wZKdDSi0vnsbUqIjphgX+pI21/Nqsyvl9A5LQoBvrXiCM
         eudjOWOvJ3EOmP1BD95NJ+1encO1qVrYLPDFcaus/YPoAaX5nwDuW4fddptXy3zPpo2Q
         XuwHbao19LnpVO2DRHcwm9qV/LzJXMuAMBcrzeOTnlT32wYX+Zj0G4Fb0wj1ukMlUFg8
         OjkXZz2ygQ13sNNr+tbNjf9YBBxZMpTdyI7TvqadvAptbzpMJeJCVQW7TG/pe8IYZB4y
         f6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426375; x=1711031175;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7eIfPx3uV8lsUcBcwLRk+DN38YJd7k8Ey98w9r/NPtI=;
        b=HU/+0dDMZUN9P7c29/DNo8o+jaIEgodz2mx8KXwa3FPR9M+kdEE5mHtBijlXyXZjkZ
         YZ3jGOCXpkNGYvMi1gL8Ey/s0YvDLiHOt26uEo5ovgrTNxxw+eYmAPcJT5RsBzE/B8At
         5mmQ5F3rPXO4Hawhp0uEVy3WD0qHlIkI+1iyD+UFFzI6VaWuC0XuUW2ZOjMsegz9Tjor
         3u03Ek9VvFcQxV3Iw3XHBxxhDTtbbi+Yb5rpBoZdhDwELq8Xh2FxlNpWbFbNd84IyReO
         cx48hqYxfgUIMimnLzMYHezJNbUMLMK90rzWQYV3unTN/TylYPPguNKv1f4iLNMfu3b+
         3Hfw==
X-Gm-Message-State: AOJu0YyNe00Bl8Etx7tQN9a955kcPIJFVEgt18I4RW77BYjHUg0lilw/
	EQosvbGWULwDm+YV8kbm4lqC00+MptcBMTZXKwufukK6fSWYnMit3k+gU1BB6IGRf6GqHWzYBvk
	t3U2ZoDtX10hZP7hbuCCX2iG5tl1NTOdYfMzHMa9vPdrch9tIKGt4Tgj1ObSLsQR2ZB/w/xU8d5
	R+NfMMh2gmCuTUEDiCmG2aUP4XwjXRsWdISCdm8HUAThsbAc+oDCI5
X-Google-Smtp-Source: AGHT+IFizZlIHpNGvrFzHn28G3FaiiV4YCqk3TNVOVImN+g2L15NfZGO4KvUMXvY+PWwzV/iYeDXzA==
X-Received: by 2002:a05:6a00:2d90:b0:6e6:9471:9f83 with SMTP id fb16-20020a056a002d9000b006e694719f83mr2383367pfb.8.1710426374793;
        Thu, 14 Mar 2024 07:26:14 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y9-20020a62f249000000b006e6854d45afsm1556435pfl.97.2024.03.14.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:26:14 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: [v2, 2/7] riscv: smp: fail booting up smp if inconsistent vlen is detected
Date: Thu, 14 Mar 2024 22:25:37 +0800
Message-Id: <20240314142542.19957-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240314142542.19957-1-andy.chiu@sifive.com>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_072617_383487_DCD7D5B3 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, Marc Zyngier <maz@kernel.org>, bjorn@kernel.org, Nam Cao <namcaov@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, conor.dooley@microchip.com, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Frederik Haxel <haxel@fzi.de>, greentime.hu@sifive.com, Sami Tolvanen <samitolvanen@google.com>, Andrew Jones <ajones@ventanamicro.com>
MIME-Version: 1.0
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
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
