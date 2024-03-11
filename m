Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53592C5475B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2024 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bzAE9zfLwme6TQGOyR3GJt7WQBy56j91WICcugLZ+c=; b=wUEz+ZoiQmGfob
	OW7l6RAtZefxaMy64VGcEEfQatx7JNWBOCLc22O+zMO/TKorTp++62YxCastcUeNiTnwOrRDX3Ps8
	Aqn2f0/GDuy2gPbuuVOko413T6UYVPYVsHz4ibw6IHz6M0HAeTJM4t62CWIrtCK0hRlU37RzxOCAL
	tLZoLRKkZFUMgGOmd7HCGzB2XbIxBA2pjWTwgXzao2vZkaTrzTqqFuNbuem/H89gsDLIWglp9fOiK
	f3FV2qQ3HR4vmsQ6YJ9Of9IkkC9dr8xzbCciQBRaXNVNj0a1Tg2/9MsIeaJit24X4BdEH00TaDdyY
	UBQMXDRZyZdntD2Uv/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjga6-00000001nDi-26DS;
	Mon, 11 Mar 2024 14:24:46 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjga2-00000001n9c-09PH
	for linux-riscv@lists.infradead.org;
	Mon, 11 Mar 2024 14:24:44 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso2975850276.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710167072; x=1710771872; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YQOJrl+36cEKcaIFWJFIZbePtlY7XKPnjlGTOtfGGw=;
        b=YsrMgwR+3U29eYMSssUqygnti6kJuWxJQuFxq9AhwQSRlfv82fQ543RD2b4FjIKMWJ
         Y1ydre/QfYN8eQjI66RDrS5ioYrH/W8O+dhAptjfMR30qmAQN9usRCA08JIWYZSGAtkz
         3xzKUiVU2Uno6A/5gseAMk+RB1emVqcF4V3qfox6HOEsdefyN98wkx6TZ81oRVwQO1zP
         dDKI4DmpD1+d7YS9T6qW6Q4XUEg0QCcehCcdt971dtfIfGcSp2F4dGwF/WX6TLBXbSsQ
         0svK26gzgk6RuQOpjS7H4FbFtNY+YXUDwrBiZnqiHIn/8pJEd6m9UzPTSyh/N5ItG2bS
         f00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710167072; x=1710771872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YQOJrl+36cEKcaIFWJFIZbePtlY7XKPnjlGTOtfGGw=;
        b=RuACUWz41BZeO9UUjf3DAWocx24WxGm2/rcypCRhOVHTcXD5mLYq6jHW0rU74hVS+I
         P8Q49Y033tJbU2ETGyYpVBageSGVd/bynwtSx3JkFiVL9863IjABgvlByc141xGPWYtH
         rGQWPlimnRYJCIxDq/GEky93X7pfWg7vgGDgAYBiFkQqc5C3RfShwDQBk+YAFWAl5A4d
         wmhLvvwHSSQZSUM2xOCkN7XMmeDveKbR7A0lkUxKWpHXJ/MXhijCrM3gxlJ338vH0XQ0
         WNP9Yp2GlLgxkkwEAD4dD+1cQubBq8svTHCmlO9NF/9w95UzOpnPxsIp6mu46pkVdD9A
         vhcg==
X-Forwarded-Encrypted: i=1; AJvYcCUe12AKgNiRQErYnNMu/p60FN7uvDEhWvZKR2i08F/zG3r3L2yQQ7MuYoH5vJ66OfQV56QzZc1AFqYIusErZIOIH+12ZsiQwJDYLPl4sBzZ
X-Gm-Message-State: AOJu0YzhDRDR4MgBbuZFJ/8GZHkfBD+C2AD/tu4q2bzxjpHDpSvj8ggu
	+V9ZFh3aggOXGbEf9vKjqvD2tYWnnDDe2GJfLnPaJYN1MyXua2RWHAv6gcpjcLbf+zhRP5w7kpw
	mCOnyPZOsXlOf7PkeerCgDemJS0MIId7x53lCIA==
