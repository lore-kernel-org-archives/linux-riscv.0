Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1214CC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 01:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C4560EBA
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 01:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0C4560EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLfLVlwxge1W3ycPRIo7Dvt/ktyiA5m9IUgbPHrBhWE=; b=PrloqMowNRvwtESGHzL6lUQeNF
	y0Pwy0NDCa7Lp4O5G3g5O4IUu+o7ITWWUnv/Z8ICehfidl1NXwpZ6eyHAyhHNWkX8I36NBypfSIJJ
	05TsUcXdEB6hH1P9WRPmg6SxT1JSqt5fqoje/0mt1RDAdISn3qDXEBOXl0/Fp/gPRn98s3k8ilDbq
	uNJKE4qnW5a+qGBSrlFTSsf6+ECdqYFqbid4qCOLtjL+NADcLRwzp6CS8w+BWK0g6OZn2huhtQCJ5
	QCZXnes69jwg3ZPxwL8R/7R92+PI3r5oPIiCJz5kf8xKjpFYzhHYAV0vIF+405rBWg3a8z/zusa8m
	ivcP0yqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6k7b-0033lD-DP; Fri, 23 Jul 2021 01:37:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6k7X-0033kY-JY
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 01:37:01 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GWBfX0L1GzZqYQ;
 Fri, 23 Jul 2021 09:33:24 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 09:36:48 +0800
Received: from [10.174.177.250] (10.174.177.250) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 23 Jul 2021 09:36:47 +0800
Subject: Re: [PATCH -next v2] riscv: add VMAP_STACK overflow detection
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Andreas Schwab
 <schwab@linux-m68k.org>
References: <87bl6yrcmd.fsf@igel.home>
 <mhng-e14c3232-cc4d-4146-8c93-c60ec81ed272@palmerdabbelt-glaptop>
 <CAOnJCU+Ss0cO1mqr=GDVnpxV075uR+KipSnr7dN93099dAH+vQ@mail.gmail.com>
 <20210722213724.1f12a0e7@xhacker> <87zguexslf.fsf@igel.home>
 <20210723075432.098634a2@xhacker>
CC: Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org
 List" <linux-kernel@vger.kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <52e3626a-2b40-bda6-de0e-68ea12a86dd9@huawei.com>
Date: Fri, 23 Jul 2021 09:36:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20210723075432.098634a2@xhacker>
X-Originating-IP: [10.174.177.250]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_183659_855433_A73D28A3 
X-CRM114-Status: GOOD (  10.66  )
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

CgpPbiAyMDIxLzcvMjMgNzo1NCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiBPbiBUaHUsIDIyIEp1
bCAyMDIxIDE3OjQyOjUyICswMjAwCj4gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBsaW51eC1tNjhr
Lm9yZz4gd3JvdGU6Cj4KPj4gT24gSnVsIDIyIDIwMjEsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4+
Cj4+PiBJIHRoaW5rIHdlIG5lZWQgdG8gcGluIHRoZSBzdGFjayBiZWZvcmUgY2FsbGluZyBnZXRf
d2NoYW4oKSwgY291bGQgeW91IHBsZWFzZQo+Pj4gdHJ5IGJlbG93IHBhdGNoPwo+Pgo+PiBUaGFu
a3MsIHRoaXMgZml4ZXMgdGhlIGNyYXNoIGZvciBtZS4KPj4KPj4gQW5kcmVhcy4KPj4KPgo+IFRo
YW5rcyBmb3IgdGVzdGluZy4gSSB3aWxsIHNlbmQgb3V0IGZvcm1hbCBwYXRjaCBsYXRlcgo+Cj4g
VGhhbmtzCj4KPiAuCj4KCkhpIGFsbDoKSSB0cmllZCB0byByZXByb2R1Y2VkIHRoaXMgY3Jhc2gg
aW4gb3BlblNVU0UgY29kZSByZXBv77yIIApodHRwczovL2dpdGh1Yi5jb20vb3BlbnN1c2Uva2Vy
bmVsIO+8iSwgYnV0IG5vdCByZXByb2R1Y2VkIHN1Y2Nlc3NmdWxseS4KCiBGcm9tIHRoZSBwYXRj
aCBvZiBwcm9ibGVtIHJlcGFpciwgdGhlIGNyYXNoIGlzIGR1ZSB0byB0YXNrLT5zdGFjayBpcyAK
cmVsZWFzZWQgYmVmb3JlIGNhbGxpbmcgZ2V0X3djaGFuLCB0aGUgdGFzayBzdGF0ZSBvZiBtYXli
ZSBUQVNLX0RFQUQuCgpWTUFQX1NUQUNLIGlzIHVzZWQgdG8gZGV0ZWN0IGtlcm5lbCBzdGFjayBv
dmVyZmxvdywgdGhlcmUgaXMgbm8gCmNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgdHdvLCBpdCBtYWtl
cyBtZSBhIGxpdHRsZSBjb25mdXNlZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
