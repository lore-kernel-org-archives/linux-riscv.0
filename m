Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B3ECCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85pjTeRvmL03+Cr0j6SyBfJz+LACVynh8TjJbYAIrC8=; b=ITmztS5coPiDPO
	fS0HahnQnIJCPhJ1Q41GnQ5iud7Ul54bEf0Y9JXMUiKFYlfEa8UNeZU6kG04Xa/aYwu+3Wl1dW6Zr
	u2h8c3GEBPyFq8C4TQdhlsvxV6wvPt68N/u7/CVCKgUfVKAGv3np8BT0KVATwy1Kj1889C6BHNV0X
	V/RarVkRxhPdsm7s/yJwwIiGb0ZLH7AUtWM+tMOHJbjV3t18cvS+1mZnMSQZhdRMsP1E7uL9f8Sxt
	Ncz/KDqKnlypRgcjQAgROGWjho7ngTgjAxtj2DmoDCSv7wrESkwlEGv3JNpD9bnZ03HCJofr8RWPP
	VnB7+Xpn2mijxX7IUjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoEM-0000000D69k-1Phr;
	Mon, 20 Oct 2025 11:39:14 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAoED-0000000D63z-239b
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 11:39:13 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 59KBZr2h094400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Oct 2025 19:35:53 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS31.andestech.com (10.0.1.89)
 with Microsoft SMTP Server id 14.3.498.0; Mon, 20 Oct 2025 19:35:52 +0800
Date: Mon, 20 Oct 2025 19:35:48 +0800
From: Randolph Lin <randolph@andestech.com>
To: Niklas Cassel <cassel@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <jingoohan1@gmail.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alex@ghiti.fr>,
        <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <ben717@andestech.com>,
        <inochiama@gmail.com>, <thippeswamy.havalige@amd.com>,
        <namcao@linutronix.de>, <shradha.t@samsung.com>, <pjw@kernel.org>,
        <randolph.sklin@gmail.com>, <tim609@andestech.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v6 1/5] PCI: dwc: Allow adjusting the number of ob/ib
 windows in glue driver
Message-ID: <aPYehqSefwW_-pAI@swlinux02>
References: <20251003023527.3284787-1-randolph@andestech.com>
 <20251003023527.3284787-2-randolph@andestech.com>
 <aO4bWRqX_4rXud25@ryzen>
 <aPDTJKwmpxolGEyj@swlinux02>
 <aPDc-yclubiHbUcD@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPDc-yclubiHbUcD@ryzen>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59KBZr2h094400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_043905_978669_B63F1F32 
X-CRM114-Status: GOOD (  21.40  )
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

