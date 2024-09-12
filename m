Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0850BEEE272
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 00:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLQlvY2p8wLI7WgoeqoYAMKORtT/5fDmWdPiCKnREtw=; b=ZtWuBnhiP4Fgu7
	KNgpGCcrvsv2n5isLTURwqHdpf6jGnB/miRmUJb/jO1MuSKeLN9i0+6OtBIM2i0keB0dKGlx3/cEs
	NfCSHEnHQMVcXd0MyjrU9bGhjEX21uZcXUUxIKYonQxU/SAF5kcPsTKjz7icn851VTFUleW3wKqc4
	7cPatlklsNLBBCVDlRuVhfqtlIPw5Br7ZYoctODx/J3YUeDRVJMIkdiZ41qBCYpp1X+WwpHViyXEw
	hva639/Pwpww+vQWpW4iwz5A6lCXgE098Kk6Yh4nygfYASV/8AlVdoE+wTsnINfEUGNJOLZEpeHyw
	ncxqo942fkAFc6R63UQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1souDI-0000000EaXb-1N69;
	Fri, 13 Sep 2024 00:31:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot51-0000000ERwy-3RQc
	for linux-riscv@bombadil.infradead.org;
	Thu, 12 Sep 2024 23:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eQcGpVU0IdnPD1mHTUz69E9YXFdr868sAk68PrVb1pE=; b=jIMicuCT+SvDHplikS8V9yx5D2
	A9B++kK6f4oICG+VDGAuV8RnA7ZYO0UZlOW2g1o6AdJoV3r9eMWmowi1MQZdrOgPblLBGXFn8vXnz
	0iX8nMG+5ujIWEm6Irr/hyyB8uBB+rj4pdah+Welu3Gk+m9AV3NUInRYaz87pmJ1jW0cUyIcfNDNd
	IcMfkmtCYwWGAX/NqfRravCEjUugn9mAQVShK0ERgoA1JdzBk0stK4D5pYGmMYmtS9Jq4d6v0xS8+
	gZzXjec9ZgK5gYK739osWYuBy1rHbNtbiHQ8Px6c5HGt2sINi/GGwGjs6ovyqXFLrq/swD9nCPWte
	5xXL0/mg==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sot4y-0000000CMzW-1BKt
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:18:26 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7c1324be8easo1892088a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183100; x=1726787900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQcGpVU0IdnPD1mHTUz69E9YXFdr868sAk68PrVb1pE=;
        b=PPYk8Qhx0+ubgD2h1Cwocp6zXTCPUBXAG7uHIXhxQYL80JVxC8rQ+sjQ+fIiNSNqKH
         O8cDJoLNHeH/mCcJRzcE7rMUta59YBCqKfv1wuosFaMAzBe1EtL5BNTeF9xacJitHULp
         KjEXgvQWyVpnEOceyPQ8NgyUoxf5jWkhBjoa8pbmg0crWCHqlBiVOksss33xc4nuwhum
         vrOo5jco6lag61xWAde9lKYML/bEDWeqAI7mWrrRmg5N6Ag7phUwqOJmaPk8zg4/r47c
         RQMYW21E7oCFaXK5JZDaff7fQuOe0wDq21AwKt0LDyoA+ikIN8EGdNslE8Aic6iAA8qE
         JsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183100; x=1726787900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQcGpVU0IdnPD1mHTUz69E9YXFdr868sAk68PrVb1pE=;
        b=uqVhK0Y8USTkyl0XAKREWeK4fAEIBewB7lqyn+6ty5Bl6G1/iDC4RJyjjur+cixo3w
         Yq9qsxPGYiAAv9/qW5IXcd2oVdsoeN0JPAyIzlmYNGy0tCT1TEMo1CzA3w/WSUGgPp4o
         r+Sc3dt8jN8wXHLv0cxaew6UYBBxp+qwHrwl61hKh1eKP2fagsRF3RMPbUBPeFkzUizU
         GU+P7K/f8s5BSkzHxM7hkoFg1RjggN5ERxx4QaHfKcz/4WwoxuYfmuajDl6MByiHZ7yX
         OomFIQj/tVEI2mi/mUIxS/ov+1xAfWiKJcP07r4Sdr4mwDJrsbAs7YCTzo9UpdmAvun7
         7uOg==
X-Forwarded-Encrypted: i=1; AJvYcCWMZ8TiUHQkR5zDk6msDqBJsRwggj1wR2R/yCTmIvUziQIz7DCTWz3dnXKYr5rJgUu3EjDrg9T2SIFvMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5l1uHGdNaZ6yXL7viaW6fb+oBkkqVZ7rTxx28uOrC9i7vUiqF
	EC7oDcXYdnbQyNqmCX7Rtc2MzJygO99DMFQ1kGBSjVquAhDYn9ipCNJbehNiSuc=
X-Google-Smtp-Source: AGHT+IFff016Dc/UvJnFaAb1uH5IeOSLPpio1EAHCPI04vBCz6X3EEqRQxY7cO8q2vilVk8FL6IgYg==
X-Received: by 2002:a17:90a:2c0f:b0:2d8:25ce:e6e3 with SMTP id 98e67ed59e1d1-2db6718d8b4mr19220198a91.5.1726183100307;
        Thu, 12 Sep 2024 16:18:20 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 17/30] prctl: arch-agnostic prctl for shadow stack
Date: Thu, 12 Sep 2024 16:16:36 -0700
Message-ID: <20240912231650.3740732-18-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_001824_449418_7E61E1DA 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
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
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/mm.h         |  3 +++
 include/uapi/linux/prctl.h | 21 +++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index f0dc94fb782a..e3acb4297877 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4215,6 +4215,9 @@ static inline bool pfn_is_unaccepted_memory(unsigned long pfn)
 
 	return range_contains_unaccepted_memory(paddr, paddr + PAGE_SIZE);
 }
+int arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status);
+int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status);
+int arch_lock_shadow_stack_status(struct task_struct *t, unsigned long status);
 
 void vma_pgtable_walk_begin(struct vm_area_struct *vma);
 void vma_pgtable_walk_end(struct vm_area_struct *vma);
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 35791791a879..b8d7b6361754 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -327,5 +327,26 @@ struct prctl_mm_map {
 # define PR_PPC_DEXCR_CTRL_SET_ONEXEC	 0x8 /* Set the aspect on exec */
 # define PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC	0x10 /* Clear the aspect on exec */
 # define PR_PPC_DEXCR_CTRL_MASK		0x1f
+/*
+ * Get the current shadow stack configuration for the current thread,
+ * this will be the value configured via PR_SET_SHADOW_STACK_STATUS.
+ */
+#define PR_GET_SHADOW_STACK_STATUS      74
+
+/*
+ * Set the current shadow stack configuration.  Enabling the shadow
+ * stack will cause a shadow stack to be allocated for the thread.
+ */
+#define PR_SET_SHADOW_STACK_STATUS      75
+# define PR_SHADOW_STACK_ENABLE         (1UL << 0)
+# define PR_SHADOW_STACK_WRITE		(1UL << 1)
+# define PR_SHADOW_STACK_PUSH		(1UL << 2)
+
+/*
+ * Prevent further changes to the specified shadow stack
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_SHADOW_STACK_STATUS      76
 
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 3a2df1bd9f64..7e0c10e867cf 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2324,6 +2324,21 @@ int __weak arch_prctl_spec_ctrl_set(struct task_struct *t, unsigned long which,
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
@@ -2782,6 +2797,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
 		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
