Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE296EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTpZT6DM+tG7MC3rDVIH37g3LdtNkiUqeHGTqfqBglY=; b=AMXl936L16McO3
	7fhyBIL2fUas4t8tpxpaYGNHyRLRWy62o+OE1oZNSklWg7W+MSLJMhJh/7BKZNS/qULSj+ComjduE
	CVYYGIxhqETdkmUANYN1UCXWsXDK1h6N0gjrmD7RWXEai7J/uI8hM5Py09YcKsQ9DXI1t5eA+ygYv
	kxHNFGw/QiX8liFR8UP+wK8FAZAKdtyJFDZJQkmxKXksfpEitNYoNmNwsZyxLZ5qfmr2nFszknTOe
	RpAuWKy11v05KjpWRavw6GIDMfxZ1p+mWPggeuokkXmkI13TQCuvKk3FA8bGjDQRz+qeTRU3Im2Rw
	5yxvwDK9f7oqToirOgdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8wv-00E9M9-0B;
	Tue, 11 Jul 2023 08:42:21 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ8wr-00E9KH-1S
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 08:42:19 +0000
Received: from 82-132-229-125.dab.02.net ([82.132.229.125] helo=[192.168.252.81])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qJ8wN-007Gds-VX; Tue, 11 Jul 2023 09:41:48 +0100
Message-ID: <74385f9d-ed8d-8906-13e3-b3091dae7993@codethink.co.uk>
Date: Tue, 11 Jul 2023 09:41:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
Content-Language: en-GB
To: Eric Lin <eric.lin@sifive.com>, Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 maz@kernel.org, chenhuacai@kernel.org, baolu.lu@linux.intel.com,
 will@kernel.org, kan.liang@linux.intel.com, nnac123@linux.ibm.com,
 pierre.gondois@arm.com, jgross@suse.com, chao.gao@intel.com,
 maobibo@loongson.cn, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dslin1010@gmail.com, Greentime Hu <greentime.hu@sifive.com>,
 Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-3-eric.lin@sifive.com>
 <20230616-revision-speed-a83dc926b334@wendy>
 <CAPqJEFo5genyjY7qJBaESzeppbEnTiDe9qzv98ETLhWfMZeG4A@mail.gmail.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <CAPqJEFo5genyjY7qJBaESzeppbEnTiDe9qzv98ETLhWfMZeG4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_014217_489439_46D22817 
X-CRM114-Status: GOOD (  15.72  )
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

