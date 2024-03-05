Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F189C54E49
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 23:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMv1z3yu2yfjc3A1WEqOw6tfwFykmGUurl0icabWn5w=; b=1ZNiFS5V55/N+S
	4/rlOS9LixI9ZDzo3QNMRaGAMdo1KX24BXdwGUC+lJPMD5P2JWv6h9hF9YLgmici2+GLwYODIAr9+
	n4irRHW5aU3W6CORxZbUDITvu4VBfKUiLrRi+V1Ay0PZnEnYZhzh1yTGw+b4dpl7804Um/M6Lm+Lq
	OcTlU0QGBFV1VV3wFsNE9f4fJkJRyUUgiejJE1BF0UN4WCY0J9JT/ZaAM2PZrEsaOknBodawYiA/J
	wnI8IsM65yITZouLtAG82w1M8ywO7QGyFooXQe3RdvnIBZgkPgpAp6BT1BEiY4NvRYieiRVB055QN
	S6DbEQyq/fNAPJnymrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheFi-0000000FcPO-0x0z;
	Tue, 05 Mar 2024 23:31:18 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheFe-0000000FcOK-0zb4
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 23:31:16 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e617b39877so2606057b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 15:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709681473; x=1710286273; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IeWN+y8hzDjoL2lW91XHHFhLxiQLLm1CjcAWiQRSBT0=;
        b=19wV1Oh2bIaBwhX9caWML4IAbSZUTg3t2J3oDVHl2kqZbVBFcHeJ7h8lvepSWb1Y+8
         lbBtcfxoC1GsQIhWUthXN/3zsgKBO/DhetgfHscix38jFgjK8RlgImw8bTC6+t0kWM2r
         SIw6N1XWR5XlD4nxLxpo0tEwQtO0TYoZztI+RhBuNoHjwkW712T79NV2tCeb2UZ/q4+n
         VOM4I4RHlOJadEdel42qes3Ev0cyk3zy0p80feypXCw9C5ciQCr0WjpCH6gZwMOvQDJI
         3gtjsMwYLIT/k9nO3RwR94rjs8Kl5UWMWC66AnQgATojyV8jWOdS9uDueUFGxcn4KOgF
         Sy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709681473; x=1710286273;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IeWN+y8hzDjoL2lW91XHHFhLxiQLLm1CjcAWiQRSBT0=;
        b=hBA8ReTCajUVWDcABVf8nYZ26ruvr0CTb0EqlKpkRY4fYouJy3ltqw1cDAyYuHevdj
         k3mWdR2thn9IPPnhvvRI5Wih3X1eKSe+aOnfKEZ0c5fcmOUpFY9hmY+uyvxugfuAsP6h
         6J1xROh18u2AQtjuMOOB15awCPba/ryVnpINxaudvPYwfVOdxlL8XhyVY+sVTlQMJNkh
         jXVMWSAp6RwQoYg+a/qRfwHJfQHilKFzvXBh5dKD5cNGP8Opv+GPrXiuxVporKfLa7Oh
         xEVc135NJaMhVOIDuW8VFnBQONzxejq0yLumYPfpDLADq3vzrw+aXqqM1+InpZ+7ra+n
         RWcw==
X-Forwarded-Encrypted: i=1; AJvYcCXyTyCWeI2dcxTR8Fi5sqr8SoUYPrmfrdD/xfQD2uXrWt2xH9gjs+7ntBxP8psBNSD+zkugwCRRVarNlwkOhBrVVLn3E7C+rSEj+G60NALH
X-Gm-Message-State: AOJu0YzY8vEbhdxWZNBhmi7PyMGfMcNvM5IaQoSjV6s2W40up4yynUs3
	OZ5EgoRjT363pq+wd79/3JHKV6PoaWZlzg+qmWAz57o03ByD9U+HR3gePPhNXhk=
