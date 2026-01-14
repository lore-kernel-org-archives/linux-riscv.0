Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC9D31A0E
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 06:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8NLIXxVg4EBHVo0pPSKZd1LrPpfgqcOj09rE6IM2hw=; b=bueA/lGMewcTl4
	M+Hq4123KlS1svIoH3+gtKfy4G7rHT1upEVzLlJI3hr4EWCErPS28ybvq8hv6eFWKbXhy+EA2Hkjc
	4fPeYObFrJHOxYZFirc8R0zwM89apNNxtM1DC8dI3WDT8W9EV5vIyg2lxiofZgh0PFz7WUKu67Pu0
	nxGZgXnKbMUTui+SvDDsKn2kMja+C3smzdD7K7zWoYvC02wbB/afJLZqc7ZitXA7CUvLl3KsrWxVi
	czaBNvHLHFgIeR3gBE5NbO/bLht2ilGjzibwmnmv2z0HWiPUqUjdxm92XPSqhmuNTOGIR4iayp4wO
	ltigPIU1MkFpiXnHh2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfu9B-000000086gq-1Y9v;
	Wed, 14 Jan 2026 06:14:25 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfu96-000000086g2-0u7w
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 06:14:24 +0000
X-UUID: 3cc0f4d8f11011f0a38c85956e01ac42-20260114
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:727fcca2-2ac5-41a2-913f-7a0d34e91650,IP:0,UR
	L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:2
X-CID-META: VersionHash:a9d874c,CLOUDID:2e6b599c24fb5439d3edbe9de9908b30,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:4|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3cc0f4d8f11011f0a38c85956e01ac42-20260114
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1733740910; Wed, 14 Jan 2026 14:14:08 +0800
Message-ID: <b06e4a63-85c2-4420-8077-f4c059ef33fb@kylinos.cn>
Date: Wed, 14 Jan 2026 14:14:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] lib/string_kunit: add performance benchmark for
 strlen()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kees@kernel.org, andy@kernel.org, akpm@linux-foundation.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 ajones@ventanamicro.com, conor.dooley@microchip.com,
 samuel.holland@sifive.com, linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260113082748.250916-1-jiangfeng@kylinos.cn>
 <20260113082748.250916-9-jiangfeng@kylinos.cn>
 <aWYGWLEekWh3jJVf@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aWYGWLEekWh3jJVf@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_221420_568297_FE25B5C8 
X-CRM114-Status: GOOD (  17.40  )
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

