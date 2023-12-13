Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33207C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/8SduVX/SBEIoqU6IwHTH4fM//F8f/93qnqjRCWKgew=; b=HY65Ox0gt3uXNZ8YuwKDzkUKon
	yDaR2Vngq05lT2dLvPFEXtlRIvp/pPT5Fz9yH9B3u8e2jVyJzfmgExl0c868C39W9+uLj0G+m+EU9
	90olobh6aOjujGxizSYXdStDb+xKav+tw+uj1mOuVO/k6sdFM8ngrmyPzI1mqOxrXiq04JDjrI3qG
	6cfB7hrTl+Oma1PrKOOdePE7v0JQd/gKt2VSbbyEG6WkRaHKZ19mC2UwhNRsIK14e3NJl2sEuj9Tz
	eHI4UtG9JCvFCnKp10TjW55P3Wxo7sn8dIZr0LRXu2+LkgXaAyqmfxnyGM9LTghCnZQBtF5PZGjIv
	T2ZSNwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNzV-00EXoL-1R;
	Wed, 13 Dec 2023 12:05:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNzS-00EXnm-24
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 12:05:28 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B440F3F28A
	for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702469119;
	bh=ed/4z9K37WF1+ypqnAItmB7J3yVCg6lzXveMVJNIB+I=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=smIesrYJpscZxloUefgTPLm9pjHmYAbyliUxqFWNWExa7S/6j5I28PBlgJJ8x7USl
	 3O4ncWgyzy3F22gInJTSF4tV8xphNY2F/CC8E6Gxa9yEAwDdowosPnVylryN8B3jTP
	 qdcvA8a/x9R93amX0mO3JnkMHXl5RI6iPn8LPfQrrNM9zlcaE6e88i81iOAkL9GIFp
	 J21Ui9f+PJZyEL+HJJ4Lp4P+GyK+WXGaq2O+Xe+FdUeDOnBajvEbnUrBLNjkMX6eN/
	 jZuuwKw2lhhotMenNnjph5wJkeJAyVstLE+DPhA/IQ3E/T5GmKggVOygQP0UxkSyp1
	 ROZxhDtUUnenA==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77f7c066354so377475885a.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 04:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702469119; x=1703073919;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ed/4z9K37WF1+ypqnAItmB7J3yVCg6lzXveMVJNIB+I=;
        b=LKsmMIZllnqvM2YUe6O9DbnyCwOu9J0JCvbX2HchHwcQzsiYpLXvSpCHTqYdFcgeJE
         2ypOwMhAHz80pb2BniDfmRlWYeFkQGIaHUoA6VxG4rPE/ZTgNHJCA/ju2U9wlnrN18VZ
         7IfDBXbtMvKs4NKkJwbZl7YhPqFRO3jC0c2m4fW4oPWS/MoFsfWJeWL28PK0HzWBq495
         YPyssXzCf39lLYoR6/aiTgkzr/gyk1t7uctHvrkU0BD8vhYk48bqShV/2HjXS9dzu2Ue
         SIWTG3xGKmNi/V+A1P9ivXFaOZeDG5G6HS7zZf/dTYHbeRdAs98txezxZMbv0jiAf/+A
         sliw==
X-Gm-Message-State: AOJu0YwSn6ems0I4yRUsyiU3Ld9xwCXKtc2VGdrfmW+HiouJW/qsnzOG
	FW+SsNkP5Wsi+TT95HeQzt9CqEsKE6/jsMl2JxbgiTf0hu91H6Xj9XZ5g0mKK95fFaAi2pF8KHZ
	mfwepwpEgAhv2TuX0ns3BbfMP+dgCT/ONprdvyW3u8/5TllgfodUYmxJgi5Rguw==