T24gMjAvMDYvMjAyMyAwNDoxNCwgRXJpYyBMaW4gd3JvdGU6Cj4gT24gRnJpLCBKdW4gMTYsIDIw
MjMgYXQgNjoxM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
IHdyb3RlOgo+Pgo+PiBPbiBGcmksIEp1biAxNiwgMjAyMyBhdCAwMjozMjowOVBNICswODAwLCBF
cmljIExpbiB3cm90ZToKPj4+IEZyb206IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2
ZS5jb20+Cj4+Pgo+Pj4gVGhpcyBhZGRzIFNpRml2ZSBwcml2YXRlIEwyIGNhY2hlIFBNVSBkcml2
ZXIuIFVzZXIKPj4+IGNhbiB1c2UgcGVyZiB0b29sIHRvIHByb2ZpbGUgYnkgZXZlbnQgbmFtZSBh
bmQgZXZlbnQgaWQuCj4+Pgo+Pj4gRXhhbXBsZToKPj4+ICQgcGVyZiBzdGF0IC1DIDAgLWUgL3Np
Zml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfYnRvdC8KPj4+ICAgICAgICAgICAgICAg
ICAgLWUgL3NpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfbnRvYi8KPj4+ICAgICAg
ICAgICAgICAgICAgLWUgL3NpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfbnRvdC8g
bHMKPj4+Cj4+PiAgIFBlcmZvcm1hbmNlIGNvdW50ZXIgc3RhdHMgZm9yICdDUFUocykgMCc6Cj4+
Pgo+Pj4gICAgICAgICAgICAgICAgIDMwMCAgICAgIHNpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVp
cmVfYmxvY2tfYnRvdC8KPj4+ICAgICAgICAgICAgICAgMTc4MDEgICAgICBzaWZpdmVfcGwyX3Bt
dS9pbm5lcl9hY3F1aXJlX2Jsb2NrX250b2IvCj4+PiAgICAgICAgICAgICAgICA1MjUzICAgICAg
c2lmaXZlX3BsMl9wbXUvaW5uZXJfYWNxdWlyZV9ibG9ja19udG90Lwo+Pj4KPj4+ICAgICAgICAg
MC4wODg5MTczMjYgc2Vjb25kcyB0aW1lIGVsYXBzZWQKPj4+Cj4+PiAkIHBlcmYgc3RhdCAtQyAw
IC1lIC9zaWZpdmVfcGwyX3BtdS9ldmVudD0weDEwMDAxLwo+Pj4gICAgICAgICAgICAgICAgICAt
ZSAvc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg0MDAxLwo+Pj4gICAgICAgICAgICAgICAgICAtZSAv
c2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg4MDAxLyBscwo+Pj4KPj4+ICAgUGVyZm9ybWFuY2UgY291
bnRlciBzdGF0cyBmb3IgJ0NQVShzKSAwJzoKPj4+Cj4+PiAgICAgICAgICAgICAgICAgMjUxICAg
ICAgc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHgxMDAwMS8KPj4+ICAgICAgICAgICAgICAgIDI2MjAg
ICAgICBzaWZpdmVfcGwyX3BtdS9ldmVudD0weDQwMDEvCj4+PiAgICAgICAgICAgICAgICAgNjQ0
ICAgICAgc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg4MDAxLwo+Pj4KPj4+ICAgICAgICAgMC4wOTI4
MjcxMTAgc2Vjb25kcyB0aW1lIGVsYXBzZWQKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHcmVlbnRp
bWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogRXJpYyBM
aW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4+PiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5s
aUBzaWZpdmUuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNv
bT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL3NvYy9zaWZpdmUvS2NvbmZpZyAgICAgICAgICAgIHwg
ICA5ICsKPj4+ICAgZHJpdmVycy9zb2Mvc2lmaXZlL01ha2VmaWxlICAgICAgICAgICB8ICAgMSAr
Cj4+PiAgIGRyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfcGwyLmggICAgICAgfCAgMjAgKwo+Pj4g
ICBkcml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX3BsMl9jYWNoZS5jIHwgIDE2ICsKPj4+ICAgZHJp
dmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9wbDJfcG11LmMgICB8IDY2OSArKysrKysrKysrKysrKysr
KysrKysrKysrKwo+Pgo+PiBQZXJmIGRyaXZlcnMgc2hvdWxkIGJlIGluIGRyaXZlcnMvcGVyZiwg
bm8/Cj4+Cj4gCj4gSGkgQ29ub3IsCj4gCj4gWWVzLCBJIHNlZSBtb3N0IG9mIHRoZSBkcml2ZXJz
IGFyZSBpbiB0aGUgZHJpdmVycy9wZXJmLgo+IAo+IEJ1dCBJIGdyZXAgcGVyZl9wbXVfcmVnaXN0
ZXIoKSwgaXQgc2VlbXMgbm90IGFsbCB0aGUgcG11IGRyaXZlcnMgYXJlCj4gaW4gZHJpdmVycy9w
ZXJmIGFzIGJlbG93Ogo+IAo+IGFyY2gvYXJtL21hY2gtaW14L21tZGMuYzo1MTc6ICAgcmV0ID0K
PiBwZXJmX3BtdV9yZWdpc3RlcigmKHBtdV9tbWRjLT5wbXUpLCBuYW1lLCAtMSk7Cj4gYXJjaC9h
cm0vbW0vY2FjaGUtbDJ4MC1wbXUuYzo1NTI6ICAgICAgIHJldCA9Cj4gcGVyZl9wbXVfcmVnaXN0
ZXIobDJ4MF9wbXUsIGwyeDBfbmFtZSwgLTEpOwo+IC4uLgo+IGRyaXZlcnMvZG1hL2lkeGQvcGVy
Zm1vbi5jOjYyNzogcmMgPSBwZXJmX3BtdV9yZWdpc3RlcigmaWR4ZF9wbXUtPnBtdSwKPiBpZHhk
X3BtdS0+bmFtZSwgLTEpOwo+IGRyaXZlcnMvZnBnYS9kZmwtZm1lLXBlcmYuYzo5MDQ6c3RhdGlj
IGludAo+IGZtZV9wZXJmX3BtdV9yZWdpc3RlcihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAo+IGRyaXZlcnMvZnBnYS9kZmwtZm1lLXBlcmYuYzo5Mjk6ICAgICAgICByZXQgPSBwZXJmX3Bt
dV9yZWdpc3RlcihwbXUsIG5hbWUsIC0xKTsKPiAuLi4KPiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfcG11LmM6NTQ5OiAgICByZXQgPQo+IHBlcmZfcG11X3JlZ2lzdGVyKCZwbXVf
ZW50cnktPnBtdSwgcG11X25hbWUsIC0xKTsKPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Bt
dS5jOjExOTA6ICAgcmV0ID0KPiBwZXJmX3BtdV9yZWdpc3RlcigmcG11LT5iYXNlLCBwbXUtPm5h
bWUsIC0xKTsKPiBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1wZXJm
LmM6OTA3OiAgIHJldCA9Cj4gcGVyZl9wbXVfcmVnaXN0ZXIoJmV0bV9wbXUsIENPUkVTSUdIVF9F
VE1fUE1VX05BTUUsIC0xKTsKPiBkcml2ZXJzL2h3dHJhY2luZy9wdHQvaGlzaV9wdHQuYzo4OTU6
ICAgcmV0ID0KPiBwZXJmX3BtdV9yZWdpc3RlcigmaGlzaV9wdHQtPmhpc2lfcHR0X3BtdSwgcG11
X25hbWUsIC0xKTsKPiBkcml2ZXJzL2lvbW11L2ludGVsL3BlcmZtb24uYzo1NzA6ICAgICAgcmV0
dXJuCj4gcGVyZl9wbXVfcmVnaXN0ZXIoJmlvbW11X3BtdS0+cG11LCBpb21tdV9wbXUtPnBtdS5u
YW1lLCAtMSk7Cj4gZHJpdmVycy9udmRpbW0vbmRfcGVyZi5jOjMwOTogICByYyA9IHBlcmZfcG11
X3JlZ2lzdGVyKCZuZF9wbXUtPnBtdSwKPiBuZF9wbXUtPnBtdS5uYW1lLCAtMSk7Cj4gLi4uCj4g
Cj4gSSBqdXN0IHdvbmRlcmluZyB3aGF0IGtpbmQgb2YgcG11IGRyaXZlcnMgc2hvdWxkIGJlIGlu
IGRyaXZlcnMvcGVyZgo+IGFuZCB3aGF0IGtpbmQgb2YgcG11IGRyaXZlcnMgc2hvdWxkIG5vdCBi
ZSBpbiBkcml2ZXJzL3BlcmYuCj4gVGhhbmtzLgo+CgpHaXZlbiB0aGUgcmVnaXN0ZXJzIGZvciB0
aGUgbDIgY2FjaGUgY29udHJvbHMgYW5kIGwyIHBtdSBkb24ndCBvdmVybGFwCmRvIHdlIG5lZWQg
dGhlIHBtdSBhbmQgZ2VuZXJhbCBjYWNoZSBkcml2ZXJzIHRvZ2V0aGVyPwoKLS0gCkJlbiBEb29r
cwkJCQlodHRwOi8vd3d3LmNvZGV0aGluay5jby51ay8KU2VuaW9yIEVuZ2luZWVyCQkJCUNvZGV0
aGluayAtIFByb3ZpZGluZyBHZW5pdXMKCmh0dHBzOi8vd3d3LmNvZGV0aGluay5jby51ay9wcml2
YWN5Lmh0bWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
