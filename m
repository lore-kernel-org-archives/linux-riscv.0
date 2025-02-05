Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A3EC02193
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 01:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouo6DX3+Zo2X0OcJAXK5MF+nGOnvNHn35A1HrfTTM7o=; b=pvI/15TNhOAkLc
	yInSXNPJn/MOrPa286LHzYVWsyuJuKOW5DEsvfvnBPG2vT17oWKBNu8LiIchCoBJiMplqlKlmmhkU
	cYHH3pCawh4F+JNP5s7YfTb86zshOCbOhMloY9Pvj9sMP84dI15yelifWvahjh4z4Hvn0+t4Y9YWm
	q74FxZ5LCsg6BCJ0Wdww3agWxt84q7E9BsBXOzuO/M7kS+TGdQ3+zSwFg7iAbgSege3MwGa9TwFFQ
	/thVyWtwffdNye8D4krGXDC1vBmcmi8uOFa8XiUofLN14ZKlqLvmCjz+rtOzmMJJfKpkUXGYQGq/Q
	n7gvZEQqe9545uTnEaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7H-000000021JA-1nf1;
	Wed, 05 Feb 2025 01:22:11 +0000
Received: from mail-pj1-f47.google.com ([209.85.216.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7E-000000021Fi-3IDb
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:10 +0000
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f9c97af32eso1664747a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718527; x=1739323327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=StXbW+hdl67X+abPCdOO6KlatKxlyJSea1Tz/g9KfYmy/RTP0Kgh3ylzBzi93n0+GI
         uq0ut9zog51mj8Xi5BpQvnlXC9amtkUP16Y0RiiW5E+MrUT5XV9IVNZGlEb3/F4bdtj5
         IF6AyMzortfI5OVmb83bosE7IqfIjDtPYrJL3IDlsIKptGMC5QVIU2qWlJ94j4239Pur
         wnOkeg734+NgFBihLV1L5u3dauEC+myKcTIVSVbYoDfLzaOWi42G0KizlF04ojo+pArK
         Daj4rUT0x++PyYBHEAQevxIaROVO/y+EdTTJyVjW16bkG/t6ys6x5ILsW0OtipCQAqHM
         lFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718527; x=1739323327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=TCKkQ7R6ynMXNBpqx8PJyE4zIgZ2PwcRshURQQOgMr91cZ+3kt1UhkVGQfnqe1CcKU
         uA2WG9UPgpqnyEFaZ6YUGPYHjkQUe/hagdccdVDfx93MLwcBoeVHvP78UEvlREtmQrgT
         KCC6unNhVh0JlxR8MK/1U4uRaGe27ddpRP5WZVDAuMBQeYOVGvt3Qn1ttvOiW6gofukE
         i8dV4dSvvs8CJvCBfFdbcQPT2VMVF2KHcYiDF5rN9B8mngh8Em1vwmNE0Pi5id2h7Zsu
         Uon5S7omvPUP4yxLINVJPjHZQdCFw6JNJc0AloqOJG3SY9AZ2zJtShey16aYuDAM64XM
         ZIuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN9X/rjKyuyISyF3NSCdeX2ibEhnGftY/vVmYSED6H6tZ5UVLju9O8VPLnRP2/fk0oqbNWaRl/Akwm7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmm7+Pj2CS7H/IxtPHhhAynfxCzXF1pL8F8l2t/xu8aulUbm8V
	JgzPg4kNnvTS2VuRsyCnVFhBpOPfg9rK/YYgWxA5CPw71yESwogDpvE4bo4tr8NN6MFmXbBrozY
	h
X-Gm-Gg: ASbGnctFNl17ubS460b9AsnZwwxPnhpTbR2P9JDqCjma201MKdF9RCgM2+JFCvMW0NM
	BSc+laoGHw/5ffpuu/j4272irHQXY73J82LNsSm7WMHo3hYg9GCxKoh5TWnliWoahv41k8v9oNL
	JHQUKu16ouOBvJBYXNez9n0H+IEjKVFqjOaiRkvrD0domtygm9zm6UGoPXKqBbYjJ9D0KJfoYI9
	L3So3NXf6hEGiFMRN7PPH4XWfLnYQq7cA0oFLwqwA4+M9XogjD8b2mjS/n2gAcXt59nuK0GWlvh
	OX4fuIvy4qg4UbkzU5h2IGm88g==
X-Google-Smtp-Source: AGHT+IGqNdkqdj5d5A5aA6gKpwq89EtcxR1nZ3Ul1+SB6k4syDnXtWKiLDwMtPZuQ0/gHb49XAPbWg==
X-Received: by 2002:a05:6a00:1d88:b0:72f:d7ce:4ff8 with SMTP id d2e1a72fcca58-7303520d315mr1572110b3a.22.1738718527421;
        Tue, 04 Feb 2025 17:22:07 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:07 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:54 -0800
Subject: [PATCH v9 07/26] riscv mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-7-b37a49c5205c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250204_172208_819872_F19D54FF 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
