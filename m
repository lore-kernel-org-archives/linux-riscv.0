Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0D2C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Feb 2025 21:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swzmXRjzrZahvaKS38+2rZOE8C+vtm45seRzh2II8UQ=; b=Ey6+vjHI9Wxw4U
	lXGDUOF+shM7IlbWqyTflmXoHyRoDbyoLpd+eexiS2Tr/73EjjPHz2DsdSqhNhFU6708q8AMi8S94
	55T8D5SZSn+X7lan3MN8Wkmf6AQYk4z48Ds8umS9RVeGax7kudINRTF0m/gZRCFmBzQDktIXPM/2O
	3BNkFWwuZ31M6xUb3pbKHhh6icdJKefE91FV1+xSNAwecJxmmCAVR5QKyCzHUMmpdH1rzBBbBB8aG
	F9ZjHQg0Cgv+jGmoC4EEdLDZiJl1qG53vXfIH7W+a+70Y6ccBcu215ak0xmQKPHXpcPCedWbogj9x
	PcS6xCJhqlPn/h0w+urw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWO-00000001Wn1-1szn;
	Mon, 10 Feb 2025 21:40:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaNV-00000001Kd6-2BYC
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 20:27:39 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21f7f03d7c0so39216655ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 12:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219257; x=1739824057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=bjlTo2yAF/YkWtBofZITL93pIQfmGV2Uj2yO+h6zli6ewrh+bI6ITAalJ6/picOGj+
         hc8R8u7jfNR9dxPIfdgwWKZTFkbGGVblGEkf/DQ9Zfylx/oG9DLKnui6VXLJuiB8hQVG
         O0qPqu9K7cEWMa8jbFvd84Si/KMhD5GAJq5C7Fe96MHDllVo6/lxFx/wdYrButtxeGN2
         Mvx0mOyba90KfTde7STrV+LDb9Ghj6WiSnZ+DBZK92kjrxevDOCmPHCL/y/0Wz+qsECg
         apYquUeR9RBkK5j+PPTcpok0T6Vv66G0n8REhSbloK5/cOOgdQ8KJALin+qW7Hgl/E6D
         ffOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219257; x=1739824057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=rD9VQWb4Z3EBHD0/Lq5J5MEZM6RZc4VQIlBj0ayGbVV8dTpAGo6gnUyR7ZqjV4oo5x
         nFbnXG8Ux/efnhgw9J0yfJRodY3If+WErUl+Rw821Zic4TubtI4rjQopng1SejmOW222
         2z+aLEYy0iMmqHv6jUmyBaye7pww3TBe60K51PpkCN6LsmgrSjXwLa0w9pDtD6yGTrNf
         HQ9mgbe4/MN5PuPzTHzM6tCvuDvL8s/krrqMvxUaNdjjkCTRexVuPG89HZDVX9M4yQIW
         qk14OI/+ovzqFCkMGBkqI2VLLZQZiUZK9to54ynW3ObSEfU8DLFk0rl6BIDkIA18naU9
         c+7A==
X-Forwarded-Encrypted: i=1; AJvYcCXlMzskJHAYRjiLJhTDOg+redrncjDYr1Lo+5+MFS3l8Z1GVdfiNry+Rx0clkA2ET24ZklA0w7Mwktdog==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI49qQ9RZF24yNGyd3UDB4s2QvZHMkIBf8O3+PEdKZxgXklQoT
	fxBaY4BRdMOT2RonWvGY9KvJ3WBjwWOuDTmzSv2iuLzHrBJT3DgZnzneti9UgLY=
X-Gm-Gg: ASbGncubcCnewoxXxK8uY7+8bQkK2nu0HOcQWANubfOSGNhJm7PzudBrRVMnv7gTE7u
	XK6w1YHZjh1PgZs0Vs2LK8I9zUiws/UTvCJtm4dghKtO7ptDbA1ndq4Cntm+lMxdTwqE48140fR
	IWwVrzS8HBH1N27fzaC9BdmjBsZDvgCb+WDEnc+uXCOaWCyeYSYYXWPzmSyCxj/hY9bG8ePV5CY
	C4ZZXoJQoFrnW5rQEtc6sQiVe3TMhtJDUU55poXIwIr3AI0gfHimxC0kpQhCUnSCKAe/fR3bwJK
	9CpubqYIWH+d31K2sph8Fz7tQg==
X-Google-Smtp-Source: AGHT+IF/dAuKVSsF4xfi2H6sG4wlPlN+BXXOHG9nKEFkchqxVssSaBrEBlASEgV9299c+TKy14VoKQ==
X-Received: by 2002:a17:902:c94c:b0:216:1543:195e with SMTP id d9443c01a7336-21f4e1c8978mr260581855ad.5.1739219256955;
        Mon, 10 Feb 2025 12:27:36 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:36 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:55 -0800
Subject: [PATCH v10 22/27] riscv: kernel command line option to opt out of
 user cfi
MIME-Version: 1.0
Message-Id: <20250210-v5_user_cfi_series-v10-22-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250210_122737_597704_30CED8BF 
X-CRM114-Status: GOOD (  13.51  )
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
