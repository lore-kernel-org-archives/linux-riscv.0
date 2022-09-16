Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5F7C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 11:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CDeafg09qB+sJBAHwIbuKEXX2eYgD+NqhHXmKtgRIw=; b=MVIcVdt1xEZHB6V29zV7a7oH0f
	rUOVAvleIiNb5BtqVVaZV6qV/yF4k3RciXOjnS0UOsBNR4ZU3HscrVXngdw76Qdge/sLBYe4NemRS
	j6c24RLWFzKqXeQwZOnnwL8fTVLbgqQuwpLWBWqk1wwxATk77Yydsq4Ocf6ugYLLDLMdN4t859ivq
	QNZORyp3vDdg+W5UPaE2+YkVWEdOjUkXSZl0rG5PgNh+Dy5mK++bfAdT9RKLPfh8tGYY1M74jzVgs
	1+vMEnsbtIg4BFePVV2Bni9EX0aek6tUEj86UUyMljXVIxlFN7Ayjs0tkDEVY1dFrpg+Mxj8h4wA4
	/Tdb0Ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9qK-00Crc3-HL; Fri, 16 Sep 2022 11:49:12 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9qF-00CrWB-UV
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 11:49:10 +0000
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MTXLK5dgvz14Qbs;
	Fri, 16 Sep 2022 19:44:57 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 16 Sep 2022 19:48:58 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 16 Sep 2022 19:48:57 +0800
Message-ID: <d91a73c2-6f99-fbb1-fd20-8d12765cb553@huawei.com>
Date: Fri, 16 Sep 2022 19:48:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH v2] riscv: tracing: Improve hardirq tracing message
To: <Conor.Dooley@microchip.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <guoren@kernel.org>,
	<tglx@linutronix.de>, <liaochang1@huawei.com>, <chris.zjh@huawei.com>
References: <20220915133648.59235-1-zouyipeng@huawei.com>
 <ab6654e6-2dda-4dfb-10b2-2c9624509507@microchip.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <ab6654e6-2dda-4dfb-10b2-2c9624509507@microchip.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_044908_369783_FA06ECDF 
X-CRM114-Status: GOOD (  10.74  )
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

