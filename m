Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E19C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tcv6Aem8ZZoI43jqM+ldSMO7o3sf7UgaFktgoIeP/kw=; b=ym+uWFs1R0PgUSWBE+eUnypue9
	ekYE6lCtUWOgIT3lbq9iogSfmLrtnyGVasvrZ+YBi8UjCmjVWyVlrROGd3+y4zSq0jGBOqmlvBIvq
	cpNc/6TW5ucoNB/qB2mF3FW77yIw0/zr7XjT6gaCedu0recJ7JzzSQz5kdWqKUesfO7u6tct1RMnZ
	j9n4MYXVUPtBOe9RaDBcmuh0ynXBVuHQqVYE8H6TYh+omgwwfN1zHnIUGGcNEM7XBbmejgrUMbahY
	RW0r9WU9e+tJ++DcZA/fXMtW/Z+U1OkfxfkkcxstCKz4EKRVO9XR3UTPo964ZBq0otD2NAsgCAYNA
	A8Rdn9gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNul-00EXTo-0I;
	Wed, 13 Dec 2023 12:00:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNuh-00EXTB-2a
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 12:00:33 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 907F73F185
	for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702468830;
	bh=d2k9g+CDQlS0u/Axm3QhPzDXMJCmIzyDAkyUWJItYfY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PEysiXbrq77iErl9Dy9xuktY9UE28lQ8J7sAyn8ziwf6BhVlpWHFHL0J2+bJMgjkT
	 cvk+7dBm6jDSJLzQYrmkNVV2a75kbTn2ycDZECJmYqMSUzR0DI3rXNsOkZTEq9/EKW
	 e477U8PijvoUOROR+evBYViExVZ/IZHGtbqAjAjWn3jKY/0504aIzwOPFuWLCjTr2+
	 JjA3FuAFC6uWpkp+Dp9njtWDixEbQB7JUSlhLT0Fv27P90kZsRqw6VjQ6Xuh/T7Gsa
	 /1TDcWlq/vE76sxQGtymrRelxlE/QPvpCi2Qcm+mATGi2E315cpf3zZbYX5Gpyr+jw
	 in2SUmvXX+awg==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-77dcbd6edb0so926904185a.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 04:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702468829; x=1703073629;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d2k9g+CDQlS0u/Axm3QhPzDXMJCmIzyDAkyUWJItYfY=;
        b=J8RKqYW9g4XvuZh8w/+Xe22bP3E3a3G7Frp0ogjKk2vywMS2qNS5Ca7Yhmyeos82W5
         +z/kdiVa7+XtcLPSQeksGksfcrDacrTHrGqHWF9Orz9/4BPebc5srtxaM5+YzR8C8wCn
         TNS1lc/ZQsEiSh1aoEL6EglC4TGtlZznMZPHqwwoKL/O/wpchgxFwmpITP8+bb+Nwvq4
         RiUqKW+uwGW0zefE0/jOPno4Gg4veMfLrFuTqKqqhkS7QsB84TJ9lpLoN/Quhh2qoWxA
         LESx6cjEop+Tao7iQ7AOMEvatdwZmxhkdgk7cH8lyR6ijlWIHN+YdHJmw+T3CPd8ht7P
         xEjg==
X-Gm-Message-State: AOJu0YzxL9hnB8jVqzQCXl7Fkv8tyD+5m+gUyH/mUay7746sqeRIX7QO
	GMUDVgbv2tnilDXJxQaIkDk2VOeSVBGWb/mQhSftgTQEVCrvf7d78mP4EUmql6xgWGDgmlUMHAS
	kv7B6k+b3hBK1glUHoauejevSZvOgZpSfGzC5tWAgGiLBu5aKmtmtClsHIn4o7w==
