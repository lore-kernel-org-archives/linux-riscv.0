Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B2ECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 07:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haJJfQKM3LTd0k0g5gD2aNZdJLCbxK42ThgMahW+byc=; b=0457N9zivrhjch
	+Q/JIea3Z3RJeMsr6YIZ7sUJah8q9n7AQV2R5Z6MrRBxgkoYVOgQpxhKCltMwuVSRY/bVDSPzKpIJ
	ldDeoEXMCjKnZjut8hzkz+22TrHgq4fmiheekVFhqQrTZ7NtZnI3d5ZiI8vfWyx549EaFD2oTpUu5
	Jx4TK7UIVM2QyNcm8JnG6ZG0Bm+4V72kuZEfFcZGhKPMievqwqP04qzb2aRaySGpxAJTHNkZj8UvY
	Yke8H42ZgEgwWtDOnpi/2Txfa5CBxKY0BEb28icj52tgOrL9KybM6nDB+g50Chm5BGoy8iUQOz7ZG
	t6vRheyObeVE64ZqhfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYMpz-009gbT-KA; Wed, 14 Sep 2022 07:29:35 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYMpu-009gLX-R1
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 07:29:34 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MSBg46ysczNmHr;
	Wed, 14 Sep 2022 15:24:48 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 15:29:15 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 15:29:15 +0800
Message-ID: <ddcdc551-08f0-6b85-7985-5bca47b1989f@huawei.com>
Date: Wed, 14 Sep 2022 15:29:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH 2/2] riscv: tracing: Improve hardirq tracing message
From: Yipeng Zou <zouyipeng@huawei.com>
To: <linux-riscv@lists.infradead.org>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>
References: <20220901104515.135162-1-zouyipeng@huawei.com>
 <20220901104515.135162-3-zouyipeng@huawei.com>
 <9d070742-8a82-3cb0-cea0-8ecce01c06b6@huawei.com>
In-Reply-To: <9d070742-8a82-3cb0-cea0-8ecce01c06b6@huawei.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_002931_293620_CD3DBA24 
X-CRM114-Status: UNSURE (   7.44  )
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

