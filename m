Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546E0C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 02:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:CC:References:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1MWU65U7UaWCIfuUpuzUq8njzx1AnqZpFVm02sf3Jmk=; b=iVPjrGd3xPP+1tEZ79V2f9kG/f
	KOgAVkjdBNuBgjG4jxW9jupRHXIIjJNLmX9KGLN+7zV7SoSkezneEyPWC3Jrx7Ub7mJgceGsLxf0f
	wY6gq612aaKTXAtkISYlAn2ygmScoITsh/NH53vF+CBlJLcIAheYqHqAeAxn+xYjcgPQyDgULGJ+e
	UApF8hFZYSBQXCthxf9wMADybRRaziJIkNnKMbrTEz5ilycvsZPzfTjKjsYa+Kpx/YdfzWytWrr3y
	1KQZtYnY/M3XCeIpvD24nsPjLpqO7uW4CzYU7R7VX8kvJWzS0RvnHe4pdQfZGRsfJjzeuuGSFUB0u
	L0/yFubw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiRmi-006YrO-O2; Wed, 12 Oct 2022 02:47:52 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiRmf-006YoQ-5L
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 02:47:50 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MnH6k0zkLzpVbc;
	Wed, 12 Oct 2022 10:44:30 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 10:47:40 +0800
Received: from [10.174.179.24] (10.174.179.24) by
 dggpemm100009.china.huawei.com (7.185.36.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 10:47:40 +0800
Subject: Re: [PATCH v2 0/2] riscv: Support HAVE_ARCH_HUGE_VMAP and
 HAVE_ARCH_HUGE_VMALLOC
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Conor Dooley
	<conor@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, Jonathan Corbet
	<corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20221008140506.1066805-1-liushixin2@huawei.com>
 <87tu4ah6un.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
From: Liu Shixin <liushixin2@huawei.com>
Message-ID: <420713ca-9a77-b519-1811-9ec9815010c4@huawei.com>
Date: Wed, 12 Oct 2022 10:47:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <87tu4ah6un.fsf@smulpajen.i-did-not-set--mail-host-address--so-tickle-me>
X-Originating-IP: [10.174.179.24]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_194749_410238_E32B8802 
X-CRM114-Status: GOOD (  14.63  )
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

T24gMjAyMi8xMC8xMSAyMDozOSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBMaXUgU2hpeGluIDxs
aXVzaGl4aW4yQGh1YXdlaS5jb20+IHdyaXRlczoKPgo+PiBTaW5jZSByaXNjdjY0IGhhcyBhbHJl
YWR5IHN1cHBvcnQgU0FUUF9NT0RFXzU3IGJ5IGRlZmF1bHQsIGl0IGlzIHRpbWUgdG8KPj4gc3Vw
cG9ydCBtb3JlIGh1Z2VwYWdlLXJlbGF0ZWQgZmVhdHVyZXMuIFRoZXNlIHR3byBwYXRjaGVzIHdp
bGwgZW5hYmxlCj4+IEhBVkVfQVJDSF9IVUdFX1ZNQVAgYW5kIEhBVkVfQVJDSF9IVUdFX1ZNQUxM
T0MuCj4+Cj4gSnVzdCBhIG5vdGU7IFRoZSBIUCBzdXBwb3J0IGRvZXMgbm90IHJlcXVpcmUgc3Y1
Ny4gUG1kL01lZ2EtIGFuZAo+IHB1ZC9naWdhcGFnZXMgd29yayBmb3Igc3YzOSBhbmQgc3Y0OCBh
cyB3ZWxsLgpZZXMsIEkgZGlkbid0IGV4cGxhaW4gaXQgY2xlYXJseS4gSSB3aWxsIHJld3JpdGUg
aXQuCj4+IHYxLT52MjogRml4IHRoZSBidWlsZCBlcnJvciByZXBvcnRlZCBieSBrZXJuZWwtdGVz
dC4KPj4KPj4gTGl1IFNoaXhpbiAoMik6Cj4+ICAgcmlzY3Y6IEVuYWJsZSBIQVZFX0FSQ0hfSFVH
RV9WTUFQIGZvciA2NEJJVAo+PiAgIHJpc2N2OiBFbmFibGUgSEFWRV9BUkNIX0hVR0VfVk1BTExP
QyBmb3IgNjRCSVQKPj4KPj4gIC4uLi9mZWF0dXJlcy92bS9odWdlLXZtYXAvYXJjaC1zdXBwb3J0
LnR4dCAgICB8ICAyICstCj4+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZtYWxsb2MuaCAgICAg
ICAgICAgICAgfCAxOCArKysrCj4+ICBhcmNoL3Jpc2N2L21tL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCj4+ICBhcmNoL3Jpc2N2L21tL3BndGFibGUuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCA4MyArKysrKysrKysrKysrKysrKysrCj4+ICA1IGZpbGVzIGNoYW5nZWQs
IDEwNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9yaXNjdi9tbS9wZ3RhYmxlLmMKPj4KPiBJJ3ZlIHRha2VuIHRoaXMgc2VyaWVzIGZvciBh
IHNwaW4sIGFuZCB0ZXN0ZWQgaHVnZSBwdWQgcGFnZXMgdmlhCj4gaW9yZW1hcCgpLCBhbmQgaHVn
ZSBwbWQgcGFnZXMgdmlhIHZtYWxsb2NfaHVnZSgpIG9uIHFlbXUgZm9yIHN2MzksIHN2NDgsCj4g
YW5kIHN2NTcuCj4KPiBQYXRjaCAyIGhhdmUgYSBzcGVsbGluZyBlcnJvciBpbiB0aGUgY29tbWl0
IG1lc3NhZ2U6ICJlbmJhbGUiIHZzCj4gImVuYWJsZSIuCj4KPiBGaXggdXAgdGhlIHNwZWxsaW5n
IGVycm9yIGluIHBhdGNoIDIsIGFuZCBhZnRlciB0aGF0IGZlZWwgZnJlZSB0byBhZGQKPiBmb3Ig
dGhlIHdob2xlIHNlcmllczoKPgo+IFJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPgo+IFRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4K
PgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3IGFuZCB0ZXN0LiBJIHdpbGwgZml4IHRoZSBhYm92ZSBl
cnJvcnMgaW1tZWRpYXRlbHkuCj4gTmljZSB3b3JrIQo+IEJqw7Zybgo+Cj4gLgo+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
