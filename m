Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AEAC531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diTQdNIIdz65qiUBUv/t3Qej2tz321PXhTITyhUdYJc=; b=rtKH38g/LkLNHE
	j3qDONU3K1BWDSyseToIY8mtDAxdVniLizDiIJg5mq0sjPV64iyi0xcwHYeoO8IFJOzDcg8037bl8
	O4wloGj1pF9C6klqT2W6879ux2FvzC9Cgcsa3SNvix238276kf8+eED0AGhvHyKmsc6evJ3LeHbAW
	wRtH7BbuzqwYqfnkmlUca8qyul6ubLP5CJyBiHnHZj/gFPfZ4wut+sLsGWthBgROthlvMdr+uwn6u
	/mh9zguWgtGkBMFngcSK7+o9GXq8zwyv20Y0MNqegI5BL2rkn7pqGiGul5IZ4rzgnnFC4kvD4ff8k
	BGyDoaK2ny+CxbmaVebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndiX-00000000SRW-2Lv7;
	Sat, 25 Jul 2026 14:51:09 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wndiR-00000000SR8-1qb9
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 14:51:08 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-6689f36ae56so1570049d50.3
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 07:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784991061; cv=none;
        d=google.com; s=arc-20260327;
        b=iiOuB9SVWj1iqX2VwaDmCLO1mbtlgw4p8kJOHhcqvOQBPNam3oVKmX0F6tWpw9TiQs
         ZoXBWoca40oeW5j5TnuZFLC7KSMlgNdvAVfwa5UTQoj+I1lUwZ995vBDeISijby7lYFp
         HSDe1kOomMxVHE7k4K1vASBUjpm4L886FNhXXNgqBOL9bLIB6GNUlEXKDPvQKU5b73y9
         f9rSvP7tBh5JiD4VxfsbvoMWJG04GL7g3eYcmnokBQS+7j6sV0T/vol+NDmZnccHjr/S
         1qY25cDXTNJlsijyoprPXtWzJ4HgO6V/0veb1jKAgjVljZvQXqv7wRSxNgWo84PXn5hU
         9GbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        fh=acxNrhTOP3GN6fa4/azK3DNdLixcce39Xt+ID6FzSmY=;
        b=DWh/X9/uETtyEDh2bt5GhtbJ4wAJvpKTfcsBqCgpeNI7YsgmmK+NeowZifPW26SGsr
         Yi+a7wwt5YbPna8UFqIqC5OVJe3K0jUEIqtj4I6EqLRMhwn6TdQOoky5QhrOKjwr4wrI
         2poJyuSgWYg0sAWl0xiS5AnoosxR7G0qSapPC/0O2ZEAUGl4mVZjb2HMQI6EVI5EqGjS
         ZyvK7JGpmgfObqXd6++tAlkXeYbqyD/XkBZTZqUpHHZcCcjZ+NlpVa3FwNJn1qkVNCDu
         z0LHT8vards8NPpAFPWjgnH0gguXIrbZSEmjNusvugov6kR3n+0HUXBDUvJilZoTWo1X
         t+kA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784991061; x=1785595861; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        b=HCRoMqlSjj/R9ztcdeBGe1nsEOL4CLZYsB+YMMgUdAMctVl4fjAEWyvP4IZDeYD3B7
         b2yanDQJz8q0ZBO9tqW1MS8Y1038w6rFHMl0Nz/Ky+goEQr58ZKgetPEGAkvI6TqMvkg
         6Eu9DAe6nMz7YQ0RYFjMS0qV7I0NZOEYmZ4W7iv2n1JNQdEad0U01VV5FNRHkzLSpwUX
         HYEqzYdjYuR3EjIC86WyCTLLlJpSsvpenkwybJppoIsjWyGXKgwipPIAAc/ON/NnwJ+s
         5Uy1FhDtwQWuEiA5wa+EqB7OfG6LQ/KG0uB6hfBFW/XpkzGXcf7YdKzfj8IqUwkYIOb0
         KGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784991061; x=1785595861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnFY+NL1wMs6HQctnpLrg5MSHuL5XLJldyr4+uKR9zM=;
        b=Sh0zScM5EMm52Vv3FdUpCe/CCCiAfUoDHtaGSOfPsGzHBXwb11bKoMYc1MsEOj8RLH
         ubZZgzWwMfkodDoydF+eXjSfQsF6l1PoOJbA3BqbynaO61VnTQhm2Ekozg8SihzbrGot
         /CLv5V7CBaMz36mvFStcb8ahwqGPrMSysZZmOsfj4NxzOP22pw1ih2vgkb+I9Bvo5g5Y
         s9/NLydOXb8SQMy+yMABFBDrCRkXzyTXTZLT2CQXrN1C8vPRK5Dk/9ow0NYrgu/TcA/h
         9cvlEW8gOpK7HLyt9NhoptqsapTVPAR+FAf3ftodm4a5D+ePA7unerpD/EtxK0fi0+VT
         V49A==
