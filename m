Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B75EA794A
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nMb8BNBRUkqe045jzzWkNRoIqnW5oT+1vyxWplczaI=; b=c7jMFYljLJQZmn
	vYMYfsvlSweBGo1SHRl8v7R8ULP9II+uLtWrzF52M7O9FB4dfJL+YJkX+xeoL/+bTKPQo7QFyHoOu
	cnhSNUmjxnzXBmFM1xSNQI+32N3lp709Ae0U6wuZWzy/heY+tOMcGXVC73d8NhYlo+nYsXgsuYicR
	BxnIbRxITOUK+NqShNhslGAIxzuVF31057rq0ETndkvlegQdFPgoMsvVGne6f3CVBIJoQD57AoO4j
	1NZq3lElmkQQmyTlzgICERS7ka2cer5nfRYV+dDoCrG9XJomDUlszebJtP37pFPpDYxUuAcvGe3yL
	l394tNf/Lp+aU2MBa5QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnm7Y-00000009AeO-2Vni;
	Wed, 04 Feb 2026 23:17:16 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnm7U-00000009AdI-2rXe
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 23:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1770247000;
	bh=Gr09QrK6YVeG5HFkhtTTBy0LuiyxgEZg1zUEjeKVLC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L5T+Srbkp+1431z+6OhSUcj2+Q/RWbaAD0QZ5u0LxXQUkMuWdu5bLtZhnX2pjnlgB
	 b62bMK7TuE85eX6ovj4+xFPnx6Nt9poO1K+3DdGbSR1VYPRq/C4cgxvjnCWnWe4C9F
	 YT4kSsiXtZIRRcedRCzHJl8YYN+0+4OQBL6fubB9quAWz0P9n4RczdTtHiR54Ul0Ll
	 1UTSFdAdI2KdoLgljnYfZ9KfG/eU8FIB3O7Z9U2ZtujKK5DNa+veZfJXVuHhcEztqE
	 r1IaoF3K0GGobpXvYPPDjKgxBUquOKpZTbY7r0QkXRLB7J7dzkM+WsnzMQaEiG7L7i
	 2WhmKhnw5BTMA==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 7A695B220741;
	Thu,  5 Feb 2026 00:16:38 +0100 (CET)
Message-ID: <e2394c64-af36-428f-ad6e-4c7038c0301e@freeshell.de>
Date: Wed, 4 Feb 2026 15:16:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: dts: starfive: Milk-V Mars CM Lite broken-cd
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260204101602.30184-1-heinrich.schuchardt@canonical.com>
 <46d5d249-8cf2-46d1-a90c-1f2c5f146e15@canonical.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <46d5d249-8cf2-46d1-a90c-1f2c5f146e15@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_151713_189816_98814960 
X-CRM114-Status: GOOD (  20.30  )
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

