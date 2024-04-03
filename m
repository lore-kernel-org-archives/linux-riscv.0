Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D5ACD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 23:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtEDtiIJ+6KhkZ3s5ikPUKsDncobdUgzaUWQAndMul0=; b=GoOMWQ7ahSyLlW
	E9OYeqtZLEsk/b7eDJCRx58vQMMLE7AkxrshyxdJosC7VEtW4I5PYAChHMgwFYwC/5Yipu4WoZPMG
	GsW8rqMg+BMRLxPz+djv7QIc+322nPt/+ols+78iL5dPyCEc9CzDf+Ezx08rGeyJBZtPc4Y8AC247
	R9Z7D8N3jh8nP8kKhHvnsCdFQ2giNznw2f0bjGFILU8+4OiQVQ8mBJYtw9ubMBrViw8vzMi8ij9WZ
	b+a8gzeBBOci1i+kIPr+GJxLQwgd5T/7KR7QmTW2hQI8H7c0iCYzunmeTUfy7MeVpl8RZxpkk/VP+
	Hx4A4vxk09R4TmxdIgMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFc-00000000aKu-41r8;
	Wed, 03 Apr 2024 23:42:41 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAFB-00000000ZrU-1T5i
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:42:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5d8b519e438so375435a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187732; x=1712792532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZ8ix94mmk4BD8MMBywPtAuOuTf4nkdzJ2/QigtbDFI=;
        b=Ph0eTk7XSMRsT6PWCJZE5IPBXDh2eQ59+NsY2f/1EA1H82gCC6bd7X3uzupkuz7JjG
         32erXi7Bq95zd+UHpRj1kPcWXuOl0z6gE2r72ZVuSmk5ZMnSIEUcjauwePNlQKI5NQkV
         MT2tbyy9BUsCZc66WUo5/9sQpZW5Xd1jkemB9ECIFU2ayFCi5N2ZZCBlHHG4pdwlbdcQ
         UQTh44VG7StfttYuyWSfqkqI16red6V2ukNAfeOQ89DjKRhgtoj1z0ojqP0Mui0YLGYb
         sDsAb+E3IGN6OlE6goq5GxTqcnbw1T2WUuGf1zfYrKHyRQoOYoZZdnw7SjslUrx4MFBn
         x4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187732; x=1712792532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZ8ix94mmk4BD8MMBywPtAuOuTf4nkdzJ2/QigtbDFI=;
        b=dsyhFWFZ+uVH9jLsG39hiPgeXUgp+2ah8tNMFCsgDXBMKUKJnmlSEmXHh5CTEF0aYn
         hPjv73uz1tauGQNGNo7iMVWteMP6FMkm2yiGHuQL14aTQGddPvPRG6bXOL1I+7XOMzdQ
         FRejhgH4s2PivuY3QgYKU1M4QWB6kU74TQeamsMZIj0fMFLVFPeveywMLKfYOeIttaiM
         HIBTv+y7u6uy5VK1w67FiR3P0wc17rNDZpnPNlgta3x34HJo2ACApHmG5RNzDC6D1w3E
         DTw+lAoYSERUzRsK5qIEMEQ+OVyxQC2e0U1x6E69Nm1VyV0qi60vGlaMt3ohHwJ40tIF
         hCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLKcJgo887ztkKHC15Eskfnp4EO3sD0LI6OqM7nALIR2yaDuZF3n1emEEkAGoN+VtGcOWceiTslM2cOx8kfcvDTZBZm0rUEaDv9uUQl5XC
X-Gm-Message-State: AOJu0YzLEQShZ3sbkG2WA79uOtH0m/RGklbrQOu96zcUMPK9GYS2QBi9
	ke4sZVTmLjgLamhwjRba4nR/9HiZClecnlba5BmwnZX2AP+pVfeuwfnH6u9CiCk=
X-Google-Smtp-Source: AGHT+IGqMNLnQifKehVyTniVZ6at0ArgKKWUBm835f674K8o1H2lf66wElH3Yt8D0mQ5+pAZCM+6nA==
X-Received: by 2002:a17:90a:134c:b0:299:3035:aede with SMTP id y12-20020a17090a134c00b002993035aedemr916968pjf.44.1712187732279;
        Wed, 03 Apr 2024 16:42:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:11 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	conor@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v3 16/29] prctl: arch-agnostic prctl for shadow stack
Date: Wed,  3 Apr 2024 16:35:04 -0700
Message-ID: <20240403234054.2020347-17-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_164214_094624_7CA46D52 
X-CRM114-Status: GOOD (  17.06  )
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

From: Mark Brown <broonie@kernel.org>

Three architectures (x86, aarch64, riscv) have announced support for
shadow stacks with fairly similar functionality.  While x86 is using
arch_prctl() to control the functionality neither arm64 nor riscv uses
that interface so this patch adds arch-agnostic prctl() support to
get and set status of shadow stacks and lock the current configuration to
prevent further changes, with support for turning on and off individual
subfeatures so applications can limit their exposure to features that
they do not need.  The features are:

  - PR_SHADOW_STACK_ENABLE: Tracking and enforcement of shadow stacks,
    including allocation of a shadow stack if one is not already
    allocated.
  - PR_SHADOW_STACK_WRITE: Writes to specific addresses in the shadow
    stack.
  - PR_SHADOW_STACK_PUSH: Push additional values onto the shadow stack.
  - PR_SHADOW_STACK_DISABLE: Allow to disable shadow stack.
    Note once locked, disable must fail.

These features are expected to be inherited by new threads and cleared
on exec(), unknown features should be rejected for enable but accepted
for locking (in order to allow for future proofing).

This is based on a patch originally written by Deepak Gupta but later
modified by Mark Brown for arm's GCS patch series.

Signed-off-by: Mark Brown <broonie@kernel.org>
Co-developed-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h         |  3 +++
 include/uapi/linux/prctl.h | 22 ++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 9952937be659..1d08e1fd2f6a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4201,5 +4201,8 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 
 	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
 }
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
 #endif /* _LINUX_MM_H */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 370ed14b1ae0..3c66ed8f46d8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -306,4 +306,26 @@ struct prctl_mm_map {
 # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
 # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
 
+/*
+ * Get the current shadow stack configuration for the current thread,
+ * this will be the value configured via PR_SET_SHADOW_STACK_STATUS.
+ */
+#define PR_GET_SHADOW_STACK_STATUS      71
+
+/*
+ * Set the current shadow stack configuration.  Enabling the shadow
+ * stack will cause a shadow stack to be allocated for the thread.
+ */
+#define PR_SET_SHADOW_STACK_STATUS      72
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+# define PR_SHADOW_STACK_WRITE		(1UL << 1)
+# define PR_SHADOW_STACK_PUSH		(1UL << 2)
+
+/*
+ * Prevent further changes to the specified shadow stack
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_SHADOW_STACK_STATUS      73
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index f8e543f1e38a..242e9f147791 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2315,6 +2315,21 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
 	return -EINVAL;
 }
 
+int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -2757,6 +2772,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_V_GET_CONTROL:
 		error = RISCV_V_GET_CONTROL();
 		break;
+	case PR_GET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_shadow_stack_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_SET_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_shadow_stack_status(me, arg2);
+		break;
+	case PR_LOCK_SHADOW_STACK_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_shadow_stack_status(me, arg2);
+		break;
 	default:
 		error = -EINVAL;
 		break;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
