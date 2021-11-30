Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D8FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 06:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXjvlgr4xRBsNgmlfvpGBa3tMSgWh3W4uXF+Fu8XVQI=; b=Q9KIdfyeEq1dYS
	lOOKDM5bFtfR7uVAWntHD5MSUsVlY5DfvCGsRBC/bXWEEAsx9Xk3KesZamKRb0UMMfxm8sJ2yBhNz
	QbffqRs9WMTB7sBuWFTO8dxYIJLHWhabEubuiP5to5/hneUo73vf9S4khjC4Xi8DqbLTQNgRALlM4
	v0/oP0ucZFjB3cLeduEZXPmOgiNpPnsBnnhSd2dF2wLB/1t4l1aTDLAZxK14Xw1PPV8z8HiUBpbwe
	/3RMnDoT9eqos/wmVbwRTaFFQfygbwdrvtot/9HjSDbZG03Hbrywg9K5uippCi48mmSb6WMMe0L+t
	UKmQbNCBv2p4VYQTBT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwcD-003nk9-00; Tue, 30 Nov 2021 06:27:45 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwbx-003nge-IK; Tue, 30 Nov 2021 06:27:31 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J3Byk5GSHz1DJpF;
 Tue, 30 Nov 2021 14:24:46 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:27:26 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:27:25 +0800
Message-ID: <ab9b7446-e955-67da-b9f3-1e1c15566fdb@huawei.com>
Date: Tue, 30 Nov 2021 14:27:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 3/4] mm: percpu: Add generic pcpu_fc_alloc/free
 funciton
Content-Language: en-US
To: Dennis Zhou <dennis@kernel.org>
CC: <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <tj@kernel.org>, <gregkh@linuxfoundation.org>,
 <cl@linux.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <tsbogend@alpha.franken.de>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <sparclinux@vger.kernel.org>,
 <x86@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <20211121093557.139034-4-wangkefeng.wang@huawei.com>
 <YaVYGCB+I7QLZo0+@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <YaVYGCB+I7QLZo0+@fedora>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_222729_958885_F3C1A771 
X-CRM114-Status: GOOD (  13.68  )
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

