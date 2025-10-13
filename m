Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A490BCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 21:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYfhBxPpzfryCw5+qNhC9PZEQGs80Nx0mdRBdofQvNY=; b=xcmr8KE6K6A/Ps
	DnQhtX6x4GRdRmes/VUoEoWpq/0Aosto3RdaEeNF/LSMbUYBAHkNNDyHunCvBo+UibkZ/Q4ek2Dz4
	EcjB5stKiZV5FSObwVMobKY90x/f6ZN4BhUuFy1RBLjLRjKxwKQ87K1KXD4C+Ho7ROHOQsE9/oL6U
	//Y740i1pQFVeZWYWc5IxqhrcGF/Pg5fz/TJ14qcoLrZpEcMigPYNFBezDGdfroFMpIKyXQ/DB9XP
	hOc27DqZbh+6imESOGx0UYFK7I8MdTeTfYch73ObdzBE5EgYldKwz7atb8zTsanfTfMsiS5Eh9Pcb
	5zcbd+GQuTOG2CANid/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWg-0000000EaY4-1dmE;
	Mon, 13 Oct 2025 21:56:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8QWc-0000000EaSp-3bRs
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 21:56:16 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so6604603a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392574; x=1760997374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=IKiMCZ0byuNcKdgDp5T8vjPeONExdCoxTR5bPQJiXtWHN6vdPTKWIXdeA0CoOktiJS
         g4BseAINjWmlT7MzIRu9ssAxuG3rorqp6K94f/g4Xl/05dR/ovGLfiQPX75KihhJY3m2
         0saIpr+d24bs3PP6AOJQYj1SiowSiD/gYhLqIqWkDEaktRKE90jvHBtNSdGTk6UMjgN8
         uPe398dShrILrrbyMAeW4vRbnoI7buetOrxyVVsiKVQQGLmfl3Gcm/eJ5ou6tsp+1v3/
         60etygQer1/0rj3tC/5uS+FlZWNVcGcMGkxGA3Rz79kYzyB7atF0U3AAdZdQO6G69EQG
         +LgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392574; x=1760997374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeDKcuIcO6+2FhxyceVVS2WWiuktyVdq1WpyUni2wlA=;
        b=FHbSLmgpaQ7zxF09Ur5ZmOS/JPNowj7vBpplZZly8/1OH7dGXSSBp1+6d7yPc8ZSs1
         I2dg0bYr4luXn7a8y8ahJftr/mGteR9r52XFJoHrNkGMEELpGs26gDBiKdOwx6Opj30R
         dwTWrvbJVTe0+0twaY1iToeMQ11S0pB7Cu2erjnVCF6qusx+FsDYx7fbtRfllqWhIEwA
         vOheZL+dF+rpfWxRKU2tHJkkeF081FQrch0a/qo8R2ABa4aDMkYx1hfrQmuqK4Z3W4vV
         YAwhsBdei9QgQBHekSDRjkOM6QfZon+UYP+D0i9hh6QuJj4xf27HV7kJCnU5CHBBKz7U
         OqmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTDUTLVNbwmqy+14oW4P8+DxMPwSe7hkAiIkYV01bFp5BkgCxv8NnI9zdqyRXCNOmqd17+YzyrTbSoAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlIBZ/+79MTuL7n08N7bJMGt/U7WTT7cT3jTsli6yKkfqgAL1R
	zKv8rrs2JVlz/bJbYZCAc6zUymUojsJ73BBAMZeQvm/vnKj/zQaHPQEFj2SRAnWpmOU=
X-Gm-Gg: ASbGncveS03nJPJ4G/5pk3MgNALyp0HSqDylAjymC8iDwAXg1J7MsCYKmCcRQvQ2dnc
	3m3r/uM13Q2Drv8Z0XtLhWL2FeaQUZD/kpq3RQcdix9If1rUH05RvDXBDC6s5Ne0fZ6WG6knj1w
	YwDPNlZ0T6D1NK7AfZztu1YrnUhKDjdaXNpJC4gsRzqOpbYyX74yIJ4XqrTiPtbkJ2/4K//NYo5
	0YtB99eVJVovFjX2cBnLCC384ae9zyvFlH22o1cTcyvg4RyUIYA9YD8kkliZWu7LyZLQqggblSd
	08Q+zIrAvKS5+Syj6kQwf4GQ+GBFnlNBId95XnShP6+ClOJKvsa5ozq05H3/UDC6mBYrHYhIIlK
	iq9HUxNhgLbxG8uUo7g8N4ACdQIAyGRgKNpUCCYSJ2CDezS6QdHcqSeSnRzEgmA==
X-Google-Smtp-Source: AGHT+IEUAWjhmzUKMOgHv62clTaql2Vz2Fmw36KBCgN93ODbgLaTEoxZmk2agT6d2TO/fNRpseH/5Q==
X-Received: by 2002:a17:90b:3d87:b0:32e:d011:ea1c with SMTP id 98e67ed59e1d1-33b51112272mr33908736a91.15.1760392574224;
        Mon, 13 Oct 2025 14:56:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:55:59 -0700
Subject: [PATCH v20 07/28] riscv/mm: manufacture shadow stack pte
MIME-Version: 1.0
Message-Id: <20251013-v5_user_cfi_series-v20-7-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20251013_145614_913217_654FBF0E 
X-CRM114-Status: GOOD (  10.11  )
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
index 4c4057a2550e..e4eb4657e1b6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -425,6 +425,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -765,6 +770,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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
