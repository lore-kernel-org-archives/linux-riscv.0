Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F053CA0EC3
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oeMefPGbQ1Dzs/Wbkpac67x5aB2DMoYbUus6mt7q3og=; b=lXhsT+T3SJxUmO
	DP+x3QoRtFAkUGZd4rYaXVed5TKpqgc73/IQIGae7fOd1sE0PvNIFvc9IXx5G2LVgIswYEd1AYIFW
	fdkmjJ3fVNaGJ+Rtz7D2oVn5HLFOH2iKlXrkLVnp9abrzQH+G6VOYJThClRlPCi4gSQpO/eW4gbNy
	C02KKevUR3+3tq0wQ+8CD2noRxudL48v+bkRCEdzYlYeVb6/ETdCg5Mi5aFpEH25ivi6Qcdn+z7Ig
	x9MNOs2kII19Uf1maE7Pe6CniZ+UD9XCHod8rq840DLgN3HChELafFHq+VlpNqPIDgVKZmypnto7C
	4MDwpXDJVqvuCyGCTdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZj-00000004bv0-2fDM;
	Thu, 31 Jul 2025 23:20:39 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcYm-00000004bBv-1R2l
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:19:42 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b42348bae1fso555164a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003979; x=1754608779; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ez7fajQ4lWgiIPATC51FeBxCIECW6n3uAlkHVBFvak8=;
        b=HfGZ39z2AgtFJOwnRjHfZqhsOlxZFb7x+kiNScz9itnfuKVgvnDCMB6zn8744fRx9H
         PHLpGyMRxaO8bWgR7PaCsOt7AjQXUc8USskE4sk7EGP034+ZD1W/iC1W2ylUP9AGHT6K
         VznjLC4giHYW406dGB/AUb32WJfmH8O6jK/aU810NlpCLIoVuPeABASNZxuX0lFcnpBu
         6QL5MdIRiWHvqQyB6UDDGi8VZGIC9HTCm9EQPeoXQs8LxHMXhmaE4Xyaxe7/FZmG7c2q
         1XaHDPIYWWxno10c/xrsznIqrwtX+eqt57Mo6ivjcqaIJHgZBKMOBbojqB+5hc5SWn3J
         hY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003979; x=1754608779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ez7fajQ4lWgiIPATC51FeBxCIECW6n3uAlkHVBFvak8=;
        b=myaJRJfrDuVuiXf2/udyTiMcuLhfC4aRnNWKU3HM7SgnKRmQ8AJZBCYSQ4/JNQKuzB
         UENnV0xpN3X2FZ7ppA+mtGSbO2XKfjyNWgBM3D2ZsrTycAy0GFVF4FVdN4BwXMh1L0sY
         7hgayi3ungvaWZGJkj4ThBL8OnhJIGHpp6urmRgZQwrKu4TArkychKDHioz8ojFsENT/
         cpqpvyoT0YmOArYsdQ8oMVamQ18JPrNXQ8zFwsNXX0TAruSbi87PlKPm3CUsoyAz7x+A
         3MyOCVEYe/1ArQBEqN/Dr3P2HJ3p0RLzLNwLGZLDzJFLAwcsuZHz0Q4aDvAB5Qwwab51
         ZNJw==
X-Forwarded-Encrypted: i=1; AJvYcCVbFiFZeQ4Yd2nxsLe+V746sbyk3jtQzPtETodlbegyHWYCaCMZJjMhUl8JZ5inOGtdG2Yc324uo7M92g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6rGoxgVFqjXctrOidkGN+9N6SS7FXozMCSrswLyVen8F0GMhH
	c2jXWttJ94SGrrh8yuAwDVoDHCyZeGdArspEFkvoObgh+VSigNVHYja3e+4FT+Dt+6Y=
X-Gm-Gg: ASbGncslXv6MdTIkKTlxMZEcqgKQAyJEQGhi7X/2E5Pume29zAOSYwTTK/qPsE6oR21
	bpntnBUarMP7t8tX5dGlclfOrdeEEJyAuN6A0urHYher1NWbasny3eHjHPGWRPlyNAXSrhzqf2V
	0o3z2seN2GLtssquMgJw6iQCNBg4SojQt2tWxEq7CEEvHB7gNVGSCieiPnP6E9xQWQJOHyR1xoC
	vuxVpAgj7tlj6mFQ8K62h54w4JTr9SvaGbjrKqz/prxMbOPf2q5wTwZENfbg+ZdnseZchskz0Ip
	kZzMXKq5AF5EZO4t+1CQDftZTK9zGF7TNegWo3Zby6rJdEoGsEMV1BKi3aaKtapJgl1W7eOJ4TZ
	Z/GxME82xKlw0Z85I5x/PWIokxbQXFm4C
X-Google-Smtp-Source: AGHT+IF2xo1ZfVMwTGmqa0w+CJyQOLIX1YGoKzAdOOg0c/bt0OowoMzz4A7p4t8/qA7S3n5MiZF/3Q==
X-Received: by 2002:a17:90b:2b46:b0:31e:d643:6cb9 with SMTP id 98e67ed59e1d1-31f5dd7f18dmr11303515a91.1.1754003979507;
        Thu, 31 Jul 2025 16:19:39 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:39 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:17 -0700
Subject: [PATCH v19 07/27] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-7-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_161940_405738_1EC80A52 
X-CRM114-Status: GOOD (  10.53  )
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index c0d7e67c67ff..792cb9792e8f 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -431,6 +431,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -776,6 +781,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
