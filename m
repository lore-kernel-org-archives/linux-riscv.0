Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA5FC021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMCcidlfO0hlszqoWMe9eNU1ZRHnTS6gvX+1UlD0KWY=; b=r8K6ppq1udRaKd
	qMm5o+imxur4+zN+dHJahxbuFiM1dnc1k7hDFNNVtk/V/rheJYs1/N1CrPcjkXDfMacw4NV8OXyda
	e3fGfQeLr/ZO2UIrWub1KlSP3oxTZXmE03fJLz3VN4Ktw39kjFQCP15+oVz5Ddjx5w6KWVBKv1+nx
	iz/JMOnCcZ3xcpz3jiCK0S/2+hYcfL0pf1zFuxOczOMp4PqzlkXe26tP/9tZjfJsm3v++F9l24bco
	cPwbUEW0N/sHk+qu3t7tZPqoJBiAp2Gi3msj6NpMUA0ohNfqtjBJ9DSS0giI3bXg62sERXHMJS5TC
	tGTrdFLPx2L/mJB/lrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDxg-000000038mT-1d5J;
	Wed, 26 Feb 2025 09:44:16 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDxe-000000038ln-0JR9
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 09:44:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13FAE44118;
	Wed, 26 Feb 2025 09:44:08 +0000 (UTC)
Message-ID: <714de417-e354-4157-84fe-22ecd9c5e4c9@ghiti.fr>
Date: Wed, 26 Feb 2025 10:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: Move vendor errata definitions into
 vendorid_list.h
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>
Cc: conor@kernel.org, alexghiti@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, bjorn@rivosinc.com,
 leobras@redhat.com, corbet@lwn.net, peterlin@andestech.com,
 Guo Ren <guoren@linux.alibaba.com>
References: <20241214143039.4139398-1-guoren@kernel.org>
 <20241214143039.4139398-2-guoren@kernel.org> <Z4q9MDsywT5MrlEa@ghost>
 <CAJF2gTQzvPey8pqsnZ+A2xvNFmb054wdp3+cgnq_p=eq+REBbg@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAJF2gTQzvPey8pqsnZ+A2xvNFmb054wdp3+cgnq_p=eq+REBbg@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgedvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemrgektddumeegfhegfeemgeekudeimeeisggtfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepghhuohhrvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrl
 hgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_014414_253012_6F87F034 
X-CRM114-Status: UNSURE (   7.76  )
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

SGkgR3VvLAoKT24gMTgvMDEvMjAyNSAwNDo0NiwgR3VvIFJlbiB3cm90ZToKPiBPbiBTYXQsIEph
biAxOCwgMjAyNSBhdCA0OjI34oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4+IE9uIFNhdCwgRGVjIDE0LCAyMDI0IGF0IDA5OjMwOjM4QU0gLTA1MDAs
IGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+Pj4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4
LmFsaWJhYmEuY29tPgo+Pj4KPj4+IE1vdmUgdmVuZG9yIGVycmF0YSBkZWZpbml0aW9ucyBpbnRv
IHZlbmRvcmlkX2xpc3QgYW5kIG1ha2UgaXQgcmUtdXNlYWJsZQo+Pj4gZm9yIG90aGVyIGhlYWRl
ciBmaWxlcy4KPj4gV2h5IGNhbid0IGVycmF0YV9saXN0LmggYmUgaW5jbHVkZWQgd2hlcmV2ZXIg
dGhlIGVycmF0YSBkZWZpbml0aW9ucyBhcmUKPj4gbmVlZGVkPwo+IGVycmF0YV9saXN0LmggY2Fu
J3QgYmUgaW5jbHVkZWQgaW4gcndvbmNlLmguCgoKdmVuZG9yaWRfbGlzdC5oIGRvZXMgbm90IHNl
ZW0gYXBwcm9wcmlhdGUsIEkgdGhpbmsgdGhlIGJlc3Qgc29sdXRpb24gCndvdWxkIGJlIHRvIGZp
eCB0aGUgaGVhZGVyIGlzc3VlIGFuZCBpZiBub3Qgc2ltcGx5IHBvc3NpYmxlLCBpbnRyb2R1Y2Ug
YSAKbmV3IGhlYWRlci4KClRoYW5rcywKCkFsZXgKCgo+Cj4+IC0gQ2hhcmxpZQo+Pgo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
