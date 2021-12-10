Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8105C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Dec 2021 15:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rzG52lXNZP+Gd9H6RIQgDVRtmil3KvLX0bN5vVrBdRQ=; b=za//AbjOGLvz6FN7GZXoXPEDnp
	N7oE3bgNcrJise/VfWrNW9PSkBSOs1JG3ALkNO+sMP/GJUrLn7X/7V+H8wJ2WCKxSKr9A1z6DZv0f
	LVouUiYuhBg89rRgUf0kCitDdXc2kZ7U7rtc849KpJQ+0WyM8xKwrS+nj+MxOzVtZc0iYTLR8S38f
	xAnIc+/NhoKAc9KRl8aNzQeVnMglB8qXOiEUmBN0Jf7v4I/Znm2q9VqwFeLPKoWjP5jO5gY+hObUL
	RysCB+CGKp213jRD+ckFqaegMs4NzPdc/spkf1CfR8AG+5uFV7MhUGnZdF9fbC0wAU5N+fO51FVG9
	c8jJ9w0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvhiX-002Oo6-LI; Fri, 10 Dec 2021 15:21:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvhi7-002Oe7-HL; Fri, 10 Dec 2021 15:21:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07B9712FC;
 Fri, 10 Dec 2021 07:21:21 -0800 (PST)
