Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB70F557F8
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1D/oTsUb4OUnhCJwhOTvc8u0Nh9b0ZjkzNt48FWM/4=; b=SsejRromsh1f4v
	Re6ddZGO6n55HG8aGHL0DL6MDfG+VVZqf6Z7RitLcHnbGWrGi1r7ZSyjZ4RqGcQXOKBEbyXu5W08i
	ug0Ej9CCtD1LDIkmuiflucMHIO7kIQlFNKO9DzmCFmj/JgfiAKaOfRq5SpkFRR9C/fZcHj0IqursP
	jfi6Zh/CoDYK71tmaTOjTbzeVFeLwJG8yIa1tUC62Zx6zES/ek0Ej3FmjT8z8F0M5vEtqNuXYlRnv
	ifjuH8MnZkIPKt/VnnkBvK35I85eLHciHReihYbpcYB+QghUy4dotIlnvjPNByqKVA4HniB/3wEu1
	S1aZy2nWAphrbOoA1noA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEl3M-00000006gdG-1gYD;
	Mon, 20 Apr 2026 09:36:28 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEl3J-00000006gbr-35SU
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 09:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776677728;
	bh=vkXbNIbR++h6pZ5ZhTdpzW0zQcZfR0zYZFiVasZtcwg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=RNMavfEnHGeIXIR2WX2E9pqZKrPbPU3i4fDvOFKZ+ZfK6hMcTlw1mJcYirCxAX6r9
	 +tpRBWgx7o7x0XoIZJKRzMcF959l4pDxVPT2CdIjZZKLsC5aT3tVMWouulMrEqG67S
	 I3g+Yb375iACDTVGd34YY8HrthNr2n2Jx6E1m/PU=
X-QQ-mid: zesmtpgz7t1776677719t20d36658
X-QQ-Originating-IP: L8IWvy8kdMykC/iQ/0qMSe0QQFM6oUby0IAkvkRc1Dg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Apr 2026 17:35:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14122269761632793100
EX-QQ-RecipientCnt: 16
Mime-Version: 1.0
Date: Mon, 20 Apr 2026 17:35:17 +0800
Message-Id: <DHXVORP1EJ4M.1ZOO1F7UVW11@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
 <dfa3f1a7-f4c6-4655-94c0-326f88db3896@kernel.org>
 <87ef529e-b591-49f5-9fc9-3099672e2f0f@kernel.org>
 <DHXUQHVK4XRN.3CVZ3GH75L4L4@linux.spacemit.com>
 <20260420090936-GKB203300@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.5595e961.9ee2.4959.8935.9a8f33812b0c@feishu.cn>
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.5595e961.9ee2.4959.8935.9a8f33812b0c@feishu.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MPdt/VLAwDAhPVv2RvmA1OwiOcYFyYQN35PY37hykm9uXNkbEeD/bnZ4
	KgnPYhnI+LXTc9c9Skdoa/6qb1aYHCKbCc6HoBGZjHbJxgXEcD7tLtBnHQZwc55YtUI/IE0
	rrHwdhkTHhdH/BhYYilg28O7X17U7sQHwC3olzxoZ2pY4xZISciRMG+Zsd05S4DtYZ1JB5C
	ZI67CwoBRFpfwZ9Ge4tylQmvHCEST1eYi5qaTxND6DLLyr5FRv2+WULv42buzSCBpIY4w4D
	9Hm94s0kiBVkt9z1o1AEa2bN2L93+UdJDFh5hVQ/ShhjK/75CNUsLNEfCY5m3Y0L7VY0XhJ
	RlLHspOF9RmztWS7wiG8SC+S+dwMf9DAqyAP2QDXerHNPlxkhrP/g8GQm4BJgfzJPQfMYa1
	oHT44Y55Q6zR/d8TqmI6Bnbh7ouYAOAKwLrnWMaaSNlPZ2RNV9QNyKHzztp0yN244nQ1lZu
	SIsahEjYpsNrqunErgtMT9uogkWM7IF3oDmdfCFwZ+OFG9vmC/aibzBgrgLHVpsvKsppwAa
	y53+s8S87CFiP8jwJig+vfu1BRRjsk6NAUb/ogNoxc/LFxPdJx/s2//3ejopsuj6AqnsaX3
	gXz5TKVe25Nc7BT255qEz0+OpOdD0ut1dU3r+voffqEXt3zcFAorlbpgmKjTwD2OimIv5BJ
	zy2ErJRr4Tj1Q1NBjDSHDlvbzHFq+lAKoi+e9p512B1VzGFTYjZu60zUSt4ceBveup8CVrg
	xjtKwjcdVzF15qR5RWH1C7qcMeaKnw27f++aGNRE4sPZzML+VgOOIOlhajkjns+QFOo9dYf
	KxhyOrVgb1l9kNViPIlYkz5Hfi9baZ42g0HhflKJuENsQVA3LeIW8oOxzArS5RZQ+fK31PC
	I889AD95Sc9poW5oP4V4dAJS2wo3ehAwg37gOdW09CzsdZP8+8FUzjP0B/fQrR2zdEdgv7j
	rSmimkxIuqLp+4ZpjLOOg4wIy5DRRKkc360L993YnJXRhoxZK7ARKK7G5KNZxTpKyVqaEt+
	vZkkFxK03f2ndDtlM5uHjVH5hBVYIT+VqKZQW6Q91HJwmV+QtZBRhqYkNMkIvllGbWpt+D+
	L7NJd+z7Mimq7mgcVORvyEaI8qckJOIZod/UkWhoQ/2
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_023626_130193_54277187 
X-CRM114-Status: GOOD (  16.50  )
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

