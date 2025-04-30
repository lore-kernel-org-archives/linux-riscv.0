Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AC2C369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boX/a5YsJ183+FnULZs8DvpxwAz0hdjTMJO1S4Xp5SM=; b=anl+OPEPyS+1y3
	hpJCrptoCgMMGCUEshPE1uIbRuLQjUWDgNpYdHgRJdNBbeVQm9ax5a4wsh2HztOUQeZUZHNJpeaFh
	qYUCJOQAUIvJ/V9EdjBOAKLUKxn2OPuiNoy8/uLGptrP9fnl/433vv3cTw5TWZ2QOnRlckFjPHFlb
	jxm7PGoH/0rDUEy2G2CcpvklthXET0MlZKPR2D1O1ZbmBtI0GcWpr1WFkNxNxuUNgfZ5/1oKFbdFw
	Mch77Cz2nGAzvIFTnMbQ7u9TnQxaI+Y6QOgpEREM7edi41gb1+KZECvTE1pxMERWGeDk6dMLdt4YI
	Kvr4NUgs1WqG1in2HTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9xSm-0000000BXaC-3rLc;
	Wed, 30 Apr 2025 02:46:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9v8k-0000000BGxQ-3U22
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:17:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-227c7e57da2so56965515ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972250; x=1746577050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=lluP+Ea6B9geebEi1VFcOCz3atYpseyfjN1ZAZtToTsE9XD581zNBX4PWnubZ7R7n3
         bhmNJYClnUd6jayRp7UGAzADJWcaULk7yycftKdth7pjmtIrPQRKujEkzFgob7y5bK22
         BpICkjfio7aEwu47PlC42NLLqtvXPvNBz1Ge5CvozlyKykFNW7bRSdEUgHIDyYNMWUOp
         glPretqrSBtsdJqmrkk3MJE7jW4x0Yj2+1iIlAHhBtq+DgUi03H3hF+urKXQs2NlMhGa
         bmvbVhswk9vNYXVeLAD56NlEGw/8+JhpgkPIbpc89E/c7Vq6UdISTpSN9LwrLa7Mjn7I
         53BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972250; x=1746577050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=xJskttWrNodlP8dfJY/BPgD6FO2nXLYLJX+xuHMf+9Wa1V5fPsQn02sRImvIpNNWkq
         IXArpyze7Zl51Czj2q5cltN68X9rUczzgleAJJIFrrVD1VwMbA/5wTlHGgOdlCVwbiR0
         tk4BTv59TecC+1ZeS0A3vKDcFyhu7hdaYlqQmZAZtWpPZDaHpYNjERoVkQyFX1eNnnEr
         ax94bM6lCIQ/Xzoa/t5GDLdQuz74JS+F9xhFTmINuuQ77IzDnMXU97lBc7+3X5nBgrb8
         GzZbH96Qag+eu0drK6RpSGjezzaLOl+YzzhgjEpWvO53K4S+QAGk9yCxtC7G7WH35Lqn
         LtPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeAp7SNU0lg8fKlkTCDuyM87kOu56BI3XZI9D+dze9ocqhxOLj4q3wiTNuS7N8q69PhmMSSbXlowGDLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfDmx4UvSKhLSf7swZzH5/e2xirABefHfgyk7TrOAKKZ55DwCW
	b49jLpctVXrJWqvz31xUPe3NdePF1acp6kZ3L4WbS05i+DeSI1dB32wfF8kW1Y4=
X-Gm-Gg: ASbGnctsXAoV/+1RFxAHGPUDtQotMhwl9hGtzOzw7neE8iqxDABez4gmvpnxTcca3Rv
	PxXO8v3AsUJVbnnvf+qFtD9fnjtvVyCjB84nJEFHndce8z489/dhrMNmo6PxlrxlBBT/twqEcL6
	n05Dt8jqAHiao6Y22yMerdSuugHoCrG34EYAKMweIyCDF5wjh83PAIbAKTY30DQo0D8JpQ5p8JZ
	BBBJPFRH05XhTzMVKgFXwvVPnTQVRNh5nBRGNEPdFVnRVNP1eRF3NeXaTLIcqzMa53tzOtb5Uar
	vecdVTxYIpE8z3DG6E4xF6NPLDlIX0HcXTznoLfpqJ0cz/0BYj4=
X-Google-Smtp-Source: AGHT+IEv08Pi1B4n8aq/gama+rOHWezI3b9NXNMRL3JsLWbL6t5wIuHJZfTFW7KjphDiUJGfsha+Gg==
X-Received: by 2002:a17:902:dac3:b0:223:faf5:c82 with SMTP id d9443c01a7336-22df5769b69mr6013935ad.8.1745972249788;
        Tue, 29 Apr 2025 17:17:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d770d6sm109386035ad.17.2025.04.29.17.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:17:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Apr 2025 17:16:37 -0700
Subject: [PATCH v14 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250429-v5_user_cfi_series-v14-20-5239410d012a@rivosinc.com>
References: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
In-Reply-To: <20250429-v5_user_cfi_series-v14-0-5239410d012a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250429_171730_875481_7E8CA272 
X-CRM114-Status: GOOD (  10.34  )
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

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3c2fce939673..9bc96881dc9b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -81,6 +81,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..c86cba0e4506 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICNTR);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
