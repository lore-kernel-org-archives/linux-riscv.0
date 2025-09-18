Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E675ECAC5A0
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J56OvqmZZnycF7xhnKNNeey9g9WrRhpodKrAQ9XeRT0=; b=hKJSi12nEDBKnD
	3OugJdV0woMP0j5rgTyyccEDEENC/ZiJxdOYNrPans0EFsbUeNCi3DnSuQwGia58o/nnawukmCKhP
	7fylh4k51LN81b+QF9heFvcGf+GqMfua8u+DYo81vaSIe+oE+jIP+l6iDhdiuRWrpxT7DYORa8Zy7
	3ik8h2yN9Au3vOX881sTbdGDlRu3igUmt8OcyipNqEplU01qvzPat09kNmz5MMNly/JyoFQWgDAq/
	GWC+POWCgqG+aTJrnGD84DOt7R5DBaGJaUjjoa1rZVnPmZsB04fuBx/+SkovlLPqom3wXfNya/j0c
	uN2MSIrgXiEbMUhp4B+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGo4-00000000Sz4-2Jdu;
	Thu, 18 Sep 2025 15:44:24 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGo1-00000000SxE-2x2m
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 15:44:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758210253; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cQ31wtIcpxCw8STZH79II4sLLqH48GbSPk9x7K3sjgfEDTbqWhe56UdHLczAOBGwsTvuzA4yd6C1sXnNYWW/AOXBZtEsE8JAY+JqBT+NS74PrlOtow+YTXkysEW8KgJ7gyTb81oVXc4MO2aKFvp++X4tVvNeMmaiLcUpWv6dFgk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758210253; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EWJtWOApJAqtUNZAqtKfwXuK0FQDLzg3oZD2uJiAT0A=; 
	b=Mk0hhPC8AgIxY4OsSjbzBOCmIYT7w5V2KeaWO2jfmY1vEQGWgSQePUO1XVe2kbTcXkzRPjAf4VkT2FXa79yYP0G/GyCIqFrR3lth4H4Wv4Q17OrgqUDs3jrLD7RneKyexwnpLJTYgKpZAyeFudMhkV0bUIMGA0rIUz+VMawDFRI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758210253;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=EWJtWOApJAqtUNZAqtKfwXuK0FQDLzg3oZD2uJiAT0A=;
	b=CN/+O5LWMbOCeFyTuDGFUMPqtohJt+8vkXQb7ALmD5996AUBib+/6cHShz3rjFwU
	EgQ4d9lmHvXqafp0TCz7xs3avkbN/T+zovTX0dDN99x4j8/3r4SzuUCWObEWlZn1hrQ
	tgvYAhiu/snLjwaB6OOIK5y6nGNIjPahoWQPUE7eadiW6TH+7cqqDtQrAwqN7TNP71k
	T0HKmfp+bulWDsZJligG8rXjcD6W2ZJFvWnZurmFLePg5q3aSXuVXzxwX0b+ZyftjSi
	s37RKrGmv2LcCMUCs/CqL29Vw5uVPI7QZFdQ5Y61BaZvTBdDjDxG3AnY9mAuTu40Hw/
	Bw12ONWGsA==
Received: by mx.zohomail.com with SMTPS id 1758210250244433.79672365963904;
	Thu, 18 Sep 2025 08:44:10 -0700 (PDT)
Message-ID: <89ed15328b73b191fe152cf8559b92239b5596bd.camel@icenowy.me>
Subject: Re: [PATCH 2/2] pmdomain: thead: create auxiliary device for
 rebooting
From: Icenowy Zheng <uwu@icenowy.me>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Sebastian
 Reichel <sre@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Yao Zi
 <ziyao@disroot.org>,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  linux-pm@vger.kernel.org
Date: Thu, 18 Sep 2025 23:44:02 +0800
In-Reply-To: <CAPDyKFombYNFvTsChewQ6cFY2woS+vSb1YUV0Bp_+DcigrFFXA@mail.gmail.com>
References: <20250818074906.2907277-1-uwu@icenowy.me>
	 <20250818074906.2907277-3-uwu@icenowy.me>
	 <CAPDyKFombYNFvTsChewQ6cFY2woS+vSb1YUV0Bp_+DcigrFFXA@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_084421_821937_2FE47477 
