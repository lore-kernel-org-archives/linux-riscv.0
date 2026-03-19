Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2071090222
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSdKDT9QcR9mjHsbyooHZglmDq+xcpzW4WiLk0+6H+4=; b=TkbjRx7Oxuv7FW
	qnSfIB82VAd9AgTEHyZEbD8kqyW5CiMor9fGu5PM9s/2Z4NYNVs/NAiVe2u4TKTYp6qaTOh9Vs6yR
	AeXaymRwmXc3jdQwqmH6hneaDzur0b/qOZJaabxb7G4qXASE80mnI1cFXUg8/U95ycU/OHucW3zFT
	9PeqsU2RTpbc42EEU/R/hGl8zYiiFrWLXPqgDu6xyuOsW9C5pTm3wYs8z+FHbLXfBhpIS+kDvVJ0S
	8QMnNUrmX9zmgHBRir6IJfL5YkfGSEbff8I8DTKlJep60IgWDv4+AuLqhgH3QmsHsRZQdgA7xzA4J
	3K9WaGblDD06QvmgCBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Csg-0000000Adg7-2n79;
	Thu, 19 Mar 2026 12:53:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Csf-0000000AdfS-0WHh
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 12:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AF66443A6
	for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 12:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F997C2BCB0
	for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773924820;
	bh=aZGDZBgh8B46KiK5LwZKPSo3Z/c5+KufgSnlcr+rs0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S5ae4X0ybrzEvsJ8y5I4xja7M1TxrCaMMIj/VGk8td2EMv/JbdA6cfeWWM1igWhga
	 8FACR7yKCvLm2nTTWw6mOhiaxNrRiTA36pLv7kX2tWD3zeIT2jdc0db8MUCxJCILc5
	 Lj2xNnxc7WDKHSaszIhxTNJ0AApQM84lS5eenscw3nRBdg5OgpnhL1vPHoKq4RuaN1
	 5Q85T1YEUrKWVgrCFSdVsdJTWVZLu0JuCyV+I6ufhG23g2f+i2H5NTwMYqLeo6ursI
	 J1y9++/8pzqpWyUg6oGUEFTxxgahfwShaHCcrmshR0hqTNjRCvrVEqc5xuQE4m/fFA
	 j1HrrX0TE3ofw==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7991db3dc98so10825567b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 05:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVpE6T7hvRIn7iILPQMEI3qPMvHh7N97CNtLkkJjTHgONEelfkCLxoOrBaM+ZwNFwDV4oMLw1qQ+1LEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuXGgNCcemDLdqt7mTC/eumIbnafuXIxB0iQ6iTuoiA0dcjLZV
	7OMscc5Y4xjT5q/61RKDJ+WbD+Q1gbuaSH/0hG5UYoBv4d1O4Uq3CBy2jUfKPjR3DrIddXcK2Vn
	FdHOmSe5TAeAK/fvHfs+iSfW9CFmC870=
X-Received: by 2002:a05:690c:9307:b0:79a:436b:70c7 with SMTP id
 00721157ae682-79a71c7f13emr58564037b3.54.1773924819696; Thu, 19 Mar 2026
 05:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 13:53:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6AwD91zTM40accHrYeWFgoUkknEt=c+qhBSQ77bRCTw@mail.gmail.com>
X-Gm-Features: AaiRm50JOv-QYXkwbpNYvSXiAbstTRzfapJj9qbqk5T6xP8tXe1iZ5aNllQor9U
Message-ID: <CAD++jLn6AwD91zTM40accHrYeWFgoUkknEt=c+qhBSQ77bRCTw@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio/pinctrl: spacemit: Add GPIO pin configuration
 support for K1
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055341_181684_E1E7791E 
X-CRM114-Status: GOOD (  11.93  )
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

VGhhbmsgSnVuaHVpLAoKT24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgOTo0M+KAr0FNIEp1bmh1aSBM
aXUgPGp1bmh1aS5saXVAcGlnbW9yYWwudGVjaD4gd3JvdGU6Cgo+IFRoaXMgYWRkIEdQSU8gcGlu
IGNvbmZpZ3VyYXRpb24gc3VwcG9ydCBmb3IgdGhlIFNwYWNlbWl0IEsxIFNvQy4gU29tZQo+IHVz
ZSBjYXNlcyByZXF1aXJlIGNvbmZpZ3VyaW5nIHBpbiBhdHRyaWJ1dGVzIGxpa2UgcHVsbC11cC9k
b3duIHdoZW4gdXNpbmcKPiBHUElPIGxpbmVzLgo+Cj4gQSBwcmFjdGljYWwgZXhhbXBsZSBpcyB0
aGUgU0QgY2FyZCBkZXRlY3Rpb24gcGluIG9uIHRoZSBCYW5hbmEgUGkgQlBJLUYzCj4gYm9hcmQu
IFNpbmNlIGl0IGxhY2tzIGFuIGV4dGVybmFsIHB1bGwtdXAgY2lyY3VpdCwgdGhlIHBpbiBtdXN0
IGJlCj4gY29uZmlndXJlZCB3aXRoIGFuIGludGVybmFsIHB1bGwtdXAgdG8gZnVuY3Rpb24gY29y
cmVjdGx5LiBTdWNoCj4gY29uZmlndXJhdGlvbnMgY2FuIGJlIHNwZWNpZmllZCBkaXJlY3RseSBp
biB0aGUgZGV2aWNldHJlZToKPgo+ICAgICBjZC1ncGlvcyA9IDwmZ3BpbyBLMV9HUElPKDgwKSAo
R1BJT19BQ1RJVkVfTE9XIHwgR1BJT19QVUxMX1VQKT47Cj4KPiBUbyBhZGRyZXNzIHRoaXMsIGFk
ZCB0aGUgc2V0X2NvbmZpZygpIGNhbGxiYWNrIHRvIHRoZSBncGlvLXNwYWNlbWl0LWsxCj4gZHJp
dmVyIHRvIGVuYWJsZSBwaW4gY29uZmlndXJhdGlvbiB0aHJvdWdoIHBpbmN0cmwsIGFuZCBtb2Rp
ZnkgdGhlCj4gcGluY3RybCBkcml2ZXIgdG8gcmV0dXJuIC1FTk9UU1VQUCBpbnN0ZWFkIG9mIC1F
SU5WQUwgZm9yIHVuc3VwcG9ydGVkCj4gcGFyYW1ldGVycywgYWxsb3dpbmcgdGhlIEdQSU8gc3Vi
c3lzdGVtIHRvIGdyYWNlZnVsbHkgaGFuZGxlIHRoZW0uCj4KPiAtLS0KPiBKdW5odWkgTGl1ICgy
KToKPiAgICAgICBwaW5jdHJsOiBzcGFjZW1pdDogcmV0dXJuIC1FTk9UU1VQUCBmb3IgdW5zdXBw
b3J0ZWQgcGluIGNvbmZpZ3VyYXRpb25zCj4gICAgICAgZ3Bpbzogc3BhY2VtaXQtazE6IEFkZCBz
ZXRfY29uZmlnIGNhbGxiYWNrIHN1cHBvcnQKCkJvdGggcGF0Y2hlcyBhcHBsaWVkIHRvIHRoZSBw
aW5jdHJsIHRyZWUuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
