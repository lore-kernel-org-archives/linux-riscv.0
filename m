Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F3DC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 03:24:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BADE61131
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 03:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BADE61131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNO/pdbRntZZZct5nilgwP6034t2Cd6ZpGIM+GQvN/I=; b=BoAhg6mZ5oQmuSADkOzc7YTcMd
	UcIfo8ott5a9flQ7T3R6EoOsnZIGD4J0BQu58S0U6bHYEqkWPL2R2c+FwAFM8o79esG7NVOW35atu
	HJ2WPU8LR1Y8n3lMOm6A5T2wxLP65mJMUtxYsLQbgTCIaHuzB9vLMq35n2NVGSeXlQmW7lN+hs6y/
	+fqg1mWXTc7AWXhnFCThGpn3g/y94w5Wfq3G6JEbnH/Y/ctq/WnHdOKolnP3VKi60NyV6VzoL9cFI
	YeZXwhpbczBQbmzny9y3BN95QT7H4y84rtsuhCNPBJzTfHPe9ffr8JtyiOGOJ/PXiCgcnJnqAfjDo
	bY67txIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOAf5-0088k8-SZ; Thu, 09 Sep 2021 03:23:39 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOAf1-0088jj-W6
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 03:23:38 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H4kpt1lzlz8stp;
 Thu,  9 Sep 2021 11:23:02 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 11:23:32 +0800
