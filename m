Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D29BCD1288
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 00:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SO4DKxIgo8HTCVwS4adhhsgPxnLDo3GAtwt6l5pFqsI=; b=Ie0rjC6DvBG9ZD
	iR0Si3xeZF3BbnW+U7HAmUfwalp41y/hvHcNaV4P9pInvij9RxXpQJkgTVNyYX0MXcIpKCmnwV4+l
	8sA/jsVi9TPZhURbYTD8ZhK1m0fuU4xLU6RGHhLeGGE9Lz++vLjGTPPuqTjhQYuyWc0ZATLc1rORx
	tpWvizwdAu/5i+mX42Y7fDx7DRhbFI9LRDGgBjhtArerR6hqEaQjzSZBriKHRyUNvoT+eJvLYLP7/
	Wy6ktVuFWylJhRVoQ6L1iwUEbUNjrfWA8cXeUABGe/jRZ+wpO1ocUuESWFexrSlHCPEXeBP+d5gIQ
	1hmRQrf9UrmHJTVl5o2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBIM-00000000oSJ-3dPU;
	Thu, 04 Apr 2024 00:49:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAGM-00000000b17-3I8Y
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Apr 2024 23:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WP6SydUIEnIf7iJga0ecJJ8VROQQxV6mEOJWURQ0TH0=; b=MMXM9c6QSgaip1rn2IbbhFHiob
	gvq/IxBEBJC44ZrrVK+odqE8emuQZdq1KPxKsMZTywBSkAKCWi/xL7OwQmBtftJNKd74hY1bEB/ty
	B0YqCjv8rLzo+GXxEPVno/2t4gXZLnLrL8MHGxYIILh8lurgTYPuyMAgB7amOu7IkTyDRjE9fqIMl
	axVtrp0R8r50oW3u6Ky73Lcyatvb0HIogFX/Ik5WaDmVQBz/p3cOWsbYQkNtGYIJse7d9peO6wUBT
	D4+P8D01rF5/5du45vw2DEKg1wEG7mYgYScIn8vs2hI/sROC7i4FqyF7gekcWiOS6Gll/0WRZ9kBi
	KMxl6WHw==;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsAG4-00000004U0Y-0dOL
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 23:43:18 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1def89f0cfdso11754965ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 16:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712187735; x=1712792535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP6SydUIEnIf7iJga0ecJJ8VROQQxV6mEOJWURQ0TH0=;
        b=XirxhJSf5tU9JN5iIrLKKOZYJ6DrcptduzOH9Vo/2egxmhhUyM6412NFvfnRTFIbEJ
         gHtaW+s1Bcx/NmZ1LXujLJo5lCAwWvbFCt5mnKGkmlsLSPCaljXjJnV+19kTEYVmhkjq
         sm7Zhzib4eNAoNBcz4Nizc+8eYQLxoNBR0FmXvIpdUwVbBTwjJsPKY94OsyWl6Fo2KrA
         dUiNSJZw0RbuGrrStdn/AxFeIC+O4EYwb0bg9hDp0hKaLYMDy3U2fBwmcIeBdX5MTFfs
         ijHkVxF2n0aw0dMZDdiyaP82P0RbCnVTgNUwlDuAuIDWND6vAt2WVqo1yTQPXxH5aOe0
         kh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712187735; x=1712792535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WP6SydUIEnIf7iJga0ecJJ8VROQQxV6mEOJWURQ0TH0=;
        b=WqH8gJycZ5U5qY0Qp1KyV5R2lR2RZPGFEV8sEFP/1AOKAOhNj98U3j5hNAZuM4tSfS
         vW3/I00ZeQxOrHqbOl2WfzsHWo2Upg3RQeuSJvj1oAkXnmUU1SOnmg38p4zAyyDwic/9
         o1rYz4VYS9hAmCRKRuMcEzMVjY2QO5Eagz2L1udF+9TR4nV31UX/OWBJiUDxayuDjaCS
         oVh1JM11xGlzudQLRrOZiC56TE7bbpsxHguE5RClY3hpVQ9viQ593+vJl9NHYyzpfSEP
         O1hBzh7Y3HSZYJNw3UHNUJDJ7FikQI0dXbJhbwx48jrlShbZIQhPJCWSkuOaGXqzfGVm
         i3BQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4bhmIfzlhaJ2hwexuXUIPcknQsN5Xcn8rHl5S2TsOqBOZ1alXj4rritvvaXRta5ECQA1xfi66PXTZUqU2fbM5N7iMl9VyC7ODLU/Bg4dQ
