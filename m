Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A2EC05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kt6TEUloXFPi2TLd7iscXPe+sY85+e4EJCKRxD4oiB0=; b=ogZZSDaXGrFZEo
	Uvpw3AMRt3QTRpW+z4aL0BXnIYyPFs8GX/N61ha92+nlHlIW+yWsX1h4gio/0UlJ5nY2DuZMgJBQf
	zMLpGJIpo9Exz2d3Nhtr4j4puklYsSYHX1swgZaQ1XRWKUSrKf2F4CmiEz0u0n/IM4XO5+v+4NrKA
	+dNtvCDQBR78q705EPKU5Rz4Ua2QH16T5m4/3PzVUGqkI6gkV9e6UrT3N4Onr9dywexzmb7NDxjml
	9YNOON8gop92t92lN+D7pQHNON6DWK/m2JpeJ4s0K8Rh8BAWU+Szpp4Yhg5R4ARwil5JH4193Bb7m
	NM4gBKcVZqUxjZ4oH7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRs2h-000pdh-DD; Tue, 14 Feb 2023 09:56:07 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRs2W-000pYF-5b; Tue, 14 Feb 2023 09:55:57 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id AB0771BF20A;
	Tue, 14 Feb 2023 09:55:43 +0000 (UTC)
Message-ID: <0bf59207-838b-2a0b-a95e-925a6bbf1913@ghiti.fr>
Date: Tue, 14 Feb 2023 10:55:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: API for setting multiple PTEs at once
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>, linux-arch@vger.kernel.org
Cc: Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
 <Y+K0O35jNNzxiXE6@casper.infradead.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <Y+K0O35jNNzxiXE6@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_015556_372694_F2A854D8 
X-CRM114-Status: GOOD (  16.17  )
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

SGkgTWF0dGhldywKCk9uIDIvNy8yMyAyMToyNywgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24g
VGh1LCBGZWIgMDIsIDIwMjMgYXQgMDk6MTQ6MjNQTSArMDAwMCwgTWF0dGhldyBXaWxjb3ggd3Jv
dGU6Cj4+IEZvciB0aG9zZSBvZiB5b3Ugbm90IHN1YnNjcmliZWQsIGxpbnV4LW1tIGlzIGN1cnJl
bnRseSBkaXNjdXNzaW5nCj4+IGhvdyBiZXN0IHRvIGhhbmRsZSBwYWdlIGZhdWx0cyBvbiBsYXJn
ZSBmb2xpb3MuICBJIHNpbXBseSBtYWRlIGl0IHdvcmsKPj4gd2hlbiBhZGRpbmcgbGFyZ2UgZm9s
aW8gc3VwcG9ydC4gIE5vdyBZaW4gRmVuZ3dlaSBpcyB3b3JraW5nIG9uCj4+IG1ha2luZyBpdCBm
YXN0Lgo+IE9LLCBoZXJlJ3MgYW4gYWN0dWFsIGltcGxlbWVudGF0aW9uOgo+Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtbW0vMjAyMzAyMDcxOTQ5MzcuMTIyNTQzLTMtd2lsbHlAaW5m
cmFkZWFkLm9yZy8KPgo+IEl0IHN1cnZpdmVzIGEgcnVuIG9mIHhmc3Rlc3RzLiAgSWYgeW91ciBh
cmNoaXRlY3R1cmUgZG9lc24ndCBzdG9yZSBpdHMKPiBQRk5zIGF0IFBBR0VfU0hJRlQsIHlvdSdy
ZSBnb2luZyB0byB3YW50IHRvIGltcGxlbWVudCB5b3VyIG93biBzZXRfcHRlcygpLAo+IG9yIHlv
dSdsbCBzZWUgZW50aXJlbHkgdGhlIHdyb25nIHBhZ2VzIG1hcHBlZCBpbnRvIHVzZXJzcGFjZS4g
IFlvdSBtYXkKPiBhbHNvIHdpc2ggdG8gaW1wbGVtZW50IHNldF9wdGVzKCkgaWYgaXQgY2FuIGJl
IGRvbmUgbW9yZSBlZmZpY2llbnRseQo+IHRoYW4gX19wdGUocHRldmFsKHB0ZSkgKyBQQUdFX1NJ
WkUpLgo+Cj4gQXJjaGl0ZWN0dXJlcyB0aGF0IGltcGxlbWVudCB0aGluZ3MgbGlrZSBmbHVzaF9p
Y2FjaGVfcGFnZSgpIGFuZAo+IHVwZGF0ZV9tbXVfY2FjaGUoKSBtYXkgd2FudCB0byBwcm9wb3Nl
IGJhdGNoZWQgdmVyc2lvbnMgb2YgdGhvc2UuCj4gVGhhdCdzIGFscGhhLCBjc2t5LCBtNjhrLCBt
aXBzLCBuaW9zMiwgcGFyaXNjLCBzaCwKPiBhcm0sIGxvb25nYXJjaCwgb3BlbnJpc2MsIHBvd2Vy
cGMsIHJpc2N2LCBzcGFyYyBhbmQgeHRlbnNhLgo+IE1haW50YWluZXJzIEJDQydkLCBtYWlsaW5n
IGxpc3RzIENDJ2QuCj4KPiBJJ20gaGFwcHkgdG8gY29sbGVjdCBpbXBsZW1lbnRhdGlvbnMgYW5k
IHN1Ym1pdCB0aGVtIGFzIHBhcnQgb2YgYSB2Ni4KCgpQbGVhc2UgZmluZCBiZWxvdyB0aGUgcmlz
Y3YgaW1wbGVtZW50YXRpb24gZm9yIHNldF9wdGVzOgoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oIApiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5o
CmluZGV4IGViZWU1NmQ0NzAwMy4uMTBiZjgxMjc3NmE0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaApAQCAtNDYzLDYgKzQ2MywyMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3B0ZV9hdChz
dHJ1Y3QgbW1fc3RydWN0ICptbSwKIMKgwqDCoMKgwqDCoMKgIF9fc2V0X3B0ZV9hdChtbSwgYWRk
ciwgcHRlcCwgcHRldmFsKTsKIMKgfQoKKyNkZWZpbmUgc2V0X3B0ZXMgc2V0X3B0ZXMKK3N0YXRp
YyBpbmxpbmUgdm9pZCBzZXRfcHRlcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9u
ZyBhZGRyLAorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlLCB1bnNpZ25lZCBpbnQgbnIpCit7CivCoMKgwqDC
oMKgwqAgZm9yICg7OykgeworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfcHRlX2F0
KG1tLCBhZGRyLCBwdGVwLCBwdGUpOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
LS1uciA9PSAwKQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJlYWs7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB0ZXArKzsKK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYWRkciArPSBQQUdFX1NJWkU7CivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHB0ZSA9IF9fcHRlKHB0ZV92YWwocHRlKSArICgxIDw8IF9QQUdFX1BGTl9TSElG
VCkpOworwqDCoMKgwqDCoMKgIH0KK30KKwogwqBzdGF0aWMgaW5saW5lIHZvaWQgcHRlX2NsZWFy
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBhZGRy
LCBwdGVfdCAqcHRlcCkKIMKgewoKClRoYW5rcywKCkFsZXgKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
