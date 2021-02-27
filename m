Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181A6C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 01:04:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ADEC64EBA
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 01:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ADEC64EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NEpRm48yPYNP0s3S5qxy5d9h1e+ru0zW34DCm3Lddzg=; b=1RbxtPR7ZxVbntZ0EbuYM4GWW
	d7eWCxrncqLL9JydDegsXvnrJriBWAtTUZ1MTTRWx5NeDbAkBcpyZSGg064DkINQpQjb6/7ROYE1w
	+bm3sJpMd8T4nFlQfl0ulT+yxbRTD7/B5+aDNZrc94pknnUB3IhL10We3CYEp3+3m+xBtIT61iII7
	M4Y2QapJsLvhM223hwh+xQaTwkVZ8pENgRVJVLPCvH6ggIQB940E/l+8VTIaRMc5yA0ru7Y1Lyb+O
	g/0pFiMq4ZJUqoIeDY5uDGD+fMGxViMYQiFEBnWLG93CmsCyA8qAgvKGqA4C1QyV4e6H7AAxj+H9W
	wQVCeLcJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFo1m-0003Tp-E9; Sat, 27 Feb 2021 01:04:14 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFo1j-0003T3-KS
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 01:04:12 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DnSsV6l6bzMd8F;
 Sat, 27 Feb 2021 09:01:50 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Feb 2021 09:03:54 +0800
Subject: Re: [PATCH] RISC-V: Make NUMA depend on SMP
To: Palmer Dabbelt <palmer@dabbelt.com>, <akpm@linux-foundation.org>,
 <atishp@atishpatra.org>
References: <20210226202550.512012-1-palmer@dabbelt.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <e76cf929-ba52-6d53-9ac8-ef403f9b1f4f@huawei.com>
Date: Sat, 27 Feb 2021 09:03:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210226202550.512012-1-palmer@dabbelt.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_200411_925903_20C6AD4E 
X-CRM114-Status: GOOD (  14.68  )
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
Cc: aou@eecs.berkeley.edu, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, kernel-team@android.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEvMi8yNyA0OjI1LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBGcm9tOiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+Cj4gSW4gdGhlb3J5IHRoZXNlIGFy
ZSBvcnRob2dvbmFsLCBidXQgaW4gcHJhY3RpY2UgYWxsIE5VTUEgc3lzdGVtcyBhcmUKPiBTTVAu
ICBOVU1BICYmICFTTVAgZG9lc24ndCBidWlsZCwgZXZlcnlvbmUgZWxzZSBpcyBjb3VwbGluZyB0
aGVtLCBhbmQgSQo+IGRvbid0IHJlYWxseSBzZWUgYW55IHZhbHVlIGluIHN1cHBvcnRpbmcgdGhh
dCBjb25maWd1cmF0aW9uLgo+Cj4gRml4ZXM6IDRmMGU4ZWVmNzcyZSAoInJpc2N2OiBBZGQgbnVt
YSBzdXBwb3J0IGZvciByaXNjdjY0IHBsYXRmb3JtIikKPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gU3VnZ2VzdGVkLWJ5OiBBdGlzaCBQ
YXRyYSA8YXRpc2hwQGF0aXNocGF0cmEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+CgpSZXBvcnRlZC1hbmQtVGVzdGVkLWJ5OsKg
IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KCgo+IC0tLQo+IFRoaXMg
aXMgb24gZml4ZXMuCj4gLS0tCj4gICBhcmNoL3Jpc2N2L0tjb25maWcgfCAxICsKPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2Nv
bmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IGluZGV4IGE5OThiYWJjMTIzNy4uODVkNjI2Yjhj
ZTVlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+IEBAIC0zMTQsNiArMzE0LDcgQEAgZW5kY2hvaWNlCj4gICAjIENvbW1vbiBOVU1B
IEZlYXR1cmVzCj4gICBjb25maWcgTlVNQQo+ICAgCWJvb2wgIk5VTUEgTWVtb3J5IEFsbG9jYXRp
b24gYW5kIFNjaGVkdWxlciBTdXBwb3J0Igo+ICsJZGVwZW5kcyBvbiBTTVAKPiAgIAlzZWxlY3Qg
R0VORVJJQ19BUkNIX05VTUEKPiAgIAlzZWxlY3QgT0ZfTlVNQQo+ICAgCXNlbGVjdCBBUkNIX1NV
UFBPUlRTX05VTUFfQkFMQU5DSU5HCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