SGVsbG8gTmlrbGFzLAoKT24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgMDE6NTQ6MzVQTSArMDIwMCwg
TmlrbGFzIENhc3NlbCB3cm90ZToKPiBbRVhURVJOQUwgTUFJTF0KPiAKPiBIZWxsbyBSYW5kb2xw
aCwKPiAKPiBPbiBUaHUsIE9jdCAxNiwgMjAyNSBhdCAwNzoxMjozNlBNICswODAwLCBSYW5kb2xw
aCBMaW4gd3JvdGU6Cj4gPiA+Cj4gPiA+IENvdWxkIHdlIHBsZWFzZSBnZXQgYSBiZXR0ZXIgZXhw
bGFpbmF0aW9uIHRoYW4gInNhdGlzZnkgcGxhdGZvcm0tc3BlY2lmaWMKPiA+ID4gY29uc3RyYWlu
dHMiID8KPiA+ID4KPiA+Cj4gPiBEdWUgdG8gdGhpcyBTb0MgZGVzaWduLCBvbmx5IGlBVFUgcmVn
aW9ucyB3aXRoIG1hcHBlZCBhZGRyZXNzZXMgd2l0aGluIHRoZQo+ID4gMzItYml0cyBhZGRyZXNz
IHJhbmdlIG5lZWQgdG8gYmUgcHJvZ3JhbW1lZC4gSG93ZXZlciwgdGhpcyBTb0MgaGFzIGEgZGVz
aWduCj4gPiBsaW1pdGF0aW9uIGluIHdoaWNoIHRoZSBtYXhpbXVtIHJlZ2lvbiBzaXplIHN1cHBv
cnRlZCBieSBhIHNpbmdsZSBpQVRVCj4gPiBlbnRyeSBpcyByZXN0cmljdGVkIHRvIDQgR0IsIGFz
IGl0IGlzIGJhc2VkIG9uIGEgMzItYml0cyBhZGRyZXNzIHJlZ2lvbi4KPiA+Cj4gPiBGb3IgbW9z
dCBFUCBkZXZpY2VzLCB3ZSBjYW4gb25seSBkZWZpbmUgb25lIGVudHJ5IGluIHRoZSAicmFuZ2Vz
IiBwcm9wZXJ0eQo+ID4gb2YgdGhlIGRldmljZXRyZWUgdGhhdCBtYXBzIGFuIGFkZHJlc3Mgd2l0
aGluIHRoZSAzMi1iaXQgcmFuZ2UsCj4gPiBhcyBzaG93biBiZWxvdzoKPiA+ICAgICAgIHJhbmdl
cyA9IDwweDAyMDAwMDAwIDB4MCAweDEwMDAwMDAwIDB4MCAweDEwMDAwMDAwIDB4MCAweGYwMDAw
MDAwPjsKPiA+Cj4gPiBGb3IgRVAgZGV2aWNlcyB0aGF0IHJlcXVpcmUgNjQtYml0cyBhZGRyZXNz
IG1hcHBpbmcgKGUuZy4sIEdQVXMpLCBCQVIKPiA+IHJlc291cmNlcyBjYW5ub3QgYmUgYXNzaWdu
ZWQuCj4gPiBUbyBzdXBwb3J0IHN1Y2ggZGV2aWNlcywgYW4gYWRkaXRpb25hbCBlbnRyeSBmb3Ig
NjQtYml0cyBhZGRyZXNzIG1hcHBpbmcgaXMKPiA+IHJlcXVpcmVkLCBhcyBzaG93biBiZWxvdzoK
PiA+ICAgICAgIHJhbmdlcyA9IDwweDAyMDAwMDAwIDB4MCAweDEwMDAwMDAwIDB4MCAweDEwMDAw
MDAwIDB4MCAweGYwMDAwMDAwPiwKPiA+ICAgICAgICAgICAgICAgIDwweDQzMDAwMDAwIDB4MSAw
eDAwMDAwMDAwIDB4MSAweDAwMDAwMDAwIDB4NyAweDAwMDAwMDAwPjsKPiA+Cj4gPiBJbiB0aGUg
Y3VycmVudCBjb21tb24gaW1wbGVtZW50YXRpb24sIGFsbCByYW5nZXMgZW50cmllcyBhcmUgcHJv
Z3JhbW1lZCB0bwo+ID4gdGhlIGlBVFUuIEhvd2V2ZXIsIHRoZSBzaXplIG9mIGVudHJ5IGZvciA2
NC1iaXQgYWRkcmVzcyBtYXBwaW5nIGV4Y2VlZHMgdGhlCj4gPiBtYXhpbXVtIHJlZ2lvbiBzaXpl
IHRoYXQgYSBzaW5nbGUgaUFUVSBlbnRyeSBjYW4gc3VwcG9ydC4gQXMgYSByZXN1bHQsIGFuCj4g
PiBlcnJvciBpcyByZXBvcnRlZCBkdXJpbmcgaUFUVSBwcm9ncmFtbWluZywgc2hvd2luZyB0aGF0
IHRoZSBzaXplIG9mIDY0LWJpdAo+ID4gYWRkcmVzcyBlbnRyeSBleGNlZWRzIHRoZSByZWdpb24g
bGltaXQuCj4gCj4gTm90ZSB0aGF0IGVhY2ggaUFUVSBjYW4gbWFwIHVwIHRvIElBVFVfTElNSVRf
QUREUl9PRkZfT1VUQk9VTkRfaSArCj4gSUFUVV9VUFBSX0xJTUlUX0FERFJfT0ZGX09VVEJPVU5E
X2kuCj4gCj4gU29tZSBEV0MgY29udHJvbGxlcnMgaGF2ZSB0aGlzIGF0IDRHLCBvdGhlcnMgaGF2
ZSB0aGlzIGF0IDhHLgo+IAo+IFNhbXVlbCBoYXMgc3VibWl0dGVkIGEgcGF0Y2ggdG8gdXNlIG11
bHRpcGxlIGlBVFVzIHRvIHN1cHBvcnQKPiBhIHdpbmRvdyBzaXplIGxhcmdlciB0aGFuIHRoZSBp
QVRVIGxpbWl0IG9mIGEgc2luZ2xlIGlBVFU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtcGNpL2FQRE9iWHN2TW96MU9Zc29Acnl6ZW4vVC8jbTExYzNkOTUyMTU5ODI0MTFkMGJiZDM2
OTQwZTcwMTIyYjcwYWU4MjAKPiAKPiBQZXJoYXBzIHRoaXMgcGF0Y2ggY291bGQgYmUgb2YgdXNl
IGZvciB5b3UgdG9vPwo+CgpUaGFuayB5b3UgZm9yIHRoZSBpbmZvcm1hdGlvbi4KQWZ0ZXIgYXBw
bHlpbmcgU2FtdWVs4oCZcyBwYXRjaCwgdGhlIGNvZGUgcGFzc2VzIHRoZSBiYXNpYyBmdW5jdGlv
bmFsaXR5CnRlc3RzLiBUaGVyZWZvcmUsIHRoZSBjb21tb24gY29kZSBwYXRjaCBpcyBubyBsb25n
ZXIgbmVlZGVkLgoKPiAKPiBLaW5kIHJlZ2FyZHMsCj4gTmlrbGFzCgpTaW5jZXJlbHksClJhbmRv
bHBoIExpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