Received: from [10.174.179.79] (10.174.179.79) by
 kwepemm600003.china.huawei.com (7.193.23.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 9 Sep 2021 11:23:31 +0800
Subject: Re: [PATCH v2 -next] riscv: mm: remove redundant trampoline PGD for
 64bit
To: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Anup
 Patel" <Anup.Patel@wdc.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 <wangkefeng.wang@huawei.com>, <tiantao6@hisilicon.com>,
 <qiuwenbo@phytium.com.cn>, <rppt@kernel.org>, <jszhang@kernel.org>,
 <mick@ics.forth.gr>
References: <mhng-ea598bd7-cae0-4b60-83c5-b862a664116d@palmerdabbelt-glaptop>
 <150d9366-c042-3119-d86f-163b579d91b4@huawei.com>
 <13c4d471-dc3b-32d8-6535-36d3862592d4@ghiti.fr>
From: Nanyong Sun <sunnanyong@huawei.com>
Message-ID: <678f7a40-988a-ce60-0b7a-2a70fe28ecd1@huawei.com>
Date: Thu, 9 Sep 2021 11:23:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <13c4d471-dc3b-32d8-6535-36d3862592d4@ghiti.fr>
X-Originating-IP: [10.174.179.79]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_202336_400020_9AAE3475 
X-CRM114-Status: GOOD (  32.33  )
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

Ck9uIDIwMjEvOS84IDE2OjU2LCBBbGV4IEdoaXRpIHdyb3RlOgo+IEhpIE5hbnlvbmcsCj4KPiBM
ZSA4LzA5LzIwMjEgw6AgMDg6NDIsIE5hbnlvbmcgU3VuIGEgw6ljcml0wqA6Cj4+Cj4+IE9uIDIw
MjEvOC8xNCA2OjA4LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4+IE9uIE1vbiwgMDIgQXVnIDIw
MjEgMDU6NDM6MDIgUERUICgtMDcwMCksIGFsZXhAZ2hpdGkuZnIgd3JvdGU6Cj4+Pj4gSGkgTmFu
eW9uZywKPj4+Pgo+Pj4+IExlIDI4LzA3LzIwMjEgw6AgMTM6NTUsIEFsZXggR2hpdGkgYSDDqWNy
aXTCoDoKPj4+Pj4KPj4+Pj4KPj4+Pj4gTGUgMjgvMDcvMjAyMSDDoCAwNDo0OSwgTmFueW9uZyBT
dW4gYSDDqWNyaXTCoDoKPj4+Pj4+IFJlbW92ZSByZWR1bmRhbnQgdHJhbXBvbGluZSBQR0QgZm9y
IDY0Yml0IGFuZCBhZGQgbW9yZSBjb21tZW50Cj4+Pj4+PiBmb3Igd2h5IDMyYml0IHN5c3RlbXMg
bmVlZCB0cmFtcG9saW5lIFBHRC4KPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gK2xvYWRfa2VybmVsX3Bn
ZDoKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKgo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBT
d2l0Y2ggdG8ga2VybmVsIHBhZ2UgdGFibGVzLsKgIEEgZnVsbCBmZW5jZSBpcyBuZWNlc3NhcnkK
Pj4+Pj4+IGluIG9yZGVyIHRvCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGF2b2lkIHVzaW5n
IHRoZSB0cmFtcG9saW5lIHRyYW5zbGF0aW9ucywgd2hpY2ggYXJlIG9ubHkKPj4+Pj4+IGNvcnJl
Y3QgZm9yCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBmaXJzdCBzdXBlcnBhZ2UuwqAg
RmV0Y2hpbmcgdGhlIGZlbmNlIGlzIGd1YXJudGVlZCAKPj4+Pj4+IHRvIHdvcmsKPj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgICogYmVjYXVzZSB0aGF0IGZpcnN0IHN1cGVycGFnZSBpcyB0cmFuc2xh
dGVkIHRoZSBzYW1lIHdheS4KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgY3NydyBDU1JfU0FUUCwgYTIKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzZmVu
Y2Uudm1hCj4+Pj4+PiArCj4+Pj4+PiArbG9hZF9kb25lOgo+Pj4+Pj4gwqDCoMKgwqDCoCAvKiBT
ZXQgdHJhcCB2ZWN0b3IgdG8gc3BpbiBmb3JldmVyIHRvIGhlbHAgZGVidWcgKi8KPj4+Pj4+IMKg
wqDCoMKgwqAgbGEgYTAsIC5Mc2Vjb25kYXJ5X3BhcmsKPj4+Pj4+IMKgwqDCoMKgwqAgY3NydyBD
U1JfVFZFQywgYTAKPj4+Pgo+Pj4+Cj4+Pj4gSSBzdXBwb3NlIHN0dmVjIHdhcyBzZXQgdGhpcyB3
YXkgdG8gY2F0Y2ggYW55IHByb2JsZW0gd2l0aCAKPj4+PiBlYXJseV9wZ19kaXIsCj4+Pj4geW91
IG1vdmVkIHRoYXQgYW5kIHRoZW4gdGhpcyBkZWZlYXRzIHRoaXMgb3JpZ2luYWwgcHVycG9zZS4K
Pj4+Cj4+IEhpIEFsZXgsCj4+Cj4+IMKgwqDCoMKgIEkgZG9uJ3QgdGhpbmsgc28sIGJlZm9yZSBz
ZXQgZWFybHlfcGdfZGlyIHRvIHNhdHAsIGl0J3MgdGhlIAo+PiBwaHlzaWNhbCBhZGRyZXNzIHdv
cmxkLCB3ZSBtdXN0IHNldCBzdHZlYyBhcwo+Pgo+PiB0aGUgZmlyc3QgcGxhY2UgaW4gdmlydHVh
bCBhZGRyZXNzIHdvcmxkIHdlIHdhbnQganVtcCB0by4gQW5kIEkgZG9uJ3QgCj4+IHRoaW5rICIu
THNlY29uZGFyeV9wYXJrICIgY2FuIGNhdGNoCj4+Cj4+IHByb2JsZW0gb2YgYmFkIGVhcmx5X3Bn
X2RpciwgaWYgdGhlIGJhc2ljIHBhZ2UgdGFibGUgaXMgd3JvbmcsIENQVSAKPj4gYWxzbyBjYW4g
bm90IGdvIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgc3RvcmVkIGluIHN0dmVjIGNvcnJlY3RseS4K
Pgo+IEJ1dCBJIHRoaW5rIHRoZW4gdGhhdCBpdCBsb29wcyBmb3JldmVyIGF0IHRoZSBzdHZlYyBh
ZGRyZXNzIHdoaWNoIAo+IGFsbG93cyB0byBrbm93IHdoZXJlIHRoZSBib290IGZhaWxlZC4KCklm
IHNhdHAgaGFkIGEgcHJvYmxlbSwgdGhlbiBjcHUgY2FuIG5vdCBmZXRjaCBpbnN0cnVjdGlvbiB3
aGVyZSBzdHZlYyAKcG9pbnRpbmcgdG8sIGFzIHdoYXQgcGFsbWVyIHNhaWQ6IGlmIHlvdSBlbmQg
dXAgaW4gYSBwb3NpdGlvbiB3aGVyZSB0aGUgCnByb2Nlc3NlciBpcyB1bmFibGUgdG8gY29tbWl0
IGFuIGluc3RydWN0aW9uIHlvdSBhbHNvCgpsb3NlIHRoZSBhYmlsaXR5IHRvIGRvIGFueXRoaW5n
IG1lYW5pbmdmdWwgd2l0aCB0aGUgZGVidWdnZXIsIHRodXMgCmVzc2VudGlhbGx5IGxvY2tpbmcg
dXAgdGhlIHN5c3RlbS4KCj4KPj4KPj4gTW9yZSwgaW4gdGhlIG9yaWdpbmFsIGNvZGUsIGJlZm9y
ZSBzZXQgdHJhbXBvbGluZV9wZ19kaXIsIHdoYXQgaWYgdGhlIAo+PiB0cmFtcG9saW5lX3BnX2Rp
ciBoYWQgYSBwcm9ibGVtPwo+Cj4gWW91J3JlIHJpZ2h0IGJ1dCB0aGlzIGRlYnVnICdmZWF0dXJl
JyB3YXMgbm90IGluc3RhbGxlZCwgSSBndWVzcyAKPiBzb21lYm9keSBoYWQgYSBoYXJkIHRpbWUg
YXQgc29tZSBwb2ludCB3aXRoIHRoZSBlYXJseSBwYWdlIHRhYmxlIGFuZCAKPiBub3QgdGhlIHRy
YW1wb2xpbmUgOikKPgo+IEFueXdheSwgSSB3YXMganVzdCBwb2ludGluZyB0aGF0IHlvdSAnYnJv
a2UnIHRoZSBjdXJyZW50IHdheSB0aGluZ3MgCj4gd29yayBhbmQgdW5sZXNzIHRoaXMgaXMgZm9y
IGFuIGV4cGxpY2l0IGdvb2QgcmVhc29uLCB0aGF0IHNob3VsZCBub3QgCj4gaGFwcGVuLgo+ClRo
ZSBkZXNpZ24gbG9naWMgaXM6IGF0IHRoZSBmaXJzdCB0aW1lIGNwdSBjb252ZXJ0IHRvIHZpcnR1
YWwgYWRkcmVzcyAKd29ybGQgZnJvbSBwaHlzaWNhbCB3b3JsZCwgYWN0dWFsbHkgc3R2ZWMgaXMg
YSByZWFsICJ0cmFtcG9saW5lIizCoCBpdCAKY2FuIG5vdCBiZSBzZXQKCmFzIGEgcG9pbnRlciB0
byBzcGluIHRyYXAsIGl0IHNob3VsZCBiZSBzZXQgdG8gdGhlIGZpcnN0IHBsYWNlIGluIAp2aXJ0
dWFsIHdvcmxkIHdoZXJlIHdlIHdhbm5hIGdvLiBBZnRlciB0aGF0LCB0aGVuIHdlIHNldCBzdHZl
YyBhcyBhIHNwaW4gCnRyYXAgdG8gY2F0Y2gKCmFueSBwcm9ibGVtIGluIGxhdGVyIHJ1bm5pbmcu
CgpTbywgZm9yIDY0Yml0IHN5c3RlbSwgaWYgd2Ugd2FudCB0byBkZWxldGXCoCB0cmFtcG9saW5l
X3BnX2RpciwgdGhlIApkZXNpZ24gcHJpbmNpcGxlIGlzIG5vdCBicm9rZW4gaGVyZS4gRm9yIDMy
Yml0IHN5c3RlbSwgSSByZWFsbHkgbmVlZCAKY2hhbmdlIGJhY2suCgo+Pgo+Pj4gRXNzZW50aWFs
bHkuCj4+Pgo+Pj4gVGhlIHNwZWNpZmljIGlzc3VlIGlzIHRoYXQgdGhlIEpUQUcgZGVidWcgc3Bl
YyBpcyBkZWZpbmVkIChvciBhdCAKPj4+IGxlYXN0IHdhcyB3aGVuIEkgd2FzIHVzaW5nIGl0LCBp
dCdzIGJlZW4geWVhcnMgc2luY2UgSSd2ZSBuZWVkZWQgdG8gCj4+PiBkbyB0aGF0KSBpbiB0ZXJt
cyBvZiBjb21taXR0ZWQgaW5zdHJ1Y3Rpb25zLsKgIFRodXMgaWYgeW91IGVuZCB1cCBpbiAKPj4+
IGEgcG9zaXRpb24gd2hlcmUgdGhlIHByb2Nlc3NlciBpcyB1bmFibGUgdG8gY29tbWl0IGFuIGlu
c3RydWN0aW9uIAo+Pj4geW91IGFsc28gbG9zZSB0aGUgYWJpbGl0eSB0byBkbyBhbnl0aGluZyBt
ZWFuaW5nZnVsIHdpdGggdGhlIAo+Pj4gZGVidWdnZXIsIHRodXMgZXNzZW50aWFsbHkgbG9ja2lu
ZyB1cCB0aGUgc3lzdGVtLgo+Pj4KPj4+IFRoZSBtb3N0IGNvbW1vbiB3YXkgdG8gZW5kIHVwIGlu
IGEgc2l0dWF0aW9uIHdoZXJlIHRoZSBwcm9jZXNzb3IgaXMgCj4+PiB1bmFibGUgdG8gY29tbWl0
IGFuIGluc3RydWN0aW9uIGlzIHRvIGhhdmUgYSBmYXVsdCB3aXRoIGFuIGludmFsaWQgCj4+PiB0
cmFwIHZlY3RvcjogbWF5YmUgZGFuZ2xpbmcgZnJvbSBNLW1vZGUsIHRoZSBsYXN0IGJvb3QsIHJl
c2V0LCAKPj4+IHdoYXRldmVyLsKgIFRoZW4gYXMgc29vbiBhcyB5b3UgdGFrZSBhIHRyYXAgdGhl
IHN5c3RlbSBsb2NrcyB1cC7CoCBBbnkgCj4+PiB0cmFwIGJlZm9yZSB3ZSBoYXZlIGEgd29ya2lu
ZyB0cmFwIGhhbmRsZXIgaXMgYSBidWcsIGJ1dCBpdCdzIHdheSAKPj4+IGhhcmRlciB0byBkZWJ1
ZyB0aGluZ3Mgd2hlbiB0aGUgZGVidWdnZXIgZG9lc24ndCBmdW5jdGlvbi4KPj4+Cj4+PiBUaGVy
ZSBpcyBvZiBjb3Vyc2Ugbm8gd2F5IHRvIGZ1bmRhbWVudGFsbHkgcHJldmVudCB0aGVzZSBzb3J0
IG9mIAo+Pj4gbm8tY29tbWl0YWJsZS1pbnN0cnVjdGlvbiBzaXR1YXRpb25zLCBidXQgSSBnb3Qg
aW50byB0aGUgaGFiYml0IG9mIAo+Pj4ganVzdCBzZXR0aW5nIHVwIGEgdHJpdmlhbCB0cmFwIGVu
dHJ5IHBvaW50IEFTQVAgLS0gaXQgcHJvYmFibHkgdG9vayAKPj4+IGEgZG96ZW4gcm91bmRzIG9m
IHRyeWluZyB0byBkZWJ1ZyB0aGUgZGVidWdnZXIgb25seSB0byByZWFsaXplIGl0IAo+Pj4gd2Fz
IHBlciBzcGVjIHRvIGhhbmcsIGJ1dCB0aGF0IGlkaW9tIGV2ZW50dWFsbHkgY3JlcHQgaW50byBw
cmV0dHkgCj4+PiBtdWNoIGV2ZXJ5dGhpbmcuCj4+Pgo+Pj4gTm90IHN1cmUgaWYgdGhlIGRlYnVn
IHNwZWMgaXMgc3RpbGwgd3JpdHRlbiB0aGlzIHdheSAob3IgaWYgCj4+PiBkZWJ1Z2dlcnMgcmVz
cGVjdCBpdCksIGFzIEkgaGF2ZW4ndCBoYWQgdG8gdXNlIG9uZSBpbiBhIHdoaWxlLgo+Pj4KPj4+
Pgo+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIv
YXJjaC9yaXNjdi9tbS9pbml0LmMKPj4+Pj4+IGluZGV4IGFjNDg3NDJmYTZmYy4uMzA2ZmNiMjMz
NGZhIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4+Pj4+ICsrKyBi
L2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+Pj4+PiBAQCAtMjE5LDEzICsyMTksMTcgQEAgdW5zaWdu
ZWQgbG9uZyBwZm5fYmFzZSBfX3JvX2FmdGVyX2luaXQ7Cj4+Pj4+PiDCoCBFWFBPUlRfU1lNQk9M
KHBmbl9iYXNlKTsKPj4+Pj4+IMKgIHBnZF90IHN3YXBwZXJfcGdfZGlyW1BUUlNfUEVSX1BHRF0g
X19wYWdlX2FsaWduZWRfYnNzOwo+Pj4+Pj4gKyNpZm5kZWYgQ09ORklHXzY0QklUCj4+Pj4+PiDC
oCBwZ2RfdCB0cmFtcG9saW5lX3BnX2RpcltQVFJTX1BFUl9QR0RdIF9fcGFnZV9hbGlnbmVkX2Jz
czsKPj4+Pj4+ICsjZW5kaWYgLyogQ09ORklHXzY0QklUICovCj4+Pj4KPj4+Pgo+Pj4+IEFzIHN0
YXRlZCBpbiBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxlLnJzdCwgaXQgaXMgYmV0
dGVyIAo+Pj4+IHRvIHVzZQo+Pj4+IF9fbWF5YmVfdW51c2VkIHJhdGhlciB0aGFuICNpZmRlZnMu
Cj4+Pj4KPj4+Pgo+PiBJJ20gYWZyYWlkIHRoYXQgX19tYXliZV91bnVzZWQgY2FuIG5vdCBzYXZl
IG9uZSBwYWdlIG1lbW9yeSBoZXJlLgo+Cj4gV2hhdCBkbyB5b3UgbWVhbj8KPgpJIG1lYW4gdHJh
bXBvbGluZV9wZ19kaXIgY29zdCA0MDk2IGJ5dGVzIGhlcmUgYW5kIF9fbWF5YmVfdW51c2VkIG9u
bHkgCnRlbGwgY29tcGlsZXIgZG9uJ3QgcmFpc2UgYSB3YXJuaW5nLCBidXQgaXQgc3RpbGwgY29z
dCBtZW1vcnkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
