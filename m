Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77FBC4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 11:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS3TpM57Q2R1fU4NHubrKw/IXLGolr6V8lR0T8BmhvM=; b=CrzyG7kr1SEXtJ
	AJtFOeFHgYw31Dg74NrwUMy7h2NJe2nr6/EBWdowWuLwM0F7H1CBovZMBdH61hnJeSVNAfqWII8o4
	ZA5SElMBWc0USrFqyurksEmlGFMSXPYql5KdDUUWbymPvfOqCQQCFRf6/JpI2RvG/s93QZNRl54Ym
	TdHAGYuqAa+WqRswugj0CdTFJcCe5TF9+TG1ywM6hXC3NOeqY2wwvkQETnwvg/4BB1V0+or3puKum
	RYJb/C/q8nEAmsY8UTGIk/pBbnCzmgoHvcTov0od2FTHX3lnIg7VW87CKhNFRU3Y9Gi0eW+zma3zY
	yry6uKfkQhvEx8kLQW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry8jQ-00000008Msk-3iwf;
	Sat, 20 Apr 2024 11:18:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry8jG-00000008Mnm-1cNb
	for linux-riscv@lists.infradead.org;
	Sat, 20 Apr 2024 11:18:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EF26FCE0E89;
	Sat, 20 Apr 2024 11:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA11C072AA;
	Sat, 20 Apr 2024 11:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713611865;
	bh=p3oWmVyGlcLLzHs5KM/jHHXQg4aBBYt9qMr0gvutLek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuCv8B1wSmn3Cb5VZNbpxNPm4YYVc8guYhcxwtgZKhau6PXoW44JSJ+5BlWHxoPOR
	 kc7DGfQLCLG/lytqZeo7FHkPbLV3UbXXfCGAhErDpJgEQIUw9dnKduZBY5LEXrelp+
	 TZGGVkXANV1QvflZ/e9cyVz68x9Vr1m9LlnQRqgOqC49KjEMl2XVSH5u/IMZgNby3w
	 35XePNlBH6/InzTXd/kOc7Z7ZdNIlHBfbZa8yskolPc8T7NKQsupqpwWLHiAgIcZM6
	 okBbyXh0KFl6SGhwKzbwkKpwTZy8SbWdaLlAXwRb+1I6jR0e+o5/n4ZQL4uDibKEng
	 I9zJJ0BGAhWDg==
