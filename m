Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112BCC678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 11:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOw7JAeNIhtaYDpTkkr9nMQ8Z1l9gvZNbWyzBwAu1Xk=; b=B4MD1ZezXXX3xc
	Tv72nhHpHGZJSBJpiy6SXsnL+aBPaz3iyP/U8CDSUvof3BuAzX8bpQFHULyrfddJIdOUdS7zoNaQ9
	Rzt/N43SASi44HUub7zcWD6cIbgbcS0DjPsmpkZod58/G/AP5ra4iBhXBxnfF7D3NtkO/r9SsPJ3T
	Rr4sTwVUnXCoclj6AQdvoWo9eQNziCCPCiSuIRWhEVy1TOz/uHfcKqLdZYzVzoIK4SY4PQZiu5Jqx
	9CBtPeiQYLZAUMZKtNbOWCwMJxBx8QHNaedhqu7ejsS8cbvxkC/E/S0CjNj/1KK2C2E1bc4iKGco0
	k5yir8yFMqJKwdqSZ2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVvz-00HYTy-Lz; Tue, 07 Mar 2023 11:56:47 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVvw-00HYSA-8p
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 11:56:45 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-536c2a1cc07so239919837b3.5
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678190201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fpzu6mM9TObEaWPqTRbV/lVIlKZNjyI+OGMeOTlpmmM=;
        b=HlTlFZ6JpzfQr4iv30oIdQyWt5EKVG4KlPTb+CtXgnhcokg9agdArzRPjQaAhjClKC
         ZdKh92km6nxWkT3uQOqDjCk/L1h0yTo3J3/U6pK8OkC1WlgHQdR+UJzqYNSNfKh56g1h
         P6SjgUcedkQsE7840DprGK0z/3YIOuMtgwSwzxamhNMXCsjz/bOD5MvATFVETc5SR+UT
         iBVMPMKPl2EtwWqT8Im+I1/eoqcIyrslwnxUhawQPD4rEIjHRjbkTYaGZlWu3279wo1m
         o9hRTRw9GolZcvpByHOv1j8JCWQJ9mYMpP+s0DjAfQlcib7hjtoM8L2U5RyjFmGHJHtj
         o/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678190201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fpzu6mM9TObEaWPqTRbV/lVIlKZNjyI+OGMeOTlpmmM=;
        b=ypsH2tqxorEo2u2Ropgk5f+QWj3URTHbyc1yY0z9Lg2PdBZ+W8wx8pzQrd8R2KJhHN
         +8ubsB6yRNcrRiwRXKUZNTvNK7XFkRlsj0mq1sOEKtIcYO8i/qTaM2yx7fFxP3hzBEKV
         NFtF8aHGZlNZPwjym/yc/NT/1HnxGk5TkJzedAfO3vji8Qpu/4gm7i9E1uqco7z2BGcF
         1kYh9DlnwToeNPbbBgCJCIoNPyDCHReTi/2KwQcROTI1EvxUJA/BLEraeQnp2Kybs9Uh
         IeS+MmrY8beQWR9FRQ7RWD0e46FuM3VBetZqSMw9TW1yHmtUVtjVNgwODCDl6tEXRQ5U
         /paA==
X-Gm-Message-State: AO0yUKWatM4J8Ctv8tkj62liw3lrEuF2CSfbnVTG7WmZrdg5k6P6u+K2
	UBXsH5lk5v1jnMeykhEmoOhFphNhx0wEu+2D8mA=
X-Google-Smtp-Source: AK7set+XuApmsHpeE59OAObEV85h6yLM1xkplSm7PT1n4hNgCYOTpCcCuw40R2D3CdnvscfMkze9+dwV/8bTBkxG6YU=
X-Received: by 2002:a81:b61a:0:b0:52e:c79a:cda with SMTP id
 u26-20020a81b61a000000b0052ec79a0cdamr9075327ywh.10.1678190201054; Tue, 07
 Mar 2023 03:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230307102441.94417-3-conor.dooley@microchip.com> <CANiq72nLjBgMSUTtWuF7qU5vG9rA3v=ekWk1d6+SNiGkfcaS8Q@mail.gmail.com>
 <ZAcZeWYUU75BK5FO@wendy>
In-Reply-To: <ZAcZeWYUU75BK5FO@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Mar 2023 12:56:30 +0100
Message-ID: <CANiq72kz2qxsB9JG7OB02KMAfy-YvokCFWMuEj_bkaY8i5tdVg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] RISC-V: enable building 64-bit kernels with rust support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_035644_323642_35BF5E39 
X-CRM114-Status: UNSURE (   6.90  )
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

T24gVHVlLCBNYXIgNywgMjAyMyBhdCAxMjowMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gQ29vbC4gR2l0IHNob3VsZCByZXNvbHZlIHRo
YXQsIHByb2JhYmx5IHdpdGhvdXQgZXZlbiBnZW5lcmF0aW5nIGEKPiBjb25mbGljdCBpbiAtbmV4
dCwgcmlnaHQ/CgpJIHRoaW5rIGl0IHdpbGwgY29uZmxpY3QuCgpTaW5jZSB0aGUgY2xlYW51cCBp
cyBlbHNld2hlcmUgYW5kIGl0IG1heSBhZGQgd29yayBmb3IgdGhlIC1uZXh0Cm1haW50YWluZXIs
IGl0IGlzIHByb2JhYmx5IGJlc3QgdG8gdGFrZSBpdCBvdXQgaW4gdjIuCgpDaGVlcnMsCk1pZ3Vl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
