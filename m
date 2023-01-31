Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D5CC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKNhQHOasss3ukeeXH13OiLcJ3QuEMpjvZzLQ0CSLj0=; b=WnqH7hmRCad9mf
	3q4rOm5Ta3J1eIFstiOGFwhE8Zh7cqf+gzPsI7KDJw0BjiSJSak3oMFA2huFKL5GUzXyJ7h4k4p1c
	RzgqDSghixu37w9je2mRZQD0q13RPYIqq1+Qgvn5TKHag70rKZ11B0WF82wZE3hpVGWuPQ8cTbT7x
	uHfoion7k0I/ymGIaBLPLcsCKJ35IWGtFB1yuB6zJk41aQSIPqyAFDLoiu6mkBHq01XFfjc3MyrLS
	usd91YqxWefDD7IPp3ZD7iPxRgbIGcoeJ3V06QxZ+N6UxW/YW7y3cCTW6eOD9eRNwyMwNkda6A5ZR
	OTmAAIkOAftdz77BHknw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlnX-006evL-E4; Tue, 31 Jan 2023 08:15:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlnT-006et2-F0
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:15:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7214FB81914
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 08:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E40BC433A1
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 08:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675152914;
	bh=wD1NznNfV503vLx09ETXd05uvQ9jLt3NCSE2JyBwyA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uC/oeESi2aZ2jQhcB83bEps8ryzPuntR/dJTM+EXP9dlLNsttKUSOiENVSPHpNLz1
	 L51cjg11TSo+0TEa7XwAlXi6u9UBQwpmrVz4vQz88UxkXGRN1Tb7rXHHOVb4V7a+c6
	 PYZpg5edxFBTkcn4v7vnv6HsuvHkZVVGpoX+ae4GeyJgJ6/MwbIkz4nTsY7Bb5Za2b
	 YTbKNB/kgcEwmTN92mgWzxxJInn8O972Axj6cPsYZ4HHncQpsKadzEVABkmtnmvIqw
	 +8ohfswyitnNudJD5g1EaTlwFCz9QogG+Ze6QqOgXTYp8Eh4ECwNrsU6ERWCbcVr+w
	 deQnCifatoHMw==
Received: by mail-ej1-f42.google.com with SMTP id m2so38767751ejb.8
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 00:15:14 -0800 (PST)
X-Gm-Message-State: AO0yUKVWZm9xORO4/xk3a5hwZv4WFhtNCpIMHeE0RJs3XhS9019ck1z5
	lYs2qRdq00Uw4ML5PswNrOaEczKoI+9TDB1QJEQ=
X-Google-Smtp-Source: AK7set9r/X+j/Luoht27IephzJVMDnLH8X6uylPqj/MkoZXHgCuEwARpobIh/RTwX4q6Sx+4LpYYcrIf5XBGM/cPrEM=
X-Received: by 2002:a17:907:2155:b0:884:c19c:7c6 with SMTP id
 rk21-20020a170907215500b00884c19c07c6mr2277552ejb.120.1675152912320; Tue, 31
 Jan 2023 00:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us> <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
 <87ilgntdef.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87ilgntdef.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 16:15:00 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTaartwjVdmtmsm1FqmYVuAq5_nGYU5zc6nkdTtCm200A@mail.gmail.com>
Message-ID: <CAJF2gTTaartwjVdmtmsm1FqmYVuAq5_nGYU5zc6nkdTtCm200A@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	mhiramat@kernel.org, conor.dooley@microchip.com, penberg@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_001519_820559_68EA4563 
X-CRM114-Status: GOOD (  30.12  )
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

