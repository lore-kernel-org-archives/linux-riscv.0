Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF55C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjvPCTpJoAG7m7pdeoexiNEB4aAqC30vl+YzV6OLwP8=; b=vccKWcX22wlS5o
	1XijTttxbm8UAgduYlj41p6dHOjQCFPz22AqMurpSFf8srp3+Sxt7yp0B5WUYKhjztFcAnNQeL1xW
	FJNVDrVl6WquOvIPM9kdD4BqUeoPOkBT46dluQM7i7yjG8+6j71lyv9ozxb9vU8yKo+5HWzF1iHYs
	ewBXvmCBL1J8gmEWhiNuLZOAc43l5XJOlSYD4h5TR7w6FpenelwTtLfJ/TG1kb0jv/2W/a5p8FNvA
	sdCX4c668EHtx5yr24BAiL5hIVEK5FIVqmn406LbWdB+aiSrmVtsXPMlvyotBq0CC1+G4J5+nr9rs
	tCO2Q4BgOVOeqilnf9yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFe-006lmI-1V;
	Thu, 25 Jan 2024 06:30:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStFd-006ljn-0l
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 06:30:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZGW+3ds4X7hyu8QcIwFbpgQ3FZs37tf1ecbtDkVWTR0=; b=MtNw3mXnJAlLE+6XRKbqaegaL+
	AKkhdDG57UzfWrFJaKH1NYtn98B7PTo/pitOLMfs2j8EOuhXG6vbdjlNHHaeTPC2cp4QUgyVbAi0V
	5u0blWj8fIDYYC2g0Su6iXm0XPh1UkcXWexqaroYYDWfosHzulXneITYgyBrL4o2kuwSqFU6a+5O0
	cuOF4k5hT4OXKcWbEKYBKt831lzOvxXgoRHzbjiF3OVeyjJWrLzEefM8cRVELn1Aza/lguX+bAu4f
	jpa/Hv9ajWq17cS9WapbCH9iHGFIfAGfbQQ7F6pFj4uh0/CIkt4hzMlBlQcpFy2l48jCoSF9IBdH7
	Ef0mQGfQ==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rStFX-00000004wdN-3sGm
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:30:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6dd7c194bb2so346425b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164203; x=1706769003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGW+3ds4X7hyu8QcIwFbpgQ3FZs37tf1ecbtDkVWTR0=;
        b=XVRMdn32ns4Id2g0yCYZ0uR5iNa18CpkRonkgLxUlLlfOE9vmCK3CJXYWEKhduVu3a
         CCAQR+DnUELs7907kWBUnSCIJys3uzWaWlc8JNLh1Jm971sBJq5vzXb+CS1UINCqyFIr
         3q3TJy0q1DrtQj9NcW7JWd4FBez6kVZHkWcCszLW7a5qKYZ4EV1StVT+B8xQlqikgH5W
         xwPnx2xGIHnAl8NbmqPUorNlTg3zSioZJJyjiJf+dNZOcvCpMScxkn+yzKZNopaecYct
         OZho/WKksVLK0BB7KoKtG9gremG38dFPS5mvCmZkBBBe4HtsfSTn4RJW1B9S0VviYmXl
         WgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164203; x=1706769003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGW+3ds4X7hyu8QcIwFbpgQ3FZs37tf1ecbtDkVWTR0=;
        b=lc8N+6IkJiPrLXgYmdUTUpWvI6uZ0JXT6wOd2oLA99INS/3VDkD9+VM/Quj1CGyXoQ
         a3espGiCA8toPYaJd/MoKTMDOcJlh3G0HAFbvv0u9UtSf4nbssbGGW8cjHmnTSz+SBhz
         n5hK0sHDHSxC+4S5Uf57CVkaKffus4LHfQagb4CsxJA+NsT7L11hxKozRAmH2h/xlLQa
         hnUu+3UXpcuoxm1Rb+k2HIxzjAN0XwfTU7Lm6Rpl5nLTRzlQypvjQLvHIMBgbTwwgHqD
         WQh1hHxkjV668f1w3aPGOK7xl9Xk2GjCwN8/ytoo5QhU8vcM6FBW1p/ra4o8vzSswj7Q
         cu8A==
X-Gm-Message-State: AOJu0Yy10QxDyfDmaDnmUkwCSbD7RpbSH59yIPLVefyu+Rv0nfaMkxwm
	XH8JTWryj4V9pb0oJH8L9aLwrROgwNWg3Pv4wmYkk+HtvQqcmUa/aRMWEmfgwRs=
X-Google-Smtp-Source: AGHT+IFX0O2DMMykvx1boq4E3+vew5Q+ucUD8KeW51e5M6H2MI9XnhwlSZDCE7ZMzSEryAMcjaVeiA==
X-Received: by 2002:a05:6a00:b87:b0:6dd:c77a:721f with SMTP id g7-20020a056a000b8700b006ddc77a721fmr862372pfj.0.1706164203244;
        Wed, 24 Jan 2024 22:30:03 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:30:02 -0800 (PST)
From: debug@rivosinc.com
To: rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com
Cc: corbet@lwn.net,
	aou@eecs.berkeley.edu,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	waylingii@gmail.com,
	greentime.hu@sifive.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	shikemeng@huaweicloud.com,
	david@redhat.com,
	charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn,
	willy@infradead.org,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	gerg@kernel.org,
	jeeheng.sia@starfivetech.com,
	mason.huo@starfivetech.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	ruscur@russell.cc,
	bgray@linux.ibm.com,
	alx@kernel.org,
	baruch@tkos.co.il,
	zhangqing@loongson.cn,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	joey.gouly@arm.com,
	shr@devkernel.io,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH v1 18/28] prctl: arch-agnostic prtcl for indirect branch tracking
Date: Wed, 24 Jan 2024 22:21:43 -0800
Message-ID: <20240125062739.1339782-19-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_063008_548923_F816A110 
X-CRM114-Status: GOOD (  11.42  )
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

From: Deepak Gupta <debug@rivosinc.com>

Three architectures (x86, aarch64, riscv) have support for indirect branch
tracking feature in a very similar fashion. On a very high level, indirect
branch tracking is a CPU feature where CPU tracks branches which uses memory
operand to perform control transfer in program. As part of this tracking on
indirect branches, CPU goes in a state where it expects a landing pad instr
on target and if not found then CPU raises some fault (architecture dependent)

x86 landing pad instr - `ENDBRANCH`
aarch64 landing pad instr - `BTI`
riscv landing instr - `lpad`

Given that three major arches have support for indirect branch tracking,
This patch makes `prctl` for indirect branch tracking arch agnostic.

To allow userspace to enable this feature for itself, following prtcls are
defined:
 - PR_GET_INDIR_BR_LP_STATUS: Gets current configured status for indirect branch
   tracking.
 - PR_SET_INDIR_BR_LP_STATUS: Sets a configuration for indirect branch tracking
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
index 96e8a6b5993a..9e2ebf9d9859 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2316,6 +2316,21 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
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
@@ -2773,6 +2788,21 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
