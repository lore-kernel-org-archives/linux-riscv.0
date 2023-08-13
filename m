Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5305AC001DE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Aug 2023 06:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D/MIw2Z9Lq0Vj8jY48QcEmdR4FRmmbVJi5FBrZMLAU=; b=Z86eoMn1IBzBjS
	4eBB1AxcGkjBkZrV9/6QsPO4W8nwkxOq4+R3ph37LKJ75pXiW8uMZ3kr4RUFEfvXg+914evlUQbbj
	ogYsAOPV/Z1CameJVtUguHQmuMJu9BcCwJ7iQZkJcKt7LlFRgTkdVBETskIzozsPx0EWMACLZuj3S
	x6RMZqTKdPpn/usFEC3LDziB3lGbHLdeO+gl6NKwMfwdmEQ2HL4LQnhBmlx+OrhkxxLbVyTPp1rIL
	/KB9f32FAnpr5/RnRWR4NOolBqlhlGCbP+cxvayLEd8viEPK7N+RIOy8NyLtJZ+kcVN2d1KrX0nN7
	Y7HiqhPk+jRHiO0a7pIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV4NQ-00EXkq-2r;
	Sun, 13 Aug 2023 06:15:00 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV4NO-00EXkH-0c;
	Sun, 13 Aug 2023 06:14:59 +0000
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-686be3cbea0so2975914b3a.0;
        Sat, 12 Aug 2023 23:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691907297; x=1692512097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PquNnrwc6lc8WzSRLbxFenC5bqhWO9QOMiyMhVomEDw=;
        b=dEzZEUnKnq6zPEIfKUV+Ug/Yvj9KumVLmQjwdEf4EJgZEqmrluCIwRjiEoHo8WD8fx
         R1TpJoR7axOP10mScg/1s0mzidALdNL+hFfb2Z/PT0JYAHdzn15IEcf7YvzBOJKcsR/+
         VbcebY5qk8WvBFvHOrz371HoD2V91WZt2HkPDuSTqj3iyJ22Hly0av8d6uAc2X/LUBmf
         6afdZ/UhkQPFIgIjAWurl2QtRSMgNFm3wtTgVkbetGYhpHaHXupjHey1Tc+RJUH+ZqS7
         xPvT71IDlb1xtLn8g58IEinMkj252xC95j8eMrnRhnfbKqiJP+u2fHpBXjqBEg9dvDGt
         JiGg==
X-Gm-Message-State: AOJu0YwnVP47cyim6j/vl61AyIV3FQYMvgEdykTWbVn/uKyw18qcaviq
	/UHvOmFx82HKmIPBE/wh7hRzWpCShX5FaQ==
X-Google-Smtp-Source: AGHT+IH5z/pBe1M0/NHnLkqwP4QYlif0QE/cASP2sfQTeI9PWJvZWUYUrEtnuzUGXMYfe/9C8hj6uw==
X-Received: by 2002:a05:6a21:9994:b0:13d:71f4:fd8a with SMTP id ve20-20020a056a21999400b0013d71f4fd8amr7631058pzb.13.1691907296747;
        Sat, 12 Aug 2023 23:14:56 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id d25-20020aa78159000000b00686f082cc0fsm5711592pfn.106.2023.08.12.23.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 23:14:55 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68730bafa6bso2959964b3a.1;
        Sat, 12 Aug 2023 23:14:54 -0700 (PDT)
X-Received: by 2002:a17:90a:e0f:b0:267:f8f4:73ab with SMTP id
 v15-20020a17090a0e0f00b00267f8f473abmr12065548pje.16.1691907294402; Sat, 12
 Aug 2023 23:14:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230807191952.2019208-1-contact@jookia.org> <CAGb2v66vqrNZ-ga-1O_bQ16BWXH=RmSHo2Kb+WHJyw-Nm1kWVg@mail.gmail.com>
 <ZNhau0j_tV3EXGxl@titan>
