Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F063C32771
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 09:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1HD2SecvqZnQT6fuxFeX4NHwVTcw5IzXGpksZb5yPc=; b=bFG6B74FN/6zQQ
	5Ckrp1DZ9vjnew0lkOLdXWgwYfWDtzHJ4TNNK2xJsExw6+5z6bLl/QphMtzYIBM9Sj+ZKiSQV0fa8
	G6x/C/Fd05fPRVMg09L+kqjZOXM28mqLUX6CVnJwJa32uyHomzu8Ohb+QF0f++p3OPEjm0Un2F6Oy
	9zPw5Y6gESBZkyJSiWyUvIdQlkj/rqP6bXLGL1X2E1qYRQZqnKvhIWJuFP/kIy9knHybJ+7TUXEUH
	51VPkuTbiTFZD0eCvysmm2KwP1o5Lk8Si7Mi7c4fMLlBpW6hexcnoJ3roB6EVTJA/dLxw2eO9443o
	84a8IsNdRudvJTenSrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNspw-000Hds-3Z; Tue, 16 Aug 2022 09:26:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNspi-000HUx-NJ
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 09:26:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id r4so12673144edi.8
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 02:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=p2IAoMXBFUx3gxWp+4ICwtPEKeo+wvYA575xG1H6jVI=;
        b=WLvFZu2KS+q7THGZo9rHUDk4wDTyZ4zqLbQUR0lnef4x6El+rrsbBeFOSf0fg+5FFE
         +5KdbCM9VHFcQlUrRnxbKlpfmYyKz1NSKx0uwDunbyOdRi1iQbIFtzIQx5C+zT4g8oe4
         Yg6ejIKdWFY/BoB1cv2pfomkAO2W41Ansn4cb7c85y/kRaZOVFPLpA46gMhtn3LG387u
         0+mUg9xYw/8DxVT+zo3hhsZucpjCEKyWvEbSDqyxdYRRSvwv2tvkTjZ0cmSYo2bxxCOh
         7pCETWJ02xnPN8vxu19rPFljUNDiBOkHY5o/3K4N5Wz6qJGdYIZP5+ApBVBYt/8TefxM
         pF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=p2IAoMXBFUx3gxWp+4ICwtPEKeo+wvYA575xG1H6jVI=;
        b=bnZimoXU9cbCryK+xVMSHcobaG7M8qPPIynEGzhlygjUH0c3HjvU2efUfWFyijk7Eh
         OjN/7EsHPQ3iVCBfIFAc4xlFYEVqouTsuKuYMTZVfIsYDGvXdvg05QkS1eRK691bpzZA
         P79OEwLqayOhSSaI4UPIC6/+9DhceudCep4BsOEkL/WgCoeWaikr5yGFNJL+wuZBr58f
         LgemWDRS1jtXQdJVqc9VRFRc6hamVhNPEclpZxHVdJuK0YhOG00vPCpWN1sFsyrthTE3
         XyqqPHDxfMXRUpAG8V4VQFSWlXyfDqoLf2fK+9Gmd6svYpnV8nT3MOCpTjSnR7Vzc4F0
         l+Ag==
X-Gm-Message-State: ACgBeo192uJHIHPtCa+5WmJtV59k22xvQ40q9s+Jr1Nktqcf+yJTrH/m
	FPjKGOQwAq/PlM0OBmXkgC8=
X-Google-Smtp-Source: AA6agR41CmKxbTEYoP/DOpTKRPVPg8STgzbCPzshr17hiEzC27VkjvA7+xRqBIA+VNOKDchJNuruHw==
X-Received: by 2002:a05:6402:1f87:b0:43b:b88d:1d93 with SMTP id c7-20020a0564021f8700b0043bb88d1d93mr17792300edc.314.1660641955004;
        Tue, 16 Aug 2022 02:25:55 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id cn19-20020a0564020cb300b0043bdc47803csm8142604edb.30.2022.08.16.02.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 02:25:54 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
Date: Tue, 16 Aug 2022 11:25:53 +0200
Message-ID: <2249129.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <3881930.ZaRXLXkqSa@diego>
References: <20220815050815.22340-1-samuel@sholland.org> <5593349.DvuYhMxLoT@jernej-laptop> <3881930.ZaRXLXkqSa@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_022602_878853_47570E8E 
X-CRM114-Status: GOOD (  12.94  )
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

