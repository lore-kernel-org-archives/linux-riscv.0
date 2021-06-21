Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78091C48BDF
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 02:58:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 343616113E
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 02:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 343616113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HBaTNolb/5TpQdZFiG3432QV8Rh6WBwmMYpryAk9wdw=; b=t6sKxVJbsJpJOLXslryapLLU39
	vNK9rI8D/tkcbxO6ASyTHXD+8ehbcdlryIBlA95XHvgK6oCSDn9b48UbXyOMHXQhpyPxE9maKMCN+
	pd3lLZi7SdmXxuQj2MfngotPK1UhA6BL5HqcT/++bCvD1kNiw0LfRvRQaIVBeWs4LpXEbBLxvM4sb
	ZvdPaXmdwc9Sk0XZ7iuLqdymRzyNLsUqXR8f7qK9IsrrN8r13I9OYOzhLRETDxWhOSAxNqE9ulRTw
	z9eSW7c7BY/Dryx1mrqsgzpGpSNWUpVgIz8RiQdiDnqwZT2lTE/vkdAc2Dqv50VdUxGqe5lpYB+Fu
	cVX88kcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvA8E-001uzi-1I; Mon, 21 Jun 2021 02:57:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvA8A-001uyJ-N9
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 02:57:48 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G7Yyp5jN0z72H7;
 Mon, 21 Jun 2021 10:54:26 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 21 Jun 2021 10:57:40 +0800