T24gTW9uIEFwciAyMCwgMjAyNiBhdCA1OjI2IFBNIENTVCwgU2FuZGllIENhbyB3cm90ZToKPiBI
aSwgTGFuICYgVHJveSAmIEtyenlzenRvZiA6Cj4KPj4gRnJvbTogIllpeHVuIExhbiI8ZGxhbkBr
ZXJuZWwub3JnPgo+PiBEYXRlOsKgIE1vbiwgQXByIDIwLCAyMDI2LCAxNzowOQo+Cj4+IEhpIFRy
b3ksCj4+wqAKPj4gT24gMTY6NTAgTW9uIDIwIEFwciDCoCDCoCAsIFRyb3kgTWl0Y2hlbGwgd3Jv
dGU6Cj4+ID4gT24gTW9uIEFwciAyMCwgMjAyNiBhdCA0OjQ0IFBNIENTVCwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPj4gPiA+IE9uIDIwLzA0LzIwMjYgMTA6NDMsIEtyenlzenRvZiBLb3ps
b3dza2kgd3JvdGU6Cj4+ID4gPj4gT24gMjAvMDQvMjAyNiAxMDozOSwgU2FuZGllIENhbyB3cm90
ZToKPj4gPiA+Pj4gRml4IGR0Y2hlY2sgaXNzdWU6IGNvbXBhdGlibGU6MDogJ3NwYWNlbWl0LGsx
LWkyYycgd2FzIGV4cGVjdGVkCj4+ID4gPj7CoAo+PiA+ID4+IE1pc3Npbmcgc3BhY2UgYWZ0ZXIg
bWFpbiBjb21taXQgbXNnLgo+PiA+ID4+wqAKPj4gPiA+Pj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiA+ID4+PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNjA0MTQwMjU5LmVLRGF4S3VhLWxrcEBpbnRlbC5jb20vCj4+ID4gPj4+
Cj4+ID4gPgo+PiA+ID4gQWxzbywgdGhlIGZpbGUgcmVwb3J0ZWQgaW4gYWJvdmUgd2FybmluZyBE
T0VTIE5PVCBFWElTVCAoSSBjaGVja2VkCj4+ID4gPiBuZXh0LTIwMjYwNDE0KS4KPj4gPiBJbiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zcGFjZW1pdCxrMS1waW5j
dHJsLnlhbWw6Cj4+ID7CoAo+PiA+IHByb3BlcnRpZXM6Cj4+ID4gwqAgY29tcGF0aWJsZToKPj4g
PiDCoCDCoCBlbnVtOgo+PiA+IMKgIMKgIMKgIC0gc3BhY2VtaXQsazEtcGluY3RybAo+PiA+IMKg
IMKgIMKgIC0gc3BhY2VtaXQsazMtcGluY3RybAo+PiA+wqAKPj4gSSB0aGluayB5b3UgcmVmZXIg
dG8gd3JvbmcgZmlsZSwgd2hpY2ggc2hvdWxkIGJlCj4+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9zcGFjZW1pdCxrMS1pMmMueWFtbAo+PsKgCj4+ID4gU28gdGhlcmUn
cyBubyByZWFzb24gdG8gdXNlIGsxLWkyYy4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIHdoaWxlIHRo
ZXkgYXJlIHRoZSBzYW1lIElQLAo+PiA+IHRoZXJlIGFyZSBzdWJ0bGUgZGlmZmVyZW5jZXMgYmV0
d2VlbiB0aGVtLgo+PiA+wqAKPj4gQnV0IHllcywgdGhlIGlkZWEgaXMgY29ycmVjdCwgc28gTkFL
IHRvIHRoaXMgcGF0Y2gKPj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAtIFRyb3kKPj7CoAo+PiAtLcKgCj4+IFlpeHVuIExhbiAoZGxhbikKPj7C
oAo+Cj4gUGxlYXNlIGtub3cgdGhhdCwgSSBzZW5kIHBhdGNoWzFdIHRvIGFkZCBEZWVwQ29tcHV0
aW5nIEZNTDEzVjA1IGJvYXJkIGRldmljZSB0cmVlLsKgIFRoZSBwYXRjaCBpcyBiYXNlZCBvbiBr
MS9kdC1mb3ItbmV4dFsyXS7CoAo+IEFuZCBpdCBtZWV0cyBkdHNjaGVjayBpc3N1ZToKPiBSZXBv
cnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwNDE0MDI1OS5lS0RheEt1YS1sa3BAaW50ZWwuY29t
Lwo+Cj4gT24gazEvZHQtZm9yLW5leHQsIGl0IGRvZXNuJ3QgaGF2ZSBzcGFjZW1pdCxrMy1pMmMg
aW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9zcGFjZW1pdCxrMS1pMmMu
eWFtbC4KPiBPciBJIHVzZSB0aGUgd3JvbmcgYnJhbmNoP8KgClllcy4uLiBZb3UgYXJlIHVzaW5n
IGEgd3JvbmcgYnJhbmNoIEkgdGhpbmsuIApUaGUgazEvZHQtZm9yLW5leHQgYnJhbmNoIGluIHRo
aXMgcmVwbyBpcyBEbGFu4oCZcyB0cmVlLiBTaW5jZSBEVCBiaW5kaW5ncyBhcmUgbm90IHdpdGhp
bgpoaXMgcHVydmlldywgdGhleSBhcmVuJ3QgaW5jbHVkZWQgdGhlcmUuIEkgb25seSBtZW50aW9u
ZWQgdGhpcyByZXBvc2l0b3J5IGVhcmxpZXIgdG8Kc2hvdyB0aGF0IHRoZSBVQVJUIHBvcnRpb24g
b2YgdGhlIHBpbmN0cmwgZHRzaSBoYXMgYWxyZWFkeSBiZWVuIG1lcmdlZCBpbnRvIGl0OwppdCB3
YXNuJ3QgaW50ZW5kZWQgdG8gYmUgdXNlZCBhcyB5b3VyIGRldmVsb3BtZW50IGJhc2UuCj4KPiBB
bmQgd2hhdCBzaG91bGQgSSBkbyBmb3IgbXkgcGF0Y2hbMV0gPyDCoApJIHRoaW5rIHlvdSBjYW4g
dXNlIG5leHQtMjAyNjA0MTcgYXMgeW91ciBiYXNlIGNvbW1pdC4KRXZlcnl0aGluZyB5b3UgbmVl
ZCBpcyBhdmFpbGFibGUgaGVyZS4KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgLSBUcm95Cj4KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNDEzMDYw
NTI0LjEyMzU5ODItMS1zYW5kaWUuY2FvQGRlZXBjb21wdXRpbmcuaW8vCj4gWzJdIGh0dHBzOi8v
Z2l0aHViLmNvbS9zcGFjZW1pdC1jb20vbGludXgvdHJlZS9rMS9mb3ItbmV4dCMKPgo+IEJlc3Qg
cmVnYXJkcwo+IFNhbmRpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
