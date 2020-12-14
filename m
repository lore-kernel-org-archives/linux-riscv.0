Return-Path: <SRS0=dKKk=FS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870E6C4361B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 11:53:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B8422CB9
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Dec 2020 11:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B8422CB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0nCiYnYcpH4y3UuMK6PFr9bGc43HQgOWwTDwPTdefNs=; b=Y6IJDC4H/xpSKLbZCrH+C8vln
	moLaS96I+xqYnGXF+XbJVD0MZoP4L66oqozQ+q/KBonIzNFjafflbeC8qkKyaDwu1D7AwjaUkHAQA
	cLE3MFkqJmBi9/S026XhjCuObknz1aMqk58FJzd0gNOSqmdBkc8IAYWXrcW0juc8BThBFJ6MrMoUU
	ITcvAFTjuQTgXxm/xlidAja2p28DhfQfGD2vaV1BdCQiGx/bhGekCoSyPkt5H8DcMBVGASe22dpKw
	fOLTvqRPLiN02kW7uzD8s4rmPmbT5jw1OiLsiQ6/9xMupS3uma9pppjHhWFiWTmLvv2lxmiaa7D8w
	yg5fKg89g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1komQB-0004h9-62; Mon, 14 Dec 2020 11:53:43 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1komQ9-0004gQ-7b
 for linux-riscv@lists.infradead.org; Mon, 14 Dec 2020 11:53:42 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CvfsY4ZjMzhsrR;
 Mon, 14 Dec 2020 19:53:05 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 14 Dec 2020 19:53:30 +0800
