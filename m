Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB30C27C76
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jan 2023 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ymLQTcOX8BtFvRC3eW4fgHtOHG0Ybkin7ZotEbZok8=; b=jUufBtU6CEdPDJ
	J7qOyu8EbEttvJWgDpDZZnRagFTzCGjn0YpEViDuIirbQRkke5J553YusjI11ZI6lwqJ3EhUAQ8v0
	AotciOvImQpJ28GCfSA1YA4ntcLW8SqAgOOcl33d/XKLcBbGqCvOk3NGVtWf0yoLfZ6A68PES0Zmg
	Zqc3SJ7p/OVON6aPU+9KMrkFI3f5IAXWvJR+GCbCCKnB12Qu5cAXsMFTFhO/305ZFgFWr9egnn+n8
	/giK1SH1fdHUlqRuDrHauOIPFh0nG5zhDIp9WQFtNLXG7h/F4GRG8+6zreJlAvuo+6l+4zq1FVhpc
	kUnc/1vy+h+kU2Ev359g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLdfn-00HFB7-Gq; Sat, 28 Jan 2023 05:22:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLdfk-00HFAj-Sb
	for linux-riscv@lists.infradead.org; Sat, 28 Jan 2023 05:22:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7A492B82202
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 05:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE03C433EF
	for <linux-riscv@lists.infradead.org>; Sat, 28 Jan 2023 05:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674883353;
	bh=RgMQrIq5NCunPhbq4F3nIkigDBT67Aykecs1pXiv1fY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AO+Y7KvW/8+S+sSgDZJmnsnFOr9vINNLsfCYnqgcHca9qn8hPB7gz/TCnRLQ/K2hw
	 ePIvUUW8VLFhXScAsNpl1M+5i+vbCwQ/Lr9n/gmQFcMV2noV39nHS1e3ZdaHwf3aKe
	 DUuGhwcnEaHVzgWAnj81BZ3sUCfGMTU67Bng3kiBTEyrjvat9dBTgAPRdkNm4E3ghP
	 eUHYTfztHGkww60EBW0x5gfOCwHx4WWes3ZmS0RZx/2KyMi3nUQbhgUGcDa4oeEoU/
	 xLR0Dbw3zV4FFeTfoyu/xHaDvZZhBAoLm/S8/apTHrDUjK0tW7AUAGVgfOZDwaGJKQ
	 lIMEH+/SL1IwA==
Received: by mail-ej1-f52.google.com with SMTP id mf7so38537ejc.6
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 21:22:32 -0800 (PST)
X-Gm-Message-State: AO0yUKUXke7ZjRo0/tPrMfQhp8Wzd5yzRS5GtWm1ZatbskE/xxY094Ez
	KeddCK3G74lqlz5TYVBsmJV56dseZX+ZFb5Kyl4=
X-Google-Smtp-Source: AMrXdXt4YoYGWb/Ur+ZuHhtYhoizwU6XirUnmJjs9N4IBEmCOnkhA0wApzE8I/B+JvOG61y/mMSF8NnEvw5HcVHDFOc=
X-Received: by 2002:a17:906:770d:b0:877:e1ef:e49a with SMTP id
 q13-20020a170906770d00b00877e1efe49amr3688827ejm.147.1674883351139; Fri, 27
 Jan 2023 21:22:31 -0800 (PST)
MIME-Version: 1.0
References: <20230126130509.1418251-1-guoren@kernel.org> <0871074a-cafb-a172-f062-6ada6d2a3a41@huawei.com>
In-Reply-To: <0871074a-cafb-a172-f062-6ada6d2a3a41@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 28 Jan 2023 13:22:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTJgKt+UXeKA=AccDjZWGFvxBttOTkfoS=0SFNOwowHBg@mail.gmail.com>
Message-ID: <CAJF2gTTJgKt+UXeKA=AccDjZWGFvxBttOTkfoS=0SFNOwowHBg@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal position
To: "liaochang (A)" <liaochang1@huawei.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org, 
	conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_212241_263504_81E98254 
