Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DDBE77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NLy+ssNM5eSzngt6cboALZ6hrsEs20n1wbb449wXP8=; b=CLxjlfj27a4AMJ
	/tBVUfwCUAre3psucHp4jEqR19Xi/7jfuMCro/2JS5qVwVoxU1KfzHR76KKCfrsMzQr1BwmhpczJF
	L1+vaAXHWJdIlJD7y6tGae2En3R4PRg7aDXs1fqH4C3310bIaLQJb25nZTcqznriuHpAjHO7NjvDU
	xfjnvSzxiorTHp7K/yCmjv2jKFpApyRG0Xu4Vl8YFb0FF7Di+DbM3LuU3eKSvcFO6QXOuTbX8lsea
	COl7GY0pRc7bNh4KiBqT8FYc6fqQJ+nrXO6Ariv9rTqeFc/fxMwBkoqqG2GmDCFWC4KedFbsC4cO/
	1OwxW4269PeSwCz5XSUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUj6u-00000000c5L-0aKc;
	Mon, 06 Jan 2025 09:09:20 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUj6r-00000000c4A-2Wg4
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 09:09:18 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-85c41442fdeso2517393241.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 01:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1736154556; x=1736759356; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKuvKlk8OSfYx6PIrDfpXD1FNugUFoICZw9fVqCNqnA=;
        b=SgO5Y4CaPyIvnz31BCYY1Acz2yat3/4Ic7x5hEIgIDifD3aPGPM3KrZ3zuIbPPtAg7
         NiBy1TJ29j9eHohuooV8nQg51JD2UDTzpgRVipMQb6U8/WbtcbZFdmtRThJBhyM/Tt1y
         +tWUkCNzRmlNqCMGayUaYqE6ZFgyojKmYaRF7locVYVSqBDpuM2x07ELliAU1e5cGYfl
         d62+QQHQl4uiERhjl00hXM2W7yLe9Lx41XRObaAE9ch9vKmU4bfuoT4R6FewnPAwP3TF
         w5z5uuqlHu/n+Y4hkDscfL8/oh78FcFOdusWEkfpT/POuM4mLH3os/hzzzTJHn4epWEl
         WE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154556; x=1736759356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QKuvKlk8OSfYx6PIrDfpXD1FNugUFoICZw9fVqCNqnA=;
        b=hj7mG15y7dhu58z6mYSoo/Rr8FFahxZXClnnUDXzNdAIjCCLPDnyR4ZV8oPTDCAHnY
         iGpW199k1GCpX0XBYuGj4mWINqAdAKdaSvMj8kPX8ys6b0LI5okQ63XiUwtTN1v19U8f
         8p/TIOOgHKWSITTXpytqcR2FbC6LC8XNZG9sSt6JuL7cPaLX/q6Wb6HkyDtuC3bvrjao
         15tMU/BpKRgj46B5eP2IR5Zps0w++Y5GdSbk7t2ZfWiKQrFLBzQf4LqMnvnZGfUrQW/3
         cK6wkJCegFYLgp1G4dxVhwUcdD9z7kqHqMRFYejXTrTqtwKhoqsgPtZvJhaYXzln6axR
         JQQg==
X-Forwarded-Encrypted: i=1; AJvYcCWspgJ3Qr2lwM+u6RtdDpnEAsK6YfLVE71X/Ud1d4A13TeC9YIbADmwC2jOeWGRFM49nFpT9e52wph02A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTwTE1kKzkdUHjZ8C9d7KqIP8fPl7iA9QryKKDoKaCsmYR8CMc
	LjDN38VRCN4oizxvbwPB6iBWaKdAgQqCVLzPN62RqK7RTAawXEMtwW7bA/nXwS50DIeKeVYqBcd
	4bLK8v2h8h5rgSddAadS2GCKxzYMA31yV3A3ybA==
X-Gm-Gg: ASbGncswzxNJWk3AGM3qtevPnQp6CnO9tWYfgTurYOUIR93UXtpWkVIBaImmafXhjs3
	Mvr2uuNX5p3QMU6+Nq3ZTFTxibIZSEsnf/PqadbJ7
