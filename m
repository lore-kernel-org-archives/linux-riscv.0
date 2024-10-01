Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735C1CEACE7
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SS1FfM7RjOuCpLd4j2rIF+5goVcf+i2CjH7vVNQc6ZE=; b=bvzB0qbHFvdKLK
	RiLJ1Nrkf1WgcbR7wqjBQ3w4/wn3SIh/AxpZfr00KsOMzWxZOZpCn/iTwqK3/GnS+UY/IBAaUOuJ9
	ARRrwGUjxaDkhDVYO1CxNWjek/mQF+6fuh5DtfWkv4CrM/Hfw+4RFR0+K39bjMjGaCW3f2hs5w+8W
	ElQDCfLln2xfL01jXCwUP2TgjxVu7z6Huj63LE7BKkxFAaEGgvnjNS24MyTk5VYj/iBuXDsUx9jgA
	czj2mbNLpKzcuKQ53u+rdDwq7cklQInn3dSW6LGsZFywaR6QQHV0y75oKLbs/YEuJEzEeTb8MoXwX
	vyBRRH8dTcBnUGgTsBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfba-00000003VQ3-3Yoq;
	Tue, 01 Oct 2024 16:20:06 +0000
Received: from mail-pg1-f182.google.com ([209.85.215.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfPA-00000003QwO-1izN
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:17 +0000
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so4890945a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798835; x=1728403635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxvPbFdPQ1tC+j3wFHGGOQBUzN++1F4GTwbS3f8RUbU=;
        b=Lyq4XugNoWloh3QRaKRLcM0rWNbAe8HlP7A3OnyXld2hHWPRlOc4q+mKj5yPGah7pf
         Is6ksCI5tOq51991esIyznnPLRJjhYCRVrWEZgLHhXPaViMHjryFMxkNhRflnix8p7Yn
         9Zrb0IQwJ6V8PL5U7LFs7eGMYe9BvXuTMk7CX1BEaaafuOfGoQA4k/ntQLZSjr3JZ1P1
         pjurVNHCq4v1fbwnuqd0vO7uBNervejxDseACsFkbtuDmDuVixkMuRmJMQvLfF6ZK7nL
         E63unLvm3ix/QWFGd607ivttrK5TYRIC3lZ6VQPJRAzuo0Km66aX9YuUgXKzlvnfSgsO
         sw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798835; x=1728403635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxvPbFdPQ1tC+j3wFHGGOQBUzN++1F4GTwbS3f8RUbU=;
        b=Gxvct1aHvRWeCD01yqKqj+Js+iCpqKXbYqdnviCzHzNNjJ0Neng/IduvbmCXY4IYcz
         sKcWXpfDETvBOgXt7ZgyyQNpDWzsuoe7lcNA5Ho0dailHi+90zJRsGQwfGA8jINaCodv
         lKrFrj8mQzYP5NZIpd/wAVcozZ6/2XSEOwLumxS+/oILa0NSQBtlnD9iamqBjZc8qcKg
         KlH9gKiwIn4WyIn/y+6jLw66RFwoVim/9/oyNb+65+LNLeeR3ocrSYjHWKey/p76Y0PH
         eDFTKGWNSKdxPmfARStlQumLaiLi3UOThnm3wIxYLGgBK6k9DXTOSGnWVvF/lxGFdWyN
         bBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/TXvmLmqd0wjuLX0u2NHxAcgNN2Z7S7WtakqOkpGBnz70SrSjppyCvKkMptqa6VBg0++ZgP1IyYLUlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXH4jIos83bFmxWvhcAB6cWhh66Iu6kJTQCaCXoapHCYzJ3sAS
	+NYJJxs+VwF2sSqay00PCKgQ/vLY5vil0yvKKuzb1CBX3YB7iuAdeZT3X4GgjYpem/gmJx58MfV
	r
X-Google-Smtp-Source: AGHT+IH2Sm4Er88BRFmxFtoVQlQZa6M14xX+NOC0OSBp2pCUlTzjnB+u1q8ipbNjt5+sqIq3C7HKbw==
X-Received: by 2002:a17:90b:3b52:b0:2e0:8784:d420 with SMTP id 98e67ed59e1d1-2e1848013e7mr226286a91.21.1727798835139;
        Tue, 01 Oct 2024 09:07:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:14 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:11 -0700
Subject: [PATCH 06/33] riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-6-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_090716_600062_C46589FF 
X-CRM114-Status: GOOD (  10.95  )
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
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/Kconfig          | 1 +
 arch/riscv/kernel/process.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 22dc5ea4196c..808ea66b9537 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -182,6 +182,7 @@ config RISCV
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HAVE_EXIT_THREAD
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e3142d8a6e28..1f2574fb2edb 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -201,6 +201,11 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+
+}
+
 int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 {
 	unsigned long clone_flags = args->flags;

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
