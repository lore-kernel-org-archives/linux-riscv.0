Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05886C54F30
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 06:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoFUGB2qu9orwwCUpI5YQSZJXCGPZLo3THL1eMKTpAo=; b=BwNCc76bqe3YPc
	23OHDrRE6Nd3vnFzfvG0Fwajhl/XV7NxGG+pfpQB0jd9u0ZwwLjFNnfHmIsyXbeN8DsnyMv0mTHj1
	O7DStBJ6JJIeuYzAEs+g8uX764kY6LJUrahPtzZEQNCpXVC6FnrfjwfCUI779Loc4n1vSkcON1NNf
	cabAhpegBOPPM7V1I9cvKeYNhe9rBhROMFzpkvk/0mGJapMh541eAtNEyD16LZZNnwIlE5m6GXXx/
	+6Tr7XnMMUw0WGP1/MDLUOhh90dUayIflluPqK+JPJ5UeT8AMYdnAvJwn/COTSes/wQL/Z77jY1iM
	b15OAVS63lQdHpnEte+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIM33-000000037Wf-0n7z;
	Fri, 23 May 2025 06:38:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL1K-000000030hg-3NuA
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 05:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=zd01FxT3OlMOzWqIaODnmoUPnuHtuVmONb+HNJjd/YM=; b=R6KjTZf/9Wk9VcfIRK/LAzj3i7
	XAM09PheEFAMh/LEmIJ9qy/I18DOjazGJlhIag9ZNYAd2rGzeM2AQavhdFgleQhmv6S1Fa6hy9JBw
	4AE/igpMMMNmXAG1uzp4oz5yd2IWR43FnIOJOa221XNSNNozmWErzTU/2JLV71T82kv8PCS7ApPDi
	vCJkYlaGpbqsRAbxBHktnrcUaYaP5bp9uZzBJHoF5Xyc7RnlDiTwxB21kf2Xi+QrbcaIc7MfsJFKX
	T/ZD+54ehmAR1GG5feRaPUIyYSMSD+PxfjPnvj0+7ZOFEvFnyIQYZIu86ds0hXeG1yiJ64steTJL0
	LF0zpJ+Q==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL1G-000000018tY-2FMv
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 05:32:37 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7426c44e014so8440318b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 22:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747978353; x=1748583153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd01FxT3OlMOzWqIaODnmoUPnuHtuVmONb+HNJjd/YM=;
        b=tGP6PTedFyonbuPGK8VP7SaBVs6ZB2aWsq79xnUShJAQjJWqv2FjPzaFyi4S21bIgP
         EegBp7MO9wsNU3c+Nj74Z1sS9ImfifKWQTQaim7vh6/6ZF1n+JTRu229o6nwtlwLWmdT
         +2JC4MWD/yf8O4Cs4wdkn1lDCnn/BiWayvd2W3Lx4veMN4RuVbLzUo9weQb3Sj887jhJ
         195UdX4h0d2+DCyhEV+HffYHeEdDpTsHOVdNcejU/vWN7V1lUhxVm6cQn5spZk4XtQi9
         zKzh56TGP1TwTIMRHqRwESigvkmzE1VRABSBgm24NxB+8LETlfVOYBqOSufwgNf7rqzn
         RX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747978353; x=1748583153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd01FxT3OlMOzWqIaODnmoUPnuHtuVmONb+HNJjd/YM=;
        b=pSR3CCrE+QJHFYctNLXQHG6zy8Lzh4TrQjvwLZUKaZNUUcsxKKcve5X1XijNtBzxsl
         FvsidkKvUsw+TNDUHp9jz4NFBH5m3rNGbJi8FcB/9aBlT6N+1FUTRFAK/Eo5Txg2t1zs
         8irXDGTvLjR911pVbYLftRtNGrQ+f3LGzcKc7Hid3gMkwSrm+95h/Ig8KyTb1/j2TiIf
         CdUsDnksmUh6BaJePtdJO4WklQ5ZQjDiRXlTULR/nXXBcvJFDGcOUtfLcYVf3Mjq98Pp
         A0jABh28BdBDcjloAFBBHSXOqThz7gkRMvZGnHmpv7zMJlIYrDwFYGiNssiDllREzuTQ
         V6og==
X-Forwarded-Encrypted: i=1; AJvYcCV0g5lCQ/vBbiwQS4j+pq0g14GBGEH5I6g1y+nV1rbDZ06RvSVJ8Yymn+UtPZ9Fc6kul9zrYPLqnIV+YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN7KJKxr4zoGSKAiG6KmxIYxro39rTJbVdsY9puVGRH0hfKcID
	GfrPe0t23XHKB68wpUa9TlD36LNY7cZtacUIHBpQLbfTXrkUEBu8dMepPeI4whN71kg=
X-Gm-Gg: ASbGnctPTMxOS+FAeILlegISA5dYIr/yLWgqt4jEAu/V5FgN66Zc+dOlCSrPmiuB3B8
	+q+8LXsWzd3QrLHGzZZdtQM+UU5Dwt7NUVc4Y+Mqt5+ONusT8zkRTmwOUvg+soChSNrvrxJC/2c
	/x9iY6KK0419DkP6zXY3BdSUNpQt7gQL6gMOWWpBwSkD5vp8QrMDAGSA5gJiC0Zn2lJeNXew85Q
	4kolVuccAXHddyqpNJQKNijp8f3XUKrZil+JC+RnLf9/XXP93YPK8jVDRhYQRk4xOmDDMPJkdAZ
	9otLvxc4Pd0qh0dNP44x9U1l9JoBAFYX9TmAty6G2PCj57EBjhflIqGluPrHdEHzsqt0mMkf
X-Google-Smtp-Source: AGHT+IHiypBZn8GTV0A/2+Gj0eQCyN8j7h3oyPr5Idne7mafOFuM42ePJJ91A987vgZKpCGw+DfvwA==
X-Received: by 2002:a05:6a00:2790:b0:737:9b:582a with SMTP id d2e1a72fcca58-742a98de014mr39044316b3a.24.1747978352881;
        Thu, 22 May 2025 22:32:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a0a4sm12474336b3a.101.2025.05.22.22.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:32:32 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 22 May 2025 22:31:27 -0700
Subject: [PATCH v16 24/27] riscv: create a config for shadow stack and
 landing pad instr support
MIME-Version: 1.0
Message-Id: <20250522-v5_user_cfi_series-v16-24-64f61a35eee7@rivosinc.com>
References: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
In-Reply-To: <20250522-v5_user_cfi_series-v16-0-64f61a35eee7@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
X-CRM114-CacheID: sfid-20250523_063234_838596_2862592B 
X-CRM114-Status: GOOD (  11.43  )
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

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/Kconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..147ae201823e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -256,6 +256,27 @@ config ARCH_HAS_BROKEN_DWARF5
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
 	depends on LD_IS_LLD && LLD_VERSION < 180000
 
+config RISCV_USER_CFI
+	def_bool n
+	bool "riscv userspace control flow integrity"
+	depends on 64BIT && $(cc-option,-mabi=lp64 -march=rv64ima_zicfiss)
+	depends on RISCV_ALTERNATIVE
+	select RISCV_SBI
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
