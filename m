Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C886C3ABAC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 May 2025 12:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTQ4Dnr3mrbP7yr4A9NR09zEjchrXaLV9ueeqsyU5ps=; b=f4KHAQFnRUOzOY
	2nKSZbfomFPdsGDl201yNgiUo9NMZR/WBe8rTu+zr0+KvzuLuT7Q8KrdRT5BavDUkiQQjrN9QKNKF
	+mofnKRFEqj0vYCBJJKbSpmx2q092ounWVK8r+1Wqn3FJjllC/eRhy+TaZJheEhpqcCc4zg5pvS+P
	kXsW3g+KFDSCLbpgENU2k1yep5PJH1ojTeBySiU7hxApU6NeoMecomwUuo/6A+Qv0TlZdZhQi86g3
	lq+bDEy6YjeiIiWmoIVLDbRuszxdWV8LNB2fUgu+1pS0YwsvU8UupxggF+EOEgfqgdjZ2yaRCNAhc
	9jl0eiu3js/74eLdamzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH6J-0000000Bqo1-34yU;
	Tue, 06 May 2025 12:08:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFG1-0000000BWWJ-1R3j
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 10:10:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a0b28d9251so19825f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746526235; x=1747131035; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDlCPukG676ZkXDqA7+irYPpUi8ypltoa/WLU7iYTZw=;
        b=jfU1aOesL3VLnW/LdXf7kFDaYfZAcr5mgp8E4KDRj1Wb6v+atHSE+GnuyZ86j+jAxr
         MFtKN0GmuPJ3SDvK/hZKBtmtBNdUGhXZYZZrkD+yJ7RDdAmnDcjvPRRxk75SrDyAKwDx
         TQlcgzpM49jYlFA59SYCYuYZHiV2L1mkFWmlp7FrawHAoQBvmIUkz0NokQjdq0CIWMhL
         SEhZuMLuBVa9ftozTfqJn3YfcGykq3H72HBTjTllc9OVNIbbY13lF+CD/OaIFY/p38B8
         PhfDOhIr+knn/Xv22FEOQ2GNWqoemAybB7OATO1lG0D6EWkPplWj3gfGEOEXBQZgqh0x
         yQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526235; x=1747131035;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MDlCPukG676ZkXDqA7+irYPpUi8ypltoa/WLU7iYTZw=;
        b=ZMguEJsO6HJOZ+SfJGTqefsjEY4AL3X6TrdA6M9ZznovWvmd+upnevT6mf4EfGCwoM
         EToksw2WYHIBMPbuRsTuj3cer1Iru05BP83N7zcSCSA2Hly392j3Bx6jpsvWEh+Nh85s
         yEE/TxjgbibwrG4Sjlyc1DNImU/+7qr2OdUoyujOVKU40fY5o6nBlY/jb+JP2K3YtQBw
         WZXyVAWImihKS/LCblJOYCBbbYJgfxvqsEEGcUJNnQFw7EOA0e1/K6Dg3A9g4iqXacCb
         qTwbbsiX7GiXgx4s0i5uIl5y6gvgsh2/nuQ5prHvIlEJ3AkkJ0oVCW8ezQ2V3log9hHm
         61Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUucE8Hnqbd0eiq9XwvaXlWSbVN/2I/JPrcnlCsrTyaIFh6eiUY7ad1Qv+7hzy6UDPbiKH0AQgY6Nikew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaDZQOLmIjEiGlt1S2Ftavu0nvEtIDAvYzPDc/69Uutmq7OS4u
	9Sapvl0leRxPI1KqaOXaQ/cYwBBYiiyNs8Bm5azWl022xkYBppVobPnUN6KoDXA=
X-Gm-Gg: ASbGncvuB5jDCyL0A7bUhIsz2DF/hmspFB2HyWs0UrLF+/uqkZ3ZO1J1h1xilvaXrvw
	IGhnGIMv/5x3IqaEviTRpovDR2tLuJ8HHPnh8n5otyM83AYO/T3g1HVK1qJpjLYYrqm9bqMHao2
	ZrnvyCZuDUtjkmxpX6p8qGk3QlG19j7JaqXqNw2dhhgx4rnKooHtgl1UVHCuqWMs0IHH7DbRZZn
	JJ+xgq9RTMqTlA7SsjCSNsxwLA9IdPVpmx7FReLQEcOnZ3UvzekXwvS9vgzXc6YeSVIRZAKBQVZ
	hVJkfwQF0gZrWRvh3PleOzAXEs67D8zL2gc/JibWAQq0sXPt
X-Google-Smtp-Source: AGHT+IEUjKjGwlmMCjrKZvF7YuhMUsrs5D+dPoN1CPSaPd4oD3QBATAQzTQqUOqU1bgynoQlRYwsyA==
X-Received: by 2002:a05:6000:144a:b0:3a0:9f28:2e53 with SMTP id ffacd0b85a97d-3a09f282ec4mr3244079f8f.0.1746526235363;
        Tue, 06 May 2025 03:10:35 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:d5f0:7802:c94b:10f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm166448565e9.3.2025.05.06.03.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:10:35 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 06 May 2025 12:10:34 +0200
Message-Id: <D9OZVNOGLU4T.2XOUPX27HN0W8@ventanamicro.com>
Subject: Re: [PATCH v15 05/27] riscv: usercfi state for task and
 save/restore of CSR_SSP on trap entry/exit
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>,
 <rust-for-linux@vger.kernel.org>, "Zong Li" <zong.li@sifive.com>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
 <20250502-v5_user_cfi_series-v15-5-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-5-914966471885@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_031037_383841_9AD9FA04 
X-CRM114-Status: UNSURE (   6.24  )
X-CRM114-Notice: Please train this message.
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

[Ah, I missed v13 and v14, feel free to Cc me on next versions.]

2025-05-02T16:30:36-07:00, Deepak Gupta <debug@rivosinc.com>:
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> @@ -91,6 +91,32 @@
> +.macro save_userssp tmp, status
> +	ALTERNATIVE("nops(4)",
> +		__stringify(				\
> +		andi \tmp, \status, SR_SPP;		\
> +		bnez \tmp, skip_ssp_save;		\
> +		csrrw \tmp, CSR_SSP, x0;		\
> +		REG_S \tmp, TASK_TI_USER_SSP(tp);	\
> +		skip_ssp_save:),
> +		0,
> +		RISCV_ISA_EXT_ZICFISS,
> +		CONFIG_RISCV_USER_CFI)
> +.endm
> +
> +.macro restore_userssp tmp
> +	ALTERNATIVE("nops(2)",
> +		__stringify(				\
> +		REG_L \tmp, TASK_TI_USER_SSP(tp);	\
> +		csrw CSR_SSP, \tmp),
> +		0,
> +		RISCV_ISA_EXT_ZICFISS,
> +		CONFIG_RISCV_USER_CFI)
> +.endm

Do we need to emit the nops when CONFIG_RISCV_USER_CFI isn't selected?

(Why not put #ifdef CONFIG_RISCV_USER_CFI around the ALTERNATIVES?)

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
