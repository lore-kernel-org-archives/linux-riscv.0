Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A87C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=onGHExQT4CqIqo4ieaQzsgKb80S2l3AryjxgTSWmdBE=; b=buizISjXQewfY6
	yu3Fw/Uc3wSu7At5dfWQj6fVOVKX6nGJa238D5akuc6YPj6fKmsqsYqSrRK8kILga/kNikW3j6O+9
	wMCdmJBkFgLsS4OiQTI6r3CtsNd5tCbxFyNMffSY/Vn85Bwt541caTvAw8IhGLJ/2toBMzdMIYL8v
	zG2+/rsE9edrPD9ZODfk5UlUfHHj5vVMjs7wEtXnxWlaTgJG4MYlpSraeofM7hz3t+HorX4h7p7ot
	xkdKkDHIrufpMyp/KwBsgmRpMR2LYEVYvfXF378Ltn7zY7Vbyt/w6c/4uRkW9SYDINPg0Vi9pgdOr
	uemwPpEzEO4EH4WsMwMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewfH-00000005D4Y-07Jq;
	Tue, 27 Feb 2024 12:34:31 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewfE-00000005D46-39oK
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 12:34:30 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-29954bb87b4so2889024a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 04:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709037267; x=1709642067; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9j9qlONozduTz+bniTZX4spLz7Dtuw1zBMBtIuIeC0=;
        b=aUhkyqgt7oQGZ7JopEggvjTZCvL5YBUHwrjMC+jq+qNLWMBMheJMbKGIR+STc3B5Qm
         5ziZ4lY21/M2eg4iXk2iQNnhxukqierr+9namn0mmTZYsi0JMe6oloAyaLkPPwF2AKgs
         /fP4XKUHtJvmObQC0fPb5eiJ3zRjT5HjWhVRRGMQdBHwmC9xnCrvEdCo7EaHCLaY9ktv
         y7fEqDxjZNtLrIydedqe7j46VOT/lRbJQPsdIImXCpE4+oEJPfbk5grk0n7dzYP1b1yF
         WfqbF3yCbUGqXiiUf+NT/SK9S69WpAxA3gqLUHbwgST5i3COof0exJUw9VmKEwBTBzuy
         fWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709037267; x=1709642067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9j9qlONozduTz+bniTZX4spLz7Dtuw1zBMBtIuIeC0=;
        b=dhMdlRC/C86dfJdleFWlILoDae65sf49YRzocAyQqaeM+Cvj/hQIMLd7tJO/CTzkXj
         ZC7fJhpgMBALixpjBT9bb0l3YgCO/NP8Opadjiy6tzaWAtKIibkQXQRRloEE3FjfGyRo
         hcX3gmdgrnCbG50sMnRSIwE5Yupeu9kH1vRAoKen3c0zcEeAhHggLyYzM6uoXZxmac1a
         VF1tN1PmLiiMRT7WSq/l5eYVPWPGP3YUWf3lup88ihwEWLZKN55hXVJ9C0lwzjZ9RHCj
         iNT3rfEBUR9OwrIJ8FiBKCsu6lhPc2d8StfmXxfHG2KrZPKDt1CBb9Ev4eTEtoWBeCX7
         YM6g==
X-Forwarded-Encrypted: i=1; AJvYcCWs3Qep37nhbuguyInoRUVt9q8Z4r7HodsrQw24zci/ILniRX7PqgsM8lTFfGHkFL3c6NmhPOmkOA/7KJ2jQBrYKEDohoZvl0jEglYuHQjy
X-Gm-Message-State: AOJu0YzPgme6GXlWwSEP8s72YwedtlGw1pbaGLC3pqu8OM9pW0RnREwO
	Uaxq6FiZhA8uDddH/bIQo0mgsjAFBmvErXbzr37hND9ER+HIcMlOTPgqc7TlHICxXGZX8PeIXEj
	QZ0yUjQLN6JO+cBYEgwywe9RdZgI=
X-Google-Smtp-Source: AGHT+IEuXAPX9FOqOhNJb3Owku+lxeLjmPjbeDLcLvCF79H6OR73WYykC8gycjj0GEybh553JRImPRMosUkl+JhzaAA=
X-Received: by 2002:a17:90a:5804:b0:299:389e:b611 with SMTP id
 h4-20020a17090a580400b00299389eb611mr5540528pji.47.1709037266902; Tue, 27 Feb
 2024 04:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-perjury-preshow-fc2cf73d552e@spud>
 <CANiq72=mCnm0mKOw5K44PmZ+jF=67jxEEkcXP-E0O8CaUrps=w@mail.gmail.com> <20240227-uncertain-amaze-6197e627ad95@wendy>
In-Reply-To: <20240227-uncertain-amaze-6197e627ad95@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 13:34:14 +0100
Message-ID: <CANiq72=geBobqM0Dc2yv=NjAc3MWXhOrDHfuJ84TgQ+XVxBo0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: make mutually exclusive with CFI_CLANG
To: Conor Dooley <conor.dooley@microchip.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Ramon de C Valle <rcvalle@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_043428_811633_83E9004A 
X-CRM114-Status: GOOD (  10.70  )
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

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMTE6NTTigK9BTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IEkgZGlkIHRyeSB0byB0ZXN0IGl0IGJ1dCBJ
IHJhbiBpbnRvIHRvbyBtYW55IHRvb2xjaGFpbiBpc3N1ZXMgLSBteQo+IG9sZGVyIGNvcGllcyBv
ZiBMTFZNIChwcmUgMTcpIGFyZSBub3QgbXVsdGlhcmNoIGFzIEkgYnVpbHQgdGhlbSBieSBoYW5k
Cj4gd2l0aCBQR08gZm9yIHg4NiBhbmQgUklTQy1WLiBNeSBMTFZNIDE3IGlzIGZyb20ga2VybmVs
Lm9yZyBhbmQgaGFzIG5vCj4gbGliY2xhbmcuIEFuZCB0aGVuIHRoZSBjb3B5IG9mIExMVk0gMTgg
b24ga2VybmVsLm9yZyBhcHBhcmVudGx5IGRvZXMgbm90Cj4gc3VwcG9ydCBrY2ZpIGF0IGFsbC4g
SSBnYXZlIHVwIHRoZXJlLCBidXQgSSBkb24ndCBzZWUgaG93IHRoaXMgd291bGQgbm90CgpJIGFz
a2VkIE5hdGhhbiB0byBhZGQgbGliY2xhbmcgYSBmZXcgZGF5cyBhZ28sIGFuZCBoZSB2ZXJ5IHF1
aWNrbHkgZGlkCml0IGZvciBMTFZNIDE4IC0tIHRob3VnaCBJIGRvbid0IGtub3cgdGhlIHBsYW4g
Zm9yIHRoZSBvdGhlcnMuIEkganVzdApwaW5nZWQgaW4gdGhhdCB0aHJlYWQuCgpDaGVlcnMsCk1p
Z3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
