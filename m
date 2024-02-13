Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47B5C4829F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGNeRo7b+NS3Ynvn4qLFtibVL/i9vY1elJ9hhY2fL0s=; b=4rg2bGoEOBXMQ6
	wxXu9dTFmOWAdcza+OnmKCJvbMEAa2dRFseAI+8W6a8NRDsOMdlH/fTKHIns9FSh01Vl7Gkg8exAB
	VoU21DeUSV+lKuhtZ81POgWDPqXJ3zxRULywP/QvbSsj45juGGwwaFxm7UGN4wy54eKMakw3VdOP2
	0F+Vgn3rmGcdjwD7S+mmlwmmEh6n70ArMCZDIlIUvlqbPuXa4658qHtGfoYf0P4jk4Sck+h0n4ZV2
	ag/Lu2O6cjvkVSyz2/plFU9W4sqsgxgH0usf5Gu9sdbrv258Nq4OopRgDZ1NEE1mLF+L8eFnVm5Ce
	bSr4HKkOerkbTbGNEdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz6J-0000000Aa4I-1lXs;
	Tue, 13 Feb 2024 20:09:55 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZz6G-0000000Aa1B-1fmp
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 20:09:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a271a28aeb4so604257866b.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 12:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707854990; x=1708459790; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mrszqc2bupU+EBqHPBjyleYP7nZ04WmF+Acwr+mRjOg=;
        b=J5syHAr+OGX1W+CfdKMCfQ6QCtJZ/mXeBJkdUfca/3PTKLui/AL2GV0qe6uMvXrB3+
         mgnxcDyAYvVUhpMbKoj6E+SW+b7Nn9zMDyBqGg32dbYl1jFzjXIdYpERM9Kv3UyqFEgt
         yYShdKC1WPCLsGmcHD22uXk+Y/EgNa6cRurT3XJG0X0X8Ka9lnYJedl2yceqiSYQcS+k
         d5l9AMaptjqDgJEqvPl4H001HuqgkD8aAbse9kqp5MbGjOZy5wkjSg6mRti3fxTgmU+K
         W7nW2CnfS7UMkW5q6ZQi2BpV1wIEBUgTjLMCnLoelbRNukj+MwUDvhsYUd2jLwUHAmfD
         z+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707854990; x=1708459790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrszqc2bupU+EBqHPBjyleYP7nZ04WmF+Acwr+mRjOg=;
        b=c8aNViEe4ddeI9Wek5K2ld5e9lfoloAchiZghNL+8pzifgcygqowIGPRwEPnyxHyb5
         H8Stgvb7FRzFEouEBW57dnhy2Ph6MKX4g4VUAf0kS85KTKOljJsFKQGbe2OytzIcjiGS
         4vemHZ4kMp6m/jgsdhGeFZ/37JXZDGPaGPKwTsYU7c0nPPsbqRlj9NYss1fgCTAZSN0Z
         l98in7KVysV+hwPLvixgcvmXfkjUixxH5HxLSjc2s+ryOH0/zTIM68cpU6a8C9KiVrjD
         sOW0/pzobAtwVTSikkUxNVjdiHULVa1FWJpqeeYRpaaTifPaLEPI41aHA9cY80a/5dZh
         6ynQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ut2UksD/1vixXaGlf3B39P74x5qHR6CANO4k+BlXLXE+aWW7UQyIG6okcmmm0ObKlMGrHqMUA+vPnYyUxtfj0SKzFrdLhx+bqrHaMFtk
X-Gm-Message-State: AOJu0YwMrZnNfbzg2ImkcYeE+Xhfq7AxLXYjxOFQklRbZi3/JW6E0OF1
	unYfesVM3/KjVR5xiLfbIhrfSa2DECU2mUaIcWZ3xdkY/83oJWMc97/ZFR7EZ36QdKh7YFyzE9h
	sj3p8XgwqkdD/sj6INujOMgwfkfl/4gxhyMZZ
X-Google-Smtp-Source: AGHT+IE3mwMUqJ6DN5geO/x5V71y1Lpt/nQ2yo0uSXGvjLFjxROjLwld/5P5gl5jWXzv7R3BaPdR8dxplGGxRT2ITjo=
X-Received: by 2002:a17:906:b34c:b0:a3d:3781:6eeb with SMTP id
 cd12-20020a170906b34c00b00a3d37816eebmr70496ejb.34.1707854989739; Tue, 13 Feb
 2024 12:09:49 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZORDaHHH3jTL3GO7OsDubhhyQE0Uy2uAjJpiRzrKBgqaOw@mail.gmail.com>
 <CANiq72=VBFvB9O9c84YxpBBftpfNnnXx-+Xes0h8h6rN3EN5pA@mail.gmail.com>
 <20240212-demotion-blitz-1c9ab85dbc73@spud> <20240212-outdoors-french-a40d57e38c71@spud>
In-Reply-To: <20240212-outdoors-french-a40d57e38c71@spud>
From: Ramon de C Valle <rcvalle@google.com>
Date: Tue, 13 Feb 2024 12:09:38 -0800
Message-ID: <CAOcBZOTLBaik5kwHhvCoJ4Q4PQMDjBk3TJsaa5u-vxR72A8jFA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_120952_482195_3EBAA61D 
X-CRM114-Status: UNSURE (   7.62  )
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

> I realise I was not clear either. What I meant was that this talks about
> rustc and not kbuild, so what is meant by "the new target" is not clear.
> Do arm64 and x86_64 have functional support, so adding RISC-V in rustc
> is needed, or did you mean for the new target in the kernel?

Sorry, I was referring to the targets at:
https://github.com/rust-lang/rust/tree/master/compiler/rustc_target/src/spec/targets

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
