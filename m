Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6884BC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 01:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73+RRX7HSCmMMVB6Mzo0qrjtrYT4ieufqWE5I57nHqI=; b=qxvx61fuWWyw3twviglgYMXHlg
	tb/vt3XQkxtHBP2Etwh8gjM70bWdyk1bYdr0PsW20QgyB59ua8qeFHT4WluZuozUgNNNC3f6fZ+gt
	br4vaMkEXNjK3q7I/aTql0uDPlje54L4B3vgX0PNk8wusIiap/Rx4vAHkjOdmvhuTOZuxoj3Soyc3
	+NW+lvSNd3c0ix96lQYxESc+LPG7rSnx3xSpsJiwTxbH5IDjN9+o8uNkYb6Eo76XrsJ5tb+YmrooF
	E4zVphDmWq6H6aZLX8mrQjBHCc4a8Ux7OkdJeUZK+xmZ3HxigoLgURSJOr9XgGXXNpTz6dlXoKbb8
	uxjx7zbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEKna-00EKIy-3x; Thu, 21 Jul 2022 01:16:18 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEKnV-00EK5v-UW
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 01:16:16 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LpF0c3VMVzWf2c;
	Thu, 21 Jul 2022 09:12:16 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 09:16:05 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 09:16:04 +0800
Message-ID: <17b5f8ba-c189-fec7-e621-cde8faad76e9@huawei.com>
Date: Thu, 21 Jul 2022 09:16:04 +0800
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
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <7867387b-3ffe-f51d-b15f-5f0ac45c8e48@microchip.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_181614_356988_EBFE0941 
X-CRM114-Status: UNSURE (   9.36  )
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

