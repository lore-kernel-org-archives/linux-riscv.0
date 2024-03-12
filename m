Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEB1C54E66
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0VGAghvSOUYxZ9obZvDhTpUpU/srew6SVML6nypIqko=; b=uY25nLPz7Y2l2TUwEbh6QgaXp9
	DgouYzkZZ42jWwnVR68sD8DlG6PonU18A1jN6fUPp8ORpbs61fac7AFsRioQqplofsJNdrjxMJxHG
	4Rb7/N4kf7dW2SLY/Iys67Jfqc8ldhimQSoBWkEFO/9N3ytrJ4cxYtYkz0kKVJIFP4Kqz7B/duO+S
	sR+jG065cpLiGWC0CJGoaGnGqVkOKv4uIKhLEVOXLkZSPGgViMTlO+ZSBzbByAwn+kFcb74qQxO7h
	mPtG9JgdPSFdYaCR6Vs0MUIr5lf3AG4a/6R8UrKyLhm8qdPupXABqWnlSAiIpuBM2wvGrEZP7OqLZ
	P3kryhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1NB-00000005lds-0OwA;
	Tue, 12 Mar 2024 12:36:49 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1N8-00000005lcp-3nMZ
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:36:48 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so4805558a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710247005; x=1710851805; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xN7eHdW4LcYM7Mc/XXEbclq7SVzClHhpT4PqxrpnO2c=;
        b=ax4Eox/4quWUCQ2y6Hi+Cu622NxAGQw+axHpERYeNUuVESYCFUGduUyJPW+7x3tRv2
         L9RDWploe+bC67aBejeE9HwX/MNmkeSkW3N7LvKzEoa4a4Cx+P8e78SB82jvGRQFGltm
         dJu4wgLyYu3fofPDEN/wU5aiboiyzyzwG1lfkwEksQub2Y5aa2/pUJ+6bpbXHCFgl21Y
         F4+35X+TqA4g6DeDduOIeXZ5KfvCAKUDSlmUDtfSvO8M+P2i4a5ljQc+ZZQl6sj9YJuH
         brxoPl4Tt/TgO8wWJ70hHnHuCoNbJSibe2gvGS/gEXC/3y0i6mo2FxOMgMgETT+zwza4
         GkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247005; x=1710851805;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xN7eHdW4LcYM7Mc/XXEbclq7SVzClHhpT4PqxrpnO2c=;
        b=Dq9rJeR1JBptEWvuk8BLs8NtuVcArOTOm9zSd/1mBB6xixL0p7iBVSjtR79QgGvRtX
         Gg9M2b3rsdOR8Pj4RTefSrKlQ7VTZc0snbaFRiwjNrffb6kq7kHZjiAoKupOehbM8Wzc
         Ry4EuBUGs9/hVMQMEhzYQDcS1izcLs8J/efmqryXIa5+l3+jrpuZ2h9AmT/7Iwu9A3u8
         JxZ6Uu75SpBS5QID+GXOU8zUBdW+kngLgnbKNXiglexFllPUeToHlqn1TdAPot5QpXic
         WzeFg21xLYw9QeqX/rB1D/c0HStgLE+pxh6MULlZmz/jeiZy3ST6YOBOAQSpa4ABcZ2z
         syug==
X-Gm-Message-State: AOJu0YypTOIJXyHjEmVxO9qow7Nr6lR0ma+Bqr7rmLKHnGXNRbaEJB8V
	xRlNtcKvLbb1XrR2bFa9jyTk5hUMvXLeTEvRbuaVIoO7naQpeqXK75WU3HwxXjJ+tmuMfYapQcV
	lhibrGJo7v4TEhs3SWQ/y/MIcG6bAZScRk3ypRwR05XNBecMKO4Ql41caisIJ5Ph17NayH/3zue
	uSY50jXKzeMHGamIGK1lAy25Q/9vgxwQEnT9G5lYCxnqlKzg8lPUOD
X-Google-Smtp-Source: AGHT+IHiXB18mYqhKjdc4DlUYAeC2HpIKLvKbex0ECTZmBtUAIO5I+Jbf0bmLhP1fWPt3VuTIatymg==
X-Received: by 2002:a17:90b:1e50:b0:29c:48c3:bb5a with SMTP id pi16-20020a17090b1e5000b0029c48c3bb5amr670626pjb.45.1710247005319;
        Tue, 12 Mar 2024 05:36:45 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id hk13-20020a17090b224d00b0029c2794d3f7sm1804233pjb.7.2024.03.12.05.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:36:44 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Subject: [v1, 2/6] riscv: smp: fail booting up smp if inconsistent vlen is detected
Date: Tue, 12 Mar 2024 20:36:23 +0800
Message-Id: <20240312123627.9285-3-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240312123627.9285-1-andy.chiu@sifive.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_053646_968579_7F361753 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, guoren@linux.alibaba.com, Heiko Stuebner <heiko@sntech.de>, Yang Li <yang.lee@linux.alibaba.com>, Conor Dooley <conor.dooley@microchip.com>, Nam Cao <namcaov@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, bjorn@kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Frederik Haxel <haxel@fzi.de>, greentime.hu@sifive.com, Sami Tolvanen <samitolvanen@google.com>, Andrew Jones <ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently we only support Vector for SMP platforms, that is, all SMP
cores have the same vlenb. If we happen to detect a mismatching vlen, it
is better to just fail bootting it up to prevent further race/scheduling
issues.

Fixes: 7017858eb2d7 ("riscv: Introduce riscv_v_vsize to record size of Vector context")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
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