Date: Sat, 20 Apr 2024 19:04:18 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	cleger@rivosinc.com
Subject: Re: [PATCH v3 0/2] riscv: improve nommu and timer-clint
Message-ID: <ZiOhMnZ1fdzj2IzE@xhacker>
References: <20240410142347.964-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410142347.964-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_041805_778799_35DE938E 
X-CRM114-Status: GOOD (  29.08  )
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMTA6MjM6NDVQTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3
cm90ZToKPiBBcyBpcyBrbm93biwgdGhlIHNvcGhnbyBDVjE4MDBCIGNvbnRhaW5zIHNvIGNhbGxl
ZCBsaXR0bGUgY29yZSwgd2hpY2gKPiBpcyBDOTA2IHcvbyBNTVUsIHNvIEkgd2FudCB0byBydW4g
bm9tbXUgbGludXggb24gaXQuIFRoaXMgc2VyaWVzIGlzCj4gdGhlIHJlc3VsdCBvZiB0aGUgYnJp
bmcgdXAuIEFmdGVyIHRoaXMgc2VyaWVzLCB3LyBwcm9wZXIgZHRzLCB3ZSBjYW4KPiBydW4gbm9t
bXUgbGludXggb24gbWlsa3YgZHVvJ3MgbGl0dGxlIGNvcmUuCj4gCj4gRmlyc3Qgb2YgYWxsLCBw
YXRjaDEgcmVtb3ZlcyB0aGUgUEFHRV9PRkZTRVQgaGFyZGNvZGluZyBieSBpbnRyb2R1Y2luZwo+
IERSQU1fQkFTRSBLY29uZmlnIG9wdGlvbi4KPiAKPiBTZWNvbmRseSwgdG8gdXNlIHRoZSBULUhF
QUQgQzl4eCBjbGludCBpbiBSSVNDVi1NIE5PTU1VIGVudiwgd2UgbmVlZAo+IHRvIHRha2UgY2Fy
ZSB0d28gcG9pbnRzOgo+IAo+IDEuVGhlIG10aW1lY21wIGluIFQtSGVhZCBDOXh4IGNsaW50IG9u
bHkgc3VwcG9ydHMgMzJiaXQgcmVhZC93cml0ZSwKPiBpbXBsZW1lbnQgc3VjaCBzdXBwb3J0Lgo+
IAo+IDIuIEFzIHBvaW50ZWQgb3V0IGJ5IGNvbW1pdCBjYTc4MTBhZWNkYmEgKCJsaWI6IHV0aWxz
L3RpbWVyOiBtdGltZXI6Cj4gYWRkIGEgcXVpcmsgZm9yIGxhY2tpbmcgbXRpbWUgcmVnaXN0ZXIi
KSBvZiBvcGVuc2JpOgo+IAo+ICJULUhlYWQgZGV2ZWxvcGVycyBzdXJlbHkgaGF2ZSBhIGRpZmZl
cmVudCB1bmRlcnN0YW5kaW5nIG9mIHRpbWUgQ1NSIGFuZAo+IENMSU5UJ3MgbXRpbWUgcmVnaXN0
ZXIgd2l0aCBTaUZpdmUgb25lcywgdGhhdCB0aGV5IGRpZCBub3QgaW1wbGVtZW50Cj4gdGhlIG10
aW1lIHJlZ2lzdGVyIGF0IGFsbCAtLSBhcyBzaG93biBpbiBvcGVuQzkwNiBzb3VyY2UgY29kZSwg
dGhlaXIKPiB0aW1lIENTUiB2YWx1ZSBpcyBqdXN0IGV4cG9zZWQgYXQgdGhlIHRvcCBvZiB0aGVp
ciBwcm9jZXNzb3IgSVAgYmxvY2sKPiBhbmQgZXhwZWN0cyBhbiBleHRlcm5hbCBjb250aW5vdXMg
Y291bnRlciwgd2hpY2ggbWFrZXMgaXQgbm90Cj4gb3ZlcnJpZGVhYmxlLCBhbmQgdGh1cyBtdGlt
ZSByZWdpc3RlciBpcyBub3QgaW1wbGVtZW50ZWQsIGV2ZW4gbm90IGZvcgo+IHJlYWRpbmcuIEhv
d2V2ZXIsIGlmIENMSU5URUUgaXMgbm90IGVuYWJsZWQgaW4gVC1IZWFkJ3MgTVhTVEFUVVMKPiBl
eHRlbmRlZCBDU1IsIHRoZXNlIHN5c3RlbXMgc3RpbGwgcmVseSBvbiB0aGUgbXRpbWVjbXAgcmVn
aXN0ZXJzIHRvCj4gZ2VuZXJhdGUgdGltZXIgaW50ZXJydXB0cy4gVGhpcyBtYWtlcyBpdCBuZWNl
c3NhcnkgdG8gaW1wbGVtZW50IFQtSGVhZAo+IEM5eHggQ0xJTlQgc3VwcG9ydCBpbiBPcGVuU0JJ
IE1USU1FUiBkcml2ZXIsIHdoaWNoIHNraXBzIGltcGxlbWVudGluZwo+IHJlYWRpbmcgbXRpbWUg
cmVnaXN0ZXIgYW5kIGZhbGxzIGJhY2sgdG8gZGVmYXVsdCBjb2RlIHRoYXQgcmVhZHMgdGltZQo+
IENTUi4iCj4gCj4gU28sIHdlIG5lZWQgdG8gZmFsbCBiYWNrIHRvIHJlYWQgdGltZSBDU1IgaW5z
dGVhZCBvZiBtdGltZSByZWdpc3Rlci4KPiBBZGQgcmlzY3ZfY3NyX3RpbWVfYXZhaWxhYmxlIHN0
YXRpYyBrZXkgZm9yIHRoaXMgcHVycG9zZS4KPiAKPiBUaGUgc2Vjb25kIHBhdGNoIGFkZHMgVC1I
ZWFkIEM5eHh4IGNsaW50IHN1cHBvcnQgdG8gdGltZXItY2xpbnQgZHJpdmVyCj4gYnkgdGFraW5n
IGNhcmUgb2YgYWJvdmUgdHdvIHBvaW50cy4KPiAKPiBTaW5jZSB2MjoKPiAgIC0gZHJvcCBDT05G
SUdfQ0xJTlRfVVNFX0NTUl9JTlNURUFET0ZfTVRJTUUsIGluc3RlYWQgd2UgdXNlIHJ1bnRpbWUK
PiAgICAgY29kZSBwYXRjaCB0byBkeW5hbWljYWxseSBlbmFibGUgQ1NSIFRJTUUgY29kZSBwYXRo
IG9yIE1USU1FIGNvZGUKPiAgICAgcGF0aC4KPiAKPiBTaW5jZSB2MToKPiAgIC0gZml4IGM5MDBf
Y2xpbnRfdGltZXJfaW5pdF9kdCgpIGRlZmluZWQgYnV0IG5vdCB1c2VkIGJ1aWxkIHdhcm5pbmcK
PiAgIC0gYWRkIG9wdGlvbiBDT05GSUdfQ0xJTlRfVVNFX0NTUl9JTlNURUFET0ZfTVRJTUUgaW5z
dGVhZCBvZiByZW1vdmluZwo+ICAgICBtdGltZSB1c2FnZSBmb3IgYWxsIHBsYXRmb3Jtcywgc2lu
Y2Ugbm90IGFsbCBwbGF0Zm9ybXMgaW1wbGVtZW50IHRoZQo+ICAgICB0aW1lIENTUiBpbiBIVyBp
biBNIG1vZGUuCj4gICAtIHJlYmFzZSBvbiB0aGUgdGltZXItY2xpbnQgaW1wcm92ZW1lbnQgc2Vy
aWVzCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNDA0MDYxMTE3NTcu
MTU5Ny0xLWpzemhhbmdAa2VybmVsLm9yZy9ULyN0CgpIaSBQYWxtZXIsIERhbmllbCwKClRoaXMg
c2VyaWVzIGl0c2VsZiByZWxpZXMgb24gdGhlIHRpbWVyLWNsaW50IGltcHJvdmVtZW50IHNlcmll
cwpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDQwNjExMTc1Ny4xNTk3
LTEtanN6aGFuZ0BrZXJuZWwub3JnL1QvI3QKCkJ1dCBhcyBzdWdnZXN0ZWQgYnkgQ2zDqW1lbnQs
IGl0J3MgYmV0dGVyIHRvIHJlYmFzZSB0aGUgcGF0Y2gxIG9uCnRoZSBTYW11ZWwncyB3b3JrIHdo
aWNoIGhhcyBiZWVuIG1lcmdlZCBpbnRvIHJpc2N2IGZvci1uZXh0LApTbyBJIGhhdmUgdHdvIGRl
cGVuZGVuY2llcyBub3csIGhvdyBkbyBJIGhhbmRsZSB0aGlzIHNlcmllcyB0aGVuPwoKQ291bGQg
SSBsZWF2ZSBwYXRjaDEgYWxvbmUgYW5kIG1vdmUgcGF0Y2gyIGludG8gdGhlIHRpbWVyLWNsaW50
CmltcHJvdmVtZW50IHNlcmllcz8gQW55IHN1Z2dlc3Rpb24/CgpUaGFua3MgaW4gYWR2YW5jZQo+
IAo+IAo+IEppc2hlbmcgWmhhbmcgKDIpOgo+ICAgcmlzY3Y6IG5vbW11OiByZW1vdmUgUEFHRV9P
RkZTRVQgaGFyZGNvZGluZwo+ICAgY2xvY2tzb3VyY2UvZHJpdmVycy90aW1lci1jbGludDogQWRk
IFQtSGVhZCBDOXh4IGNsaW50Cj4gCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAg
ICB8ICA4ICsrKysrLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NsaW50LmggICAgfCAgMiAr
Kwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RpbWV4LmggICAgfCAxOCArKysrKysrKystLS0K
PiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1jbGludC5jIHwgNDggKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuNDMuMAo+IAo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