X-Google-Smtp-Source: AGHT+IFjbXqhxALayXJfbH7eJGXsx4rjHHBouqVImmLYzT00NqHZwy4UszqEFmcWPxvwftlDyKoiqkwKnSXVY5m94Dw=
X-Received: by 2002:a05:6102:32cc:b0:4af:4974:a489 with SMTP id
 ada2fe7eead31-4b2cc46245cmr44531344137.20.1736154556388; Mon, 06 Jan 2025
 01:09:16 -0800 (PST)
MIME-Version: 1.0
References: <20241224093902.1632627-1-nylon.chen@sifive.com> <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
In-Reply-To: <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 6 Jan 2025 17:09:05 +0800
Message-ID: <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_010917_661906_34E15312 
X-CRM114-Status: GOOD (  23.18  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDI0
5bm0MTLmnIgyN+aXpSDpgLHkupQg5LiL5Y2INDoyMOWvq+mBk++8mgo+Cj4gSGVsbG8gTnlsb24s
Cj4KPiBPbiBUdWUsIERlYyAyNCwgMjAyNCBhdCAwNTozODo1OFBNICswODAwLCBOeWxvbiBDaGVu
IHdyb3RlOgo+ID4gQWNjb3JkaW5nIHRvIHRoZSBjaXJjdWl0IGRpYWdyYW0gb2YgVXNlciBMRURz
IC0gUkdCIGRlc2NyaWJlZCBpbiB0aGUKPiA+IG1hbnVhbCBoaWZpdmUtdW5sZWFzaGVkLWEwMC5w
ZGZbMF0gYW5kIGhpZml2ZS11bm1hdGNoZWQtc2NoZW1hdGljcy12My5wZGZbMV0uCj4gPgo+ID4g
VGhlIGJlaGF2aW9yIG9mIFBXTSBpcyBhY2l0dmUtaGlnaC4KPiA+Cj4gPiBBY2NvcmRpbmcgdG8g
dGhlIGRlc2NyaXB0aW9ub2YgUFdNIGZvciBwd21jbXAgaW4gU2lGaXZlIEZVNzQwLUMwMDAgTWFu
dWFsWzJdLgo+ID4KPiA+IFRoZSBwd20gYWxnb3JpdGhtIGlzIChQVykgcHVsc2UgYWN0aXZlIHRp
bWUgID0gKEQpIGR1dHkgKiAoVCkgcGVyaW9kLgo+ID4gVGhlIGBmcmFjYCB2YXJpYWJsZSBpcyBw
dWxzZSAiaW5hY3RpdmUiIHRpbWUgc28gd2UgbmVlZCB0byBpbnZlcnQgaXQuCj4KPiBJJ20gdHJ5
aW5nIHRvIHVuZGVyc3RhbmQgdGhhdC4gWW91J3JlIHNheWluZyB0aGF0IHRoZSBQV01DTVAgcmVn
aXN0ZXIKPiBob2xkcyB0aGUgaW5hY3RpdmUgdGltZS4gTG9va2luZyBhdCB0aGUgbG9naWMgZGlh
Z3JhbSAoRmlndXJlIDI5KSBvZgo+ICJTaUZpdmUgRlU3NDAtQzAwMCBNYW51YWwgdjFwNiIgdGhh
dCBpcyBiZWNhdXNlIHB3bXMgaXMgZmVlZCBpbnRvIHRoZQo+IGNvbXBhcmF0b3IgYWZ0ZXIgZ29p
bmcgdGhyb3VnaCB0aGF0IFhOT1Igd2hlcmUgdGhlIGxvd2VyIGlucHV0IGlzIGFsd2F5cwo+IDAg
KGFzIHB3bWNtcFhjZW50ZXIgaXMgYWx3YXlzIDApIGFuZCBzbyBlZmZlY3RpdmVseSBjb3VudHMg
YmFja3dhcmRzLAo+IHJpZ2h0Pwo+IEluIHRoYXQgY2FzZSB0aGUgc2VudGVuY2UgIlRoZSBvdXRw
dXQgb2YgZWFjaCBjb21wYXJhdG9yIGlzIGhpZ2gKPiB3aGVuZXZlciB0aGUgdmFsdWUgb2YgcHdt
cyBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gdGhlIGNvcnJlc3BvbmRpbmcKPiBwd21jbXBY
LiIgZnJvbSB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIENvbXBhcmUgUmVnaXN0ZXJzIGlzIHdyb25n
Lgo+CkhpIFV3ZSwKClBsZWFzZSBnaXZlIHVzIHNvbWUgdGltZSB0byBjbGFyaWZ5IHRoZXNlIHF1
ZXN0aW9ucywgdGhhbmsgeW91Lgo+IFdpdGggdGhhdCBhc3N1bXB0aW9uIHRoZXJlIGFyZSBhIGZl
dyBpc3N1ZXMgd2l0aCB0aGUgc2Vjb25kIHBhdGNoOgo+Cj4gIC0gVGhlIExpbWl0YXRpb25zIHBh
cmFncmFwaCBzdGlsbCBzYXlzICJUaGUgaGFyZHdhcmUgY2Fubm90IGdlbmVyYXRlIGEKPiAgICAx
MDAlIGR1dHkgY3ljbGUuIgo+ICAtIElmIHB3bV9zaWZpdmVfYXBwbHkoKSBpcyBjYWxsZWQgd2l0
aCBzdGF0ZS0+ZHV0eV9jeWNsZSA9IDAgdGhlIFBXTUNNUAo+ICAgIHJlZ2lzdGVyIGJlY29tZXMg
KDFVIDw8IFBXTV9TSUZJVkVfQ01QV0lEVEgpIC0gMSB3aGljaCByZXN1bHRzIGluIGEKPiAgICB3
YXZlIGZvcm0gdGhhdCBpcyBhY3RpdmUgZm9yIDEgY2xvY2sgdGljayBlYWNoIHBlcmlvZC4gVGhh
dCdzIGJvZ3VzLgo+ICAgIElmIGR1dHlfY3ljbGUgPSAwIGlzIHJlcXVlc3RlZCwgZWl0aGVyIG1h
a2Ugc3VyZSB0aGUgb3V0cHV0IGlzCj4gICAgaW5hY3RpdmUgdGhlIHdob2xlIHRpbWUsIG9yIHJl
dHVybiBhbiBlcnJvci4KPiAgLSBXaXRoIHRoZSBhYm92ZSBlcnJvciBpbiB0aGUgb2ZmaWNpYWwg
ZG9jdW1lbnRhdGlvbiwgSSdkIGxpa2UgdG8gaGF2ZQo+ICAgIGEgY29kZSBjb21tZW50IHRoYXQg
ZXhwbGFpbnMgdGhlIG1pc21hdGNoIHN1Y2ggdGhhdCBhIGZ1dHVyZSByZWFkZXIKPiAgICBvZiB0
aGUgY29kZSBoYXMgYSBjaGFuY2UgdG8gdW5kZXJzdGFuZCB0aGUgc2l0dWF0aW9uIHdpdGhvdXQg
aW4KPiAgICBkZXRhaWwgcmV2aWV3IG9mIHRoZSBtYW51YWwgYW5kIHRoZSBkcml2ZXIuCj4KPiBP
cnRob2dvbmFsIHRvIHlvdXIgcGF0Y2hlcywgSSB3b25kZXIgYWJvdXQKPgo+ICAgICAgICAgZnJh
YyA9IERJVjY0X1U2NF9ST1VORF9DTE9TRVNUKG51bSwgc3RhdGUtPnBlcmlvZCk7Cj4KPiAuIFJv
dW5kLWNsb3Nlc3QgaXMgdXN1YWxseSB3cm9uZyBpbiBhbiAuYXBwbHkoKSBjYWxsYmFjay4gSSBk
aWRuJ3QgZG8KPiB0aGUgZGV0YWlsZWQgbWF0aCwgYnV0IEkgdGhpbmsgeW91IG5lZWQgdG8gcm91
bmQgdXAgaGVyZS4KSSB3aWxsIGNvbmR1Y3QgcmVsZXZhbnQgZXhwZXJpbWVudHMgdG8gY2xhcmlm
eSB0aGlzIGlzc3VlLgoKVGhhbmtzIGFnYWluLgo+Cj4gQmVzdCByZWdhcmRzCj4gVXdlCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
