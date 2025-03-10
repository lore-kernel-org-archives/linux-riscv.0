Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09AFC28B2E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 17:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swzmXRjzrZahvaKS38+2rZOE8C+vtm45seRzh2II8UQ=; b=sUkhm0csd1wXyG
	b6WJI1i0El7U0BifQIVm4NNcXb4xsyoAnWKeHj2s8FzGh/KGddJIn3CSlb+WCM7CTmx6xmvOcw+sW
	Bpewm2wpsuKr59B3AT4/9XjqmkRE08HMKM74mKvfmbor3Fh/u/y+yvC8vKqQCgPpYGPsm8TMIR6Zi
	Y156AuMxLpVKCbyL3cK+1+KdxuOYLWJmJSmTVGhLdZDbzrcb7QDNM+DH3nI2eIKGfXlSQJRyYaGP0
	IVsj573xkkfuTMasi4joiWY+Ju0EmTQJEcGID9I8BjsgUV07cHoTmrpRmSW5VwOaDgteIV59O+3hR
	wal//HlB2WvuU0M2BY7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhGp-00000003Wtu-3hHL;
	Mon, 10 Mar 2025 17:50:31 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treVT-000000031vr-0kon
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:53:28 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22548a28d0cso11742405ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618406; x=1742223206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=IQviqiianwC5Nf2LGt+hrOiDUM6ZAOH9XPWgc+euihxNP064/FZhTb0fadCO43CWR5
         RbptDONJQLIiIiQt/xn0ECVcNy9JLa9ndwE+O6oTC76wpx5iYuREzoCUkqG918zEk6j9
         aI++UdMX3y50etG8jsy1bbkHVE7qFJWrk2V02caRyEv0uQxweWReRW77nuHBKWbS48Q0
         hvZB35clieyR/8HTI/jgfWQsdiOMhKJ6MgXRhpHEZh8HzaYfALl8jVboV860WiT+jaLj
         WyA1b2XnEWbZTdWP2FfGq8nMc9oVr9JiKLfFA0a1cQYe1F3ROMXY+3+3XkxBHh12A9ap
         cv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618406; x=1742223206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=XUM5iULtu0UDkgYOMhdmUEpA0vo6vkgkxDYxwGHEWGaWwL0HndDogxBnx292HOtovF
         SmZDoMG/JXgoBDJ5gZ90JyKu9yGlep6hP1lZFodg6mdZcLHNYAXXT7Bj7sdfNMTXl1SF
         HSUfkemSr+IFno/Cry5yd1jBeQbnAWzUaYSAI3td1EZyqXLk5d26is6bEf5DX3HKulnN
         eW37Fc2bj4Vvgdfpgdw2m6JyfdGlMqKcRFgu7dg/0zU/Wx5N9Sl0Z+PxOz7T0/L3E6Oh
         OU0X9sEbB68VXgF9QAlCkab7u/k1WT7l0p3pPHlcvNvrKavGmjPam6vfhV2ZKctD+BNg
         uCDg==
X-Forwarded-Encrypted: i=1; AJvYcCW6GimvZJR1XOGJmscGFS99twJyogLDsMUPFdOw8OOZkf1LsMpX4OyuKD/T+jDG6HRhh3uH2kbzz6n2LQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3tLIIA6cfe+8Fpe3VBVYeOsRxlOUjPZGlFkx7hzATZHmFXX9E
	NrUYBcT1VOp6Vom84f9B0O9yYoq/CJthg+GkklbCjnpRoWQeA7Cc9Psjcq1MblA=
X-Gm-Gg: ASbGncsGpki67R7oU1F/8pK7MkNmFyCH0Cb8h/S3OB9HxjvdLfN4YOJYlsP5gsd74ZB
	S7V/GSPrz8cci6SLsoRBiFWnwv+lTMgxXD8FJPGWB9vTjQKK7b9RnphfwbSbfK7vBwcRJvmbhgb
	Mh5I/Xx1Cp2MBQAMF1ww1i01PKEvDY3KmzXI3Y3hi42/eCa2dBvbs7EUR5HWgKGh9fbFVSDOgW0
	xln6uamWARusTDF2PKQamoHbZu88gAkySek29xFuhRsct01Tr42JnePkOdxUFqR8vnnHCQkc7E+
	VpY9cYyHLTx9cSnlaE38x/cd2afmfce/xuK5LJ4p4bMCHM5R/i9FbkI=
X-Google-Smtp-Source: AGHT+IGghOp+j7sQ0Qt7sq7k8fXJkHLz3hwRxKC8iR81NfpyoYASRowQ1NRmeDSzKjKxRLkZDMtKZA==
X-Received: by 2002:a62:fb06:0:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-736baa02af4mr14991022b3a.20.1741618406530;
        Mon, 10 Mar 2025 07:53:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:53:26 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:44 -0700
Subject: [PATCH v11 22/27] riscv: kernel command line option to opt out of
 user cfi
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-22-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
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
X-CRM114-CacheID: sfid-20250310_075327_216402_68843BEB 
X-CRM114-Status: GOOD (  13.73  )
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
 arch/riscv/kernel/usercfi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 6e561256bfaf..be08e5bb6e62 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+bool disable_riscv_usercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -390,6 +392,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_shadow_stack())
 		return -EINVAL;
 
@@ -469,6 +474,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_indirect_br_lp_instr())
 		return -EINVAL;
 
@@ -501,3 +509,16 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "true") == 0)
+		disable_riscv_usercfi = true;
+
+	pr_info("Setting riscv usercfi to be %s\n",
+		(disable_riscv_usercfi ? "disabled" : "enabled"));
+
+	return 1;
+}
+
+__setup("disable_riscv_usercfi=", setup_global_riscv_enable);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
