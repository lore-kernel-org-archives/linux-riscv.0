Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86EFC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 03:24:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5186206D6
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 03:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5186206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2lJzu9hWUQqe/sTyY0W7cBHY0YgbWxP4yPMUPOffyF8=; b=syKk/Xu7ESJGrg+8SqSQHAX0x
	Nw3iJ/50FlYO3Bvy0yGW7OpSgqe5fJc+t48NLng6QKz7EqoHFNeVvq/LC6K6uJC08IOcUTtfCbCDC
	IL/hgzZ91GNeOO1pkvg7//JkwTb8nOYhAtJ5O/pi87moREqUmwdmeoqdg+6mJlogyxJ9pBYDD1qOA
	NyEh1lZr4mrrHmktLrNFqzMX8n25XeqUwqdoquTwcJ573ihUhIXaciTIu7YBY96GXWYe7MAwM1zWz
	dNXqUgWRdepWF372/gNznDHHQU7rXEGNZhmeMNMtvwdkrAuUNnNMdseSWQ23hYLMTLAPfh+uFaBW5
	dNQ4jUCPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kynol-0007mF-SM; Mon, 11 Jan 2021 03:24:31 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kynoi-0007go-CN
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 03:24:29 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DDfD9486Hz15rF9;
 Mon, 11 Jan 2021 11:23:05 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 11 Jan 2021 11:23:59 +0800
Subject: Re: [PATCH 1/2] riscv: Add dump stack in show_regs
To: Palmer Dabbelt <palmerdabbelt@google.com>
References: <mhng-965396e3-01db-4be9-bc1d-1da8cb0127f0@palmerdabbelt-glaptop>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <f4c34560-5291-10d6-9157-8f0e0775184b@huawei.com>
Date: Mon, 11 Jan 2021 11:23:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-965396e3-01db-4be9-bc1d-1da8cb0127f0@palmerdabbelt-glaptop>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_222428_723058_8B091C8D 
X-CRM114-Status: GOOD (  10.19  )
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
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjEvMS8xMCA2OjI0LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBNb24sIDE0IERl
YyAyMDIwIDAzOjUyOjE5IFBTVCAoLTA4MDApLCB3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbSAK
PiB3cm90ZToKPj4gaGkgUGFsbWVyLCBraW5kbHkgcGluZy4uLgo+Cj4gU29ycnksIGl0IGxvb2tz
IGxpa2UgSSBtaXNzZWQgdGhpcyBiZWNhdXNlIGl0J3MgYWxsIHRocmVhZGVkIAo+IHRvZ2V0aGVy
LsKgIEknbSBub3QKPiByZWFsbHkgc3VyZSB3aGF0IHlvdSdyZSB0cnlpbmcgdG8gZG8gaGVyZTog
eW91J3ZlIGdvdCB0aHJlZSBwYXRjaCBzZXRzIAo+IGluIG9uZQo+IHRocmVhZCwgb25lIG9mIHdo
aWNoIHNlZW1zIHRvIGJlIGEgdjIgb2Ygb25seSBhIHNpbmdsZSBwYXRjaC4KPiBEbyB5b3UgbWlu
ZCBzZW5kaW5nIG91dCBhIHN0YW5kYWxvbmUgdmVyc2lvbiBvZiB0aGlzPwoKU3VyZSwgSSB3aWxs
IHJlYmFzZSBvbiB0aGUgdG9wIG9mIDUuMTEtcmMzIGFuZCByZXNlbmQgdGhlbS4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
