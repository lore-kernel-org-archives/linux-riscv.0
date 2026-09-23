Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871BFC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 06:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Cc:To:Message-Id:In-Reply-To:
	Mime-Version:Subject:Date:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJBGdVt4fWj13ey51kgqjDylpuHOfmvMLX/D3Rw3atI=; b=t3V8aTC2vp8JO8
	MsiYXcReox57tQbcOlFVO7K8FPfaGkuinx0XhAIhO9QgG6/YQiquQrHfo4rWzvdgYMaGYgzEwYBL7
	HexGk3QtVVU66WNmagXH0Hw6FXaehXb4uQQy1OG9ZLkeOdjH3D66SzN1AS9egueN9AC07sn88Gobu
	IhYsKnfEw/p20/c8QDkdhKUCpjsMFNAzbYwyqv3WACO+rEYqh1Zf5OWb8U+Ltbhq1RFNvtbPtnDPT
	JiRhdxWbjBAvAanJ1lZbiJri2kXvjO8kJpLLEZi+jcftq+fzv7CCd4Aq6V516bN1WXJGJeA3gn4+L
	g3Jrzm1WCySDCS+6zufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GjB-00000007Jpn-2C7Z;
	Wed, 23 Sep 2026 06:45:13 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Gj8-00000007JpL-31mI
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 06:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1790145899;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mfwKAVk2tgsaRf3EcqdDECyLiqTSD7GjUlH9PDB78fo=;
 b=GgujK1/IVLZBna5OOZMywCOZSsTVGew5L3F0W0/VkM1dFlzQrUtvjeLJGjXOATZNyvkUif
 eZD/qI9qvc4uAdAB85c1AtLWUFZEwdmdooxoY+8k3YcOcnQ27Zy5I+fcPS4gCJ8EHChJno
 njC9rtkl3RE+RJFW4gzt4gky6AwFUkkqdKeUZgKg47N1hj+BRN0h1ualRvg/4gFu/UeR/r
 rvJ2g97qU7tpe9Uk6KretbVvG3S4Jr+H0F2iADLEM4iXRm6x84h8pcIGY1pNnP3FJL7XPe
 2r7pEhu7PGKDvWb8LxOOf5+klOYf+rO3ZokDUqoNZXPmsNxnhZ2SZCgfAd4k7Q==
References: <20260922110231.3426011-1-sandie.cao@deepcomputing.io> <20260922110434.3426051-1-sandie.cao@deepcomputing.io> <DLMC322TOCGJ.2GTJG14AFBACW@linux.spacemit.com> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.b414918c.4333.4215.b208.49d99e9be044@feishu.cn>
	<DLMHKHTDP2W9.3GX33KSJ2YIJM@linux.spacemit.com>
Date: Wed, 23 Sep 2026 14:44:56 +0800
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Mime-Version: 1.0
In-Reply-To: <DLMHKHTDP2W9.3GX33KSJ2YIJM@linux.spacemit.com>
X-Lms-Return-Path: <lba+16ab37569+e802d7+lists.infradead.org+sandie.cao@deepcomputing.io>
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.87aa009f.6c8d.46bc.aa71.f3065515c380@feishu.cn>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Yixun Lan" <dlan@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_234510_849998_83DC22EB 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksIFRyb3k6Cgo+IEZyb206ICJUcm95IE1pdGNoZWxsIjx0cm95Lm1pdGNoZWxsQGxpbnV4LnNw
YWNlbWl0LmNvbT4KPiBEYXRlOsKgIFdlZCwgU2VwIDIzLCAyMDI2LCAxNDozNgo+IE9uIFdlZCwg
U2VwIDIzLCAyMDI2IGF0IDEyOjA3OjIwUE0gKzA4MDAsIFNhbmRpZSBDYW8gd3JvdGU6Cj4gPiBQ
bGVhc2Ugbm90ZTogdXNiM2RfdTJwaHkgYWxzbyB1c2UgQ0xLX0FQTVVfVVNCMl9CVVMuCj7CoAo+
IENvdWxkIHlvdSBzaGFyZSB3aGljaCB0cmVlIGFuZCBjb21taXQgdGhpcyBzbmlwcGV0IGNvbWVz
IGZyb20/IEkgY2hlY2tlZAo+IGszLmR0c2kgYXQgdGhlIGJhc2UtY29tbWl0IGxpc3RlZCBpbiB5
b3VyIGNvdmVyIGxldHRlciwKPiAzZjI0MjVmNWI1YmJiZGQ5OTFjYTljZGZkNTUwMmU2OGQ4ODk1
OTk4IFsxXSwgYW5kIHVzYjNkX3UycGh5IGhhczoKPsKgCj4gwqAgwqAgwqAgwqAgY2xvY2tzID0g
PCZzeXNjb25fYXBtdSBDTEtfQVBNVV9VU0IzX1BPUlREX0JVUz47Cj7CoAo+IEFyZSB3ZSBsb29r
aW5nIGF0IGRpZmZlcmVudCB2ZXJzaW9ucz8KCkknbSBzb3JyeSwgSSBjaGVjayB0aGUgd3Jvbmcg
dmVyc2lvbiBvZiB2Ny4yLsKgIEkgd2lsbCBjb3JyZWN0IGl0IGluIG5leHQgcGF0Y2guCgpCZXN0
IHJlZ2FyZHMKU2FuZGllCgo+wqAKPiBMaW5rOiBodHRwczovL2tlcm5lbC5nb29nbGVzb3VyY2Uu
Y29tL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQvKy8zZjI0MjVmNWI1
YmJiZGQ5OTFjYTljZGZkNTUwMmU2OGQ4ODk1OTk4L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazMuZHRzaSBbMV0KPsKgCj4gLS3CoAo+IFRyb3kgTWl0Y2hlbGwKPsKgCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
