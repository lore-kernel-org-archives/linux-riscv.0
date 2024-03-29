Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15852C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 04:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmFm7NRjPVizOL/6lGLhV1edtSQvd+gEpLGS+JdHt+0=; b=UQuF4a6VyM8lpF
	aLPckPBKIZ+l7udghDtt34xUkk6G1XST7sLeT26VDgIIxLTYntZaEL46/wlWwMwW7Nc4JIlE+Mewb
	4/sf9ogLwDpqTlDJRZkRuwVtI4lUdmam9CyrMvfQTaO6n9JxeKiEUoUKp8acTNUZPL6lcZvvQK2sX
	10uOJ26mijnT/FBYWfalJCHpTBLd250SmYMKItTp3iY3F/CggLnhmC5AvxboFhxZOTZR8Bk46L4PE
	AiG83IoNF7U6dT6cmJ29J9Uz9EpC5ZsRoILFl9aZUtvXpHl4zJD0doEFkhKtSRGG0OqRas+vIhlsG
	Qf9eYiW5hrFdfu4krswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq47s-0000000GnFh-4BsB;
	Fri, 29 Mar 2024 04:46:01 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq47o-0000000GnC2-4BM8
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 04:45:58 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-229cbc52318so930933fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 21:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687555; x=1712292355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qng37K3M8eikqBpPaGOFEE/tLaKw4gdTCP/Sk21HmlA=;
        b=JzAxoQUWZflGBcHQdd96k4hhmeYRWKZSOsfBGKndl2PrNMx37GujxGGqz1l7rSTfkc
         JNQTO7nY8DTiQuTVvABhmcHrFXL0Fx88wKUEsLI8u29hV3lftjIrCSITU9BqTt0IwOpg
         gXcyxEcY0MVn0pUe1ui9R5AjEIuPLuRbsnxy2hFO4q//BXX0F/sTJ34iQy4eHQ+y2NEB
         vkf6FA4ze3FUsNL440eXSF17vbsbjsjh/IsWGDENs57qjmsuAAxhBGKm2NhEtPjwE7Nu
         eTtfJhyYtyu77qpj547ecke20qbcDay7WgQ5knBLoxQ/Lncub1zeOI6Qo7krcm/wf13L
         8UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687555; x=1712292355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qng37K3M8eikqBpPaGOFEE/tLaKw4gdTCP/Sk21HmlA=;
        b=JZFXhVwXjAq68HrkNwF4mdeZ+Nbx5YxrbR5QM52Q7jWWIZKwzUWIg7yCt949pt0hZx
         qievs87q/MLVNwPvBAFOSBdO+YeUoxE6GFtG4hIYZTt/TgQ+U9sDoxlOQuGX3VjBDSLs
         POFyhAJFYKiL6hqOAyRocVuz2+LIX9BRiKJaapdK0MP/tzlbSVcr7z5ckIKu9G8W9S1o
         VH2l5ql/HAKYu4G+AmGzcwQcqACfJZLlxoSyCrJAZw/mrgCYMJ/Mlq95xDEho6tZhL1I
         csXvQ9eBT8xj4b1o/23MAAieCOafM9obueVwpJPzXAkYfxHNff6eUbRtbXX7K6EazCJ/
         oHXw==
X-Forwarded-Encrypted: i=1; AJvYcCUueKBHEb1xEQcSmqK0zHjvUhHoDm6vbxqQNa5ACyiy6mm3xUkTfe+kf5qz6gFTa9whUNXd1BfgSmBLpOSJSjYSCTt5/IAlt+HOlHAFvvoF
X-Gm-Message-State: AOJu0YysqXCuKK6LBLI1765R2sXGMiav7smB7s8dJ5BSngGW8XxsLzY4
	Hq1Rf0GAnNIRyd3JGBH1QSlQS6wIz1F7euzarPz/QQ0atdF/EN1tKnC8s6Y++4I=
X-Google-Smtp-Source: AGHT+IEKOjTE3dTftWOMe2SOt89v3AzQ5X6q/KOwkPfLyYHAC9S2vY+NFOYACNL9schcS27A//V0AA==
X-Received: by 2002:a05:6871:4096:b0:229:9cb5:4fe3 with SMTP id kz22-20020a056871409600b002299cb54fe3mr1713256oab.14.1711687554880;
        Thu, 28 Mar 2024 21:45:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:45:54 -0700 (PDT)
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
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
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
Subject: [PATCH v2 03/27] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Date: Thu, 28 Mar 2024 21:44:35 -0700
Message-Id: <20240329044459.3990638-4-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_214557_072369_492B5F66 
X-CRM114-Status: UNSURE (   8.45  )
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

riscv will need an implementation for exit_thread to clean up shadow stack
when thread exits. If current thread had shadow stack enabled, shadow
stack is allocated by default for any new thread.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e3142ce531a0..7e0b2bcc388f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -149,6 +149,7 @@ config RISCV
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_EXIT_THREAD
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 9a85c9d4c902..d864eef5a10d 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -195,6 +195,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	return;
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
