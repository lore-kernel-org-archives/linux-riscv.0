Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D59C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 07:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GDtVDfgPd+A/hPXRSo4Dx+cHM/UiAskDdGgYdu+L7jY=; b=ZX8B9fbFs+pPhDg+/GLFDavZNK
	qTK96NfIvUg6cr5DgudrA0uGra9PXhXq8j2BhIGS1moRxi7Ogp9d9IMHAaxVvPr0mVy4OoLpbrV6M
	SGsHihB5N/h5CrotyZ2NWbaMRI+pDB+C/1S/M1E027eIuJ6K1HRWtqxY61qsYe831ubVv9GaQRa4d
	xMEgRLuzxQsk6oH8wYJqyc2Um6dp6CgrIHpx2gSp/qMT0tnT1JkBw82Dup0dR0kGQAA6NREoNuvjX
	CO6W0sHFgBSKgfCZausU/HO/Z4f4g4s5FxiO5020jndPLls9IEk1oVjgg9CmZCpleMti0/Kh2EiJE
	VG43+Uvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQAg-001OAO-Tw; Thu, 21 Jul 2022 07:00:30 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEQAc-001NyS-LX
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 07:00:28 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LpNj05TTtzGp7j;
	Thu, 21 Jul 2022 14:59:16 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 15:00:20 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 15:00:20 +0800
Message-ID: <72aacdcc-ae8e-1345-7630-0ecc9d024f15@huawei.com>
Date: Thu, 21 Jul 2022 15:00:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] riscv:uprobe fix SR_SPIE set/clear handling
To: <Conor.Dooley@microchip.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<guoren@kernel.org>, <penberg@kernel.org>
References: <20220721015952.151758-1-zouyipeng@huawei.com>
 <c6843bbf-d33e-1c2c-a8d9-b39b669a8ab7@microchip.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <c6843bbf-d33e-1c2c-a8d9-b39b669a8ab7@microchip.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_000026_925080_07960C75 
X-CRM114-Status: UNSURE (   6.03  )
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

