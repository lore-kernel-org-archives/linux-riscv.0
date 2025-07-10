Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8220EC83F1C
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/peCJe5RBKOOty9ZjVOvGQtlAaTSi3tA2ituJD0xeM=; b=LD33X+IWqzVoOF
	gTM0yOxlL+qY8GfK3tQNGE2PufmMC9AEsGJj0vcqy/528TfFoXocGLmkUO+ifugZ59WKdtRuGaPBT
	kdjRyNuCHALo97MqvxWxVf7vjB5P56QLGBc4PghzcNK06L9MvUeWN/YJyYX2RXI3goQLXZB1jSIIc
	87LphtFdJevX4j/OtFOGSo6vc+eSUACK/m3uEDDp2WEZxxBt/LZ+M/skoMpNdAqIG4tLAlebhLVMM
	q+NhG0M2Cn3xTg8VhkJYp6jILkqv2kgUhhHl4e4/Cr7gejmvpnk8d/NSp83FzQxbSErQIUaNKj0QT
	l7HAGOdY2oC3qLjeFtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZllP-0000000B18P-1Nou;
	Thu, 10 Jul 2025 07:32:15 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZkqt-0000000At1W-2BvI
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 06:33:53 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e819ebc3144so560597276.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Jul 2025 23:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752129230; x=1752734030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOfKyTSrKEeE5mRVGbOkpddwy61Hvu8Xrql9GC0LhTY=;
        b=XjL0oaCX3XnAk3W9oXBPtpIht3zuoM60QQ81GbdFaKm3Wev3bAJ7/1TQyTpA1Tnbu0
         TT0ymFhbDz2PyFfhxPh3/eHNlRWcorL218BoxsWh9h2hi0WWV9bKUbE7RLpa5274oazi
         uf9G8T4GaIUXeXWF5QcMhUugisgw3SdflZ3pVRDdP4/aLmKMVrQ3+waWC6LWbCsxOPbS
         VH78E2kbanQJjRUbYUO6JsB5YAdopupqBA8nkNIQn/0tcSnOT0H7bP7nf9rMkx8NAHyv
         aJ4q9d1oJoq/HCOaEBJv0Rx5DbN43aOQLXnKFBku3zJcknyP55tj1IE8eoXR2QHfZnpR
         9abA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752129230; x=1752734030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOfKyTSrKEeE5mRVGbOkpddwy61Hvu8Xrql9GC0LhTY=;
        b=jDUwOSO4slsVCM2LJ4pJoFUouiB2V5cnzVOvOtOQMTFXze1+ZSxS/IFy82rGTEn4sO
         OWwltwdHEmL9MdkygHCjA5tyXGf5oqfOOegBpY/r9Rz0rgkyYr2S7/hqsyJ5IDMRJRsb
         RV3wEqaYYXYV7XBtMBN42EDWsHeDTe0otI4+vSQF/MxnrgmCjf4HUl72Beyd4kDX+h7O
         mVH4gGYDLy0fnx/dKDu8K0R9O1VtJkU0Is2yAYI6aS9SmSfFjluC2vUfMd68Hm4yIsrb
         AXGK+eGwHUdGZtx5CMS+ENVdRnCPb06oWqoYfh1Ej/Bxk7hnDKDXZw3WvAPi1LRgAk7D
         6EHw==
X-Forwarded-Encrypted: i=1; AJvYcCXb3DG+C8/qCIHsNJsSU0lOkqkyc8prRigqjPUU8KOiiMQrqhssqQzNBEXoC+tPpDDl57nsrwdTQZ504g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/0bwHcKiKYVu1UdPseLvpdUUx/4ScKvHgMlkJzbIy6cY8vtSj
	yK+p7n7OEiZxw2CQbZJwCnRyFcBJEpVhwNxyGWTY92MDSksWrp/xXozNT3U6irBdzmSsdAjB6o6
	7/RiZL6nQHqyf5601da6tyMbm9bng9X4KBhsDwER+OA==
X-Gm-Gg: ASbGnctHGaJKN+wYcpYauYbWNmuqNr/7T5nP/fciAyCHla4O6PtJpGP51PAGB5JbxAH
	vJYibNCo9wwr2BDGwZZrpfvbaq5gADImtg8WCQIWnmr3w0Gdg6zB21E0JuV0W8ruY33TR2mjJjx
	LpzFm3BCEYvM2neWktvWQasezSMSAMSpDSjobfrzyUDhOM4PNgJAWwfkkdaQ4jOGdL
X-Google-Smtp-Source: AGHT+IEUEuXYe+AiRoP9sKK+Q2LJ7hkbYYZRPRjU65Kj1Wu6nsLtbs1bxTc1Gn9tJMDj6XgH3uwUSmTRPbmjpClz12M=
X-Received: by 2002:a05:690c:7405:b0:708:16b0:59c3 with SMTP id
 00721157ae682-717b1a8aa20mr78370367b3.33.1752129229913; Wed, 09 Jul 2025
 23:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <175198458423.86859.5882458274157023095.b4-ty@gentoo.org> <20250709063738-GYA488894@gentoo>
