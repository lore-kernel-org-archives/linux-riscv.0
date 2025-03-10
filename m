Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC8FC35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouo6DX3+Zo2X0OcJAXK5MF+nGOnvNHn35A1HrfTTM7o=; b=kLW4Royu2iuADE
	wiZCwa8u/Lk/d4XvwmVaf/gULg70HQdG5Qij8ClY2RbcoDGkjkgCPqYzl+A9ti0I5S21ERgv9fPL/
	IVWZz5dRMN1IyZ51heJmsEw07CjZ1qVPYOK4CWb3ZxB3A6/iF9mbZCBiZHUeG7H92SBqflzclwsdS
	HVXUCI+7A2PxZy+2B58nt2WcRgmnQR1ZgU2noR42FQ+G2XQfw55Gb7RUiF4E1lb8Rt00RTXBTcMve
	vToEjjzQeto4+KK/+GxVujAW7taPvB7E6anXAmVzcijq3K7dZDv4q3jSOE46cDj1dTEWsC/WQXmso
	PXJF+Rk8eqX/MAEjz0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfGu-00000003DHT-1Vfj;
	Mon, 10 Mar 2025 15:42:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUs-000000031XV-1Br2
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:52:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22409077c06so10323345ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618370; x=1742223170; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=lfdsqAjmJq+Ybz92YJxLiu4md3VoSA6Xz0oOeJ1+siKVC1K9zbemmnO7gY48cLAAm0
         AWyNllXFKr0xfPFL6pRGthpYOUH0Wt4YXaV36XJQoI9bYUviwC/gAaUZrje0xORnjb/j
         ZK+oXn+s0nGuViOxLsTE4byV6ybmTVAzp750VlRfbuODwReodAImJ76ZRPouK6uwVMWA
         uZx2nMuDjSj0xfNz2KdkIi2igBtYj/Ul7AuEwdnpMW+9yH5Hxwr9gXQI6UeRKBRbJHga
         kVVOay7EPKjJg4/HpKiqwxbE72KraAbXOyV24rUHJr0mEaJ2kRuAVHHPPwS7iDI7vFeS
         8D1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618370; x=1742223170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=TgiKl/jBHdBmxoCAXioBf+SXOjKHBbYiACdBO5nUp+YLwng1j0z3WnWJv2E5CWC4Zb
         Qc1nc2/+YESbppo+F+Hs9MsoMmV4vuAOn05d+mnc9POt+JrQ8XmApYfpNwTssYSRWL1h
         4T6JqDxsVPOzMk1IOnRj1w5UByJCYdJf8Jt6H/E5xxDMBn0+o6ngEydBHjwxfyoIlRrW
         SumKAlw6NjWmmhYvvFNp9LeL6/WyLx2skTFC91lAWiSGvyCVuDjMXuBNvMFW1SYhuwHe
         +C4vMsh0ESgq5A7BIrbZXU2O8zS4ZgmUmUCF5IFT01Y5gFXU7Ipb9/TS8xFaZNVxwN7O
         21nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4DvfKmubl8CX5RXKw24CZIRU9/RYNjgfkGryObVr0PnnKfTyOzvQHkpwtvPCsKdjU1aF+mklcL8ed8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCgq38SRKKth0hUthmxh159+6443CGWt5Bf9jWLHbhIm8ohfrq
	9exHYHjVbOcmpUO7k4Tt71PmSk9ffKDO0wTfdbOZrkG3324NySRedsrHiVT4SEI=
X-Gm-Gg: ASbGncsu/kjMzqoZyC4ASz/PRhQpJ/VC2VM6VJORfdoqOs/zLJ47dZACxcveTwFQRUw
	mH80H7Xi2oVxBZlSqBAO18Ou8xm9xDruDXVWcrNcYctdS8ImCwg7NPPhfH57YF9EMF/hBQA6j8w
	qXCEHbJNi+aniX8JFXawPGnG8qvyX9ckG0q1owABvO7mXgoQIfRNQx+0V4hWUGrOVzGo31VFsCJ
	4MwCbbDEI93cMgpzcX4kcopw7klsj40Hhi0RI1aGIkcJtXYPbUTMAmRU3ln4py+CaYyTHwtzERX
	MyyyfzysFjS2DqFmiau5wc5ov9TrItf/ThUgXBWnuDYHb7LTHiuxU5Q=
X-Google-Smtp-Source: AGHT+IHIjPCK5/0EhbZcTRnURyZw0NTj2K+W71g/3+djiMGOR5iYaRFLtirQywnmf6SGr6Tob6ydqg==
X-Received: by 2002:a05:6a00:218c:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-736aaadf10emr17282132b3a.18.1741618369717;
        Mon, 10 Mar 2025 07:52:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:49 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:29 -0700
Subject: [PATCH v11 07/27] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-7-86b36cbfb910@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250310_075250_329028_7D6C17BC 
X-CRM114-Status: GOOD (  10.42  )
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8c528cd7347a..ede43185ffdf 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -421,6 +421,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -749,6 +754,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
