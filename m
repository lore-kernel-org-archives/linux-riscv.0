Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12644C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 11:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5113601FC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 11:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5113601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLkuZw6IawmzhmA7y07vlfDzMMR2AHZBwA676/8QG/8=; b=TmTT4E4UVB6eRF
	4eFoU0Qy+z8M4Kv75ENlsVt98c3Npiyv0pE6G40ij8ZHXbhP5Srgyq8YgfpSaNs7cHcDwBN4PJZFN
	rZtBWtIxplIB7tMbAm9zX6X/1Xos96IC2FT9+LN3BMulUFZdujou1lzAMOw4egLL0E7aYLZbFAEPJ
	/rFlRmTak28sTGTIQfU5SSrUsasCZ4s9LVtn7c1TJxIerY4+Oa0RVAFgZkYZ0IuZlQLBz49+vx4B3
	1zK99kr+4ai60MkAoMpjKxZtJE+X+X/aRAM+AV40j5Op3NQ8d04QY7C+ciu80H1I4D9bHdwKNGkW7
	p/hlPQ1y/vIvNJmPtTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1macBL-00GE0H-Ao; Wed, 13 Oct 2021 11:12:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maaQh-00FkMz-Rn
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 09:20:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id r10so5925725wra.12
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 02:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+lUdmvM630HC9Rc0ejWwyoYWLa7F0b+RBSdS/FDtwnA=;
 b=jig85W7cYgKDE+smX7nYNQXEs3qABJA6zH/0hbObl7vu+CWeDkZBq41AszpsMC/woD
 8z1mA1Hcy/K5ehSvffBsNDjKBIDCADmNvDmFv3G+/2KbjjG5GZQ9xR8yrPHYEWYvWy4k
 OnTWLlxDlRhtDvwgyCzBNPu4F6AJ9J491lfjO0R88PK26w4mCvH/NXiXw+1wSGucDaMd
 GOWMe5l88a3PAS7oN8N19t+usI9dWPRLtOgGdAlFJc0RK3T9fN8mPNF+redW7XRG2ObZ
 8hN/lB1gsob3dBR7zFQZZVQ6/CtLz0Z4m3l3NWP+7X+dBukal8sqGA9+WRBcrhO8zizh
 Bjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+lUdmvM630HC9Rc0ejWwyoYWLa7F0b+RBSdS/FDtwnA=;
 b=FGgLAFGjgGeiCNuSds2AZVvcs6J/aHjPQ2w7u6Otpvd1oEXnr3AfoTl+u1t2/5hT7u
 moguRFpSLuklkL8u03taMEh5u2dSWIYqwIuRRK+PKRvGGkOCBha9NcLioTNVAtTZf8Sw
 nKpzGR5V7s5h6Zt53FeWpCJhfukibGFDCH1gNxU8NlnT3POzNJsGJ1UqO4eunSUIYHFc
 wg5imZeDNsa3UXqL9zWcNFJH8/+S0pAsZ0BfuMflhJtZ7QvyzCLRz5KRGEsHjKHfrkFP
 caQTjhXkeFBNf/BT83zzqd8K4SasH8Po0m9uNpstZUcdUE0on6W1bDTl6T3BAKdpL4cl
 pvDQ==
X-Gm-Message-State: AOAM5337GIhoRqhK1dRvccoxTTrbngF6g0X51RrgetJ8YrdtGbObKZ8J
 fDmOtNb9fwDaFAZDQDPss/vqKNUh+1joz12LvK5bqA==
X-Google-Smtp-Source: ABdhPJxcNbhOtXc4vc3bnKsG1B/rm5+IOBi8MrlVcwvpsck/N4s2oStH/YRZtt5Q9hiN4g+mvfd9cYNMusiL6Jrn+Yc=
X-Received: by 2002:a05:600c:4111:: with SMTP id
 j17mr11477749wmi.59.1634116804936; 
 Wed, 13 Oct 2021 02:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211013012149.2834212-1-guoren@kernel.org>
 <4039032.XOxOlHldtI@diego>
 <CAAhSdy3j2Co2ckxn4vDtOxL=Ym3hgb66vkmnTbUjec+x7bRRDA@mail.gmail.com>
 <4245323.jvX0RauA9x@diego>
In-Reply-To: <4245323.jvX0RauA9x@diego>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Oct 2021 14:49:53 +0530
Message-ID: <CAAhSdy29WAXfBz6Ag-kAjNo_uhJO+AuC0e-UyWhwhaCmrw7pjw@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: update riscv plic compatible string
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Guo Ren <guoren@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_022007_955554_1E64D394 
X-CRM114-Status: GOOD (  28.27  )
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

