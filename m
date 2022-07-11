Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA9CC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 13:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+tIy/JnMSzSYn1DEVBM0GQtaaBkZgdRKji7rk+pHbc=; b=QLqNuTaL+ZaGn8
	G21MpmnRtCPBwp7Rq58pPHha1tnk9ND7L3a9YzIAz0dWE8VdZ/hg7RQYz8iHSGdYWMCbjA7E+/dG2
	MsaJKUp8klulUXDp3X3SAfgXLXFS5PsGUPybl1OD+61/nSKWTCIvQno1R/IvLWdmTS3m4ZlLb+/7C
	CU+RcOmlLBFaFIoP3uJdYXOPdB73dubu+Ax1RNXX/zkzfoFgVEZo/6a462zoIlFE3IzyaOmWM7lEi
	9Js9EBp2SKQPMNPWuE7OFJD0O3x7jW+X/DsCC/4EQatAx19yPp4AdQbQN2wWfvZZ9V/uUb/cFAb6t
	Bz5k+4OzvVI0n6NL4y0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtZV-001x5J-Nb; Mon, 11 Jul 2022 13:35:33 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAtZD-001wv6-7e; Mon, 11 Jul 2022 13:35:18 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LhPvr4LMyzkWtj;
	Mon, 11 Jul 2022 21:32:56 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 21:35:05 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 21:35:04 +0800
Message-ID: <13b283fe-10f7-376f-9b8e-856e4d1e0ede@huawei.com>
Date: Mon, 11 Jul 2022 21:35:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/4] mm: rmap: Allow platforms without mm_cpumask to
 defer TLB flush
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>, <akpm@linux-foundation.org>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<x86@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-doc@vger.kernel.org>
CC: <corbet@lwn.net>, <arnd@arndb.de>, <linux-kernel@vger.kernel.org>,
	<darren@os.amperecomputing.com>, <yangyicong@hisilicon.com>,
	<huzhanyuan@oppo.com>, <lipeifeng@oppo.com>, <zhangshiming@oppo.com>,
	<guojian@oppo.com>, <realmz6@gmail.com>, <linux-mips@vger.kernel.org>,
	<openrisc@lists.librecores.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>, Barry Song
	<v-songbaohua@oppo.com>
References: <20220711034615.482895-1-21cnbao@gmail.com>
 <20220711034615.482895-3-21cnbao@gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20220711034615.482895-3-21cnbao@gmail.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_063516_457007_9B4AA72C 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

SGkgQmFycnnvvIwKCk9uIDIwMjIvNy8xMSAxMTo0NiwgQmFycnkgU29uZyB3cm90ZToKPiBGcm9t
OiBCYXJyeSBTb25nIDx2LXNvbmdiYW9odWFAb3Bwby5jb20+Cj4KPiBQbGF0Zm9ybXMgbGlrZSBB
Uk02NCBoYXZlIGhhcmV3YXJlIFRMQiBzaG9vdGRvd24gYnJvYWRjYXN0LiBUaGV5Cj4gZG9uJ3Qg
bWFpbnRhaW4gbW1fY3B1bWFzayBidXQganVzdCBzZW5kIHRsYmkgYW5kIHJlbGF0ZWQgc3luYwo+
IGluc3RydWN0aW9ucyBmb3IgVExCIGZsdXNoLiB0YXNrJ3MgbW1fY3B1bWFzayBpcyBub3JtYWxs
eSBlbXB0eQo+IGluIHRoaXMgY2FzZS4gV2UgYWxzbyBhbGxvdyBkZWZlcnJlZCBUTEIgZmx1c2gg
b24gdGhpcyBraW5kIG9mCj4gcGxhdGZvcm1zLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFycnkgU29u
ZyA8di1zb25nYmFvaHVhQG9wcG8uY29tPj4KPiAtLS0KLi4uCj4gZGlmZiAtLWdpdCBhL21tL0tj
b25maWcgYi9tbS9LY29uZmlnCj4gaW5kZXggMTY5ZTY0MTkyZTQ4Li43YmY1NGY1N2NhMDEgMTAw
NjQ0Cj4gLS0tIGEvbW0vS2NvbmZpZwo+ICsrKyBiL21tL0tjb25maWcKPiBAQCAtOTUxLDYgKzk1
MSw5IEBAIGNvbmZpZyBBUkNIX0hBU19DVVJSRU5UX1NUQUNLX1BPSU5URVIKPiAgIAkgIHJlZ2lz
dGVyIGFsaWFzIG5hbWVkICJjdXJyZW50X3N0YWNrX3BvaW50ZXIiLCB0aGlzIGNvbmZpZyBjYW4g
YmUKPiAgIAkgIHNlbGVjdGVkLgo+ICAgCj4gK2NvbmZpZyBBUkNIX0hBU19NTV9DUFVNQVNLCj4g
Kwlib29sCj4gKwo+ICAgY29uZmlnIEFSQ0hfSEFTX1ZNX0dFVF9QQUdFX1BST1QKPiAgIAlib29s
Cj4gICAKPiBkaWZmIC0tZ2l0IGEvbW0vcm1hcC5jIGIvbW0vcm1hcC5jCj4gaW5kZXggNWJjYjMz
NGNkNmYyLi4xM2Q0ZjlhMWQ0ZjEgMTAwNjQ0Cj4gLS0tIGEvbW0vcm1hcC5jCj4gKysrIGIvbW0v
cm1hcC5jCj4gQEAgLTY5Miw2ICs2OTIsMTAgQEAgc3RhdGljIGJvb2wgc2hvdWxkX2RlZmVyX2Zs
dXNoKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBlbnVtIHR0dV9mbGFncyBmbGFncykKPiAgIAlpZiAo
IShmbGFncyAmIFRUVV9CQVRDSF9GTFVTSCkpCj4gICAJCXJldHVybiBmYWxzZTsKPiAgIAo+ICsj
aWZuZGVmIENPTkZJR19BUkNIX0hBU19NTV9DUFVNQVNLCj4gKwlyZXR1cm4gdHJ1ZTsKPiArI2Vu
ZGlmCj4gKwoKSGVyZSBpcyBhbm90aGVyIG9wdGlvbiB0byBlbmFibGUgYXJjaCdzIHRsYmJhdGNo
IGRlZmVyCgpbMV0gCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBw
Yy1kZXYvcGF0Y2gvMjAxNzExMDExMDE3MzUuMjMxOC0yLWtoYW5kdWFsQGxpbnV4LnZuZXQuaWJt
LmNvbS8KCj4gICAJLyogSWYgcmVtb3RlIENQVXMgbmVlZCB0byBiZSBmbHVzaGVkIHRoZW4gZGVm
ZXIgYmF0Y2ggdGhlIGZsdXNoICovCj4gICAJaWYgKGNwdW1hc2tfYW55X2J1dChtbV9jcHVtYXNr
KG1tKSwgZ2V0X2NwdSgpKSA8IG5yX2NwdV9pZHMpCj4gICAJCXNob3VsZF9kZWZlciA9IHRydWU7
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
