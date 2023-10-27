Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EBFC25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 22:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=62qd7vR1oPbbYfhqxqIOEPTVo3BNZ2Sw4H2FF58pMo0=; b=MiCp5CCUAjot1DA4jV8yW/4oxF
	2lOcHLwIkY0Mxkc/qZVEiRdglqj7Ea+meBXoa9PKnzJKjsHLjUYzhXcVJkIyege8NOa35a16DAcU4
	It0/iMbnG/Wb1HemGRJIdkmnBAmZPR5GEfzUgSSgFrWmsiNxr+/ysyJeoTnDPGakNaDkzXDzPOVeK
	iqXSTVXBF2bjc2fkVUmESVavLE4025r/fupdYFsxgbAmF9YTK4SqvHsyaEqhfJmUWaZi32JpNN4Kq
	c1yKI5R2DFQtcermW6HPuYmx0Ub3wKi79CiSwrPnk18QsTgHYUd6XtpUo1G5Hu5vzghfYnLVEj1NW
	0+q0u55w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwV38-00HHDl-09;
	Fri, 27 Oct 2023 22:11:26 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwV35-00HHD0-0s
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 22:11:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1ca82f015e4so22364465ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1698444681; x=1699049481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BeMmTUq4g79fi5qvKPQNKqlrDCYL6ILFRVsuXdyovg=;
        b=aBg6nB5e2c8gT2dDFSazIB8FTYGa17T8ufSo1MF8ZlBe+Ob1UeV9E74jabXpkd8wlQ
         XnvhCkjymFBCC7wKgIQu5Jg0HvLjm9yrQIv9vDsnbd4GG+Nd6yTtfqE3YqWE+hOplSWz
         3SgfYzZCw0TXxlShRZRN09keINTJ8T+NV0XBh2d0k/TOrqKupyFqrpBiwtWXBq8RLvL9
         d2OA5HjNZpK9UMqtvyQOYuYUTds46VDUZL/baapjXMSozD6UEMkTbvERdgA76qioPAB7
         ypHE0GjdDfif9db+7+DqKIxTllPSHEIjZV1LNDpYmNCnMveNsddpAzg9Rdqr4kEdc/I3
         DIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698444681; x=1699049481;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BeMmTUq4g79fi5qvKPQNKqlrDCYL6ILFRVsuXdyovg=;
        b=oItRrc9pU1cXRoVxFgtP3ptszCdg21yjzJfsKg6S3jl8+CsCQg2cUY9euookXKa7aW
         Rhy4P8g4Y0Iam/40qqitYYO3vMNMWHCWufpRWKQaKhPSGWytyldDCOuownGWojxg9JGq
         gZ4tOF5UkycP3j7bjkLYTKwaBM6kyrm4h8McyIOKaI1zpXzjEZg3p5YOQL6ceaU+GGWn
         /89MjAoVkPNjY/zfoNSnyzH5WDiW3UO8YUTtgaJuLkfi9f26Kmko7KI3butmM65nU5r7
         p6Kw/JnF1W5KClfHQhf/YctYfaK8UiUbm+2nNIMw9+dllFMtbOzDB0GXsSMs/zefpJMU
         /EMQ==
X-Gm-Message-State: AOJu0Yw/qVTNdPDkbz+6vwnNIRsL/Znd/cD9AZ4TY0a69HQAyRntd1zY
	2B1hcS1a2vFLP5cj4HS2CvHfJA==
X-Google-Smtp-Source: AGHT+IE1Wiqht/oK+k4UaYWOU/6pE6Hl+IiCQQO9vWsJnMAPyBXGS9dG+jErM5PM3/N2wY/7M/7IWg==
X-Received: by 2002:a17:90b:1904:b0:280:16bb:8169 with SMTP id mp4-20020a17090b190400b0028016bb8169mr1783191pjb.40.1698444681014;
        Fri, 27 Oct 2023 15:11:21 -0700 (PDT)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id j14-20020a17090a2a8e00b002800b26dbc1sm1901952pjd.32.2023.10.27.15.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 15:11:20 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:11:20 -0700 (PDT)
