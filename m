Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A0B5C83F1B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0ie7NNG/tkyD/mfOgHdG7hWvrdkYbfU8NkEWCsdrgs=; b=mAOy2QICLA4s1B
	+nOW4wIGBC8Lc6R2B+gp7EQKu1pigDTwvT2K1+9Vnu8r3+i1zTRuJzjVOy0NIQBK5WH6N198bErQE
	/m6m66dT6UTkWQvQaa/VkK0YhymUN8FP+qGJ6M8o9ExoYbeWQ2NnBut7OQjvw0ieOs4niUlOfFkVe
	iBimYEMn4jB4iRKNpBQwH2NfIc/3mV3oxSN2jAFvOE2ipfzOlCcjtUfoDCFLn2D0VDQ2wJO/IXVoj
	1/RqUbdqWprY3nygxUfZnm/RKNby2NzkKwmmd+eo4cEEOts5kJS9cpQ7ZzEJ1n7fV1WxXLnOXuW/n
	uI5qikk23dg0OIR/fdBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeY-0000000FoXr-35G3;
	Fri, 11 Jul 2025 20:47:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJiF-0000000FghC-3dOF
	for linux-riscv@lists.infradead.org;
	Fri, 11 Jul 2025 19:47:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7494999de5cso1706201b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Jul 2025 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752263235; x=1752868035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97idN3yevHtenW1UOqMmzI1HJzUNQ+IzroMxOnaMZVo=;
        b=w5+1vSilS2eB429DH4bDGZJFYg6usjKD4hgeRej5GXJl9LtLhFfsJaH2CZOPaBhDAi
         ubeYUNKemV4Qu9JFmwgmdxcWD/RxfL7YtB83xH3FVXJmiTDuryjtJGrZFVektCrVMUDa
         5fF2BC6OzNO5bFyAGAHj8kzl3Y7GePRZ9XSCVHVzHJ3h+p+vl+FUU8VbOEQ8xU4NF/q9
         nZyKgTVW6FZRtig8OJ4LqUxmNPdQ8oTIMay/MRX4NUcaTH4FqG+0LmT3D2sD4NCvyJHB
         eZVWaa48iyOjWy3b1466lSuaRVGhImPxAbrn57AUnDKH7LNU/LzM+Ei4yG6zhw6Ra1na
         E0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752263235; x=1752868035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97idN3yevHtenW1UOqMmzI1HJzUNQ+IzroMxOnaMZVo=;
        b=rvTRg8W1BUAMcGv9gh/ECBxq6g5in338LshYnAWtEg3f1Z31EUw/KTsQ7zpUQUPc3P
         tNPf4T9p3SBTqP09oV3pg/powYQx8oKYm1QixXc7fMnmfVOoL+hxStAug5Fqzt/mzuAt
         +oY83cF025B8HJIFu8wXtd91SKtlngFQof+JCDQrUHsUP9Cs8WO4KRCZ57gmsFSQmbEC
         WApl/YvjB4BhWMtiJeV1gZFUrgiXHv4fUUAUPW+DtP+4fKbNt2RGwIsx10TcWaVuHTeN
         ldc4+S4DJ3Gl1uelOdb8jBd2mleXNufhjz7adg6gAA/pBOM5H3gFzankN+bB7d/Ccjus
         36EA==
X-Forwarded-Encrypted: i=1; AJvYcCU/FJuxW/5Nu1aSAH0ICJhWH/WbShOzoJn7wgD4vqk6iAuWU3NVwoF2mNMDmdGNkZAdftr0G5mfoZuAVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQKxN6ewCyftiUY2pB5qTDrraU6hoMEOipWEU+J3ApSx7zytD/
	MeDiRBq5Q1/FYOnJf+cqEtjHl4wcNOMPO+6ledC6MjW6hl3Q2vcUjWSw8jLNDKWEqAfqBWf8zD8
	+nX7q
X-Gm-Gg: ASbGncuRujCqz8RcicLLq85ZtdK3xQxMwecNqMcpKU5cnyZl0NfONse095Bz6kqfxHJ
	aSMiF2ryu95l/wZH7Xfd2rY6bkzgntWukgiz0gI5wmtaxdzKJNR1acotz/AZcaeD4vX4LQBy/35
	ZJktzCZ52EChBtUvEMjoHSh6JTNMK36Oau4Bh61sFSLP0SMv60ZJKNWjMELP7gUUbPictflRyFg
	mhMVQtS6yxGQcNGuT3xA2fiGToCwJ8DJTlzEZu5eB9O/EhM7bzo1GzIO/zUztVWnLuTk+EPsGRW
	cUskhNJXrM97mob0MDPoM/TQ7p1e985Ie96mH+b7powGh/rMW04p2FPECr36QMZlcC3e7iCznMp
	xlxJ5Z0JCSLHw83OpXgJXc8vhBq218K/ksjq/HJsk+Zc=
X-Google-Smtp-Source: AGHT+IHwJTDGg9rq2j66Wqz5or/ZUFf1xTDlZS7Yi3n13nxS/K1PihYkRUSmg1+BL+hU8IT5qsS4UQ==
X-Received: by 2002:a05:6a20:c906:b0:218:5954:1293 with SMTP id adf61e73a8af0-23120901f07mr9038519637.34.1752263235265;
        Fri, 11 Jul 2025 12:47:15 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06995sm5840977b3a.38.2025.07.11.12.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 12:47:14 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 11 Jul 2025 12:46:25 -0700
Subject: [PATCH v18 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250711-v5_user_cfi_series-v18-20-a8ee62f9f38e@rivosinc.com>
References: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
In-Reply-To: <20250711-v5_user_cfi_series-v18-0-a8ee62f9f38e@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250711_124715_904298_D4042768 
X-CRM114-Status: GOOD (  10.16  )
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
index aaf6ad970499..45ac92452e13 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 59)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 60)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2be..59fbc9c2d126 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -113,6 +113,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
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
