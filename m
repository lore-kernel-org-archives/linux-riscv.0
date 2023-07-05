Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBCBEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:CC:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iOpkkKK3SdDg6UJmcyTaMB6D8G/euuX4MO0pdC6sTUs=; b=DmYMAPnvX6NLUd7ume46I997RQ
	bhMTAe69cfkXUKRKQu5ZdAO7RXmKKAynhUte5cCjPsollpj8DnQE9AHvVYfxjD1XKly5jwW9Hi9rh
	6yxEB6cAgjBEAxarwSctjZg0mdbSzWVxa0f7ukU5DNwAxoe/+O5/lWrbItF61Jaa5NWPCQdGJM8es
	QLgT/bhvIZ5uL9dsJDusUhCD0kLfF1SdbeYVglvxJhjwB6qKZJBpkVtj87mYqXAHAQvrzezhZUR3L
	Z3QoBnNRrdlZ1ZMOz1EEbghYa4mIhvlz2eaFG4eot2oURZ+XyqKsCTRwc9wChDi5br9j9NonXE50d
	bLvX1skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzgQ-00FX6h-0F;
	Wed, 05 Jul 2023 10:24:26 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzgK-00FWzG-2o;
	Wed, 05 Jul 2023 10:24:23 +0000
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QwwjC0D2yzTkkg;
	Wed,  5 Jul 2023 18:23:11 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 18:24:13 +0800
CC: <yangyicong@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>,
	<akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<mark.rutland@arm.com>, <ryan.roberts@arm.com>, <will@kernel.org>,
	<anshuman.khandual@arm.com>, <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
	<peterz@infradead.org>, <arnd@arndb.de>, <punit.agrawal@bytedance.com>,
	<linux-kernel@vger.kernel.org>, <darren@os.amperecomputing.com>,
	<huzhanyuan@oppo.com>, <lipeifeng@oppo.com>, <zhangshiming@oppo.com>,
	<guojian@oppo.com>, <realmz6@gmail.com>, <linux-mips@vger.kernel.org>,
	<openrisc@lists.librecores.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
	<wangkefeng.wang@huawei.com>, <xhao@linux.alibaba.com>,
	<prime.zeng@hisilicon.com>, <Jonathan.Cameron@huawei.com>, Barry Song
	<v-songbaohua@oppo.com>, Nadav Amit <namit@vmware.com>, Mel Gorman
	<mgorman@suse.de>
Subject: Re: [RESEND PATCH v9 2/2] arm64: support batched/deferred tlb
 shootdown during page reclamation/migration
To: Barry Song <21cnbao@gmail.com>
References: <20230518065934.12877-1-yangyicong@huawei.com>
 <20230518065934.12877-3-yangyicong@huawei.com> <ZJ2x6DlmyA3kVh1n@arm.com>
 <ZJ2+37Q7v4odMmEd@arm.com> <2f593850-797c-5422-2c80-ce214fac02bb@huawei.com>
 <CAGsJ_4zG=DT0gwC+5uN51rQKT=UudNDZ4t1BgRNoFb_3NNLOtQ@mail.gmail.com>
From: Yicong Yang <yangyicong@huawei.com>
Message-ID: <124b7798-94ae-ebfc-bbe5-21ebaaa02760@huawei.com>
Date: Wed, 5 Jul 2023 18:24:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAGsJ_4zG=DT0gwC+5uN51rQKT=UudNDZ4t1BgRNoFb_3NNLOtQ@mail.gmail.com>
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_032421_272384_8AB00F0A 
X-CRM114-Status: GOOD (  28.48  )
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

