Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1393DC02199
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 01:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRKwbmU5qBvoQWc+V/8xtLYTXQbaV7ZdQ8JJQmB+HDc=; b=06ODJyuZNwfZ4M
	Ab7sFdMmyWxpDs9kmNnDmRBxNorupRxO1EuoCvcmt9NzH/mlQ3HI5z5HnK9oTRor4zzurXmlYSdSN
	NCj/vNAGaWgCR4LnKOaVrBR8IA9dZaxNY2bERaLPmcNjnlWOLMk3g6/xH1usM9rnXy2mw3p0R8+Tw
	G1gjJOsoH1nukou0HL190brdTG2DNPKZNOQe8zFs8ouXbGjGUW6vER5sKACEgY5FmhyF0BcQMvqe3
	oLOcA+MYguPMjSiqXZf+BILLJ7N/Y8mQ57wF2cd9hObBKW47pIZAFw/MOOjIuz0EoYAw3FsRJvJLs
	8lFW0LsrWIiZ130oIcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7G-000000021IZ-3MNl;
	Wed, 05 Feb 2025 01:22:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7F-000000021GI-0bwN
	for linux-riscv@bombadil.infradead.org;
	Wed, 05 Feb 2025 01:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=; b=M6QdiNEyyjZON7dFJBd+p6wDZG
	/NRzhI41j9+jmZpXN8J6+7L2cut3+rHnkcpHu1QIPEkhTf7ANXLo/7GrOtH0ZI8OKF2dwhoyde0Fs
	E+w1I/wUB8ScMeAAzpsFtP0wVQ0xOo1NcaQRZXFzzvWmnKEgT+sLtpxt+wv3RflR+bPIbeuUCYS41
	nAY4g4RA01DhLzlkXmX5IIezjWezbqTFATxnHjienbQ1PyRcojmGd5tsb5bjsYYiCV+3Z4mVXTvC+
	SR5S6Fxw/TjohcMx6Y741Rlldzb0Q+lkSdtQO1TBVbGtMRzjKqFhVGIJ0cOeQRmSSuxwnXMVXjQzz
	fUSO3kAQ==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfU7B-0000000GTo8-23ci
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 01:22:07 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2f9c69aefdbso2172017a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Feb 2025 17:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718522; x=1739323322; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=vEuPAuOw66q6qHMQ4i7+QbPikhW2qoRyCCrQl6cSIPgDx+fSf1BQsd5sring1GrXbI
         U9X0uRdrDnbmAd20S5R7VPiN04scvft/WI/s1HRjlRyueALmGcorNucCCpxWLYkf0Wbm
         iT5f1RdrP67OFNdnC5+PIaWUNm/hyKTqbEBB9vXH9uxFQvMYNY0IULsKPihEejtf330r
         uNl1NZRvaFBQ88JHpvxhrQ9zSu8VgrdOf1SqupSWKaRQ2pslyaQ0aMPO8owxPMWEuyOx
         7UxTRxVAoRRHYpc0URI+ZGhFMmcHrlSeXkrjBlQV9B1LaPF5TZHVUYacITERozd8o5U3
         O3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718522; x=1739323322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=vIKFWoZVogwo8xnNT6z1adpKDL9Ysg0/xfBU6jFMfuPGnVMSV6woyoUspzntpmT1RQ
         uS1kOdg60e6h7DfxVaw1id6pWRZzTYWYF4VNgHIupKyteo9CErS8yDXpVP5FklXCVR5H
         O69tJhPnoN5pSGx0Z5qIY0QPkUbeE/MVFj0dQwNuLcUa9aH2mJT69JJAHFvN7j+FHc7g
         keUDx/qLXQjzgqYlS4QNVe1WFdFPDkQVkQIiEXpqlj8ubdWOsjh8xFIzL8b9+hKmoXbq
         plxyJ2qSb8DjBRVTKRqx20c5/V8bzVLfQrg0XWFCuq8kdZm5eFulATnli2jk/0DAKjc9
         wKLg==
X-Forwarded-Encrypted: i=1; AJvYcCXCBLa+Lh5SyycGU8tAlTQjxKKBDVzySH4X4QckYuUsktWDKCDLxj+ZQLFcmfEUpkU1iE9evqKriLGb0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEpJQyL+xrFnPagFkCn8csn6N3Nl0HktY8z6rtHU1wF+k+QTA4
	XywdX667O1JfyOKedwOLaCvFwUCrLt8laoe7WOSD6EWjLrw9io8o+U7Y+JCGlHVVOoFavdPo+u7
	j
X-Gm-Gg: ASbGncv3pX6GC1UgLSAuDi6ZyeR5/jQ1OaYrMUzWgUblL68hyZKOsG8c33GI9VqbN31
	es5p+pA6Ew8045wxai3aebOgUyF4vX0Y7/1Yr1KxbYCWCrD2TMwTogpPh2oRx/n1PectDubSpUd
	YLMBDaQbDx7V9lME12PD7m8Qfw2L7KLswVpMiMqTPZSlDDl6d2wvnz5shgJeX5OcDlE70+0pPof
	xQjEKMHJDU8182U/kh+HoUP8gFxxF0hrhumyh7EeBvluOnjO6QQeDRGhvlqxeTekCvzqVmhml3m
	UVzc1tpvLGuz6TQqf/MAFsADXg==
X-Google-Smtp-Source: AGHT+IGTMhaxmFsvWrTefkXBFDqJevilxfDmNJ8PU7kLoH+rq+SB81MDslBfLWbGGJU9DTXRp8pAhQ==
X-Received: by 2002:a05:6a00:2287:b0:725:e499:5b86 with SMTP id d2e1a72fcca58-7303521977bmr1539398b3a.20.1738718521754;
        Tue, 04 Feb 2025 17:22:01 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:01 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:51 -0800
Subject: [PATCH v9 04/26] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250204-v5_user_cfi_series-v9-4-b37a49c5205c@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_012205_952524_288C576C 
X-CRM114-Status: GOOD (  10.47  )
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
