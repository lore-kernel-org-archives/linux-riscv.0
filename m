Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709C7C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss6J9uAmTo38faOQ9aHuH2jLIXRKkfdl4XA3BDws4KE=; b=zPyPbSdJh7SWNy
	9Zk41crigYajaa8oPiF47rLOT5bgIVen5wLL1iCijMdBCBjG4H1UghV7bmqLdWi8ODlQaVT+YjY1z
	1RNfCg3nOf6cDPOSKbmJUhGnlsQKC2hDyR78PJN4wXwWU914bbC0ssFo4Ga6a8pK0mwwSzlSZKyMd
	/nkqh7G01hcahr4PlHrf4S+zKv34FAwWJneU5xtdU/KxUkRgK9+hS1DEgzHw6mjir/0bkYVIS/gMM
	c+yld5UgDGSsyBS9E5Bx4jgHkiMm6UEC4upqvJQFUJ8pZIgjZj8K8vtB4iNHxWawoIhtEiRh/9WUm
	AzReK+5sFlRTp0TO4O+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWnv-00000009p7V-48Gj;
	Fri, 23 Feb 2024 14:45:35 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWnl-00000009p3m-12l7
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 14:45:34 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dc5d0162bcso7398325ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 06:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708699524; x=1709304324; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYS368qujw0WANetUJ0YWVVEYUneG/dCxdwk6stMB3o=;
        b=eROSBiqw3mRBoa6wCWaJyk2w52KkaPj6kxjZu8YeFbzPmmq7+0dwio2Hke2qrrINfj
         Pdo0w+FDZUf9i4yKtVJLtDzXt6AFa1JSclCrpKw0TME/FDulFI7bKwYYW2D5s9C8lbed
         X9+mafNK39bq42oXOgpQqcV9UgUvwqeapJh8RbEQ/IeobIsTQO0ZQcB1bhtfPLF/1zrV
         w92on6FWKQ0cZr97z4Xl5W4+VIjNL3vI6m4VbsqGcGcL+yfsrrBPelErqtQ2O9Y7sWuL
         ZVya8kQ3nCZ7HuCj3rWcnbuoLr7P3K75XxO1r1KSj9cLzyU+IQWD/d9xdph8p2Pn8J8S
         WaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708699524; x=1709304324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYS368qujw0WANetUJ0YWVVEYUneG/dCxdwk6stMB3o=;
        b=tbY0M2kB7Qfge2VIy4AZ0ZPOIdg4SKvpOvQMqGltA/Hh+NfdFAcYeFaRfYU2pjBRBB
         YH+OM6NcX+dy9sM8fKeUrZTWJIHzIeJb8dY55gQa7cpCwBo71DsIfzQHuTGPnNasfwkS
         bnmyZRatyLLexz3kkj8KZDKVCHgEtsbYkO37Z7zCPF34ZKOgfFsCr3s8rG/5eXY92BsO
         rOKGx4IzbQ9/HpKNCsDmw4CWdhNn7J/2w02PvsOA2ndJ7v0Hg4dcY3PxXy/qvS5ajnLw
         3v4n7KX3L6T3ckHifZKi7rM+XmOTwRE+Hlks5gv0K76fhnSSQeRi+Y21Y2N+PCsAFeNh
         gQ+g==
X-Gm-Message-State: AOJu0YwxjWCPh6yq1XqXXBX0qb7nYEnBdlsHraYQjQPOS4gpN/jZVi5E
	2Nve3my0z7BnrYBWp8QQi1nedPVeRuf+n/jRYj82ilB0Q7baaPHpzgqKXZKwHWEUsIUuq55bpcS
	WN236J8tMBA2Tif7cprns3YNBIvI=
X-Google-Smtp-Source: AGHT+IGQh4Gasx98EwmKbpWjx7oNjPOHi30hzceQIltFlR3Zv8xEu09Tzkr96XjYz57W4Vc5AnxGSufwQh5QIluHSa4=
X-Received: by 2002:a17:902:f811:b0:1d9:7095:7e3c with SMTP id
 ix17-20020a170902f81100b001d970957e3cmr1600961plb.57.1708699522325; Fri, 23
 Feb 2024 06:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-perjury-preshow-fc2cf73d552e@spud>
In-Reply-To: <20240223-perjury-preshow-fc2cf73d552e@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Feb 2024 15:45:10 +0100
Message-ID: <CANiq72=mCnm0mKOw5K44PmZ+jF=67jxEEkcXP-E0O8CaUrps=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: make mutually exclusive with CFI_CLANG
To: Conor Dooley <conor@kernel.org>, Matthew Maurer <mmaurer@google.com>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Ramon de C Valle <rcvalle@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_064529_816318_6671E2CD 
X-CRM114-Status: UNSURE (   7.91  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgMjozOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBjb25maWd1cmluZyBhIGtlcm5lbCB3aXRob3V0IHN5bW1ldHJp
Y2FsIHN1cHBvcnQgZm9yIGtmaS4KCk5pdDogdHlwby4KCj4gVGhpcyBwcm9iYWJseSBuZWVkcyB0
byBnbyB0byBzdGFibGUuIFRoZSBjb3JyZWN0IGZpeGVzIHRhZyBmb3IgdGhhdCBJIGFtCj4gbm90
IHN1cmUgb2YgaG93ZXZlciwgYnV0IHNpbmNlIENGSV9DTEFORyBwcmVkYXRlcyBSVVNULCBJIGJs
YW1lZCB0aGUKPiBjb21taXQgYWRkaW5nIHJ1c3Qgc3VwcG9ydC4KCkNjJ2luZyBNYXR0aGV3IGV0
IGFsLiBpbiBjYXNlIHRoaXMgaXMgYSBwcm9ibGVtIGZvciB0aGVtLCBidXQgSSBndWVzcwp3ZSBj
YW4gcmVsYXggaXQgbGF0ZXIgYXMgbmVlZGVkLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
