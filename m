Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B621BC3ABAC
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 23:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeW8+TUrWHCGaMghs8QC67QFneRsl9EsUU2hKqKM5K8=; b=oEygSdtJUOziRv
	mEXiY/GdPXo8vZqqrbyOWbeHtH8qgTNlDA3AohV/nf9EgpW8Pe6Y4Sv3W19+IuDX7HEbtlTOkVYyu
	PZ3xEG9aActLiRR4R/satsyldUWbLTE7/XENklBPKDbr8laOZ0RdO9MWCoDAwONs4oiPm7xGd0zG+
	/yRgOzFfgIef4gXqY+Lrter4t33JIgPfxq87sFUJrpC4C94f6x6VWBYz2pWcjZ61EDMvLSxnUEj/z
	CDqkse4/r14SFceMJTleX8blCTUaqgL4LCbGT684Y9rfQMt1UBzWDpjur+Bhv6Z/V2mE98fihY+H5
	4BjUw0sSqLsaKLsl9rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAztX-00000003GSp-0we0;
	Fri, 02 May 2025 23:34:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAztW-00000003GSb-10Nh
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 May 2025 23:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=; b=nVRuEoUdqYX36wOTEQPl819+DX
	UkRaeg6gAaq9c29fMaNXEbfOXDHnLwvvMTaxYFLzv0ABwScXmQBzcEpWtGtKNbSxxMB/Ab6Du0jcc
	BuXb9JQmU3Ul+41PbVI60FASK0PGNUpVHhdA+My3dnA/v8f9BGs3vBTlzlCau5eJATz0yRqmCdWgj
	IcZJLS6a3MG0KSeCNVbAefIoiyJ9GHmPv6Qr+3jCLOlhr8u//pgqda+4ZDNV4KQ+gxrTQv7VrKbm1
	2nZrAg8jU07s12WhZR/35a4+aPIVlnRbnfjhd/VSdf7zxKG6b2x3Ee7iJZAie3VBFNQn0W/KNsiLy
	7AYKoZSg==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uAzr4-0000000F7l2-15Sm
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 23:34:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22401f4d35aso31993025ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 16:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228695; x=1746833495; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=NGvwYSkFC+OLb5Z1w4Pr7RBxgc8FyMDLKGn+GHPe+jhwljqYA4/mJGOhMo2V8gMRO6
         VjSN5MdRDIWMSq/jZLmORIxzETYdDscdwGUhS5PHeseC6M8F7VJvbS4M4NIEJrQQbkj0
         xdRFdzEkFioldvkQfQ8CiY64qZNUS69NjlzIx9XAv2OdDHVBQRW5sgxtkQXBIS5Dwlpq
         F1UuUpb4X11S42eoEzy3CzWgdnkLaoygLO92IulRmJ7E/Ku+j91X/o1LqA6xEv3ihqbm
         Y/xQtIod1/yCtfpsT6Nz7seH47SLUsXKfbUYv5lJ7Hh7hV3M1UTaxCcXVVuwW1RCZM9I
         sMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228695; x=1746833495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puoahas2OCQQdRJkSX5kN4b6Bd2MCUgo7wt+1uTIqSI=;
        b=F+K4wndHEBAbaveehK2W2eanWI1tIZNw/bTeVWjb2lgpMkovgLEi09Tg/b4dP5hC9N
         TW2HJ4tnStgxbEoNYBKQUvwHD4RgXIi7y9qNJj6jgZ7wuO+dtZzXXm4PLf552jD7dPFC
         Jpaju5eZ6ejDMpCYx6zP9hXj6ygsaI4oXybQG8KOjU/SL5F4fUJnHvQNwtm+RuVXw0B/
         N9x+WqM8iolMlRbzGx4Fn/JMMU0/UO/3O6JPxNBeb+2tTLUCoRiXl6eb3qqUzu9LeuGa
         qVvvnQrk1H5M3N8zJrjwvtxn5O49JP2vmsJqlIhAijq3Nuw3FP2fYBYwOlsM8roI67On
         LSlA==
X-Forwarded-Encrypted: i=1; AJvYcCXzrdA4KLsIROSlyFWGR/L4+9Z98DhlKasTMdpqqplpx8CE6qOII54cUI702kzKT7od7RU9K45Q6x4d0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YylAjqEwCfWwGYyiXBurSiNqzenikSlwrsWLv6EbWZqcxg0PXYO
	HDZWfWjAIQN/BgVOnor4EAgFZWR6ZPHQK8gzPR0HMRrhuwcS3SfOaKyCQF3FLxo=
X-Gm-Gg: ASbGncs3M3schz2Pmf/rc9QBfxvkxb8w0DWx5YmTro/TfC3ikiSw7AzcjxhkfRAFWK2
	3L+XgK2IBfvbWe8oG+XVUMK+Qo2/Ogsz0NihLCFtEcQcu9RjV5KIdp5mWzNE6IHpc+izdAtgeMw
	DD15sqHCLg8WDb1KANMXeB7jcBb+87PaB8v/+TZxrw9s4mymMgRtqmtg/aGUFbx2h/6J2sFSuWK
	l9teYcvY7Eh6b47hSAPA2wLw+qAsg3OL2XpWzZCygWxOaMsMPpPjwKi7T4WkFTboL2y1nNLF03k
	SDKpxIHKeNu83CwucQjrwtLzga1N016/yA/4CKVzLMvKokUCLZs=
X-Google-Smtp-Source: AGHT+IE6knTtCpmfMFAkDI+1hk5/+yYRWT9dIF9l0EXSAK50/Siyf3hCw+eIQ4Toh0T2wsbvHAl/6A==
X-Received: by 2002:a17:902:fc84:b0:223:35cb:e421 with SMTP id d9443c01a7336-22e18c58f62mr11862295ad.49.1746228695046;
        Fri, 02 May 2025 16:31:35 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:34 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:49 -0700
Subject: [PATCH v15 18/27] riscv/kernel: update __show_regs to print shadow
 stack register
MIME-Version: 1.0
Message-Id: <20250502-v5_user_cfi_series-v15-18-914966471885@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_003208_235299_82213C6A 
X-CRM114-Status: GOOD (  11.16  )
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4587201dd81d..6bb53ce72ed5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
