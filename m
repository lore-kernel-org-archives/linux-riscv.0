Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ABBC56202
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 12:49:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E6A521D1A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 12:49:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wjmAiAAr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E6A521D1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ozbbnRX+AIlL4q/CBjsMbXvIOZohdjCfWMhxkqOrH/Q=; b=wjmAiAAr6kkIo37Sk3hritga2
	aDto5un4ElbZzHyhUQ62ufVRtv6Nli9iNG1PPdntCu4zh2LJvajenZVyRysJbcGuXobWHvk6xUKr7
	k440bvC+eojaStL3OSuAsa4GP2pQtfmxOlASj3WUHycd9nDTnSZtRh7wHpYwhd/fPBY/SIGxznRp4
	jcUqyAtdT7oXzSSvk/1RAl+oKoQmqvQFj16bBbSplNS1o7Sk2GoPzMCCfyZ7mt41MTIIAMQZLM87A
	GeIe+IFrjpAv4upuU2yfOWlYm3jOn8JeL/3f+DvXGovBz0a5cCVxhqQQnepnbU2h6T7BeSq15sfkL
	HP0Wepszg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiGiN-0004xl-GP; Thu, 26 Nov 2020 12:49:35 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiGiH-0004sy-77
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 12:49:31 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Chcy61mH6zLvhK;
 Thu, 26 Nov 2020 20:48:46 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 26 Nov 2020 20:49:10 +0800
Subject: Re: [PATCH 2/2] riscv: Fix __show_regs printing formats
To: John Ogness <john.ogness@linutronix.de>, Atish Patra
 <atishp@atishpatra.org>
References: <mhng-54bff36c-7c0d-4448-8859-d8d05cbd8b0d@palmerdabbelt-glaptop1>
 <20201124112054.106960-1-wangkefeng.wang@huawei.com>
 <20201124112054.106960-2-wangkefeng.wang@huawei.com>
 <CAOnJCUJH7AFYNsyFzwzHApZhfx_1yiEj+zkQDxryD83zac6f2g@mail.gmail.com>
 <c60a5e75-96a5-2fb7-4089-1e3b777c6b0d@huawei.com>
 <87d000cu6l.fsf@jogness.linutronix.de> <877dq8coxy.fsf@jogness.linutronix.de>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <917f6f5e-0627-452b-7140-3aa05f551980@huawei.com>
Date: Thu, 26 Nov 2020 20:49:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <877dq8coxy.fsf@jogness.linutronix.de>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_074929_882248_A2E4485B 
X-CRM114-Status: GOOD (  19.32  )
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
Cc: Petr Mladek <pmladek@suse.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvMTEvMjYgMTk6NTUsIEpvaG4gT2duZXNzIHdyb3RlOgo+IE9uIDIwMjAtMTEtMjYs
IEpvaG4gT2duZXNzIDxqb2huLm9nbmVzc0BsaW51dHJvbml4LmRlPiB3cm90ZToKPj4gT24gMjAy
MC0xMS0yNiwgS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90ZToK
Pj4+IE9uIDIwMjAvMTEvMjYgNjo1OCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4+Pj4gT24gVHVlLCBO
b3YgMjQsIDIwMjAgYXQgMzoxNyBBTSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdl
aS5jb20+IHdyb3RlOgo+Pj4+PiBVc2luZyBwcmludGsgZGlyZWN0bHkgYW5kIGFsaWduIHRoZSBw
cmludGluZyBmb3JtYXRzLgo+Pj4+Pgo+Pj4+IFdoeSBzd2l0Y2ggdG8gcHJpbnRrID8gSUlSQywg
cHJfKiBpcyBwcmVmZXJyZWQgb3ZlciBwcmludGsgZm9yIGFueSBuZXcgY29kZS4KPj4+IFRoZSBz
dGFjayBvdXRwdXQgaXMgc3RyYW5nZSwgdGhhdCBpcyB3aHkgSSBtb3ZlIHRvIHByaW50aywgYW5k
IHRoZSBvbGQKPj4+IGtlcm5lbCBsb29rcyBnb29kLgo+PiBUaGlzIGlzIGp1c3QgYSBxdWljayBy
ZXNwb25zZSB0byBsZXQgeW91IGtub3cgSSBjYW4gcmVwcm9kdWNlIHRoZSBpc3N1ZQo+PiBhbmQg
SSBhbSBpbnZlc3RpZ2F0aW5nLgo+Pgo+PiBAUGV0cjogVGhlIHByb3Bvc2VkIGNoYW5nZSBhbmQg
b3V0cHV0IGRpZmZlcmVuY2UgaXMgaGVyZSBbMF0uCj4gVGhpcyBpcyBhIGJ1ZyBpbiBjb250aW51
b3VzIGxpbmUgaGFuZGxpbmcuIEkgaGF2ZSBwb3N0ZWQgWzBdIGEgZml4IHRvCj4gTEtNTC4KWWVz
LCBpdCBmaXhlcyB0aGUgb3V0cHV0IGlzc3VlLgo+Cj4gTm90ZSB0aGF0IGEgcHJfY29udCgpIG1l
c3NhZ2Ugd2l0aCBhIHRyYWlsaW5nIG5ld2xpbmUgd2lsbCAidGVybWluYXRlIgo+IHRoZSBjb250
aW5vdXMgbGluZSBzbyB0aGF0IGl0IGNhbiBubyBsb25nZXIgYmUgY29udGludWVkLiBIYXZpbmcg
YSBidW5jaAo+IG9mOgo+Cj4gICAgICBwcl9jb250KCIuLi5cbiIpOwo+Cj4gbGluZXMgaXMgdGVj
aG5pY2FsbHkgd3JvbmcuIElmIHlvdSByZWFsbHkgd2FudCB0aGUgZnVsbCBibG9jayB0byBiZSBh
Cj4gc2luZ2xlIG1lc3NhZ2UsIHB1dCB0aGUgbmV3bGluZSBhdCB0aGUgYmVnaW5uaW5nIG9mIHRo
ZSBwcl9jb250KCkKPiBtZXNzYWdlIG9yIGFkZCBzb21lIHdoaXRlc3BhY2UgYWZ0ZXIgYSBuZXds
aW5lIGF0IHRoZSBlbmQuIEZvciBleGFtcGxlOgo+Cj4gICAgICBwcl9jb250KCJcbi4uLi4iKTsK
PiAgICAgICAgIG9yCj4gICAgICBwcl9jb250KCIuLi5cbiAiKTsKPgo+IEFsdGhvdWdoIEkgd291
bGQgc3VnZ2VzdCBtYWtpbmcgdGhlbSBzZXBhcmF0ZSBwcmludGsgY2FsbHMuIFdpdGgKPiBDT05G
SUdfUFJJTlRLX0NBTExFUiBpdCBpcyBzdGlsbCBwb3NzaWJsZSB0byBzb3J0IG91dCBzaW11bHRh
bmVvdXMgZHVtcHMKPiBmcm9tIG11bHRpcGxlIENQVXMuClRoYW5rcyBmb3IgeW91ciBleHBsYW5h
dGlvbi7CoCBJIHdpbGwgcmUtcG9zdCBwYXRjaCB3aXRoIGNoYW5nZWxvZyByZWZyZXNoLgo+Cj4g
VGhhbmsgeW91IGZvciByZXBvcnRpbmcgdGhpcyEKPgo+IEpvaG4gT2duZXNzCj4KPiBbMF0gaHR0
cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDIwMTEyNjExNDgzNi4xNDc1MC0xLWpvaG4ub2duZXNz
QGxpbnV0cm9uaXguZGUKPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
