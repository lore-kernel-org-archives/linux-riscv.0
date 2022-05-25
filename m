Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A012C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 01:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7RNsYRF/Kgv4ufKGy8e8fp2RI7UlJAUnEsx6XrfMrs=; b=HbgCcqOVpROkfK
	g13arhvkL0Kmt9JyLQIUKhCMAqdHYTNZqRzhW5mR6fDClPCVlDC+TQVxCfZoIXnbHwYFty0YsIJJO
	7Y1Oba/GorzxTnxoSEzaaASjCRSlvjvsmeh+1THDUaYEW763kAN/HfXpmzsXrtgtr5A//Z0my1dSj
	Xpd5TDh2eYQMSjVm+wPtfMm94Gu+s0/kM333AmwxdiIQCUbXwp6gj44zdWeEblWGujQzKB7k/NceV
	fk+04zmX4pR6NNSOsZaSW0gJ2Uvs3oaQjraf15Mo87kUQ7HWowaWkOy7u8kEQFQyNk746h0U+bJ1X
	mtCKdUR7JkcXuNUKy/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntflb-009aWM-Mv; Wed, 25 May 2022 01:24:51 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntflW-009aUb-GJ
 for linux-riscv@lists.infradead.org; Wed, 25 May 2022 01:24:48 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L7Cvg4y4WzQkDn;
 Wed, 25 May 2022 09:21:35 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 25 May 2022 09:24:35 +0800
Message-ID: <6c692ace-9902-e11f-21c2-ef464be4d3c6@huawei.com>
Date: Wed, 25 May 2022 09:24:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] riscv/kprobe: reclaim insn_slot on kprobe unregistration
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
 <mhiramat@kernel.org>, <rostedt@goodmis.org>, <peterz@infradead.org>,
 <naveen.n.rao@linux.vnet.ibm.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20220523015124.98743-1-liaochang1@huawei.com>
 <Yoz16RUZvfyxmywT@xhacker>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <Yoz16RUZvfyxmywT@xhacker>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_182446_759257_6976305A 
X-CRM114-Status: GOOD (  10.95  )
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

CgrlnKggMjAyMi81LzI0IDIzOjEyLCBKaXNoZW5nIFpoYW5nIOWGmemBkzoKPiBPbiBNb24sIE1h
eSAyMywgMjAyMiBhdCAwOTo1MToyNEFNICswODAwLCBMaWFvIENoYW5nIHdyb3RlOgo+PiBPbiBr
cHJvYmUgcmVnaXN0cmF0aW9uIGtlcm5lbCBhbGxvY2F0ZSBvbmUgaW5zbl9zbG90IGZvciBuZXcg
a3Byb2JlLAo+PiBidXQgaXQgZm9yZ2V0IHRvIHJlY2xhaW0gdGhlIGluc25fc2xvdCBvbiB1bnJl
Z2lzdHJhdGlvbiwgbGVhZGluZyB0byBhCj4+IHBvdGVudGlhbCBsZWFrYWdlLgo+IAo+ICsgR3Vv
IFJlbgo+IAo+IE5pY2UgY2F0Y2ghIEkgdGhpbmsgY3NreSBuZWVkcyB0aGUgZml4IGFzIHdlbGwu
Cj4gCj4+Cj4+IFRoaXMgYnVnIHJlcG9ydGVkIGJ5IENoZW4gR3Vva2FpIDxjaGVuZ3Vva2FpMTdA
bWFpbHMudWNhcy5hYy5jbj4uCj4gCj4gVGhpcyBuZWVkcyBhICJSZXBvcnRlZC1ieTogLi4uIiB0
YWcKClRoYW5rcyBmb3IgY29tbWVudC4KCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExpYW8gQ2hh
bmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9w
cm9iZXMva3Byb2Jlcy5jIHwgNCArKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+PiBpbmRleCBlNmU5NTBiN2Nm
MzIuLmYxMmViMWZiYjUyYyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L2twcm9iZXMuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4+
IEBAIC0xMTAsNiArMTEwLDEwIEBAIHZvaWQgX19rcHJvYmVzIGFyY2hfZGlzYXJtX2twcm9iZShz
dHJ1Y3Qga3Byb2JlICpwKQo+PiAgCj4+ICB2b2lkIF9fa3Byb2JlcyBhcmNoX3JlbW92ZV9rcHJv
YmUoc3RydWN0IGtwcm9iZSAqcCkKPj4gIHsKPj4gKwlpZiAocC0+YWluc24uYXBpLmluc24pIHsK
Pj4gKwkJZnJlZV9pbnNuX3Nsb3QocC0+YWluc24uYXBpLmluc24sIDApOwo+PiArCQlwLT5haW5z
bi5hcGkuaW5zbiA9IE5VTEw7Cj4+ICsJfQo+PiAgfQo+PiAgCj4+ICBzdGF0aWMgdm9pZCBfX2tw
cm9iZXMgc2F2ZV9wcmV2aW91c19rcHJvYmUoc3RydWN0IGtwcm9iZV9jdGxibGsgKmtjYikKPj4g
LS0gCj4+IDIuMTcuMQo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gLgoKLS0gCkJSLApMaWFvLCBDaGFuZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
