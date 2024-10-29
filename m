Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A57BD74950
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 00:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCZSQ+NCnrrSJN9OTQN59Fo3vPqsQcN2eGTS958gY/Q=; b=ZvNZRqZIn3HggQ
	VcXie45F5ZR2SjbjjdSI4JwL2gLTERCVs2H4gmdlbauExsWNr+K8nmIeTxXqkH9kWEbjtyhmcGtSY
	eXRZ2u3LSSE2lGOA3TbcIqfFFyT88ubo6RKsALde6wkl806L3BhZKLWqmxbTlhVE+HBdZkicR9Zal
	azK09yu2i5bQADHY+w7qbEw//HUjqA2DLih4ShwL2UqyHLd8VKnaBKqKWmPgDv3cuZwNdT/zUWIYa
	uN7coErKamany2MV0tdP6i1SKHZVukoZQg690QNEIpdGpyQbkqDQGthkc5DlWPbMyY5oYQ1GZKdO2
	8/P8P4HuIfU4LaPFhgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5wqD-0000000GMOT-3ySp;
	Wed, 30 Oct 2024 00:45:41 +0000
Received: from mail-pg1-f169.google.com ([209.85.215.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vt7-0000000GDRS-33hM
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:44:46 +0000
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so4653387a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245476; x=1730850276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vc3xum6aGJsQxt7BwGXU6tv/D45yqqkNrU/wViua7no=;
        b=BvewDq3FHMbrNz/o0S3ZsoxQufvyHnk0U5nH2ItltNmOG6DhP2CXCr3F0EFz15NoT/
         EORlmix7uMb/tmzQdMG04KBGr9xfvSHSZKVBXS79P1vLWi1LHbK5noh/A2DhYCuG+BHv
         maXDWD/UF2HWKzDIpjCbhqdOPF+nyqCZvLgYn9AeIbv4TUgkh9AC+o5GMhEW8LJ3Qfhg
         fNUokxjAA6Ph7wYUvLgdq2KLoH1NE5//3lxNqtADm6gIkCZRlyB2QudzWO+DpNfsi6nV
         +FFS0DlvRGwMJzg7vJvRkCgw/SZDqhRMk24LF30AGw/ZLM329Kr6zRLD5/Ge73dMmKKU
         /ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245476; x=1730850276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc3xum6aGJsQxt7BwGXU6tv/D45yqqkNrU/wViua7no=;
        b=TsGhu8MQKRI9ZO1yW7x1P2BksWtPkqvX8G5v8TpAWtAI1X7qIJ5WRgOOXcT4LhfT2b
         Pb8JHJRTqwFMIzWXV4fEJ5MNiuhTQKEYsXwOdrZyyd3kvs2QVgdtbLoPOqkZYm4nKEZt
         uPovHw2UggZtnzE12XcN1gZeD4TugPkJpGejDQ7yjpDn9LyVEYw1iZtqNPDRAr0VtJth
         jG7ztWSkdGUsolVrVHWpknsqNiLOmAzAk/5IOD63yHqqDC0vC9xKwVxeJZ3hlbSjBsLC
         gGiYgogAqaSErSUFuwQia3P0sGiWColNklO3J4ltm/Nb5Ulq7B1Fm+FNnW5PYZQsoz1l
         46+w==
X-Forwarded-Encrypted: i=1; AJvYcCVis5iOUZ1lrS7vAGKkq50tpi10XhOofNPKGJQkpnseIOb3cdZkqIdf/0hf7JeLa3Z0OiH90DdRQpVRcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG5PRSUSsYFbJgruFfKIu++9hGE0B1jQChdPr/KFinP+RLg/0G
	45h6zLONODlMavWE/i9Yjxr05RcSvud8Mvd4hK1RHlchyrbvOHGIx5LO2+EXpuQ=
X-Google-Smtp-Source: AGHT+IGvhAl0GoTCR6wpiYv9Nay6FcDGtnYTBZHKhrK9M6c3oN51TKIQjb4l2hAH4eTwfkMYzc6GGA==
X-Received: by 2002:a05:6a21:1190:b0:1d9:215c:c63a with SMTP id adf61e73a8af0-1d9a850aaf7mr18291142637.47.1730245476543;
        Tue, 29 Oct 2024 16:44:36 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:36 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:08 -0700
Subject: [PATCH v7 08/32] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-8-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_164437_868600_0B459775 
X-CRM114-Status: GOOD (  10.72  )
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
index 25966995da04..af7ed9bedaee 100644
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
@@ -197,6 +206,8 @@
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -215,6 +226,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* symbolic CSR names: */
 #define CSR_CYCLE		0xc00

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
