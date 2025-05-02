Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BDCC3ABB6
	for <linux-riscv@archiver.kernel.org>; Sat,  3 May 2025 00:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boX/a5YsJ183+FnULZs8DvpxwAz0hdjTMJO1S4Xp5SM=; b=zkh6BD30juTppz
	NmT8k/aRVCUH1/0Tb5PdoOCAtxG+/zfyrnWSHhTTzG4MWtrIjht0w9VsA6vIlmDjYHO2uNHxu4xIj
	3KwUHBfOZratOtahPDlGAjLrwBeMBCve1E2Qjqoqv733ZE+4vZObwjAxaUQM7AMEEXmiF89NZRP6g
	ICVmjHyl0N6WtZzKILL8Zxngz+dk3PiVgFV45Z+hBpXOrS2Ktxumzy19VofzvxGQciOoGFrBeZweI
	3ujDxtoMfC9XSzoy99hnh0FNTg9rcZxbsEUHCt3NKZwX6v1YFmLrEsBsbAeZx6/4CXxerIsmbSl3L
	NEekxVlCEH+0nx2nUZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uB11h-00000003LEB-3pVc;
	Sat, 03 May 2025 00:46:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAzta-00000003GTZ-2LgP
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 May 2025 23:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=; b=n+8aN4seQxK1lHLKoJgA2Y9fFC
	iKo2AgZoZuJxrlZnrtQEVBJSARrAJVDgTIyoIYGeuv05UjySmRCIekhwYFP/T+TxBlGhgVaITGC8f
	j8C3ilFM0JLRhI93yK7gqa9mZlDNKnmeHqZM4qs45IjKCpOWM6CX+7Dc8KQGVEII77WrCfAqcfF5z
	HZQhatvZO6ItOHq/yrwxPzXZFjeiH8izqk17OYBxXOppDbm1U3ALheV8x7wkdEwcnFPVen4hTaHjw
	v3FvgGjc6A6SS3xZpUV/5toyjKB+/4jHOYO+eyQjJW09puJj9Tus6l+hZg6CgzeGbRUNZbhbp5HVm
	3LEE+ATQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAzrG-0000000F7lN-372V
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:34:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22e033a3a07so28822705ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228701; x=1746833501; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=eunn6YJu/LX331LFif+CHmF6qWenSBTry/MelH8EFK9iOzm87xpAxtATAfffrvzBZE
         r3bARd+7T8b5/lQknQJoPLzG9e4RcpyVPW15kaME1EsBmBSy0CPTd+t90SMNEKkQ9uXJ
         KSXr7JLWSYRhuQgfa1sr9r6HilkjOKPmUe1lP/TiPnVqN7AVma9HhJdq2TfmTLIe2tWX
         vh2Yxt7pQfQbpBaXRNmjelpN54CO19YRK88Qg/12iO6dHeRXG6nZ+1F0FuhbxgbQptv+
         Eo9gmp1ROtK2coAxRgJIPM6BkfgNree9ciFELbn61lCrKQoGhkVUYkpsU6ulIA34rM6+
         8Xbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228701; x=1746833501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=e1idkcnkD7aWboHDNZH3Xgyt2zFjzwaFNOOWr7Nx+4B9KJgFDQCPbHUrJt3pyJP/gW
         yBkk/65vjy0rB5ScBrn6sloAeZs29i85vgaMmJsdFh/uzVuded6wSY3u4XGNiwv3S9pP
         pmhAzsEJk+a+sCFV6a0jMWq30K02kzzI4vUOdP8OaRyZ4u2OlVFeuUU4VB98RaIjg0Zu
         H/bBltJnBWO6isuuMFWzOSuxSEasUN9oirIlpgP1Sv/avKF+gFqq4IKwBy4hqYm2pKRg
         AJnYUMHWE4TigwA7TpWyEC7iz51zFCFIdiaYfTugvOlhPMAsyTx2Jx16BiUava7ljvpu
         Szaw==
X-Forwarded-Encrypted: i=1; AJvYcCU4H1yP6EitL3mKQXjdcS6/Ng3bOZ5Dz2v9pXzFsZH8XDULVqQbMy/jtK1+qoauxiuvzBrQnv+vu5NdFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKpYGM1rBSXpV8ASf0bUWwLjZ2Bi8wU6gNjMUF0dtyiV8U11B7
	/OKoTF4OrHRmf5+WnrXXhUMtREjC8e1Z1NGkTuGT2WBJ4c1KJFKRUK4UHSAAFqg=
X-Gm-Gg: ASbGncvXVWOpZLp17nG4CMHyFj/ogX1x0SL8GIe9H1Phk8kffZYT/sCK4CIr/5cZxBE
	6IUwGgxCIMD1aTdmRU/5l9p/Sfl1lLTJ9EBo6llKfgUNpniTX05CJ8EtMq9eWF9fxSLLwntbZm0
	3VAmUHRSjmS0ZnAwaRahSicfePlkeZi/YhGju3Z/8ptJR+0595cdQ+mpp4RI+ONcsTOcEdfJXdY
	zgkCGU4MA0eBQp5sJWVrjbJnS8Fq87wVoVz3fWyLejGRq/RRvjbLuHFpJK1vlLUJy4I6CZhcH2n
	cOLREFmxM1C8+OcBmjj1GqI35ajCaePepXb7DC+ud9ejZBm30iE=
X-Google-Smtp-Source: AGHT+IGRr6wQ1qcGc/lz4VxDCk43KskABVIwgRKbdbOIqZA8WBWJNWwxAj/SPcLzrSkmv2eXNnxADw==
X-Received: by 2002:a17:903:194f:b0:22d:e57a:279b with SMTP id d9443c01a7336-22e18be2486mr17248525ad.24.1746228700973;
        Fri, 02 May 2025 16:31:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:51 -0700
Subject: [PATCH v15 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-20-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250503_003206_593835_F62FC48F 
X-CRM114-Status: GOOD (  10.06  )
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
