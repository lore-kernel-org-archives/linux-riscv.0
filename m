Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477CFC0219F
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swzmXRjzrZahvaKS38+2rZOE8C+vtm45seRzh2II8UQ=; b=Vf1l4kJUJZf7pi
	2+ettkg1yeqYtUl3IG9rIMw5vbv8uYa/dSMnKVRc/ZMg+6WE7/yK37YuMbohXBsnDW+rE2XAzmf69
	31q333F1akOroe0EEzBMWPsqtigH8vODgwjiMMhJnk1WFQO6ls4qanEUHwjG2M39+Oot2Bc26hjRW
	+jpXiVYgQzIL9VcPy2Gs/yqYE5Q0sxxvvsDnkTeI8S8eeAKO3p0q9FyTY7tvmCo+b+3/x5Uz2nmQ1
	RBnCdqwMT9BWwaAegwzdvgox1qlgznnxMQ2FVcMMOJAzvZJEulgjh1pSqvtoVN9shpy/LlRmfQb7E
	LF7AmaQc0Z04Pvauo1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVC2-000000028YY-3wAM;
	Wed, 05 Feb 2025 02:31:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7g-000000021hh-2rUW
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:37 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so2450244a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718556; x=1739323356; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=2LyR6dC/d1up4noN/gD69AfnpdH4o4TWtTH3eK9AQvIapy6W2ESs1w0M14ncLHiscy
         IDh4EyMEl0ZDhiZk3lzJECs9wDDlHJGq0GSXQFKndNAgA+l6h8tHzY2T3+tCULHhwAf2
         LTeNiiwkkW9uOSOsbTon61ut8xKsapm78ilacZsHOfjcuoZPLIUgJpooSxMqZ4b6gA9m
         fTI4kdVHEie4CfNLm5Bky00poWnkYEHFrxLAbqfH6Cog/YJe2pTbyBLxZzRknUI4hTy4
         qZdwciTqygLitwUGlxscFC1O+wVsrozMSz5iqANLNpdDWe+6eLZQfrAKZPYP2sQgtzmH
         FDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718556; x=1739323356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=bGvy2/v9QgslvSsKSFbNjnEQq21R4hW1Twh9Z5g+SDMMjCc3YgcRfKMSuRqMf/zKJv
         GyGL6B9UgSgLUnKcVN/QzDrLMj6U+ODPb8NVkFI0OmvDN5//47qxADTEXToiyP0FSKKF
         PnAcBtQIJGoS3/kf9RDY/prEAzIZbf2dVjURfnET6uEiBoW89yvd6nWp5vEEehD+t71Y
         9tVjILjZdHv+74m3gt8mZ8PxYBCSRAAFExwh0yvjDZiPeAWoPo6LTKu3gPdJhrio8OZW
         MvHDm2YXzUzLUGl273QJp7EzXjMBmZHUag8mXlThl2Fw61hJaR8nwH5qKjQpQh2UoNVP
         TrqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKlvPMm7/oYe+ZsHMBbECAzzUhtvOdyzV7+2v+df33WSxGhlfasL2UsMC2r5YdqVSsGW76ylDWJ0i6Ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqHjfcCXgVR/8cFq2ZMjzkbhgrapDZUGjsX6dqyxWspp+jcxEt
	sBxJPjjp6NYWbI/x+s1Bm4LDYYYbOCGNJxhds9mkIltzDNAmBwPElYyoxs1dhZJ8UNzYY6rwjUe
	g
X-Gm-Gg: ASbGncuZGuF/dh8jN74Zexiif0FGepuJ0O4d8PNKWvuGXnnSOKrt4B5irCC8IXKjvzj
	xvhUzjPt8z8mj44mEuWewaXRY/fFgIEjeOoYWJpZwvm8CUIjt6lECmpt7ZpQtVxp+Ny8Gibff3Y
	FW53VbOuR3Lb91wxZI24aiCGtCLTuv5ac5xzCMOpdXtBevExfFT3IhD75kgZLnWZbVIN5LlKjYK
	m3eG+mJz9K6VCjBG4hqwj7LRpvQH2CvQJj+7hDhOuR/kIzQX/KGWz3MJQ6gLvdN9+aQA0TUy8cE
	7TZlZAFCkmI3/8sHBVz//Ogo9w==
X-Google-Smtp-Source: AGHT+IF7aU3deMwt8hgfhlcc0/P4Onueg0OBpQL+amjmp/PRJZc8dKL/Qrb5rJ/l7MtlZbqHel59Ag==
X-Received: by 2002:a05:6a00:6018:b0:724:bf30:3030 with SMTP id d2e1a72fcca58-73034fbc86bmr1933458b3a.0.1738718555911;
        Tue, 04 Feb 2025 17:22:35 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:35 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:22:09 -0800
Subject: [PATCH v9 22/26] riscv: kernel command line option to opt out of
 user cfi
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-22-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250204_172236_723304_78717281 
X-CRM114-Status: GOOD (  13.58  )
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
