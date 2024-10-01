Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73648CEACEB
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zSHH1D7twgvzw0SBPyto92NF/IWuqlv3Z31WtG/kys=; b=t8IK1rWzth67GE
	Aoxsx2U7DHW/pytTSU1/a/mifqWhrhhk/7I9zGgOhd7vptmSkhhWA3WpN39rLZ7s8SWvL/MXZ5IMX
	ieNubNxQJsuyxP2ZOPh4mDotrlVgJYDvEzc8CjjnJybFIhImqHH1GxaVBtExLm66TmzX57cjS1Btm
	Uv7OgEI4rVx25gt5mA9Nzy81KyetKz+zRwzdfiHHPCM/I8Opyz/4KPjNKf7S2oujsttxKc65ipa6v
	yjLvZGjaDArICWRB+v/1fP/AePosqQbTMzcXj+vNb9Rh06ZfnmV+QjtHpZum1gEpY7qoiOA4cOKM/
	sW7wP7iv6/9TUwa53A9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfbY-00000003VOJ-3CNR;
	Tue, 01 Oct 2024 16:20:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfP7-00000003Qtu-2MZQ
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Oct 2024 16:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TN/jwUyrk7nWeXz+2PkcX9PcP6JH0CIrLV6B3SOl4g0=; b=UWXhHt95wdqTDPGTdd2Szeee/R
	D4VTd9nP8PbLxQngbrM7eY6o4pqeR3lyuQuCNv6UnDoBLXNDBCsQiKCr6PuHbSxd79AQcYYE7jPBr
	56Zmbi3d0ZMai135O3YbUhrdrk/joWO7ef+HwpsfFIX1VasiFyUkfXtUHVpYTuZ5At42Lrz34YF5S
	KvDYJvA52ofuxbGSEyoHIuOvuaPP76o2aYE7xR/h5jiLqCtxSaRv+ZfNJlVTL//g05BSUsnZIyLK1
	UNOl00O1lXFprqWEygUGT6kxziqr0GEE+evYQiB/eiZSH3p/drYCOSZuKplFV9As8vjlXfrmSjds0
	5CgGpDjA==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfP4-00000003ByY-0yyz
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:07:12 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e0b93157caso3394582a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798827; x=1728403627; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TN/jwUyrk7nWeXz+2PkcX9PcP6JH0CIrLV6B3SOl4g0=;
        b=ZhXDS9Mi1eYu3Rxt+aHA5LwwKZJ5FA6/h4VYH6Si3ZZ8MpBH+129Y58rLY8b9g/siJ
         gk04e8GGHJxPgrSmidprtwzlMl68Cj1QI8Vvg1PEQZkQnRMGu0dXXfg9ddkfOR0emOI9
         nMrtNlTiOCLhFRXH4kTzCol0CSRJXaQfLv7zuXW/iK0qJkld7hGe4Qs66w1VIS2uFF0P
         eT8+rtq6N+NQ7rpaE1qjlQtV4FqQ01n8qdskNExIbRPVc7U5ZPSrs/ZZE2KT92uh6z0r
         VSHpq7Hjasb9u/Lc6IJC87FUfbRvADl/THZ2uJkb7GWja4EQk5KcFVMaHzreTUVeCsAV
         WSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798827; x=1728403627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN/jwUyrk7nWeXz+2PkcX9PcP6JH0CIrLV6B3SOl4g0=;
        b=nUpbQewvlRekO7Yx4OojlTzMnn/Tp5HYz5bzDUnLCTYjfZsSOXR4Y90zvKDjHiL/tt
         pvMlj0rpiEG3wM0zyI2THAgMXLvEzOmTp6RYLWOCgnHWAVHGnMn/ZmD0bKY9GN3KWY48
         /KUDqL01BrBgRvEjBA08ZQb9TsO+TdvDOEeO5bHtu2xEZYhVmnf0qBNWcSk6fR/CA0Sh
         HGIbuRPQfkWRa1sn0op7rPc6S994FD0HPyYHtOGOBZ0lM3HqaH4vAGUWy/UB45JkVGYx
         1in/mzBaL7bIPGZQOSM/ifJSRt6KnQO6AgKq5Ta6kqNM6JvYuHCBGhojM4tRUHXAf8c0
         qdEg==
