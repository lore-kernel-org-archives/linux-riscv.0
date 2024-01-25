Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60A4C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 06:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vowXNPsFPZdad36DrKTB1JSHYCYeARTS0IzUKmplkUA=; b=yD9UAvBFebTANn
	+Rai1pBi8tB6usa9iDhPSsTB12dimAMmEbQfawEFPxOHMX6A/shGwOQTnDkmpkUPlkrtemxaFxhKi
	w/LUD6jMxaBRCcnYZWSnWP7ef3D0EZ3Hki/goeu9Y0BBhSEa8qBBmqcS6bHDcfsGTjq1XA7AFRXNA
	I9Ye7H+BVlVjMVEmbvdNv/Mafys5W8RkDjTggAWtOnzBIYiBqPP15d7Wwknn8JIthW+UlQFOp6jSB
	+PKbRhrjKQKJ9QToHrQCKGvdTJfZRCtvp8q5UDhulsvMWDvO8aCVzinNHS6sw2hGSk1PNT7eB0ECr
	2Z0fJ/RkyJD9EYnd+e/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rStDu-006kPK-2I;
	Thu, 25 Jan 2024 06:28:26 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStDr-006kMb-1a
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:28:24 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3bdb42da0e0so3234028b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164101; x=1706768901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpWYX6cXeb3EwmSmbUmLWJ8fZpndT9qVanP1zDkk0zs=;
        b=OY1TcYLAADxMyjeJP9585PdPcFURKTc/Vsvj7EG6uEmC00qI8iu4IDIZoylysVa6Le
         lUe0a/vg9Sje4P7yjlQxtebGrbDwu2PI6F5MZbYSNBGPCvZJtlnOqZQfnlXeeln44mWJ
         HCdkzNwgdHs7dgR0uX7OGceG8bmvXhNC2zxqNWVfcBKcVQIjPW0oKKq/HC8BZgZ4U3NA
         OZcdIA3olVYclFyiWqwSznC4H7j76gB/Tmd4J0+NQ3NFy6O9uWIeVydAjIaSewrpFzGn
         87Pdh4Qgi6ZMTRuQcTQmEy6wqqGhwO4DHjwzfu6gjlR6jIMVZw75sjWIz5I4Ta9IOO4X
         PJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164101; x=1706768901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpWYX6cXeb3EwmSmbUmLWJ8fZpndT9qVanP1zDkk0zs=;
        b=SeS48cBYZharnGn/d5HeCfxwnXgTdWWjAgTOStm7vRCyoJup6bJ5/z3uLCRB/EMgpt
         Ww1bBRwc1GMQgH2u8CIjPa1CMArXFhgK23Na9W9QwCx+lIzhtLpGJJXtpIKMRhkpbr33
         6uVovHbcvmZsAedE+KAwZ8C7iEGsHcwASVjYR31Y3Z24YhgGfi5oCjxzSerIfy6x9poB
         uDOHaVJ6GqcAuvNyRmVLC9HFETBbtAN2C+X7JasDpbiZPRZ+iJqAl6SY4g6KUJ4vfDWf
         gauVzIaTurJ7ltAlv86TZz5P8tH0PUNHZ+QPkRZwSuzHWRUj7JAblpzFEKd74aeihKbD
         5HPA==
X-Gm-Message-State: AOJu0YyuotICZMG71bh5tml3cbjnwIMh4ztlByZdsLhz0dQ1EmXCvtF2
	iWZCCrEHa4DD8gqsJXsC7FQKM42aYNuzmqkAa987JJ7JNFED+HvcIapRGiPjaS4=
X-Google-Smtp-Source: AGHT+IEsqvMNFQpFlOYcM36mb6P72n2g5IoYJQjyFjdvM0xADABaEzJAYSqo7gQsIel9ygICs1O66Q==
X-Received: by 2002:a05:6808:3197:b0:3bd:a590:8a00 with SMTP id cd23-20020a056808319700b003bda5908a00mr578367oib.85.1706164101404;
        Wed, 24 Jan 2024 22:28:21 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:28:21 -0800 (PST)
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
Subject: [RFC PATCH v1 02/28] riscv: envcfg save and restore on trap entry/exit
Date: Wed, 24 Jan 2024 22:21:27 -0800
Message-ID: <20240125062739.1339782-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_222823_541864_BA0B7FDB 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

envcfg CSR defines enabling bits for cache management instructions and soon
will control enabling for control flow integrity and pointer masking features.

Control flow integrity enabling for forward cfi and backward cfi is controlled
via envcfg and thus need to be enabled on per thread basis.

This patch creates a place holder for envcfg CSR in `thread_info` and adds
logic to save and restore on trap entry and exits.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/thread_info.h | 1 +
 arch/riscv/kernel/asm-offsets.c      | 1 +
 arch/riscv/kernel/entry.S            | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 574779900bfb..320bc899a63b 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -57,6 +57,7 @@ struct thread_info {
 	long			user_sp;	/* User stack pointer */
 	int			cpu;
 	unsigned long		syscall_work;	/* SYSCALL_WORK_ flags */
+	unsigned long envcfg;
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a03129f40c46..cdd8f095c30c 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -39,6 +39,7 @@ void asm_offsets(void)
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
 	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
+	OFFSET(TASK_TI_ENVCFG, task_struct, thread_info.envcfg);
 #ifdef CONFIG_SHADOW_CALL_STACK
 	OFFSET(TASK_TI_SCS_SP, task_struct, thread_info.scs_sp);
 #endif
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 54ca4564a926..63c3855ba80d 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -129,6 +129,10 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
 	addi s0, sp, PT_SIZE_ON_STACK
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
 
+	/* restore envcfg bits for current thread */
+	REG_L s0, TASK_TI_ENVCFG(tp)
+	csrw CSR_ENVCFG, s0
+
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
