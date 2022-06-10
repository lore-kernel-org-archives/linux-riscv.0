Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F7CC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lT0pNo6/3sjcz7IIH0oH5ze5DHZkmBBx+DBAzY/vB8o=; b=lEDzNBEmqeBdcz
	NeNe87kCXEVRClhJRbD2NEVsTrGCdQ7AvdzPpTBVbT/lT9nH9NUYXsAI/ABuXGbM8ZCJDif4GCeJ2
	awMsywTvU+K5VdJ0Sy3MtlK2HvdB1fey3YFSZT9s43+Tgb1s46ywSqWouL+8uBvQmoxxHz9Fy599w
	cOpqkOjAYnKkWpvQnPNNpPz6lZPv//VpGhyztuEXJdSDsDfHhjZvm0KH+oxQ9UJ0eW/eNUAMC+73k
	oDZyBcJOVfvlpn8yqX821RBJgTgpfC1vkzw3mhlGHGWSTqiLZiswyNmJwZMckLyrNsBcgvPagErXX
	cl4rNv0X1W4Nt4kCn2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbKh-007MXr-9C; Fri, 10 Jun 2022 09:53:35 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzb3g-007DiF-5j; Fri, 10 Jun 2022 09:36:02 +0000
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LKG4W0dLlzdZvG;
	Fri, 10 Jun 2022 17:34:03 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 17:35:54 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 17:35:53 +0800
Message-ID: <be81558c-286d-3620-bd9f-014c7861d9d1@huawei.com>
Date: Fri, 10 Jun 2022 17:35:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/6] mm: Demote warning message in vmemmap_verify() to
 debug level
Content-Language: en-US
To: mawupeng <mawupeng1@huawei.com>, <anshuman.khandual@arm.com>,
	<david@redhat.com>, <corbet@lwn.net>, <will@kernel.org>, <ardb@kernel.org>,
	<catalin.marinas@arm.com>
CC: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <paulmck@kernel.org>,
	<keescook@chromium.org>, <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <thunder.leizhen@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-5-mawupeng1@huawei.com>
 <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
 <a820f287-e879-6183-a917-6a577b6160ab@huawei.com>
 <1f2a76d5-7c4e-46bc-ce66-20a962eac73c@arm.com>
 <8d5e867f-e51a-d763-5ac3-6dfc4e67a376@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <8d5e867f-e51a-d763-5ac3-6dfc4e67a376@huawei.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_023600_630757_822BEB63 
X-CRM114-Status: GOOD (  10.99  )
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

