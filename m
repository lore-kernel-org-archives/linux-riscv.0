Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C69BC433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 01:21:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D3564ED2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 01:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D3564ED2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1DqaghyqoEbpkv/EmiIosJn6afoZxue/+5yr3bBN5j8=; b=pNX0Off7KKXKp/yRbx6TAn2IU
	Ge6MuOIVVQ24badxYLkfNFHEevoANtAyLQtvexjkMUjWGYzH6X0fhEly75bKFFz4I13j76NuxR/rn
	MBDzQv+19/KhipLvbtv8Wy1mDZ5DvjGwRx0j1Jhx6fxYXw/P2yi2EimxqlilxifHyIfzalSvPYaIw
	sWtmasImiJ7mDsLWiNMvoeDapP6OHly9kU2+MMHVJ5bd+WjmZAzymDGDfGKY1JnDzsGaTT+s8MW4n
	k+UZiosEI0q0C30i2jEA8/WhJpBfhXRU8piHv4bU1iLyzQMautCxcZfawZX7Q6/8yejy0atW83KNz
	v4VWQKQwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFoI9-0004Ho-M2; Sat, 27 Feb 2021 01:21:09 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFoI7-0004Ff-P7
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 01:21:08 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DnTFl4PfGz16DHQ;
 Sat, 27 Feb 2021 09:19:23 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Feb 2021 09:21:01 +0800
Subject: Re: [PATCH v2] riscv: Cleanup setup_bootmem()
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-b8acf3e5-d496-4094-8b55-c7a6d5fa2dc5@palmerdabbelt-glaptop>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <ac23c2d9-f102-00be-25d9-b05712f17ee0@huawei.com>
Date: Sat, 27 Feb 2021 09:21:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-b8acf3e5-d496-4094-8b55-c7a6d5fa2dc5@palmerdabbelt-glaptop>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_202108_083820_87218769 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEvMi8xOSAxNToxNSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gTW9uLCAwOCBG
ZWIgMjAyMSAxNzowMTo1MSBQU1QgKC0wODAwKSwgd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20g
Cj4gd3JvdGU6Cj4+IEFmdGVyIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcywKPj4KPj4gwqAgY29tbWl0
IGRlMDQzZGEwYjllNyAoIlJJU0MtVjogRml4IHVzYWdlIG9mIAo+PiBtZW1ibG9ja19lbmZvcmNl
X21lbW9yeV9saW1pdCIpCj4+IMKgIGNvbW1pdCAxYmQxNGE2NmVlNTIgKCJSSVNDLVY6IFJlbW92
ZSBhbnkgbWVtYmxvY2sgcmVwcmVzZW50aW5nIAo+PiB1bnVzYWJsZSBtZW1vcnkgYXJlYSIpCj4+
IMKgIGNvbW1pdCBiMTBkNmJjYTg3MjAgKCJhcmNoLCBkcml2ZXJzOiByZXBsYWNlIGZvcl9lYWNo
X21lbWJvY2soKSAKPj4gd2l0aCBmb3JfZWFjaF9tZW1fcmFuZ2UoKSIpCj4+Cj4+IHNvbWUgbG9n
aWMgaXMgdXNlbGVzcywga2lsbCB0aGUgbWVtX3N0YXJ0L3N0YXJ0L2VuZCBhbmQgdW5uZWVkZWQg
Y29kZS4KPj4KPj4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUB3ZGMuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5j
b20+Cj4+Ci4uLgo+Cj4gVGhhbmtzLCB0aGlzIGlzIG9uIGZvci1uZXh0LgpIaSBQYWxtZXIsIG1h
eWJlIHRoaXMgb25lIGlzIG1pc3NlZD8KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
