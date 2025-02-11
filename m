Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D04C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 07:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZ8Sjc0c+UBo7UVo9CQc+sHWmepC25RT4bkS7tGxr3Q=; b=R9h9Xgb5NKz3R7
	UveB2dSRlwmLul3BQylmNqitYz2wgPUqmqyKql6XO1Aod5bv+T/omlWTD6hiBLbcqzdRhhzSKRibD
	X0LIbvDbrpGGgJvWkuH96/5DGMm5el62cNRgQE2ywirgpJQ/Jn0AjX0caH54QiaHUb62I0cUJcstu
	SXlvDpwgbn5Mf1IDW2vZJIGTostKIO4kG8VNOzUFBYINmY5N2qoRVhxFRAIm9niB8ulUia8SgZ3FD
	PP8R8KNxwNzKNLrE6WC20EbTo72mbzSMHYdcduSrvR33vCy/Z38601zZeQKHXk7S76MT5oi4x+Z5a
	5RT2KojmoZSuLKocAepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thkvJ-00000002riK-0hwg;
	Tue, 11 Feb 2025 07:43:13 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thkts-00000002rT9-3t2U
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 07:41:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53F0044388;
	Tue, 11 Feb 2025 07:41:39 +0000 (UTC)
Message-ID: <968ff88f-ae77-43b4-a5b4-1a4b0bf61098@ghiti.fr>
Date: Tue, 11 Feb 2025 08:41:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: cpufeature: use bitmap_equal() instead of memcmp()
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250210155615.1545738-1-cleger@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250210155615.1545738-1-cleger@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepueeigeevgeduffeivdevjefhjeeihfeghfekjedtueefudefhefhueefudelheeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudegvdgumeelkeekudemgeefjeeimeelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudegvdgumeelkeekudemgeefjeeimeelkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudegvdgumeelkeekudemgeefjeeimeelkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrs
 egurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_234145_093881_9589FB0E 
X-CRM114-Status: GOOD (  13.38  )
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

SGkgQ2zDqW1lbnQsCgpPbiAxMC8wMi8yMDI1IDE2OjU2LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4gQ29tcGFyaXNvbiBvZiBiaXRtYXBzIHNob3VsZCBiZSBkb25lIHVzaW5nIGJpdG1hcF9lcXVh
bCgpLCBub3QgbWVtY21wKCksCj4gdXNlIHRoZSBmb3JtZXIgb25lIHRvIGNvbXBhcmUgaXNhIGJp
dG1hcHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2lu
Yy5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAyICstCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPiBpbmRleCBjNmJhNzUwNTM2YzMuLjQwYWM3MmU0MDdiNiAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBAQCAtNDc5LDcgKzQ3OSw3IEBAIHN0YXRpYyB2b2lkIF9f
aW5pdCByaXNjdl9yZXNvbHZlX2lzYSh1bnNpZ25lZCBsb25nICpzb3VyY2VfaXNhLAo+ICAgCQkJ
aWYgKGJpdCA8IFJJU0NWX0lTQV9FWFRfQkFTRSkKPiAgIAkJCQkqdGhpc19od2NhcCB8PSBpc2Ey
aHdjYXBbYml0XTsKPiAgIAkJfQo+IC0JfSB3aGlsZSAobG9vcCAmJiBtZW1jbXAocHJldl9yZXNv
bHZlZF9pc2EsIHJlc29sdmVkX2lzYSwgc2l6ZW9mKHByZXZfcmVzb2x2ZWRfaXNhKSkpOwo+ICsJ
fSB3aGlsZSAobG9vcCAmJiAhYml0bWFwX2VxdWFsKHByZXZfcmVzb2x2ZWRfaXNhLCByZXNvbHZl
ZF9pc2EsIFJJU0NWX0lTQV9FWFRfTUFYKSk7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIF9f
aW5pdCBtYXRjaF9pc2FfZXh0KGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKm5hbWVfZW5k
LCB1bnNpZ25lZCBsb25nICpiaXRtYXApCgoKU2luY2UgYml0bWFwIGRvZXMgbm90IGd1YXJhbnRl
ZSB0aGUgdmFsdWUgb2YgdGhlICdleHRyYScgYml0cyAKKGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y2LjEzLjEvc291cmNlL2xpYi9iaXRtYXAuYyNMMjQpLCB0aGlzIAppcyBhIGZp
eCBzbyBJIHdvdWxkIGFkZCBhIEZpeGVzIHRhZzoKCkZpeGVzOiA2MjUwMzRhYmQ1MmE4YyAoInJp
c2N2OiBhZGQgSVNBIGV4dGVuc2lvbnMgdmFsaWRhdGlvbiBjYWxsYmFjayIpCgpZb3UgY2FuIGFs
c28gYWRkOgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4KClRoYW5rcywKCkFsZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