In-Reply-To: <20250709063738-GYA488894@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 10 Jul 2025 14:33:37 +0800
X-Gm-Features: Ac12FXzWKaYp6y1oSJwNCeBf8VLK9_pLF6KbvY2LESuIM6jHvBvBU0Xdd6tceRA
Message-ID: <CAH1PCMaZYaRgUoaMfDLyqwTv3n3NUaUL8tHr8SoTq=4ayuvyhA@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 0/6] pwm: Update PWM_PXA driver for SpacemiT K1
To: Yixun Lan <dlan@gentoo.org>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_233351_798645_25F6F5CA 
X-CRM114-Status: GOOD (  17.95  )
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

T24gV2VkLCBKdWwgOSwgMjAyNSBhdCAyOjM34oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5v
cmc+IHdyb3RlOgo+Cj4gSGkgR3VvZG9uZywKPgo+IE9uIDIyOjMzIFR1ZSAwOCBKdWwgICAgICwg
WWl4dW4gTGFuIHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgMjkgQXByIDIwMjUgMTY6NTA6NDIgKzA4
MDAsIEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2hzZXQgYWRkcyBzdXBwb3J0IGZv
ciB0aGUgU3BhY2VtaVQgSzEgU29DIGluIHRoZSBQV01fUFhBIGRyaXZlcgo+ID4gPiBhbmQgdXBk
YXRlcyByZWxhdGVkIGRldmljZSB0cmVlIGJpbmRpbmdzLiBUaGUgY2hhbmdlcyBlbmFibGUgUFdN
Cj4gPiA+IGZ1bmN0aW9uYWxpdHkgb24gdGhlIEsxIHBsYXRmb3JtIHRocm91Z2ggZHJpdmVyIGVu
aGFuY2VtZW50cywKPiA+ID4gY29uZmlndXJhdGlvbiB1cGRhdGVzLCBhbmQgZGV2aWNlIHRyZWUg
YWRkaXRpb25zLgo+ID4gPgo+ID4gPiBGdW5jdGlvbmFsaXR5IGhhcyBiZWVuIHZlcmlmaWVkIG9u
IHRoZSBCYW5hbmEgUGkgQlBJLUYzIGJvYXJkIHVzaW5nIFBXTTE0LAo+ID4gPiBjb25maWd1cmVk
IGFzIGEgcHdtLWJhY2tsaWdodC4gUGVyIGNvbW11bml0eSBmZWVkYmFjaywgdGhlIGFjdHVhbAo+
ID4gPiBwd20tYmFja2xpZ2h0IG5vZGUgaXMgbm90IGluY2x1ZGVkIGluIHRoaXMgcGF0Y2hzZXQg
YnV0IGNhbiBiZSBmb3VuZCBpbgo+ID4gPiBwYXRjaCA3IG9mIHRoZSB2MSBzZXJpZXMsIHdpdGgg
bW9kaWZpY2F0aW9uIG9mIHB3bXMgcHJvcGVydHkgdG8gNC1jZWxsCj4gPiA+IGZvcm1hdCB0byBt
YXRjaCB1cGRhdGVkIGJpbmRpbmcgKCNwd20tY2VsbHMgPSA8Mz4pIHNpbmNlIHYzLgo+ID4gPgo+
ID4gPiBbLi4uXQo+ID4KPiA+IEFwcGxpZWQsIHRoYW5rcyEKPiA+Cj4gPiBbMy82XSByaXNjdjog
ZHRzOiBzcGFjZW1pdDogYWRkIFBXTSBzdXBwb3J0IGZvciBLMSBTb0MKPiA+ICAgICAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvY29tbWl0LzlhZWJkZmMyMWY3NTVlMGQy
NzY2NjgzYWEyNTE0MzVmYjY1NmVhNDcKPgo+IGZvdW5kIGhhdmUgdG8gcmUtYXJyYW5nZSB0aGUg
bm9kZXMgYWNjb3JkaW5nIHRvIGFzY2VuZGluZyBvcmRlciBvZiB1bml0IGFkZHJlc3MsCj4gc28g
aGVyZSBpcyBuZXcgdmVyc2lvbiBJJ3ZlIHB1c2hlZCwganVzdCBGWUksIHBsZWFzZSBjaGVjayAo
c2hvdWxkIGhhdmUKPiBubyBmdW5jdGlvbmFsaXR5IGNoYW5nZXMpCj4gICAgICAgIGh0dHBzOi8v
Z2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvY29tbWl0LzY2ZjU2YzdhNjQyMTM5NDgzNDE1
MjFiNTMxMDA2NDU4NmEwNWM4MGUKCkxvb2tzIGdvb2QuIFRoYW5rcyBZaXh1bi4KCj4KPiA+IFs0
LzZdIHJpc2N2OiBkdHM6IHNwYWNlbWl0OiBhZGQgcHdtMTRfMSBwaW5jdHJsIHNldHRpbmcKPiA+
ICAgICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvY29tbWl0Lzg3MDlk
NTEwMjQwNjhkNGM4MWRjNzg1ZDYzMTY5ZDI4M2QxNDdjZjMKPgo+IC0tCj4gWWl4dW4gTGFuIChk
bGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