Ck9uIDIwMjEvMTEvMzAgNjo0NSwgRGVubmlzIFpob3Ugd3JvdGU6Cj4gT24gU3VuLCBOb3YgMjEs
IDIwMjEgYXQgMDU6MzU6NTZQTSArMDgwMCwgS2VmZW5nIFdhbmcgd3JvdGU6Cj4+IFdpdGggcHJl
dmlvdXMgcGF0Y2gsIHdlIGNvdWxkIGFkZCBhIGdlbmVyaWMgcGNwdSBmaXJzdCBjaHVuawo+PiBh
bGxvY2F0aW9uIGFuZCBmcmVlIGZ1bmN0aW9uIHRvIGNsZWFudXAgdGhlIGR1cGxpY2F0ZWQgZGVm
aW5hdGlvbnMKPj4gb24gZWFjaCBhcmNoaXRlY3R1cmUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtl
ZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9t
aXBzL21tL2luaXQuYyAgICAgICAgICAgIHwgMTYgKy0tLS0tLS0tCj4+ICAgYXJjaC9wb3dlcnBj
L2tlcm5lbC9zZXR1cF82NC5jIHwgNTEgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICBh
cmNoL3NwYXJjL2tlcm5lbC9zbXBfNjQuYyAgICAgfCA1MCArLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+PiAgIGFyY2gveDg2L2tlcm5lbC9zZXR1cF9wZXJjcHUuYyB8IDU5ICstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIGRyaXZlcnMvYmFzZS9hcmNoX251bWEuYyAgICAgICB8
IDE5ICstLS0tLS0tLS0KPj4gICBpbmNsdWRlL2xpbnV4L3BlcmNwdS5oICAgICAgICAgfCAgOSAr
LS0tLQo+PiAgIG1tL3BlcmNwdS5jICAgICAgICAgICAgICAgICAgICB8IDY2ICsrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPj4gICA3IGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlv
bnMoKyksIDIyOCBkZWxldGlvbnMoLSkKLi4uCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3BlcmNwdS5oIGIvaW5jbHVkZS9saW51eC9wZXJjcHUuaAo+PiBpbmRleCA0MWJiNTQ3MTViMGMu
LmQ3M2M5N2VmNGZmNCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9wZXJjcHUuaAo+PiAr
KysgYi9pbmNsdWRlL2xpbnV4L3BlcmNwdS5oCj4+IEBAIC05NSw5ICs5NSw2IEBAIGV4dGVybiBj
b25zdCBjaGFyICogY29uc3QgcGNwdV9mY19uYW1lc1tQQ1BVX0ZDX05SXTsKPj4gICBleHRlcm4g
ZW51bSBwY3B1X2ZjIHBjcHVfY2hvc2VuX2ZjOwo+PiAgIAo+PiAgIHR5cGVkZWYgaW50IChwY3B1
X2ZjX2NwdV90b19ub2RlX2ZuX3QpKGludCBjcHUpOwo+PiAtdHlwZWRlZiB2b2lkICogKCpwY3B1
X2ZjX2FsbG9jX2ZuX3QpKHVuc2lnbmVkIGludCBjcHUsIHNpemVfdCBzaXplLCBzaXplX3QgYWxp
Z24sCj4+IC0JCQkJICAgICBwY3B1X2ZjX2NwdV90b19ub2RlX2ZuX3QgY3B1X3RvX25kX2ZuKTsK
Pj4gLXR5cGVkZWYgdm9pZCAoKnBjcHVfZmNfZnJlZV9mbl90KSh2b2lkICpwdHIsIHNpemVfdCBz
aXplKTsKPj4gICB0eXBlZGVmIHZvaWQgKCpwY3B1X2ZjX3BvcHVsYXRlX3B0ZV9mbl90KSh1bnNp
Z25lZCBsb25nIGFkZHIpOwo+PiAgIHR5cGVkZWYgaW50IChwY3B1X2ZjX2NwdV9kaXN0YW5jZV9m
bl90KSh1bnNpZ25lZCBpbnQgZnJvbSwgdW5zaWduZWQgaW50IHRvKTsKPj4gICAKPj4gQEAgLTEx
MiwxNSArMTA5LDExIEBAIGV4dGVybiB2b2lkIF9faW5pdCBwY3B1X3NldHVwX2ZpcnN0X2NodW5r
KGNvbnN0IHN0cnVjdCBwY3B1X2FsbG9jX2luZm8gKmFpLAo+PiAgIGV4dGVybiBpbnQgX19pbml0
IHBjcHVfZW1iZWRfZmlyc3RfY2h1bmsoc2l6ZV90IHJlc2VydmVkX3NpemUsIHNpemVfdCBkeW5f
c2l6ZSwKPj4gICAJCQkJc2l6ZV90IGF0b21fc2l6ZSwKPj4gICAJCQkJcGNwdV9mY19jcHVfZGlz
dGFuY2VfZm5fdCBjcHVfZGlzdGFuY2VfZm4sCj4+IC0JCQkJcGNwdV9mY19jcHVfdG9fbm9kZV9m
bl90IGNwdV90b19uZF9mbiwKPj4gLQkJCQlwY3B1X2ZjX2FsbG9jX2ZuX3QgYWxsb2NfZm4sCj4+
IC0JCQkJcGNwdV9mY19mcmVlX2ZuX3QgZnJlZV9mbik7Cj4+ICsJCQkJcGNwdV9mY19jcHVfdG9f
bm9kZV9mbl90IGNwdV90b19uZF9mbik7Cj4+ICAgI2VuZGlmCj4+ICAgCj4+ICAgI2lmZGVmIENP
TkZJR19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSwo+PiAgIGV4dGVybiBpbnQgX19pbml0
IHBjcHVfcGFnZV9maXJzdF9jaHVuayhzaXplX3QgcmVzZXJ2ZWRfc2l6ZSwKPj4gLQkJCQlwY3B1
X2ZjX2FsbG9jX2ZuX3QgYWxsb2NfZm4sCj4+IC0JCQkJcGNwdV9mY19mcmVlX2ZuX3QgZnJlZV9m
biwKPj4gICAJCQkJcGNwdV9mY19jcHVfdG9fbm9kZV9mbl90IGNwdV90b19uZF9mbiwKPj4gICAJ
CQkJcGNwdV9mY19wb3B1bGF0ZV9wdGVfZm5fdCBwb3B1bGF0ZV9wdGVfZm4pOwo+PiAgICNlbmRp
Zgo+PiBkaWZmIC0tZ2l0IGEvbW0vcGVyY3B1LmMgYi9tbS9wZXJjcHUuYwo+PiBpbmRleCAzZjZj
ZjFmZjBiZTIuLmVmYWExY2JhZjczZCAxMDA2NDQKPj4gLS0tIGEvbW0vcGVyY3B1LmMKPj4gKysr
IGIvbW0vcGVyY3B1LmMKPj4gQEAgLTI5OTIsNiArMjk5MiwzMCBAQCBzdGF0aWMgc3RydWN0IHBj
cHVfYWxsb2NfaW5mbyAqIF9faW5pdCBfX2ZsYXR0ZW4gcGNwdV9idWlsZF9hbGxvY19pbmZvKAo+
PiAgIAo+PiAgIAlyZXR1cm4gYWk7Cj4+ICAgfQo+PiArCj4+ICtzdGF0aWMgdm9pZCAqIF9faW5p
dCBwY3B1X2ZjX2FsbG9jKHVuc2lnbmVkIGludCBjcHUsIHNpemVfdCBzaXplLCBzaXplX3QgYWxp
Z24sCj4+ICsJCQkJICAgcGNwdV9mY19jcHVfdG9fbm9kZV9mbl90IGNwdV90b19uZF9mbikKPj4g
K3sKPj4gKwljb25zdCB1bnNpZ25lZCBsb25nIGdvYWwgPSBfX3BhKE1BWF9ETUFfQUREUkVTUyk7
Cj4+ICsJaW50IG5vZGUgPSBOVU1BX05PX05PREU7Cj4+ICsJdm9pZCAqcHRyOwo+PiArCj4+ICsJ
aWYgKGNwdV90b19uZF9mbikKPj4gKwkJbm9kZSA9IGNwdV90b19uZF9mbihjcHUpOwo+PiArCj4+
ICsJaWYgKG5vZGUgPT0gTlVNQV9OT19OT0RFIHx8ICFub2RlX29ubGluZShub2RlKSB8fCAhTk9E
RV9EQVRBKG5vZGUpKSB7Cj4+ICsJCXB0ciA9IG1lbWJsb2NrX2FsbG9jX2Zyb20oc2l6ZSwgYWxp
Z24sIGdvYWwpOwo+PiArCX0gZWxzZSB7Cj4+ICsJCXB0ciA9IG1lbWJsb2NrX2FsbG9jX3RyeV9u
aWQoc2l6ZSwgYWxpZ24sIGdvYWwsCj4+ICsJCQkJCSAgICAgTUVNQkxPQ0tfQUxMT0NfQUNDRVNT
SUJMRSwgbm9kZSk7Cj4+ICsJfQo+PiArCXJldHVybiBwdHI7Cj4+ICt9Cj4gTXkgcHJlZmVyZW5j
ZSBoZXJlIHdvdWxkIGJlIHRvIGtlZXAgdGhpcyBpZGVudGljYWwgdG8gdGhlIHg4Ngo+IGltcGxl
bWVudGF0aW9uIHdoZXJlIHdlICNpZmRlZiBDT05GSUdfTlVNQS4KCkkgd2lsbCBhZGQgYmFjayAn
I2lmZGVmIENPTkZJR19OVU1BJyzCoCBhbHNvIHdpbGwgYWRkIGJhY2sgdGhlIApwcl9kZWJ1Zy9w
cl9pbmZvIHBhcnQgYXMgeDg2IGRvZXMsCgo+IE92ZXJhbGwgdGhpcyBtYWtlcyBzZW5zZS4KPgo+
IFRoYW5rcywKPiBEZW5uaXMKPiAuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
