Return-Path: <SRS0=Oyqu=FB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A19C63697
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 02:53:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 517662222A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Nov 2020 02:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQ5nluvf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 517662222A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pQmdGuMIIyU7UhlrKBFqD7d21rhe4+jhYLb0obAOHcY=; b=CQ5nluvfehZnLtEd2xpLUNlU+
	VHLT9+WZFtBSbLJMmHEj8R3AwTjtFFdX+XBKE2nwQ9qbOyZuNmZ1qaaGrPcrVR8mf0UO3HcW9B4gx
	uzXw0RK8YKhvhgD7LuRLfH59hOrlrcEZlmfRe6UYNvfQQeikLDF1kN3ai08DCE9iVbNW9+5+JDSFR
	uDa7tA0HLIKe+tNz6TdRvafD8GQS072Uqr2OIqPQhH4r9ComFhTaayRUvMS/Y2oorK4mF8raxBapZ
	g3XfgsQU26lGQF9uMB25CXnxdoRHc5f398EuDP+lKqVkOy8eSNjqt5L8qMB9M9QQMZTeWxSIeSubO
	i7b5QxJ/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiTtF-000462-Um; Fri, 27 Nov 2020 02:53:41 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiTtB-000456-G4
 for linux-riscv@lists.infradead.org; Fri, 27 Nov 2020 02:53:39 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ChzhF3cyTzkgCN;
 Fri, 27 Nov 2020 10:53:01 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Fri, 27 Nov 2020 10:53:28 +0800
Subject: Re: [PATCH] riscv: Make RISCV_TIMER depends on RISCV_SBI
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-f818810c-0b46-485b-b870-8ef35b2b318d@palmerdabbelt-glaptop1>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <2ab24d27-fa96-ab17-faed-d86f60a16b65@huawei.com>
Date: Fri, 27 Nov 2020 10:53:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-f818810c-0b46-485b-b870-8ef35b2b318d@palmerdabbelt-glaptop1>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_215338_833604_8954F123 
X-CRM114-Status: GOOD (  16.28  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRGFuaWVsLCBwaW5nLi4uCgpPbiAyMDIwLzExLzYgMTU6MTQsIFBhbG1lciBEYWJiZWx0IHdy
b3RlOgo+IE9uIFdlZCwgMjggT2N0IDIwMjAgMDY6MTI6MzAgUERUICgtMDcwMCksIHdhbmdrZWZl
bmcud2FuZ0BodWF3ZWkuY29tIAo+IHdyb3RlOgo+PiBUaGUgcmlzY3YgdGltZXIgaXMgc2V0IHZp
YSBTQkkgdGltZXIgY2FsbCwgbGV0J3MgbWFrZSBSSVNDVl9USU1FUgo+PiBkZXBlbmRzIG9uIFJJ
U0NWX1NCSSwgYW5kIGl0IGFsc28gZml4ZXMgc29tZSBidWlsZCBpc3N1ZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+PiAtLS0K
Pj4gwqBkcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcgfCAyICstCj4+IMKgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcKPj4g
aW5kZXggNjhiMDg3YmZmNTljLi4yYmU4NDliYjc5NGEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Y2xvY2tzb3VyY2UvS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcK
Pj4gQEAgLTY1NCw3ICs2NTQsNyBAQCBjb25maWcgQVRDUElUMTAwX1RJTUVSCj4+Cj4+IMKgY29u
ZmlnIFJJU0NWX1RJTUVSCj4+IMKgwqDCoMKgIGJvb2wgIlRpbWVyIGZvciB0aGUgUklTQy1WIHBs
YXRmb3JtIiBpZiBDT01QSUxFX1RFU1QKPj4gLcKgwqDCoCBkZXBlbmRzIG9uIEdFTkVSSUNfU0NI
RURfQ0xPQ0sgJiYgUklTQ1YKPj4gK8KgwqDCoCBkZXBlbmRzIG9uIEdFTkVSSUNfU0NIRURfQ0xP
Q0sgJiYgUklTQ1YgJiYgUklTQ1ZfU0JJCj4+IMKgwqDCoMKgIHNlbGVjdCBUSU1FUl9QUk9CRQo+
PiDCoMKgwqDCoCBzZWxlY3QgVElNRVJfT0YKPj4gwqDCoMKgwqAgaGVscAo+Cj4gVGhpcyBzaG91
bGQgcHJvYmFibHkgYmUKPgo+IEZpeGVzOiAyYmMzZmM4NzdhYTkgKCJSSVNDLVY6IFJlbW92ZSBD
TElOVCByZWxhdGVkIGNvZGUgZnJvbSB0aW1lciBhbmQgCj4gYXJjaCIpCj4KPiBub3QgcmVhbGx5
IGEgYnVnIGluIHRoYXQgY29tbWl0LCBidXQgc2luY2UgdGhlbiB0aGUgbWVtb3J5LW1hcHBlZCBh
bmQgU0JJCj4gdGltZXJzIGhhdmUgYmVlbiBzcGxpdCBhbmQgdGhlcmVmb3IgdGhlcmUncyBubyB3
YXkgdGhpcyBkcml2ZXIgY2FuIGRvIAo+IGFueXRoaW5nCj4gd2l0aG91dCBTQkkgc3VwcG9ydC4K
Pgo+IFJldmlld2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29t
Pgo+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+
Cj4gVGhhbmtzIQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