X-Received: by 2002:a05:620a:1d97:b0:77d:88cc:e759 with SMTP id pj23-20020a05620a1d9700b0077d88cce759mr9425943qkn.44.1702468829685;
        Wed, 13 Dec 2023 04:00:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQyE19HlHZoU/6ZbCTx8+T9R2+zaT+Qju6cnML0AE3RTJpk0HMKR1T19a5ApinlnNf+jiWW68wxrNoj0JLy3s=
X-Received: by 2002:a05:620a:1d97:b0:77d:88cc:e759 with SMTP id
 pj23-20020a05620a1d9700b0077d88cce759mr9425929qkn.44.1702468829479; Wed, 13
 Dec 2023 04:00:29 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Dec 2023 04:00:29 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <56031a2fadf442e297b1e0ea03777e5f@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-8-jeeheng.sia@starfivetech.com> <CAJM55Z-FXV-Go4yj_AJyU4pRC0msHqTCT3q24HkNtBTWW9rAgA@mail.gmail.com>
 <56031a2fadf442e297b1e0ea03777e5f@EXMBX066.cuchost.com>
Mime-Version: 1.0
Date: Wed, 13 Dec 2023 04:00:29 -0800
Message-ID: <CAJM55Z8ndFEg1gqk5=HydjN93iKY-f0k=FDpcL-hYH+_GA4Taw@mail.gmail.com>
Subject: RE: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100
 System-North-West clock and reset generator
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, "kernel@esmil.dk" <kernel@esmil.dk>, 
	"conor@kernel.org" <conor@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_040031_982168_602693ED 
X-CRM114-Status: GOOD (  15.85  )
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

