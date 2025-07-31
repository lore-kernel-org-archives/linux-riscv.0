Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ED7C87FD3
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 23:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0ie7NNG/tkyD/mfOgHdG7hWvrdkYbfU8NkEWCsdrgs=; b=qlFuxEGVBeli9/
	HQw9ZW+rakvQ3ZsnmAjEE3slZTnnfcsC8YbC+88z/3ClorzF2MJY3bchHWbRw2wuGSjBEk5hyg6Zd
	5gNVM8NRtCPG4fyo17fNJYOvacLKsOCCpTb8Hg2/7hUieMIkS85Jye/vlmeFCmrBDMjiz6EZacNim
	D2RPhrVTdoiEFMtRU+G04U6cnjKpfAq/F0V02DxBagkfPsHiw4ZZaeyxX6F/ZtphlY0tGTNGU5JGC
	MmK3cf5BaAKL6lpGefQk+ywcU1tgNLQn33LWuH+xxn3fDxS7f0oJB28PbuY0PCKW2mGhSfZahQ3p1
	mNeumyR4knMOmAFAZxXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhca9-00000004cTH-3suM;
	Thu, 31 Jul 2025 23:21:05 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhcZQ-00000004beS-1rVX
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 23:20:21 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76bd202ef81so1321917b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 31 Jul 2025 16:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754004019; x=1754608819; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97idN3yevHtenW1UOqMmzI1HJzUNQ+IzroMxOnaMZVo=;
        b=Pz7b7LvbhvuBPyjHFtN8nCuSIIigct7M/kUedjP4O8GVlK9mXc6lhMvIuIiXhwocXh
         YJVBKKWcCkmTvP9fwNev5p8mO3wSDQzqIEQKqpWs2vZpZgxSvIyl0UAV+I8xiUV9Y3ek
         kKQFbflQ/UT+B2ISOS/TUb5Xps5Hrth9tBqnQrnbTzcqRHIVyED2E2M76qvQM7QGlA8r
         4B9a60Zvgbn/7OwB4FgJpKdP7Q9cawbjMowoVgC7MCgzIrFP8AyVMPj7u5r+ykshyBzL
         eHzRUFSuWxfu0kgduYkBk7Ojz5s8TQxR4RiSt39vhCGGmk1jwjDPnSgFdx7UGnL1avS0
         MWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754004020; x=1754608820;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97idN3yevHtenW1UOqMmzI1HJzUNQ+IzroMxOnaMZVo=;
        b=ZOTpm0AOE1CJAY/1C/7A0XY30fHYmBTU6YVSJZwRqLDQlsDq5U6f69Oj1+RAPXiRHD
         vSSUoSgZPdI9wD9mrgzHBzaEbtAUICMnw3kUFjxbrt2m/h6iyssQmVjQl2n6NVIcQWk8
         Z5siQh6fjrG/twUe+N3P7d9CsnxqeXGk+tlTXhKTePFYxIwYLXuNZh+b67XS/jUA2K/O
         VHbFAtfGdcCITfAxJYHax9aejGwUVswiAG9YoBjQChvIOrwsrHZlN7NAhMkzOZL5F6CZ
         mbw8g/Ks/W/a5z9Pi9RLYmFKuqR1zuh59V7Z1Bq7bYAWstFPN3TEnTLGW+P8iEr2tkHQ
         hH2A==
X-Forwarded-Encrypted: i=1; AJvYcCWjOzDzloDuymO7Fvqfzg0swFTNs7SJgcGQLNxJ46ttEJDWg/1cyQH4ogK3IaUy8tX2J4ggDRQsvXoXqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz666QAU5qqTgjh3PKHFE3m9EQESC6bVpT1cNgeOjVBVUqPrzjL
	qn0tKygl+NzXZL97DoPDtC8I2hrOD4SiCyeLNnSrK9ptnS6N38HGcxUtz9h3PRiVeKQ=
X-Gm-Gg: ASbGncuqfMBXS3Skn2QXadhfQcAEOBbXw4D3N3yvJb/Wo8qTFt276mhPabFzZHh8gdm
	lHc25SQhI6yyoeZlvWjKm05JyofX7MtdFwFTLwlGVH7WclPOnxvapvomy5GKT0jTZ+gKZPRULZK
	DsP4lHzNWiJVz61U9FBUim7jGcTfbGdTcjCVPrKNQQD9YSwnPW6tJ7KVQhH5+bCxSSmZz6GejxW
	KHPwvvH3yW3V+aeksIA7rhkvANxR5iLOR5ViLR3hUT9KEKP3Q+vWgKlBaVb3rm5q1ftTgsaijAt
	Q39RCjQDI5UerjrNHq5Vbqv+toNGQ6EYtclq7WTIJuqIx7h4hVFYxqkJF81KlvlZJBnzKsWtuLi
	IVXuBYrHmZxsmG1m1GUpVwY5PDMmND0aa
X-Google-Smtp-Source: AGHT+IEUoMa+BXtql9s2cZFjETmhAnatI7rWJGQzevop4U/kycX0Vn34mEDUpI8kYIcAJsoiygP9Nw==
X-Received: by 2002:a05:6a21:b98:b0:23d:e370:ccfd with SMTP id adf61e73a8af0-23de370d395mr2848807637.41.1754004019603;
        Thu, 31 Jul 2025 16:20:19 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:20:19 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:30 -0700
Subject: [PATCH v19 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
MIME-Version: 1.0
Message-Id: <20250731-v5_user_cfi_series-v19-20-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250731_162020_486096_03808ED6 
X-CRM114-Status: GOOD (  10.32  )
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
