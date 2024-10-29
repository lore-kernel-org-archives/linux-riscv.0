Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304E0D74951
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 00:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHp2HjvF4PbEbfsCx0DvseOcZokM2PS8opesAB9Vx3U=; b=iSayOs5XdVGT5O
	elzgij3I1csutvSKRjW19Cc9BNXtAofMpiTvLgEXeBHcbcpFnv8vV4qLdTB1eo+5W6dYhdeSmQ/qm
	SBVJQw8EIy3qtPsVCOfSkD6ueXIqy1DsqX15qv6Xs77KrCwTXX6JbFLtRMCmu2JUZBokK8T1QpmMJ
	AJuPBz42FPiDksh0OTxNQBA+PRCnzohyZQbyZiGenT4YoYXeiqFlZK+DvgCg6nSZSCQHpoTODdVGp
	FJ2cRMLVrIzAVjFeXdzEcD/vscEXNuLRxQvuBP6Cv0r6wVXUJvcA1np9Iz5Lq2lUq5Yma55CYKkzM
	RtEBHxvsx2fo1gtYQPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wqG-0000000GMPc-1jOj;
	Wed, 30 Oct 2024 00:45:44 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vtF-0000000GDXr-1w1d
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:44:54 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso4220245a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245484; x=1730850284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzIJ0ckbf1GHBD2tYvzNgj5PuC5n3mvmNJyw5lLXOXo=;
        b=AB1oDiaP0i3+xpxHIg7FNeT5HwB6khkZGiSGOUbdbffQI/nCf0PBpDu9naV4qqXb0R
         IMsp3CnelwkqMxtsfrpeCbRAzmOh/dQSOJvSSvqCA9JTmXd1yvfmw6u7+eC3ZT7pXklE
         q232p1TmvC8mPvt2gfqX0NneFqOwDl5mLAWbgdxZOLfVmsYvaOvbmFmYyaXGWV7xCmCO
         PPWpcUeXZvfsSRD/L6cQnMCJOJsb0Y27wcVSs6bSRoNFuZm1GUBYxOcdjxzqt5oVEUBN
         CIw/aoIv2LFMfM0km3m0oruaJvmXTpaPLXXfryUQLhRCbCES1+BVn6Locv0kW5GdWNto
         GFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245484; x=1730850284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzIJ0ckbf1GHBD2tYvzNgj5PuC5n3mvmNJyw5lLXOXo=;
        b=Ao+FbFtsJ7nnMZmEhaz9AO2Sy3GupRr6xbqJ8r3TbOeATo6eDC7mfniJt8eFkbBR5m
         tVWJF+HDLJJQowYyHldlUDE8G/Dc26UWzCR056BOagfWX9F28K+cmsPnCSVML2MDciOk
         6QzLPuJkKV5R9+LZWxQzwEmlvfqzLpGeoJR0zzAqnudBHU+jRn0AsoKrp4RRa14l0HRf
         zAzkUXXqmWBgqHUdgkB/TbYkv8K49uv9T9SCdowx3ZGajSHq18Vxv93t6e7Qzi091Qor
         wXxAitStrji43E46A7PX+hW4kVq885kjt3A8Cubsi3Hdy3cfhwZee3BtDp0sCj2EZn9/
         9K1A==
X-Forwarded-Encrypted: i=1; AJvYcCXqZZYk1aQqVmMI0HkwCFp1YqdUS0b35HKo7EuZWg5wDRfSZgzuzJJb9K3eTlivNlnAycSuhJJl1pN9EQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkMoS14SvJ6+4+8MsIbQ+U8N2Kmlcp5i6asGdVBUgXNKteA+Zi
	vV65lFGPoBpBXfsTcf2Ki/qktj81+V/14ET7UUiZDouO7nFCZMz0nBWpVLn6LGo=
X-Google-Smtp-Source: AGHT+IHO9NpgsFfUG2/uawtteNyrFufrWe38CJ3nbx9BvyIZZlCpghacJ/qvTmf6Sjhfn55Wj0xhbA==
X-Received: by 2002:a05:6a21:920b:b0:1cf:573a:bb58 with SMTP id adf61e73a8af0-1d9eee1e178mr2067308637.40.1730245484368;
        Tue, 29 Oct 2024 16:44:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:11 -0700
Subject: [PATCH v7 11/32] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-11-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_164445_891640_B753EC70 
X-CRM114-Status: GOOD (  10.51  )
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
index 4948a1f18ae8..2c6edc8d04a3 100644
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
@@ -738,6 +743,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
