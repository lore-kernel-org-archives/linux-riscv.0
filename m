Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F25C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 15:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5/9b5fYvelnMG2NC7uL2ADZfgymM7fy3mUKbCetEeE=; b=OGvemCFjeeeXah
	lNQACvhg8s8w2GAngdJxcTnkijCWEcRTjjfrVwBIYmePv/l1jQp5l6vNdQfB+4BqC/ob1klbcOcf8
	mjGV/VupZ3sXndpB8KQTIDrTl5ObBtmydRD5/PcKlL3m9LJipFEFXYhUUohn7dZ7VehyNfrY6vRPt
	sxnKc1WHm33OMnJrxF6zThhohG4Y15Bc8tagdsCBe7MEDNlXEzSOSw1KAmSc3cTsKOLPZZPdZgfAU
	kMW5E9IIuUYRTJRWnUFw4zvWt4ChXNmJW4yuAXMpgWyUE0Ki4SZHxfXEKZCKRmmdFwPQgCq3i63aT
	FZKSANm+aZZDRWWVTGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9sb-003gdG-0d;
	Fri, 15 Dec 2023 15:13:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9sX-003gaf-2P;
	Fri, 15 Dec 2023 15:13:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-336437ae847so662982f8f.2;
        Fri, 15 Dec 2023 07:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702653204; x=1703258004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brYOzG3g23wL22CEoDTu8T5IzltVcQQgzthieH5Rn74=;
        b=Ia6RexahlQJ7wuUiCRNjx9ZG8v3lvEf1EvsCd3QMLj7ovdVVzXIrfR85z5KVJUw6P/
         ApcUo6k/sOsPd2oPk35zkQXCgaKAKC3aPMqucmtMFS3SWxWzq6LB+qLOtZ/mKosxhoDq
         5eSOd8TmfGyLgJ8dHm9G4lpWvzm6HtKZv+2Qa8qNF+9E7IH7gZKWOIxtEhBN7Rgu0y98
         RkUoCBoUzhXdFacXYns2ym/iWTCCbSxV7Nbo97yVUXLw/QjiFhvxlN18wxiYHJ2Jl2Zx
         lvzK82VhHaEex+zcpsTZWzYQ0aIqQBUEwBUdsSJRw9/PpVRcL5LdCWIlioQF6s6IAhst
         bBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702653204; x=1703258004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brYOzG3g23wL22CEoDTu8T5IzltVcQQgzthieH5Rn74=;
        b=N4Sshsd4jNnFq0oPvdhvV7FPBzHhdGYWzxH9VQ16PEkXy/mQ2SmVdJHyNCfmPeDNpR
         imXaAaEed9lUJbjoHBouhgmiJwlbaxzPxjXRS9AzYXVNC8GYl+OcDCQKRRT8qoLpsezZ
         iTvqRmljBmwcwHQ2ZmnAcC6sBbxqWJKzyTWtX7wH0tDH/KA/jOdvASHOXZ17WXkpu/ru
         0kUloFDphBziH7987dib1lP5SygSjtGQr7rGQZ1RICt4ltEINO2OUy6zyAQz47sONlQT
         CMLLoPtOZwv8YTBTAmTp/xexyta76yxGDdyF8H74sJ3MTI1i1vvytyhsmDML5Wxki/Zg
         36lQ==
X-Gm-Message-State: AOJu0Yx08B6Jvb4Oc7Nb5g1VtVJFU/lrDc/h4wANw0I/VUBrUjzTGqQC
	XT2xfk+7BkWsB6JqTR9JghE=
X-Google-Smtp-Source: AGHT+IG6xfZAKkoFs/nB1j6orGlhGJ6P+tWaOcp0B83WVeZzCcdiugIKJlUguBz4lJNFDEAwHhhOIg==
X-Received: by 2002:adf:f050:0:b0:336:3538:6636 with SMTP id t16-20020adff050000000b0033635386636mr3854305wro.86.1702653203715;
        Fri, 15 Dec 2023 07:13:23 -0800 (PST)
Received: from localhost.localdomain ([154.72.162.212])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d4ed2000000b00336421f1818sm6600631wrv.112.2023.12.15.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 07:13:22 -0800 (PST)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: viresh.kumar@linaro.org
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fusibrandon13@gmail.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rafael@kernel.org,
	robh+dt@kernel.org,
	samuel@sholland.org,
	tiny.windzz@gmail.com,
	wens@csie.org
