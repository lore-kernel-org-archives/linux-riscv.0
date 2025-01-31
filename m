Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0910C0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cd0aIEgPz2E63tdo8DVoNeJi2B/zOw2BLVYqDro8YEg=; b=wg8hc0ezsuOdpO
	7vqbR1fMr8y2pUB6ijFd2MVqeEC4xKjxkpLGg4G7/BaTsnvOEt+qoepl23RJmajCDFGDDSaLAelxS
	R+lyU3kvjO4yI/rQMAiA7+ekt9FeHU3bksaCc9zfltJKFuBUgANg0hP9uPGqNseWIiMwjCvnFJLZs
	qyAaHTleLQfdgpNHlVHd7QCUnR3bPLgJnzfGeVU6+Cap4tQDAIoviROv3BSGi5n//qoTRKFoV5K0C
	RXkW4xtWMU5FukqKs152UD0c5jo6+dWn923Eb+xNfHlXzE2zEHXv7M91ISJFLpQQaULjVjPiiymv9
	xuCIJ0Fx7VY35YqZ3hCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwF2-0000000BG8J-17pP;
	Fri, 31 Jan 2025 18:59:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwDk-0000000BG08-2tnl
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 18:58:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 143E85C6396
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 18:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC8BC4CEE4
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738349907;
	bh=8T0Fu4jQpJW1MEbplsGTq5WDKApJUV829RbJsPGKt/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l23MIy99HW5a9m3DvfScOln9zW8EzMu1cRwASe7mZxXRTCm4snVO5V2rU7LfQuHCS
	 w+on12Z5SQKZZM1FYy+Hzt5/Vre/yBt1amIwV0Z5onYot4NM66oNPkAusr/tKB9Dqc
	 TQrDHCXLtVX7CkfIERNeTSZ/PLQZJqz979bUAwn4duukwkPRxdT78L0ZRLfMy0F8kH
	 +w1zGFc3Kr1hdcqBVhrLyxzV/09BcFDtJskYJTmwgqYPfa+MX6T65xW5vJxm0E9ev4
	 9tyiBO/TND+LqWl28fLUCFtdKyE+9uM/vdhG4PTMJdwP6Ve8TGX5uCYVditfSDVNDV
	 3wyFpOsX8zzgQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5401c68b89eso2203186e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 10:58:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiaXtd7J2qbIS3282z/9HIW5hTnvRoS/8qG478xOcxPGmIhX+aVWZLaMbcFk/zCpviyh9Yh/IzqA76QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDTGQFkSmcOqlJw5JIdMi5DqVr3iIZaTpFr0DdNQleaK+mxdUb
	pBnxYO43Bf8BoCAmwGvdn103UmhAtQxaJoZTGLJsPveYx7eJpCPpqtz0GabFYN/l7R8KDeuY7F4
	UeEx42tkgBfzQq6U67k3EW2fYfy8=
X-Google-Smtp-Source: AGHT+IFIPqTfnhk6FPxdV3GH4AYquqbLfOA6DSr10iylUvN2fvjV5sJM9a8I5o6+bw9IwkO+BVvQcj4Si0UGBbntnaM=
X-Received: by 2002:a05:6512:3e09:b0:543:9b0d:d388 with SMTP id
 2adb3069b0e04-543f0f25369mr1674159e87.19.1738349906418; Fri, 31 Jan 2025
 10:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20250113155306.1922992-2-ardb+git@google.com> <CAK7LNARmPcM2RTBOfpep7puY8hSJ4rz6mOrw+5EuFHh6iQ0_iA@mail.gmail.com>
 <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
In-Reply-To: <CAMj1kXHuyJ548mkPNcmU=+oj2mfeNk-4igTHXxo0oDbvz9f8wA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 03:57:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com>
X-Gm-Features: AWEUYZnXEnzSkyH22Y1Hiq-WeTYacue4wQNixNlwBXfwAecfzlc0IVNBozaxrGM
Message-ID: <CAK7LNAQA+VhDf3ZGLmTjLm1JCEvKYPu2jnAUghxMKoCn+BEQ=Q@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_105828_772551_379F9C0D 
X-CRM114-Status: GOOD (  11.80  )
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

T24gU2F0LCBGZWIgMSwgMjAyNSBhdCAzOjQw4oCvQU0gQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIDMxIEphbiAyMDI1IGF0IDE5OjM1LCBNYXNhaGly
byBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBUdWUsIEph
biAxNCwgMjAyNSBhdCAxMjo1M+KAr0FNIEFyZCBCaWVzaGV1dmVsIDxhcmRiK2dpdEBnb29nbGUu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gRnJvbTogQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVs
Lm9yZz4KPiA+ID4KPiA+ID4gRHVlIHRvIHRoZSBmYWN0IHRoYXQgcnVudGltZSBjb25zdCBFTEYg
c2VjdGlvbnMgYXJlIG5hbWVkIHdpdGhvdXQgYQo+ID4gPiBsZWFkaW5nIHBlcmlvZCBvciBkb3Vi
bGUgdW5kZXJzY29yZSwgdGhlIFJTVFJJUCBsb2dpYyB0aGF0IHJlbW92ZXMgdGhlCj4gPiA+IHN0
YXRpYyBSRUxBIHNlY3Rpb25zIGZyb20gdm1saW51eCBmYWlscyB0byBpZGVudGlmeSB0aGVtLgo+
ID4KPiA+Cj4gPiBEdW1iIHF1ZXN0aW9uIC0gd2h5IGNhbid0IHlvdSByZW5hbWUgdGhlIHNlY3Rp
b24gJ3J1bnRpbWUqJyB0byAnLnJ1bnRpbWUqJyA/Cj4gPgo+ID4gLnJlbCogbWF0Y2hlcyB0byBz
ZWN0aW9ucyB0aGF0IGp1c3QgaGFwcGVuIHRvIHN0YXJ0IHdpdGggJy5yZWwnLAo+ID4gd2hpY2gg
bWF5IG5vdCBiZSBSRUwgb3IgUkVMQS4KPiA+Cj4KPiBUaGF0IGlzIHdoYXQgSSBwcm9wb3NlZCBv
cmlnaW5hbGx5IFswXSBidXQgaXQgd2FzIHNob3QgZG93biBieSBMaW51cy4KPgo+IFswXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDEwMTQxMjU3MDMuMjI4NzkzNi00LWFyZGIrZ2l0
QGdvb2dsZS5jb20vVC8jdQoKCkRvZXMgdGhpcyB3b3JrID8KCiQoT0JKQ09QWSkgLS1yZW1vdmUt
cmVsb2NhdGlvbnM9JyonICRACgoKCgotLSAKQmVzdCBSZWdhcmRzCk1hc2FoaXJvIFlhbWFkYQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