X-Google-Smtp-Source: AGHT+IH6l7SgvPlwnEAvb3B1Nw3MuQSM1ObEk9Sj5K4yQCwkP4CpZ0MFTmOvs9B9fyoV59rRWXYXRg==
X-Received: by 2002:a05:6a00:cc5:b0:6e1:482b:8c8e with SMTP id b5-20020a056a000cc500b006e1482b8c8emr14132097pfv.17.1709681472638;
        Tue, 05 Mar 2024 15:31:12 -0800 (PST)
Received: from ghost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id m19-20020aa78a13000000b006e509762bc2sm9541617pfa.26.2024.03.05.15.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 15:31:12 -0800 (PST)
Date: Tue, 5 Mar 2024 15:31:09 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>,
	Andrea Parri <parri.andrea@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-kernel@vger.kernel.org, David.Laight@aculab.com,
	Conor Dooley <conor@kernel.org>
Subject: Re: Re: Re: [PATCH v3 0/2] Add Zawrs support and use it for spinlocks
Message-ID: <ZeerPVB5c7gvgWCw@ghost>
References: <20230521114715.955823-1-heiko.stuebner@vrull.eu>
 <ZTE7eUyrb8+J+ORB@andrea>
 <CAEg0e7jkTOn1pjO=+GaiCZJ9_Yd2NcB1GMG=Q6m3-r0+Q0OjGQ@mail.gmail.com>
 <ZTJUOji+B+dDbMKh@andrea>
 <20240108-a56ba0dfd1779e4ab6893d16@orel>
 <CAEg0e7g34qXbtaGbQftqucRxopFKHvErm=DWx8N65kueDo2n4w@mail.gmail.com>
 <20240108-2a146eb7def54f0ce0b0d930@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108-2a146eb7def54f0ce0b0d930@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_153114_548409_8DA1B4A6 
X-CRM114-Status: GOOD (  34.37  )
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

