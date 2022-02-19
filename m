Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7177C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Feb 2022 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqg8qWnnaYh98uxsm6R98pJmRa8ig4GrAIAl8oAIilY=; b=ehDJn5autPu6Hu
	S5b94WGAoV5icGrtJi9gMmkOfYVaGgfqweLf3mBien1XO4XlCqqGokIxHHyqPAiqkWvmFDFNy4H8t
	8SXx+6RDnIVhi4KbqUgwb82SZn2tr93QClWlkGDC6WWCRPO31WkM8RYK3aNO75HIx8YiLo/g6GK18
	r4ZyiyIlPyg4sEKAUZsg10QiBD7gMrcxCgyRHiivvZUULfFQgc5zzx4WRyOP2kEI+nmvkrHAlsHzE
	dXJ3AbayCT2t1tWYM0hYYVCpovAnUFhdUFtfAYKhf8+YqkRq0D75FR17l9WLb9dbeupiJcrqfdIcE
	rKQs/kyU5vv+mF5uzNDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLQzt-00H5zd-LK; Sat, 19 Feb 2022 14:46:05 +0000
Received: from out28-197.mail.aliyun.com ([115.124.28.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLQzp-00H5xw-7t
 for linux-riscv@lists.infradead.org; Sat, 19 Feb 2022 14:46:04 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.0903952|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0665288-8.09977e-05-0.93339;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=9; RT=9; SR=0; TI=SMTPD_---.MsSaWGO_1645281943; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.MsSaWGO_1645281943)
 by smtp.aliyun-inc.com(33.37.75.142); Sat, 19 Feb 2022 22:45:52 +0800
Message-ID: <6ff70d9fbbfcde860823aa24f0ce58a0a96a1c91.camel@nucleisys.com>
Subject: Re: [PATCH 00/12] Initial support for Nuclei DemoSoC w/ UX600
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
 linux-spi@vger.kernel.org
Date: Sat, 19 Feb 2022 22:45:43 +0800
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_064602_117894_72A6404D 
X-CRM114-Status: GOOD (  14.09  )
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

5ZyoIDIwMjItMDEtMjfmmJ/mnJ/lm5vnmoQgMjM6MTYgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ
6YGT77yaCj4gVGhpcyBwYXRjaHNldCBhZGRzIHN1cHBvcnQgZm9yIE51Y2xlaSBEZW1vU29DICh3
aGljaCBpcyBhbiBldmFsdWF0aW9uCj4gcGxhdGZvcm0gbWFkZSB3aXRoIE51Y2xlaSBDUFUgY29y
ZXMgYW5kIG1haW5seSBwZXJpcGhlcmFscyBpbgo+IG9yaWdpbmFsCj4gSHVtbWluZ2JpcmQgRTIw
MyBwcm9qZWN0LCBydW5uaW5nIG9uIEZQR0EpIHdpdGggVVg2MDAgQ1BVIGNvcmVzLgo+IAo+IE1v
c3QgcGF0Y2hlcyBhcmUgZm9yIERUIGJpbmRpbmdzLCB0aGUgcmVtYWluaW5nIG9uZXMgYXJlIGFk
ZGluZyBhCj4gS2NvbmZpZyBvcHRpb24gYW5kIHNvbWUgRFRTL0RUU0kgZmlsZXMuIFRoZSBsYXN0
IG9uZSBpcyBhIHdvcmthcm91bmQKPiBmb3IKPiBhIHNldmVyZSBidWcgaW4gY3VycmVudGx5IHJl
bGVhc2VkIHZlcnNpb25zIG9mIFVYNjAwLCB3aGljaCBpcyBmb3VuZAo+IGluIDUuMTcga2VybmVs
LCBpbiB3aGljaCBTdjQ4IHN1cHBvcnQgaXMgYWRkZWQgdG8gTGludXguCj4gCj4gVHdvIG5vbi10
ZWNobmljYWwgcGF0Y2hlcyBhcmUgaW4gdGhpcyBwYXRjaHNldCB0b28sIGZvciBNQUlOVEFJTkVS
Uwo+IGFuZCAubWFpbG1hcCBpdGVtcy4KClBpbmcsIGNvdWxkIGFueSBSSVNDLVYgbWFpbnRhaW5l
cnMgcmV2aWV3IHRoZXNlIHBhdGNoZXMsIGVzcGVjaWFsbHkgdGhlClNBVFAgd29ya2Fyb3VuZCBv
bmU/Cgo+IAo+IEljZW5vd3kgWmhlbmcgKDEyKToKPiDCoCBkdC1iaW5kaW5nczogdmVuZG9yLXBy
ZWZpeGVzOiBhZGQgTnVjbGVpCj4gwqAgUklTQy1WOiBhZGQgTnVjbGVpIFNvQyBLY29uZmlnIG9w
dGlvbgo+IMKgIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIGNvbXBhdGlibGUgc3RyaW5ncyBmb3Ig
TnVjbGVpIFVYNjAwIHNlcmllcwo+IMKgIGR0LWJpbmRpbmdzOiB0aW1lcjogYWRkIGNvbXBhdGli
bGUgZm9yIE51Y2xlaSBVWDYwMCBDTElOVC1jb21wYXQKPiB0aW1lcgo+IMKgIGR0LWJpbmRpbmdz
OiBpbnRlcnJ1cHQtY29udHJvbGxlcjogYWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciBVWDYwMAo+
IMKgwqDCoCBQTElDCj4gwqAgZHQtYmluZGluZ3M6IHNlcmlhbDogYWRkIGNvbXBhdGlibGUgc3Ry
aW5nIGZvciBOdWNsZWkgRGVtb1NvQyBVQVJUCj4gwqAgZHQtYmluZGluZ3M6IHNwaTogYWRkIGNv
bXBhdGlibGUgc3RyaW5nIGZvciBOdWNsZWkgRGVtb1NvQyBTUEkKPiDCoCBkdC1iaW5kaW5nczog
cmlzY3Y6IGFkZCBiaW5kaW5nIGZvciBOdWNsZWkgcGxhdGZvcm0gYm9hcmRzCj4gwqAgcmlzY3Y6
IGR0czogYWRkIGRldmljZSB0cmVlIGZvciBOdWNsZWkgRGVtb1NvQyB3LyBVWDYwMCBvbiBERFIy
MDBUCj4gwqAgUklTQy1WOiB3b3JrYXJvdW5kIE51Y2xlaSBVWDYwMCBjb3JlcyB3aXRoIGJyb2tl
biBTQVRQIENTUgo+IMKgIE1BSU5UQUlORVJTOiBhZGQgbXlzZWxmIGFzIE51Y2xlaSBTb0NzL0NQ
VXMgc3VwcG9ydGVyCj4gwqAgbWFpbG1hcDogYWRkIEljZW5vd3kgWmhlbmcncyBOdWNsZWkgbWFp
bCBhZGRyZXNzZXMKPiAKPiDCoC5tYWlsbWFwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+IMKg
Li4uL3NpZml2ZSxwbGljLTEuMC4wLnlhbWzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMSArCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlh
bWzCoMKgwqDCoMKgwqAgfMKgIDcgKysKPiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L251Y2xlaS55YW1swqDCoMKgwqAgfCAyNyArKysrKysrKwo+IMKgLi4uL2JpbmRpbmdzL3Nlcmlh
bC9zaWZpdmUtc2VyaWFsLnlhbWzCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4gwqAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcGkvc3BpLXNpZml2ZS55YW1swqDCoCB8wqAgMSArCj4gwqAuLi4vYmlu
ZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWzCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+
IMKgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWzCoCB8wqAgMiAr
Cj4gwqBNQUlOVEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3ICsrCj4gwqBhcmNoL3Jpc2N2L0tjb25m
aWcuc29jc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2
ICsrCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMSArCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL251Y2xlaS9NYWtl
ZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyICsKPiDCoC4uLi9kdHMvbnVjbGVpL251Y2xl
aS1kZW1vc29jLWRkcjIwMHQuZHRzacKgwqDCoCB8IDQxICsrKysrKysrKysrKwo+IMKgLi4uL251
Y2xlaS9udWNsZWktZGVtb3NvYy11eDYwMC1kZHIyMDB0LmR0c8KgwqAgfCAxMyArKysrCj4gwqAu
Li4vYm9vdC9kdHMvbnVjbGVpL251Y2xlaS1kZW1vc29jLXV4NjAwLmR0c2kgfCA0OSArKysrKysr
KysrKysrKwo+IMKgLi4uL3Jpc2N2L2Jvb3QvZHRzL251Y2xlaS9udWNsZWktZGVtb3NvYy5kdHNp
IHwgNjcKPiArKysrKysrKysrKysrKysrKysrCj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zl
bmRvcmlkX2xpc3QuaMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPiDCoGFyY2gvcmlzY3YvbW0vaW5p
dC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAx
NyArKysrKwo+IMKgMTggZmlsZXMgY2hhbmdlZCwgMjQ1IGluc2VydGlvbnMoKykKPiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NAo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9u
dWNsZWkueWFtbAo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvbnVj
bGVpL01ha2VmaWxlCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9u
dWNsZWkvbnVjbGVpLWRlbW9zb2MtCj4gZGRyMjAwdC5kdHNpCj4gwqBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9ib290L2R0cy9udWNsZWkvbnVjbGVpLWRlbW9zb2MtdXg2MDAtCj4gZGRy
MjAwdC5kdHMKPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL251Y2xl
aS9udWNsZWktZGVtb3NvYy0KPiB1eDYwMC5kdHNpCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9ib290L2R0cy9udWNsZWkvbnVjbGVpLWRlbW9zb2MuZHRzaQo+IAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
