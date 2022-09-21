Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E7CC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 11:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xdGCCFF9atBpRrAd559JAyYMPq4UlVReRG8oOAypwg=; b=tjHgAOzxbzICBT
	ET212jS9V1VakwMi0BbgVCRSk+ipcQZWZtk+CHBx9qTEB/zk4hzAeHKNvflkUWm0lDi4onIlUaPTx
	Slhd5TB/ssBRVmxkQrL36HLepdRllNCLZYCM2SnFUBzVgM9qAlzUQwinL2vzdJPoRqEf8hSOtMIPV
	L2lNGxgl1fgXRK1t4/S4Pe1E+9gGc022ufu079e6J2Xmy95R/3mhMdOm+aIYEHrN2w6yMYhW8ARzc
	q8dHQ+np/WXiYCDiuTkhrqc3drmHnd6nmNMMGhIbvC4jfl5qkMPUJDbkHUQ9arih+rs0dpWa7fKBx
	wJg9jpIUymrGteR5M8bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayLD-00BD7x-UC; Wed, 21 Sep 2022 11:56:35 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oayL9-00BD5L-SJ
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 11:56:34 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXcGV1RtnzlVwt;
	Wed, 21 Sep 2022 19:52:18 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 19:56:25 +0800
Received: from [10.67.108.67] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 19:56:25 +0800
Message-ID: <df9590bc-1a61-28c0-55eb-9f9539d03144@huawei.com>
Date: Wed, 21 Sep 2022 19:56:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH V5 08/11] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>
CC: <arnd@arndb.de>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<peterz@infradead.org>, <luto@kernel.org>, <conor.dooley@microchip.com>,
	<heiko@sntech.de>, <jszhang@kernel.org>, <lazyparser@gmail.com>,
	<falcon@tinylab.org>, <chenhuacai@kernel.org>, <apatel@ventanamicro.com>,
	<atishp@atishpatra.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<mark.rutland@arm.com>, <zouyipeng@huawei.com>, <bigeasy@linutronix.de>,
	<David.Laight@aculab.com>, <linux-arch@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Guo Ren
	<guoren@linux.alibaba.com>
References: <20220918155246.1203293-1-guoren@kernel.org>
 <20220918155246.1203293-9-guoren@kernel.org>
 <afa17bdd-2d11-4015-6e2a-7a39db931d09@huawei.com>
 <CAJF2gTRMt4zDQcvBOxge-4+6o1mqhWds_AiFKamdCzKJZfoKPw@mail.gmail.com>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <CAJF2gTRMt4zDQcvBOxge-4+6o1mqhWds_AiFKamdCzKJZfoKPw@mail.gmail.com>
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500013.china.huawei.com (7.185.36.172)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_045632_282174_CC1E5A94 
X-CRM114-Status: GOOD (  10.71  )
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

