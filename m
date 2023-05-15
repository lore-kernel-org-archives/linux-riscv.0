Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA08C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 11:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJpYyaWsCA2wIf0NF9vIXA0h/jGH0xKmgsMuykpWxko=; b=iMef+2beagrK5t
	E4VYs4pHZwCfIsZBJC6mhb6lM6zjPXTFoLqlNpC59bFozSpBcilrlx4hKFgKBRYRFIM18/+KkUEjR
	J7LhMYzMYrsg1rEFUsyBDDIpNdWHo78dqsXg4vuly9XVfFa0450MocTn+NMH9qfNSys8LHjncHLkv
	i3RUut072+De8rz6EEOBtuFuNS8wciMXEg9BTAdF6xRillyM1Yv1u6MRVzkTlGagkrR3fxNogH2qu
	PObVA4GkVz+JPyu3yuhFW/WVcAM8EMdAuXxqp2la/DiLhDEVVffXYaU4O97rPBB7Iqwr9PF2HSNZ0
	sXBQIRYBwEYgzhFgNwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWnv-002381-0v;
	Mon, 15 May 2023 11:55:51 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWnr-00233t-1T
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 11:55:49 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QKd780JgPzsRpS;
	Mon, 15 May 2023 19:53:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 15 May 2023 19:55:37 +0800
