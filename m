Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B03C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 06:42:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C05A61153
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 06:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C05A61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQHnQB8+oJubloSPhVPtoWyKgyLW/uG+B2toACPYwYc=; b=vl2Nap1AAzkShIbvLpSFZil899
	iRRgvi12bmBT6u4fmO44QhmvSWygsqPEr5iCbnVtcJn0ja98odId+omrpVJYRnIG1m5JPOsCuIb9z
	cL2uKLkFa7xpNrr68JkHAw0MQm5D7We9+qCOrEjT7pNe0A5pONFp8d3rE50fhDVDrz9TtdcX286Mg
	ojXsel+5IkaXTFJuBVKf9JpTFjsUQLMNvR9z2C/xDMV5i5FtiNNse4hnkbdmQoT1dOdrcLWfGXWXF
	MKdoXlEapavdW53ckx6dIX1+fyart+w29mEYm3mXIKqMMd00qv/JtpXa89skD9RP33GkrrLZleiDR
	W1Dvxc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNrHo-005dEd-8k; Wed, 08 Sep 2021 06:42:20 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNrHk-005dCg-6E
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 06:42:18 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H4CGV4mChz8swh;
 Wed,  8 Sep 2021 14:41:38 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 8 Sep 2021 14:42:06 +0800
Received: from [10.174.179.79] (10.174.179.79) by
 kwepemm600003.china.huawei.com (7.193.23.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 8 Sep 2021 14:42:05 +0800
Subject: Re: [PATCH v2 -next] riscv: mm: remove redundant trampoline PGD for
 64bit
To: Palmer Dabbelt <palmer@dabbelt.com>, <alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Anup
 Patel" <Anup.Patel@wdc.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <tiantao6@hisilicon.com>,
 <qiuwenbo@phytium.com.cn>, <rppt@kernel.org>, <jszhang@kernel.org>,
 <mick@ics.forth.gr>
References: <mhng-ea598bd7-cae0-4b60-83c5-b862a664116d@palmerdabbelt-glaptop>
From: Nanyong Sun <sunnanyong@huawei.com>
Message-ID: <150d9366-c042-3119-d86f-163b579d91b4@huawei.com>
Date: Wed, 8 Sep 2021 14:42:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <mhng-ea598bd7-cae0-4b60-83c5-b862a664116d@palmerdabbelt-glaptop>
X-Originating-IP: [10.174.179.79]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_234216_723729_6352728B 
X-CRM114-Status: GOOD (  29.10  )
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

Ck9uIDIwMjEvOC8xNCA2OjA4LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBNb24sIDAyIEF1
ZyAyMDIxIDA1OjQzOjAyIFBEVCAoLTA3MDApLCBhbGV4QGdoaXRpLmZyIHdyb3RlOgo+PiBIaSBO
YW55b25nLAo+Pgo+PiBMZSAyOC8wNy8yMDIxIMOgIDEzOjU1LCBBbGV4IEdoaXRpIGEgw6ljcml0
wqA6Cj4+Pgo+Pj4KPj4+IExlIDI4LzA3LzIwMjEgw6AgMDQ6NDksIE5hbnlvbmcgU3VuIGEgw6lj
cml0wqA6Cj4+Pj4gUmVtb3ZlIHJlZHVuZGFudCB0cmFtcG9saW5lIFBHRCBmb3IgNjRiaXQgYW5k
IGFkZCBtb3JlIGNvbW1lbnQKPj4+PiBmb3Igd2h5IDMyYml0IHN5c3RlbXMgbmVlZCB0cmFtcG9s
aW5lIFBHRC4KPj4+Pgo+Pj4+Cj4+Pj4gK2xvYWRfa2VybmVsX3BnZDoKPj4+PiArwqDCoMKgwqDC
oMKgwqAgLyoKPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFN3aXRjaCB0byBrZXJuZWwgcGFnZSB0
YWJsZXMuwqAgQSBmdWxsIGZlbmNlIGlzIG5lY2Vzc2FyeQo+Pj4+IGluIG9yZGVyIHRvCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqAgKiBhdm9pZCB1c2luZyB0aGUgdHJhbXBvbGluZSB0cmFuc2xhdGlv
bnMsIHdoaWNoIGFyZSBvbmx5Cj4+Pj4gY29ycmVjdCBmb3IKPj4+PiArwqDCoMKgwqDCoMKgwqDC
oCAqIHRoZSBmaXJzdCBzdXBlcnBhZ2UuwqAgRmV0Y2hpbmcgdGhlIGZlbmNlIGlzIGd1YXJudGVl
ZCAKPj4+PiB0byB3b3JrCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBiZWNhdXNlIHRoYXQgZmly
c3Qgc3VwZXJwYWdlIGlzIHRyYW5zbGF0ZWQgdGhlIHNhbWUgd2F5Lgo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNzcncgQ1NSX1NBVFAsIGEyCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHNmZW5jZS52bWEKPj4+PiArCj4+Pj4gK2xvYWRfZG9uZToKPj4+PiDCoMKg
wqDCoMKgIC8qIFNldCB0cmFwIHZlY3RvciB0byBzcGluIGZvcmV2ZXIgdG8gaGVscCBkZWJ1ZyAq
Lwo+Pj4+IMKgwqDCoMKgwqAgbGEgYTAsIC5Mc2Vjb25kYXJ5X3BhcmsKPj4+PiDCoMKgwqDCoMKg
IGNzcncgQ1NSX1RWRUMsIGEwCj4+Cj4+Cj4+IEkgc3VwcG9zZSBzdHZlYyB3YXMgc2V0IHRoaXMg
d2F5IHRvIGNhdGNoIGFueSBwcm9ibGVtIHdpdGggZWFybHlfcGdfZGlyLAo+PiB5b3UgbW92ZWQg
dGhhdCBhbmQgdGhlbiB0aGlzIGRlZmVhdHMgdGhpcyBvcmlnaW5hbCBwdXJwb3NlLgo+CkhpIEFs
ZXgsCgogwqDCoMKgIEkgZG9uJ3QgdGhpbmsgc28sIGJlZm9yZSBzZXQgZWFybHlfcGdfZGlyIHRv
IHNhdHAsIGl0J3MgdGhlIApwaHlzaWNhbCBhZGRyZXNzIHdvcmxkLCB3ZSBtdXN0IHNldCBzdHZl
YyBhcwoKdGhlIGZpcnN0IHBsYWNlIGluIHZpcnR1YWwgYWRkcmVzcyB3b3JsZCB3ZSB3YW50IGp1
bXAgdG8uIEFuZCBJIGRvbid0IAp0aGluayAiLkxzZWNvbmRhcnlfcGFyayAiIGNhbiBjYXRjaAoK
cHJvYmxlbSBvZiBiYWQgZWFybHlfcGdfZGlyLCBpZiB0aGUgYmFzaWMgcGFnZSB0YWJsZSBpcyB3
cm9uZywgQ1BVIGFsc28gCmNhbiBub3QgZ28gdG8gdGhlIHZpcnR1YWwgYWRkcmVzcyBzdG9yZWQg
aW4gc3R2ZWMgY29ycmVjdGx5LgoKTW9yZSwgaW4gdGhlIG9yaWdpbmFsIGNvZGUsIGJlZm9yZSBz
ZXQgdHJhbXBvbGluZV9wZ19kaXIsIHdoYXQgaWYgdGhlIAp0cmFtcG9saW5lX3BnX2RpciBoYWQg
YSBwcm9ibGVtPwoKPiBFc3NlbnRpYWxseS4KPgo+IFRoZSBzcGVjaWZpYyBpc3N1ZSBpcyB0aGF0
IHRoZSBKVEFHIGRlYnVnIHNwZWMgaXMgZGVmaW5lZCAob3IgYXQgbGVhc3QgCj4gd2FzIHdoZW4g
SSB3YXMgdXNpbmcgaXQsIGl0J3MgYmVlbiB5ZWFycyBzaW5jZSBJJ3ZlIG5lZWRlZCB0byBkbyB0
aGF0KSAKPiBpbiB0ZXJtcyBvZiBjb21taXR0ZWQgaW5zdHJ1Y3Rpb25zLsKgIFRodXMgaWYgeW91
IGVuZCB1cCBpbiBhIHBvc2l0aW9uIAo+IHdoZXJlIHRoZSBwcm9jZXNzZXIgaXMgdW5hYmxlIHRv
IGNvbW1pdCBhbiBpbnN0cnVjdGlvbiB5b3UgYWxzbyBsb3NlIAo+IHRoZSBhYmlsaXR5IHRvIGRv
IGFueXRoaW5nIG1lYW5pbmdmdWwgd2l0aCB0aGUgZGVidWdnZXIsIHRodXMgCj4gZXNzZW50aWFs
bHkgbG9ja2luZyB1cCB0aGUgc3lzdGVtLgo+Cj4gVGhlIG1vc3QgY29tbW9uIHdheSB0byBlbmQg
dXAgaW4gYSBzaXR1YXRpb24gd2hlcmUgdGhlIHByb2Nlc3NvciBpcyAKPiB1bmFibGUgdG8gY29t
bWl0IGFuIGluc3RydWN0aW9uIGlzIHRvIGhhdmUgYSBmYXVsdCB3aXRoIGFuIGludmFsaWQgCj4g
dHJhcCB2ZWN0b3I6IG1heWJlIGRhbmdsaW5nIGZyb20gTS1tb2RlLCB0aGUgbGFzdCBib290LCBy
ZXNldCwgCj4gd2hhdGV2ZXIuwqAgVGhlbiBhcyBzb29uIGFzIHlvdSB0YWtlIGEgdHJhcCB0aGUg
c3lzdGVtIGxvY2tzIHVwLsKgIEFueSAKPiB0cmFwIGJlZm9yZSB3ZSBoYXZlIGEgd29ya2luZyB0
cmFwIGhhbmRsZXIgaXMgYSBidWcsIGJ1dCBpdCdzIHdheSAKPiBoYXJkZXIgdG8gZGVidWcgdGhp
bmdzIHdoZW4gdGhlIGRlYnVnZ2VyIGRvZXNuJ3QgZnVuY3Rpb24uCj4KPiBUaGVyZSBpcyBvZiBj
b3Vyc2Ugbm8gd2F5IHRvIGZ1bmRhbWVudGFsbHkgcHJldmVudCB0aGVzZSBzb3J0IG9mIAo+IG5v
LWNvbW1pdGFibGUtaW5zdHJ1Y3Rpb24gc2l0dWF0aW9ucywgYnV0IEkgZ290IGludG8gdGhlIGhh
YmJpdCBvZiAKPiBqdXN0IHNldHRpbmcgdXAgYSB0cml2aWFsIHRyYXAgZW50cnkgcG9pbnQgQVNB
UCAtLSBpdCBwcm9iYWJseSB0b29rIGEgCj4gZG96ZW4gcm91bmRzIG9mIHRyeWluZyB0byBkZWJ1
ZyB0aGUgZGVidWdnZXIgb25seSB0byByZWFsaXplIGl0IHdhcyAKPiBwZXIgc3BlYyB0byBoYW5n
LCBidXQgdGhhdCBpZGlvbSBldmVudHVhbGx5IGNyZXB0IGludG8gcHJldHR5IG11Y2ggCj4gZXZl
cnl0aGluZy4KPgo+IE5vdCBzdXJlIGlmIHRoZSBkZWJ1ZyBzcGVjIGlzIHN0aWxsIHdyaXR0ZW4g
dGhpcyB3YXkgKG9yIGlmIGRlYnVnZ2VycyAKPiByZXNwZWN0IGl0KSwgYXMgSSBoYXZlbid0IGhh
ZCB0byB1c2Ugb25lIGluIGEgd2hpbGUuCj4KPj4KPj4KPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+Pj4gaW5kZXggYWM0
ODc0MmZhNmZjLi4zMDZmY2IyMzM0ZmEgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9p
bml0LmMKPj4+PiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+Pj4+IEBAIC0yMTksMTMgKzIx
OSwxNyBAQCB1bnNpZ25lZCBsb25nIHBmbl9iYXNlIF9fcm9fYWZ0ZXJfaW5pdDsKPj4+PiDCoCBF
WFBPUlRfU1lNQk9MKHBmbl9iYXNlKTsKPj4+PiDCoCBwZ2RfdCBzd2FwcGVyX3BnX2RpcltQVFJT
X1BFUl9QR0RdIF9fcGFnZV9hbGlnbmVkX2JzczsKPj4+PiArI2lmbmRlZiBDT05GSUdfNjRCSVQK
Pj4+PiDCoCBwZ2RfdCB0cmFtcG9saW5lX3BnX2RpcltQVFJTX1BFUl9QR0RdIF9fcGFnZV9hbGln
bmVkX2JzczsKPj4+PiArI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwo+Pgo+Pgo+PiBBcyBzdGF0
ZWQgaW4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1zdHlsZS5yc3QsIGl0IGlzIGJldHRl
ciB0byB1c2UKPj4gX19tYXliZV91bnVzZWQgcmF0aGVyIHRoYW4gI2lmZGVmcy4KPj4KPj4KSSdt
IGFmcmFpZCB0aGF0IF9fbWF5YmVfdW51c2VkIGNhbiBub3Qgc2F2ZSBvbmUgcGFnZSBtZW1vcnkg
aGVyZS4KPj4KPj4gT3ZlcmFsbCB0aGlzIHZlcnNpb24gYWRkcyBtb3JlIGNvbXBsZXhpdHkgdG8g
YXNzZW1ibHkgY29kZSB0aGFuIEkKPj4gdGhvdWdodCwgYnV0IEkgZG9uJ3Qgc2VlIGFueSB3YXkg
dG8gaW1wcm92ZSB0aGF0ICh3aGljaCBkb2VzIG5vdCBtZWFuCj4+IHRoZXJlIGlzbid0ISkuCj4+
Cj4+IFRoYW5rcywKPj4KPj4gQWxleAo+PgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LCBsZXQgbWUg
ZmlndXJlIG91dCBhIGJldHRlciBzb2x1dGlvbi4KPj4KPj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
Pj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