Subject: Re: [PATCH 1/5] riscv: dts: allwinner: Update opp table to allow CPU frequency scaling
Date: Fri, 15 Dec 2023 16:12:09 +0100
Message-Id: <20231215151209.46221-1-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231214111446.camz2krqanaieybh@vireshk-i7>
References: <20231214111446.camz2krqanaieybh@vireshk-i7>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_071329_780047_E3C3F90A 
X-CRM114-Status: GOOD (  29.15  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMTI6MTTigK9QTSBWaXJlc2ggS3VtYXIgPHZpcmVzaC5r
dW1hckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDE0LTEyLTIzLCAxMTozMywgQnJhbmRvbiBD
aGVvIEZ1c2kgd3JvdGU6Cj4gPiBUd28gT1BQcyBhcmUgY3VycmVudGx5IGRlZmluZWQgZm9yIHRo
ZSBEMS9EMXM7IG9uZSBhdCA0MDhNSHogYW5kCj4gPiBhbm90aGVyIGF0IDEuMDhHSHouIFN3aXRj
aGluZyBiZXR3ZWVuIHRoZXNlIGNhbiBiZSBkb25lIHdpdGggdGhlCj4gPiAic3VuNTBpLWNwdWZy
ZXEtbnZtZW0iIGRyaXZlci4gVGhpcyBwYXRjaCBwb3B1bGF0ZXMgdGhlIG9wcCB0YWJsZQo+ID4g
YXBwcm9wcmlhdGVseSwgd2l0aCBpbnNwaXJhdGlvbiBmcm9tCj4gPiBodHRwczovL2dpdGh1Yi5j
b20vVGluYS1MaW51eC9saW51eC01LjQvYmxvYi9tYXN0ZXIvYXJjaC9yaXNjdi9ib290L2R0cy9z
dW54aS9zdW4yMGl3MXAxLmR0c2kKPiA+Cj4gPiBUaGUgc3VwcGx5IHZvbHRhZ2VzIGFyZSBQV00t
Y29udHJvbGxlZCwgYnV0IHN1cHBvcnQgZm9yIHRoYXQgSVAKPiA+IGlzIHN0aWxsIGluIHRoZSB3
b3Jrcy4gU28gc3RpY2sgdG8gYSBmaXhlZCAwLjlWIHZkZC1jcHUgc3VwcGx5LAo+ID4gd2hpY2gg
c2VlbXMgdG8gYmUgdGhlIGRlZmF1bHQgb24gbW9zdCBEMSBib2FyZHMuCj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogQnJhbmRvbiBDaGVvIEZ1c2kgPGZ1c2licmFuZG9uMTNAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaSB8
IDE4ICsrKysrKysrKysrKysrKy0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290
L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxcy5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3
aW5uZXIvc3VuMjBpLWQxcy5kdHNpCj4gPiBpbmRleCA2NGMzYzJlNmMuLmUyMTFmZTRjNyAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRz
aQo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxcy5kdHNp
Cj4gPiBAQCAtMzksMTYgKzM5LDIyIEBAIGNwdTBfaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIg
ewo+ID4gwqAgwqAgwqAgfTsKPiA+Cj4gPiDCoCDCoCDCoCBvcHBfdGFibGVfY3B1OiBvcHAtdGFi
bGUtY3B1IHsKPiA+IC0gwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICJvcGVyYXRpbmct
cG9pbnRzLXYyIjsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJsZSA9ICJhbGx3aW5u
ZXIsc3VuMjBpLWQxLW9wZXJhdGluZy1wb2ludHMiLAo+Cj4gSSBkb24ndCB0aGluayB5b3Ugc2hv
dWxkIGFkZCBhIG5ldyBjb21wYXRpYmxlIGZvciBldmVyeSBTb0MgdGhhdCBuZWVkcwo+IHRvIGJl
IHN1cHBvcnRlZCBieSBhIERUIGJpbmRpbmdzIGFuZCBjcHVmcmVxIGRyaXZlci4gTWF5YmUgeW91
IHNob3VsZAo+IGp1c3QgcmV1c2UgImFsbHdpbm5lcixzdW41MGktaDYtb3BlcmF0aW5nLXBvaW50
cyIgYW5kIGl0IHdpbGwgd29yawo+IGZpbmUgZm9yIHlvdSA/Cj4KPiBSb2IgPwo+Cj4gPiArIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgImFsbHdpbm5lcixzdW41
MGktaDYtb3BlcmF0aW5nLXBvaW50cyI7Cj4gPiArIMKgIMKgIMKgIMKgIMKgIMKgIG52bWVtLWNl
bGxzID0gPCZjcHVfc3BlZWRfZ3JhZGU+Owo+ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCBudm1lbS1j
ZWxsLW5hbWVzID0gInNwZWVkIjsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgb3BwLXNoYXJlZDsK
PiA+Cj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcHAtNDA4MDAwMDAwIHsKPiA+ICsgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xvY2stbGF0ZW5jeS1ucyA9IDwyNDQxNDQ+OyAvKiA4
IDMyayBwZXJpb2RzICovCj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcHAt
aHogPSAvYml0cy8gNjQgPDQwODAwMDAwMD47Cj4gPiAtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIG9wcC1taWNyb3ZvbHQgPSA8OTAwMDAwIDkwMDAwMCAxMTAwMDAwPjsKPiA+ICsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3BwLW1pY3Jvdm9sdC1zcGVlZDAgPSA8OTAwMDAw
PjsKPgo+IFRoZSBzZXBhcmF0ZSBwcm9wZXJ0eSBuYW1lIHRoaW5nIHdhcyByZXF1aXJlZCB3aGVu
IHlvdSBjb3VsZCBoYXZlCj4gZGlmZmVyZW50IHZhbHVlcyBmb3IgZGlmZmVyZW50IFNvQyBpbnN0
YW5jZXMsIHdoaWNoIGNhbiBiZSByZWFkIGZyb20KPiBlZnVzZXMsIGxpa2UgaW4geW91ciBjYXNl
Lgo+Cj4gQnV0IGFsbCBJIHNlZSBpcyBzcGVlZDAgaGVyZSwgd2h5IGRvbid0IHlvdSBhbHdheXMg
c2V0IG9wcC1taWNyb3ZvbHQKPiB0aGVuID8KPgoKU2V0dGluZyBvcHAtbWljcm92b2x0IHdvdWxk
IGJlIG9rLCBidXQgb3BwLW1pY3Jvdm9sdC1zcGVlZDAgd2FzIGNob3NlbiBmb3IKY29uc2lzdGVu
Y3kgd2l0aCB0aGUgZHJpdmVyIGJpbmRpbmdzIGhlcmUKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvbGF0ZXN0L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
b3BwL2FsbHdpbm5lcixzdW41MGktaDYtb3BlcmF0aW5nLXBvaW50cy55YW1sI0w1MiAKCj4gQWxz
byB3aHkgZGVncmFkZSBmcm9tIG1pbi9tYXgvdGFyZ2V0IHR5cGUgdG8ganVzdCB0YXJnZXQgPwo+
CgpUaGlzIGlzIGEgbWlzdGFrZSBvbiBteSBwYXJ0IGFzIEkgdGhvdWdodCByZXF1ZXN0aW5nIG5v
biBkZWZhdWx0IHZvbHRhZ2VzCndhcyBnb2luZyB0byBiZSBhIHByb2JsZW0gd2l0aCBsYWNrIG9m
IFBXTSBzdXBwb3J0LiBXaWxsIGJlIHJldmVydGVkIGluIHYyLgoKPiA+IMKgIMKgIMKgIMKgIMKg
IMKgIMKgIH07Cj4gPgo+ID4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3BwLTEwODAwMDAwMDAgewo+
ID4gKyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjbG9jay1sYXRlbmN5LW5zID0gPDI0
NDE0ND47IC8qIDggMzJrIHBlcmlvZHMgKi8KPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIG9wcC1oeiA9IC9iaXRzLyA2NCA8MTAwODAwMDAwMD47Cj4gPiAtIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIG9wcC1taWNyb3ZvbHQgPSA8OTAwMDAwIDkwMDAwMCAxMTAwMDAw
PjsKPiA+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgb3BwLW1pY3Jvdm9sdC1zcGVl
ZDAgPSA8OTAwMDAwPjsKPiA+IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH07Cj4gPiDCoCDCoCDCoCB9
Owo+ID4KPiA+IEBAIC0xMTUsMyArMTIxLDggQEAgcG11IHsKPiA+IMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIDwweDAwMDAwMDAwIDB4MDAwMDAwMGYgMHhmZmZmZmZmZiAweGZmZmZm
ZmZmIDB4MDAwMjAwMDA+Owo+ID4gwqAgwqAgwqAgfTsKPiA+IMKgfTsKPiA+ICsKPiA+ICsmc2lk
IHsKPiA+ICsgwqAgwqAgY3B1X3NwZWVkX2dyYWRlOiBjcHUtc3BlZWQtZ3JhZGVAMCB7Cj4gPiAr
IMKgIMKgIMKgIMKgIMKgIMKgIHJlZyA9IDwweDAwIDB4Mj47Cj4gPiArIMKgIMKgIH07Cj4gPiAr
fTsKPiA+IC0tCj4gPiAyLjMwLjIKPgo+IC0tCj4gdmlyZXNoCgpUaGFuayB5b3UgZm9yIHJldmll
d2luZy4KQnJhbmRvbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