X-Forwarded-Encrypted: i=1; AHgh+RrwOViZEADWNMl2Oopc4ayrkbYhmIXMaUuaqY0WMiSoqPBMWZTsuVen2Cvi+i+k90N1pPjnFowh1u5iEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzRMsMGDsL/aEIufUfZPFaF3N1mZ5ksAW0nWs4qNOiNuJLfJTq
	05o8KCt1y5lH9oAsE6B5hQ8sJPdlJ36F7X1CK0XcdrVDZ4D03UF0ehLmvYzpOxkjdIGvX4+PoXl
	yqcAXvMvYHS77SyL3hUs0Bk69O7fzu+BumAsUQa+zKw==
X-Gm-Gg: AR+sD13gzhIigNGF/GGAN/4YL7ZutsG4dVcJfpTNFQppZU3xkUiWRyzJM1ir4jIlyMM
	APBQvJlzmV5yZKTA9fN2uRw8VSkK0HLxf0RaVkQq8AZwGBflR2zj4fKIBuEpxI2QcU8Cbn+NQFA
	xyz44NuiENW1EQbx8s1BQ4pNQkYqu04zfEkBhf4A+rbYtXmk8bbhZlCBDoqGiWCilP4YNqKZmix
	NvgSRlA2P6xIvlW1JdlJHBp4RARiImHSYAO+8o+n8tsva2zb0pX7xUeffFwvqzBoa1/oTRG74oR
	J1hyaXrGj7juiXgtDfiF0mNfc1pZ1dLYZfxjVG20S6p2LrQFC9U=
X-Received: by 2002:a53:acd0:0:10b0:668:98b:dc54 with SMTP id
 956f58d0204a3-668c7a3fc07mr491029d50.41.1784991060853; Sat, 25 Jul 2026
 07:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org> <7x3b4sttnc4oxkuvxmpkihfi76lkapjcigo7khgcgfytvol7w2@v5ykuyrk2z3m>
 <20260725091824-GKA77545@kernel.org>
In-Reply-To: <20260725091824-GKA77545@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sat, 25 Jul 2026 09:50:50 -0500
X-Gm-Features: AUfX_mxi8h9KJVu9G6xUZkOpr4TATQAXRS0gOluTWc4FpB0HNeql-4Yjcvl9SVk
Message-ID: <CAEev2e8z3cJn+ALoqu=ZoozpTJ6vO_eTgiDrSjC4nOC1XK57FA@mail.gmail.com>
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller driver
To: Yixun Lan <dlan@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_075103_512036_28586A92 
X-CRM114-Status: GOOD (  22.04  )
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