T24gTW9uLCBKYW4gMDgsIDIwMjQgYXQgMDM6MTA6MTJQTSArMDEwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIE1vbiwgSmFuIDA4LCAyMDI0IGF0IDAzOjAwOjI5UE0gKzAxMDAsIENocmlzdG9w
aCBNw7xsbG5lciB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDgsIDIwMjQgYXQgMTI6MzXigK9QTSBB
bmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMTI6MTk6MzhQTSArMDIwMCwgQW5kcmVhIFBhcnJpIHdy
b3RlOgo+ID4gPiA+IChSZW1vdmluZyBIZWlrbydzIEB2cnVsbCBhZGRyZXNzIGZyb20gQ2M6LCBz
aW5jZSBpdCBzZWVtZWQgdG8gYm91bmNlLCBrZWVwaW5nCj4gPiA+ID4gIGhpcyBAc250ZWNoIGFk
ZHJlc3MuKQo+ID4gPiA+Cj4gPiA+ID4gPiBJIGhhZCBhIHF1aWNrIGxvb2sgYXQgeW91ciBjaGFu
Z2VzLCBhbmQgdGhleSBsb29rIGdvb2QgdG8gbWUuCj4gPiA+ID4KPiA+ID4gPiBHcmVhdC4gIFRo
YW5rIHlvdSBmb3IgbG9va2luZyB0aGVtIG92ZXIuCj4gPiA+ID4KPiA+ID4gPiA+IERpZCB5b3Ug
YWdyZWUgd2l0aCBQYWxtZXIgYWJvdXQgdGVzdGluZyByZXF1aXJlbWVudHM/Cj4gPiA+ID4gPiBJ
LmUuLCBkbyB3ZSBuZWVkIHRvIHJ1biB0aGlzIG9uIGhhcmR3YXJlIHRoYXQgaW1wbGVtZW50cyBa
YXdycyBpbiBhCj4gPiA+ID4gPiBub24tdHJpdmlhbCB3YXk/Cj4gPiA+ID4KPiA+ID4gPiBJIGRp
ZG4ndCBxdWl0ZSBkaXNjdXNzIHN1Y2ggc3BlY2lmaWMgcmVxdWlyZW1lbnRzIG9yIGhhcmR3YXJl
IGltcGxlbWVudGF0aW9ucywKPiA+ID4gPiBidXQgSSBhZ3JlZSB0aGF0J3MgYSB2YWxpZCBjb25j
ZXJuLiAgTm90IHRoYXQgSSBjdXJyZW50bHkgaGF2ZSBhY2Nlc3MgdG8gc3VjaAo+ID4gPiA+IGhh
cmR3YXJlOyBhbnkgZnVydGhlciBpbnB1dHMvZGF0YSB3aWxsIGJlIGFwcHJlY2lhdGVkLgo+ID4g
PiA+Cj4gPiA+ID4gPiBJIGNhbiB0cnkgdG8gcmFpc2UgdGhlIHByaW9yaXR5IG9uIHRoaXMgaGVy
ZSwgYnV0IGNhbid0IHByb21pc2UgYW55dGhpbmcuCj4gPiA+ID4gPiBGb3IgbWUgaXQgaXMgYWxz
byBvayBpZiB5b3UgdGFrZSBvdmVyIHRoaXMgcGF0Y2hzZXQuCj4gPiA+ID4KPiA+ID4gPiBUaGFu
a3MuICBFaXRoZXIgd2F5IHdvcmtzIGZvciBtZS4gIE5vIHVyZ2VuY3kgZnJvbSBteSBzaWRlLiAg
SSdkIHNheSAtIGxldCB1cwo+ID4gPiA+IGxlYXZlIHRoaXMgdXAgdG8gdGhlIGNvbW11bml0eS9v
dGhlciByZXZpZXdlcnMuICAoSUlVQywgUGFsbWVyIHdhcyByZWNvdmVyaW5nCj4gPiA+ID4gZnJv
bSBhIGNlcnRhaW4gZmx1IGFuZCBtaWdodCBuZWVkIG1vcmUgdGltZSB0aGFuIHVzdWFsIHRvIGdl
dCBiYWNrIGhlcmUuKQo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEhpIGV2ZXJ5b25lLAo+ID4gPgo+ID4g
PiBJJ20gYWxzbyBpbnRlcmVzdGVkIGluIHNlZWluZyB0aGlzIHNlcmllcyByZXN1cnJlY3RlZCBh
bmQgbWFraW5nIHByb2dyZXNzCj4gPiA+IGFnYWluLiBJJ2QgYmUgaGFwcHkgdG8gaGVscCBvdXQg
aW4gYW55IHdheS4gSXQncyBub3QgY2xlYXIgdG8gbWUgaWYgaXQgaGFzCj4gPiA+IGEgY3VycmVu
dCBvd25lci4gSWYgbm90LCB0aGVuIEkgY291bGQgc3RhcnQgc2hlcGhlcmRpbmcgdGhlIHBhdGNo
ZXMgd2l0aAo+ID4gPiB0aGVpciBhdXRob3JzaGlwcyBpbnRhY3QuCj4gPiAKPiA+IFNvdW5kcyBn
b29kIHRvIG1lIQo+ID4gVGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMhCj4gCj4gVGhhbmtzIGZv
ciB0aGUgcXVpY2sgcmVwbGllcyEgSSdsbCB0cnkgcHVsbCBzb21ldGhpbmcgdG9nZXRoZXIgaW4g
dGhlIHZlcnkKPiBuZWFyIGZ1dHVyZS4KPiAKPiBkcmV3CgpJIGFtIGludGVyZXN0ZWQgaW4gdGhp
cyBhcyB3ZWxsLCBwbGVhc2UgY29weSBtZSB3aGVuIHlvdSBzZW5kIG91dCB0aGUKcGF0Y2ggRHJl
dyEKCi0gQ2hhcmxpZQoKPiAKPiA+IAo+ID4gPgo+ID4gPiBJIG1heSBiZSBhYmxlIHRvIGRvIHNv
bWUgdGVzdGluZyBvbiBhbiBGUEdBIHRvby4KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBkcmV3
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBs
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