X-Google-Smtp-Source: AGHT+IFYqESIg7WwGwpYNdYo+JwxyNWgs0dAkak9geSla3ddTDAlOeyoy4o6EC06u5pOEKGqiIXcNB70y1m2ceRpV2g=
X-Received: by 2002:a25:8c92:0:b0:dcd:df0:e672 with SMTP id
 m18-20020a258c92000000b00dcd0df0e672mr3196831ybl.47.1710167072546; Mon, 11
 Mar 2024 07:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
 <4fe4567b-96be-4102-952b-7d39109b2186@yadro.com> <CABgGipUGCVjy5wG1TMDpgf1Zn7Jcx5Lg1CUzQ0YLr5nOPf-TUg@mail.gmail.com>
 <51f21b87-ebed-4411-afbc-c00d3dea2bab@yadro.com> <bd7c2263-4e81-4be6-af4d-22a0842ba2e4@ghiti.fr>
 <CABgGipUtzLG2tffXOdV7-7ss+_doQvjxfwzVbfzyO56J3_3X0Q@mail.gmail.com>
 <f4506e4f-fca5-49ac-868e-f42f1f23ce9b@ghiti.fr> <c1d994e2-8f0c-4039-b790-a426fc48055c@sifive.com>
In-Reply-To: <c1d994e2-8f0c-4039-b790-a426fc48055c@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 11 Mar 2024 22:24:21 +0800
Message-ID: <CABgGipX_WuB5pZ4xgLcBZF7WpHmt_J9m48k+7n-UwH-jUtXJ1A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 0/5] Enable ftrace with kernel
 preemption for RISC-V
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Evgenii Shatokhin <e.shatokhin@yadro.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, rostedt@goodmis.org, mingo@redhat.com, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, guoren@kernel.org, 
	Jessica Clarke <jrtc27@jrtc27.com>, kernel@esmil.dk, linux-riscv@lists.infradead.org, 
	linux@yadro.com, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_072442_172606_AE8F6136 
X-CRM114-Status: GOOD (  27.14  )
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