CuWcqCAyMDIyLzcvMjEgMTQ6MjgsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIOWGmemBkzoK
PiBPbiAyMS8wNy8yMDIyIDAyOjU5LCBZaXBlbmcgWm91IHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gSW4gcmlzY3YgdGhlIHByb2Nlc3Mgb2YgdXByb2Jl
IGdvaW5nIHRvIGNsZWFyIHNwaWUgYmVmb3JlIGV4ZWMKPj4gdGhlIG9yaWdpbiBpbnNuLGFuZCBz
ZXQgc3BpZSBhZnRlciB0aGF0LkJ1dCBXaGVuIGFjY2VzcyB0aGUgcGFnZQo+PiB3aGljaCBvcmln
aW4gaW5zbiBoYXMgYmVlbiBwbGFjZWQgYSBwYWdlIGZhdWx0IG1heSBoYXBwZW4gYW5kCj4+IGly
cSB3YXMgZGlzYWJsZWQgaW4gYXJjaF91cHJvYmVfcHJlX3hvbCBmdW5jdGlvbixJdCBjYXVzZSBh
IFdBUk4KPj4gYXMgZm9sbG93cy4KPj4gVGhlcmUgaXMgbm8gbmVlZCB0byBjbGVhci9zZXQgc3Bp
ZSBpbiBhcmNoX3Vwcm9iZV9wcmUvcG9zdC9hYm9ydF94b2wuCj4+IFdlIGNhbiBqdXN0IHJlbW92
ZSBpdC4KPj4KPj4gWyAgIDMxLjY4NDE1N10gQlVHOiBzbGVlcGluZyBmdW5jdGlvbiBjYWxsZWQg
ZnJvbSBpbnZhbGlkIGNvbnRleHQgYXQga2VybmVsL2xvY2tpbmcvcndzZW0uYzoxNDg4Cj4+IFsg
ICAzMS42ODQ2NzddIGluX2F0b21pYygpOiAwLCBpcnFzX2Rpc2FibGVkKCk6IDEsIG5vbl9ibG9j
azogMCwgcGlkOiA3NiwgbmFtZTogd29yawo+PiBbICAgMzEuNjg0OTI5XSBwcmVlbXB0X2NvdW50
OiAwLCBleHBlY3RlZDogMAo+PiBbICAgMzEuNjg1OTY5XSBDUFU6IDIgUElEOiA3NiBDb21tOiB3
b3JrIFRhaW50ZWQ6IEcKPj4gWyAgIDMxLjY4NjU0Ml0gSGFyZHdhcmUgbmFtZTogcmlzY3Ytdmly
dGlvLHFlbXUgKERUKQo+PiBbICAgMzEuNjg2Nzk3XSBDYWxsIFRyYWNlOgo+PiBbICAgMzEuNjg3
MDUzXSBbPGZmZmZmZmZmODAwMDY0NDI+XSBkdW1wX2JhY2t0cmFjZSsweDMwLzB4MzgKPj4gWyAg
IDMxLjY4NzY5OV0gWzxmZmZmZmZmZjgwODEyMTE4Pl0gc2hvd19zdGFjaysweDQwLzB4NGMKPj4g
WyAgIDMxLjY4ODE0MV0gWzxmZmZmZmZmZjgwODE4MTdhPl0gZHVtcF9zdGFja19sdmwrMHg0NC8w
eDVjCj4+IFsgICAzMS42ODgzOTZdIFs8ZmZmZmZmZmY4MDgxODFhYT5dIGR1bXBfc3RhY2srMHgx
OC8weDIwCj4+IFsgICAzMS42ODg2NTNdIFs8ZmZmZmZmZmY4MDAzZTQ1ND5dIF9fbWlnaHRfcmVz
Y2hlZCsweDExNC8weDEyMgo+PiBbICAgMzEuNjg4OTQ4XSBbPGZmZmZmZmZmODAwM2U0YjI+XSBf
X21pZ2h0X3NsZWVwKzB4NTAvMHg3YQo+PiBbICAgMzEuNjg5NDM1XSBbPGZmZmZmZmZmODA4MjI2
NzY+XSBkb3duX3JlYWQrMHgzMC8weDEzMAo+PiBbICAgMzEuNjg5NzI4XSBbPGZmZmZmZmZmODAw
MGI2NTA+XSBkb19wYWdlX2ZhdWx0KzB4MTY2L3g0NDYKPj4gWyAgIDMxLjY4OTk5N10gWzxmZmZm
ZmZmZjgwMDAzYzBjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weGMKPj4KPj4gRml4ZXM6IDc0
Nzg0MDgxYWFjOCAoInJpc2N2OiBBZGQgdXByb2JlcyBzdXBwb3J0ZWQiKQo+PiBTaWduZWQtb2Zm
LWJ5OiBZaXBlbmcgWm91IDx6b3V5aXBlbmdAaHVhd2VpLmNvbT4KPiBIZXkgWWlwZW5nLAo+Cj4g
WW91IGdvdCBhIHJldmlld2VkIGJ5IGZyb20gR3VvIFJlbiBvbiBWMSwgaXMgdGhlcmUgYSByZWFz
b24gdGhhdAo+IHlvdSBkaWRuJ3QgYXBwbHkgaXQ/Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsL0NBSkYyZ1RUQlFyU1ZlRjBhQzVUS2FIPUNGbzVRRHVDRThub0Y3ZTJONT00TUs1YnBtQUBt
YWlsLmdtYWlsLmNvbS8KPgo+IFRoYW5rcywKPiBDb25vci4KCkhpIENvbm9yLAoKIMKgwqDCoCBv
aCBzb3JyeSwgaSBqdXN0IG1pc3MgaXQgLHRoZXJlIGFyZSBubyBjaGFuZ2VzIHdpdGggY29kZS4K
Cj4+IC0tLQo+PiB2MjogQWRkIEZpeGVzIHRhZwo+PiB2MzogUmVuYW1lIFN1YmplY3QKPj4KLS0g
ClJlZ2FyZHMsCllpcGVuZyBab3UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