Subject: Re: [PATCH] riscv: Cleanup sbi function stubs when RISCV_SBI disabled
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmerdabbelt@google.com>
References: <20201126024038.180680-1-wangkefeng.wang@huawei.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <9aaa0069-12d9-b062-2e7d-95847ee2283c@huawei.com>
Date: Mon, 14 Dec 2020 19:53:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20201126024038.180680-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_065341_512845_5C8104E0 
X-CRM114-Status: GOOD (  17.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

SGkgYWxsLMKgIGFueSBjb21tZW50cy4uLgoKT24gMjAyMC8xMS8yNiAxMDo0MCwgS2VmZW5nIFdh
bmcgd3JvdGU6Cj4gRml4IHNiaV9pbml0KCkgZnVuY3Rpb24gZGVjbGFyYXRpb24gbWlzbWF0Y2gg
YmV0d2VlbiBSSVNDVl9TQkkKPiBlbmFibGUgYW5kIGRpc2FibGUsIGFzIGl0IGFsd2F5cyByZXR1
cm5lZCAwLCBtYWtlIGl0IHZvaWQgZnVuY3Rpb24uCj4KPiBEcm9wIHNvbWUgc3R1YnMgd2hpY2gg
d29uJ3QgYmUgdXNlZCBpZiBSSVNDVl9TQkkgZGlzYWJsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBL
ZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwgMTAgKysrLS0tLS0tLQo+ICAgYXJjaC9yaXNjdi9rZXJu
ZWwvc2JpLmMgICAgICB8ICA0ICstLS0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAg
fCAgMiAtLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gaW5kZXggNjUzZWRiMjVkNDk1Li45OWRjNzdiYThl
NDMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPiBAQCAtODksNyArODksNyBAQCBzdHJ1Y3Qgc2Jp
cmV0IHsKPiAgIAlsb25nIHZhbHVlOwo+ICAgfTsKPiAgIAo+IC1pbnQgc2JpX2luaXQodm9pZCk7
Cj4gK3ZvaWQgc2JpX2luaXQodm9pZCk7Cj4gICBzdHJ1Y3Qgc2JpcmV0IHNiaV9lY2FsbChpbnQg
ZXh0LCBpbnQgZmlkLCB1bnNpZ25lZCBsb25nIGFyZzAsCj4gICAJCQl1bnNpZ25lZCBsb25nIGFy
ZzEsIHVuc2lnbmVkIGxvbmcgYXJnMiwKPiAgIAkJCXVuc2lnbmVkIGxvbmcgYXJnMywgdW5zaWdu
ZWQgbG9uZyBhcmc0LAo+IEBAIC0xNDcsMTEgKzE0Nyw3IEBAIHN0YXRpYyBpbmxpbmUgdW5zaWdu
ZWQgbG9uZyBzYmlfbWlub3JfdmVyc2lvbih2b2lkKQo+ICAgCj4gICBpbnQgc2JpX2Vycl9tYXBf
bGludXhfZXJybm8oaW50IGVycik7Cj4gICAjZWxzZSAvKiBDT05GSUdfUklTQ1ZfU0JJICovCj4g
LS8qIHN0dWJzIGZvciBjb2RlIHRoYXQgaXMgb25seSByZWFjaGFibGUgdW5kZXIgSVNfRU5BQkxF
RChDT05GSUdfUklTQ1ZfU0JJKTogKi8KPiAtdm9pZCBzYmlfc2V0X3RpbWVyKHVpbnQ2NF90IHN0
aW1lX3ZhbHVlKTsKPiAtdm9pZCBzYmlfY2xlYXJfaXBpKHZvaWQpOwo+IC12b2lkIHNiaV9zZW5k
X2lwaShjb25zdCB1bnNpZ25lZCBsb25nICpoYXJ0X21hc2spOwo+IC12b2lkIHNiaV9yZW1vdGVf
ZmVuY2VfaShjb25zdCB1bnNpZ25lZCBsb25nICpoYXJ0X21hc2spOwo+IC12b2lkIHNiaV9pbml0
KHZvaWQpOwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2JpX3JlbW90ZV9mZW5jZV9pKGNvbnN0IHVu
c2lnbmVkIGxvbmcgKmhhcnRfbWFzaykge30KPiArc3RhdGljIGlubGluZSB2b2lkIHNiaV9pbml0
KHZvaWQpIHt9Cj4gICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX1NCSSAqLwo+ICAgI2VuZGlmIC8q
IF9BU01fUklTQ1ZfU0JJX0ggKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+IGluZGV4IDIyNmNjY2UwZjllMC4uYmFlNmZm
ZGM2ZTdiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc2JpLmMKPiBAQCAtNTYwLDcgKzU2MCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
cmlzY3ZfaXBpX29wcyBzYmlfaXBpX29wcyA9IHsKPiAgIAkuaXBpX2luamVjdCA9IHNiaV9zZW5k
X2NwdW1hc2tfaXBpCj4gICB9Owo+ICAgCj4gLWludCBfX2luaXQgc2JpX2luaXQodm9pZCkKPiAr
dm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkKPiAgIHsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gQEAg
LTYwMCw2ICs2MDAsNCBAQCBpbnQgX19pbml0IHNiaV9pbml0KHZvaWQpCj4gICAJfQo+ICAgCj4g
ICAJcmlzY3Zfc2V0X2lwaV9vcHMoJnNiaV9pcGlfb3BzKTsKPiAtCj4gLQlyZXR1cm4gMDsKPiAg
IH0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3NldHVwLmMKPiBpbmRleCA5MDFhYzBjNjgwZGQuLmVmNGY1YzA3NmQ2MSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvc2V0dXAuYwo+IEBAIC0xMDQsOSArMTA0LDcgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChj
aGFyICoqY21kbGluZV9wKQo+ICAgCWthc2FuX2luaXQoKTsKPiAgICNlbmRpZgo+ICAgCj4gLSNp
ZiBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9TQkkpCj4gICAJc2JpX2luaXQoKTsKPiAtI2VuZGlm
Cj4gICAKPiAgICNpZmRlZiBDT05GSUdfU01QCj4gICAJc2V0dXBfc21wKCk7CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