SGkgWWl4dW4sCgpPbiBTYXQsIEp1bCAyNSwgMjAyNiBhdCA0OjE44oCvQU0gWWl4dW4gTGFuIDxk
bGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGkgQW5pcnVkaCwKPgo+IE9uIDE1OjE2IFN1biAx
MiBKdWwgICAgICwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+ID4gT24gVGh1LCBKdWwgMDIs
IDIwMjYgYXQgMDI6MzE6MzZBTSArMDAwMCwgWWl4dW4gTGFuIHdyb3RlOgo+ID4gPiBTcGFjZW1p
VCBLMyBTb0MgY29uc2lzdCBvZiBVRlMgKFVuaXZlcnNhbCBGbGFzaCBTdG9yYWdlKSBIb3N0IENv
bnRyb2xsZXIKPiA+ID4gd2hpY2ggaGFzIGZlYXR1cmVzIGNvbXBhdGlibGUgd2l0aCBKRURFQyBV
RlMgMi4yLCBNSVBJIFVuaVBybyB2MS42MSBhbmQKPiA+ID4gTS1QSFkgdjMuMCBzdGFuZGFyZC4K
PiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Cj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy91ZnMvaG9zdC9LY29uZmlnICAgICAgICB8ICAxMiArCj4g
PiA+ICBkcml2ZXJzL3Vmcy9ob3N0L01ha2VmaWxlICAgICAgIHwgICAxICsKPiA+ID4gIGRyaXZl
cnMvdWZzL2hvc3QvdWZzLXNwYWNlbWl0LmMgfCA5MzEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gPiAgZHJpdmVycy91ZnMvaG9zdC91ZnMtc3BhY2VtaXQuaCB8
ICA5MCArKysrCj4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDEwMzQgaW5zZXJ0aW9ucygrKQo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91ZnMvaG9zdC9LY29uZmlnIGIvZHJpdmVycy91
ZnMvaG9zdC9LY29uZmlnCj4gPiA+IGluZGV4IGZmMTcwYzBiNmRhMC4uNGY1M2I3Zjc2ODhmIDEw
MDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3Vmcy9ob3N0L0tjb25maWcKPiA+ID4gKysrIGIvZHJp
dmVycy91ZnMvaG9zdC9LY29uZmlnCj4gPiA+IEBAIC0xMzIsNiArMTMyLDE4IEBAIGNvbmZpZyBT
Q1NJX1VGU19WQVJJQUJMRV9TR19FTlRSWV9TSVpFCj4gPiA+ICAgICBib29sCj4gPiA+ICAgICBk
ZWZhdWx0IHkgaWYgU0NTSV9VRlNfRVhZTk9TICYmIFNDU0lfVUZTX0NSWVBUTwo+ID4gPgo+ID4g
PiArY29uZmlnIFNDU0lfVUZTX1NQQUNFTUlUCj4gPiA+ICsgICB0cmlzdGF0ZSAiU3BhY2VtaVQg
VUZTIGNvbnRyb2xsZXIgZHJpdmVyIgo+ID4gPiArICAgZGVwZW5kcyBvbiBTQ1NJX1VGU0hDRF9Q
TEFURk9STSAmJiBBUkNIX1NQQUNFTUlUCj4gPgo+ID4gQ2FuIHlvdSBhZGQgU0NTSV9VRlNIQ0Rf
UExBVEZPUk0gYW5kIFNDU0lfVUZTX1NQQUNFTUlUIGFzIG1vZHVsZXMgdG8KPiA+IHJpc2N2IGRl
ZmNvbmZpZyAob3IganVzdCBhZGQgdGhlIGZvcm1lciBhbmQgYWRkIGEgZGVmYXVsdCB5IGlmCj4g
PiBBUkNIX1NQQUNFTUlUIGluIHRoaXMgS2NvbmZpZyBlbnRyeSkuIFRoaXMgd2lsbCBsZXQgZGVm
Y29uZmlnIGtlcm5lbHMKPiA+IHRvIGJvb3Qgd2l0aCBwZXJzaXN0YW50IHJvb3RmcyBvbiB0aGVz
ZSBkZXZpY2VzLgo+ID4KPiBPaywgd2lsbCBjb25zaWRlciBhZGRpbmcgb25lIGVudHJ5IHRvIHJp
c2N2IGRlZmNvbmZpZywgYnV0IHRoaXMgc2hvdWxkIGJlCj4gaGFuZGxlZCBpbiBhbm90aGVyIHNl
cGFyYXRlIHBhdGNoLCBmb3IgbWFraW5nIGl0IGFzIG1vZHVsZSBvciBidWlsdC1pbiBkcml2ZXIs
Cj4gSSdtIGluY2xpbmUgdG8gY2hvb3NlIGxhdHRlciBvbmUsIGJ1dCB3b3VsZCBiZSBnbGFkIHRv
IGhlYXIgZGlmZmVyZW50IG9waW5pb24KCk1vZHVsZSBzb3VuZHMgZ29vZC4KCj4gLS0KPiBZaXh1
biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