TG9vcCBpbiBndW9yZW5Aa2VybmVsLm9yZywKClBsZWFzZSBoZWxwIHJldmlldyBvbiB0aGlzIHBh
dGNoLCB0aGFua3MgdmVyeSBtdWNoLgoK5ZyoIDIwMjIvOS85IDE3OjQwLCBZaXBlbmcgWm91IOWG
memBkzoKPiBQaW5nLgo+Cj4g5ZyoIDIwMjIvOS8xIDE4OjQ1LCBZaXBlbmcgWm91IOWGmemBkzoK
Pj4gVXNlIHRyYWNlX2hhcmRpcnFzX29uX2NhbGxlciB0byBpbXByb3ZlIGlycV90cmFjaW5nIG1l
c3NhZ2UuCj4+Cj4+IGxvY2tkZXAgbG9nIGluIHJpc2N2IHNob3dpbmcgdGhlIGxhc3Qge2VuYWJs
ZWQsZGlzYWJsZWR9IGF0Cj4+IF9fdHJhY2VfaGFyZGlycXNfe29uLG9mZn0gYWxsIHRoZSB0aW1l
KGlmIGNhbGxlZCBieSkuCj4+IEJ1dCB0aGF0J3Mgbm90IHdoYXQgd2Ugd2FudCB0byBzZWUsIHRo
ZSBjYWxsZXIgaXMgd2hhdCB3ZSB3YW50Lgo+Pgo+PiBCZWZvcmUgdGhpcyBjb21taXQ6Cj4+IFvC
oMKgIDU3Ljg1MzE3NV0gaGFyZGlycXMgbGFzdMKgIGVuYWJsZWQgYXQgKDI1MTkpOiAKPj4gX190
cmFjZV9oYXJkaXJxc19vbisweGMvMHgxNAo+PiBbwqDCoCA1Ny44NTM4NDhdIGhhcmRpcnFzIGxh
c3QgZGlzYWJsZWQgYXQgKDI1MjApOiAKPj4gX190cmFjZV9oYXJkaXJxc19vZmYrMHhjLzB4MTQK
Pj4KPj4gQWZ0ZXIgdGhpcyBjb21taXQKPj4gW8KgwqAgNTMuNzgxNDI4XSBoYXJkaXJxcyBsYXN0
wqAgZW5hYmxlZCBhdCAoMjU5NSk6IHJlc3RvcmVfYWxsKzB4ZS8weDY2Cj4+IFvCoMKgIDUzLjc4
MjE4NV0gaGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoMjU5Nik6IAo+PiByZXRfZnJvbV9leGNl
cHRpb24rMHhhLzB4MTAKPj4KPj4gU2lnbmVkLW9mZi1ieTogWWlwZW5nIFpvdSA8em91eWlwZW5n
QGh1YXdlaS5jb20+Cj4+IC0tLQo+PiDCoCBhcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEuYyB8
IDQgKystLQo+PiDCoCBpbmNsdWRlL2xpbnV4L2lycWZsYWdzLmjCoMKgwqDCoMKgIHwgMiArKwo+
PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYWNlX2lycS5jIAo+PiBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYWNlX2lycS5jCj4+IGluZGV4IDA5NWFjOTc2ZDdkYS4uN2NhMjRiMjZl
MTlmIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEuYwo+PiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEuYwo+PiBAQCAtMTYsMTIgKzE2LDEyIEBACj4+
IMKgIMKgIHZvaWQgX190cmFjZV9oYXJkaXJxc19vbih2b2lkKQo+PiDCoCB7Cj4+IC3CoMKgwqAg
dHJhY2VfaGFyZGlycXNfb24oKTsKPj4gK8KgwqDCoCB0cmFjZV9oYXJkaXJxc19vbl9jYWxsZXIo
Q0FMTEVSX0FERFIwKTsKPj4gwqAgfQo+PiDCoCBOT0tQUk9CRV9TWU1CT0woX190cmFjZV9oYXJk
aXJxc19vbik7Cj4+IMKgIMKgIHZvaWQgX190cmFjZV9oYXJkaXJxc19vZmYodm9pZCkKPj4gwqAg
ewo+PiAtwqDCoMKgIHRyYWNlX2hhcmRpcnFzX29mZigpOwo+PiArwqDCoMKgIHRyYWNlX2hhcmRp
cnFzX29mZl9jYWxsZXIoQ0FMTEVSX0FERFIwKTsKPj4gwqAgfQo+PiDCoCBOT0tQUk9CRV9TWU1C
T0woX190cmFjZV9oYXJkaXJxc19vZmYpOwo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9p
cnFmbGFncy5oIGIvaW5jbHVkZS9saW51eC9pcnFmbGFncy5oCj4+IGluZGV4IDVlYzBmYTcxMzk5
ZS4uNDY3NzRmYTg1Y2RlIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2lycWZsYWdzLmgK
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9pcnFmbGFncy5oCj4+IEBAIC01Myw2ICs1Myw4IEBAIGV4
dGVybiB2b2lkIHRyYWNlX2hhcmRpcnFzX29uX3ByZXBhcmUodm9pZCk7Cj4+IMKgIGV4dGVybiB2
b2lkIHRyYWNlX2hhcmRpcnFzX29mZl9maW5pc2godm9pZCk7Cj4+IMKgIGV4dGVybiB2b2lkIHRy
YWNlX2hhcmRpcnFzX29uKHZvaWQpOwo+PiDCoCBleHRlcm4gdm9pZCB0cmFjZV9oYXJkaXJxc19v
ZmYodm9pZCk7Cj4+ICtleHRlcm4gdm9pZCB0cmFjZV9oYXJkaXJxc19vbl9jYWxsZXIodW5zaWdu
ZWQgbG9uZyBjYWxsZXJfYWRkcik7Cj4+ICtleHRlcm4gdm9pZCB0cmFjZV9oYXJkaXJxc19vZmZf
Y2FsbGVyKHVuc2lnbmVkIGxvbmcgY2FsbGVyX2FkZHIpOwo+PiDCoCDCoCAjIGRlZmluZSBsb2Nr
ZGVwX2hhcmRpcnFfY29udGV4dCgpIChyYXdfY3B1X3JlYWQoaGFyZGlycV9jb250ZXh0KSkKPj4g
wqAgIyBkZWZpbmUgbG9ja2RlcF9zb2Z0aXJxX2NvbnRleHQocCkgKChwKS0+c29mdGlycV9jb250
ZXh0KQo+Ci0tIApSZWdhcmRzLApZaXBlbmcgWm91CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
