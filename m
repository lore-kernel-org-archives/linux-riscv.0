Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB692CC6B38
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 23:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tY1jR0qWqwKnbfOalVUEUl9/fFRr+BuK7WehJp0MLlA=; b=s0+YSPe9/wLGwl
	WuVGWmHXZRTwhAohD3eICQ+tZyDTJsXuqQ4xlY8L/JEeZA4AB576Gm9JSM/jOjZWFOpdTOOHJ1W3w
	gwWUBxXOTTt5cTElehNILGEd6Q9HEunVTsYr8fcnXIErFQ8y0ox9VVgrguibaxqYX554pstXbUUuM
	uH3d7GnpOq25eCPmcA04RvqQfz/M95Me9jmakSkpJ5tdz7ib8V28DwLBlFPofGZHehjTMRH8a1jAp
	m0l+qEJ3Gp1Mw2IyNtJdYi2i7uOn1KXChzRkjoJbRu2gm490SAjQGkkV23BnuHPvlhwfmXfuL/Pdt
	+cR0RX6z+2B5W9mM9fGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVGL-00000001a1z-1ywF;
	Thu, 15 Oct 2026 23:53:29 +0000
Received: from out-53.mta1.migadu.com ([95.215.58.53] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVGJ-00000001a1W-14h3
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 23:53:28 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=FUpPXYfowSCUWW1Ifzz/TsytpfqsjiAGpIISXAFBqd8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792108404; v=1; x=1792713204;
 b=m0opDYTnqBJ9MFsVUPfK4U7gZDDrCZWKz1DTTfcnHBCwCByMolybO5hRl2+oYIHAoeLX6p32
 F9IXfBwenRcGBRu0zF7B1mMkT0TtMWq6PvvrXb1LpQ54MzKmcGpTkOjOZow9PO+9cugJis1moIb
 QNIe8D2XgSdFScvtDYmR8Th8=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ba4637d7c08d0e1a;
	Thu, 15 Oct 2026 23:53:24 +0000
X-Mizu-Trace-ID: ba4637d7c08d0e1a
X-Migadu-Flow: FLOW_OUT
Message-ID: <7033a6bb-333f-4734-a3be-42b3f943d31a@linux.dev>
Date: Fri, 16 Oct 2026 07:53:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <fa4253c7-3b17-4b20-97b9-eb37f218a4c8@linux.dev>
 <atCV8NsJc5Oatoo0@inochi.infowork>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <atCV8NsJc5Oatoo0@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_165327_529375_3E21C57E 
X-CRM114-Status: GOOD (  20.11  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDEwLzE1LzIwMjYgNTowMyBQTSwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBPbiBUaHUsIE9j
dCAxNSwgMjAyNiBhdCAwMjo0Mzo0MFBNICswODAwLCBDaGVuIFdhbmcgd3JvdGU6Cj4+IEhlbGxv
LAo+Pgo+PiBPbiAxMC8xNC8yMDI2IDM6NDUgUE0sIElub2NoaSBBbWFvdG8gd3JvdGU6Cj4+PiBT
b3BoZ28gU29DcyBzdWNoIGFzIFNHMjA0NCBjb250YWluIGVGdXNlcyB1c2VkIHRvIHN0b3JlCj4+
PiBmYWN0b3J5LXByb2dyYW1tZWQgZGF0YS4KPj4+Cj4+PiBBcyBmb3IgU0cyMDQ0LCBIVyBhdXRv
bWF0aWNhbGx5IGxvYWRzIHRoZSBlRnVzZSBjb250ZW50Cj4+PiBpbnRvIHNoYWRvdyByZWdpc3Rl
cnMgd2hpY2ggYXJlIG9yZ2FuaXplZCBhcyAzMmJpdCB2YWx1ZXMKPj4+IGV4cG9zZWQgYXMgTU1J
Ty4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwu
Y29tPgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL252bWVtL0tjb25maWcgICAgICAgIHwgIDEyICsr
Kwo+Pj4gICAgZHJpdmVycy9udm1lbS9NYWtlZmlsZSAgICAgICB8ICAgMiArCj4+PiAgICBkcml2
ZXJzL252bWVtL3NvcGhnby1lZnVzZS5jIHwgMTc2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4+PiAgICAzIGZpbGVzIGNoYW5nZWQsIDE5MCBpbnNlcnRpb25zKCspCj4+PiAg
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9udm1lbS9zb3BoZ28tZWZ1c2UuYwo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL252bWVtL0tjb25maWcgYi9kcml2ZXJzL252bWVtL0tjb25m
aWcKPj4+IGluZGV4IGMzNmMyYTRjMmEwYi4uYTc5MzZkZDY1YmRkIDEwMDY0NAo+Pj4gLS0tIGEv
ZHJpdmVycy9udm1lbS9LY29uZmlnCj4+PiArKysgYi9kcml2ZXJzL252bWVtL0tjb25maWcKPj4+
IEBAIC00NjUsNiArNDY1LDE4IEBAIGNvbmZpZyBOVk1FTV9TTlZTX0xQR1BSCj4+PiAgICAJICBU
aGlzIGRyaXZlciBjYW4gYWxzbyBiZSBidWlsdCBhcyBhIG1vZHVsZS4gSWYgc28sIHRoZSBtb2R1
bGUKPj4+ICAgIAkgIHdpbGwgYmUgY2FsbGVkIG52bWVtLXNudnMtbHBncHIuCj4+PiArY29uZmln
IE5WTUVNX1NPUEhHT19FRlVTRQo+Pj4gKwl0cmlzdGF0ZSAiU29waGdvIGVGdXNlIHN1cHBvcnQi
Cj4+PiArCWRlcGVuZHMgb24gQVJDSF9TT1BIR08gfHwgQ09NUElMRV9URVNUCj4+PiArCWRlZmF1
bHQgQVJDSF9TT1BIR08KPj4+ICsJaGVscAo+Pj4gKwkgIFNheSB5IGhlcmUgdG8gZW5hYmxlIHN1
cHBvcnQgZm9yIHJlYWRpbmcgZUZ1c2VzIG9uIFNvcGhnbyBTb0NzCj4+PiArCSAgc3VjaCBhcyB0
aGUgQ1YxODAwQi4gVGhlc2UgYXJlIGUuZy4gdXNlZCB0byBzdG9yZSBmYWN0b3J5IHByb2dyYW1t
ZWQKPj4gV2h5IGlzICJDVjE4MDBCIj8KPj4KPiBUaGlzIGlzIGFuIG9sZCBtaXN0YWtlLCB0aGlz
IHBhdGNoIGZvbGxvd3MgSmlzaGVuZ3MncyBwYXRjaCBpbiB0aGUgZmlyc3QKPiBkZXNpZ24uIEJ1
dCB0aGVuIGFsbW9zdCBldmVyeXRoaW5nIGNoYW5nZWQgYW5kIG9ubHkgdGhpbmcgZm9yIFNHMjA0
NCBsZWZ0Lgo+IFRoaXMgaXMgdGhlIHRoaW5nIHRoYXQgaXMgbGVmdCB0byBjaGFuZ2UuCj4KPiBJ
IGFtIG5vdCBzdXJlIHdoZXRoZXIgaXQgc2hvdWxkIGtlZXAgdGhpcyBnZW5lcmljIG5hbWUgYXMg
SSBzZWUgaXQgc2hvdWxkCj4gYmUgY29tcGF0aWJsZSBmb3IgbW9zdCBzb3BoZ28gU29DcyAoYXQg
bGVhc3QgaXQgc2hvdWxkIGJlIGZvciBDVjE4MDBYLAo+IGJ5IGp1c3QgY2hhbmdlIG9mZnNldCku
IEZlZWwgZnJlZSB0byBnaXZlIGlmIHlvdSBoYXZlIHNvbWUgc3VnZ2VzdGlvbiBmb3IKPiBhIGJl
dHRlciBuYW1lCgpJIHJhaXNlIHRoaXMgcG9pbnQgYmVjYXVzZSB0aGUgc3ViamVjdCBvZiB5b3Vy
IHBhdGNoIGluZGljYXRlcyBpdCBpcyAKaW50ZW5kZWQgZm9yIHRoZSBTRzIwNDQuCgpJZiB5b3Ug
YXJlIHNpbXBseSB1c2luZyBpdCBhcyBhbiBleGFtcGxlIO+8iCJzdWNoIGFzIC4uLiLvvIksIHRo
ZW4gCnNwZWNpZnlpbmcgIlNHMjA0NCIgaXMgc3VmZmljaWVudCwgZXZlbiB0aG91Z2gsIGJhc2Vk
IG9uIHlvdXIgY3VycmVudCAKZXhwbGFuYXRpb24sIGl0IHdvdWxkIGFsc28gYXBwbHkgdG8gb3Ro
ZXIgU29waGdvIGNoaXBzLCBzdWNoIGFzIHRoZSBDVjE4MDBYLgoKPgo+IFJlZ2FyZHMsCj4gSW5v
Y2hpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