Received: from [10.57.6.190] (unknown [10.57.6.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15F073F5A1;
 Fri, 10 Dec 2021 07:21:17 -0800 (PST)
Subject: Re: [PATCH v2 3/3] perf tools: Support register names from all archs
From: German Gomez <german.gomez@arm.com>
To: John Garry <john.garry@huawei.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, acme@kernel.org
Cc: Alexandre Truong <alexandre.truong@arm.com>, Will Deacon
 <will@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20211207180653.1147374-1-german.gomez@arm.com>
 <20211207180653.1147374-4-german.gomez@arm.com>
 <90bcce69-9585-3fb4-de89-bbf2bd6def05@huawei.com>
 <aee0c3b8-4d8c-6f1e-24ed-5539a7c1a7b5@arm.com>
Message-ID: <9828a385-acde-145a-33db-76043e799344@arm.com>
Date: Fri, 10 Dec 2021 15:21:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <aee0c3b8-4d8c-6f1e-24ed-5539a7c1a7b5@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_072123_668845_8438C481 
X-CRM114-Status: GOOD (  15.01  )
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

Ck9uIDA4LzEyLzIwMjEgMTM6NTUsIEdlcm1hbiBHb21leiB3cm90ZToKPiBIaSBKb2huLAo+Cj4g
T24gMDgvMTIvMjAyMSAxMTo1MSwgSm9obiBHYXJyeSB3cm90ZToKPj4gT24gMDcvMTIvMjAyMSAx
ODowNiwgR2VybWFuIEdvbWV6IHdyb3RlOgo+Pj4gwqAgdG9vbHMvcGVyZi9hcmNoL2FybS9pbmNs
dWRlL3BlcmZfcmVncy5owqDCoMKgwqDCoMKgIHzCoCA0MiAtLQo+Pj4gwqAgdG9vbHMvcGVyZi9h
cmNoL2FybTY0L2luY2x1ZGUvcGVyZl9yZWdzLmjCoMKgwqDCoCB8wqAgNzYgLS0KPj4+IMKgIHRv
b2xzL3BlcmYvYXJjaC9jc2t5L2luY2x1ZGUvcGVyZl9yZWdzLmjCoMKgwqDCoMKgIHzCoCA4MiAt
LS0KPj4+IMKgIHRvb2xzL3BlcmYvYXJjaC9taXBzL2luY2x1ZGUvcGVyZl9yZWdzLmjCoMKgwqDC
oMKgIHzCoCA2OSAtLQo+Pj4gwqAgdG9vbHMvcGVyZi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9wZXJm
X3JlZ3MuaMKgwqAgfMKgIDY2IC0tCj4+PiDCoCB0b29scy9wZXJmL2FyY2gvcmlzY3YvaW5jbHVk
ZS9wZXJmX3JlZ3MuaMKgwqDCoMKgIHzCoCA3NCAtLQo+Pj4gwqAgdG9vbHMvcGVyZi9hcmNoL3Mz
OTAvaW5jbHVkZS9wZXJmX3JlZ3MuaMKgwqDCoMKgwqAgfMKgIDc4IC0tCj4+PiDCoCB0b29scy9w
ZXJmL2FyY2gveDg2L2luY2x1ZGUvcGVyZl9yZWdzLmjCoMKgwqDCoMKgwqAgfMKgIDgyIC0tLQo+
Pj4gwqAgdG9vbHMvcGVyZi9idWlsdGluLXNjcmlwdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxOCArLQo+Pj4gwqAgdG9vbHMvcGVyZi91dGlsL3BlcmZfcmVncy5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNjY2ICsrKysrKysrKysrKysr
KysrKwo+Pj4gwqAgdG9vbHMvcGVyZi91dGlsL3BlcmZfcmVncy5owqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArLQo+Pj4gwqAgLi4uL3NjcmlwdGluZy1lbmdpbmVz
L3RyYWNlLWV2ZW50LXB5dGhvbi5jwqDCoMKgIHzCoCAxMCArLQo+Pj4gwqAgdG9vbHMvcGVyZi91
dGlsL3Nlc3Npb24uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDI1ICstCj4+PiDCoCAxMyBmaWxlcyBjaGFuZ2VkLCA2OTcgaW5zZXJ0aW9ucygrKSwgNjAxIGRl
bGV0aW9ucygtKQo+PiBEaWQgeW91IGNvbnNpZGVyIGxlYXZpbmcgdGhlIHJlZ2lzdGVyIHN0cnVj
dHVyZXMgd2hlcmUgdGhleSBhcmUgd2hpbGUKPj4gcmVuYW1pbmcgdG8gaW5jbHVkZSB0aGUgYXJj
aCBuYW1lIGFuZCB0aGVuIGhhdmluZyBhcyBleHRlcm5zIG9yIHNpbWlsYXI/IEkgc2VlIGFuIGV4
YW1wbGUgb2YgdGhhdCBpZGVhIGZvciBhcm02NF91bndpbmRfbGlidW53aW5kX29wcy4KPj4KPiBJ
ZiBieSByZWdpc3RlciBzdHJ1Y3R1cmVzIHlvdSBhcmUgcmVmZXJyaW5nIHRvICJfX3BlcmZfcmVn
X25hbWUoaW50KSIsIEkKPiBjYW4ndCBsZWF2ZSB0aGVtIHdoZXJlIHRoZXkgYXJlLiBPbmx5IG9u
ZSBvZiB0aGVtIHdvdWxkIGJlIGluY2x1ZGVkIGluCj4gdGhlIGJ1aWxkLgoKSSB0aGluayBJIG5l
ZWQgdG8gZWxhYm9yYXRlIGEgYml0IG1vcmUgb24gdGhpcyBzaW5jZSBzb21lIG9mIHRoZSBmaWxl
cwppbnZvbHZlZCBzaGFyZSB0aGUgc2FtZSBuYW1lIGJ1dCBhcmUgc2VydmluZyBkaWZmZXJlbnQg
cHVycG9zZXMgYW5kIGl0CmNvdWxkIGxlYWQgdG8gY29uZnVzaW9uLgoKVGhlIGxpbnV4IHJlcG8g
aGFzICJwZXJmX3JlZ3MuaCIgZm9yIGVhY2ggYXJjaGl0ZWN0dXJlIGVudW1lcmF0aW5nIHRoZQpy
ZWdpc3RlcnMgZnJvbSBlYWNoIGFyY2hpdGVjdHVyZS4gVGhlc2UgYXJlIHRoZSBmaWxlcyBJICNp
bmNsdWRlJ2QgaW4KIi90b29scy9wZXJmL3V0aWwvcGVyZl9yZWdzLmMiLgoKVGhlIG90aGVyICJw
ZXJmX3JlZ3MuaCIgYWZmZWN0ZWQgYnkgdGhpcyBwYXRjaCBhcmUgbG9jYWwgb25seSB0byBwZXJm
LgpMaWtld2lzZSB0aGVyZSBpcyBvbmUgZmlsZSBmb3IgZWFjaCBhcmNoaXRlY3R1cmUsIGJ1dCBj
b250cmFyeSB0byB0aGUKbGludXggb25lcywgdGhleSBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlLCBz
byBJIGNhbid0ICNpbmNsdWRlIHRoZW0gYWxsOgoKI2lmbmRlZiBBUkNIX1BFUkZfUkVHU19ICiNk
ZWZpbmUgQVJDSF9QRVJGX1JFR1NfSAovLy4uLgojdW5kZWYgQVJDSF9QRVJGX1JFR1NfSAoKQmVm
b3JlIHRoZSBwYXRjaCwgdGhlIGZ1bmN0aW9ucyAiX19wZXJmX3JlZ19uYW1lIiB3ZXJlIGRlY2xh
cmVkICYKaW1wbGVtZW50ZWQgaW4gdGhlc2UgaGVhZGVycywgc28gSSBoYWQgdG8gdGFrZSB0aGVt
IG91dC4KClRoYW5rcywKR2VybWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