T24gV2VkLCBPY3QgMTMsIDIwMjEgYXQgMjo0NCBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1pdHR3b2NoLCAxMy4gT2t0b2JlciAyMDIxLCAxMToxMToy
NiBDRVNUIHNjaHJpZWIgQW51cCBQYXRlbDoKPiA+IE9uIFdlZCwgT2N0IDEzLCAyMDIxIGF0IDI6
MjcgUE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IEhpIEFudXAsCj4gPiA+Cj4gPiA+IEFtIE1pdHR3b2NoLCAxMy4gT2t0b2JlciAyMDIxLCAwNzox
MTo0NiBDRVNUIHNjaHJpZWIgQW51cCBQYXRlbDoKPiA+ID4gPiBPbiBXZWQsIE9jdCAxMywgMjAy
MSBhdCA2OjUyIEFNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+ID4KPiA+
ID4gPiA+IEFkZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgInRoZWFkLGM5MDAtcGxpYyIgdG8gdGhl
IHJpc2N2IHBsaWMKPiA+ID4gPiA+IGJpbmRpbmdzIHRvIHN1cHBvcnQgU09DcyB3aXRoIHRoZWFk
LGM5eHggcHJvY2Vzc29yIGNvcmVzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gPiA+IENjOiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPiA+ID4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxt
ZXJkYWJiZWx0QGdvb2dsZS5jb20+Cj4gPiA+ID4gPiBDYzogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KPiA+ID4gPiA+IENjOiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNv
bT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDaGFuZ2VzIHNp
bmNlIFYzOgo+ID4gPiA+ID4gIC0gUmVuYW1lICJjOXh4IiB0byAiYzkwMCIKPiA+ID4gPiA+ICAt
IEFkZCB0aGVhZCxjOTAwLXBsaWMgaW4gdGhlIGRlc2NyaXB0aW9uIHNlY3Rpb24KPiA+ID4gPiA+
IC0tLQo+ID4gPiA+ID4gIC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUs
cGxpYy0xLjAuMC55YW1sICAgIHwgNiArKysrKysKPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxp
Yy0xLjAuMC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiA+ID4gPiA+IGluZGV4IDA4ZDVh
NTdjZTAwZi4uODI2Mjk4MzJlNWE1IDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEu
MC4wLnlhbWwKPiA+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1sCj4gPiA+ID4gPiBA
QCAtMzUsNiArMzUsMTEgQEAgZGVzY3JpcHRpb246Cj4gPiA+ID4gPiAgICBjb250YWlucyBhIHNw
ZWNpZmljIG1lbW9yeSBsYXlvdXQsIHdoaWNoIGlzIGRvY3VtZW50ZWQgaW4gY2hhcHRlciA4IG9m
IHRoZQo+ID4gPiA+ID4gICAgU2lGaXZlIFU1IENvcmVwbGV4IFNlcmllcyBNYW51YWwgPGh0dHBz
Oi8vc3RhdGljLmRldi5zaWZpdmUuY29tL1U1NC1NQy1SVkNvcmVJUC5wZGY+Lgo+ID4gPiA+ID4K
PiA+ID4gPiA+ICsgIFdoaWxlIHRoZSAidGhlYWQsYzkwMC1wbGljIiB3b3VsZCBtYXNrIElSUSB3
aXRoIHJlYWRsKGNsYWltKSwgc28gaXQgbmVlZG4ndAo+ID4gPiA+ID4gKyAgbWFzay91bm1hc2sg
d2hpY2ggbmVlZGVkIGluIFJJU0MtViBQTElDLiBXaGVuIGluIElSUVNfT05FU0hPVCAmIElSUUNI
SVBfRU9JX1RIUkVBREVECj4gPiA+ID4gPiArICBwYXRoLCB1bm5lY2Vzc2FyeSBtYXNrIG9wZXJh
dGlvbiB3b3VsZCBjYXVzZSBhIGJsb2NraW5nIGlycSBidWcgaW4gdGhlYWQsYzkwMC1wbGljLgo+
ID4gPiA+ID4gKyAgQmVjYXVzZSB3aGVuIElSUSBpcyBkaXNhYmxlZCBpbiBjOTAwLCB3cml0ZWwo
aHdpcnEsIGNsYWltKSB3b3VsZCBiZSBpbnZhbGlkLgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBpcyBh
IHRvdGFsbHkgaW5jb3JyZWN0IGRlc2NyaXB0aW9uIG9mIHRoZSBlcnJhdGEgcmVxdWlyZWQgZm9y
IEM5eHggUExJQy4KPiA+ID4gPgo+ID4gPiA+IFBsZWFzZSBkb24ndCBwcm9qZWN0IG5vbi1jb21w
bGlhbmNlIGFzIGEgZmVhdHVyZSBvZiBDOXh4IFBMSUMuCj4gPiA+ID4KPiA+ID4gPiA+ICsKPiA+
ID4gPiA+ICBtYWludGFpbmVyczoKPiA+ID4gPiA+ICAgIC0gU2FnYXIgS2FkYW0gPHNhZ2FyLmth
ZGFtQHNpZml2ZS5jb20+Cj4gPiA+ID4gPiAgICAtIFBhdWwgV2FsbXNsZXkgIDxwYXVsLndhbG1z
bGV5QHNpZml2ZS5jb20+Cj4gPiA+ID4gPiBAQCAtNDYsNiArNTEsNyBAQCBwcm9wZXJ0aWVzOgo+
ID4gPiA+ID4gICAgICAgIC0gZW51bToKPiA+ID4gPiA+ICAgICAgICAgICAgLSBzaWZpdmUsZnU1
NDAtYzAwMC1wbGljCj4gPiA+ID4gPiAgICAgICAgICAgIC0gY2FuYWFuLGsyMTAtcGxpYwo+ID4g
PiA+ID4gKyAgICAgICAgICAtIHRoZWFkLGM5MDAtcGxpYwo+ID4gPgo+ID4gPiB3ZSBzdGlsbCB3
YW50IHNwZWNpZmljIFNvQyBuYW1lcyBpbiB0aGUgY29tcGF0aWJsZSwgdGhlICJjOTAwIgo+ID4g
PiBpcyBzdGlsbCBhIHNvcnQtb2YgcGxhY2Vob2xkZXIuCj4gPgo+ID4gWWVzLCB3ZSBuZWVkICJj
OTAwIiBjb21wYXRpYmxlIHN0cmluZyBhcyB3ZWxsLiBUaGUgImM5eHgiCj4gPiBjb21wYXRpYmxl
IHN0cmluZyBpcyBmb3IgdGhlIGN1c3RvbSBQTElDIHNwZWMgZm9sbG93ZWQgYnkgVC1IRUFELgo+
Cj4gV2hhdCBJIG1lYW50IHdhcyB0aGF0IHRoZSBzb2Mtc3BlY2lmaWMgc3RyaW5nIHNob3VsZCBu
YW1lIHRoZQo+IGFjdHVhbCBTb0MgKGM5MDYsIGM5MTApIGFuZCBub3Qgc29tZSBpbWFnaW5hcnkg
Y2hpcCA7LSkKCkFoaCwgeWVzLiBJdCBzaG91bGQgYmUgYW4gYWN0dWFsIHNvYyBuYW1lIGluIHRo
ZSBjb21wYXRpYmxlCnN0cmluZy4KCkZvciBleGFtcGxlLCBTaUZpdmUgdXNlcyAiZnU1NDAiIHN0
cmluZyB0byBpZGVudGlmeSBzb21lIG9mIHRoZQpkZXZpY2VzIG9uIGJvdGggU2lGaXZlIHVubGVh
c2hlZCBhbmQgU2lGaXZlIHVubWF0Y2hlZCBib2FyZHMuCgpJIHdhcyB1bmRlciB0aGUgaW1wcmVz
c2lvbiB0aGF0ICJjOTAwIiBpcyBhbiBhY3R1YWwgU29DIG5hbWUuCgpSZWdhcmRzLApBbnVwCgo+
Cj4gU2VlIGZvciBleGFtcGxlIG1hbGkgZ3B1IGJpbmRpbmdzIGZvciBhIHNpbWlsYXIgcmVmZXJl
bmNlCj4gaW4gZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sIC4K
Pgo+Cj4KPgo+ID4KPiA+ID4KPiA+ID4KPiA+ID4gPiA+ICAgICAgICAtIGNvbnN0OiBzaWZpdmUs
cGxpYy0xLjAuMAo+ID4gPiA+Cj4gPiA+ID4gVGhlIFBMSUMgRFQgbm9kZSByZXF1aXJlcyB0d28g
Y29tcGF0aWJsZSBzdHJpbmc6Cj4gPiA+ID4gPGltcGxlbWVudGF0aW9uX2NvbXBhdD4sIDxzcGVj
X2NvbXBhdD4KPiA+ID4gPgo+ID4gPiA+IFRoZSBDOXh4IFBMSUMgaXMgbm90IFJJU0MtViBQTElD
IHNvLCB0aGUgRFQgbm9kZSBzaG91bGQKPiA+ID4gPiBiZTogInRoZWFkLGM5MDAtcGxpYyIsICJ0
aGVhZCxjOXh4LXBsaWMiCj4gPiA+ID4KPiA+ID4gPiBZb3UgbmVlZCB0byBjaGFuZ2UgIi0gY29u
c3Q6IHNpZml2ZSxwbGljLTEuMC4wIiB0bwo+ID4gPiA+IC0gZW51bToKPiA+ID4gPiAgICAgLSBz
aWZpdmUscGxpYy0xLjAuMAo+ID4gPiA+ICAgICAtIHRoZWFkLGM5eHgtcGxpYwo+ID4gPgo+ID4g
Pgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBBbnVwCj4gPgo+Cj4KPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
