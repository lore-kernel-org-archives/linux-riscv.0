Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D27C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 16:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=71uLwaFwgVkS6IaiW/dXWaJgl7ny6KRiJZyST83oz44=; b=mOagcDmR7Ca5Gg
	s8D7zz+jhYgl9IMBFU3D6bMxd4kmlrAiQ4xfsa1JRexi3F5rv894ljZdSxLJ4Fh/MYSxTbew/WkoF
	Hy91HV9MCTcTW+8uECXSxjlqtRigRvOmlehx8fvnWeLFlHzauL8Q0aQm89yg9qJ8QZeo9pBujuL5q
	4q1MUBOYauVKWt2Q5sklngs1T++FfY8fU+kqFa83Yx5VR0pb9h1dn2PmnKganwp2WhHEtRUObi0/0
	ThAxVQ38J8MdAbLt6MHJYEkfyb/oTAyIf4s1p5K0Nmhv5y24pU1DtOa+/URt27r+S9wUpfigE2vOv
	XlG/MAdw3e+S6EnPUGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pJz-00000001Ae9-0imD;
	Mon, 07 Apr 2025 16:27:39 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lt3-00000000LaL-0wMw
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 12:47:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2996543160;
	Mon,  7 Apr 2025 12:47:31 +0000 (UTC)
Message-ID: <4b2a6bf1-3642-431b-bb74-3aeae79d17d3@ghiti.fr>
Date: Mon, 7 Apr 2025 14:47:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISC-V: Kconfig: Fix help text of CMDLINE_EXTEND
Content-Language: en-US
To: Yeking@Red54.com, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Kossifidis <mick@ics.forth.gr>, Debbie Maliotaki
 <dmaliotaki@gmail.com>, linux-kernel@vger.kernel.org
References: <tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <tencent_A93C7FB46BFD20054AD2FEF4645913FF550A@qq.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuieegveegudffiedvveejhfejiefhgefhkeejtdeufedufeehhfeufeduleehieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepjggvkhhinhhgseftvgguheegrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehpr
 ghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhitghksehitghsrdhfohhrthhhrdhgrhdprhgtphhtthhopegumhgrlhhiohhtrghkihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_054737_408337_F0B48E96 
X-CRM114-Status: GOOD (  15.67  )
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

SGkgWElFIFpoaWJhbmcsCgpPbiAyOC8wMy8yMDI1IDExOjE0LCBZZWtpbmdAUmVkNTQuY29tIHdy
b3RlOgo+IEZyb206IOiwouiHtOmCpiAoWElFIFpoaWJhbmcpIDxZZWtpbmdAUmVkNTQuY29tPgo+
Cj4gSXQgaXMgdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZSBhcHBlbmRlZCB0byB0aGUgYm9vdGxv
YWRlciBjb21tYW5kIGxpbmUsCj4gbm90IHRoZSBib290bG9hZGVyIGNvbW1hbmQgbGluZSBhcHBl
bmRlZCB0byB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lLgo+Cj4gRml4ZXM6IDNhZWQ4YzQzMjY3
ZSAoIlJJU0MtVjogVXBkYXRlIEtjb25maWcgdG8gYmV0dGVyIGhhbmRsZSBDTURMSU5FIikKPiBT
aWduZWQtb2ZmLWJ5OiDosKLoh7TpgqYgKFhJRSBaaGliYW5nKSA8WWVraW5nQFJlZDU0LmNvbT4K
PiAtLS0KPiAgIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCA1NGVkMmE4Y2Q3YWYuLjRj
ZDE4ZDBkMDdiMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPiBAQCAtMTE0NCw4ICsxMTQ0LDggQEAgY29uZmlnIENNRExJTkVfRkFM
TEJBQ0sKPiAgIGNvbmZpZyBDTURMSU5FX0VYVEVORAo+ICAgCWJvb2wgIkV4dGVuZCBib290bG9h
ZGVyIGtlcm5lbCBhcmd1bWVudHMiCj4gICAJaGVscAo+IC0JICBUaGUgY29tbWFuZC1saW5lIGFy
Z3VtZW50cyBwcm92aWRlZCBkdXJpbmcgYm9vdCB3aWxsIGJlCj4gLQkgIGFwcGVuZGVkIHRvIHRo
ZSBidWlsdC1pbiBjb21tYW5kIGxpbmUuIFRoaXMgaXMgdXNlZnVsIGluCj4gKwkgIFRoZSBidWls
dC1pbiBjb21tYW5kIGxpbmUgd2lsbCBiZSBhcHBlbmRlZCB0byB0aGUgY29tbWFuZC0KPiArCSAg
bGluZSBhcmd1bWVudHMgcHJvdmlkZWQgZHVyaW5nIGJvb3QuIFRoaXMgaXMgdXNlZnVsIGluCj4g
ICAJICBjYXNlcyB3aGVyZSB0aGUgcHJvdmlkZWQgYXJndW1lbnRzIGFyZSBpbnN1ZmZpY2llbnQg
YW5kCj4gICAJICB5b3UgZG9uJ3Qgd2FudCB0byBvciBjYW5ub3QgbW9kaWZ5IHRoZW0uCj4gICAK
CgpJdCBzZWVtcyB0aGF0IHlvdSdyZSBjb3JyZWN0IAooaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjYuMTQtcmM2L3NvdXJjZS9kcml2ZXJzL29mL2ZkdC5jI0wxMDY1KS4KCkkgbm90
aWNlZCB0aGF0IGFsbCB0aGUgYXJjaGl0ZWN0dXJlcyB0aGF0IGRlZmluZSB0aGlzIGNvbmZpZyBo
YXZlIHRoZSAKc2FtZSB0ZXh0LCBzbyBJIGd1ZXNzIHRoZSBiZWhhdmlvciBjaGFuZ2VkIGF0IHNv
bWUgcG9pbnQuCgpJIHdvdWxkIHN1Z2dlc3QgdG8gZml4IGFsbCB0aGUgYXJjaGl0ZWN0dXJlcyBh
bmQgZmluZCB3aGljaCBjb21taXQgCmNoYW5nZWQgdGhpcyBiZWhhdmlvci4KClRoYW5rcywKCkFs
ZXgKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
