Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA78CAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pq7L8NB3q3CTu8kMv8RsnSW8cQ2h/18WwAQteC5Wydw=; b=rX5BX3AzRj6kWaQB8hoEwxf5xd
	Q/0RqZr4+7zcb4srk6d4eRwMgfcc+4vumEd3+7O4A047HWTQMlp8tMiuVsEqWSZtNxtj2ZLKXtygG
	lswSNUKVh1UWR+3tkx3ONCvHOIS8bpVuRW6c317szGdlvfSIHCjUkXTNRnK+x7UIziN5mz8PfK5Bi
	kX9vdzzEx/Y/SzYdHEfbfrZ/94jRRvcN0DVhGXIZReNoOYJWoTpsXki5DfNnRTTrrSugzvwSXyVzz
	3jexGpt3gPAIkO75evvKkxDqV4DIMvi8e1rLH2Qg/9Dc9REg85QeH2V/Aie7/gDHMeOXTuCwQtPjZ
	tVXixsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw28g-000000099Do-404a;
	Tue, 09 Sep 2025 17:28:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27G-000000096Nh-0Pch
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 Sep 2025 17:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0oIkfurNYJ8ubibO+ta3BmDEx7AccbTt3F6wYbDoMRI=; b=WgerEns0mUbyTTlJwFs5TFOkMa
	mM3j+Y+cNRQj4sG8AyMgSJQxnOAGAjla2haHZRJzZHA3xHSsgkTsri8mlHVbXqYfviwVi+B/lbkR+
	HRNm27ttVXMixabohEZaDQUGeSLZAVTwL1COqXZGMaJLfiU70w4TmyrYvrlQ2CB/GYX3/HufrUFkF
	WDVLyeSiXvtkwjFz44vnN1WQuV446htmwH+iiyV7A33PpyfPHwQ+XbH0bs2JLvdZ4MmZ6MnhJPJ6Z
	w4hlL4SZ6meTIy6THyo9aIFggX2pqsMqp+0buzcjrs1Et2okzh5uqTp/JOgei2qjgvWBVE+yosI4s
	co2ciS+w==;
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw27C-00000005UGJ-3rTg
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 17:26:48 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e96e892081eso4345201276.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438803; x=1758043603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0oIkfurNYJ8ubibO+ta3BmDEx7AccbTt3F6wYbDoMRI=;
        b=YDnjfu58HzpORYLAcvuuSCHa2Q34S9Ku3JbahdFvw1RaltuHTt/kjpS0JTkjYCP5iI
         1R5l9b7sbd6T/fXVvMKMRF0HlCT4wY8GfMM14wS6Wp6kgojYj+u1ZTfDypsivN3PKqyg
         M4ONY38h6b+GMB4cDoRITqkUlPne4YCSVlns/MRn+YaixbEyqy5PvAJxWPMeRsjeK+ID
         ETZwXJlNTWlzKs1zc5EjV4nULR4y1IqgSoFOgJUkldCL1Yo+VfNvvYbDiwHU5Z+XJNUZ
         me9jvcvxi6dg51V/AO/Ad6tF+sWLPqo1h+rqhjUK5mTGf1XgeDrhW6AAB6tVCUnN8vbm
         ZvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438803; x=1758043603;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oIkfurNYJ8ubibO+ta3BmDEx7AccbTt3F6wYbDoMRI=;
        b=JFdkR6ZBtxI2LzPg1wWO57BJTVvWsjdxuOcZ4IIWYap0xMSrC/5ieqMo50Jpz9EQC/
         67SuG4nQBxDaeDENdcAJfCwesBiPyg790PExj82tH7ETTsGByTG5o9YqFQsPuSmapXMC
         haFOhcVMosYg8FuaccV2e0VGxudHfiuVtgPLHxC12IK5aNGpvw6OZw1o9oBu9Yo6QRTr
         U8HnHCZekqJZYfAlEWG4bSenUNtFsqcin8N85GsiwAnRiXm2gfFsctWt4mVBwEh3nbNo
         FMVK5MnHQ2XVqFaJCKmTq7Nd1lZRlWhxNRujzebQMKi5Ck3tDf7oDk3An99xeEKUlK10
         F2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCXerw+GnaV3NoTh9FcfvxHZe7ORCGnOgMyAOthHMhalNfRAk9mht+fod22cG8T/EITF14wJfSsv9NBY5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQXqMEvtlIScZcEa2TOoaQMb1WFYAMortiINl177QvmLaGYIlW
	4ATKD88mC61HysWvwXDYvtGl8VoWp1MCSseHPb58DIVvRgtVuAkStoOP
X-Gm-Gg: ASbGnctlwaNxDLtyX+y/k/n8xKV9C+64QMfren5eqoe3qzjkFtAOWai7tBddWgyZyqV
	rNLp1ggf7gHlHQEqteH9KIvja1DyTyTe7FpFbIzEzIDAqF/DyBK+pJfJYKD5AwzvdSLtie9JK3+
	BCpWWDJKL8UVJayxfeNqhac6QdJl0ZzRrH7s3nYvd9E/Ag8GgjOVP8yFIdvo9HU0rZeK6XQ2KhD
	jYbOreOphHShLNERz9iaebnGC0br/1DSGwfsWGk46zGO1ppLVY/0bjABQnZ1MQvBk7bZdwdYdgq
	IddQKLBTWDeOXwRM6VocxgWNTvaZ9pRWOfdMoVGa2RA3HFGOSA1TVE7brnaMVbSVIkwMEOTL6S8
	0vudtpC1WOapgUYzQwW3mUR799UA9ZcIMHHG1qDNgcx1RFiJLOdSS
X-Google-Smtp-Source: AGHT+IGWvHZDYiA4RGkwYsweLqhI/RtpyRtGhg9Auj53oYUggWnrYnKSkAk9+pz7VYUcyUr/yHalzg==
X-Received: by 2002:a05:6902:2b8c:b0:e97:1bc:b273 with SMTP id 3f1490d57ef6-e9f662ee3b5mr12680572276.21.1757438802651;
        Tue, 09 Sep 2025 10:26:42 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbdf1fcbasm6726070276.6.2025.09.09.10.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 10:26:42 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <a78dca6d-5504-4f46-910b-820cb9ca750c@gmail.com>
Date: Wed, 10 Sep 2025 01:26:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72kZAeVjPF_O+o9zy=1-wh+6nUiW26_ngqf8unNi4twMCA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_182647_129282_9E0CF372 
X-CRM114-Status: UNSURE (   6.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 9/10/25 1:12 AM, Miguel Ojeda wrote:
> To clarify, since this probably targets the next cycle, there is time
> to discuss and get feedback to do whatever we feel it is best
> (personally, I can take a look after Kangrejos at some point). Is
> there a particular rush for this?

Nah, no rush, as long as it works so that RISC-V distros can deliver 
Rust-based components, that's the main issue I'm trying to address.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
