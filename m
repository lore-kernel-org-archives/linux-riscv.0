Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FECCECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 11:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPZVXM0OdIvAiTN1uyHVV7DE64A8ddHvldAIoVghW6E=; b=SU+nkSk/QZDLQd
	6vkq/vOi7/IiB2HCn1e1SIrvcaI38GXAhiE6YqvEP6P1SOpJLjp7SgUi55+9E4NAnG9jAp9KP4hh8
	Qt7ZzfijtlSqzdgypQ68dCVvp4sLDiD2OEInj3AHJqEYxrMwlxL1HNpf6qaPmwCJ6+nUvKEnwBleI
	vgNLmaAfg0JU7245BFYOGDSs0Oznq7C7M9vR2ZCG6hgiECRyGP0VoX7Bjl23tiTSpGf4gMMmlNrBl
	CW0Yp7zL+gDYM/gAnsvsrokg2V1sYtocO6TSYEbb47YpQrqlDlytPcLphS+a2MM/iXsa3zYtqX0WK
	WCGRQJKnpXmbw99WBsdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaFOx-00BcKf-8x; Mon, 19 Sep 2022 11:57:27 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaFOs-00BcII-U4
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 11:57:25 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWNPy1MKdzpT0J;
	Mon, 19 Sep 2022 19:54:30 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 19:57:16 +0800
Message-ID: <3ddf7351-b39f-daa7-e46d-bc6db6284f5d@huawei.com>
Date: Mon, 19 Sep 2022 19:57:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAtbmV4dF0gcmlzY3Y6IGVycmF0YTogZml4IOKAmHJp?=
 =?UTF-8?Q?scv=5fcbom=5fblock=5fsize=e2=80=99_variable_undeclared?=
To: Conor Dooley <mail@conchuod.ie>
CC: <liwei391@huawei.com>, <sfr@canb.auug.org.au>,
	<linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>
References: <20220919094426.860040-1-zengheng4@huawei.com>
 <9D6D4DE8-084C-48AC-8103-0C86FD000DD1@conchuod.ie>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <9D6D4DE8-084C-48AC-8103-0C86FD000DD1@conchuod.ie>
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_045723_187678_1B518BFF 
X-CRM114-Status: GOOD (  10.41  )
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

T29wcywgZ290IGl0LiBJIHdvdWxkIHRha2UgYSBsb29rIGluIHJpc2N2L2xpbnV4LmdpdCB3aGVu
IHRoZSBwYXRjaCAKY29uY2VybnMgYWJvdXQgcmlzY3YgYXJjaCBhZnRlcndhcmRzLgoKU28ganVz
dCBwYXNzIHRoZSBwYXRjaC4KCgrlnKggMjAyMi85LzE5IDE3OjQ1LCBDb25vciBEb29sZXkg5YaZ
6YGTOgo+Cj4gT24gMTkgU2VwdGVtYmVyIDIwMjIgMTA6NDQ6MjUgSVNULCBaZW5nIEhlbmcgPHpl
bmdoZW5nNEBodWF3ZWkuY29tPiB3cm90ZToKPj4gYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJy
YXRhLmM6IEluIGZ1bmN0aW9uIOKAmGVycmF0YV9wcm9iZV9jbW/igJk6Cj4+IGFyY2gvcmlzY3Yv
ZXJyYXRhL3RoZWFkL2VycmF0YS5jOjQwOjI6IGVycm9yOiDigJhyaXNjdl9jYm9tX2Jsb2NrX3Np
emXigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1l
YW4g4oCYcmlzY3ZfaW5pdF9jYm9tX2Jsb2Nrc2l6ZeKAmT8KPj4gICAgNDAgfCAgcmlzY3ZfY2Jv
bV9ibG9ja19zaXplID0gTDFfQ0FDSEVfQllURVM7Cj4+ICAgICAgIHwgIF5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+PiAgICAgICB8ICByaXNjdl9pbml0X2Nib21fYmxvY2tzaXplCj4+Cj4+ICdyaXNj
dl9jYm9tX2Jsb2NrX3NpemUnIHZhcmlhYmxlIHNob3VsZCBiZSBkZWNsYXJlZAo+PiB3aXRob3V0
IHRoZSBsaW1pdGF0aW9uIHdoZXRoZXIgQ09ORklHX1JJU0NWX0lTQV9aSUNCT00KPj4gaXMgZW5h
YmxlZCBvciBub3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFplbmcgSGVuZyA8emVuZ2hlbmc0QGh1
YXdlaS5jb20+Cj4gVGhpcyBzaG91bGQgYWxyZWFkeSBiZSBmaXhlZCBpbiBuZXh0LCBubz8KPgo+
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jpc2N2L2xp
bnV4LmdpdC9jb21taXQvP2g9Zml4ZXMKPgo+PiAtLS0KPj4gYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9jYWNoZWZsdXNoLmggfCAyICstCj4+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
YWNoZWZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+PiBpbmRl
eCBhODljMDA1YjRiYmYuLjdlYzYwMGE3MTYzNCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
YWNoZWZsdXNoLmgKPj4gQEAgLTQyLDggKzQyLDggQEAgdm9pZCBmbHVzaF9pY2FjaGVfbW0oc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sIGJvb2wgbG9jYWwpOwo+Pgo+PiAjZW5kaWYgLyogQ09ORklHX1NN
UCAqLwo+Pgo+PiAtI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfWklDQk9NCj4+IGV4dGVybiB1bnNp
Z25lZCBpbnQgcmlzY3ZfY2JvbV9ibG9ja19zaXplOwo+PiArI2lmZGVmIENPTkZJR19SSVNDVl9J
U0FfWklDQk9NCj4+IHZvaWQgcmlzY3ZfaW5pdF9jYm9tX2Jsb2Nrc2l6ZSh2b2lkKTsKPj4gI2Vs
c2UKPj4gc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X2luaXRfY2JvbV9ibG9ja3NpemUodm9pZCkg
eyB9Cj4+IC0tIAo+PiAyLjI1LjEKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
