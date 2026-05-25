Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC10CD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVZiJf0aQgbMkkMcS/tG/a67xa/u0pOQvoUCEpnWipk=; b=fry1Saxh37efge
	eqfepIwQdd846gj3qYvNGvjllxNsW7Cz3Th6HuGUdm/B3Cs+zq8pVFlC3802t7pVLE9bci9SBRA+Q
	tgc/LLWlpRpiSFgv7RbpeDFK7aPmS/A/Mql238pVYj/YWxjhoOVROgiFCLkxkMPeZuL6Hn6C0HqOK
	27bEWr65G0Uju6AcptZtIpbCp9534uF4dyFbrMqmKf7rVIolzmqacvLodjPhepmVjBcWY8Dqr44AP
	m4IXNBcZuE5bWcX7ttqqKo61HoSM9uMQS6QPJ9UkMI8E9zE4bpyth/lpTOamWn0puH29dULG6kLEg
	uQRTA1zrZW9qL3nsI6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQyd-0000000GhYH-33Sz;
	Mon, 25 May 2026 08:47:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQyd-0000000GhY7-0qek
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 08:47:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8198B600BB
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 08:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383E01F00A3A
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698878;
	bh=Uiez2tUH2lHzvinGDgjZTRw1gLY54bFofTb+3SZa2AI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h3X7fIVkXFqcRMVu0vwPhrdLPxDBY24EoTdRpcPfjUB7D88HSdGbkXMAOKn203Rqd
	 0DzIRM399hU19P7lZ46lThAdDzUllgFmSZFU6VfePho2oBIZq0NujvomUwOplXdLIw
	 vhu1OOYbrv281Vz2W1AuiHCBEQmsS8mJ5gVYROpnFr4JVPowSDKF2+/AlpO1s0LFXl
	 vSnai+Th2Iu0Xt5khb2l72inbHXQ+u4h/xgMe4gyUoTMuzsFmuSarRN8ZiFqLd9E/j
	 NB/nY6r5SY0Uxfjoh5mmYiED1PGcnA6NXkTNgh7ORNE1IsVynEyi7H3mtlAnqBuJgp
	 EEt0O8gUPtVrg==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4855003f70bso2009106b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 01:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/blKwrfoYLbN9udegjxRbWvpW2a6/MWcDdfKIpUIdDBus5PVOdL2AMVeWLNNpqlXXa8Xe7OoxsD6Ka0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpCYQchGnil2p5N/KbQ7p9hbSj5Q0T7nWP035YJzlG++uQb/s1
	VP0/JhIKRmx/GjQ2jSM7sMVp8yfl4fre6Uzk/T9rz+AOGACYDBWMon/Yv+MN7YT/LqYb2JzqSuN
	MjFJoCmCwgyuurd2JJjkrCzL+vObkWsk=
X-Received: by 2002:a05:6808:3a0e:b0:482:48e1:cdf1 with SMTP id
 5614622812f47-48549ed026fmr8979404b6e.5.1779698877682; Mon, 25 May 2026
 01:47:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
In-Reply-To: <20260519164007.122574-1-gaohan@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:47:43 +0200
X-Gmail-Original-Message-ID: <CAD++jL=1zGiwyqut3m-9h2VSTEbu4yGfUe6eo6b2azHm4kSJ+Q@mail.gmail.com>
X-Gm-Features: AVHnY4JnR7v4dqg5BWRjELg39bXhmUzIb9bOP06stD31r1dff2wvUSgEgPdnLIU
Message-ID: <CAD++jL=1zGiwyqut3m-9h2VSTEbu4yGfUe6eo6b2azHm4kSJ+Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in spacemit_pin_set_config
To: Han Gao <gaohan@iscas.ac.cn>
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
Cc: Han Gao <rabenda.cn@gmail.com>, Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgNjo0MOKAr1BNIEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5h
Yy5jbj4gd3JvdGU6Cgo+IHNwYWNlbWl0X3Bpbl9zZXRfY29uZmlnKCkgbG9va3MgdXAgdGhlIHBl
ci1waW4gZGVzY3JpcHRvciB3aXRoCj4gc3BhY2VtaXRfZ2V0X3BpbigpIHRoZW4gY2hlY2tzIHRo
ZSB3cm9uZyB2YXJpYWJsZSBmb3IgZmFpbHVyZToKPgo+ICAgICAgICAgY29uc3Qgc3RydWN0IHNw
YWNlbWl0X3BpbiAqc3BpbiA9IHNwYWNlbWl0X2dldF9waW4ocGN0cmwsIHBpbik7Cj4gICAgICAg
ICAuLi4KPiAgICAgICAgIGlmICghcGluKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPgo+ICAgICAgICAgcmVnID0gc3BhY2VtaXRfcGluX3RvX3JlZyhwY3RybCwgc3Bpbi0+cGlu
KTsKPgo+IHBpbiBpcyBhbiB1bnNpZ25lZCBpbnQgcGluIGlkLCB3aGVyZSAwIChHUElPXzAgLyBn
bWFjMF9yeGR2IG9uIEszKSBpcyBhCj4gdmFsaWQgcGluLCBzbyByZWplY3RpbmcgaXQgaGVyZSBk
cm9wcyB0aGUgUEFEIGNvbmZpZyB3cml0ZSBmb3IgdGhlIGZpcnN0Cj4gcGluIG9mIGV2ZXJ5IGdy
b3VwLiBPbiBLMyBQaWNvLUlUWCB0aGUgR01BQyBSR01JSSBncm91cCBsaXN0cyBwaW4gMCBhcwo+
IGl0cyBmaXJzdCBlbnRyeSwgc28gaXRzIGRyaXZlLXN0cmVuZ3RoIC8gYmlhcyBjb25maWd1cmF0
aW9uIHdhcyBzaWxlbnRseQo+IGlnbm9yZWQuCj4KPiBUaGUgaW50ZW5kZWQgZ3VhcmQgaXMgYWdh
aW5zdCBzcGFjZW1pdF9nZXRfcGluKCkgcmV0dXJuaW5nIE5VTEwgd2hlbiB0aGUKPiBwaW4gaWQg
aXNuJ3QgaW4gdGhlIFNvQydzIHBpbiB0YWJsZS4gQ2hlY2sgc3BpbiBpbnN0ZWFkLCB3aGljaCBi
b3RoCj4gcmVzdG9yZXMgUEFEIHNldHVwIGZvciBwaW4gMCBhbmQgcHJldmVudHMgYSBOVUxMIGRl
cmVmIG9uIHNwaW4tPnBpbi4KPgo+IEZpeGVzOiBhODNjMjllMWQxNDUgKCJwaW5jdHJsOiBzcGFj
ZW1pdDogYWRkIHN1cHBvcnQgZm9yIFNwYWNlbWlUIEsxIFNvQyIpCj4gU2lnbmVkLW9mZi1ieTog
SGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgoKUGF0Y2ggYXBwbGllZCBmb3Igbm9uY3JpdGlj
YWwgZml4ZXMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
