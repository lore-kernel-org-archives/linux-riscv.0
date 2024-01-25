Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21474C48285
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 07:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gfle2efJUUmiVvGLriCZH2GppTkWQY9SscNewlNJMo=; b=dRsPvjxfDr78XP
	Z8OxjB61XcKt6wDLLTMGu2w3KE8QTbU6N5BSXMiqR5oSJSMmFhymZLJkq9PHoJoS+dqzeE+hEw4mN
	xMSlub90r7r8BH76TNL75rFUWlTJPLfQWl3ubmPQ+AiT6GJ4NgXMy923AW13FmRfZUAkmA7q732fM
	hteYOcIq2GYBuEmvoffPdWHHSi46/ZCEoaa1iirWrURUeKJvUYc6YkGMTZpZT+qSKh9M/eFWleY9x
	zw7mAE9MrZLtDKBf3oHagp6f0dpRn+YgEv/OYhRZY531BbdHcN9OWxsMowoDQ2PXBRzDoz7JfXFz1
	LzmDlnxTsksZ7eESwxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSuD6-00737H-1U;
	Thu, 25 Jan 2024 07:31:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rStEU-006klN-2h
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jan 2024 06:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Sk+gUexiyKjcB+TRRECBjEsvOh5bXAF+ZpNuCmy1Ha0=; b=Ms9hX01R8ZmTDZo2FKrUZu/MzJ
	I0WCbvvy57XJ2fTPUmN+q9WS3ekyyIykWM3SDi3WTWPXliDAK7LgRdVTq4oTWBqmyJ1DC3x2zV/Zw
	t0T8nXYe8kQktpOemI4Kk43giKro/azu7wGA6k2mJ6gg7Kgync3eWQygI1KLFde+2YWKshbkKtK2B
	9jjsZ91PBPi4IkTEH524VKj4Coh3LVjm1kUmRDTFWqw+84uc5YJw+EbSRn9mNh2N9j69e2z7dmlng
	NRK8bUbDSK+clicK60tGspNHsshboPBH0LTUvLG0DyW4EdDvD2+adRgDMdJe+OYz4DFti5OQyowQ2
	rpo+ZSAA==;
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rStE3-00000004wSL-2KLV
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 06:28:58 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so4243816b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Jan 2024 22:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706164114; x=1706768914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sk+gUexiyKjcB+TRRECBjEsvOh5bXAF+ZpNuCmy1Ha0=;
        b=ohno+WGnELRdNnaHxbhRaMc5Qa3aUzA77YS67S81qf5TUkEBad9gCkd+2t9vjpHJoK
         NPpeKVKAy6CUBfRSycNpuEbWq03BW2sgAwERaTj7hqOMBOMwU+VbBnlESB0vPYXUXhME
         WVyrR0N4fm+7x0C/iUiTGhFPi4zMNy4I1HNeU4Nt1FL2zCBARTYhH81zbqpcPSz/8l3k
         C5PLiJ+NJSFd/m8e3O3l4l8oXubXZ+XS5SXEPxvZjKBzRw6Ny0e9BP2a0n/qj2vlKdkz
         qAMqWJIpxvH1HotB9TXnYDuWUXqaVA3x9aBjBvy5U64VhR+OnJtYVBs9rF7rR2t1j0GW
         D8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706164114; x=1706768914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sk+gUexiyKjcB+TRRECBjEsvOh5bXAF+ZpNuCmy1Ha0=;
        b=vXT8w1HZnmrLLNkTwA3Wu0OBtR+2tWgxdIZ7ibe3cuzDFbRrvC24SaioOXx2M+2tVq
         3lTIhYji+GD3UaW0FWnEJcLCI+L7jJJsQPhLAnk2bIor7IPeq1QGB+Ext//Ao+y1u3t+
         OqB6e8v7sEMfg37gZscPXy6WiTigGlKUGURrFtM2CjWOhwqJmRKXMaYHJawrMbKTNtUq
         XeaZX97/OTPVOvMgTB60hPCp/EQvGzDE3ihKmpr6psBZP3oVEQnS6yjzSesR84gonH4X
         xlgHcRw0eVrb4SKsPj2VSfdSHwYJU/xXMK/qeM+Tw/7XjmSTRB046fDCH0Q1KC3rjnK+
         0cQQ==
X-Gm-Message-State: AOJu0Yw+TCn5Y6/bUPLJ7Ih1gsEv9e95zHCmf/qa7L8YlXOeU04daAFq
	5kEuzUpEGZKN8i4kMEqMB0VP1gKK8GZ1QpOUyccXxl1Iz/aswoVSR4GXm4NCmjs=
X-Google-Smtp-Source: AGHT+IHgnfgiRGT+J+bbquDHQHlbWjWMk2ANkfaKEEr2r5iLWrd51iWjTqQbhay0o6iShLRyInjd9g==
X-Received: by 2002:a05:6808:e84:b0:3bd:54a2:7df3 with SMTP id k4-20020a0568080e8400b003bd54a27df3mr377689oil.14.1706164113684;
        Wed, 24 Jan 2024 22:28:33 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t19-20020a056a00139300b006dd870b51b8sm3201139pfg.126.2024.01.24.22.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 22:28:33 -0800 (PST)
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
Subject: [RFC PATCH v1 04/28] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
Date: Wed, 24 Jan 2024 22:21:29 -0800
Message-ID: <20240125062739.1339782-5-debug@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125062739.1339782-1-debug@rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_062842_457890_8AD65198 
X-CRM114-Status: UNSURE (   7.86  )
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

riscv will need an implementation for exit_thread to clean up shadow stack
when thread exits. If current thread had shadow stack enabled, shadow
stack is allocated by default for any new thread.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..9d386e9edc45 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -142,6 +142,7 @@ config RISCV
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_EXIT_THREAD
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 2420123444c4..c249cf3d8083 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -192,6 +192,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