X-Gm-Message-State: AOJu0YzF20IePRcUuGwgDKV+zRqspUerCzcEou3g7BgyrPKiID+HiXgY
	and06BJBXzlnkseEbCW492Q7zd1vJCHf+GDNMQ9XMESp7/WQv4ZhQ99qKPHMulo=
X-Google-Smtp-Source: AGHT+IG94ZCsKxcUmluscIk5n5e6k4tHROtb3Z4W0JVAcaXjptzg9lzBPMJPJjbNEv/0oFOKMb0Hdg==
X-Received: by 2002:a17:902:d4cb:b0:1e0:e14:b19d with SMTP id o11-20020a170902d4cb00b001e00e14b19dmr1403019plg.18.1712187734816;
        Wed, 03 Apr 2024 16:42:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id b18-20020a170902d51200b001deeac592absm13899117plg.180.2024.04.03.16.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 16:42:14 -0700 (PDT)
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
Subject: [PATCH v3 17/29] prctl: arch-agnostic prctl for indirect branch tracking
Date: Wed,  3 Apr 2024 16:35:05 -0700
Message-ID: <20240403234054.2020347-18-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403234054.2020347-1-debug@rivosinc.com>
References: <20240403234054.2020347-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_004311_871772_9CF6CF01 
X-CRM114-Status: GOOD (  11.52  )
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

Three architectures (x86, aarch64, riscv) have support for indirect branch
tracking feature in a very similar fashion. On a very high level, indirect
branch tracking is a CPU feature where CPU tracks branches which uses
memory operand to perform control transfer in program. As part of this
tracking on indirect branches, CPU goes in a state where it expects a
landing pad instr on target and if not found then CPU raises some fault
(architecture dependent)

x86 landing pad instr - `ENDBRANCH`
aarch64 landing pad instr - `BTI`
riscv landing instr - `lpad`

Given that three major arches have support for indirect branch tracking,
This patch makes `prctl` for indirect branch tracking arch agnostic.

To allow userspace to enable this feature for itself, following prtcls are
defined:
 - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect
   branch tracking.
 - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch
   tracking.
   Following status options are allowed
       - PR_INDIR_BR_LP_ENABLE: Enables indirect branch tracking on user
         thread.
       - PR_INDIR_BR_LP_DISABLE; Disables indirect branch tracking on user
         thread.
 - PR_LOCK_INDIR_BR_LP_STATUS: Locks configured status for indirect branch
   tracking for user thread.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/uapi/linux/prctl.h | 27 +++++++++++++++++++++++++++
 kernel/sys.c               | 30 ++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 3c66ed8f46d8..b7a8212a068e 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -328,4 +328,31 @@ struct prctl_mm_map {
  */
 #define PR_LOCK_SHADOW_STACK_STATUS      73
 
+/*
+ * Get the current indirect branch tracking configuration for the current
+ * thread, this will be the value configured via PR_SET_INDIR_BR_LP_STATUS.
+ */
+#define PR_GET_INDIR_BR_LP_STATUS      74
+
+/*
+ * Set the indirect branch tracking configuration. PR_INDIR_BR_LP_ENABLE will
+ * enable cpu feature for user thread, to track all indirect branches and ensure
+ * they land on arch defined landing pad instruction.
+ * x86 - If enabled, an indirect branch must land on `ENDBRANCH` instruction.
+ * arch64 - If enabled, an indirect branch must land on `BTI` instruction.
+ * riscv - If enabled, an indirect branch must land on `lpad` instruction.
+ * PR_INDIR_BR_LP_DISABLE will disable feature for user thread and indirect
+ * branches will no more be tracked by cpu to land on arch defined landing pad
+ * instruction.
+ */
+#define PR_SET_INDIR_BR_LP_STATUS      75
+# define PR_INDIR_BR_LP_ENABLE		   (1UL << 0)
+
+/*
+ * Prevent further changes to the specified indirect branch tracking
+ * configuration.  All bits may be locked via this call, including
+ * undefined bits.
+ */
+#define PR_LOCK_INDIR_BR_LP_STATUS      76
+
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 242e9f147791..c770060c3f06 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2330,6 +2330,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
 	return -EINVAL;
 }
 
+int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
+int __weak arch_lock_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
+{
+	return -EINVAL;
+}
+
 #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -2787,6 +2802,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			return -EINVAL;
 		error = arch_lock_shadow_stack_status(me, arg2);
 		break;
+	case PR_GET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_get_indir_br_lp_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_SET_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_set_indir_br_lp_status(me, (unsigned long __user *) arg2);
+		break;
+	case PR_LOCK_INDIR_BR_LP_STATUS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
+		error = arch_lock_indir_br_lp_status(me, (unsigned long __user *) arg2);
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
