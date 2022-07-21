Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7443AC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 01:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgwgZbhDLAoXbONSavxV5bir9GFyEBuKfWYhG53CQw4=; b=lBJYkD2dwTnXPxUIFDb2o5XDYM
	sDWlCThVmtrmxv41f4I3TVXvX2HM61bU0HesJ5+uNRM9ikKzeSyZfY85Io1rS2lF0z66QbI65FlEt
	I6FtRWoPjVjWMBhDeOWcz6XrxNzfr3OVGO546j1S6Od53zOQz8EuvseSJTkVY+kArODKwjY0Q/jnl
	lwRyJV2zo1JkCYn2vfTk4nYQ7eC6pXR+GR1wJQztvjNf5XdwApHMOozcy9HQ59QehUaP9SV/4M+bX
	xk2ZqB8wiOaEpBbmodBGwP1BSC4xYcIEU0/Jy9Uak+kFUcNA2EoC0j+AvU9rfDdU5x+OM6v891B+F
	ewVyHwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEKs1-00EMq3-8r; Thu, 21 Jul 2022 01:20:53 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEKrx-00EMgn-Os
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 01:20:51 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LpF8C5BTrzlWJP;
	Thu, 21 Jul 2022 09:18:51 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 09:20:34 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 09:20:34 +0800
Message-ID: <7a435a98-d842-09a4-e706-03e8d27d0d50@huawei.com>
Date: Thu, 21 Jul 2022 09:20:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v2] riscv:uprobe remove set/clear SR_SPIE in
 arch_uprobe_pre/post/abort_xol
To: <Conor.Dooley@microchip.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<guoren@kernel.org>, <penberg@kernel.org>
References: <20220720093447.245585-1-zouyipeng@huawei.com>
 <7867387b-3ffe-f51d-b15f-5f0ac45c8e48@microchip.com>
 <5fa8d66b-9b97-0f7b-d22c-514cf599a6b1@microchip.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <5fa8d66b-9b97-0f7b-d22c-514cf599a6b1@microchip.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_182049_999545_F8B3CB18 
X-CRM114-Status: UNSURE (   5.33  )
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

CuWcqCAyMDIyLzcvMjAgMTc6NTQsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIOWGmemBkzoK
PiBPbiAyMC8wNy8yMDIyIDEwOjUxLCBDb25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToK
Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+Cj4+IE9uIDIwLzA3LzIwMjIg
MTA6MzQsIFlpcGVuZyBab3Ugd3JvdGU6Cj4+PiBbUEFUQ0ggLW5leHQgdjJdIHJpc2N2OnVwcm9i
ZSByZW1vdmUgc2V0L2NsZWFyIFNSX1NQSUUgaW4gYXJjaF91cHJvYmVfcHJlL3Bvc3QvYWJvcnRf
eG9sCj4+IEhleSBZaXBlbmcsCj4+IEp1c3QgYSBzdWdnZXN0aW9uIG9uIHRoZSBjb21taXQgbWVz
c2FnZSwgaG93IGFib3V0IGp1c3Q6Cj4+ICJyaXNjdjogdXByb2JlOiBmaXggU1JfU1BJRSBzZXQv
Y2xlYXIgaGFuZGxpbmciCj4gSG1tIGFsc28sIHlvdSBzcGVjaWZpZWQgIi1uZXh0IiBidXQgdGhp
cyBzZWVtcyB0byBiZSBmaXhpbmcgYSBidWcKPiB0aGF0IGlzIGluIGN1cnJlbnQgY29kZT8gU2hv
dWxkIHRoaXMgbm90IGJlIGFwcGxpZWQgdG8gdjUuMTkgdG9vPwo+IFRoYW5rcywKPiBDb25vci4K
WWVzIGl0IGlzIGFsc28gc2hvaWZ1bGQgYmUgYXBwbGllZCB0byB2NS4xOSwgSXQncyBqdXN0IG15
IGxvY2FsIHRlbXBsYXRlIAp0byBzcGVjaWVkICItbmV4dCIgLCB3aWxsIHJlbW92ZSBpdCBpbiBu
ZXh0IHZlcnNpb24gLHRoYW5rcyBhZ2Fpbi4KCi0tIApSZWdhcmRzLApZaXBlbmcgWm91CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