X-Google-Original-Date: Fri, 27 Oct 2023 15:11:17 PDT (-0700)
Subject: Re: [PATCH 5/5] riscv: configs: defconfig: Enable configs required for RZ/Five SoC
In-Reply-To: <CAMuHMdVdWzK_MRz+NeZ_mx=NcH9_EF-B0At=YsOfOABLV3B9tg@mail.gmail.com>
CC: prabhakar.csengg@gmail.com, magnus.damm@gmail.com, conor+dt@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-ac92041d-85e9-4725-b61c-bc0fef5549ec@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_151123_503199_B6635E7C 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwMyBPY3QgMjAyMyAwNTozNDoxMyBQRFQgKC0wNzAwKSwgZ2VlcnRAbGludXgtbTY4
ay5vcmcgd3JvdGU6Cj4gSGkgUHJhYmhha2FyLAo+Cj4gT24gRnJpLCBTZXAgMjksIDIwMjMgYXQg
MjowN+KAr0FNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+
PiBGcm9tOiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNh
cy5jb20+Cj4+Cj4+IEVuYWJsZSB0aGUgY29uZmlncyByZXF1aXJlZCBieSB0aGUgYmVsb3cgSVAg
YmxvY2tzIHdoaWNoIGFyZQo+PiBwcmVzZW50IG9uIFJaL0ZpdmUgU29DOgo+PiAqIEFEQwo+PiAq
IENBTkZECj4+ICogRE1BQwo+PiAqIGVNTUMvU0RISQo+PiAqIE9TVE0KPj4gKiBSQVZCICgrIE1p
Y3JlbCBQSFkpCj4+ICogUklJQwo+PiAqIFJTUEkKPj4gKiBTU0kgKFNvdW5kK1dNODk3OCBjb2Rl
YykKPj4gKiBUaGVybWFsCj4+ICogVVNCIChQSFkvUkVTRVQvT1RHKQo+Pgo+PiBBbG9uZyB3aXRo
IHRoZSBhYm92ZSBzb21lIGNvcmUgY29uZmlncyBhcmUgZW5hYmxlZCB0b28sCj4+IC0+IENQVSBm
cmVxdWVuY3kgc2NhbGluZyBhcyBSWi9GaXZlIGRvZXMgc3VwcG9ydCB0aGlzLgo+PiAtPiBNVEQg
aXMgZW5hYmxlZCBhcyBSU1BJIGNhbiBiZSBjb25uZWN0ZWQgdG8gZmxhc2ggY2hpcHMKPj4gLT4g
RW5hYmxlZCBJMkMgY2hhcmRldiBzbyB0aGF0IGl0IGVuYWJsZXMgdXNlcnNwYWNlIHRvIHJlYWQv
d3JpdGUKPj4gICAgaTJjIGRldmljZXMgKHNpbWlsYXIgdG8gYXJtNjQpCj4+IC0+IFRoZXJtYWwg
Y29uZmlncyBhcyBSWi9GaXZlIFNvQyBkb2VzIGhhdmUgdGhlcm1hbCB1bml0Cj4+IC0+IEdQSU8g
cmVndWxhdG9yIGFzIHdlIG1pZ2h0IGhhdmUgSVAgYmxvY2tzIGZvciB3aGljaCB2b2x0YWdlCj4+
ICAgIGxldmVscyBhcmUgY29udHJvbGxlZCBieSBHUElPcwo+PiAtPiBPVEcgY29uZmlncyBhcyBS
Wi9GaXZlIFVTQiBjYW4gc3VwcG9ydCBob3N0L2Z1bmN0aW9uCj4+IC0+IEdhZGdldCBjb25maWdz
IHNvIHRoYXQgd2UgY2FuIHRlc3QgVVNCIGZ1bmN0aW9uIChhcyBkb25lIGluIGFybTY0Cj4+ICAg
IGFsbCB0aGUgZ2FkZ2V0IGNvbmZpZ3MgYXJlIGVuYWJsZWQpCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
Pgo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVy
LmJlPgo+Cj4gQXMgSSBleHBlY3QgdGhpcyB0byBnbyBpbiB0aHJvdWdoIHRoZSBSSVNDLVYgdHJl
ZSwgSSB3aWxsIGxldCB0aGUKPiBSSVNDLVYgcGVvcGxlIGhhbmRsZSBhbnkgZGlzY3Vzc2lvbiBh
Ym91dCBtb3JlIG9wdGlvbnMgdGhhdCBzaG91bGQgYmUKPiBtYWRlIG1vZHVsYXIgaW5zdGVhZCBv
ZiBidWlsdGluLgoKSSdtIHByZXR0eSBtdWNoIGFnbm9zdGljIG9uIHRoYXQgZnJvbnQsIHNvIEkn
bSBjb29sIGp1c3QgcGlja2luZyB1cCAKdGhpcy4gIEkndmUgZ290IGp1c3QgcGF0Y2ggNSBpbiBt
eSBxdWV1ZSBmb3IgdGVzdGluZywgdGhlcmUncyBhIGZldyAKb3RoZXIgdGhpbmdzIGluIGZyb250
IG9mIGl0IGJ1dCBpdCBzaG91bGQgc2hvdyB1cCBvbiBmb3ItbmV4dCBzb29uLgoKPgo+IEdye29l
dGplLGVldGluZ31zLAo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
