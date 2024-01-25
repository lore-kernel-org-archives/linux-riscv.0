Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D74C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18pRT3ugsj//bWpOCb99/wU0Fm0qm8ZRVnnRuWiYHpY=; b=ZlEN5aN2U5zaf2
	wUe/vJdnMyoIU5mRwypiqeNQp9yNdV3iA86ijGLZettGX4cfuB8vEMz9bw6DP9vIkKZZZjBOwIc9h
	aLmDvFHY3/zI4KSlH+6wzIcKaFpvtXig8ewOangzVuY16bc9/zob2BPbFZWs6ObTNoX+qXLZvcNwl
	dyZichGrzp69MbwfYnM6ygN9hU5YTl79+MUiSN3ARUrgjNfMJwBf1b59btcczK9aOhdRpyL07ML4g
	s9viWUIlpbacV6LAny4bbVGGejhbVDGHVxXBcA7CILrOlevD4JDa/br6RenoOzaE7iadLd/8hYSOQ
	ozy8uH7XIEnnNToEgHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEd-006ktr-2S;
	Thu, 25 Jan 2024 06:29:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEc-006ksD-1J
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 06:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rs1o7FymY4gTUwXZVJx54t4Zjv5gF4CojhNG+aQW4Ms=; b=jiQU5/KT6dW5RSXpygta0mrzWv
	+i1v4N7EaqrGl/gGXzZkHKvc6mYqtJaf5g3TjaQ2ioQ3h9XHrj8dEQLtxwGeWp5Rw1+V4kMjovNK3
	CKQoATKneF4Mt5j+z8eVZ0LcvmxI1vXUW+3hW49LbVC8N/kpBRyC9DC/YWg7QLwUHvaLkA9PQcqjm
	7HWyJVXidIfQxTHtI/Tj0qlux29I3a9F0mBIG+a91tYoiSYM3y7zJ3MPeKdd3WtSHkYOsrW9bMk4w
	Abekvnq16KbVW4YQD+wqD1mVIS23kZoL5Bi9uZtxrbASNwFOY5SI9uqsynGOsdUuYX64rCDDW2yK1
	1FPPLypw==;
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rStEW-00000004wUa-3276
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:29:08 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-598bcccca79so3568743eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164143; x=1706768943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rs1o7FymY4gTUwXZVJx54t4Zjv5gF4CojhNG+aQW4Ms=;
        b=BfOq6P9LFF6jrMYRYKXux9/RgnWNbXEe4hUQAZTAOPY9DFm8D5N23SSKUN3ORXjASk
         wKZ4Yiy8cuxXrNvjYQUXcFAgt3IpaVH03N+afkTmzbqd4GdYwjXqxXDZHaXI9Rw9dtxg
         RC70N7jov++9zUBphpd5dYB9seAGmCYUsoi9Oc9yqqZpPm3CXvKWF4BnOpfqKt65Jz24
         juHDVca0I/zXUlZkUK9Ewcj3KjcO5GV2m1PXz0fV56sSfXpVdmxXrH0WWwWVOQU6I8It
         +xhyPg1Pv8FEcreWL3KFwYD4jwtOtgguFh76+y13joYWztQeC2CDOWHpcmZtbodG7xHj
         ZmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164143; x=1706768943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rs1o7FymY4gTUwXZVJx54t4Zjv5gF4CojhNG+aQW4Ms=;
        b=RP8Soqm5rDYe/8o0gDOAR8w/H8LIxhGbFKkRbKMz3JupDXbqSs/vZhBmXSNv4bPpnm
         qVg+jKvoOPbLzRMGiRbHPJ6kc0fb8uH37UFzctm6jlJDUS9BgNp5Vs0PBfdVRfyfl4kv
         I0pdPw3BVFkQ4/oGjA5rfU+mxfR7x1jENc0ntxI+actRXqXprN4rs72I/rw0z3Ij0Dcj
         VTa3a8bXkNAnftYBws6Tjryi/mDnv1owby7q8C3r6r3GXufWkOXSnQq4BBHtqtlOiC1p
         MUuHJVrhNvGDODrdCpTAzvWYi5im31gt6wySbPZR4RedmYzeoAN/xALyBMrNcW7d6Y3x
         zXtA==
X-Gm-Message-State: AOJu0YzGu2kfTzD47FrKW0XOksM/NaHW1R+71Io9Bz1GSxHS3m4TFDSz
	rkFn3wzYLgwMsUJWcldUHDdPKYrq+4jtCmGz8TBbB4s6+oxq9SLMTVd60K4EZz4=