Received: from [10.174.177.134] (10.174.177.134) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 21 Jun 2021 10:57:39 +0800
Subject: Re: [PATCH] riscv: stacktrace: Fix NULL pointer dereference
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210619001332.2c0c9a05@xhacker>
From: Chen Huang <chenhuang5@huawei.com>
Message-ID: <237c3d40-17ad-1e69-a66c-b94af92dd075@huawei.com>
Date: Mon, 21 Jun 2021 10:57:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210619001332.2c0c9a05@xhacker>
X-Originating-IP: [10.174.177.134]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema756-chm.china.huawei.com (10.1.198.198)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_195747_131292_833E015A 
X-CRM114-Status: GOOD (  18.02  )
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
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrU2iAyMDIxLzYvMTkgMDoxMywgSmlzaGVuZyBaaGFuZyDQtLXAOgo+IEZyb206IEppc2hlbmcg
WmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAKPiBXaGVuIENPTkZJR19GUkFNRV9QT0lOVEVS
PXksIGNhbGxpbmcgZHVtcF9zdGFjaygpIGNhbiBhbHdheXMgdHJpZ2dlcgo+IE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZSBwYW5pYyBzaW1pbGFyIGFzIGJlbG93Ogo+IAo+IFsgICAgMC4zOTYwNjBd
IENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDUuMTMuMC1yYzUrICM0
Nwo+IFsgICAgMC4zOTY2OTJdIEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkK
PiBbICAgIDAuMzk3MTc2XSBDYWxsIFRyYWNlOgo+IFsgICAgMC4zOTgxOTFdIFVuYWJsZSB0byBo
YW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3Mg
MDAwMDAwMDAwMDAwMDk2MAo+IFsgICAgMC4zOTk0ODddIE9vcHMgWyMxXQo+IFsgICAgMC4zOTk3
MzldIE1vZHVsZXMgbGlua2VkIGluOgo+IFsgICAgMC40MDAxMzVdIENQVTogMCBQSUQ6IDEgQ29t
bTogc3dhcHBlci8wIE5vdCB0YWludGVkIDUuMTMuMC1yYzUrICM0Nwo+IFsgICAgMC40MDA1NzBd
IEhhcmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiBbICAgIDAuNDAwOTI2XSBl
cGMgOiB3YWxrX3N0YWNrZnJhbWUrMHhjNC8weGRjCj4gWyAgICAwLjQwMTI5MV0gIHJhIDogZHVt
cF9iYWNrdHJhY2UrMHgzMC8weDM4Cj4gWyAgICAwLjQwMTYzMF0gZXBjIDogZmZmZmZmZmY4MDAw
NDkyMiByYSA6IGZmZmZmZmZmODAwMDQ5NmEgc3AgOiBmZmZmZmZlMDAwZjNiZDAwCj4gWyAgICAw
LjQwMjExNV0gIGdwIDogZmZmZmZmZmY4MGNmZGNiOCB0cCA6IGZmZmZmZmUwMDBmMzAwMDAgdDAg
OiBmZmZmZmZmZjgwZDBiMGNmCj4gWyAgICAwLjQwMjYwMl0gIHQxIDogZmZmZmZmZmY4MGQwYjBj
MCB0MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOiBmZmZmZmZlMDAwZjNiZDYwCj4gWyAgICAwLjQw
MzA3MV0gIHMxIDogZmZmZmZmZmY4MDhiYzJlOCBhMCA6IDAwMDAwMDAwMDAwMDEwMDAgYTEgOiAw
MDAwMDAwMDAwMDAwMDAwCj4gWyAgICAwLjQwMzQ0OF0gIGEyIDogZmZmZmZmZmY4MDNkNzA4OCBh
MyA6IGZmZmZmZmZmODA4YmMyZTggYTQgOiA2MTMxNzI1ZGJjMjRkNDAwCj4gWyAgICAwLjQwMzgy
MF0gIGE1IDogMDAwMDAwMDAwMDAwMTAwMCBhNiA6IDAwMDAwMDAwMDAwMDAwMDIgYTcgOiBmZmZm
ZmZmZmZmZmZmZmZmCj4gWyAgICAwLjQwNDIyNl0gIHMyIDogMDAwMDAwMDAwMDAwMDAwMCBzMyA6
IDAwMDAwMDAwMDAwMDAwMDAgczQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgICAwLjQwNDYzNF0g
IHM1IDogZmZmZmZmZmY4MDNkNzA4OCBzNiA6IGZmZmZmZmZmODA4YmMyZTggczcgOiBmZmZmZmZm
ZjgwNjMwNjUwCj4gWyAgICAwLjQwNTA4NV0gIHM4IDogZmZmZmZmZmY4MDkxMmE4MCBzOSA6IDAw
MDAwMDAwMDAwMDAwMDggczEwOiBmZmZmZmZmZjgwNDAwMGZjCj4gWyAgICAwLjQwNTM4OF0gIHMx
MTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IDAwMDAwMDAwMDAwMDAwNDMgdDQgOiBmZmZmZmZmZmZm
ZmZmZmZmCj4gWyAgICAwLjQwNTYxNl0gIHQ1IDogMDAwMDAwMDAwMDAwMDAzZCB0NiA6IGZmZmZm
ZmUwMDBmM2JhYTgKPiBbICAgIDAuNDA1NzkzXSBzdGF0dXM6IDAwMDAwMDAwMDAwMDAxMDAgYmFk
YWRkcjogMDAwMDAwMDAwMDAwMDk2MCBjYXVzZTogMDAwMDAwMDAwMDAwMDAwZAo+IFsgICAgMC40
MDYxMzVdIFs8ZmZmZmZmZmY4MDAwNDkyMj5dIHdhbGtfc3RhY2tmcmFtZSsweGM0LzB4ZGMKPiBb
ICAgIDAuNDA3MDMyXSBbPGZmZmZmZmZmODAwMDQ5NmE+XSBkdW1wX2JhY2t0cmFjZSsweDMwLzB4
MzgKPiBbICAgIDAuNDA3Nzk3XSBbPGZmZmZmZmZmODAzZDcxMDA+XSBzaG93X3N0YWNrKzB4NDAv
MHg0Ywo+IFsgICAgMC40MDgyMzRdIFs8ZmZmZmZmZmY4MDNkOWU1Yz5dIGR1bXBfc3RhY2srMHg5
MC8weGI2Cj4gWyAgICAwLjQwOTAxOV0gWzxmZmZmZmZmZjgwNDA0MjNlPl0gcHRkdW1wX2luaXQr
MHgyMC8weGM0Cj4gWyAgICAwLjQwOTY4MV0gWzxmZmZmZmZmZjgwMDAxNWI2Pl0gZG9fb25lX2lu
aXRjYWxsKzB4NGMvMHgyMjYKPiBbICAgIDAuNDEwMTEwXSBbPGZmZmZmZmZmODA0MDEwOTQ+XSBr
ZXJuZWxfaW5pdF9mcmVlYWJsZSsweDFmNC8weDI1OAo+IFsgICAgMC40MTA1NjJdIFs8ZmZmZmZm
ZmY4MDNkYmE4OD5dIGtlcm5lbF9pbml0KzB4MjIvMHgxNDgKPiBbICAgIDAuNDEwOTU5XSBbPGZm
ZmZmZmZmODAwMDI5ZTI+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4MTQKPiBbICAgIDAuNDEy
MjQxXSAtLS1bIGVuZCB0cmFjZSBiMmFiOTJjOTAxYjk2MjUxIF0tLS0KPiBbICAgIDAuNDEzMDk5
XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwgaW5pdCEgZXhp
dGNvZGU9MHgwMDAwMDAwYgo+IAo+IFRoZSByZWFzb24gaXMgdGhlIHRhc2sgaXMgTlVMTCB3aGVu
IHdlIGZpbmFsbHkgY2FsbCB3YWxrX3N0YWNrZnJhbWUoKQo+IHRoZSBOVUxMIGlzIHBhc3NlZCBm
cm9tIF9fZHVtcF9zdGFjaygpOgo+IAo+IHxzdGF0aWMgdm9pZCBfX2R1bXBfc3RhY2sodm9pZCkK
PiB8ewo+IHwgICAgICAgIGR1bXBfc3RhY2tfcHJpbnRfaW5mbyhLRVJOX0RFRkFVTFQpOwo+IHwg
ICAgICAgIHNob3dfc3RhY2soTlVMTCwgTlVMTCwgS0VSTl9ERUZBVUxUKTsKPiB8fQo+IAo+IEZp
eCB0aGlzIGlzc3VlIGJ5IGNoZWNraW5nICJ0YXNrID09IE5VTEwiIGNhc2UgaW4gd2Fsa19zdGFj
a2ZyYW1lKCkuCj4gCj4gRml4ZXM6IGVhYzJmMzA1OWUwMiAoInJpc2N2OiBzdGFja3RyYWNlOiBm
aXggdGhlIHJpc2N2IHN0YWNrdHJhY2Ugd2hlbiBDT05GSUdfRlJBTUVfUE9JTlRFUiBlbmFibGVk
Igo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAt
LS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFj
ZS5jCj4gaW5kZXggYmRlODVmYzUzMzU3Li43YmM4YWY3NTkzM2EgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3Rh
Y2t0cmFjZS5jCj4gQEAgLTI3LDcgKzI3LDcgQEAgdm9pZCBub3RyYWNlIHdhbGtfc3RhY2tmcmFt
ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ssIHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICAJCWZw
ID0gZnJhbWVfcG9pbnRlcihyZWdzKTsKPiAgCQlzcCA9IHVzZXJfc3RhY2tfcG9pbnRlcihyZWdz
KTsKPiAgCQlwYyA9IGluc3RydWN0aW9uX3BvaW50ZXIocmVncyk7Cj4gLQl9IGVsc2UgaWYgKHRh
c2sgPT0gY3VycmVudCkgewo+ICsJfSBlbHNlIGlmICh0YXNrID09IE5VTEwgfHwgdGFzayA9PSBj
dXJyZW50KSB7Cj4gIAkJZnAgPSAodW5zaWduZWQgbG9uZylfX2J1aWx0aW5fZnJhbWVfYWRkcmVz
cygxKTsKPiAgCQlzcCA9ICh1bnNpZ25lZCBsb25nKV9fYnVpbHRpbl9mcmFtZV9hZGRyZXNzKDAp
Owo+ICAJCXBjID0gKHVuc2lnbmVkIGxvbmcpX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApOwo+
IAoKSSdtIHNvcnJ5IEkgbWFkZSBhIG1pc3Rha2UgZm9yIGNvbmZ1c2luZyB0aGUgZnVuY3Rpb24g
cHJfY29udCdzIHN0YWNrIHdpdGggdGhlIHN0YWNrIHdoZW4gdGFzawppcyBOVUxMLiBBbnl3YXks
IEkgdGVzdGVkIHRoZSBwYXRjaCBhbmQgaXQgbG9va3MgZ29vZC4KClJldmlld2VkLWJ5OiBDaGVu
IEh1YW5nIDxjaGVuaHVhbmc1QGh1YXdlaS5jb20+CgpUaGFua3MuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
