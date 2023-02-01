Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09909C636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rNlfQvCeHnZYP7DxIKEZXEx3sZAiCjbntCIqwyKUfUQ=; b=LEEKbSdvsC5Nzn
	9uVaPPqMSzIw84NaT4lBNaGxmjvh7jTj4t0ZfVrUKuEhzmrFa+O4fw+A7N6ZypE8EMJMjSYBV84iM
	m6K2oWC3RFIRchS8AuMJVTzEuDTgAK1O6Q77+TLCCc9yFr+ZJbflce2qbqy9MLm2Vz/XykZBWHc2+
	G/cRN2X4241vAD6C/zhudw0P/+77Lgoijv2t6dcEKLQ04FQYrlwLDIL8MR8yKVWso2F1U/wvo4mPI
	it/rqOY5LzReQp5Vx3d0P2iMlKMozTiUFab3rHWzCJhJ0TE5vrQ9Y08eDJpIM6v6vS2PK7Wg+PjKK
	/deEBf7g4/yNPgAjuXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN3K1-00A4FO-S8; Wed, 01 Feb 2023 02:58:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN3Jy-00A4DW-Va
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 02:58:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EF058B81FC9
	for <linux-riscv@lists.infradead.org>; Wed,  1 Feb 2023 02:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F5AEC433EF
	for <linux-riscv@lists.infradead.org>; Wed,  1 Feb 2023 02:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675220277;
	bh=10P8Z+pIOUvlrCjA+wavMpCD7WRfDGtQ0JWHUqTWTo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vv15f5rGXmI73TjMnA/q8HuCU9lCiFdU7oH39CFJ8TMLvDjckezPcTXEq8Uwrk2fQ
	 BcnurYKYywhc/nYQnbZHs//xNAqAqMJFUCmJmoOYFlEnYnURSKsJ+pZU/lYRHOhoCm
	 U1+qtmkP/rp7WFdu24zOSKv+6jT9P6TCfp2AvDXJ3lBzK1i3AGOFaqWFQpD75kLhE3
	 Jy2plzeLaHbZjBeEl7PYJv4mjJWu9ckMvFHkPrEt1AQG1horsSkHIw/bLP9A+23PxK
	 lZp4u8Peo7Pu/NmFgul2Y28Yx6nktPdCOZECBb5AoeT5wUpYP70ms3Te9GxWDFJkdI
	 p/yamSAn65ECg==
Received: by mail-ed1-f51.google.com with SMTP id fi26so16300758edb.7
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 18:57:57 -0800 (PST)
X-Gm-Message-State: AO0yUKX9R8hfHyzloSELQ7YrF0fpwn2S/v17aO9Vn52iCyLK5UyCbzBR
	o0mu/Ck6Rt+dCpruEhkppIcZo7AYP5f7kh27CUY=
X-Google-Smtp-Source: AK7set8MCIG6L9/2W7/h49loHPlTByOB4jIKC6rT4XTIzKZxXyr42YKwNWkpyUat0C0aPD95sNO/WNpV6cdlj/Uk3wk=
X-Received: by 2002:aa7:c6d2:0:b0:499:c343:30e3 with SMTP id
 b18-20020aa7c6d2000000b00499c34330e3mr111241eds.4.1675220275861; Tue, 31 Jan
 2023 18:57:55 -0800 (PST)
MIME-Version: 1.0
References: <20230126130509.1418251-1-guoren@kernel.org> <878rhig9zj.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <878rhig9zj.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 1 Feb 2023 10:57:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQHDmT=XWE=j8+5Y5ogKh4qNMpXCwAa+7wXEkBit0ujXw@mail.gmail.com>
Message-ID: <CAJF2gTQHDmT=XWE=j8+5Y5ogKh4qNMpXCwAa+7wXEkBit0ujXw@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal position
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org, 
	conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com, 
	liaochang <liaochang1@huawei.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_185803_335632_5BC24984 
X-CRM114-Status: GOOD (  27.15  )
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

