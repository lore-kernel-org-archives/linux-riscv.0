Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DA3CF042D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 23:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y/E/TlHs9hyZfaaF1hd+NX0coHPWFF2RXE/9S9PqiGc=; b=LljuBs6BuIz/Pk
	tNl6IDFG3hlnVVcfabHvdlQAX7781/HEfdv9sCyM1pJtJqi+AAdB5wgxDaexGzFsxb4JEaQKRUUTd
	eYySlUerK5EGV/UF2ecEvW5e0zYVhK8dfvVVBvNNcAk7wfTmgOZ2AIuDHEl+I5YfxziIezVE7Hkq6
	nO5NNLFJQp30Hx+P13XOcuVktN9rhREq0Yphg5He6VbULdsxVi5n/TMz2kcq5mrrL+u7vEogkTPHg
	ip61jQAxbAEwHm2ZjOEMO01wWOqLW9UuEarBgLlQ5TG+5Ou7N1aP7CNPGVtix3POfkvPQHSz+4/K9
	GYvVsEdVQR0ozXMEvNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syJtm-00000007SJ7-2R1p;
	Tue, 08 Oct 2024 23:45:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrY-00000007Jbr-3e2y
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Oct 2024 22:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Iv4iGVPETdra3MKQf2NWKMBAajr7s4N4hA6eTIOU8rY=; b=F3mBdYibzMFJXWGwTISHynMQ8z
	gfiyOhV/44W/0/fHUKLFfm9/fJLksdkFF88HQlCvr1vNtUije3uV8I5v38CV07r3CGaFT8DEcmpLs
	KnO1Vnew7P7TaUH416SOMVPUdV5tZvd8j04OKgBgyy0TJIXGkw7IEme1nK1E2GIPIP8Df/y7afhPu
	nIu7tGeRvglyfyZdQ9AL8dj4uohL3vWQu48s7WqrI/pMoqtfPIx5uu6cjzpK9fFuqiBexEZkPB2wp
	KWH0xy2ZxuGRCeBivanfZtDyoGSgS7go7GU4JA+mWWlB2uysts8YGE9HWDq9xS60dRSLJXSzq+NzN
	AxcB0FCg==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIrG-00000004hlW-2ttV
	for linux-riscv@lists.infradead.org;
	Tue, 08 Oct 2024 22:39:21 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71df2b0a2f7so3055188b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Oct 2024 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1728427149; x=1729031949; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iv4iGVPETdra3MKQf2NWKMBAajr7s4N4hA6eTIOU8rY=;
        b=R1HF8ytxF92P/MdATpqeam0CJEtk0nagW4nYaUrGykGLf8e/4lZGPvVN645S52zljd
         t7yByIsKBqK2ozo/84ynRVJBdRXNg0yPuas+WrCIx/FGFMZcVP09pc5OVzWcgAYg9J06
         sjLKXbmd3XNqbWzznsOvTst8ubXfjn4OA/8yBOtrDgmwOg52fc9zYBGefKpazqa2ZR4o
         c+/lc0jBHrmg8DbLAOL4lx89mRQw2/0tfy583AZg1m/xBsrZd2kurJcI98ga0Ajh7rKi
         JDEACAkyTpGgvp+W59m1mtKq+PIl65YDy98fXNz13zV5A2UKJJldbX1zghNBOW3Ij15e
         3qTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728427149; x=1729031949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iv4iGVPETdra3MKQf2NWKMBAajr7s4N4hA6eTIOU8rY=;
        b=V8e118VS3ldNpO7wG/HWAGHKrK0R+0tDJXhT9HYf/XnAd2pbFEUJXYlvLB8Gmkbt2f
         jRsIs+6cEO3KwZwW6e1QKCV1sDvQGqcQgOv9ynR9UkzLERodsLPs+2RW+r21dSQ62qeH
         21O++pqbi2tWzLdIw10BW14YG/HuWcVjs6B2C1KylwZFmiMage+ry3U7BSEm+U3oO/BF
         gVWTbQTClATGAt7MhFI3RrgiOmf1grE9L+V1dQD/32EEnwbCHIUFcCAFGnCNrYaKT0H/
         NHoS9U5SwBXcMV1kDGHXKMoeuLP+wQk8cZ01eYBH9g+WkUx5nhN7/5mKwj8gJBpdt251
         BzHg==
X-Forwarded-Encrypted: i=1; AJvYcCXyxtcu+CrVNr7WqXkw6vBjiHY0ON+exzaVOtvMdRVZDZXvJdOxN8UkEhtS2jjj4cC8xcIMlWUzkz2FBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIDFi468H+y4xs+bx7ZFgykFf9kCfZOzQOeEJv4p+DmeM/QwLq
	kTOmcPP4BsSqrATkiRq/QwM8I6RciGRQtdAY4hDa9vv5fManS+xNw5x7L10bnHw=
X-Google-Smtp-Source: AGHT+IHjoVQEvv2ZL9MtUd0PoitnGhc0oOx8qTU8cQ9IzAvoigYxCtNZAaIOLoagpVlmMdjHekGPKw==
X-Received: by 2002:a05:6a00:244d:b0:71d:f423:e6d8 with SMTP id d2e1a72fcca58-71e1db680ecmr668933b3a.6.1728427148723;
        Tue, 08 Oct 2024 15:39:08 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccc4b2sm6591270b3a.45.2024.10.08.15.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 15:39:08 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 08 Oct 2024 15:37:11 -0700
Subject: [PATCH v6 29/33] riscv: kernel command line option to opt out of
 user cfi
MIME-Version: 1.0
Message-Id: <20241008-v5_user_cfi_series-v6-29-60d9fe073f37@rivosinc.com>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
In-Reply-To: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241008_233911_021169_596CAC8F 
X-CRM114-Status: GOOD (  13.28  )
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

This commit adds a kernel command line option using which user cfi can be
disabled.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/usercfi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 92d03eb76c03..fb17a67568a8 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+bool disable_riscv_usercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -393,6 +395,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_shadow_stack())
 		return -EINVAL;
 
@@ -472,6 +477,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_indirect_br_lp_instr())
 		return -EINVAL;
 
@@ -504,3 +512,15 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "true") == 0)
+		disable_riscv_usercfi = true;
+
+	pr_info("Setting riscv usercfi to be %s\n", (disable_riscv_usercfi ? "disabled" : "enabled"));
+
+	return 1;
+}
+
+__setup("disable_riscv_usercfi=", setup_global_riscv_enable);

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
