Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEACC35FF2
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRKwbmU5qBvoQWc+V/8xtLYTXQbaV7ZdQ8JJQmB+HDc=; b=heKUtBxp5cOymv
	rV4XFTgyfO3ZhNG/ykzK8SZKs+yVVcO9jLPpIeEGuc8dMZGNXq1fhI+TZdpGtNILcGe86p5u9brny
	iOb3V+C4BSBfOAGvS+Z2JowiRAJUfASJeKPGFci/2CBkR16CrsTDkBPgnkE47PbWvJ+xbGCWoC7u7
	nCHCxqjQgaNTvsGg7pVDaJCtVUPfGHsBjCU1dSRHzk7WnvsbI2yCBC10IVtUccwC+iQrZ/rpPJngV
	C+KB/ib90EAwFXCFPOJdDEwAydpp2otoDDvg22xgeh7wjTxbYPQED7/2EyaWBtOHiATLn9vX4qb6X
	RjHn/r4Ot+qvIVhCe4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfGs-00000003DFw-3y0i;
	Mon, 10 Mar 2025 15:42:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUp-000000031Uf-2SpQ
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Mar 2025 14:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=; b=KBfuW6c04koz/zajbUFxA9X7cq
	t+VWpG38rP/b2W6dHbghYfFgbxNL3IX4rhnMYjEQ2ov5rFtfNgQ5Uu07rJ4Ob7e7CgUirw7kuf7WR
	SP8Jk09vWwj3FJFhkXZeOEzEs/1bvWMIWn/Q2kTg7TSgNemcDhKh7CIN9siFofTgaFuHbaa1xBAR9
	VI3OmLk/tU6uHjYh8+/JHqxI2RJFTYK8I/9/mv4Nbym46QXyb8XkRwaSqVxPJ42Qw6PkSO06ddDF4
	5DpgbNBcHrWzqiP7aSXd71ce6xCww286o5A8/g+r31p230u8s5igWkVk6sG3hNmGEKRb6poATQhxn
	qtbaKy6w==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treUm-00000001sEv-3TCw
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 14:52:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22355618fd9so78425085ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 07:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618362; x=1742223162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=crjsm9mYsUMR+T8LX/HeNAcv7LogV5yOUemA56Vkez2pdzcmNAlq9h3I369LIMtsqt
         SvlDIMX3qn0sPcQ4xnsN/QtaA0RZMNGjsWTi7a/3GHPJG+0/bgWueMsNw6tiSY2ybdIO
         4nJ+9wUyBmIbyOksXIxsg+h9hddGHpHZxt1MhastQZ9uDRb8y+53mCkxYSUPb/Q4R6mJ
         aYkTcoNeIGjmJkAoY3Wt3a+Fs0s5D1iy4y4u8VjHOb1C5V6UqUd9Zt/2GBwVRh9z9Jk+
         nAUykc/c3jdTcD0ZmIi6ZQJQW0LKCwbeAwJhjDQ6qQHKMNZvVDVHjvCbPbHx3r04Ss8z
         hHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618362; x=1742223162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=ao529opInyIRuET44ARjlTMhFy7mCEDo6dW1Rv3w03Q61ebDz4thfXU9t/ywFn2F1+
         vcykqIg4Nzy0E2D1faPmLlSqDKoVAlmvKQw26+u0Yf0fZERXOrKFv4B1sjwyMxUvohVQ
         MAzsvBuZT1hUyE2SrXzeFjlHFxEaxtarFn0kO6BtiKou0rjVB3dpS8yj70k0puk/Tt8s
         AUZUookjoYs5C8QGrQuxBoonag7v0x0tntw1Bq/9kF77KtPz3tzCTKxJBUhAU44ll5vu
         SfHtJvZqel4finrKKqen2mW05ExICDc53BOqg0YAQQfhi+5e4A2iFhPrLtNKYHBSBE9y
         zVlw==
X-Forwarded-Encrypted: i=1; AJvYcCWbFbngmx+GXlizp1JP6VQyFOu22nY82UgS0E+Ypf1j6UIzwGRdsTvOtRgVFAL+kEgolpyxa+rocEaqcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqK33LuZQtMX8+rYriAXxWLk4bXY0JsyzuMAK42vTL7J53vIRa
	JSMpoR8CY5nZqoRNwVNpoFm9pgxCm9IabkF6BeJVLAigBwMkvmrac2YnmO86tVI=
X-Gm-Gg: ASbGncvDbz+1v2izHE/KCSS8OPjQSZkKuHqAcZMFX0pjv5YivNrqeRTcLOMzCu3CwoV
	3V/yChiuO3iSjh8Df0qBIdf2nKGvXg4ewZluYd94DaYd7TP2f4fKls3DrKe1hycoV5Ph/+FXmqp
	k3TopJMjqtB8k1E5BgPAXGYCLxW/jhLBjooCP3QxLnbgRNQo1aHgik9P7R2Ys836ZJS36oJiH/y
	zN9rxDQ7BFIZfCwiqQjLXGJixuTSklU5dJPzc6WfDDFTVIPsffppoHQCdUUKsi6lFzcLnHOwMiR
	XiUv8B/yIKGi7fcTUQVGARJCn9PoD/Hevnz3B4XGxwQWM1lAcTBuBq0=
X-Google-Smtp-Source: AGHT+IHEgbV38+kdB/KuKTC/ngiL6naw+4KBErVaQq0wSwONUo1ce4xmBDTiHE9RxDA/IFBRpdqZjA==
X-Received: by 2002:a05:6a21:1fc5:b0:1f5:6878:1a43 with SMTP id adf61e73a8af0-1f58cb239e0mr144294637.14.1741618362407;
        Mon, 10 Mar 2025 07:52:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:42 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:26 -0700
Subject: [PATCH v11 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
MIME-Version: 1.0
Message-Id: <20250310-v5_user_cfi_series-v11-4-86b36cbfb910@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250310_145244_974674_AEA6C599 
X-CRM114-Status: GOOD (  10.62  )
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
