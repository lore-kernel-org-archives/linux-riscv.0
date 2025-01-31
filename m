Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DD3C0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 18:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvcBWoeSoE/w2/4NM8u+bEX6mAXdgk4rA+g8omNtnjU=; b=DoDELhpprpSiJM
	ReK3Nol0pvqIaW7L9UIGzF2qgEU5UZCzIldapbbS3nCqV63VKJRtl75DyDTsIScTuQ+dfyWXC2/ff
	xNtlf+pUfdWpNSUSvLrX9QFzDpzINeVla+QWWRCSAGTQfYsFgygt/HNauZWB43Xg+5KB5bVLqlgHQ
	IY9lANHDLDUambCoc1dxhFE82/fu7IVRk2t3Eq35ZvuJ7PxTzWAZyVDhRt6aLE5GlBuPrPTdCwarg
	5EMpHoBDFBd3xniy5s7+vpJ51jBKRLeL82GazjzAIsLFb40jDIKJsXcitPnm7xo+AS67mBlM9H1J7
	9lm0iNGxujrh4VIvKRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvwX-0000000BEqQ-2nJ9;
	Fri, 31 Jan 2025 18:40:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdvwV-0000000BEq1-0d66
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 18:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C236A4210F
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 18:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F15C4CEE3
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738348837;
	bh=HocyuMQRt/Jb/+PhULdNRTzn6VciVwMKpzCeYQ7J9jw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=M2cNh50Eu/F7JDW4BQp4ARFBFKQY195tn1ptJE10HDN9HW/1V4PAbIuWpUW3QoKkG
	 BEOofeY0shf3V8aMljPbHOInTOxvcsF0IimDfvN/bHLVhssHBPVd5j6NBNQS1u8wxZ
	 a85Q8DUReOc06qJMowCKM/9SsaoaAA4vjSnzF2J42Dfgq8jN4+2azvpFeznxMnqcuG
	 lSMBASDlEOErhzS3qaFGBrhPJBlBxzV2s9ojZfUf+8EqM14jRY2up1HtdxRtkaiKgJ
	 EYEsWezXqkdtnZpT0548P1pMmtq3JUUpbPl9hPLZ2zsbybxWn+a4yitiKKafZLtG4G
	 Ki2pW8vFpMStA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-543e49a10f5so2425465e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 10:40:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUjSOeviJsyEYPlopCa6PgNZ+Ff2n0JfZv/EcKdB4wCX1HT+w0rA7YQk+MXupOmN0zfexpC32HuxNE12g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaHNh+R5rT17Jtbxnn71nb2T8UP5Bz9aSdYOYdJT0u+hvDV73o
	+A79O3oufbl4Co1y7KQFf1NjGLgqO4MWNTmsOxF0gRwLgk9DAMgQUeKNLlu9QUmsFCjEGAHLKMl
	diN/kfshd5zsG0LS6F+iZ1eWmMFs=
X-Google-Smtp-Source: AGHT+IHdKn9VqjLBKaDbjxSRGDxQQw7nKxOIaBP1a43GPldoC1cyLVVrxGrDHZgDHOgeyoJr8p4yOQe5I/qrgaM3GJ8=
X-Received: by 2002:a05:6512:3d86:b0:543:bb21:4245 with SMTP id
 2adb3069b0e04-543e4c037a3mr4510825e87.28.1738348835776; Fri, 31 Jan 2025
 10:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
In-Reply-To: <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Jan 2025 19:40:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
X-Gm-Features: AWEUYZmtraJ0f1xtPGTQ8Kk14Y8os0Pf_CFXonFppaQr6hImtn_0cqsdTmSGWzY
Message-ID: <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_104039_251899_47B88C28 
X-CRM114-Status: GOOD (  10.41  )
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

T24gRnJpLCAzMSBKYW4gMjAyNSBhdCAxOTozNSwgTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEphbiAxNCwgMjAyNSBhdCAxMjo1M+KAr0FN
IEFyZCBCaWVzaGV1dmVsIDxhcmRiK2dpdEBnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9t
OiBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPgo+ID4KPiA+IER1ZSB0byB0aGUgZmFj
dCB0aGF0IHJ1bnRpbWUgY29uc3QgRUxGIHNlY3Rpb25zIGFyZSBuYW1lZCB3aXRob3V0IGEKPiA+
IGxlYWRpbmcgcGVyaW9kIG9yIGRvdWJsZSB1bmRlcnNjb3JlLCB0aGUgUlNUUklQIGxvZ2ljIHRo
YXQgcmVtb3ZlcyB0aGUKPiA+IHN0YXRpYyBSRUxBIHNlY3Rpb25zIGZyb20gdm1saW51eCBmYWls
cyB0byBpZGVudGlmeSB0aGVtLgo+Cj4KPiBEdW1iIHF1ZXN0aW9uIC0gd2h5IGNhbid0IHlvdSBy
ZW5hbWUgdGhlIHNlY3Rpb24gJ3J1bnRpbWUqJyB0byAnLnJ1bnRpbWUqJyA/Cj4KPiAucmVsKiBt
YXRjaGVzIHRvIHNlY3Rpb25zIHRoYXQganVzdCBoYXBwZW4gdG8gc3RhcnQgd2l0aCAnLnJlbCcs
Cj4gd2hpY2ggbWF5IG5vdCBiZSBSRUwgb3IgUkVMQS4KPgoKVGhhdCBpcyB3aGF0IEkgcHJvcG9z
ZWQgb3JpZ2luYWxseSBbMF0gYnV0IGl0IHdhcyBzaG90IGRvd24gYnkgTGludXMuCgpbMF0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMDE0MTI1NzAzLjIyODc5MzYtNC1hcmRiK2dp
dEBnb29nbGUuY29tL1QvI3UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