CuWcqCAyMDIyLzcvMjAgMTc6NTEsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIOWGmemBkzoK
PiBPbiAyMC8wNy8yMDIyIDEwOjM0LCBZaXBlbmcgWm91IHdyb3RlOgo+PiBbUEFUQ0ggLW5leHQg
djJdIHJpc2N2OnVwcm9iZSByZW1vdmUgc2V0L2NsZWFyIFNSX1NQSUUgaW4gYXJjaF91cHJvYmVf
cHJlL3Bvc3QvYWJvcnRfeG9sCj4gSGV5IFlpcGVuZywKPiBKdXN0IGEgc3VnZ2VzdGlvbiBvbiB0
aGUgY29tbWl0IG1lc3NhZ2UsIGhvdyBhYm91dCBqdXN0Ogo+ICJyaXNjdjogdXByb2JlOiBmaXgg
U1JfU1BJRSBzZXQvY2xlYXIgaGFuZGxpbmciCj4KPiBUaGFua3MsCj4gQ29ub3IuCgpvaCwgaXQn
cyBtb3JlIHJlYXNvbmFibGUsIHdpbGwgcmVuYW1lIGluIG5leHQgdmVyc2lvbiwgdGhhbmtzIGZv
ciBhZHZpY2UuCgo+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIHpvdXlpcGVuZ0Bo
dWF3ZWkuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMv
TGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPj4KPj4gRVhURVJOQUwgRU1BSUw6IERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlCj4+Cj4+IEluIHJpc2N2IHRoZSBwcm9jZXNzIG9mIHVwcm9iZSBnb2lu
ZyB0byBjbGVhciBzcGllIGJlZm9yZSBleGVjCj4+IHRoZSBvcmlnaW4gaW5zbixhbmQgc2V0IHNw
aWUgYWZ0ZXIgdGhhdC5CdXQgV2hlbiBhY2Nlc3MgdGhlIHBhZ2UKPj4gd2hpY2ggb3JpZ2luIGlu
c24gaGFzIGJlZW4gcGxhY2VkIGEgcGFnZSBmYXVsdCBtYXkgaGFwcGVuIGFuZAo+PiBpcnEgd2Fz
IGRpc2FibGVkIGluIGFyY2hfdXByb2JlX3ByZV94b2wgZnVuY3Rpb24sSXQgY2F1c2UgYSBXQVJO
Cj4+IGFzIGZvbGxvd3MuCj4+IFRoZXJlIGlzIG5vIG5lZWQgdG8gY2xlYXIvc2V0IHNwaWUgaW4g
YXJjaF91cHJvYmVfcHJlL3Bvc3QvYWJvcnRfeG9sLgo+PiBXZSBjYW4ganVzdCByZW1vdmUgaXQu
Cj4+Cj4+IFsgICAzMS42ODQxNTddIEJVRzogc2xlZXBpbmcgZnVuY3Rpb24gY2FsbGVkIGZyb20g
aW52YWxpZCBjb250ZXh0IGF0IGtlcm5lbC9sb2NraW5nL3J3c2VtLmM6MTQ4OAo+PiBbICAgMzEu
Njg0Njc3XSBpbl9hdG9taWMoKTogMCwgaXJxc19kaXNhYmxlZCgpOiAxLCBub25fYmxvY2s6IDAs
IHBpZDogNzYsIG5hbWU6IHdvcmsKPj4gWyAgIDMxLjY4NDkyOV0gcHJlZW1wdF9jb3VudDogMCwg
ZXhwZWN0ZWQ6IDAKPj4gWyAgIDMxLjY4NTk2OV0gQ1BVOiAyIFBJRDogNzYgQ29tbTogd29yayBU
YWludGVkOiBHCj4+IFsgICAzMS42ODY1NDJdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxx
ZW11IChEVCkKPj4gWyAgIDMxLjY4Njc5N10gQ2FsbCBUcmFjZToKPj4gWyAgIDMxLjY4NzA1M10g
WzxmZmZmZmZmZjgwMDA2NDQyPl0gZHVtcF9iYWNrdHJhY2UrMHgzMC8weDM4Cj4+IFsgICAzMS42
ODc2OTldIFs8ZmZmZmZmZmY4MDgxMjExOD5dIHNob3dfc3RhY2srMHg0MC8weDRjCj4+IFsgICAz
MS42ODgxNDFdIFs8ZmZmZmZmZmY4MDgxODE3YT5dIGR1bXBfc3RhY2tfbHZsKzB4NDQvMHg1Ywo+
PiBbICAgMzEuNjg4Mzk2XSBbPGZmZmZmZmZmODA4MTgxYWE+XSBkdW1wX3N0YWNrKzB4MTgvMHgy
MAo+PiBbICAgMzEuNjg4NjUzXSBbPGZmZmZmZmZmODAwM2U0NTQ+XSBfX21pZ2h0X3Jlc2NoZWQr
MHgxMTQvMHgxMjIKPj4gWyAgIDMxLjY4ODk0OF0gWzxmZmZmZmZmZjgwMDNlNGIyPl0gX19taWdo
dF9zbGVlcCsweDUwLzB4N2EKPj4gWyAgIDMxLjY4OTQzNV0gWzxmZmZmZmZmZjgwODIyNjc2Pl0g
ZG93bl9yZWFkKzB4MzAvMHgxMzAKPj4gWyAgIDMxLjY4OTcyOF0gWzxmZmZmZmZmZjgwMDBiNjUw
Pl0gZG9fcGFnZV9mYXVsdCsweDE2Ni94NDQ2Cj4+IFsgICAzMS42ODk5OTddIFs8ZmZmZmZmZmY4
MDAwM2MwYz5dIHJldF9mcm9tX2V4Y2VwdGlvbisweDAvMHhjCj4+Cj4+IEZpeGVzOiA3NDc4NDA4
MWFhYzggKCJyaXNjdjogQWRkIHVwcm9iZXMgc3VwcG9ydGVkIikKPj4gU2lnbmVkLW9mZi1ieTog
WWlwZW5nIFpvdSA8em91eWlwZW5nQGh1YXdlaS5jb20+Cj4+IC0tLQo+PiB2MjogQWRkIEZpeGVz
IHRhZwo+Pgo+PiAgICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jIHwgNiAtLS0t
LS0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwv
cHJvYmVzL3Vwcm9iZXMuYwo+PiBpbmRleCA3YTA1N2I1ZjBhZGMuLmM5NzZhMjFjZDRiZCAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYwo+PiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jCj4+IEBAIC01OSw4ICs1OSw2IEBAIGlu
dCBhcmNoX3Vwcm9iZV9wcmVfeG9sKHN0cnVjdCBhcmNoX3Vwcm9iZSAqYXVwcm9iZSwgc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpCj4+Cj4+ICAgICAgICAgICBpbnN0cnVjdGlvbl9wb2ludGVyX3NldChy
ZWdzLCB1dGFzay0+eG9sX3ZhZGRyKTsKPj4KPj4gLSAgICAgICByZWdzLT5zdGF0dXMgJj0gflNS
X1NQSUU7Cj4+IC0KPj4gICAgICAgICAgIHJldHVybiAwOwo+PiAgICB9Cj4+Cj4+IEBAIC03Miw4
ICs3MCw2IEBAIGludCBhcmNoX3Vwcm9iZV9wb3N0X3hvbChzdHJ1Y3QgYXJjaF91cHJvYmUgKmF1
cHJvYmUsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pgo+PiAgICAgICAgICAgaW5zdHJ1Y3Rpb25f
cG9pbnRlcl9zZXQocmVncywgdXRhc2stPnZhZGRyICsgYXVwcm9iZS0+aW5zbl9zaXplKTsKPj4K
Pj4gLSAgICAgICByZWdzLT5zdGF0dXMgfD0gU1JfU1BJRTsKPj4gLQo+PiAgICAgICAgICAgcmV0
dXJuIDA7Cj4+ICAgIH0KPj4KPj4gQEAgLTExMSw4ICsxMDcsNiBAQCB2b2lkIGFyY2hfdXByb2Jl
X2Fib3J0X3hvbChzdHJ1Y3QgYXJjaF91cHJvYmUgKmF1cHJvYmUsIHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+PiAgICAgICAgICAgICogYWRkcmVzcy4KPj4gICAgICAgICAgICAqLwo+PiAgICAgICAg
ICAgaW5zdHJ1Y3Rpb25fcG9pbnRlcl9zZXQocmVncywgdXRhc2stPnZhZGRyKTsKPj4gLQo+PiAt
ICAgICAgIHJlZ3MtPnN0YXR1cyAmPSB+U1JfU1BJRTsKPj4gICAgfQo+Pgo+PiAgICBib29sIGFy
Y2hfdXJldHByb2JlX2lzX2FsaXZlKHN0cnVjdCByZXR1cm5faW5zdGFuY2UgKnJldCwgZW51bSBy
cF9jaGVjayBjdHgsCj4+IC0tCj4+IDIuMTcuMQo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgotLSAKUmVnYXJkcywKWWlwZW5n
IFpvdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
