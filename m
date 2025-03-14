Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED8DC282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 21:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRKwbmU5qBvoQWc+V/8xtLYTXQbaV7ZdQ8JJQmB+HDc=; b=mHoAGAzHjiutfC
	2r8VZc4bbGVlypPjdgrhL6sSqoAV29bdqdpGeNt7azfE4Ll1F+3882BoL8TT86DOZTxfUsC5Qs5zt
	JBK1Z6g1GzpX1KGJror7Xr4WpJ2lyATtqL82HFlhVTgg5v6PpNgs+vPd8Eqycr/1A2pm/W8TuLrrB
	wYYFCJlcXSYlfY0c6sZN6ApZKfHYo0EXQLC+XOeJOKS7eAnwUEadrjClZft9CXVWF/2BdKXkMraP/
	b9s1dRY6vFjcHmBjYC8j1mSFA03OLBjQHWnybMgJqDWEDMGR2XoX4Kd37OBnH+goEZDaZJuGHNFIn
	Tvcy+dlNYupTzInGtT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkm-0000000FKKh-1MgC;
	Fri, 14 Mar 2025 21:39:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCkk-0000000FKI2-0qKn
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 21:39:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-223594b3c6dso52482595ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 14:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741988378; x=1742593178; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=BFIG+6dd78ospSgFkUDFMq6V6JOv2iYpPDSeRIIiq+ZzxCalVSKeRiTuND6mJqJniJ
         coXyunS3N/IuxZPHfD0P86HdH6PgH9+QIKesjzGyW06G97uGGYyIY7yeDJQGcSU8N01T
         JWM0OVZxUWRypnTTeQA/ZeyTz3xFNLcSJ6K26WRMNSzIrGJjB549fBaIxom7tmREJ3qY
         1akZB6Y78QMwsZRoma5EaeqFQ6OQwKNIChsJfkKbujgc5c6F+AkKJ2+9I0uiQW9vkaEW
         mNu8hqD72mgg2JISB/3UTkAXci5qJak+ogHseLbgkPSO223krwSc8dflAc0wvw4Cu09L
         u6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741988378; x=1742593178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=U4O1Gy5y/Awt2mfJt0A20sAJ1F0TuzO5ZC1fK6Wb4yoeMlxA6Xu5ijTWZgOA/snqbJ
         8zANPtq45kOTzfk+xqwtO3BDiLdrbozxJt+dDlFrNoQdpUvB80wl7ubw6b8LuzCgOdtd
         TgKgKNb0KTQiHm6zy+kgGx5/W9UmwUWCxuTskZyV1cqskSXWTdgRl8jj/prE6PK/W+qM
         IzvYtXNtjvo09uwacKyvwXxXo6LnyWGoks5uEl3Cooo1bnumvOlQ/qeAbRo5paRnN0xX
         jaYdFnI0nTbeds3bgbYWDhmWses8eDz/eKjix8ZsH6xufltrzj1iwk8LLXCuUAWGhYLY
         T+qg==
X-Forwarded-Encrypted: i=1; AJvYcCVUcvp+Kg3P54tYb+hUf7fgNSf7r1ufIglTW3UX3v+jQ1k5VP4bTUB5W2ERdydm1VKA2yvyZ+57ToEcvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcPBAKDaU7LlHOQMicFXJJAZxN/KU3tMvyVKhZUh8N+WcSxOQH
	AAnjzPuyQfKop43eu3SllasSO4iODuhbzlaP3T7OYL0aAITLU4mbJub4zwHfHxw=
X-Gm-Gg: ASbGncs6CywNGbdUcvqeUTnMJDNsk4SCN+LbBu/TpZStrRTcxw7Li63a1TIbI5OBm5O
	WzN/V2fRZfeAzK5oRon23wALODzmSEkUoaP25q0Lrx1x3QaTnPsxCOzfyq+tGAp3Pvn4VS7p51M
	76hOhkD2Txd2gZa2WNdWENsrcrOxBSnhk3pULNsKSDHiG/8HtBvSXK0dVLlkyu+LdmDQFA6Vsoy
	07IhUEG8zQDFmlImMjFfepgBSp04foaG0WJXL151FC64ePBPFQURTwNg2bHW/KAqFe7lByvkyBC
	+YZNUZQf8mvQzzzulfknBVoOTnheyHtDNXIFTvs3SdUs1JkI9hj4g/mlK4cle1KusQ==
X-Google-Smtp-Source: AGHT+IEd6y00tJpY5AwKZ0G453WB85qrfmfVkSTQW7JFb/Aht1BlD2RcJLOAn300bIU+BiCy9clyEg==
X-Received: by 2002:a17:902:cec5:b0:224:abb:92c with SMTP id d9443c01a7336-225e0b19692mr43817135ad.50.1741988377710;
        Fri, 14 Mar 2025 14:39:37 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a6e09sm33368855ad.55.2025.03.14.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 14:39:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 14 Mar 2025 14:39:23 -0700
Subject: [PATCH v12 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250314-v5_user_cfi_series-v12-4-e51202b53138@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250314_143938_240541_CD5865EB 
X-CRM114-Status: GOOD (  10.21  )
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

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 6fed42e37705..2f49b9663640 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -212,6 +221,8 @@
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -230,6 +241,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