T24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgMjo0MCBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4K
PiA+IE9uIE1vbiwgSmFuIDMwLCAyMDIzIGF0IDExOjI4IFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+
IHdyaXRlczoKPiA+Pgo+ID4+ID4+IEluIHRoZSBzZXJpZSBvZiBSSVNDViBPUFRQUk9CRVMgWzFd
LCBpdCBwYXRjaGVzIGEgbG9uZy1qdW1wIGluc3RydWN0aW9ucyBwYWlyCj4gPj4gPj4gQVVJUEMv
SkFMUiBpbiBrZXJuZWwgdGV4dCwgc28gaW4gb3JkZXIgdG8gZW5zdXJlIG90aGVyIENQVXMgZG9l
cyBub3QgZXhlY3V0ZQo+ID4+ID4+IGluIHRoZSBpbnN0cnVjdGlvbnMgdGhhdCB3aWxsIGJlIG1v
ZGlmaWVkLCBpdCBpcyBzdGlsbCBuZWVkIHRvIHN0b3Agb3RoZXIgQ1BVcwo+ID4+ID4+IHZpYSBw
YXRjaF90ZXh0IEFQSSwgb3IgeW91IGhhdmUgYW55IGJldHRlciBzb2x1dGlvbiB0byBhY2hpZXZl
IHRoZSBwdXJwb3NlPwo+ID4+ID4gIC0gVGhlIHN0b3BfbWFjaGluZSBpcyBhbiBleHBlbnNpdmUg
d2F5IGFsbCBhcmNoaXRlY3R1cmVzIHNob3VsZAo+ID4+ID4gYXZvaWQsIGFuZCB5b3UgY291bGQg
a2VlcCB0aGF0IGluIHlvdXIgT1BUUFJPQkVTIGltcGxlbWVudGF0aW9uIGZpbGVzCj4gPj4gPiB3
aXRoIHN0YXRpYyBmdW5jdGlvbnMuCj4gPj4gPiAgLSBUaGUgc3RvcF9tYWNoaW5lIGNvdWxkbid0
IHdvcmsgd2l0aCBQUkVFTVBUSU9OLCBzbyB5b3VyCj4gPj4gPiBpbXBsZW1lbnRhdGlvbiBuZWVk
cyB0byB3b3JrIHdpdGggIVBSRUVNUFRJT04uCj4gPj4KPiA+PiAuLi5hbmQgc3RvcF9tYWNoaW5l
KCkgd2l0aCAhUFJFRU1QVElPTiBpcyBicm9rZW4gYXMgd2VsbCwgd2hlbiB5b3UncmUKPiA+PiBy
ZXBsYWNpbmcgbXVsdGlwbGUgaW5zdHJ1Y3Rpb25zIChzZWUgTWFyaydzIHBvc3QgYXQgWzFdKS4g
VGhlCj4gPj4gc3RvcF9tYWNoaW5lKCkgZGFuY2UgbWlnaHQgd29yayB3aGVuIHlvdSdyZSByZXBs
YWNpbmcgKm9uZSogaW5zdHJ1Y3Rpb24sCj4gPj4gbm90IG11bHRpcGxlIGFzIGluIHRoZSBSSVND
LVYgY2FzZS4gSSdsbCBleHBhbmQgb24gdGhpcyBpbiBhIGNvbW1lbnQgaW4KPiA+PiB0aGUgT1BU
UFJPQkVTIHY2IHNlcmllcy4KPiA+Pgo+ID4+ID4+ID4gIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBh
cmNoX3ByZXBhcmVfc2ltdWxhdGUoc3RydWN0IGtwcm9iZSAqcCkKPiA+PiA+PiA+IEBAIC0xMTQs
MTYgKzEyMCwyMyBAQCB2b2lkICphbGxvY19pbnNuX3BhZ2Uodm9pZCkKPiA+PiA+PiA+ICAvKiBp
bnN0YWxsIGJyZWFrcG9pbnQgaW4gdGV4dCAqLwo+ID4+ID4+ID4gIHZvaWQgX19rcHJvYmVzIGFy
Y2hfYXJtX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4+ID4+ID4gIHsKPiA+PiA+PiA+IC0g
ICAgIGlmICgocC0+b3Bjb2RlICYgX19JTlNOX0xFTkdUSF9NQVNLKSA9PSBfX0lOU05fTEVOR1RI
XzMyKQo+ID4+ID4+ID4gLSAgICAgICAgICAgICBwYXRjaF90ZXh0KHAtPmFkZHIsIF9fQlVHX0lO
U05fMzIpOwo+ID4+ID4+ID4gLSAgICAgZWxzZQo+ID4+ID4+ID4gLSAgICAgICAgICAgICBwYXRj
aF90ZXh0KHAtPmFkZHIsIF9fQlVHX0lOU05fMTYpOwo+ID4+ID4+ID4gKyNpZmRlZiBDT05GSUdf
UklTQ1ZfSVNBX0MKPiA+PiA+PiA+ICsgICAgIHUzMiBvcGNvZGUgPSBfX0JVR19JTlNOXzE2Owo+
ID4+ID4+ID4gKyNlbHNlCj4gPj4gPj4gPiArICAgICB1MzIgb3Bjb2RlID0gX19CVUdfSU5TTl8z
MjsKPiA+PiA+PiA+ICsjZW5kaWYKPiA+PiA+PiA+ICsgICAgIHBhdGNoX3RleHRfbm9zeW5jKHAt
PmFkZHIsICZvcGNvZGUsIEdFVF9JTlNOX0xFTkdUSChvcGNvZGUpKTsKPiA+PiA+Pgo+ID4+ID4+
IFNvdW5kcyBnb29kLCBidXQgaXQgd2lsbCBsZWF2ZSBzb21lIFJWSSBpbnN0cnVjdGlvbiB0cnVu
Y2F0ZWQgaW4ga2VybmVsIHRleHQsCj4gPj4gPj4gaSBkb3VidCBrZXJuZWwgYmVoYXZpb3IgZGVw
ZW5kcyBvbiB0aGUgcmVzdCBvZiB0aGUgdHJ1bmNhdGVkIGluc3RydWN0aW9uLCB3ZWxsLAo+ID4+
ID4+IGl0IG5lZWRzIG1vcmUgc3RyaWN0IHRlc3RpbmcgdG8gcHJvdmUgbXkgY29uY2VybiA6KQo+
ID4+ID4gSSBkbyB0aGlzIG9uIHB1cnBvc2UsIGFuZCBpdCBkb2Vzbid0IGNhdXNlIGFueSBwcm9i
bGVtcy4gRG9uJ3Qgd29ycnk7Cj4gPj4gPiBJRlUgaHcgbXVzdCBlbmZvcmNlIHRoZSBmZXRjaCBz
ZXF1ZW5jZSwgYW5kIHRoZXJlIGlzIG5vIHdheSB0byBleGVjdXRlCj4gPj4gPiBicm9rZW4gaW5z
dHJ1Y3Rpb25zIGV2ZW4gaW4gdGhlIHNwZWN1bGF0aXZlIGV4ZWN1dGlvbiBwYXRoLgo+ID4+Cj4g
Pj4gVGhpcyBpcyBzdHJldGNoaW5nIHJlYWxpdHkgYSBiaXQgbXVjaC4gQVJNdjgsIGUuZy4sIGhh
cyBhIGNoYXB0ZXIgaW4gdGhlCj4gPj4gQXJtIEFSTSBbMl0gQXBwZW5kaXggQiAiQ29uY3VycmVu
dCBtb2RpZmljYXRpb24gYW5kIGV4ZWN1dGlvbiBvZgo+ID4+IGluc3RydWN0aW9ucyIgKENNT0RY
KS4gKlNvbWUqIGluc3RydWN0aW9ucyBjYW4gYmUgcmVwbGFjZWQgY29uY3VycmVudGx5LAo+ID4+
IGFuZCBvdGhlcnMgY2Fubm90IHdpdGhvdXQgY2F1dGlvbi4gQXNzdW1pbmcgdGhhdCB0aGF0IGFs
bCBSSVNDLVYKPiA+PiBpbXBsZW1lbnRhdGlvbnMgY2FuLCBpcyBhIHN0cmV0Y2guIFJJU0MtViBo
YXNuJ3QgZXZlbiBzcGVjaWZpZWQgdGhlCj4gPj4gYmVoYXZpb3Igb2YgQ01PRFggKHdoaWNoIGlz
IHByb2JsZW1hdGljKS4KPiA+IEhlcmUgd2Ugb25seSB1c2Ugb25lIHN3L3NoIGluc3RydWN0aW9u
IHRvIHN0b3JlIGEgMzJiaXQvMTZiaXQgYWxpZ25lZCBlbGVtZW50Ogo+ID4KPiA+IElOU05fMCA8
LSBlYnJlYWsgKDE2Yml0LzMyYml0IGFsaWduZWQpCj4gPiBJTlNOXzEKPiA+IElOU05fMgo+ID4K
PiA+IFRoZSBlYnJlYWsgd291bGQgY2F1c2UgYW4gZXhjZXB0aW9uIHdoaWNoIGltcGxpZXMgYSBo
dWdlIGZlbmNlIGhlcmUuCj4gPiBObyBtYWNoaW5lIGNvdWxkIGdpdmUgYSBzcGVjdWxhdGl2ZSBl
eGVjdXRpb24gZm9yIHRoZSBlYnJlYWsgcGF0aC4KPgo+IEl0J3MgdGhlIGNvbmN1cnJlbnQgbW9k
aWZpY2F0aW9uIHRoYXQgSSB3YXMgcmVmZXJyaW5nIHRvIChyZW1vdmluZwo+IHN0b3BfbWFjaGlu
ZSgpKS4gWW91J3JlIHNheWluZyAiaXQnbGwgYWx3YXlzIHdvcmsiLCBJJ20gc2F5aW5nICJJJ20g
bm90Cj4gc28gc3VyZSIuIDotKSBFLmcuLCB3cml0aW5nIGMuZWJyZWFrIG9uIGFuIDMyYiBpbnNu
LiBDYW4geW91IHNheSB0aGF0ClNvZnR3YXJlIG11c3QgZW5zdXJlIHdyaXRlIGMuZWJyZWFrIG9u
IHRoZSBoZWFkIG9mIGFuIDMyYiBpbnNuLgoKVGhhdCBtZWFucyBJRlUgb25seSBzZWU6CiAtIGMu
ZWJyZWFrICsgYnJva2VuL2lsbGVnYWwgaW5zbi4Kb3IKIC0gb3JpZ2luIGluc24KCkV2ZW4gaW4g
dGhlIHdvcnN0IGNhc2UsIHN1Y2ggYXMgSUZVIGZldGNoZXMgaW5zdHJ1Y3Rpb25zIG9uZSBieSBv
bmU6CklmIHRoZSBJRlUgZ2V0cyB0aGUgb3JpZ2luIGluc24sIGl0IHdpbGwgc2tpcCB0aGUgYnJv
a2VuL2lsbGVnYWwgaW5zbi4KSWYgdGhlIElGVSBnZXRzIHRoZSBjLmVicmVhayArIGJyb2tlbi9p
bGxlZ2FsIGluc24sIHRoZW4gYW4gZWJyZWFrCmV4Y2VwdGlvbiBpcyByYWlzZWQuCgpCZWNhdXNl
IGMuZWJyZWFrIHdvdWxkIHJhaXNlIGFuIGV4Y2VwdGlvbiwgSSBkb24ndCBzZWUgYW55IHByb2Js
ZW0uCgoKPiB3aWxsIHdvcmsgb24gYWxsIFJJU0MtViBpbXBsZW1lbnRhdGlvbnM/IERvIHlvdSBo
YXZlIGV4YW1wbGVzIG9mCj4gaGFyZHdhcmUgd2hlcmUgaXQgd2lsbCB3b3JrPwpGb3IgdGhlIGMu
ZWJyZWFrLCBpdCdzIG5hdHVyYWwuIEl0J3MgaGFyZCB0byBtYWtlIGhhcmR3YXJlCmltcGxlbWVu
dGF0aW9uIGdldCBwcm9ibGVtcyBoZXJlLgoKPgo+Cj4gQmrDtnJuCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