X-Received: by 2002:ac8:5cc8:0:b0:425:4043:763d with SMTP id s8-20020ac85cc8000000b004254043763dmr11389697qta.101.1702469118713;
        Wed, 13 Dec 2023 04:05:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9QHKlpfiHiwknItMSza3ZGQwZtx+b52QZTd9pTWAuKsITQLCClWyurTTqXFX6DTkIy2rCL/jyIwRxWdAltnE=
X-Received: by 2002:ac8:5cc8:0:b0:425:4043:763d with SMTP id
 s8-20020ac85cc8000000b004254043763dmr11389680qta.101.1702469118472; Wed, 13
 Dec 2023 04:05:18 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Dec 2023 04:05:18 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <a554a163793e4513b25766c21ddc3f02@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-7-jeeheng.sia@starfivetech.com> <CAJM55Z_VgBGvCPuvwmQahMcMfuWKnOKpZ9bBbbhei_Teu5Apeg@mail.gmail.com>
 <a554a163793e4513b25766c21ddc3f02@EXMBX066.cuchost.com>
Mime-Version: 1.0
Date: Wed, 13 Dec 2023 04:05:18 -0800
Message-ID: <CAJM55Z_3Mty2LftPVkQC1wbwtGeznMMAk9mAjH_GoNuL7CKtaQ@mail.gmail.com>
Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
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
X-CRM114-CacheID: sfid-20231213_040526_822481_6A619D58 
X-CRM114-Status: GOOD (  18.48  )
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