RG5lIHRvcmVrLCAxNi4gYXZndXN0IDIwMjIgb2IgMTE6MTI6MDUgQ0VTVCBqZSBIZWlrbyBTdMO8
Ym5lciBuYXBpc2FsKGEpOgo+IEFtIERpZW5zdGFnLCAxNi4gQXVndXN0IDIwMjIsIDA5OjQ5OjU4
IENFU1Qgc2NocmllYiBKZXJuZWogxaBrcmFiZWM6Cj4gPiBEbmUgdG9yZWssIDE2LiBhdmd1c3Qg
MjAyMiBvYiAwOTo0MTo0NSBDRVNUIGplIEtyenlzenRvZiBLb3psb3dza2kgCm5hcGlzYWwoYSk6
Cj4gPiA+IE9uIDE1LzA4LzIwMjIgMDg6MDgsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4gPiA+
ICsKPiA+ID4gPiArCWRlOiBkaXNwbGF5LWVuZ2luZSB7Cj4gPiA+ID4gKwkJY29tcGF0aWJsZSA9
ICJhbGx3aW5uZXIsc3VuMjBpLWQxLWRpc3BsYXktZW5naW5lIjsKPiA+ID4gPiArCQlhbGx3aW5u
ZXIscGlwZWxpbmVzID0gPCZtaXhlcjA+LCA8Jm1peGVyMT47Cj4gPiA+ID4gKwkJc3RhdHVzID0g
ImRpc2FibGVkIjsKPiA+ID4gPiArCX07Cj4gPiA+ID4gKwo+ID4gPiA+ICsJb3NjMjRNOiBvc2My
NE0tY2xrIHsKPiA+ID4gCj4gPiA+IGxvd2VyY2FzZQo+ID4gPiAKPiA+ID4gPiArCQljb21wYXRp
YmxlID0gImZpeGVkLWNsb2NrIjsKPiA+ID4gPiArCQljbG9jay1mcmVxdWVuY3kgPSA8MjQwMDAw
MDA+Owo+ID4gPiAKPiA+ID4gVGhpcyBpcyBhIHByb3BlcnR5IG9mIHRoZSBib2FyZCwgbm90IFNv
Qy4KPiA+IAo+ID4gU29DIG5lZWRzIDI0IE1IeiBvc2NpbGxhdG9yIGZvciBjb3JyZWN0IG9wZXJh
dGlvbiwgc28gZWFjaCBhbmQgZXZlcnkgYm9hcmQKPiA+IGhhcyBpdC4gSGF2aW5nIGl0IGhlcmUg
c2ltcGxpZmllcyBib2FyZCBEVCBmaWxlcy4KPiAKPiBJIGd1ZXNzIHRoZSBvc2NpbGxhdG9yIGlz
IGEgc2VwYXJhdGUgY29tcG9uZW50IG9uIGVhY2ggYm9hcmQsIHJpZ2h0PwoKQ29ycmVjdC4KCj4g
QW5kIERUIG9idmlvdXMgaXMgbWVhbnQgdG8gZGVzY3JpYmUgdGhlIGhhcmR3YXJlIC0gaW5kZXBl
bmRlbnRseSBmcm9tCj4gaW1wbGVtZW50YXRpb24tc3BlY2lmaWMgY2hvaWNlcy4KClRoZXJlIGlz
IG5vIGNob2ljZSBpbiB0aGlzIGNhc2UuIDI0IE1IeiBjcnlzdGFsIGhhcyB0byBiZSBwcmVzZW50
LgoKRldJVywgaW5jbHVkaW5nIGNyeXN0YWwgbm9kZSBpbiBTb0Mgc3BlY2lmaWMgRFRTSSBpcyBh
bHJlYWR5IGNvbW1vbiBwYXR0ZXJuIGluIApBbGx3aW5uZXIgQVJNIFNvQyBEVFNJIGZpbGVzLgoK
PiAKPiBTdGFydGluZyB0byBkaXNjdXNzIHdoaWNoIGV4Y2VwdGlvbnMgdG8gYWxsb3cgdGhlbiBt
aWdodCBsZWFkIHRvIGV2ZW4gbW9yZQo+IGV4Y2VwdGlvbnMuCj4gCj4gQWxzbyBoYXZpbmcgdG8g
bG9vayBmb3IgYSBib2FyZC1jb21wb25lbnQgaW4gdGhlIHNvYyBkdHNpIGFsc28gaXMgc3VycHJp
c2luZwo+IGlmIG9uZSBnZXRzIHRvIHRoZSBwYXJ0eSBsYXRlciBvbiA6LSkgLgoKQXMgSSBzYWlk
LCBpZiBvbmUgaXMgYWNjdXN0b21lZCB0byBBbGx3aW5uZXIgQVJNIERUIGRldmVsb3BtZW50LCBp
dCB3b3VsZCBiZSAKbW9yZSBzdXJwcmlzaW5nIHRvIGluY2x1ZGUgMjQgTUh6IGNyeXN0YWwgbm9k
ZSBpbiBlYWNoIGFuZCBldmVyeSBib2FyZCBEVC4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