In-Reply-To: <ZNhau0j_tV3EXGxl@titan>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 13 Aug 2023 14:14:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v647FoATnjk43GKqVihX-FtZN+7XrxMMRseuqap0MBg2FQ@mail.gmail.com>
Message-ID: <CAGb2v647FoATnjk43GKqVihX-FtZN+7XrxMMRseuqap0MBg2FQ@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: dts: allwinner: d1: Add CAN controller nodes
To: John Watts <contact@jookia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230812_231458_255100_63BE85D8 
X-CRM114-Status: GOOD (  23.49  )
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
Reply-To: wens@csie.org
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBdWcgMTMsIDIwMjMgYXQgMTI6MjPigK9QTSBKb2huIFdhdHRzIDxjb250YWN0QGpv
b2tpYS5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBBdWcgMTMsIDIwMjMgYXQgMTI6MTc6MjdQTSAr
MDgwMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIFdhdHRz
IDxjb250YWN0QGpvb2tpYS5vcmc+Cj4gPiA+IC0tLQo+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4g
PiAtIFNldCBkZWZhdWx0IHBpbmN0cmwgZm9yIGNhbiBjb250cm9sbGVyCj4gPiA+IC0gTW92ZWQg
Y2FuIG5vZGVzIHRvIHByb3BlciBsb2NhdGlvbgo+ID4gPiAtIE1vdmVkIGNhbiBwaW5zIHRvIHBy
b3BlciBsb2NhdGlvbgo+ID4gPgo+ID4gPiAgLi4uL2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1k
MXMtdDExMy5kdHNpICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4gPiA+IGluZGV4IGQ1OWI0YWNm
MTgzYS4uMjRmMmU3MGQ1ODg2IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPiA+ID4gQEAgLTUyLDYgKzUyLDE4
IEBAIHBpbzogcGluY3RybEAyMDAwMDAwIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
I2dwaW8tY2VsbHMgPSA8Mz47Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICNpbnRlcnJ1
cHQtY2VsbHMgPSA8Mz47Cj4gPiA+Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC9vbWl0
LWlmLW5vLXJlZi8KPiA+Cj4gPiBKdXN0IEZZSSB0aGlzIGxpa2VseSBlbmRzIHVwIGRvaW5nIG5v
dGhpbmcgaWYgeW91IGFsc28gaGF2ZSB0aGVtCj4gPiByZWZlcmVuY2VkIHRocm91Z2ggYSBkZWZh
dWx0IHBpbmN0cmwgc2V0dGluZy4gVGhleSBlbmQgdXAgYWx3YXlzCj4gPiByZWZlcmVuY2VkIGFu
ZCBhbHdheXMgaW5jbHVkZWQuIEZvciB0aGUgRDEgc2VyaWVzIGl0IGxvb2tzIGxpa2Ugbm8KPiA+
IHBlcmlwaGVyYWwgaGFzIGRlZmF1bHQgcGluY3RybCBzZXR0aW5nIGdpdmVuLgo+ID4KPiA+IFdl
IGNhbiBzdGlsbCBrZWVwIGl0IHRob3VnaC4gSXQgd291bGQgaGVscCB3aGVuIGZ1dHVyZSBjaGlw
IHZhcmlhbnRzCj4gPiBzcGVjaWZ5IGRpZmZlcmVudCBwaW5tdXhlcy4KPgo+IE9vcHMsIHRoYW5r
cyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQuIEknbGwgdHJ5IHRvIGF2b2lkIHRoYXQgbWlzdGFrZSBp
biBmdXR1cmUuCj4KPiA+IFRoZSBjb21wYXRpYmxlIHN0cmluZyBzaG91bGQgYmUgdGhlIGZpcnN0
IHByb3BlcnR5LiBJbiBvdGhlciBzdW54aSBTb0MgZHRzaQo+ID4gZmlsZXMsIHdlIHB1dCB0aGUg
cGluY3RybCBqdXN0IGJlZm9yZSB0aGUgInN0YXR1cyIgcHJvcGVydHkgaWYgaXQncyBwcmVzZW50
Cj4gPiB0byBzcGVjaWZ5IGEgZGVmYXVsdCBwaW4gbXV4aW5nLgo+Cj4gT2ggdGhhdCBtYWtlcyBz
ZW5zZS4KPgo+ID4KPiA+IEkgY2FuIGZpeCBpdCB1cCB3aGlsZSBhcHBseWluZy4KPgo+IFBsZWFz
ZSBkbyEKCkFwcGxpZWQuIFBsZWFzZSBjaGVjayBoZXJlOgoKaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3VueGkvbGludXguZ2l0L2NvbW1pdC8/aD1zdW54
aS9kdC1mb3ItNi42JmlkPWYwNWFmNDRmNjkxMzUxYmZkOTU0ZjM5ZWMzNzY2NjZkYzVlMWI4NjkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