T24gMjAyNi8xLzEzIDE2OjQ2LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MTMsIDIwMjYgYXQgMDQ6Mjc6NDJQTSArMDgwMCwgRmVuZyBKaWFuZyB3cm90ZToKPj4gSW50cm9k
dWNlIGEgYmVuY2htYXJrIHRvIGNvbXBhcmUgdGhlIGFyY2hpdGVjdHVyZS1vcHRpbWl6ZWQgc3Ry
bGVuKCkKPj4gaW1wbGVtZW50YXRpb24gYWdhaW5zdCB0aGUgZ2VuZXJpYyBDIHZlcnNpb24gKF9f
Z2VuZXJpY19zdHJsZW4pLgo+Pgo+PiBUaGUgYmVuY2htYXJrIHVzZXMgYSB0YWJsZS1kcml2ZW4g
YXBwcm9hY2ggdG8gZXZhbHVhdGUgcGVyZm9ybWFuY2UKPj4gYWNyb3NzIGRpZmZlcmVudCBzdHJp
bmcgbGVuZ3RocyAoc2hvcnQsIG1lZGl1bSwgYW5kIGxvbmcpLiBJdCBlbXBsb3lzCj4+IGt0aW1l
X2dldCgpIGZvciB0aW1pbmcgYW5kIGdldF9yYW5kb21fYnl0ZXMoKSBmb2xsb3dlZCBieSBudWxs
LWJ5dGUKPj4gZmlsdGVyaW5nIHRvIGdlbmVyYXRlIHRlc3QgZGF0YSB0aGF0IHByZXZlbnRzIGVh
cmx5IHRlcm1pbmF0aW9uLgo+Pgo+PiBUaGlzIGhlbHBzIGluIHF1YW50aWZ5aW5nIHRoZSBwZXJm
b3JtYW5jZSBnYWlucyBvZiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMKPj4gb3B0aW1pemF0aW9ucyBv
biB2YXJpb3VzIHBsYXRmb3Jtcy4KPiAKPiAuLi4KPiAKPj4gK3N0YXRpYyB2b2lkIHN0cmluZ190
ZXN0X3N0cmxlbl9iZW5jaChzdHJ1Y3Qga3VuaXQgKnRlc3QpCj4+ICt7Cj4+ICsJY2hhciAqYnVm
Owo+PiArCXNpemVfdCBidWZfbGVuLCBpdGVyczsKPj4gKwlrdGltZV90IHN0YXJ0LCBlbmQ7Cj4+
ICsJdTY0IHRpbWVfYXJjaCwgdGltZV9nZW5lcmljOwo+PiArCj4+ICsJYnVmX2xlbiA9IGdldF9t
YXhfYmVuY2hfbGVuKGJlbmNoX2Nhc2VzLCBBUlJBWV9TSVpFKGJlbmNoX2Nhc2VzKSkgKyAxOwo+
PiArCj4+ICsJYnVmID0ga3VuaXRfa3phbGxvYyh0ZXN0LCBidWZfbGVuLCBHRlBfS0VSTkVMKTsK
Pj4gKwlLVU5JVF9BU1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIGJ1Zik7Cj4+ICsKPj4gKwlm
b3IgKHNpemVfdCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoYmVuY2hfY2FzZXMpOyBpKyspIHsKPj4g
KwkJZ2V0X3JhbmRvbV9ub256ZXJvX2J5dGVzKGJ1ZiwgYmVuY2hfY2FzZXNbaV0ubGVuKTsKPj4g
KwkJYnVmW2JlbmNoX2Nhc2VzW2ldLmxlbl0gPSAnXDAnOwo+PiArCj4+ICsJCWl0ZXJzID0gYmVu
Y2hfY2FzZXNbaV0uaXRlcmF0aW9uczsKPj4gKwo+PiArCQkvKiAxLiBCZW5jaG1hcmsgdGhlIGFy
Y2hpdGVjdHVyZS1vcHRpbWl6ZWQgdmVyc2lvbiAqLwo+PiArCQlzdGFydCA9IGt0aW1lX2dldCgp
Owo+PiArCQlmb3IgKHVuc2lnbmVkIGludCBqID0gMDsgaiA8IGl0ZXJzOyBqKyspIHsKPj4gKwkJ
CU9QVElNSVpFUl9ISURFX1ZBUihidWYpOwo+PiArCQkJKHZvaWQpc3RybGVuKGJ1Zik7Cj4gCj4g
Rmlyc3QgUTogQXJlIHlvdSBzdXJlIHRoZSBjb21waWxlciBkb2Vzbid0IHJlcGxhY2UgdGhpcyB3
aXRoIF9fYnVpbHRpbl9zdHJsZW4oKSA/Cj4gCj4+ICsJCX0KPj4gKwkJZW5kID0ga3RpbWVfZ2V0
KCk7Cj4+ICsJCXRpbWVfYXJjaCA9IGt0aW1lX3RvX25zKGt0aW1lX3N1YihlbmQsIHN0YXJ0KSk7
Cj4+ICsKPj4gKwkJLyogMi4gQmVuY2htYXJrIHRoZSBnZW5lcmljIEMgdmVyc2lvbiAqLwo+PiAr
CQlzdGFydCA9IGt0aW1lX2dldCgpOwo+PiArCQlmb3IgKHVuc2lnbmVkIGludCBqID0gMDsgaiA8
IGl0ZXJzOyBqKyspIHsKPj4gKwkJCU9QVElNSVpFUl9ISURFX1ZBUihidWYpOwo+PiArCQkJKHZv
aWQpX19nZW5lcmljX3N0cmxlbihidWYpOwo+PiArCQl9Cj4gCj4gQXJlIHlvdSBzdXJlIHRoZSB3
YXJtZWQgdXAgY2FjaGVzIGRvIG5vdCBhZmZlY3QgdGhlIGJlbmNobWFyaz8gSSB0aGluayB5b3Ug
bmVlZAo+IHRvIGZsdXNoIC8gbWFrZSBjYWNoZXMgZGlydHkgb3Igc28gb24gZWFjaCBpdGVyYXRp
b24uCj4gCj4+ICsJCWVuZCA9IGt0aW1lX2dldCgpOwo+PiArCQl0aW1lX2dlbmVyaWMgPSBrdGlt
ZV90b19ucyhrdGltZV9zdWIoZW5kLCBzdGFydCkpOwo+PiArCj4+ICsJCXN0cmluZ19iZW5jaF9y
ZXBvcnQodGVzdCwgInN0cmxlbiIsICZiZW5jaF9jYXNlc1tpXSwKPj4gKwkJCQl0aW1lX2FyY2gs
IHRpbWVfZ2VuZXJpYyk7Cj4+ICsJfQo+PiArfQo+IAo+IAoKVGhhbmsgeW91IGZvciB0aGUgY2F0
Y2guIFlvdSBhcmUgYWJzb2x1dGVseSBjb3JyZWN04oCUdGhlIDI1MDB4IGZpZ3VyZSBpcyBoZWF2
aWx5CmRpc3RvcnRlZCBhbmQgZG9lcyBub3QgcmVmbGVjdCByZWFsLXdvcmxkIHBlcmZvcm1hbmNl
LgoKSSd2ZSBmb3VuZCB0aGF0IGJ5IHVzaW5nIGEgdm9sYXRpbGUgZnVuY3Rpb24gcG9pbnRlciB0
byBjYWxsIHRoZSBpbXBsZW1lbnRhdGlvbnMKKGluc3RlYWQgb2YgZGlyZWN0IGNhbGxzKSwgdGhl
IHJlc3VsdHMgcmV0dXJuZWQgdG8gYSByZWFsaXN0aWMgcmFuZ2UuIEl0IGFwcGVhcnMKdGhlIHBy
ZXZpb3VzIGJlbmNobWFyayBsb2dpYyBhbGxvd2VkIHRoZSBjb21waWxlciB0byBvdmVyLW9wdGlt
aXplIHRoZSB0ZXN0IGxvb3AKaW4gd2F5cyB0aGF0IHNrZXdlZCB0aGUgZGF0YS4KCkkgd2lsbCBy
ZWZhY3RvciB0aGUgYmVuY2htYXJrIGxvZ2ljIGluIHYzLCBzcGVjaWZpY2FsbHkgcmVmZXJlbmNp
bmcgdGhlIGNyYzMyCktVbml0IGltcGxlbWVudGF0aW9uIChlLmcuLCB1c2luZyB3YXJtLXVwIGxv
b3BzIGFuZCBhZGRpbmcgcHJlZW1wdF9kaXNhYmxlKCkKdG8gZWxpbWluYXRlIGNvbnRleHQtc3dp
dGNoIGludGVyZmVyZW5jZSkgdG8gZW5zdXJlIHRoZSBkYXRhIGlzIHJvYnVzdCBhbmQgYWNjdXJh
dGUuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkZlbmcgSmlhbmcKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
