Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51407EEB57B
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jan 2026 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdI2ggUO4x2xQLmeir5uRRIhyHQoCaivF/lJJQBw5sI=; b=T6aWGvTtmhtB7S
	ZIdFogAAtFdyb1aN03V9hVrHlGvLr++cC1oJL72b366Lj6CpCJABGuwE0jP3d4KbJ7fB4Op9HU/at
	UzwwGZyNQ/vBC9Sa5LI3RL3Rccf0qgh4Zdg+pBBXrxelO3DG9wO5G1wE+3iehHeGenQioG3lRu84W
	g4f44NaEGJQWL8AZ0XJyNivqmHMeTcyTh3E0GCdZB1SwmSJarzg6HXD852pu4+RlKUaBB23HFwX7D
	SVILhOnLAHPXX07LhVK5eUJLWHIjARTqhibb8QojdWOiTEXADp4DS0ITHoXxnzMKqVSpSsngat127
	opl3K2HH/ZbtUtQb4qpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRUh-00000007cTo-3ijf;
	Thu, 01 Jan 2026 22:50:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRUf-00000007cTR-3k8c
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jan 2026 22:50:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D75614068B
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jan 2026 22:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C2CC4AF09
	for <linux-riscv@lists.infradead.org>; Thu,  1 Jan 2026 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307808;
	bh=qoQ2LWoUBAb80RcbR+OV8fg8vhcqgnhQ8/NW3hsNVFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IYRH+e1xZasvaKPQTcFF+l7qwCxD82O18aOK/MFql6CMiErq9pPez9MkpXc6fs+PR
	 vNIxJbPUcUpA0nR6mHzduQZbK0nBsS8EPnzFqpzTTKIbt9mlZiQEH+Hub7X/3udWkU
	 c2iC5P3APhxNoYuZmYKzhoJesw2LkcufH62SPxn8naJKYBu4mNUPQyBRvpQIxosjL2
	 i024rcHVvAvioc93SEzzqWXDBXL2NbAQaHbmPRcDkm2R2SJX+1rTz6XdQBb5EuCpXe
	 ky3FzontcHnhpfChURVpedREzdL+herqaKtMtDSlKPzhu+drjrcSJIdAzFjxVXPh2n
	 UWasZDHSCAIeA==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6447743ce90so10682356d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Jan 2026 14:50:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1i/tCbkb7vWIV71l4cNdarQiXyZECWSZVJ9O7PI/J59RZ44SdHZK9rKiWNUTqV5kniUnuXXJyl7DLzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0OMVPArgMI/DoWwUHpJhwvZIAC/SSN+f8NUdvhD5hQXB0n496
	UgEoD7rFdhrWxlfJ1YOUFUxe0Urz606PhbDNoMyLnjpRjCL9eNXtmqfcDIX1p1pW93YQdUpQqzC
	D663uirqNiXUy/C6nk/tLB9YCBN0uWhQ=
X-Google-Smtp-Source: AGHT+IGrOLcTdHnWAvTikdGCf6UnlAcc0B+tsmqY9EjgNAatB1fqNxo0UDIF6456Ig9rz2ogunu8BgIZ5Cj1gcf0eoM=
X-Received: by 2002:a05:690e:2457:b0:644:60d9:7514 with SMTP id
 956f58d0204a3-6466a8c5b6emr24385932d50.88.1767307808085; Thu, 01 Jan 2026
 14:50:08 -0800 (PST)
MIME-Version: 1.0
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
In-Reply-To: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:49:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
X-Gm-Features: AQt7F2rP7_9KdxaprrRWjgopjc31HFpU37nXxJKU_cZD0aXworSU8dVIf4jtxh0
Message-ID: <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: add support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_145010_016411_CFF7788A 
X-CRM114-Status: GOOD (  14.05  )
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

SGkgWWl4dW4sCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2hlcyEKCk9uIEZyaSwgRGVjIDI2LCAyMDI1
IGF0IDE6NTjigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9vLm9yZz4gd3JvdGU6Cgo+IFRoaXMg
c2VyaWVzIGF0dGVtcHQgdG8gYWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgU3BhY2VtaVQgSzMgU29D
LAo+Cj4gSSd2ZSByZW1vdmVkIHRoZSBSRkMgdGFnIGFzIHRoZSBkcml2ZXIgaXMgdGVzdGVkIG9u
IEszIFNvQy4KPgo+IFRoZSBLMyBwaW5jdHJsIElQIHNoYXJlcyBhbG1vc3Qgc2FtZSBsb2dpYyB3
aXRoIHByZXZpb3VzIEsxIFNvQyBnZW5lcmF0aW9uLAo+IGJ1dCBoYXMgZGlmZmVyZW50IHJlZ2lz
dGVyIG9mZnNldCBhbmQgcGluIGNvbmZpZ3VyYXRpb24sIEkndmUgaW50cm9kdWNlZAo+IGEgcGlu
X3RvX29mZnNldCgpIGZ1bmN0aW9uIHRvIGhhbmRsZSB0aGUgZGlmZmVyZW5jZSBvZiByZWdpc3Rl
ciBvZmZzZXQuCj4gZm9yIHRoZSBkcml2ZSBzdHJlbmd0aCBhbmQgc2NobWl0dGVyIHRyaWdnZXIg
c2V0dGluZ3MsIHRoZXkgYXJlIGFsc28gY2hhbmdlZC4KPgo+IFRoZSBwYXRjaCAjMSB0cnkgdG8g
YWRkIHBpbiBzdXBwb3J0IHdoaWNoIHNob3VsZCBoYW5kbGUgcGluIG11eCwgd2hpbGUgcGF0Y2gg
IzIKPiBhZGp1c3QgZHJpdmUgc3RyZW5ndGggYW5kIHNjaG1pdHRlciB0cmlnZ2VyIHNldHRpbmdz
IGFjY29yZGluZ2x5IGZvciBuZXcgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxk
bGFuQGdlbnRvby5vcmc+CgpBcyBLcnp5c3p0b2YgbWVudGlvbmVkLCB0cnkgdG8gdXNlIGFuIGV4
cGxpY2l0IGRldmljZSB0cmVlIHNjaGVtYSB0bwplbmZvcmNlIHRoZSBsZWdhbCBkcml2ZSBzdHJl
bmd0aCB2YWx1ZXMgYXMgZS5nLiBlbnVtcy4KCk90aGVyIHRoYW4gdGhpcyB0aGUgY29kZSBsb29r
cyBmaW5lIHNvIG9uY2UgdGhlIGJpbmRpbmdzIGFyZQpBQ0s6ZWQgSSdtIHJlYWR5IHRvIG1lcmdl
IHRoaXMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
