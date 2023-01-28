Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A891CC38142
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 03:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CH3bFljMGUDd+z9bI0mknIvLW1K847VxT7sR7VFmavg=; b=A5uUnHpDH+c7ni
	QikJCX2nmAhVp9NbjboHTtwkZiFVM3MBxNPXre6Tt18631iF/d7au+lpDyB6IYf5x6JzCEWDMtu/I
	iC5gs0TsN6TVr3L1GyghX6rFXX0mQ5Ern/ePXHxxLrCF7+O9kGkCP+SjV41CYh9+Juo7HYLRtoHh+
	eJG3mUBP9QBr4/wTfTp2Cy2rJDZek2ZNONe7svbzNTFUsO8gQmdkd3PXkPykbCndu/pbrdmHOUHxU
	ZgIlwcMm+cGJhqkDA3D0roM+HXrzS+PvWexeJDhMdlqx20WAzR6u/s+4k6z1nxE5bDgojH2V2cNQl
	s7ctEkaDc3hZlMbGV1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLcAf-00H7V7-82; Sat, 28 Jan 2023 03:46:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLcAb-00H7Uh-CC
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 03:46:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9993D61DD0
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 03:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62538C433A4
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 03:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674877583;
	bh=xrplkrP1iTni6a9kqOD2wQ3fO257Ty75EuSm7HvQc6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s3LzPLrnhuV5M5DjsZ+xYFNPevepPT6Ag7EToRdrvKksO7eaieAvPNIL7Ab1CnAD0
	 3LL2GkafcW3D95fEmN+la8E3c0Fvn0ZWNYeIRxzlkcjn2ddSnpAkCmnmJlRXSs9Pac
	 S8QMlwhDbDyQBQgeTrgsuuHfkxpRDP//h5MaJqz1ocXYqbOADFeyl7KjxgBwyVkbBo
	 uds6G+LGviB6OPS3MoKBV4vos4Z4wRF1wr+nobfAVROlDAVLd4+EhCH+kViKFEyp7V
	 8qEzRdnQ1xwhKd1aDDWg9hTZYjIBOuLs0oR7cxIZ4gsEGBXzKYfnHHfOX3nGwFnnwW
	 RofTyDalS9IwQ==
Received: by mail-ej1-f51.google.com with SMTP id p26so7299194ejx.13
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 19:46:23 -0800 (PST)
X-Gm-Message-State: AO0yUKU29CaR+VXXEq7HTf75kd+BMPdRg0pdv47DWqYAlG8GQ2KmqVeG
	6BOA/2WUYohshZKLfjn65jeUpJgyc0dd7SHsZ8Q=
X-Google-Smtp-Source: AK7set/8/jg1gn5SG5eUmuwfc9eUNjiyDY+MDcbKa+l0SngJGrrgdO+trrxofpt5EpDt6xLwTuw87/kT8yRev9nEHq8=
X-Received: by 2002:a17:906:ad94:b0:878:6d44:ac21 with SMTP id
 la20-20020a170906ad9400b008786d44ac21mr2019096ejb.195.1674877581484; Fri, 27
 Jan 2023 19:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20230126130509.1418251-1-guoren@kernel.org> <0871074a-cafb-a172-f062-6ada6d2a3a41@huawei.com>
In-Reply-To: <0871074a-cafb-a172-f062-6ada6d2a3a41@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 28 Jan 2023 11:46:09 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTd9V6PKu6_ip21HbXWgN6X-epw8yc_s6XonssStFNdEQ@mail.gmail.com>
Message-ID: <CAJF2gTTd9V6PKu6_ip21HbXWgN6X-epw8yc_s6XonssStFNdEQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal position
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org, 
	conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_194625_518615_271064E5 
X-CRM114-Status: GOOD (  28.65  )
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

