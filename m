Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5697CEACF4
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNW/kj7Ya4pjNgot6Yg3/otb6q1GBdMW5/j0QvtlMaQ=; b=vRpqjbiZcwcRLf
	QoaoGOkJi+9D8GjUBRFBljmSZlVV4aY84g8skanOsfU/Qi/8bCZE2MtXGDPPQLQJCgfvGUKkrYCvI
	6UBz+vBOcyZZkYUvrUic76pvwGUdIsg/el3HmdIMzYNTi92YnMCZbZeH2xWZpeeHDtcNSGxMYZgTA
	+/xwRWbO/KV14sN85NK1cOPuzlVqQKE/i22tcLAeGYKoxNoLAANDIxCaKHYmEdsX5KipcJlXOi7Pl
	vsNmVuI+s3wnHcnfYtegU8zO3L46llV4Y4GHc3VbjAoAjQZvIzxPXj0VbRMIx9+G71U9YByRvXlXZ
	5WCb+kp4qU7X/BKiNfTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svgin-00000003fCr-42ZB;
	Tue, 01 Oct 2024 17:31:38 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svfQ9-00000003Rbi-3PBO
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 16:08:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20b5fb2e89dso22851655ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798897; x=1728403697; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6xdKLFU+R+/xaPo3sKfaOPe5nwRayI/Mj3nw6nC0RbY=;
        b=Ofm/SG/YvrS2swH3g05mwAINmAXs4cmXXW8KweYsL5tUgXry598qa7IQpYvWedGbJP
         3JfLHkbkWSrFdk7BODNjzscCzNhKWctu3hFQndQ3R1hYaV33E2Y5DHvzbWlrchnyCnz0
         NAUX3UNRJ7ynVJR69FIMT8orl8ISq27R2/NFYjFcO9YxXP/qLKs5/s8487o/1Q+Mrmrf
         Y5dYBaGA15Py+F3Ro9q58vC+NxysoV0Ub5Jlc63F3Z8E3R+IAsojNX3sW08kW7/MIRcO
         mZ8zjlK2VRlNDAzCoMfJfC0NoYQeenbsX59DLZTY2SgpAkikSedCtrN8lD4tl+LMMp+H
         75og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798897; x=1728403697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xdKLFU+R+/xaPo3sKfaOPe5nwRayI/Mj3nw6nC0RbY=;
        b=gNaY7hOjT1+1C8NmgEa0dsxBguquPLgEIp1y66DgaUxOUZcHeoSA9NpOHBpgFOAtqB
         6P0FNp29Y4HBN176AYEDIrqREBkbkPw8xSjbY8jZ3uetW8zbdOcC1IOMQUuA7WWqEHmZ
         UjjoP/oBMpXBMLCeIp7umNIrihMI+Es+pDaxpWVu0wymHWC5lX/3wlaMXC8ZNk3Lxd7R
         BR0hNs2DEIXqyItRSSBnWzZuG44kSfxvL1c1lA61hozAqq7QRejL6r/z7lCiuqRWVRxC
         Ms7zP/acy3i/59Fvm4K8TYHnzEEi0Lm7sUjcXOFwiVaHspC1BCDfpzRgANy4D2b78Iy+
         98fg==
X-Forwarded-Encrypted: i=1; AJvYcCXB2JcGu/1V3HfqB0G7svHRwYGww2OdMNLp8jMWYrCF039NS7wSZlbHC2GiLPnyKSudZdZEvhHEuYin1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCuGgrHwHEr+MwXEs/d9olC1bAdWKNUbgSVuN8uqCz3C82dhC1
	PBt/0d4GyVc+qzNmx9mUe9wMPHYpIcHMsTCd7KSul86iaUQCep3Ft8l7ZLQD8IQ=
X-Google-Smtp-Source: AGHT+IGSPOS/rjJlw+fxdYuzivcwlYhVRY55jtXIOD8f6jn9tgzzpKbZ8nfdXLTRzGnEFUMQVR22nA==
X-Received: by 2002:a17:90a:f494:b0:2d8:8ead:f013 with SMTP id 98e67ed59e1d1-2e18452dd9emr235870a91.7.1727798897223;
        Tue, 01 Oct 2024 09:08:17 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:16 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:34 -0700
Subject: [PATCH 29/33] riscv: kernel command line option to opt out of user
 cfi
MIME-Version: 1.0
Message-Id: <20241001-v5_user_cfi_series-v1-29-3ba65b6e550f@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241001_090817_970133_722E2D6A 
X-CRM114-Status: GOOD (  13.60  )
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
index 40c32258b6ec..d92b49261b58 100644
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
