Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A01C0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 19:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0kgXsdYETi70C+rYvkJvjDMrAg7dWJZjvuROTiKnvg=; b=KtB7NfByVvja5i
	sfQ9gt4Df+Gn6v+tt0zHVUeIG3DRp1iBivCoUvsZG1N4zmJyKwDdrlozr2MB0FsRE17LXI6y3bGU5
	7bTuN1c3iTkrYTmykQw5qaJ69HR+0cb+1sdt2KU3aFWR1TJG2RotI/GKWlG4cJBtgzadR4H2wihXj
	42LxdRv4muwxt2ozxIcefDD5BkvhiE/3xVC4wyuYE8kISU1XRRoSppTTvwOrPT3wAYJcM0PSXeWrL
	w9WXzI0VYZJmvEkNJtxdypf/E2qV26Nb99SO+Ky3Jbw0y2qPz58QvmVb+c33JJJ2Dh3WVBwwzsauU
	wpwpgPbjOR5KQHAQtN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwHX-0000000BGLR-0Paj;
	Fri, 31 Jan 2025 19:02:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwHU-0000000BGL6-2LDc
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 19:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3689BA420A8
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 19:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E28C4CEDF
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 19:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738350139;
	bh=6AVpoP/2O64gR7R9RqSs9Cdk8c5iQpPg8cARe9RGlP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D1CT09mUJEf8McFk33sHFibQKDqHllP9XYFGOf4EWp8f5MfRpHLLfBEcP3MCQkdwY
	 I9/HMBtAR8eZB9s2Xcns7npwH7WdeJ1GyTMSGKxv2j7dcDT0DdYF+wyRkBdFNqyFDh
	 5PSv66+xD2lYqFjsAByY45E+wKRkDgaWFlTTkysUpPsPmEBJOd8myIV2AI0f/z02UN
	 iYiPIxiRc08n9iuw21DbigQy2Er8DB8m6ufBeT26z7hqwpp2MAZ+kcJD9Zu/2RTVe7
	 Za7PAl/caLvdVPz5a1VAki86NoE1XNmmzo8Bx7MK3QfsnphmitfS7pxqDWqXAV1pK/
	 rir2yli1OFSXQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5439a6179a7so2315456e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 11:02:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhH/5+39ipI8zOt+u3LB4V4ZNU2mnIfGoXsg5DYITq08Bvq1eS9doKJaHwLSU+UXrxOXqT3v3Ri7unHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBxwJPKg/vYvI4VnZ5g/XiJD1Xd1Fq5jJrOjT0ZMOfQYS2Pv7H
	ezZJkiGiOMT/8LWXtZZ/9favG9qAm15yOdnl1KkX7meLzSChuKdjVgjMymnXdUXqhaIK+JKBH7s
	ZF6gUVAX8wuIf/RpQjsx7+vavLAM=
X-Google-Smtp-Source: AGHT+IHaNiLPZ0x1/qDe4DXPLTcobvQaN1iClH+Dzh4E1ofSiwuHsKBCOpyx9EK2FpIQJy+A5/aMr0wXo3PrtTM4YzQ=
X-Received: by 2002:a05:6512:ba4:b0:543:e485:815 with SMTP id
 2adb3069b0e04-543f0ef31fbmr1553901e87.10.1738350137687; Fri, 31 Jan 2025
 11:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
 <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com> <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com>
In-Reply-To: <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Jan 2025 20:02:06 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHeSnGcWRs1=kvJrqrUxgfsFDKPTAqQne6Le7pmComtYA@mail.gmail.com>
X-Gm-Features: AWEUYZkzScnFkN4gfKp8BOqJS510B4DuLEBHcSAhfZCajq1YQZEhaJs1ZcqtkMc
Message-ID: <CAMj1kXHeSnGcWRs1=kvJrqrUxgfsFDKPTAqQne6Le7pmComtYA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_110220_657845_CEA65A7E 
X-CRM114-Status: GOOD (  14.60  )
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

T24gRnJpLCAzMSBKYW4gMjAyNSBhdCAxOTo1OCwgTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIEZlYiAxLCAyMDI1IGF0IDM6NDDigK9BTSBB
cmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIDMx
IEphbiAyMDI1IGF0IDE5OjM1LCBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgMTI6NTPigK9BTSBB
cmQgQmllc2hldXZlbCA8YXJkYitnaXRAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiBGcm9tOiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgo+ID4gPiA+Cj4gPiA+ID4g
RHVlIHRvIHRoZSBmYWN0IHRoYXQgcnVudGltZSBjb25zdCBFTEYgc2VjdGlvbnMgYXJlIG5hbWVk
IHdpdGhvdXQgYQo+ID4gPiA+IGxlYWRpbmcgcGVyaW9kIG9yIGRvdWJsZSB1bmRlcnNjb3JlLCB0
aGUgUlNUUklQIGxvZ2ljIHRoYXQgcmVtb3ZlcyB0aGUKPiA+ID4gPiBzdGF0aWMgUkVMQSBzZWN0
aW9ucyBmcm9tIHZtbGludXggZmFpbHMgdG8gaWRlbnRpZnkgdGhlbS4KPiA+ID4KPiA+ID4KPiA+
ID4gRHVtYiBxdWVzdGlvbiAtIHdoeSBjYW4ndCB5b3UgcmVuYW1lIHRoZSBzZWN0aW9uICdydW50
aW1lKicgdG8gJy5ydW50aW1lKicgPwo+ID4gPgo+ID4gPiAucmVsKiBtYXRjaGVzIHRvIHNlY3Rp
b25zIHRoYXQganVzdCBoYXBwZW4gdG8gc3RhcnQgd2l0aCAnLnJlbCcsCj4gPiA+IHdoaWNoIG1h
eSBub3QgYmUgUkVMIG9yIFJFTEEuCj4gPiA+Cj4gPgo+ID4gVGhhdCBpcyB3aGF0IEkgcHJvcG9z
ZWQgb3JpZ2luYWxseSBbMF0gYnV0IGl0IHdhcyBzaG90IGRvd24gYnkgTGludXMuCj4gPgo+ID4g
WzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTAxNDEyNTcwMy4yMjg3OTM2LTQt
YXJkYitnaXRAZ29vZ2xlLmNvbS9ULyN1Cj4KPgo+IERvZXMgdGhpcyB3b3JrID8KPgo+ICQoT0JK
Q09QWSkgLS1yZW1vdmUtcmVsb2NhdGlvbnM9JyonICRACj4KCk9ubHkgd2l0aCBiaW51dGlscywg
bm90IHdpdGggbGx2bS1vYmpjb3B5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