T24gU2F0LCBKYW4gMjgsIDIwMjMgYXQgMTA6NTUgQU0gbGlhb2NoYW5nIChBKSA8bGlhb2NoYW5n
MUBodWF3ZWkuY29tPiB3cm90ZToKPgo+Cj4KPiDlnKggMjAyMy8xLzI2IDIxOjA1LCBndW9yZW5A
a2VybmVsLm9yZyDlhpnpgZM6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPgo+ID4gVGhlIGtlcm5lbCB3b3VsZCBwYW5pYyB3aGVuIHByb2JlZCBmb3IgYW4g
aWxsZWdhbCBwb3NpdGlvbi4gZWc6Cj4gPgo+ID4gKENPTkZJR19SSVNDVl9JU0FfQz1uKQo+ID4K
PiA+IGVjaG8gJ3A6aGVsbG8ga2VybmVsX2Nsb25lKzB4MTYgYTA9JWEwJyA+PiBrcHJvYmVfZXZl
bnRzCj4gPiBlY2hvIDEgPiBldmVudHMva3Byb2Jlcy9oZWxsby9lbmFibGUKPiA+IGNhdCB0cmFj
ZQo+ID4KPiA+IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBzdGFjay1wcm90ZWN0b3I6IEtl
cm5lbCBzdGFjawo+ID4gaXMgY29ycnVwdGVkIGluOiBfX2RvX3N5c19uZXdmc3RhdGF0KzB4Yjgv
MHhiOAo+ID4gQ1BVOiAwIFBJRDogMTExIENvbW06IHNoIE5vdCB0YWludGVkCj4gPiA2LjIuMC1y
YzEtMDAwMjctZzJkMzk4ZmU0OWE0ZCAjNDkwCj4gPiBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0
aW8scWVtdSAoRFQpCj4gPiBDYWxsIFRyYWNlOgo+ID4gWzxmZmZmZmZmZjgwMDA3MjY4Pl0gZHVt
cF9iYWNrdHJhY2UrMHgzOC8weDQ4Cj4gPiBbPGZmZmZmZmZmODBjNWU4M2M+XSBzaG93X3N0YWNr
KzB4NTAvMHg2OAo+ID4gWzxmZmZmZmZmZjgwYzZkYTI4Pl0gZHVtcF9zdGFja19sdmwrMHg2MC8w
eDg0Cj4gPiBbPGZmZmZmZmZmODBjNmRhNmM+XSBkdW1wX3N0YWNrKzB4MjAvMHgzMAo+ID4gWzxm
ZmZmZmZmZjgwYzVlY2Y0Pl0gcGFuaWMrMHgxNjAvMHgzNzQKPiA+IFs8ZmZmZmZmZmY4MGM2ZGI5
ND5dIGdlbmVyaWNfaGFuZGxlX2FyY2hfaXJxKzB4MC8weGE4Cj4gPiBbPGZmZmZmZmZmODAyZGVl
YjA+XSBzeXNfbmV3c3RhdCsweDAvMHgzMAo+ID4gWzxmZmZmZmZmZjgwMDE1OGMwPl0gc3lzX2Ns
b25lKzB4MjAvMHgzMAo+ID4gWzxmZmZmZmZmZjgwMDAzOWU4Pl0gcmV0X2Zyb21fc3lzY2FsbCsw
eDAvMHg0Cj4gPiAtLS1bIGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogc3RhY2stcHJv
dGVjdG9yOgo+ID4gS2VybmVsIHN0YWNrIGlzIGNvcnJ1cHRlZCBpbjogX19kb19zeXNfbmV3ZnN0
YXRhdCsweGI4LzB4YjggXS0tLQo+ID4KPiA+IFRoYXQgaXMgYmVjYXVzZSB0aGUga3Byb2JlJ3Mg
ZWJyZWFrIGluc3RydWN0aW9uIGJyb2tlIHRoZSBrZXJuZWwncwo+ID4gb3JpZ2luYWwgY29kZS4g
VGhlIHVzZXIgc2hvdWxkIGd1YXJhbnRlZSB0aGUgY29ycmVjdGlvbiBvZiB0aGUgcHJvYmUKPiA+
IHBvc2l0aW9uLCBidXQgaXQgY291bGRuJ3QgbWFrZSB0aGUga2VybmVsIHBhbmljLgo+ID4KPiA+
IFRoaXMgcGF0Y2ggYWRkcyBhcmNoX2NoZWNrX2twcm9iZSBpbiBhcmNoX3ByZXBhcmVfa3Byb2Jl
IHRvIHByZXZlbnQgYW4KPiA+IGlsbGVnYWwgcG9zaXRpb24gKFN1Y2ggYXMgdGhlIG1pZGRsZSBv
ZiBhbiBpbnN0cnVjdGlvbikuCj4gPgo+ID4gRml4ZXM6IGMyMmIwYmNiMWRkMCAoInJpc2N2OiBB
ZGQga3Byb2JlcyBzdXBwb3J0ZWQiKQo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5j
IHwgMTggKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9i
ZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPiA+IGluZGV4IGYyMTU5
MmQyMDMwNi4uNDc1OTg5ZjA2ZDZkIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
cHJvYmVzL2twcm9iZXMuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9i
ZXMuYwo+ID4gQEAgLTQ4LDYgKzQ4LDIxIEBAIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNoX3Np
bXVsYXRlX2luc24oc3RydWN0IGtwcm9iZSAqcCwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAg
ICAgICBwb3N0X2twcm9iZV9oYW5kbGVyKHAsIGtjYiwgcmVncyk7Cj4gPiAgfQo+ID4KPiA+ICtz
dGF0aWMgYm9vbCBfX2twcm9iZXMgYXJjaF9jaGVja19rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkK
PiA+ICt7Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIHRtcCAgPSAodW5zaWduZWQgbG9uZylwLT5h
ZGRyIC0gcC0+b2Zmc2V0Owo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVk
IGxvbmcpcC0+YWRkcjsKPiA+ICsKPiA+ICsgICAgIHdoaWxlICh0bXAgPD0gYWRkcikgewo+ID4g
KyAgICAgICAgICAgICBpZiAodG1wID09IGFkZHIpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIHRydWU7Cj4gPiArCj4gPiArICAgICAgICAgICAgIHRtcCArPSBHRVRfSU5TTl9MRU5H
VEgoKihrcHJvYmVfb3Bjb2RlX3QgKil0bXApOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAg
cmV0dXJuIGZhbHNlOwo+ID4gK30KPgo+IExHVE0uCj4KPiBJIGhhdmUgc3VibWl0IGEgcGF0Y2gg
dG8gZml4IHRoZSBzYW1lIHByb2JsZW0sIGZvdW5kIGF0OgpPaCwgSSBtaXNzZWQgdGhhdCBwYXRj
aC4gT3VyIGdvYWwgaXMgdGhlIHNhbWUuCgpCdXQgaXQgd291bGQgYmUgYmVzdCBpZiB5b3UgcmV1
c2VkIHAtPm9mZnNldCwgbm90CmthbGxzeW1zX2xvb2t1cF9zaXplX29mZnNldCwgdGhlIHAtPmFk
ZHIgYWRkZWQgYnkgX2twcm9iZV9hZGRyCihrZXJuZWwva3Byb2Jlcy5jKSwgbm90IGp1c3Qga2Fs
bHN5bXNfbG9va3VwX3NpemVfb2Zmc2V0LiBTdXJlLCBpdAp3b3JrcyBhcm91bmQgZm9yIHRoZSBj
dXJyZW50IHJpc2N2LCBidXQgdGhhdCdzIG5vdCBjb3JyZWN0LgoKPgo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvMjAyMzAxMjcxMzA1NDEuMTI1MDg2NS0xMS1jaGVuZ3Vva2FpMTdAbWFp
bHMudWNhcy5hYy5jbi8KPgo+IFNvIHRoaXMgYm91bmRhcnkgY2hlY2sgaXMgbmVjZXNzYXJ5IG5v
IG1hdHRlciBDT05GSUdfUklTQ1ZfSVNBX0MgaXMgZW5hYmxlIG9yIG5vdCwgcmlnaHQ/Clllcywg
bXkgcGFuaWMgZXhhbXBsZSBpbiB0aGUgY29tbWl0IGxvZyBpcyBiYXNlZCBvbiB0aGUKIUNPTkZJ
R19SSVNDVl9JU0FfQywgeW91IGNvdWxkbid0IG1pc3MgdGhhdC4KCj4KPgo+ID4gKwo+ID4gIGlu
dCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4gIHsK
PiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgcHJvYmVfYWRkciA9ICh1bnNpZ25lZCBsb25nKXAtPmFk
ZHI7Cj4gPiBAQCAtNTUsNiArNzAsOSBAQCBpbnQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9rcHJv
YmUoc3RydWN0IGtwcm9iZSAqcCkKPiA+ICAgICAgIGlmIChwcm9iZV9hZGRyICYgMHgxKQo+ID4g
ICAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsKPiA+Cj4gPiArICAgICBpZiAoIWFyY2hfY2hl
Y2tfa3Byb2JlKHApKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsKPiA+ICsKPiA+
ICAgICAgIC8qIGNvcHkgaW5zdHJ1Y3Rpb24gKi8KPiA+ICAgICAgIHAtPm9wY29kZSA9ICpwLT5h
ZGRyOwo+ID4KPgo+IC0tCj4gQlIsCj4gTGlhbywgQ2hhbmcKCgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
