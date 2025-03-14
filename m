Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3955DC282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 21:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpaxnokOhOxyks8Eda34QYj9DiZH8Xim6deFu8zf900=; b=FZhaNTymZPrO2B
	/P+iPXWNPXXiv0j8/8gXo3kXQ4P7+Rdoad3AxS/ljMAtasH0xA4EXumPK45WSQeEWLVYudeGYOrB7
	m8ajcRUMVpoPcz33iGAQv9b3xSCG0y/rCW77BhI/UttkemhQTj0vVNc4q35jfFpmId8ioOW6j0cRu
	Caw1j0kWMJB4DJTvlmygPOX26B/ilQGGHb8hNgH4UzEakrUWhh2xxPT6RVxMZuhdgyFsrnntrdTwB
	PtnbnlvFEhuvHmMjHhwkdPQHZOU/VayP0+ySathhLl/qVSpW4R1JHaQX3ehxRwGryhTV3hypWLFgv
	N/cVHHQsfUOXHkAT+xRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCso-0000000FNWL-0ElE;
	Fri, 14 Mar 2025 21:47:58 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCsl-0000000FNVE-3LBh
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:47:56 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7c53b9d66fdso329929485a.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988874; x=1742593674; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7L6jEjphmSCVBHcxl5XAt3Us7qrk/UvaMSfIdPEx6k=;
        b=Nye1e9DwpitK5Ai3CkcdrcCTmxhPIdMIF5yMOUCaRluhIZmekzQZEfg2QFdOKXmVLL
         qqrDVEfOqbOAQ7qOxwy+xGSWgAEFvqgaW7GJH4WbRbUjXjYPwFe2qLaACBr5DGmTpYTW
         Ju+kOKaHZa+KFqhHL1KLrkYBPPWdnUxKL6iQ03rYNVFK1CdSapTZHqo0oV3whIE3iqbg
         RnOC5b7QBlQ3qDZd5rUKqd9H5lt+AZWu5HBQ0A/4exaSR3kF4hqr6ohSZIEmlvGOGkid
         J1b3Ep1L6UBO47Z4F3NJRb6UOt3Xk1sIvSmmSZjssJJIsIiPpIWjPMH5i8xrijVkDS/f
         UaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988874; x=1742593674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7L6jEjphmSCVBHcxl5XAt3Us7qrk/UvaMSfIdPEx6k=;
        b=C1ZRrgSzNkvWrDm8pCsWYDG3/F1nchJ0m/wZe6GvxChT/J4VDdI5YdNVZrK/gJrKgO
         EbE66KqL1sN4WGzaI7JmjWcvmwkmSO5SVLrmgtokAuqNekxiDUbBKuRhwlHkozyIwIbj
         bvK5e7Pob9Bz4kgzDelTqdxuBMghpKpsyVX5YrWdQ1Sqv+S7VQ6oDUljz2NHVPskKO78
         LWmrxAQZK2tabNBlNLRjfedrNHMKQzfmUVjMIwFp5PSfab8EOUKAssYNegFc5682x4PH
         FkcJvHg6JRvKqh/N5ySG5NtIzY+Nm090pi//+kdmAfZmsC6YD/kRyJ7QZ0U4gmE7+VgH
         d/lg==
X-Forwarded-Encrypted: i=1; AJvYcCVR0AWJhsqklbACRoVr199CTDRrIMwzB07qwks2nmICnOFRDaNYE7jnnEB7YNvVgu/brL8Rin0mtS7vnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcyOeiMPs+Vqnat/hbB2yFXmxk0o4ClVuQE0UpmoLDP1+bKi/6
	GH3cXTisTnBa9RXugfOPkwoHjv+rO2rIgYssQOW3Ws31AEWSlQSithSCd8Vk7lw8qYSCBNSWC+G
	r
X-Gm-Gg: ASbGncskemcl1oaXrg8tyrdqTJq4mZLt9krs4FwAU/n9inonve5az621biUGhYnbHkf
	jwY8V0p892tWLNwJJUSZWYWQAbBWhAhGZ9sptPajgkENs1zgO+GD3Wu8CIBIrcOUqhOr6nNHdSb
	XgU8UItX6P6+xlZF6+ep/Fi/U244TvGuXiIfHzIXjlvzn/T2g4uVikQtwZdYjcAn7KuMsGpDTdY
	U4246QVI+QyNa9iU6nN1rQL8wCcCjs+l0zRsXTU1HSf68VIc9vseLsUSMW7j8OPBJlsz9jZgoHb
	QD3cDmAZsnoNxJ9W24tQZoBfUGlg6HBh2HK2oS8Bq15twsbe6DbCM6M=
X-Google-Smtp-Source: AGHT+IHAGPYqUS71chjGuiJ8YNLnk78WQ4QXPzZzrnBV+tP+kBaD6/rfE4E8XKuF5NR7jHoZswbG+g==
X-Received: by 2002:a17:902:aa4a:b0:224:1dd5:4878 with SMTP id d9443c01a7336-225e0a62f2emr37059015ad.7.1741988428224;
        Fri, 14 Mar 2025 14:40:28 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:40:27 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:42 -0700
Subject: [PATCH v12 23/28] riscv: kernel command line option to opt out of
 user cfi
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-23-e51202b53138@rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250314_144755_829155_07980074 
X-CRM114-Status: GOOD (  12.96  )
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
index d31d89618763..813162ce4f15 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+bool disable_riscv_usercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -396,6 +398,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_shadow_stack())
 		return -EINVAL;
 
@@ -475,6 +480,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_indirect_br_lp_instr())
 		return -EINVAL;
 
@@ -507,3 +515,16 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
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