T24gVGh1LCBNYXIgNywgMjAyNCBhdCAxMTo1N+KAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFsZXgsCj4KPiBPbiAyMDI0LTAzLTA3
IDc6MjEgQU0sIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IEJ1dCBUQkgsIEkgaGF2ZSBzdGFy
dGVkIHRoaW5raW5nIGFib3V0IHRoZSBpc3N1ZSB5b3VyIHBhdGNoIGlzIHRyeWluZyB0byBkZWFs
Cj4gPiB3aXRoLiBJSVVDIHlvdSdyZSB0cnlpbmcgdG8gYXZvaWQgdHJhcHMgKG9yIHNpbGVudCBl
cnJvcnMpIHRoYXQgY291bGQgaGFwcGVuCj4gPiBiZWNhdXNlIG9mIGNvbmN1cnJlbnQgYWNjZXNz
ZXMgd2hlbiBwYXRjaGluZyBpcyBoYXBwZW5pbmcgb24gYSBwYWlyIGF1aXBjL2phcmwuCj4gPgo+
ID4gSSdtIHdvbmRlcmluZyBpZiBpbnN0ZWFkLCB3ZSBjb3VsZCBub3QgYWN0dWFsbHkgaGFuZGxl
IHRoZSBwb3RlbnRpYWwgdHJhcHM6Cj4gPiBiZWZvcmUgc3RvcmluZyB0aGUgYXVpcGMgKyBqYWxy
IHBhaXIsIHdlIGNvdWxkIHVzZSBhIHdlbGwtaWRlbnRpZmllZCB0cmFwcGluZwo+ID4gaW5zdHJ1
Y3Rpb24gdGhhdCBjb3VsZCBiZSByZWNvZ25pemVkIGluIHRoZSB0cmFwIGhhbmRsZXIgYXMgYSBs
ZWdpdGltYXRlIHRyYXAuCj4gPiBGb3IgZXhhbXBsZToKPiA+Cj4gPgo+ID4gYXVpcGMgIC0tPiAg
YXVpcGMgIC0tPiAgWFhYWCAgLS0+ICBYWFhYICAtLT4gIGF1aXBjCj4gPiBqYWxyICAgICAgICBY
WFhYICAgICAgICBYWFhYICAgICAgIGphbHIgICAgICAgamFscgo+ID4KPiA+Cj4gPiBJZiBhIGNv
cmUgdHJhcHMgb24gYSBYWFhYIGluc3RydWN0aW9uLCB3ZSBrbm93IHRoaXMgYWRkcmVzcyBpcyBi
ZWluZyBwYXRjaGVkLCBzbwo+ID4gd2UgY2FuIHJldHVybiBhbmQgcHJvYmFibHkgdGhlIHBhdGNo
aW5nIHdpbGwgYmUgb3Zlci4gV2UgY291bGQgYWxzbyBpZGVudGlmeQo+ID4gaGFsZiBwYXRjaGVk
IHdvcmQgaW5zdHJ1Y3Rpb24gKEkgbWVhbiB3aXRoIG9ubHkgWFgpLgo+Cj4gVW5mb3J0dW5hdGVs
eSB0aGlzIGRvZXMgbm90IHdvcmsgd2l0aG91dCBzb21lIGZlbmNlLmkgaW4gdGhlIG1pZGRsZS4g
VGhlCj4gcHJvY2Vzc29yIGlzIGZyZWUgdG8gZmV0Y2ggYW55IGluc3RydWN0aW9uIHRoYXQgaGFz
IGJlZW4gd3JpdHRlbiB0byBhIGxvY2F0aW9uCj4gc2luY2UgdGhlIGxhc3QgZmVuY2UuaSBpbnN0
cnVjdGlvbi4gU28gaXQgd291bGQgYmUgcGVyZmVjdGx5IHZhbGlkIHRvIGZldGNoIHRoZQo+IG9s
ZCBhaXVwYyBhbmQgbmV3IGphbHIgb3IgdmljZSB2ZXJzYSBhbmQgbm90IHRyYXAuIFRoaXMgd291
bGQgaGFwcGVuIGlmLCBmb3IKPiBleGFtcGxlLCB0aGUgdHdvIGluc3RydWN0aW9ucyB3ZXJlIGlu
IGRpZmZlcmVudCBjYWNoZSBsaW5lcywgYW5kIG9ubHkgb25lIG9mIHRoZQo+IGNhY2hlIGxpbmVz
IGdvdCBldmljdGVkIGFuZCByZWZpbGxlZC4KPgo+IEJ1dCBzZW5kaW5nIGFuIElQSSB0byBydW4g
dGhlIGZlbmNlLmkgcHJvYmFibHkgbmVnYXRlcyB0aGUgcGVyZm9ybWFuY2UgYmVuZWZpdC4KCk1h
eWJlIHNvbWV0aGluZyBsaWtlIHg4Niwgd2UgY2FuIGhvb2sgZnRyYWNlX3JlcGxhY2VfY29kZSgp
IG91dCBhbmQKYmF0Y2ggc2VuZCBJUElzIHRvIHByZXZlbnQgc3Rvcm1zIG9mIHJlbW90ZSBmZW5j
ZXMuIFRoZSBzb2x1dGlvbiBBbGV4CnByb3Bvc2VkIGNhbiBzYXZlIHRoZSBjb2RlIHNpemUgZm9y
IGZ1bmN0aW9uIGVudHJpZXMuIEJ1dCB3ZSBoYXZlIHRvCnNlbmQgb3V0IHJlbW90ZSBmZW5jZXMg
YXQgZWFjaCAiLS0+IiB0cmFuc2l0aW9uLCB3aGljaCBpcyA0IHNldHMgb2YKcmVtb3RlIElQSXMu
IE9uIHRoZSBvdGhlciBoYW5kLCB0aGlzIHNlcmllcyBpbmNyZWFzZXMgdGhlIHBlci1mdW5jdGlv
bgpwYXRjaCBzaXplIHRvIDI0IGJ5dGVzLiBIb3dldmVyLCBpdCBkZWNyZWFzZXMgdGhlIG51bWJl
ciBvZiByZW1vdGUKZmVuY2VzIHRvIDEgc2V0LgoKVGhlIHBlcmZvcm1hbmNlIGhpdCBjb3VsZCBi
ZSBvYnNlcnZhYmxlIGZvciB0aGUgYXVpcGMgKyBqYWxyIGNhc2UsCmJlY2F1c2UgYWxsIHJlbW90
ZSBjb3JlcyB3aWxsIGJlIGV4ZWN1dGluZyBvbiBYWFhYIGluc3RydWN0aW9ucyBhbmQKdGFrZSBh
IHRyYXAgYXQgZWFjaCBmdW5jdGlvbiBlbnRyeSBkdXJpbmcgY29kZSBwYXRjaGluZy4KCkJlc2lk
ZXMsIHRoaXMgc2VyaWVzIHdvdWxkIGdpdmUgdXMgYSBjaGFuY2Ugbm90IHRvIHNlbmQgYW55IHJl
bW90ZQpmZW5jZXMgaWYgd2Ugd2VyZSB0byBjaGFuZ2Ugb25seSB0aGUgZGVzdGluYXRpb24gb2Yg
ZnRyYWNlIChlLmcuIHRvIGEKY3VzdG9tIGZ0cmFjZSB0cmFtcG9saW5lKS4gQXMgaXQgd291bGQg
YmUgYSByZWd1bGFyIHN0b3JlIGZvciB0aGUKd3JpdGVyIGFuZCByZWd1bGFyIGxvYWQgZm9yIHJl
YWRlcnMsIG9ubHkgZmVuY2Ugdyx3IGlzIG5lZWRlZC4KSG93ZXZlciwgSSBhbSBub3QgdmVyeSBj
ZXJ0YWluIG9uIGhvdyBvZnRlbiB3b3VsZCBiZSBmb3IgdGhpcwpwYXJ0aWN1bGFyIHVzZSBjYXNl
LiBJJ2QgbmVlZCBzb21lIHRpbWUgdG8gaW52ZXN0aWdhdGUgaXQuCgo+Cj4gTWF5YmUgdGhlcmUg
aXMgc29tZSBjcmVhdGl2ZSB3YXkgdG8gb3ZlcmNvbWUgdGhpcy4KPgo+ID4gQnV0IHBsZWFzZSBs
ZXQgbWUga25vdyBpZiB0aGF0J3MgY29tcGxldGVseSBzdHVwaWQgYW5kIEkgZGlkIG5vdCB1bmRl
cnN0YW5kIHRoZQo+ID4gcHJvYmxlbSwgc2luY2UgbXkgcGF0Y2hzZXQgdG8gc3VwcG9ydCBzdnZw
dGMsIEkgYW0gd29uZGVyaW5nIGlmIGl0IGlzIG5vdCBtb3JlCj4gPiBwZXJmb3JtYW50IHRvIGFj
dHVhbGx5IHRha2UgdmVyeSB1bmxpa2VseSB0cmFwcyBpbnN0ZWFkIG9mIHRyeWluZyB0byBhdm9p
ZCB0aGVtLgo+Cj4gSSBhZ3JlZSBpbiBnZW5lcmFsIGl0IGlzIGEgZ29vZCBpZGVhIHRvIG9wdGlt
aXplIHRoZSBob3QgcGF0aCBsaWtlIHRoaXMuCj4KPiBSZWdhcmRzLAo+IFNhbXVlbAo+CgpSZWdh
cmRzLApBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