SGksCgpJIHRoaW5rIHRoZSBjb3JyZWN0IGZpeCB3aWxsIGJlIGRldmljZSB0cmVlIG92ZXJsYXlz
IHBlci1jYXJyaWVyIGJvYXJkCmFuZCBub3QgdGhpcyBvbmUtc2l6ZS1maXRzLWFsbCB3b3JrYXJv
dW5kIHdpdGggdGhlIFN5c3RlbS1vbi1Nb2R1bGUuClJldmlldyBiZWxvdzoKCk9uIDIvNC8yNiAw
ODozOCwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToKPiBPbiAyLzQvMjYgMTE6MTYsIEhlaW5y
aWNoIFNjaHVjaGFyZHQgd3JvdGU6Cj4+IFRoZSBjYXJkIGRldGVjdCBHUElPIGRlcGVuZHMgb24g
c3VwcG9ydCBieSB0aGUgYmFzZSBib2FyZC4KPj4KPj4gRGV0ZWN0aW5nIGFuIFNELWNhcmQgZGlk
IG5vdCB3b3JrIGZvciBtZSB3aXRoIGEgTWlsay1WIE1hcnMgQ00gTGl0ZQo+PiBtb3VudGVkIG9u
IGFuIFdhdmVzaGFyZSBDTTQtSU8tQkFTRS1BIGJvYXJkLgo+IAo+IFRoZSBzY2hlbWF0aWMgb2Yg
dGhlIFdhdmVzaGFyZSBDTTQtSU8tQkFTRS1BIGJvYXJkIGlzIGF2YWlsYWJsZSBhdAo+IGh0dHBz
Oi8vZmlsZXMud2F2ZXNoYXJlLmNvbS91cGxvYWQvYS9hYS9DTTQtSU8tQkFTRS1BX1Y0X1NjaERv
Yy5wZGYKPiBzaG93aW5nIHBpbiA3NiBpcyBub3QgY29ubmVjdGVkLgo+IAo+IEluIGh0dHBzOi8v
Zm9ydW1zLnJhc3BiZXJyeXBpLmNvbS92aWV3dG9waWMucGhwP3Q9MjkxMDQxIHRoZSBSYXNwYmVy
cnkKPiBGb3VuZGF0aW9uIGV4cGxpY2l0bHkgd3JvdGUgdGhhdCBwaW4gNzYgc2hvdWxkIG5vdCBi
ZSBjb25uZWN0ZWQgd2hlbgo+IHVzaW5nIGEgY29tcHV0ZSBtb2R1bGUgc29ja2V0Lgo+IAo+IEUu
IFNoYXR0b3cgcG9pbnRlZCBtZSB0byBhIGJvYXJkCj4gaHR0cHM6Ly9naXRodWIuY29tL05hYnVD
YXNhL3llbGxvdy9yZWxlYXNlcy9kb3dubG9hZC92MS4zYy8KPiBZZWxsb3dfdjEuM2NfU2NoZW1h
dGljX2dpdC44OTU3YjQ0MGFkZGEucGRmCj4gdGhhdCBhY3R1YWxseSBkaXNyZWdhcmRlZCB0aGlz
IGFkdmljZSBhbmQgdXNlcyBwaW4gNzYgYWN0dWFsbHkgYXMgY2QtCj4gZ3Bpby4gVGhpcyB1c2Fn
ZSBvZiBHUElPIDQxIGlzIGEgcHJvcGVydHkgb2YgdGhlIHNwZWNpZmljIGJhc2UgYm9hcmQgYW5k
Cj4gbm90IG9mIHRoZSBNaWxrLVYgTWFycyBDTSBhbmQgc2hvdWxkIGJlIGRlc2NyaWJlZCBpbiBh
IGRldmljZS10cmVlCj4gb3ZlcmxheSBpZiBuZWVkZWQuCj4gCj4gQmVzdCByZWdhcmRzCj4gCj4g
SGVpbnJpY2gKPiAKPj4KPj4gQWNjb3JkaW5nIHRvIFsxXSBTRF9TRElPMF9DRF9HUElPNDEgaXMg
Y29ubmVjdGVkIHRvIHBpbiA3NiByZXNlcnZlZC4KPj4gVGhlIFJhc3BiZXJyeSBQaSBDb21wdXRl
IE1vZHVsZSA0IElPIEJvYXJkIGRvY3VtZW50YXRpb24gbWFya3MgdGhhdAo+PiBwaW4gYXMKPj4g
cmVzZXJ2ZWQuIFRoZSBSYXNwYmVycnkgUGkgQ29tcHV0ZSBNb2R1bGUgNSBJTyBCb2FyZCBkb2N1
bWVudGF0aW9uCj4+IG1hcmtzIHRoZSBwaW4gYXMgVkJBVC4KPj4KPj4gUmVtb3ZlIHRoZSBjZC1n
cGlvcyBkZWZpbml0aW9uIGFuZCBhZGQgYnJva2VuLWNkLgo+Pgo+PiBbMV3CoCBodHRwczovL2dp
dGh1Yi5jb20vbWlsa3YtbWFycy9tYXJzLWZpbGVzL2Jsb2IvbWFpbi9NYXJzLQo+PiBDTV9IYXJk
d2FyZV9TY2hlbWF0aWNlcy9NaWxrLVZfTWFycy1DTV9TQ0hfVjEuMC0yMDIzLTA5MDVfTGl0ZS5w
ZGYKPj4KPj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2No
dWNoYXJkdEBjYW5vbmljYWwuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9z
dGFyZml2ZS9qaDcxMTAtbWlsa3YtbWFyc2NtLWxpdGUuZHRzIHwgMiArLQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnNjbS1saXRlLmR0
cwo+PiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLW1pbGt2LW1hcnNjbS1s
aXRlLmR0cwo+PiBpbmRleCA2M2FhOTRkNjVhYjU1Li41NjZiMGJkYzI4MDBkIDEwMDY0NAo+PiAt
LS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1taWxrdi1tYXJzY20tbGl0
ZS5kdHMKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtbWlsa3Yt
bWFyc2NtLWxpdGUuZHRzCj4+IEBAIC0xMyw3ICsxMyw3IEBAIC8gewo+PiDCoCDCoCAmbW1jMCB7
Cj4+IMKgwqDCoMKgwqAgYnVzLXdpZHRoID0gPDQ+OwoKKyAvKiBTY2hlbWF0aWMgc2lnbmFsIFNE
X1NESU8wX0NEX0dQSU80MSB0byBDTTQgY29ubmVjdG9yIHBpbiA3NiovCisgLyogUmFzcGJlcnJ5
IFBpIENNNCBzcGVjaWZpY2F0aW9uIHBpbiA3NiByZXNlcnZlZCBkbyBub3QgY29ubmVjdCAqLwoK
Pj4gLcKgwqDCoCBjZC1ncGlvcyA9IDwmc3lzZ3BpbyA0MSBHUElPX0FDVElWRV9MT1c+Owo+PiAr
wqDCoMKgIGJyb2tlbi1jZDsKCkFsbCBzY2hlbWF0aWMgZG9jdW1lbnRzIGZvciBNYXJzIENNIExp
dGUgbGlzdCB0aGlzIHNpZ25hbCBuYW1lIGFzCmBTRF9TRElPMF9DRF9HUElPNDFgLgoKPj4gwqDC
oMKgwqDCoCBkaXNhYmxlLXdwOwo+PiDCoCB9Owo+PiDCoCAKClRoZSBjYXJyaWVyIGJvYXJkIEkg
aGF2ZSBhIHNjaGVtYXRpYyBkb2N1bWVudCBmb3IgLSBIb21lIEFzc2lzdGFudApZZWxsb3cgUG9F
IHJldiAxLjMgLSBsaXN0cyB0aGlzIGFzIFNEX0RFVEVDVCwgYXBwYXJlbnRseSBpZ25vcmluZyB0
aGUKUmFzcGJlcnJ5IFBpIEZvdW5kYXRpb24gZG9jdW1lbnQgYWJvdXQgQ000IENvbXB1dGUgSU8g
c3BlY2lmaWNhdGlvbiB0aGF0CmV4cGxpY2l0bHkgc2F5cyBkbyBub3QgY29ubmVjdCB0aGlzIHBp
biB0byBhbnl0aGluZy4KClRoZSBjYXJyaWVyIGJvYXJkIEkgZG8gbm90IGhhdmUgYSBzY2hlbWF0
aWMgZG9jdW1lbnQgZm9yIC0gREZSb2JvdApDb21wdXRlIE1vZHVsZSA0IElvVCBSb3V0ZXIgQm9h
cmQgTWluaSAtIG9ubHkgaGFzIFNEIENhcmQgYW5kIGlzCm9wZXJhdGlvbmFsIGFzLWlzLgoKVGhl
IGNvbXBhdGliaWxpdHkgaXNzdWUgZm9yIGNhcnJpZXIgYm9hcmRzIHRoYXQgbW9yZSBzdHJpY3Rs
eSBmb2xsb3cgdGhlClJhc3BiZXJyeSBQaSBDTTQgSU8gc3BlY2lmaWNhdGlvbiBtYXkgYmUgYmV0
dGVyIGhhbmRsZWQgYnkgZGV2aWNlIHRyZWUKb3ZlcmxheXMuIFRob3VnaCB0aGlzIGlzIG5vdCBj
b252ZW5pZW50IGZvciB1c2VycyBhbmQgcmVxdWlyZXMgbW9yZQpkZXZlbG9wZXIgZWZmb3J0LCBv
dmVybGF5cyB3b3VsZCBiZSBiZXN0IHRvIGFkb3B0IGR0Ym8gcGVyLWNhcnJpZXIgYm9hcmQKdG8g
ZGVzY3JpYmUgaGFyZHdhcmUgYWNjdXJhdGVseS4KCldoYXQgaXMgbmVlZGVkIHRvIGludHJvZHVj
ZSBvdmVybGF5cz8KCi0gRQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