SmVlSGVuZyBTaWEgd3JvdGU6Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJv
bTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5j
b20+Cj4gPiBTZW50OiBTYXR1cmRheSwgRGVjZW1iZXIgOSwgMjAyMyAxMjozNyBBTQo+ID4gVG86
IEplZUhlbmcgU2lhIDxqZWVoZW5nLnNpYUBzdGFyZml2ZXRlY2guY29tPjsga2VybmVsQGVzbWls
LmRrOyBjb25vckBrZXJuZWwub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7Cj4gPiBrcnp5c3p0b2Yu
a296bG93c2tpK2R0QGxpbmFyby5vcmc7IHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbTsgcGFsbWVy
QGRhYmJlbHQuY29tOyBhb3VAZWVjcy5iZXJrZWxleS5lZHU7Cj4gPiBtdHVycXVldHRlQGJheWxp
YnJlLmNvbTsgc2JveWRAa2VybmVsLm9yZzsgcC56YWJlbEBwZW5ndXRyb25peC5kZTsgZW1pbC5y
ZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbTsgSGFsIEZlbmcKPiA+IDxoYWwuZmVuZ0BzdGFy
Zml2ZXRlY2guY29tPjsgWGluZ3l1IFd1IDx4aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4KPiA+
IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtY2xrQHZnZXIua2Vy
bmVsLm9yZzsgTGV5Zm9vbiBUYW4KPiA+IDxsZXlmb29uLnRhbkBzdGFyZml2ZXRlY2guY29tPgo+
ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAwNy8xNl0gZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQg
U3RhckZpdmUgSkg4MTAwIFN5c3RlbS1Ob3J0aC1XZXN0IGNsb2NrIGFuZCByZXNldCBnZW5lcmF0
b3IKPiA+Cj4gPiBTaWEgSmVlIEhlbmcgd3JvdGU6Cj4gPiA+IEFkZCBiaW5kaW5ncyBmb3IgdGhl
IFN5c3RlbS1Ob3J0aC1XZXN0IGNsb2NrIGFuZCByZXNldCBnZW5lcmF0b3IKPiA+ID4gKFNZU0NS
Ry1OVykgb24gSkg4MTAwIFNvQy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2lhIEplZSBI
ZW5nIDxqZWVoZW5nLnNpYUBzdGFyZml2ZXRlY2guY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogTGV5
IEZvb24gVGFuIDxsZXlmb29uLnRhbkBzdGFyZml2ZXRlY2guY29tPgo+ID4gPiAtLS0KPiA+ID4g
IC4uLi9jbG9jay9zdGFyZml2ZSxqaDgxMDAtc3lzY3JnLW53LnlhbWwgICAgICB8IDExOSArKysr
KysrKysrKysrKysrKysKPiA+Cj4gPiBUaGUgSkg3MTEwIGNsb2NrcywgdGhlIEpIODEwMCBzeXN0
ZW0gYW5kIGFsd2F5cy1vbiBhbGwgZm9sbG93IHRoZSBYY3JnIHBhdHRlcm46Cj4gPiBzeXNjcmcK
PiA+IGFvbmNyZwo+ID4gc3RnY3JnCj4gPiBpc3BjcmcKPiA+IHZvdXRjcmcKPiA+IGV0Yy4KPiA+
Cj4gPiBJcyB0aGVyZSBhIHJlYXNvbiB0aGUgbm9ydGgtd2VzdCwgbm9ydGgtZWFzdCBhbmQgc291
dGgtd2VzdCBicmVha3MgdGhpcyBwYXR0ZXJuPwo+ID4gSSdkIGhhdmUgZXhwZWN0ZWQgdGhlbSB0
byBiZSBjYWxsZWQgc29tZXRoaW5nIGxpa2UKPiA+IG53Y3JnLCBKSDgxMDBfTldDTEtfKiwgSkg4
MTAwX05XUlNUXyosCj4gPiBuZWNyZywgSkg4MTAwX05FQ0xLXyosIEpIODEwMF9ORVJTVF8qIGFu
ZAo+ID4gc3djcmcsIEpIODEwMF9TV0NMS18qLCBKSDgxMDBfU1dSU1RfKgo+ID4KPiA+IEp1c3Qg
bGlrZSBhbGwgdGhlIG90aGVyIFN0YXJmaXZlIGRyaXZlcnMuCj4gVW5kZXJzdG9vZCB5b3VyIGNv
bmNlcm4uIFdlIGRvbuKAmXQgaGF2ZSB0aGUgaW50ZW50aW9uIHRvIGJyZWFrIHRoZSBwYXR0ZXJu
LAo+IGJ1dCB0aGUgcmVhc29uIHdlIHNraXAgdGhlIFNvQ18gcHJlZml4IGlzIHRoYXQgdGhlIFNv
QyBuYW1lcyB3ZXJlIGFscmVhZHkKPiBkZWZpbmVkIGluIHRoZSBoZWFkZXIgZmlsZSB3aXRoIHRo
ZSBTb0MgbmFtZS4KPiBIb3dldmVyLCBJIGNhbiBwdXQgaXQgYmFjaywgb2YgY291cnNlLgoKWWVz
LCBhbGwgdGhlc2UgMyBKSFhYMDAgZHJpdmVycyBhcmUgYWxtb3N0IGlkZW50aWNhbC4gVGhlcmUg
c2hvdWxkIGJlIG5vIHJlYXNvbgp0byBuYW1lIGFueSBvbmUgb2YgdGhlbSBkaWZmZXJlbnRseS4g
SGF2aW5nIHRoZW0gYWxsIGJlIGFzIHNpbWlsYXIgYXMgcG9zc2libGUKd2lsbCBtYWtlIGl0IGEg
bG90IGVhc2llciB0byBtYWludGFpbiBpbiB0aGUgZnV0dXJlLiBJZiB5b3UgZG9uJ3QgbGlrZSBh
CnBhdHRlcm4gdGhlbiBwbGVhc2UgY2hhbmdlIGl0IGZvciBhbGwgdGhlIHNpbWlsYXIgZHJpdmVy
cyBhbmQgZG9uJ3QgbWFrZSBqdXN0Cm9uZSBvZiB0aGVtIGJlIGRpZmZlcmVudC4KCi9FbWlsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
