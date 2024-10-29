Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 606BBD7494E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 23:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUBNFGC6zfbOjxIvNgkormJ88ws7yONQ25ut5E7gcRI=; b=Xi6zRUANBfw4N0
	gv0o2SL7m1mlN6Fa49asLwCsc1iRJLrBpTmznmY2nWInex45QAcleE8iwSRk921gvbnsKuF27z885
	EQQp27B90G4dM7AIz/r1xdeLA2k2aXZVnfEJfru4j/+TLP0lPtre9Ur5UOFubR3JvJ9I3hR90CPS7
	eVsqRZH1FXy8f+6QmbGX2Irsq8Hw/m6h2NMnM2We9OM/kYuCQRv3nNKIxJv82/ef04xcNNCSs13ej
	zd7H9CfDcsW7zECw3MPlyhGeSy3gQ5i4M2dIRdjGLxMalpbMXbcaw4/8NymiB0R5Wgh+XnARZF/rZ
	ZAEVi07w6N+AfFiPtuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vuy-0000000GF5q-0k3d;
	Tue, 29 Oct 2024 23:46:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vuI-0000000GEVx-0iFi
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 23:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ev1Mbj3LeOLd13TT7hxU6pIG2vcpaYTYXYx00sbXeTw=; b=koUJNgY56qsizXXWsxTY2G5oR1
	EpLsRwTWAkVV+VYD9q7tGwCAZ50WVS31C6SmXuLgShKJOeXGAcZ08NEh7Iu5/e9FHsqK6pGGu3kEu
	RBG2g6mRlrsSPEDPOKTLvBe/f3Qhk+m2CYDrCLDea80VRlzgThzEc+r5LrAOLNYRkfqpjlK6Y85Cb
	amKFgIpDVhFBC36hHD5+7idEY6ndM1sPftxAxRmn8w1yN+2qm2GP6/uxkA+LHQLSMxkscAmROAilA
	S9oyjoTf3jpK5fy2JQoJxKhs20XjIc8zEiQ+MxIpkNTRuYfsert1cvSlQVhzQJEivaheZrLspNRO0
	Yk/a+uaA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vu4-0000000A1Pe-1RV5
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:42 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e7086c231so4671880b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245532; x=1730850332; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ev1Mbj3LeOLd13TT7hxU6pIG2vcpaYTYXYx00sbXeTw=;
        b=zlVTA1vFqbrVSzr4JEauBBweBxXD/JWL9xdY0kvut37ZyO4xOm5Pu8N9ZkrCtz+ofp
         oD20IhVFZnyB44zM5GenTNJYrw5CU64BWISWqBbqEW3tKv0iyw6Wx+5OqCJ3FPt5+qwB
         pFo/O5nNTWbN7zmmGGMnUJCyifuCNd+DGEEEBKDmJw+fr2e2ugBIy0piti/59ouA2cBm
         GjqLMfaB3jyoxXd1f4EU/NTL5ConHrY/BM7F5Pg4Aj70UvJsn7GrjBEwfy1upNIRP7d4
         yNdLafS49dDfsGv5xcypli1AWYwtJrZOCLRe319mV9xuAC+t7Sh5jRTL9dm9ZUaZ2k9I
         JACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245532; x=1730850332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ev1Mbj3LeOLd13TT7hxU6pIG2vcpaYTYXYx00sbXeTw=;
        b=JfsB3aRow1jKtpz7diVds7iWkJJCsO/oHA74nyLw4rv56RdnlTUTp8FJuHx6NH3+6R
         ze5WLpreQrZgdYmgXI6sg+GZFNMhqJ0KA0xW1orqK0zPuzkHlOR0227P/F7UR94GWn40
         XdMjY/MuR/1FzjyXLzxN4xPItiTVrdwlMBr1I5OYKL4ABfAlnJpxeTZwWzNxmHFpxS89
         6Te62Q2UTq3wh14uCQ9LZLCjrAGLXLi1EBv2j31s8pQmEDk3ZopH0J37HI6V9PLA+nde
         P7de5poC6T4P9tJPdcbYMT0vH7nkgAMmXtiTBIQf7p/DARI+VYb40Xc89kjc/K/W9yDN
         Xe9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr+bhAZ698ZDm8WX7Vgg5uy0vDMJ5/FK14qtAZ05fwqbSVEW2enV/cxE9ZWCe0KCJSz2B9P9wITDRswQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8tKHWN9IOQ4SXtql2J1STEbYlxOvBpqAvDf1J1o/a9G3JgGuv
	zCaJjDcqI79ShTdwL6VXjEW7kLOeExcvDyQe7oX9uEkX8b9d/NdgOePk/Mu/DGQ=
X-Google-Smtp-Source: AGHT+IEfSyF62ivzJTKgFpp0kGdt3sdSzoahMwleruIgutJftkJDtf+kKS4NEl+lwlKC7xKag1P7PQ==
X-Received: by 2002:a05:6a00:18a3:b0:71e:6c65:e7c8 with SMTP id d2e1a72fcca58-72063093579mr19109726b3a.23.1730245532485;
        Tue, 29 Oct 2024 16:45:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:29 -0700
Subject: [PATCH v7 29/32] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-29-2727ce9936cb@rivosinc.com>
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
X-CRM114-CacheID: sfid-20241029_234537_400420_69A0519E 
X-CRM114-Status: GOOD (  11.66  )
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

This patch creates a config for shadow stack support and landing pad instr
support. Shadow stack support and landing instr support can be enabled by
selecting `CONFIG_RISCV_USER_CFI`. Selecting `CONFIG_RISCV_USER_CFI` wires
up path to enumerate CPU support and if cpu support exists, kernel will
support cpu assisted user mode cfi.

If CONFIG_RISCV_USER_CFI is selected, select `ARCH_USES_HIGH_VMA_FLAGS`,
`ARCH_HAS_USER_SHADOW_STACK` and DYNAMIC_SIGFRAME for riscv.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 22dc5ea4196c..53f367609c70 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -244,6 +244,26 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool y
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select ARCH_HAS_USER_SHADOW_STACK
+	select ARCH_USES_HIGH_VMA_FLAGS
+	select DYNAMIC_SIGFRAME
+	help
+	  Provides CPU assisted control flow integrity to userspace tasks.
+	  Control flow integrity is provided by implementing shadow stack for
+	  backward edge and indirect branch tracking for forward edge in program.
+	  Shadow stack protection is a hardware feature that detects function
+	  return address corruption. This helps mitigate ROP attacks.
+	  Indirect branch tracking enforces that all indirect branches must land
+	  on a landing pad instruction else CPU will fault. This mitigates against
+	  JOP / COP attacks. Applications must be enabled to use it, and old user-
+	  space does not get protection "for free".
+	  default y
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