X-CRM114-Status: GOOD (  25.75  )
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

5ZyoIDIwMjUtMDktMDTmmJ/mnJ/lm5vnmoQgMTI6MTQgKzAyMDDvvIxVbGYgSGFuc3NvbuWGmemB
k++8mgo+IE9uIE1vbiwgMTggQXVnIDIwMjUgYXQgMDk6NDksIEljZW5vd3kgWmhlbmcgPHV3dUBp
Y2Vub3d5Lm1lPiB3cm90ZToKPiA+IAo+ID4gVGhlIHJlYm9vdCAvIHBvd2VyIG9mZiBvcGVyYXRp
b25zIHJlcXVpcmUgY29tbXVuaWNhdGlvbiB3aXRoIHRoZQo+ID4gQU9OCj4gPiBmaXJtd2FyZSB0
b28uCj4gPiAKPiA+IEFzIHRoZSBkcml2ZXIgaXMgYWxyZWFkeSBwcmVzZW50LCBjcmVhdGUgYW4g
YXV4aWxpYXJ5IGRldmljZSB3aXRoCj4gPiBuYW1lCj4gPiAicmVib290IiB0byBtYXRjaCB0aGF0
IGRyaXZlciwgYW5kIHBhc3MgdGhlIEFPTiBjaGFubmVsIGJ5IHVzaW5nCj4gPiBwbGF0Zm9ybV9k
YXRhLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5t
ZT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL3BtZG9tYWluL3RoZWFkL3RoMTUyMC1wbS1kb21haW5z
LmMgfCAzNQo+ID4gKysrKysrKysrKysrKysrKysrKystLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
MzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcG1kb21haW4vdGhlYWQvdGgxNTIwLXBtLWRvbWFpbnMuYwo+ID4gYi9kcml2ZXJzL3Bt
ZG9tYWluL3RoZWFkL3RoMTUyMC1wbS1kb21haW5zLmMKPiA+IGluZGV4IDkwNDBiNjk4ZTdmN2Yu
LjgyODVmNTUyODk3YjAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3BtZG9tYWluL3RoZWFkL3Ro
MTUyMC1wbS1kb21haW5zLmMKPiA+ICsrKyBiL2RyaXZlcnMvcG1kb21haW4vdGhlYWQvdGgxNTIw
LXBtLWRvbWFpbnMuYwo+ID4gQEAgLTEyOSwxMiArMTI5LDM5IEBAIHN0YXRpYyB2b2lkIHRoMTUy
MF9wZF9pbml0X2FsbF9vZmYoc3RydWN0Cj4gPiBnZW5lcmljX3BtX2RvbWFpbiAqKmRvbWFpbnMs
Cj4gPiDCoMKgwqDCoMKgwqDCoCB9Cj4gPiDCoH0KPiA+IAo+ID4gLXN0YXRpYyB2b2lkIHRoMTUy
MF9wZF9wd3JzZXFfdW5yZWdpc3Rlcl9hZGV2KHZvaWQgKmFkZXYpCj4gPiArc3RhdGljIHZvaWQg
dGgxNTIwX3BkX3VucmVnaXN0ZXJfYWRldih2b2lkICphZGV2KQo+ID4gwqB7Cj4gPiDCoMKgwqDC
oMKgwqDCoCBhdXhpbGlhcnlfZGV2aWNlX2RlbGV0ZShhZGV2KTsKPiA+IMKgwqDCoMKgwqDCoMKg
IGF1eGlsaWFyeV9kZXZpY2VfdW5pbml0KGFkZXYpOwo+ID4gwqB9Cj4gPiAKPiA+ICtzdGF0aWMg
aW50IHRoMTUyMF9wZF9yZWJvb3RfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdAo+ID4g
dGgxNTIwX2Fvbl9jaGFuICphb25fY2hhbikKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVj
dCBhdXhpbGlhcnlfZGV2aWNlICphZGV2Owo+ID4gK8KgwqDCoMKgwqDCoCBpbnQgcmV0Owo+ID4g
Kwo+ID4gK8KgwqDCoMKgwqDCoCBhZGV2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCphZGV2
KSwgR0ZQX0tFUk5FTCk7Cj4gPiArwqDCoMKgwqDCoMKgIGlmICghYWRldikKPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gK8KgwqDCoMKg
wqDCoCBhZGV2LT5uYW1lID0gInJlYm9vdCI7Cj4gPiArwqDCoMKgwqDCoMKgIGFkZXYtPmRldi5w
YXJlbnQgPSBkZXY7Cj4gPiArwqDCoMKgwqDCoMKgIGFkZXYtPmRldi5wbGF0Zm9ybV9kYXRhID0g
YW9uX2NoYW47Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHJldCA9IGF1eGlsaWFyeV9kZXZpY2Vf
aW5pdChhZGV2KTsKPiA+ICvCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHJldCA9
IGF1eGlsaWFyeV9kZXZpY2VfYWRkKGFkZXYpOwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAocmV0KSB7
Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhdXhpbGlhcnlfZGV2aWNlX3VuaW5p
dChhZGV2KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4g
PiArwqDCoMKgwqDCoMKgIH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIGRldm1fYWRk
X2FjdGlvbl9vcl9yZXNldChkZXYsCj4gPiB0aDE1MjBfcGRfdW5yZWdpc3Rlcl9hZGV2LAo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRldik7Cj4gCj4gV2UgaGF2ZSBkZXZtX2F1eGlsaWFyeV9k
ZXZpY2VfY3JlYXRlKCkgbm93LCBJIHN1Z2dlc3Qgd2UgdXNlIHRoYXQKPiBpbnN0ZWFkLgoKU2hv
dWxkIEkgc2VuZCBhIHYyIHRvIGNvbnZlcnQgdG8gdXNlIHRoaXM/Cgo+IAo+IFRoYXQgc2FpZCwg
SSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGNvbnZlcnQgdGhlIHB3cnNlcS1ncHUKPiBh
dXhpbGlhcnkgZGV2aWNlIHRvIGJlIHJlZ2lzdGVyZWQgd2l0aCBkZXZtX2F1eGlsaWFyeV9kZXZp
Y2VfY3JlYXRlKCkKPiB0b28sIGJ1dCB0aGF0J3MgYSBzZXBhcmF0ZSBjaGFuZ2UsIG9mIGNvdXJz
ZS4KPiAKPiA+ICt9Cj4gPiArCj4gPiDCoHN0YXRpYyBpbnQgdGgxNTIwX3BkX3B3cnNlcV9ncHVf
aW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiDCoHsKPiA+IMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBhdXhpbGlhcnlfZGV2aWNlICphZGV2Owo+ID4gQEAgLTE2OSw3ICsxOTYsNyBAQCBzdGF0aWMg
aW50IHRoMTUyMF9wZF9wd3JzZXFfZ3B1X2luaXQoc3RydWN0Cj4gPiBkZXZpY2UgKmRldikKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ID4gwqDCoMKgwqDC
oMKgwqAgfQo+ID4gCj4gPiAtwqDCoMKgwqDCoMKgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoZGV2LAo+ID4gdGgxNTIwX3BkX3B3cnNlcV91bnJlZ2lzdGVyX2FkZXYsCj4gPiArwqDC
oMKgwqDCoMKgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LAo+ID4gdGgxNTIw
X3BkX3VucmVnaXN0ZXJfYWRldiwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZGV2KTsKPiA+
IMKgfQo+ID4gCj4gPiBAQCAtMjM1LDYgKzI2MiwxMCBAQCBzdGF0aWMgaW50IHRoMTUyMF9wZF9w
cm9iZShzdHJ1Y3QKPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+IMKgwqDCoMKgwqDCoMKg
IGlmIChyZXQpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfY2xl
YW5fcHJvdmlkZXI7Cj4gPiAKPiA+ICvCoMKgwqDCoMKgwqAgcmV0ID0gdGgxNTIwX3BkX3JlYm9v
dF9pbml0KGRldiwgYW9uX2NoYW4pOwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAocmV0KQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfY2xlYW5fcHJvdmlkZXI7Cj4gPiAr
Cj4gPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPiA+IAo+ID4gwqBlcnJfY2xlYW5fcHJvdmlk
ZXI6Cj4gPiAtLQo+ID4gMi41MC4xCj4gPiAKPiAKPiBPdGhlcndpc2UgdGhpcyBsb29rcyBnb29k
IHRvIG1lIQo+IAo+IEtpbmQgcmVnYXJkcwo+IFVmZmUKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
