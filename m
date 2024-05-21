Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B32C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNrscAgyrmhqZxKlIR87LcNtYW9K93bhrMttyr7dqCw=; b=aBlIKVwsMbFfeT
	CIm2Ffd4lJHJeBI0dxFLrVJG96M087e9YPwlVHl3QjR+45SpbPFoY2AaZ6aLfK949FeMM23UC9IzT
	X59V15EPfCBBeACKmetbF33/j4rmfPI/v96x53ZGStnbpw5caGw6Oj43uh8GfYEsDegzfitobR4GW
	pPXaBAbwWm8QWeWIwWbj0ftfIhBO737BCa9Sr2M7Nf8beExZ+M33EBJ8ul3Bsmdg8INDUEy4p9mXT
	FDkwbe3uBn2fwzGXjWcq8GkCFnJ3/03QyJlKgktuHmBHO3ahNqUWyi8UulsCg0DDB0S6ftgiUF+aU
	lWUvI6FBCrYEIIC9O4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9RXz-00000000N11-0N7v;
	Tue, 21 May 2024 15:37:03 +0000
Received: from out0-195.mail.aliyun.com ([140.205.0.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9RXw-00000000Myx-1em0
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 15:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1716305815; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=0F8utKmHBsqT5aaZ1shtTgjkR7zRzQ1wD7Atj7HfE5s=;
	b=1PDxK98ajQsWd/viW0gggAq08f+ifUj2FceeJqLSs6nXi9MYzV7VPNV2Xk9K12oxMUybl/GA+3vakqhG03qn7nKdVet9x3d0hHzLCDRhuWiC6UUebIWMacK+eYVsAJPFBDajnhr0FHKUcbAuLKmkt0cFS3VN1292lk/1uyNsYPU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033038033188;MF=libang.li@antgroup.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---.XjOK43f_1716305812;
Received: from 30.236.49.195(mailfrom:libang.li@antgroup.com fp:SMTPD_---.XjOK43f_1716305812)
          by smtp.aliyun-inc.com;
          Tue, 21 May 2024 23:36:53 +0800
Message-ID: <7d00705a-8a6b-48a5-8aba-7e789c536e2e@antgroup.com>
Date: Tue, 21 May 2024 23:36:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mm: Refactor update_mmu_tlb()
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 chenhuacai@kernel.org, tsbogend@alpha.franken.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 ryan.roberts@arm.com, ioworker0@gmail.com, libang.linux@gmail.com
References: <20240518074914.52170-1-libang.li@antgroup.com>
 <20240518074914.52170-3-libang.li@antgroup.com>
 <4650b888-d90f-40e3-8c53-c9949e539959@redhat.com>
Content-Language: en-US
From: "Bang Li" <libang.li@antgroup.com>
In-Reply-To: <4650b888-d90f-40e3-8c53-c9949e539959@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_083700_651853_97B37A1D 
X-CRM114-Status: GOOD (  11.91  )
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

SGkgRGF2aWQsCgpUaGFua3MgZm9yIHlvdSByZXZpZXchCgpPbiAyMDI0LzUvMjEgMTc6MzYsIERh
dmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDE4LjA1LjI0IDA5OjQ5LCBCYW5nIExpIHdyb3Rl
Ogo+PiBSZW1vdmUgdXBkYXRlX21tdV90bGIoKSBmcm9tIHRob3NlIGFyY2hpdGVjdHVyZXMgYW5k
IGRlZmluZQo+PiBnZW5lcmljYWxseSB2aWEgdXBkYXRlX21tdV90bGJfcmFuZ2UoKSwgcmVtb3Zp
bmcgdGhlIGFiaWxpdHkKPj4gZm9yIGFyY2hlcyB0byBvdmVycmlkZSBpdC4KPiAKPiBJJ2Qgc3Vn
Z2VzdCBzb21ldGhpbmcgbGlrZQo+IAo+ICJtbTogaW1wbGVtZW50IHVwZGF0ZV9tbXVfdGxiKCkg
dXNpbmcgdXBkYXRlX21tdV90bGJfcmFuZ2UoKQo+IAo+IExldCdzIG1ha2UgdXBkYXRlX21tdV90
bGIoKSBzaW1wbHkgYSBnZW5lcmljIHdyYXBwZXIgYXJvdW5kIAo+IHVwZGF0ZV9tbXVfdGxiX3Jh
bmdlKCkuIE9ubHkgdGhlIGxhdHRlciBjYW4gbm93IGJlIG92ZXJyaWRkZW4gYnkgdGhlIAo+IGFy
Y2hpdGVjdHVyZS4gV2UgY2FuIG5vdyByZW1vdmUgX19IQVZFX0FSQ0hfVVBEQVRFX01NVV9UTEIg
YXMgd2VsbC4KPiAiCgpBZ3JlZSEgVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24sIEkgd2ls
bCBtb2RpZnkgaXQgaW4gdGhlIG5leHQgdmVyc2lvbgoKPiAKPiBbLi4uXQo+IAo+PiArI2lmbmRl
ZiB1cGRhdGVfbW11X3RsYl9yYW5nZQo+PiArc3RhdGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVf
dGxiX3JhbmdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0ZXAsIHVuc2ln
bmVkIGludCBucikKPj4gK3sKPj4gK30KPj4gKyNlbmRpZgo+IAo+IFdpdGggdGhhdCBpbiBwYXRj
aCAjMQoKVGhhbmtzIGFnYWluLgpCYW5nCgo+IAo+IEFja2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFu
ZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