SGksCgpTb3JyeSB0byBib3RoZXIgYWdhaW4sIEkganVzdCBmaW5pc2hlZCB0aGUgdGVzdCB3aXRo
IHlvdXIgcGF0Y2hlcyBvbiAKbWluZSBwYXRjaCBzZXQuCgpPbiAyMDIyLzkvMjEgMTc6NTMsIEd1
byBSZW4gd3JvdGU6Cj4gT24gV2VkLCBTZXAgMjEsIDIwMjIgYXQgNDozNCBQTSBDaGVuIFpob25n
amluIDxjaGVuemhvbmdqaW5AaHVhd2VpLmNvbT4gd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAyMDIy
LzkvMTggMjM6NTIsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4+PiBp
bmRleCA1ZjQ5NTE3Y2QzYTIuLjQyNjUyOWI4NGRiMCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlMKPj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPj4+
IEBAIC0zMzIsNiArMzMyLDMzIEBAIEVOVFJZKHJldF9mcm9tX2tlcm5lbF90aHJlYWQpCj4+PiAg
ICAgICAgdGFpbCBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlCj4+PiAgICBFTkRQUk9DKHJldF9m
cm9tX2tlcm5lbF90aHJlYWQpCj4+Pgo+Pj4gKyNpZmRlZiBDT05GSUdfSVJRX1NUQUNLUwo+Pj4g
K0VOVFJZKGNhbGxfb25fc3RhY2spCj4+PiArICAgICAvKiBDcmVhdGUgYSBmcmFtZSByZWNvcmQg
dG8gc2F2ZSBvdXIgcmEgYW5kIGZwICovCj4+PiArICAgICBhZGRpICAgIHNwLCBzcCwgLVJJU0NW
X1NaUFRSCj4+PiArICAgICBSRUdfUyAgIHJhLCAoc3ApCj4+PiArICAgICBhZGRpICAgIHNwLCBz
cCwgLVJJU0NWX1NaUFRSCj4+PiArICAgICBSRUdfUyAgIGZwLCAoc3ApCj4+PiArCj4+PiArICAg
ICAvKiBTYXZlIHNwIGluIGZwICovCj4+PiArICAgICBtb3ZlICAgIGZwLCBzcAo+Pj4gKwoKQ29u
c2lkZXJpbmcgdGhhdCBzMCBwb2ludHMgdG8gcHJldmlvdXMgc3Agbm9ybWFsbHksIEkgdGhpbmsg
aGVyZSB3ZSAKc2hvdWxkIGhhdmUgJ2FkZGkgZnAsIHNwLCAyKlJJU0NWX1NaUFRSJy4KCkFuIGV4
YW1wbGUgYmVsb3c6CgogwqDCoMKgIGFkZGnCoMKgwqAgc3AsIHNwLCAtMTYKIMKgwqDCoCBzZMKg
IHJhLCA4KHNwKQogwqDCoMKgIHNkwqAgczAsIDAoc3ApCiDCoMKgwqAgYWRkacKgwqDCoCBzMCwg
c3AsIDE2wqDCoMKgIDwtIHMwIGlzIHNldCB0byBwcmV2aW91cyBzcAogwqDCoMKgIC4uLgoKIMKg
wqDCoCBsZMKgIHJhLDgoc3ApCiDCoMKgwqAgbGTCoCBzMCwwKHNwKQogwqDCoMKgIGFkZGnCoMKg
wqAgc3Asc3AsMTYKClNvIG1heWJlIGl0J3MgYmV0dGVyIHRvIHNhdmUgdGhlIHN0YWNrIGZyYW1l
IGFzIGJlbG93OgoKIMKgwqDCoCBhZGRpwqDCoMKgIHNwLCBzcCwgLTIqUklTQ1ZfU1pQVFIKIMKg
wqDCoCBSRUdfU8KgwqAgcmEsIFJJU0NWX1NaUFRSKHNwKQogwqDCoMKgIFJFR19TwqDCoCBzMCwg
KHNwKQoKIMKgwqDCoCAvKiBTYXZlIHNwIGluIGZwICovCiDCoMKgwqAgYWRkacKgwqDCoCBzMCwg
c3AsIDIqUklTQ1ZfU1pQVFIKCiDCoMKgwqAgLi4uCgogwqDCoMKgIC8qCiDCoMKgwqDCoCAqIFJl
c3RvcmUgc3AgZnJvbSBwcmV2IGZwLCBhbmQgZnAsIHJhIGZyb20gdGhlIGZyYW1lCiDCoMKgwqDC
oCAqLwogwqDCoMKgIGFkZGnCoMKgwqAgc3AsIHMwLCAtMipSSVNDVl9TWlBUUgogwqDCoMKgIFJF
R19MwqDCoCByYSwgUklTQ1ZfU1pQVFIoc3ApCiDCoMKgwqAgUkVHX0zCoMKgIHMwLCAoc3ApCiDC
oMKgwqAgYWRkacKgwqDCoCBzcCwgc3AsIDIqUklTQ1ZfU1pQVFIKCgpBbnl3YXksIGxldHMgc2V0
IGZwIGFzIHNwICsgMiAqIFJJU0NWX1NaUFRSLCBzbyB0aGF0IHVud2luZGVyIGNhbiAKY29ubmVj
dCB0d28gc3RhY2tzIHNhbWUgYXMgbm9ybWFsIGZ1bmN0aW9uLgoKSSB0ZXN0ZWQgdGhpcyB3aXRo
IG15IHBhdGNoIGFuZCB0aGUgdW53aW5kZXIgd29ya3MgcHJvcGVybHkuCgoKVGhhbmtzIGZvciB5
b3VyIHRpbWUhCgpCZXN0LAoKQ2hlbgoKPj4+ICsgICAgIC8qIE1vdmUgdG8gdGhlIG5ldyBzdGFj
ayBhbmQgY2FsbCB0aGUgZnVuY3Rpb24gdGhlcmUgKi8KPj4+ICsgICAgIGxpICAgICAgYTMsIElS
UV9TVEFDS19TSVpFCj4+PiArICAgICBhZGQgICAgIHNwLCBhMSwgYTMKPj4+ICsgICAgIGphbHIg
ICAgYTIKPj4+ICsKPj4+ICsgICAgIC8qCj4+PiArICAgICAgKiBSZXN0b3JlIHNwIGZyb20gcHJl
diBmcCwgYW5kIGZwLCByYSBmcm9tIHRoZSBmcmFtZQo+Pj4gKyAgICAgICovCj4+PiArICAgICBt
b3ZlICAgIHNwLCBmcAo+Pj4gKyAgICAgUkVHX0wgICBmcCwgKHNwKQo+Pj4gKyAgICAgYWRkaSAg
ICBzcCwgc3AsIFJJU0NWX1NaUFRSCj4+PiArICAgICBSRUdfTCAgIHJhLCAoc3ApCj4+PiArICAg
ICBhZGRpICAgIHNwLCBzcCwgUklTQ1ZfU1pQVFIKPj4+ICsgICAgIHJldAo+Pj4gK0VORFBST0Mo
Y2FsbF9vbl9zdGFjaykKPj4+ICsjZW5kaWYKPj4gU2VlbXMgbXkgY29tcGlsZXIgKHJpc2N2NjQt
bGludXgtZ251LWdjYyA4LjQuMCwgY3Jvc3MgY29tcGlsaW5nIGZyb20KPj4geDg2KSBjYW5ub3Qg
cmVjb2duaXplIHRoZSByZWdpc3RlciBgZnBgLgo+IFRoZSB3aG9sZSBlbnRyeS5TIHVzZXMgczAg
aW5zdGVhZCBvZiBmcCwgc28gSSBhcHByb3ZlIG9mIHlvdXIgYWR2aWNlLiBUaHguCj4KPj4gQWZ0
ZXIgSSBjaGFuZ2VkIGl0IHRvIGBzMGAgdGhpcyBjYW4gcGFzcyBjb21waWxpbmcuCj4+Cj4+Cj4+
IFNlZW1zIHRoZXJlIGlzIG5vd2hlcmUgZWxzZSB1c2luZyBgZnBgLCBjYW4gdGhpcyBqdXN0IHVz
aW5nIGBzMGAgaW5zdGVhZD8KPj4KPj4gQmVzdCwKPj4KPj4gQ2hlbgo+Pgo+PgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