X-Google-Smtp-Source: AGHT+IGQZnueATOgDHrwaXrd5AWfHpxvbbHwGR+jLnJrGj0m/f+oWOE49v8FM+hbtn4VeA1L1U6wQQ==
X-Received: by 2002:a05:6358:d388:b0:176:5cad:5144 with SMTP id mp8-20020a056358d38800b001765cad5144mr620289rwb.45.1706164142630;
        Wed, 24 Jan 2024 22:29:02 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:29:02 -0800 (PST)
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
Subject: [RFC PATCH v1 07/28] riscv: kernel handling on trap entry/exit for user cfi
Date: Wed, 24 Jan 2024 22:21:32 -0800
Message-ID: <20240125062739.1339782-8-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_062906_106404_AE0D1D5C 
X-CRM114-Status: GOOD (  18.69  )
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

Carves out space in arch specific thread struct for cfi status and shadow stack
in usermode on riscv.

This patch does following
- defines a new structure cfi_status with status bit for cfi feature
- defines shadow stack pointer, base and size in cfi_status structure
- defines offsets to new member fields in thread in asm-offsets.c
- Saves and restore shadow stack pointer on trap entry (U --> S) and exit
  (S --> U)

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/processor.h   |  1 +
 arch/riscv/include/asm/thread_info.h |  3 +++
 arch/riscv/include/asm/usercfi.h     | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  5 ++++-
 arch/riscv/kernel/entry.S            | 25 +++++++++++++++++++++++++
 5 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/usercfi.h

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index ee2f51787ff8..d4dc298880fc 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,6 +14,7 @@
 
 #include <asm/ptrace.h>
 #include <asm/hwcap.h>
+#include <asm/usercfi.h>
 
 #ifdef CONFIG_64BIT
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 320bc899a63b..6a2acecec546 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -58,6 +58,9 @@ struct thread_info {
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
 	unsigned long envcfg;
+#ifdef CONFIG_RISCV_USER_CFI
+	struct cfi_status       user_cfi_state;
+#endif
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/include/asm/usercfi.h b/arch/riscv/include/asm/usercfi.h
new file mode 100644
index 000000000000..080d7077d12c
--- /dev/null
+++ b/arch/riscv/include/asm/usercfi.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * Copyright (C) 2023 Rivos, Inc.
+ * Deepak Gupta <debug@rivosinc.com>
+ */
+#ifndef _ASM_RISCV_USERCFI_H
+#define _ASM_RISCV_USERCFI_H
+
+#ifndef __ASSEMBLY__
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_USER_CFI
+struct cfi_status {
+	unsigned long ubcfi_en : 1; /* Enable for backward cfi. */
+	unsigned long rsvd : ((sizeof(unsigned long)*8) - 1);
+	unsigned long user_shdw_stk; /* Current user shadow stack pointer */
+	unsigned long shdw_stk_base; /* Base address of shadow stack */
+	unsigned long shdw_stk_size; /* size of shadow stack */
+};
+
+#endif /* CONFIG_RISCV_USER_CFI */
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_USERCFI_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index cdd8f095c30c..5e1f412e96ba 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -43,8 +43,11 @@ void asm_offsets(void)
 #ifdef CONFIG_SHADOW_CALL_STACK
 	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
 #endif
-
 	OFFSET(TASK_TI_CPU_NUM, task_struct, thread_info.cpu);
+#ifdef CONFIG_RISCV_USER_CFI
+	OFFSET(TASK_TI_CFI_STATUS, task_struct, thread_info.user_cfi_state);
+	OFFSET(TASK_TI_USER_SSP, task_struct, thread_info.user_cfi_state.user_shdw_stk);
+#endif
 	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
 	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
 	OFFSET(TASK_THREAD_F2,  task_struct, thread.fstate.f[2]);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 63c3855ba80d..410659e2eadb 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -49,6 +49,21 @@ SYM_CODE_START(handle_exception)
 	REG_S x5,  PT_T0(sp)
 	save_from_x6_to_x31
 
+#ifdef CONFIG_RISCV_USER_CFI
+	/*
+	* we need to save cfi status only when previous mode was U
+	*/
+	csrr s2, CSR_STATUS
+	andi s2, s2, SR_SPP
+	bnez s2, skip_bcfi_save
+	/* load cfi status word */
+	lw s3, TASK_TI_CFI_STATUS(tp)
+	andi s3, s3, 1
+	beqz s3, skip_bcfi_save
+	csrr s3, CSR_SSP
+	REG_S s3, TASK_TI_USER_SSP(tp) /* save user ssp in thread_info */
+skip_bcfi_save:
+#endif
 	/*
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
@@ -141,6 +156,16 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	 * structures again.
 	 */
 	csrw CSR_SCRATCH, tp
+
+#ifdef CONFIG_RISCV_USER_CFI
+	lw s3, TASK_TI_CFI_STATUS(tp)
+	andi s3, s3, 1
+	beqz s3, skip_bcfi_resume
+	REG_L s3, TASK_TI_USER_SSP(tp) /* restore user ssp from thread struct */
+	csrw CSR_SSP, s3
+skip_bcfi_resume:
+#endif
+
 1:
 	REG_L a0, PT_STATUS(sp)
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