Ck9uIDIwMjIvNi85IDE2OjEzLCBtYXd1cGVuZyB3cm90ZToKPgo+Cj4g5ZyoIDIwMjIvNi84IDE4
OjAwLCBBbnNodW1hbiBLaGFuZHVhbCDlhpnpgZM6Cj4+Cj4+Cj4+IE9uIDYvOC8yMiAwNjo1Niwg
bWF3dXBlbmcgd3JvdGU6Cj4+Pgo+Pj4KPj4+IOWcqCAyMDIyLzYvNyAyMDoyNSwgRGF2aWQgSGls
ZGVuYnJhbmQg5YaZ6YGTOgo+Pj4+IE9uIDA3LjA2LjIyIDExOjM4LCBXdXBlbmcgTWEgd3JvdGU6
Cj4+Pj4+IEZyb206IE1hIFd1cGVuZyA8bWF3dXBlbmcxQGh1YXdlaS5jb20+Cj4+Pj4+Cj4+Pj4+
IEZvciBhIHN5c3RlbSBvbmx5IGhhdmUgbGltaXRlZCBtaXJyb3JlZCBtZW1vcnkgb3Igc29tZSBu
dW1hIG5vZGUgCj4+Pj4+IHdpdGhvdXQKPj4+Pj4gbWlycm9yZWQgbWVtb3J5LCB0aGUgcGVyIG5v
ZGUgdm1lbW1hcCBwYWdlX3N0cnVjdHMgcHJlZmVyIHRvIGFsbG9jYXRlCj4+Pj4+IG1lbW9yeSBm
cm9tIG1pcnJvcmVkIHJlZ2lvbiwgd2hpY2ggd2lsbCBsZWFkIHRvIHZtZW1tYXBfdmVyaWZ5KCkg
aW4KPj4+Pj4gdm1lbW1hcF9wb3B1bGF0ZV9iYXNlcGFnZXMoKSByZXBvcnQgbG90cyBvZiB3YXJu
aW5nIG1lc3NhZ2UuCj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2ggZGVtb3RlIHRoZSAicG90ZW50aWFs
IG9mZm5vZGUgcGFnZV9zdHJ1Y3RzIiB3YXJuaW5nIAo+Pj4+PiBtZXNzYWdlcwo+Pj4+PiB0byBk
ZWJ1ZyBsZXZlbCB0byBhdm9pZCBhIHZlcnkgbG9uZyBwcmludCBkdXJpbmcgYm9vdHVwLgo+Pj4+
Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNYSBXdXBlbmcgPG1hd3VwZW5nMUBodWF3ZWkuY29tPgo+
Pj4+PiAtLS0KPj4+Pj4gwqDCoCBtbS9zcGFyc2Utdm1lbW1hcC5jIHwgMiArLQo+Pj4+PiDCoMKg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+
PiBkaWZmIC0tZ2l0IGEvbW0vc3BhcnNlLXZtZW1tYXAuYyBiL21tL3NwYXJzZS12bWVtbWFwLmMK
Pj4+Pj4gaW5kZXggZjRmYTYxZGJiZWUzLi43OGRlYmRiODllYjEgMTAwNjQ0Cj4+Pj4+IC0tLSBh
L21tL3NwYXJzZS12bWVtbWFwLmMKPj4+Pj4gKysrIGIvbW0vc3BhcnNlLXZtZW1tYXAuYwo+Pj4+
PiBAQCAtNTI4LDcgKzUyOCw3IEBAIHZvaWQgX19tZW1pbml0IHZtZW1tYXBfdmVyaWZ5KHB0ZV90
ICpwdGUsIGludCAKPj4+Pj4gbm9kZSwKPj4+Pj4gwqDCoMKgwqDCoMKgIGludCBhY3R1YWxfbm9k
ZSA9IGVhcmx5X3Bmbl90b19uaWQocGZuKTsKPj4+Pj4gwqDCoCDCoMKgwqDCoMKgIGlmIChub2Rl
X2Rpc3RhbmNlKGFjdHVhbF9ub2RlLCBub2RlKSA+IExPQ0FMX0RJU1RBTkNFKQo+Pj4+PiAtwqDC
oMKgwqDCoMKgwqAgcHJfd2FybigiWyVseC0lbHhdIHBvdGVudGlhbCBvZmZub2RlIHBhZ2Vfc3Ry
dWN0c1xuIiwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHByX2RlYnVnKCJbJWx4LSVseF0gcG90ZW50
aWFsIG9mZm5vZGUgcGFnZV9zdHJ1Y3RzXG4iLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN0YXJ0LCBlbmQgLSAxKTsKPj4+Pj4gwqDCoCB9Cj4+Pj4KPj4+PiBUaGlzIHdpbGwg
cG9zc2libHkgaGlkZSBpdCBpbiBlbnZpcm9ubWVudHMgd2hlcmUgdGhpcyBtaWdodCBpbmRlZWQK
Pj4+PiBpbmRpY2F0ZSBwZXJmb3JtYW5jZSBpc3N1ZXMuCj4+Pj4KPj4+PiBXaGF0IGFib3V0IGEg
cHJfd2Fybl9vbmNlKCk/Cj4+Pj4KPj4+Cj4+PiBTdXJlLgo+Pj4KPj4+IFRoaXMgd2lsbCB3b3Jr
cy4gV2UgY2FuIGNlcnRhaW5seSB1c2UgYSBwcl93YXJuX29uY2UoKS4KPj4KPj4gV2h5IG5vdCBw
cl93YXJuX3JhdGVsaW1pdGVkKCkgbGlrZSBpbiB0aGUgcHJldmlvdXMgcGF0Y2ggPwo+Cj4gRnVu
Y3Rpb24gdm1lbW1hcF9wb3B1bGF0ZV9iYXNlcGFnZXMoKSBpcyB1c2VkIHRvIHBvcHVsYXRlIGJh
c2UgcGFnZXMuCj4gU3lzdGVtIHdpdGggaHVnZSBtZW1vcnkgd2lsbCBwcm9kdWNlIGxvdHMgbG90
cyBvZiB3YXJuaW5nIG1lc3NhZ2UKPiBkdXJpbmcgdGhpcyBwb3B1bGF0ZSBwcm9jZXNzIGV2ZW4g
d2l0aCByYXRlbGltaXRlZC4gVGhpcyBtYXkgbGVhZCB0byBzbG93Cj4gc3RhcnR1cC4KCkkgdGhp
bmsgcHJfd2Fybl9vbmNlIGlzIGJldHRlciwgdGhlIG1lbWJsb2NrX2FsbG9jIGZhbGxiYWNrIGlz
IG5vdCBmcmVxdWVudCwKCmJ1dCB2bWVtbWFwX3ZlcmlmeSB3aWxsIHZlcmlmeSBlYWNoIG1lbW9y
eSBhbmQgcHJpbnQgYSBsb3QuCgo+Cj4gVGhhbmtzIGZvciByZXZpZXdpbmcuCj4KPj4gLgo+IC4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