Message-ID: <c9b6939c-f072-c4aa-b721-3cd0b2fd5635@huawei.com>
Date: Mon, 15 May 2023 19:55:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3] riscv: fix kprobe __user string arg print fault issue
Content-Language: en-US
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230504072910.3742842-1-ruanjinjie@huawei.com>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230504072910.3742842-1-ruanjinjie@huawei.com>
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_045547_694947_AB750D0B 
X-CRM114-Status: GOOD (  12.68  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UGluZy4KCk9uIDIwMjMvNS80IDE1OjI5LCBSdWFuIEppbmppZSB3cm90ZToKPiBPbiByaXNjdiBx
ZW11IHBsYXRmb3JtLCB3aGVuIGFkZCBrcHJvYmUgZXZlbnQgb24gZG9fc3lzX29wZW4oKSB0byBz
aG93Cj4gZmlsZW5hbWUgc3RyaW5nIGFyZywgaXQganVzdCBwcmludCBmYXVsdCBhcyBmb2xsb3c6
Cj4gCj4gZWNobyAncDpteXByb2JlIGRvX3N5c19vcGVuIGRmZD0kYXJnMSBmaWxlbmFtZT0rMCgk
YXJnMik6c3RyaW5nIGZsYWdzPSRhcmczCj4gbW9kZT0kYXJnNCcgPiBrcHJvYmVfZXZlbnRzCj4g
Cj4gYmFzaC0xNjYgICAgIFswMDBdIC4uLjEuICAgMzYwLjE5NTM2NzogbXlwcm9iZTogKGRvX3N5
c19vcGVuKzB4MC8weDg0KQo+IGRmZD0weGZmZmZmZmZmZmZmZmZmOWMgZmlsZW5hbWU9KGZhdWx0
KSBmbGFncz0weDgyNDEgbW9kZT0weDFiNgo+IAo+IGJhc2gtMTY2ICAgICBbMDAwXSAuLi4xLiAg
IDM2MC4yMTkzNjk6IG15cHJvYmU6IChkb19zeXNfb3BlbisweDAvMHg4NCkKPiBkZmQ9MHhmZmZm
ZmZmZmZmZmZmZjljIGZpbGVuYW1lPShmYXVsdCkgZmxhZ3M9MHg4MjQxIG1vZGU9MHgxYjYKPiAK
PiBiYXNoLTE5MSAgICAgWzAwMF0gLi4uMS4gICAzNjAuMzc4ODI3OiBteXByb2JlOiAoZG9fc3lz
X29wZW4rMHgwLzB4ODQpCj4gZGZkPTB4ZmZmZmZmZmZmZmZmZmY5YyBmaWxlbmFtZT0oZmF1bHQp
IGZsYWdzPTB4OTg4MDAgbW9kZT0weDAKPiAKPiBBcyByaXNjdiBkbyBub3Qgc2VsZWN0IEFSQ0hf
SEFTX05PTl9PVkVSTEFQUElOR19BRERSRVNTX1NQQUNFLAo+IHRoZSArMCgkYXJnMikgYWRkciBp
cyBwcm9jZXNzZWQgYXMgYSBrZXJuZWwgYWRkcmVzcyB0aG91Z2ggaXQgaXMgYQo+IHVzZXJzcGFj
ZSBhZGRyZXNzLCBjYXVzZSB0aGUgYWJvdmUgZmlsZW5hbWU9KGZhdWx0KSBwcmludC4gU28gc2Vs
ZWN0Cj4gQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FERFJFU1NfU1BBQ0UgdG8gYXZvaWQgdGhl
IGlzc3VlLCBhZnRlciB0aGF0IHRoZQo+IGtwcm9iZSB0cmFjZSBpcyBvayBhcyBiZWxvdzoKPiAK
PiBiYXNoLTE2NiAgICAgWzAwMF0gLi4uMS4gICAgOTYuNzY3NjQxOiBteXByb2JlOiAoZG9fc3lz
X29wZW4rMHgwLzB4ODQpCj4gZGZkPTB4ZmZmZmZmZmZmZmZmZmY5YyBmaWxlbmFtZT0iL2Rldi9u
dWxsIiBmbGFncz0weDgyNDEgbW9kZT0weDFiNgo+IAo+IGJhc2gtMTY2ICAgICBbMDAwXSAuLi4x
LiAgICA5Ni43OTM3NTE6IG15cHJvYmU6IChkb19zeXNfb3BlbisweDAvMHg4NCkKPiBkZmQ9MHhm
ZmZmZmZmZmZmZmZmZjljIGZpbGVuYW1lPSIvZGV2L251bGwiIGZsYWdzPTB4ODI0MSBtb2RlPTB4
MWI2Cj4gCj4gYmFzaC0xNzcgICAgIFswMDBdIC4uLjEuICAgIDk2Ljk2MjM1NDogbXlwcm9iZTog
KGRvX3N5c19vcGVuKzB4MC8weDg0KQo+IGRmZD0weGZmZmZmZmZmZmZmZmZmOWMgZmlsZW5hbWU9
Ii9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL2twcm9iZXMvIgo+IGZsYWdzPTB4OTg4
MDAgbW9kZT0weDAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSdWFuIEppbmppZSA8cnVhbmppbmppZUBo
dWF3ZWkuY29tPgo+IEFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+
Cj4gLS0tCj4gdjI6Cj4gLSBhZGQgdGhlIGNvbmZpZyBpbiBhbHBoYWJldGljYWwgb3JkZXIKPiAt
LS0KPiB2MzoKPiAtIGNoYW5nZSBzaWduZWQtb2ZmLWJ5IHRvIHVzZSBmdWxsIG5hbWUKPiAtLS0K
PiAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tj
b25maWcKPiBpbmRleCBkMjk2N2ZlZmExZDcuLmIwOGVkOTI5ZTIyMCAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtMjYsNiAr
MjYsNyBAQCBjb25maWcgUklTQ1YKPiAgCXNlbGVjdCBBUkNIX0hBU19HSUdBTlRJQ19QQUdFCj4g
IAlzZWxlY3QgQVJDSF9IQVNfS0NPVgo+ICAJc2VsZWN0IEFSQ0hfSEFTX01NSU9XQgo+ICsJc2Vs
ZWN0IEFSQ0hfSEFTX05PTl9PVkVSTEFQUElOR19BRERSRVNTX1NQQUNFCj4gIAlzZWxlY3QgQVJD
SF9IQVNfUE1FTV9BUEkKPiAgCXNlbGVjdCBBUkNIX0hBU19QVEVfU1BFQ0lBTAo+ICAJc2VsZWN0
IEFSQ0hfSEFTX1NFVF9ESVJFQ1RfTUFQIGlmIE1NVQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
