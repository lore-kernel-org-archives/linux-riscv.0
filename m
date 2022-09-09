Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8259ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4yznSTU57QtTLc+JrgP/bay1KWtHVqxB5FWiHxK5qg=; b=DJ7+lKfuz22fHd
	rUBGl+jmY1kEdhjbSpa6c9bam+bfEZD1VCKFV3HVrBSvAVfzYifaNil0TmQ5M9yBZ5a0I+EN/iSx0
	HqIy3x1noGBeEXIxHlwv+dcMSdIHokVvM+6GGylSY/LKjvoXLgJBouMGLkMB/X66fUh93AuH8lp8M
	Mj7rQC0bGLHicJFok6emqgFiM8ZCOeFW047EWQd+q428uddAsGX8Ma920QduFUAaD7GeQg+8raEOh
	jrMl7nr3goyeJghVGnZYC39gclPv4l8k6+VPBytHLHKFZeUNab+zp3Fb7X9+z8aeh5Lwk/LQTdjdb
	uu8LCbqSLaUso2vX7AMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWaUo-00F6mj-AD; Fri, 09 Sep 2022 09:40:22 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWaUk-00F6cV-H8
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 09:40:20 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MP9rX5PpWznV9y;
	Fri,  9 Sep 2022 17:37:32 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 17:40:08 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 17:40:08 +0800
Message-ID: <9d070742-8a82-3cb0-cea0-8ecce01c06b6@huawei.com>
Date: Fri, 9 Sep 2022 17:40:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH 2/2] riscv: tracing: Improve hardirq tracing message
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<rostedt@goodmis.org>, <mingo@redhat.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>
References: <20220901104515.135162-1-zouyipeng@huawei.com>
 <20220901104515.135162-3-zouyipeng@huawei.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <20220901104515.135162-3-zouyipeng@huawei.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_024018_784772_C427192D 
X-CRM114-Status: GOOD (  11.07  )
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

UGluZy4KCuWcqCAyMDIyLzkvMSAxODo0NSwgWWlwZW5nIFpvdSDlhpnpgZM6Cj4gVXNlIHRyYWNl
X2hhcmRpcnFzX29uX2NhbGxlciB0byBpbXByb3ZlIGlycV90cmFjaW5nIG1lc3NhZ2UuCj4KPiBs
b2NrZGVwIGxvZyBpbiByaXNjdiBzaG93aW5nIHRoZSBsYXN0IHtlbmFibGVkLGRpc2FibGVkfSBh
dAo+IF9fdHJhY2VfaGFyZGlycXNfe29uLG9mZn0gYWxsIHRoZSB0aW1lKGlmIGNhbGxlZCBieSku
Cj4gQnV0IHRoYXQncyBub3Qgd2hhdCB3ZSB3YW50IHRvIHNlZSwgdGhlIGNhbGxlciBpcyB3aGF0
IHdlIHdhbnQuCj4KPiBCZWZvcmUgdGhpcyBjb21taXQ6Cj4gWyAgIDU3Ljg1MzE3NV0gaGFyZGly
cXMgbGFzdCAgZW5hYmxlZCBhdCAoMjUxOSk6IF9fdHJhY2VfaGFyZGlycXNfb24rMHhjLzB4MTQK
PiBbICAgNTcuODUzODQ4XSBoYXJkaXJxcyBsYXN0IGRpc2FibGVkIGF0ICgyNTIwKTogX190cmFj
ZV9oYXJkaXJxc19vZmYrMHhjLzB4MTQKPgo+IEFmdGVyIHRoaXMgY29tbWl0Cj4gWyAgIDUzLjc4
MTQyOF0gaGFyZGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoMjU5NSk6IHJlc3RvcmVfYWxsKzB4ZS8w
eDY2Cj4gWyAgIDUzLjc4MjE4NV0gaGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoMjU5Nik6IHJl
dF9mcm9tX2V4Y2VwdGlvbisweGEvMHgxMAo+Cj4gU2lnbmVkLW9mZi1ieTogWWlwZW5nIFpvdSA8
em91eWlwZW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9p
cnEuYyB8IDQgKystLQo+ICAgaW5jbHVkZS9saW51eC9pcnFmbGFncy5oICAgICAgfCAyICsrCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYWNlX2lycS5jCj4gaW5kZXggMDk1YWM5NzZkN2RhLi43Y2EyNGIyNmUxOWYgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhY2VfaXJxLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFjZV9pcnEuYwo+IEBAIC0xNiwxMiArMTYsMTIgQEAKPiAgIAo+ICAgdm9pZCBf
X3RyYWNlX2hhcmRpcnFzX29uKHZvaWQpCj4gICB7Cj4gLQl0cmFjZV9oYXJkaXJxc19vbigpOwo+
ICsJdHJhY2VfaGFyZGlycXNfb25fY2FsbGVyKENBTExFUl9BRERSMCk7Cj4gICB9Cj4gICBOT0tQ
Uk9CRV9TWU1CT0woX190cmFjZV9oYXJkaXJxc19vbik7Cj4gICAKPiAgIHZvaWQgX190cmFjZV9o
YXJkaXJxc19vZmYodm9pZCkKPiAgIHsKPiAtCXRyYWNlX2hhcmRpcnFzX29mZigpOwo+ICsJdHJh
Y2VfaGFyZGlycXNfb2ZmX2NhbGxlcihDQUxMRVJfQUREUjApOwo+ICAgfQo+ICAgTk9LUFJPQkVf
U1lNQk9MKF9fdHJhY2VfaGFyZGlycXNfb2ZmKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9pcnFmbGFncy5oIGIvaW5jbHVkZS9saW51eC9pcnFmbGFncy5oCj4gaW5kZXggNWVjMGZhNzEz
OTllLi40Njc3NGZhODVjZGUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pcnFmbGFncy5o
Cj4gKysrIGIvaW5jbHVkZS9saW51eC9pcnFmbGFncy5oCj4gQEAgLTUzLDYgKzUzLDggQEAgZXh0
ZXJuIHZvaWQgdHJhY2VfaGFyZGlycXNfb25fcHJlcGFyZSh2b2lkKTsKPiAgIGV4dGVybiB2b2lk
IHRyYWNlX2hhcmRpcnFzX29mZl9maW5pc2godm9pZCk7Cj4gICBleHRlcm4gdm9pZCB0cmFjZV9o
YXJkaXJxc19vbih2b2lkKTsKPiAgIGV4dGVybiB2b2lkIHRyYWNlX2hhcmRpcnFzX29mZih2b2lk
KTsKPiArZXh0ZXJuIHZvaWQgdHJhY2VfaGFyZGlycXNfb25fY2FsbGVyKHVuc2lnbmVkIGxvbmcg
Y2FsbGVyX2FkZHIpOwo+ICtleHRlcm4gdm9pZCB0cmFjZV9oYXJkaXJxc19vZmZfY2FsbGVyKHVu
c2lnbmVkIGxvbmcgY2FsbGVyX2FkZHIpOwo+ICAgCj4gICAjIGRlZmluZSBsb2NrZGVwX2hhcmRp
cnFfY29udGV4dCgpCShyYXdfY3B1X3JlYWQoaGFyZGlycV9jb250ZXh0KSkKPiAgICMgZGVmaW5l
IGxvY2tkZXBfc29mdGlycV9jb250ZXh0KHApCSgocCktPnNvZnRpcnFfY29udGV4dCkKCi0tIApS
ZWdhcmRzLApZaXBlbmcgWm91CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