SmVlSGVuZyBTaWEgd3JvdGU6Cj4KPgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+
IEZyb206IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmlj
YWwuY29tPgo+ID4gU2VudDogU2F0dXJkYXksIERlY2VtYmVyIDksIDIwMjMgMTI6MjUgQU0KPiA+
IFRvOiBKZWVIZW5nIFNpYSA8amVlaGVuZy5zaWFAc3RhcmZpdmV0ZWNoLmNvbT47IGtlcm5lbEBl
c21pbC5kazsgY29ub3JAa2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOwo+ID4ga3J6eXN6
dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBwYXVsLndhbG1zbGV5QHNpZml2ZS5jb207IHBh
bG1lckBkYWJiZWx0LmNvbTsgYW91QGVlY3MuYmVya2VsZXkuZWR1Owo+ID4gbXR1cnF1ZXR0ZUBi
YXlsaWJyZS5jb207IHNib3lkQGtlcm5lbC5vcmc7IHAuemFiZWxAcGVuZ3V0cm9uaXguZGU7IGVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb207IEhhbCBGZW5nCj4gPiA8aGFsLmZlbmdA
c3RhcmZpdmV0ZWNoLmNvbT47IFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0YXJmaXZldGVjaC5jb20+
Cj4gPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWNsa0B2Z2Vy
Lmtlcm5lbC5vcmc7IExleWZvb24gVGFuCj4gPiA8bGV5Zm9vbi50YW5Ac3RhcmZpdmV0ZWNoLmNv
bT4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMDYvMTZdIGNsazogc3RhcmZpdmU6IEFkZCBK
SDgxMDAgU3lzdGVtIGNsb2NrIGdlbmVyYXRvciBkcml2ZXIKPiA+Cj4gPiBTaWEgSmVlIEhlbmcg
d3JvdGU6Cj4gPiA+IEFkZCBzdXBwb3J0IGZvciBKSDgxMDAgU3lzdGVtIGNsb2NrIGdlbmVyYXRv
ci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2lhIEplZSBIZW5nIDxqZWVoZW5nLnNpYUBz
dGFyZml2ZXRlY2guY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogTGV5IEZvb24gVGFuIDxsZXlmb29u
LnRhbkBzdGFyZml2ZXRlY2guY29tPgo+ID4gPiAtLS0KPiA+ID4gIE1BSU5UQUlORVJTICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArCj4gPiA+ICBkcml2ZXJzL2Nsay9z
dGFyZml2ZS9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDkgKwo+ID4gPiAgZHJpdmVycy9j
bGsvc3RhcmZpdmUvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gIGRyaXZl
cnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1jb21tb24uaCAgICB8ICAgOSArLQo+ID4gPiAg
ZHJpdmVycy9jbGsvc3RhcmZpdmUvamg4MTAwL01ha2VmaWxlICAgICAgICAgIHwgICAzICsKPiA+
ID4gIC4uLi9jbGsvc3RhcmZpdmUvamg4MTAwL2Nsay1zdGFyZml2ZS1qaDgxMDAuaCB8ICAxMSAr
Cj4gPiA+ICBkcml2ZXJzL2Nsay9zdGFyZml2ZS9qaDgxMDAvY2xrLXN5cy5jICAgICAgICAgfCA0
NTUgKysrKysrKysrKysrKysrKysrCj4gPiA+ICA3IGZpbGVzIGNoYW5nZWQsIDQ5NSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9j
bGsvc3RhcmZpdmUvamg4MTAwL01ha2VmaWxlCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9jbGsvc3RhcmZpdmUvamg4MTAwL2Nsay1zdGFyZml2ZS1qaDgxMDAuaAo+ID4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3N0YXJmaXZlL2poODEwMC9jbGstc3lzLmMKPiA+
ID4KWy4uLl0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3N0YXJmaXZlL2poODEwMC9N
YWtlZmlsZSBiL2RyaXZlcnMvY2xrL3N0YXJmaXZlL2poODEwMC9NYWtlZmlsZQo+ID4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmFmNmEwOWUyMjBkMwo+
ID4gPiAtLS0gL2Rldi9udWxsCj4gPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3N0YXJmaXZlL2poODEw
MC9NYWtlZmlsZQo+ID4gPiBAQCAtMCwwICsxLDMgQEAKPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IEdQTC0yLjAKPiA+ID4gKyMgU3RhckZpdmUgSkg4MTAwIENsb2NrCj4gPiA+ICtv
YmotJChDT05GSUdfQ0xLX1NUQVJGSVZFX0pIODEwMF9TWVMpCQkrPSBjbGstc3lzLm8KPiA+Cj4g
PiBUaGlzIHdpbGwgbmFtZSB0aGUgbW9kdWxlIGNsay1zeXMsIHdoaWNoIGlzIHdheSB0b28gZ2Vu
ZXJpYy4gUGxlYXNlIG5hbWUgdGhpcwo+ID4gY2xrLXN0YXJmaXZlLWpoODEwMC1zeXMgc2ltaWxh
ciB0byB0aGUgSkg3MTEwIGRyaXZlcnMuCj4gSnVzdCByZWFsaXplZCB0aGF0IEkgaGF2ZW4ndCBy
ZXBseSB0byB0aGlzIGNvbW1lbnQuCj4gSSBjYW4ndCBnaXZlIGl0IGEgbG9uZ2VyIG5hbWUgb3Ro
ZXJ3aXNlIGNvbXBpbGVyIHdpbGwgdGhyb3cgd2FybmluZy4KPiBUaGF04oCZcyB3aHkgZW5kcyB1
cCB0byB1c2UgYSBzaG9ydGVyIG5hbWUgYW5kIGtlZXAgaXQgdW5kZXIgamg4MTAwIGZvbGRlci4K
CkknbSBzb3JyeSwgaG93IGRvZXMgdGhhdCBtYWtlIGFueSBzZW5zZT8gSWYgdGhlIGNvbXBpbGVy
IGNhbiBjb21waWxlCgogIGRyaXZlcnMvY2xrL3N0YXJmaXZlL2Nsay1zdGFyZml2ZS1qaDcxMTAt
c3lzLmMKCmp1c3QgZmluZSwgdGhlbiB3aHkgd291bGQgaXQgaGF2ZSB0cm91YmxlIHdpdGgKCiAg
ZHJpdmVycy9jbGsvc3RhcmZpdmUvY2xrLXN0YXJmaXZlLWpoODEwMC1zeXMuYwoKL0VtaWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