X-Forwarded-Encrypted: i=1; AJvYcCWtzEhctLFSg669JSD/g9gAcnC1ynpCjwpCyI3MDCEO8dzJxWbdDfkG5EJNRhrlfh1B9AllMCs09WuOYg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRqQhqd+Ri6Y8eHT6ez5XuePI25roSwK72g05qhI+m9HkUmUJu
	yjxr2QAAlYVlRT9Xo8f/zu2LWSfPTlCPZdfMb7Fexy7+ZP8GQiBsOXNxJKpHY+4=
X-Google-Smtp-Source: AGHT+IGqLEH3PdcnOlfVjojRDIDEBcHW24GL0v1kFxG1jIxdQxmcVKqlOntROUvuoUxPrGiWv1Q9yg==
X-Received: by 2002:a17:90a:cb8f:b0:2c9:36bf:ba6f with SMTP id 98e67ed59e1d1-2e1851496c6mr147502a91.3.1727798826977;
        Tue, 01 Oct 2024 09:07:06 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:07:06 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:08 -0700
Subject: [PATCH 03/33] riscv: Enable cbo.zero only when all harts support
 Zicboz
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-3-3ba65b6e550f@rivosinc.com>
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
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_170710_444248_9F1716C8 
X-CRM114-Status: GOOD (  25.30  )
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

From: Samuel Holland <samuel.holland@sifive.com>

Currently, we enable cbo.zero for usermode on each hart that supports
the Zicboz extension. This means that the [ms]envcfg CSR value may
differ between harts. Other features, such as pointer masking and CFI,
require setting [ms]envcfg bits on a per-thread basis. The combination
of these two adds quite some complexity and overhead to context
switching, as we would need to maintain two separate masks for the
per-hart and per-thread bits. Andrew Jones, who originally added Zicboz
support, writes[1][2]:

  I've approached Zicboz the same way I would approach all
  extensions, which is to be per-hart. I'm not currently aware of
  a platform that is / will be composed of harts where some have
  Zicboz and others don't, but there's nothing stopping a platform
  like that from being built.

  So, how about we add code that confirms Zicboz is on all harts.
  If any hart does not have it, then we complain loudly and disable
  it on all the other harts. If it was just a hardware description
  bug, then it'll get fixed. If there's actually a platform which
  doesn't have Zicboz on all harts, then, when the issue is reported,
  we can decide to not support it, support it with defconfig, or
  support it under a Kconfig guard which must be enabled by the user.

Let's follow his suggested solution and require the extension to be
available on all harts, so the envcfg CSR value does not need to change
when a thread migrates between harts. Since we are doing this for all
extensions with fields in envcfg, the CSR itself only needs to be saved/
restored when it is present on all harts.

This should not be a regression as no known hardware has asymmetric
Zicboz support, but if anyone reports seeing the warning, we will
re-evaluate our solution.

Link: https://lore.kernel.org/linux-riscv/20240322-168f191eeb8479b2ea169a5e@orel/ [1]
Link: https://lore.kernel.org/linux-riscv/20240323-28943722feb57a41fb0ff488@orel/ [2]
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/kernel/cpufeature.c | 7 ++++++-
 arch/riscv/kernel/suspend.c    | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3a8eeaa9310c..e560a253e99b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -28,6 +28,8 @@
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
+static bool any_cpu_has_zicboz;
+
 unsigned long elf_hwcap __read_mostly;
 
 /* Host ISA bitmap */
@@ -98,6 +100,7 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 		pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
 		return -EINVAL;
 	}
+	any_cpu_has_zicboz = true;
 	return 0;
 }
 
@@ -919,8 +922,10 @@ unsigned long riscv_get_elf_hwcap(void)
 
 void riscv_user_isa_enable(void)
 {
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
 		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
+	else if (any_cpu_has_zicboz)
+		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index c8cec0cc5833..9a8a0dc035b2 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -14,7 +14,7 @@
 
 void suspend_save_csrs(struct suspend_context *context)
 {
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		context->envcfg = csr_read(CSR_ENVCFG);
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
@@ -37,7 +37,7 @@ void suspend_save_csrs(struct suspend_context *context)
 void suspend_restore_csrs(struct suspend_context *context)
 {
 	csr_write(CSR_SCRATCH, 0);
-	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
 		csr_write(CSR_ENVCFG, context->envcfg);
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