CuWcqCAyMDIyLzkvMTUgMjI6MDQsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIOWGmemBkzoK
PiBPbiAxNS8wOS8yMDIyIDE0OjM2LCBZaXBlbmcgWm91IHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gVXNlIHRyYWNlX2hhcmRpcnFzX29uX2NhbGxlciB0
byBpbXByb3ZlIGlycV90cmFjaW5nIG1lc3NhZ2UuCj4+Cj4+IGxvY2tkZXAgbG9nIGluIHJpc2N2
IHNob3dpbmcgdGhlIGxhc3Qge2VuYWJsZWQsZGlzYWJsZWR9IGF0Cj4+IF9fdHJhY2VfaGFyZGly
cXNfe29uLG9mZn0gYWxsIHRoZSB0aW1lKGlmIGNhbGxlZCBieSkuCj4+IEJ1dCB0aGF0J3Mgbm90
IHdoYXQgd2Ugd2FudCB0byBzZWUsIHRoZSBjYWxsZXIgaXMgd2hhdCB3ZSB3YW50Lgo+Pgo+PiBC
ZWZvcmUgdGhpcyBjb21taXQ6Cj4+IFsgICA1Ny44NTMxNzVdIGhhcmRpcnFzIGxhc3QgIGVuYWJs
ZWQgYXQgKDI1MTkpOiBfX3RyYWNlX2hhcmRpcnFzX29uKzB4Yy8weDE0Cj4+IFsgICA1Ny44NTM4
NDhdIGhhcmRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDI1MjApOiBfX3RyYWNlX2hhcmRpcnFzX29m
ZisweGMvMHgxNAo+Pgo+PiBBZnRlciB0aGlzIGNvbW1pdAo+PiBbICAgNTMuNzgxNDI4XSBoYXJk
aXJxcyBsYXN0ICBlbmFibGVkIGF0ICgyNTk1KTogcmVzdG9yZV9hbGwrMHhlLzB4NjYKPj4gWyAg
IDUzLjc4MjE4NV0gaGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoMjU5Nik6IHJldF9mcm9tX2V4
Y2VwdGlvbisweGEvMHgxMAo+Pgo+PiBGaXhlczogMjJlMjEwMGIxYjA3ICgicmlzY3Y6IGZpeCBv
b3BzIGNhdXNlZCBieSBpcnFzb2ZmIGxhdGVuY3kgdHJhY2VyIikKPj4gU2lnbmVkLW9mZi1ieTog
WWlwZW5nIFpvdSA8em91eWlwZW5nQGh1YXdlaS5jb20+Cj4+IEFja2VkLWJ5OiBHdW8gUmVuIDxn
dW9yZW5Aa2VybmVsLm9yZz4KPj4gLS0tCj4+IHYyOiBhZGQgdGFncwo+Pgo+PiAgICBhcmNoL3Jp
c2N2L2tlcm5lbC90cmFjZV9pcnEuYyB8IDQgKystLQo+PiAgICBpbmNsdWRlL2xpbnV4L2lycWZs
YWdzLmggICAgICB8IDIgKysKPj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFj
ZV9pcnEuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYWNlX2lycS5jCj4+IGluZGV4IDA5NWFjOTc2
ZDdkYS4uN2NhMjRiMjZlMTlmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFj
ZV9pcnEuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEuYwo+PiBAQCAtMTYs
MTIgKzE2LDEyIEBACj4+Cj4+ICAgIHZvaWQgX190cmFjZV9oYXJkaXJxc19vbih2b2lkKQo+PiAg
ICB7Cj4+IC0gICAgICAgdHJhY2VfaGFyZGlycXNfb24oKTsKPj4gKyAgICAgICB0cmFjZV9oYXJk
aXJxc19vbl9jYWxsZXIoQ0FMTEVSX0FERFIwKTsKPiBPdXQgb2YgY3VyaW9zaXR5LCB3aHkgZG9l
cyByaXNjdiBuZWVkIHRvIHVzZSB0aGlzIHdoZW4KPiBvdGhlciBhcmNocyBkb247dD8KCkF0IHRo
ZSBzdGFydCB3ZSB1c2UgdHJhY2VfaGFyZGlycXNfe29uLG9mZn0gZGlyZWN0bHkgaW4gZW50cnku
UywgYnV0IGl0IApjYXN1ZSBhbiBvb3BzIGhlcmUuCgpCZWNhdXNlIG9mICJUaGUgdHJhY2VfaGFy
ZGlycXNfe29uLG9mZn0oKSByZXF1aXJlIHRoZSBjYWxsZXIgdG8gc2V0dXAgCmZyYW1lIHBvaW50
ZXIgcHJvcGVybHkuIiwKCmFuZCB0aGVuIHdlIGFkZCB0aGVzZSBmdW5jdGlvbi4KCkJ1dCBJIG5v
dGljZSB0aGF0IGd1b3JlbkBrZXJuZWwub3JnIGlzIHdvcmtpbmcgb24gY29udmVydCByaXNjdiB0
byB1c2UgCnRoZSBnZW5lcmljIGVudHJ5IGluZnJhc3RydWN0dXJlLAoKYXQgdGhhdCB0aW1lIGkg
dGhpbmsgd2UgY2FuIHJlbW92ZV9fdHJhY2VfaGFyZGlycXNfe29uLG9mZn0uCgo+PiAgICB9Cj4+
ICAgIE5PS1BST0JFX1NZTUJPTChfX3RyYWNlX2hhcmRpcnFzX29uKTsKPj4KPj4gICAgdm9pZCBf
X3RyYWNlX2hhcmRpcnFzX29mZih2b2lkKQo+PiAgICB7Cj4+IC0gICAgICAgdHJhY2VfaGFyZGly
cXNfb2ZmKCk7Cj4+ICsgICAgICAgdHJhY2VfaGFyZGlycXNfb2ZmX2NhbGxlcihDQUxMRVJfQURE
UjApOwo+PiAgICB9Cj4+ICAgIE5PS1BST0JFX1NZTUJPTChfX3RyYWNlX2hhcmRpcnFzX29mZik7
Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2lycWZsYWdzLmggYi9pbmNsdWRlL2xpbnV4
L2lycWZsYWdzLmgKPj4gaW5kZXggNWVjMGZhNzEzOTllLi40Njc3NGZhODVjZGUgMTAwNjQ0Cj4+
IC0tLSBhL2luY2x1ZGUvbGludXgvaXJxZmxhZ3MuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2ly
cWZsYWdzLmgKPj4gQEAgLTUzLDYgKzUzLDggQEAgZXh0ZXJuIHZvaWQgdHJhY2VfaGFyZGlycXNf
b25fcHJlcGFyZSh2b2lkKTsKPj4gICAgZXh0ZXJuIHZvaWQgdHJhY2VfaGFyZGlycXNfb2ZmX2Zp
bmlzaCh2b2lkKTsKPj4gICAgZXh0ZXJuIHZvaWQgdHJhY2VfaGFyZGlycXNfb24odm9pZCk7Cj4+
ICAgIGV4dGVybiB2b2lkIHRyYWNlX2hhcmRpcnFzX29mZih2b2lkKTsKPj4gK2V4dGVybiB2b2lk
IHRyYWNlX2hhcmRpcnFzX29uX2NhbGxlcih1bnNpZ25lZCBsb25nIGNhbGxlcl9hZGRyKTsKPj4g
K2V4dGVybiB2b2lkIHRyYWNlX2hhcmRpcnFzX29mZl9jYWxsZXIodW5zaWduZWQgbG9uZyBjYWxs
ZXJfYWRkcik7Cj4+Cj4+ICAgICMgZGVmaW5lIGxvY2tkZXBfaGFyZGlycV9jb250ZXh0KCkgICAg
IChyYXdfY3B1X3JlYWQoaGFyZGlycV9jb250ZXh0KSkKPj4gICAgIyBkZWZpbmUgbG9ja2RlcF9z
b2Z0aXJxX2NvbnRleHQocCkgICAgKChwKS0+c29mdGlycV9jb250ZXh0KQo+PiAtLQo+PiAyLjE3
LjEKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgoKLS0gClJlZ2FyZHMsCllpcGVuZyBab3UKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
