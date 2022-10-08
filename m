Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB12BC433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 01:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJQSGtckalqoRokUMUsY4YGsHNSJ/IL3VuqTfr/EOmY=; b=U1ylEbDgqUWS/t
	vv58Am+y0EcpNJGrx4THmsbAinR80vezxh5SPumsyUD7Ls7eA8sYJnQiCCWbTWUezPS8Xqo0ndHwc
	l0x29k2/YJZUiknXBN0FGuDHLsenfncipdsXRz0ibRkJrWDWtxcWleIriQzrXumy1QFB2i9RNIrL2
	+SOobBecvszvZ9J8pF26wpxRRQahDiCSfCKiX5WHwB+QzSaxVq8ZcRjwJ4B0chOET0+BfOie9FgiC
	7who49rLzKwt/cP3a0Hi2ZOkKB3WpZJgDbxv2T620gY/NZ7Yq8RhlrkwBaWRTLRbqyTmKOHlQQQAT
	uifKLaijNRsYqpc59GNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogyZw-00BHZ4-0W; Sat, 08 Oct 2022 01:24:36 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogyZq-00BHXi-BY
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 01:24:34 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MknQC2VFyzHv3p;
	Sat,  8 Oct 2022 09:19:15 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 09:24:11 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 8 Oct 2022 09:24:10 +0800
Message-ID: <ec17fed6-2f5d-f1c3-6c85-d92197253689@huawei.com>
Date: Sat, 8 Oct 2022 09:24:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH -next 0/2] riscv: ptrace: implement PTRACE_{PEEK,POKE}USR
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, <schwab@suse.de>
CC: <linux-riscv@lists.infradead.org>, <oleg@redhat.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <guoren@kernel.org>
References: <mhng-c0ab4916-fb1a-49e1-9a26-b93500ce5839@palmer-ri-x1c9>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <mhng-c0ab4916-fb1a-49e1-9a26-b93500ce5839@palmer-ri-x1c9>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_182430_605054_1576AAEB 
X-CRM114-Status: GOOD (  10.09  )
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

CuWcqCAyMDIyLzEwLzYgOToyNiwgUGFsbWVyIERhYmJlbHQg5YaZ6YGTOgo+IE9uIE1vbiwgMjIg
QXVnIDIwMjIgMDE6MTk6MDMgUERUICgtMDcwMCksIHNjaHdhYkBzdXNlLmRlIHdyb3RlOgo+PiBP
biBBdWcgMjIgMjAyMiwgWWlwZW5nIFpvdSB3cm90ZToKPj4KPj4+IFRoZSBQVFJBQ0Vfe1BFRUss
UE9LRX1VU1IgZ29pbmcgdG8gZ2V0L3NldCB0cmFjZWUncyB1c2VyIHJlZ2lzdGVyLgo+Pj4gVGhp
cyBwYXRjaCBzZXRzIGFkZCBQVFJBQ0Vfe1BFRUssUE9LRX1VU1IgYW5kIGNvbXBhdCBpbXBsZW1l
bnQgdG8KPj4+IHJpc2N2Lgo+Pj4KPj4+IEkgbm90aWNlIHRoaXMgaXNzdXNlIHdoZW4gdHJhbnNw
bGFudGluZyBzb21lIGFwcCBmb3JtIHg4NiB0byByaXNjdgo+Pj4gcmVjZW50bHkuCj4+PiBJIGRv
bid0IGtub3cgd2h5IHRoZXNlIHR3byBmdW5jdGlvbiBhcmUgbm90IGltcGxlbWVudGVkIG5vdywg
YW5kIEkKPj4+IGZvdW5kIGZldyB0YWxrIGFib3V0IHRoYXQuCj4+Pgo+Pj4gVGhlIHtQRUVLLFBP
S0V9VVNSIGFyZSBib3RoIGRlZmluZWQgaW4gaW5jbHVkZVx1YXBpXGxpbnV4XHB0cmFjZS5oLAo+
Pj4gU28gSSB3YXMgdGhpbmtpbmcgbWF5YmUgdGhlc2UgdHdvIGZ1bmN0aW9uIHNob3VsZWQgYmUg
aW1wbGVtZW50ZWQuCj4+Cj4+IFRoZXJlIGFyZSBQVFJBQ0VfW0dTXUVUUkVHU0VULsKgIEkgdGhp
bmsgUFRSQUNFX3tQRUVLLFBPS0V9VVNSIGFyZQo+PiBsZWdhY3ktb25seS4KPgo+IFRoYXQncyBt
eSB1bmRlcnN0YW5kaW5nIGFzIHdlbGwuwqAgQW55dGhpbmcgcG9ydGVkIHRvIFJJU0MtViB3b3Vs
ZCBuZWVkIAo+IHRvIHVuZGVyc3RhbmQgdGhlIG5ldyByZWdpc3RlciBmb3JtYXRzLCBzbyB0aGVy
ZSdzIG5vdCBtdWNoIGJlbmVmaXQgdG8gCj4gc3VwcG9ydGluZyB0aGVzZSBvbGQgZmxhdm9ycyBv
ZiByZWdpc3RlciB0d2lkZGxpbmcgLS0gbWF5YmUgc29tZSAKPiByZWZhY3RvcmluZyBuZWVkcyB0
byBiZSBkb25lIGluIHVzZXJzcGFjZSB0byB0YWtlIGFkdmFudGFnZSBvZiAKPiBhY2Nlc3Npbmcg
bXVsdGlwbGUgcmVnaXN0ZXJzIGF0IHRoZSBzYW1lIHRpbWUsIGJ1dCB0aGF0IHNob3VsZCAKPiBw
cm9iYWJseSBiZSBkb25lIGFueXdheSBhcyBhbGwgcG9ydHMgc3VwcG9ydCB0aGUgbmV3IGludGVy
ZmFjZXMgdGhlc2UgCj4gZGF5cy4KPgpvaywgZ290IGl0Lgo+IFRoZXJlJ3MgYmVlbiBhIGZldyBy
b3VuZHMgb2YgdGhlc2UgaGF2aW5nIGJlZW4gcG9zdGVkLCBtYXliZSB0aGF0IAo+IG1lYW5zIHRo
ZSBkb2N1bWVudGF0aW9uIHNob3VsZCBiZSBpbXByb3ZlZD/CoCBJIHNlbnQgCj4gPGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyMjEwMDYwMTI0MzIuMTkwMDgtMS1wYWxtZXJAcml2b3NpbmMu
Y29tLz4sIAo+IHRoYXQnbGwgYWxzbyBoZWxwIHNvcnQgb3V0IHdoZXRoZXIgd2UncmUgc3VwcG9z
ZWQgdG8gaGF2ZSB0aGVzZS4KCi0tIApSZWdhcmRzLApZaXBlbmcgWm91CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