X-CRM114-Status: GOOD (  28.62  )
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
dG8gZml4IHRoZSBzYW1lIHByb2JsZW0sIGZvdW5kIGF0Ogo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC8yMDIzMDEyNzEzMDU0MS4xMjUwODY1LTExLWNoZW5ndW9rYWkxN0BtYWlscy51
Y2FzLmFjLmNuLwpJIGhhdmUgYSBxdWVzdGlvbiBvbiB5b3VyIE9QVEtQUk9CRSBwYXRjaDoKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDEyNzEzMDU0MS4xMjUwODY1LTEwLWNoZW5n
dW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuLwoKQEAgLTQ5MCw3ICs1NzMsMTQgQEAgaW50IGFyY2hf
cHJlcGFyZV9vcHRpbWl6ZWRfa3Byb2JlKHN0cnVjdApvcHRpbWl6ZWRfa3Byb2JlICpvcCwKICAq
IHRvIGRldG91ciBidWZmZXIsIHJhIGlzIHVzZWQgdG8gZm9ybSBKUiBqdW1waW5nIGJhY2sgZnJv
bSBkZXRvdXIKICAqIGJ1ZmZlci4KICAqLwotIGZpbmRfZnJlZV9yZWdpc3RlcnMob3JpZywgb3As
ICZyZCwgJnJhKTsKKyBpZiAodXNlZF9yZWcgPT0gQUxMX1JFR19PQ0NVUElFRCkgeworIGZpbmRf
ZnJlZV9yZWdpc3RlcnMob3JpZywgb3AsICZyZCwgJnJhKTsKKyB9IGVsc2UgeworIC8qIENob29z
ZSBvbmUgdW51c2VkIGNhbGxlci1zYXZlZCByZWdpc3Rlci4gKi8KKyByZCA9IGZmeih1c2VkX3Jl
Zyk7CisgcmEgPSByZDsKKyB9CisKICBpZiAocmQgPT0gMCB8fCByYSA9PSAwKSB7CiAgXl5eXl5e
Xl5eXl5eXl5eXl5eCkFmdGVyIG5vIG9wdF91c2VkX2RzdF9yZWcgJiBubyBmcmVlIGNhbGxlci1z
YXZlZCByZWdpc3RlciAoT2YgY2F1c2UsCml0J3MgdmVyeSByYXJlIGZvciBubyBhdmFpbGFibGUg
dG1wIHJlZ3MpOgoKV2h5IG5vdCB0cnk6CgogICAgIDA6IFJFR19TICByYSwgLVNaUkVHKHNwKQog
ICAgIDQ6IGF1aXBjICByYSwgPwogICAgIDg6IGphbHIgICA/KHJhKQogICAgMTI6IFJFR19MICBy
YSwgLVNaUkVHKHNwKQoKQmVzaWRlcyB0YWtpbmcgdXAgbW9yZSBpbnN0cnVjdGlvbiBzbG90cywg
ZG9lcyBpdCBoYXZlIG90aGVyIHByb2JsZW1zPwoKPgo+IFNvIHRoaXMgYm91bmRhcnkgY2hlY2sg
aXMgbmVjZXNzYXJ5IG5vIG1hdHRlciBDT05GSUdfUklTQ1ZfSVNBX0MgaXMgZW5hYmxlIG9yIG5v
dCwgcmlnaHQ/Cj4KPgo+ID4gKwo+ID4gIGludCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX2twcm9i
ZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4gIHsKPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgcHJvYmVf
YWRkciA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHI7Cj4gPiBAQCAtNTUsNiArNzAsOSBAQCBpbnQg
X19rcHJvYmVzIGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPiA+ICAgICAg
IGlmIChwcm9iZV9hZGRyICYgMHgxKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsK
PiA+Cj4gPiArICAgICBpZiAoIWFyY2hfY2hlY2tfa3Byb2JlKHApKQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm4gLUVJTFNFUTsKPiA+ICsKPiA+ICAgICAgIC8qIGNvcHkgaW5zdHJ1Y3Rpb24gKi8K
PiA+ICAgICAgIHAtPm9wY29kZSA9ICpwLT5hZGRyOwo+ID4KPgo+IC0tCj4gQlIsCj4gTGlhbywg
Q2hhbmcKCgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