T24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgODozMiBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IGd1b3JlbkBrZXJuZWwub3JnIHdyaXRlczoKPgo+ID4gRnJvbTog
R3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IFRoZSBrZXJuZWwgd291
bGQgcGFuaWMgd2hlbiBwcm9iZWQgZm9yIGFuIGlsbGVnYWwgcG9zaXRpb24uIGVnOgo+ID4KPiA+
IChDT05GSUdfUklTQ1ZfSVNBX0M9bikKPiA+Cj4gPiBlY2hvICdwOmhlbGxvIGtlcm5lbF9jbG9u
ZSsweDE2IGEwPSVhMCcgPj4ga3Byb2JlX2V2ZW50cwo+ID4gZWNobyAxID4gZXZlbnRzL2twcm9i
ZXMvaGVsbG8vZW5hYmxlCj4gPiBjYXQgdHJhY2UKPiA+Cj4gPiBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzogc3RhY2stcHJvdGVjdG9yOiBLZXJuZWwgc3RhY2sKPiA+IGlzIGNvcnJ1cHRlZCBp
bjogX19kb19zeXNfbmV3ZnN0YXRhdCsweGI4LzB4YjgKPiA+IENQVTogMCBQSUQ6IDExMSBDb21t
OiBzaCBOb3QgdGFpbnRlZAo+ID4gNi4yLjAtcmMxLTAwMDI3LWcyZDM5OGZlNDlhNGQgIzQ5MAo+
ID4gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+ID4gQ2FsbCBUcmFjZToK
PiA+IFs8ZmZmZmZmZmY4MDAwNzI2OD5dIGR1bXBfYmFja3RyYWNlKzB4MzgvMHg0OAo+ID4gWzxm
ZmZmZmZmZjgwYzVlODNjPl0gc2hvd19zdGFjaysweDUwLzB4NjgKPiA+IFs8ZmZmZmZmZmY4MGM2
ZGEyOD5dIGR1bXBfc3RhY2tfbHZsKzB4NjAvMHg4NAo+ID4gWzxmZmZmZmZmZjgwYzZkYTZjPl0g
ZHVtcF9zdGFjaysweDIwLzB4MzAKPiA+IFs8ZmZmZmZmZmY4MGM1ZWNmND5dIHBhbmljKzB4MTYw
LzB4Mzc0Cj4gPiBbPGZmZmZmZmZmODBjNmRiOTQ+XSBnZW5lcmljX2hhbmRsZV9hcmNoX2lycSsw
eDAvMHhhOAo+ID4gWzxmZmZmZmZmZjgwMmRlZWIwPl0gc3lzX25ld3N0YXQrMHgwLzB4MzAKPiA+
IFs8ZmZmZmZmZmY4MDAxNThjMD5dIHN5c19jbG9uZSsweDIwLzB4MzAKPiA+IFs8ZmZmZmZmZmY4
MDAwMzllOD5dIHJldF9mcm9tX3N5c2NhbGwrMHgwLzB4NAo+ID4gLS0tWyBlbmQgS2VybmVsIHBh
bmljIC0gbm90IHN5bmNpbmc6IHN0YWNrLXByb3RlY3RvcjoKPiA+IEtlcm5lbCBzdGFjayBpcyBj
b3JydXB0ZWQgaW46IF9fZG9fc3lzX25ld2ZzdGF0YXQrMHhiOC8weGI4IF0tLS0KPiA+Cj4gPiBU
aGF0IGlzIGJlY2F1c2UgdGhlIGtwcm9iZSdzIGVicmVhayBpbnN0cnVjdGlvbiBicm9rZSB0aGUg
a2VybmVsJ3MKPiA+IG9yaWdpbmFsIGNvZGUuIFRoZSB1c2VyIHNob3VsZCBndWFyYW50ZWUgdGhl
IGNvcnJlY3Rpb24gb2YgdGhlIHByb2JlCj4gPiBwb3NpdGlvbiwgYnV0IGl0IGNvdWxkbid0IG1h
a2UgdGhlIGtlcm5lbCBwYW5pYy4KPiA+Cj4gPiBUaGlzIHBhdGNoIGFkZHMgYXJjaF9jaGVja19r
cHJvYmUgaW4gYXJjaF9wcmVwYXJlX2twcm9iZSB0byBwcmV2ZW50IGFuCj4gPiBpbGxlZ2FsIHBv
c2l0aW9uIChTdWNoIGFzIHRoZSBtaWRkbGUgb2YgYW4gaW5zdHJ1Y3Rpb24pLgo+Cj4gTmljZSEK
Pgo+IEBsaWFvY2hhbmcgV2lsbCB5b3UgcmVtb3ZlIHlvdXIgcGF0Y2ggZnJvbSB0aGUgT1BUUFJP
QkUgc2VyaWVzPwo+Cj4gPiBGaXhlczogYzIyYjBiY2IxZGQwICgicmlzY3Y6IEFkZCBrcHJvYmVz
IHN1cHBvcnRlZCIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxp
YmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
PiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCAxOCArKysr
KysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+ID4gaW5kZXggZjIxNTkyZDIwMzA2Li40
NzU5ODlmMDZkNmQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3By
b2Jlcy5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4gPiBA
QCAtNDgsNiArNDgsMjEgQEAgc3RhdGljIHZvaWQgX19rcHJvYmVzIGFyY2hfc2ltdWxhdGVfaW5z
bihzdHJ1Y3Qga3Byb2JlICpwLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICAgICAgIHBvc3Rf
a3Byb2JlX2hhbmRsZXIocCwga2NiLCByZWdzKTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBib29s
IF9fa3Byb2JlcyBhcmNoX2NoZWNrX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+ID4gK3sKPiA+
ICsgICAgIHVuc2lnbmVkIGxvbmcgdG1wICA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHIgLSBwLT5v
ZmZzZXQ7Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSAodW5zaWduZWQgbG9uZylwLT5h
ZGRyOwo+ID4gKwo+ID4gKyAgICAgd2hpbGUgKHRtcCA8PSBhZGRyKSB7Cj4gPiArICAgICAgICAg
ICAgIGlmICh0bXAgPT0gYWRkcikKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1
ZTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgdG1wICs9IEdFVF9JTlNOX0xFTkdUSCgqKGtwcm9i
ZV9vcGNvZGVfdCAqKXRtcCk7Cj4KPiBrcHJvYmVfb3Bjb2RlX3QgaXMgdTMyOyBUaGlzIGNhbiB0
cmlnZ2VyIGEgbWlzYWxpZ25lZCBsb2FkLCByaWdodD8KPgo+ID4gKyAgICAgfQo+ID4gKwo+ID4g
KyAgICAgcmV0dXJuIGZhbHNlOwo+ID4gK30KPiA+ICsKPiA+ICBpbnQgX19rcHJvYmVzIGFyY2hf
cHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPiA+ICB7Cj4gPiAgICAgICB1bnNpZ25l
ZCBsb25nIHByb2JlX2FkZHIgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyOwo+ID4gQEAgLTU1LDYg
KzcwLDkgQEAgaW50IF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVfa3Byb2JlKHN0cnVjdCBrcHJvYmUg
KnApCj4gPiAgICAgICBpZiAocHJvYmVfYWRkciAmIDB4MSkKPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIC1FSUxTRVE7Cj4gPgo+ID4gKyAgICAgaWYgKCFhcmNoX2NoZWNrX2twcm9iZShwKSkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuIC1FSUxTRVE7Cj4gPiArCj4gPiAgICAgICAvKiBjb3B5IGlu
c3RydWN0aW9uICovCj4gPiAgICAgICBwLT5vcGNvZGUgPSAqcC0+YWRkcjsKPgo+IE5vdCByZWxh
dGVkIHRvIHlvdXIgcGF0Y2gsIGJ1dCB0aGlzIGNhbiBhbHNvIHRyaWdnZXIgYSBtaXNhbGlnbmVk
IGxvYWQuCkFmdGVyIHJlcmVhZGluZyB0aGUgc3BlYywgbWlzYWxpZ25lZCBsb2FkL3N0b3JlIGlz
IG5vdCBtYW5kYXRvcnkKc3VwcG9ydGVkLiAoQWx0aG91Z2ggbXkgbWFjaGluZXMgYW5kIHFlbXUg
YXJlIGNvcnJlY3QpCgpTbyBJIG5lZWQgZml4dXA6CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvYmVzL2twcm9iZXMuYwpiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVz
LmMKaW5kZXggMjdmODk2MGMzMjFjLi4wYzAxNmQ0OTY3NDYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L2twcm9iZXMuYwpAQCAtNTgsMTIgKzU4LDE0IEBAIHN0YXRpYyBib29sIF9fa3Byb2JlcyBhcmNo
X2NoZWNrX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQogewogICAgICAgIHVuc2lnbmVkIGxvbmcg
dG1wICA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHIgLSBwLT5vZmZzZXQ7CiAgICAgICAgdW5zaWdu
ZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcC0+YWRkcjsKKyAgICAgICBrcHJvYmVfb3Bj
b2RlX3Qgb3Bjb2RlOwoKICAgICAgICB3aGlsZSAodG1wIDw9IGFkZHIpIHsKICAgICAgICAgICAg
ICAgIGlmICh0bXAgPT0gYWRkcikKICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7
CgotICAgICAgICAgICAgICAgdG1wICs9IEdFVF9JTlNOX0xFTkdUSCgqKGtwcm9iZV9vcGNvZGVf
dCAqKXRtcCk7CisgICAgICAgICAgICAgICBtZW1jcHkoJm9wY29kZSwgKHZvaWQgKil0bXAsIHNp
emVvZihrcHJvYmVfb3Bjb2RlX3QpKTsKKyAgICAgICAgICAgICAgIHRtcCArPSBHRVRfSU5TTl9M
RU5HVEgob3Bjb2RlKTsKICAgICAgICB9CgogICAgICAgIHJldHVybiBmYWxzZTsKQEAgLTgwLDcg
KzgyLDcgQEAgaW50IF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVfa3Byb2JlKHN0cnVjdCBrcHJvYmUg
KnApCiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsKCiAgICAgICAgLyogY29weSBpbnN0
cnVjdGlvbiAqLwotICAgICAgIHAtPm9wY29kZSA9ICpwLT5hZGRyOworICAgICAgIG1lbWNweSgm
cC0+b3Bjb2RlLCBwLT5hZGRyLCBzaXplb2Yoa3Byb2JlX29wY29kZV90KSk7CgogICAgICAgIC8q
IGRlY29kZSBpbnN0cnVjdGlvbiAqLwogICAgICAgIHN3aXRjaCAocmlzY3ZfcHJvYmVfZGVjb2Rl
X2luc24ocC0+YWRkciwgJnAtPmFpbnNuLmFwaSkpIHsKCj4KPgo+IEJqw7ZybgoKCgotLSAKQmVz
dCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