T24gMjAyMy83LzUgMTY6NDMsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgNCwgMjAy
MyBhdCAxMDozNuKAr1BNIFlpY29uZyBZYW5nIDx5YW5neWljb25nQGh1YXdlaS5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiAyMDIzLzYvMzAgMToyNiwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+Pj4gT24g
VGh1LCBKdW4gMjksIDIwMjMgYXQgMDU6MzE6MzZQTSArMDEwMCwgQ2F0YWxpbiBNYXJpbmFzIHdy
b3RlOgo+Pj4+IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDAyOjU5OjM0UE0gKzA4MDAsIFlpY29u
ZyBZYW5nIHdyb3RlOgo+Pj4+PiBGcm9tOiBCYXJyeSBTb25nIDx2LXNvbmdiYW9odWFAb3Bwby5j
b20+Cj4+Pj4+Cj4+Pj4+IG9uIHg4NiwgYmF0Y2hlZCBhbmQgZGVmZXJyZWQgdGxiIHNob290ZG93
biBoYXMgbGVhZCB0byA5MCUKPj4+Pj4gcGVyZm9ybWFuY2UgaW5jcmVhc2Ugb24gdGxiIHNob290
ZG93bi4gb24gYXJtNjQsIEhXIGNhbiBkbwo+Pj4+PiB0bGIgc2hvb3Rkb3duIHdpdGhvdXQgc29m
dHdhcmUgSVBJLiBCdXQgc3luYyB0bGJpIGlzIHN0aWxsCj4+Pj4+IHF1aXRlIGV4cGVuc2l2ZS4K
Pj4+PiBbLi4uXQo+Pj4+PiAgLi4uL2ZlYXR1cmVzL3ZtL1RMQi9hcmNoLXN1cHBvcnQudHh0ICAg
ICAgICAgIHwgIDIgKy0KPj4+Pj4gIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxICsKPj4+Pj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGxiYmF0Y2gu
aCAgICAgICAgICAgICB8IDEyICsrKysKPj4+Pj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vdGxi
Zmx1c2guaCAgICAgICAgICAgICB8IDMzICsrKysrKysrLQo+Pj4+PiAgYXJjaC9hcm02NC9tbS9m
bHVzaC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgNjkgKysrKysrKysrKysrKysrKysrKwo+
Pj4+PiAgYXJjaC94ODYvaW5jbHVkZS9hc20vdGxiZmx1c2guaCAgICAgICAgICAgICAgIHwgIDUg
Ky0KPj4+Pj4gIGluY2x1ZGUvbGludXgvbW1fdHlwZXNfdGFzay5oICAgICAgICAgICAgICAgICB8
ICA0ICstCj4+Pj4+ICBtbS9ybWFwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMiArKy0tCj4+Pj4KPj4+PiBGaXJzdCBvZiBhbGwsIHRoaXMgcGF0Y2ggbmVlZHMgdG8g
YmUgc3BsaXQgaW4gc29tZSBwcmVwYXJhdG9yeSBwYXRjaGVzCj4+Pj4gaW50cm9kdWNpbmcvcmVu
YW1pbmcgZnVuY3Rpb25zIHdpdGggbm8gZnVuY3Rpb25hbCBjaGFuZ2UgZm9yIHg4Ni4gT25jZQo+
Pj4+IGRvbmUsIHlvdSBjYW4gYWRkIHRoZSBhcm02NC1vbmx5IGNoYW5nZXMuCj4+Pj4KPj4KPj4g
Z290IGl0LiB3aWxsIHRyeSB0byBzcGxpdCB0aGlzIHBhdGNoIGFzIHN1Z2dlc3RlZC4KPj4KPj4+
PiBOb3csIG9uIHRoZSBpbXBsZW1lbnRhdGlvbiwgSSBoYWQgc29tZSBjb21tZW50cyBvbiB2NyBi
dXQgd2UgZGlkbid0IGdldAo+Pj4+IHRvIGEgY29uY2x1c2lvbiBhbmQgdGhlIHRocmVhZCBldmVu
dHVhbGx5IGRpZWQ6Cj4+Pj4KPj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS9Z
N2NUb2o1bVdkMVpiTXlRQGFybS5jb20vCj4+Pj4KPj4+PiBJIGtub3cgSSBzYWlkIGEgY29tbWFu
ZCBsaW5lIGFyZ3VtZW50IGlzIGJldHRlciB0aGFuIEtjb25maWcgb3Igc29tZQo+Pj4+IHJhbmRv
bSBudW1iZXIgb2YgQ1BVcyBoZXVyaXN0aWNzIGJ1dCBpdCB3b3VsZCBiZSBldmVuIGJldHRlciBp
ZiB3ZSBkb24ndAo+Pj4+IGJvdGhlciB3aXRoIGFueSwganVzdCBtYWtlIHRoaXMgYWx3YXlzIG9u
Lgo+Pgo+PiBvaywgd2lsbCBtYWtlIHRoaXMgYWx3YXlzIG9uLgo+Pgo+Pj4+IEJhcnJ5IGhhZCBz
b21lIGNvbW1lbnRzCj4+Pj4gYXJvdW5kIG1wcm90ZWN0KCkgYmVpbmcgcmFjeSBhbmQgdGhhdCdz
IHdoeSB3ZSBoYXZlCj4+Pj4gZmx1c2hfdGxiX2JhdGNoZWRfcGVuZGluZygpIGJ1dCBJIGRvbid0
IHRoaW5rIGl0J3MgbmVlZGVkIChvciwgZm9yCj4+Pj4gYXJtNjQsIGl0IGNhbiBiZSBhIERTQiBz
aW5jZSB0aGlzIHBhdGNoIGlzc3VlcyB0aGUgVExCSXMgYnV0IHdpdGhvdXQgdGhlCj4+Pj4gRFZN
IFN5bmMpLiBTbyB3ZSBuZWVkIHRvIGNsYXJpZnkgdGhpcyAoc2VlIEJhcnJ5J3MgbGFzdCBlbWFp
bCBvbiB0aGUKPj4+PiBhYm92ZSB0aHJlYWQpIGFuZCBiZWZvcmUgYXR0ZW1wdGluZyBuZXcgdmVy
c2lvbnMgb2YgdGhpcyBwYXRjaHNldC4gV2l0aAo+Pj4+IGZsdXNoX3RsYl9iYXRjaGVkX3BlbmRp
bmcoKSByZW1vdmVkIChvciBEU0IpLCBJIGhhdmUgYSBzdXNwaWNpb24gc3VjaAo+Pj4+IGltcGxl
bWVudGF0aW9uIHdvdWxkIGJlIGZhc3RlciBvbiBhbnkgU29DIGlycmVzcGVjdGl2ZSBvZiB0aGUg
bnVtYmVyIG9mCj4+Pj4gQ1BVcy4KPj4+Cj4+PiBJIHRoaW5rIEkgZ290IHRoZSBuZWVkIGZvciBm
bHVzaF90bGJfYmF0Y2hlZF9wZW5kaW5nKCkuIElmCj4+PiB0cnlfdG9fdW5tYXAoKSBtYXJrcyB0
aGUgcHRlICFwcmVzZW50IGFuZCB3ZSBoYXZlIGEgcGVuZGluZyBUTEJJLAo+Pj4gY2hhbmdlX3B0
ZV9yYW5nZSgpIHdpbGwgc2tpcCB0aGUgVExCIG1haW50ZW5hbmNlIGFsdG9nZXRoZXIgc2luY2Ug
aXQgZGlkCj4+PiBub3QgY2hhbmdlIHRoZSBwdGUuIFNvIHdlIGNvdWxkIGJlIGxlZnQgd2l0aCBz
dGFsZSBUTEIgZW50cmllcyBhZnRlcgo+Pj4gbXByb3RlY3QoKSBiZWZvcmUgVFRVIGRvZXMgdGhl
IGJhdGNoIGZsdXNoaW5nLgo+Pj4KPiAKPiBHb29kIGNhdGNoLgo+IFRoaXMgY291bGQgYmUgYWxz
byB0cnVlIGZvciBNQURWX0RPTlRORUVELiBhZnRlciB0cnlfdG9fdW5tYXAsIHdlIHJ1bgo+IE1B
RFZfRE9OVE5FRUQgb24gdGhpcyBhcmVhLCBhcyBwdGUgaXMgbm90IHByZXNlbnQsIHdlIGRvbid0
IGRvIGFueXRoaW5nCj4gb24gdGhpcyBQVEUgaW4gemFwX3B0ZV9yYW5nZSBhZnRlcndhcmRzLgo+
IAo+Pj4gV2UgY2FuIGhhdmUgYW4gYXJjaC1zcGVjaWZpYyBmbHVzaF90bGJfYmF0Y2hlZF9wZW5k
aW5nKCkgdGhhdCBjYW4gYmUgYQo+Pj4gRFNCIG9ubHkgb24gYXJtNjQgYW5kIGEgZnVsbCBtbSBm
bHVzaCBvbiB4ODYuCj4+Pgo+Pgo+PiBXZSBuZWVkIHRvIGRvIGEgZmx1c2gvZHNiIGluIGZsdXNo
X3RsYl9iYXRjaGVkX3BlbmRpbmcoKSBvbmx5IGluIGEgcmFjZQo+PiBjb25kaXRpb24gc28gd2Ug
Zmlyc3QgY2hlY2sgd2hldGhlciB0aGVyZSdzIGEgcGVuZGVkIGJhdGNoZWQgZmx1c2ggYW5kCj4+
IGlmIHNvIGRvIHRoZSB0bGIgZmx1c2guIFRoZSBwZW5kaW5nIGNoZWNraW5nIGlzIGNvbW1vbiBh
bmQgdGhlIGRpZmZlcmVuY2VzCj4+IGFtb25nIHRoZSBhcmNocyBpcyBob3cgdG8gZmx1c2ggdGhl
IFRMQiBoZXJlIHdpdGhpbiB0aGUgZmx1c2hfdGxiX2JhdGNoZWRfcGVuZGluZygpLAo+PiBvbiBh
cm02NCBpdCBzaG91bGQgb25seSBiZSBhIGRzYi4KPj4KPj4gQXMgd2Ugb25seSBuZWVkcyB0byBt
YWludGFpbiB0aGUgVExCcyBhbHJlYWR5IHBlbmRlZCBpbiBiYXRjaGVkIGZsdXNoLAo+PiBkb2Vz
IGl0IG1ha2Ugc2Vuc2UgdG8gb25seSBoYW5kbGUgdGhvc2UgVExCcyBpbiBmbHVzaF90bGJfYmF0
Y2hlZF9wZW5kaW5nKCk/Cj4+IFRoZW4gd2UgY2FuIHVzZSB0aGUgYXJjaF90bGJiYXRjaF9mbHVz
aCgpIHJhdGhlciB0aGFuIGZsdXNoX3RsYl9tbSgpIGluCj4+IGZsdXNoX3RsYl9iYXRjaGVkX3Bl
bmRpbmcoKSBhbmQgbm8gYXJjaCBzcGVjaWZpYyBmdW5jdGlvbiBuZWVkZWQuCj4gCj4gYXMgd2Ug
aGF2ZSBpc3N1ZWQgbm8tc3luYyB0bGJpIG9uIHRob3NlIHBlbmRpbmcgYWRkcmVzc2VzICwgdGhh
dCBtZWFucwo+IG91ciBoYXJkd2FyZQo+IGhhcyBhbHJlYWR5ICJyZWNvcmRlZCIgd2hhdCBzaG91
bGQgYmUgZmx1c2hlZCBpbiB0aGUgc3BlY2lmaWMgbW0uIHNvCj4gRFNCIG9ubHkgd2lsbCBmbHVz
aAo+IHRoZW0gY29ycmVjdGx5LiByaWdodD8KPiAKCnllcyBpdCdzIHJpZ2h0LiBJIHdhcyBqdXN0
IHRob3VnaHQgc29tZXRoaW5nIGxpa2UgYmVsb3cuIGFyY2hfdGxiYmF0Y2hfZmx1c2goKQp3aWxs
IG9ubHkgYmUgYSBkc2Igb24gYXJtNjQgc28gdGhpcyB3aWxsIG1hdGNoIHdoYXQgQ2F0YWxpbiB3
YW50cy4gQnV0IGFzIHlvdQp0b2xkIHRoYXQgdGhpcyBtYXliZSBpbmNvcnJlY3Qgb24geDg2IHNv
IHdlJ2QgYmV0dGVyIGhhdmUgYXJjaCBzcGVjaWZpYwppbXBsZW1lbnRhdGlvbiBmb3IgZmx1c2hf
dGxiX2JhdGNoZWRfcGVuZGluZygpIGFzIHN1Z2dlc3RlZC4KCmRpZmYgLS1naXQgYS9tbS9ybWFw
LmMgYi9tbS9ybWFwLmMKaW5kZXggOTY5OWM2MDExYjBlLi5hZmEzNTcxNTAzYTAgMTAwNjQ0Ci0t
LSBhL21tL3JtYXAuYworKysgYi9tbS9ybWFwLmMKQEAgLTcxNyw3ICs3MTcsNyBAQCB2b2lkIGZs
dXNoX3RsYl9iYXRjaGVkX3BlbmRpbmcoc3RydWN0IG1tX3N0cnVjdCAqbW0pCiAgICAgICAgaW50
IGZsdXNoZWQgPSBiYXRjaCA+PiBUTEJfRkxVU0hfQkFUQ0hfRkxVU0hFRF9TSElGVDsKCiAgICAg
ICAgaWYgKHBlbmRpbmcgIT0gZmx1c2hlZCkgewotICAgICAgICAgICAgICAgZmx1c2hfdGxiX21t
KG1tKTsKKyAgICAgICAgICAgICAgIGFyY2hfdGxiYmF0Y2hfZmx1c2goJmN1cnJlbnQtPnRsYl91
YmMuYXJjaCk7CiAgICAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICAgICogSWYgdGhlIG5l
dyBUTEIgZmx1c2hpbmcgaXMgcGVuZGluZyBkdXJpbmcgZmx1c2hpbmcsIGxlYXZlCiAgICAgICAg
ICAgICAgICAgKiBtbS0+dGxiX2ZsdXNoX2JhdGNoZWQgYXMgaXMsIHRvIGF2b2lkIGxvc2luZyBm
bHVzaGluZy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
