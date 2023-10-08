Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735DAE95A67
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3MoSpmzp0wT2DSVWF+fJ5DmbUWJMOChHASu/MyEWnk=; b=JD+6S0QzkVM3qX
	IQFJSwtwnlq1PHSqBhaywP9gpaFwQF6pVdDhI0UwpgJSnfW4wcOpJIXPWSYzGVkWLHYG/MH/VY76u
	6uVaKpkyuELtPAuXEWtu0uzKgKKvNQY1beLMhaXcLmF+xnz7JkcMa2N2ftgwKapj3GBT4wI/w7kHT
	Td/Yy5wq86y9C2GtxWsRlz1STckxshPh9hl5HigBrhk3/JyiAKNgCFU+WbimToQl5haTRN8OjUVQ4
	YLpXs7si4OZYnhKG8IE9AVqnTLFbtDtiv/n2cRxqV/wEz+3Jk+AzH7wsyRrUtFWrvj5X6o80tCA+e
	Ul7qZLhsTJRSQAmxkaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpQlK-008cXD-2h;
	Sun, 08 Oct 2023 10:11:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpQlG-008cWp-2k
	for linux-riscv@lists.infradead.org;
	Sun, 08 Oct 2023 10:11:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 78C33B80BA5
	for <linux-riscv@lists.infradead.org>; Sun,  8 Oct 2023 10:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8D6C433C8
	for <linux-riscv@lists.infradead.org>; Sun,  8 Oct 2023 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696759903;
	bh=anTSxeHmgVC+wUa5CZQEweK0ru9RY3rK8/qOldhQRI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jyWUMXP2C7qQ5bvF80TgLwAiwvxjiu35k7JKjmr2yc3gz1o/VIY/DVg3xgkS8S5KO
	 fpqjleX6D+NA0ih2ktqp43aJn7Bck74y6drzG5yXQyJ0xjUU70Dcgw4YD+fMfHwMl2
	 KxjV5+lMjhY0M2BP4ElnDs3ohYBhWWPAvAazkzZ2kHAc9Q2YH3MCh2LDtGdX5+fdlD
	 x6+6er4nuf/BE9MM0CqXsy7zr75uzH7RDnh51uzYBUMJ9XZhoT9KG5429ZPJRiItaz
	 UlaZEakhHG0pZCMl9mIsjEIRnMgfaC5skSnJtFm07V4M8AWJUcjRoxUKNK8acLJqMD
	 yoC3UFHVqt/tw==
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5362bcc7026so6361033a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Oct 2023 03:11:42 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx+sBbw7tMdqpwaNtOcT8Cv8KX/nvJu5OXd4a64Ww8v0+llQcOy
	Ph68nP0kz/OnX12VoOsFQMQXBoxwKTCBRRO7ibg=
X-Google-Smtp-Source: AGHT+IEZh4FpuUW0n0QqCNDBpXRuPHCr5YjuwnacjFnzmcOW2Lym8q8t50grRMgRb78Xrb/5TbjwLsbVz6ZeN5wzrHU=
X-Received: by 2002:a05:6402:78c:b0:522:3a0d:38c2 with SMTP id
 d12-20020a056402078c00b005223a0d38c2mr11555622edy.9.1696759901490; Sun, 08
 Oct 2023 03:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231001103433.3187-1-jszhang@kernel.org> <20231001103433.3187-3-jszhang@kernel.org>
In-Reply-To: <20231001103433.3187-3-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 8 Oct 2023 18:11:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSUku1TNLT2aOe0zhdwrrD6+7boSEs+8Rtr6MLntd36AQ@mail.gmail.com>
Message-ID: <CAJF2gTSUku1TNLT2aOe0zhdwrrD6+7boSEs+8Rtr6MLntd36AQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: errata: thead: use pa based instructions
 for CMO
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_031147_220305_2A216227 
X-CRM114-Status: GOOD (  13.84  )
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

T24gU3VuLCBPY3QgMSwgMjAyMyBhdCA2OjQ24oCvUE0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFQtSEVBRCBDUFVzIHN1Y2ggYXMgQzkwNi9DOTEwL0M5MjAg
c3VwcG9ydCBwaHkgYWRkcmVzcyBiYXNlZCBDTU8sIHVzZQo+IHRoZW0gc28gdGhhdCB3ZSBkb24n
dCBuZWVkIHRvIGNvbnZlcnQgdG8gdmlydCBhZGRyZXNzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2VycmF0
YS90aGVhZC9lcnJhdGEuYyB8IDE4ICsrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2Vy
cmF0YS5jCj4gaW5kZXggM2ZlZmViMWI0NTZlLi42MzI1NTdmMzZiMTkgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2VycmF0
YS90aGVhZC9lcnJhdGEuYwo+IEBAIC01OCw5ICs1OCw5IEBAIHN0YXRpYyBib29sIGVycmF0YV9w
cm9iZV9wYm10KHVuc2lnbmVkIGludCBzdGFnZSwKPiAgICogfCAzMSAtIDI1IHwgMjQgLSAyMCB8
IDE5IC0gMTUgfCAxNCAtIDEyIHwgMTEgLSA3IHwgNiAtIDAgfAo+ICAgKiAgIDAwMDAwMDAgICAg
MTEwMDEgICAgIDAwMDAwICAgICAgMDAwICAgICAgMDAwMDAgIDAwMDEwMTEKPiAgICovCj4gLSNk
ZWZpbmUgVEhFQURfaW52YWxfQTAgIi5sb25nIDB4MDI2NTAwMGIiCj4gLSNkZWZpbmUgVEhFQURf
Y2xlYW5fQTAgIi5sb25nIDB4MDI1NTAwMGIiCj4gLSNkZWZpbmUgVEhFQURfZmx1c2hfQTAgIi5s
b25nIDB4MDI3NTAwMGIiCj4gKyNkZWZpbmUgVEhFQURfaW52YWxfQTAgIi5sb25nIDB4MDJhNTAw
MGIiCj4gKyNkZWZpbmUgVEhFQURfY2xlYW5fQTAgIi5sb25nIDB4MDI5NTAwMGIiCj4gKyNkZWZp
bmUgVEhFQURfZmx1c2hfQTAgIi5sb25nIDB4MDJiNTAwMGIiCj4gICNkZWZpbmUgVEhFQURfU1lO
Q19TICAgIi5sb25nIDB4MDE5MDAwMGIiCj4KPiAgI2RlZmluZSBUSEVBRF9DTU9fT1AoX29wLCBf
c3RhcnQsIF9zaXplLCBfY2FjaGVzaXplKSAgICAgICAgICAgICAgICAgICBcCj4gQEAgLTc5LDIz
ICs3OSwxNyBAQCBhc20gdm9sYXRpbGUoIm12IGEwLCAlMVxuXHQiICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Cj4gIHN0YXRpYyB2b2lkIHRoZWFkX2Vy
cmF0YV9jYWNoZV9pbnYocGh5c19hZGRyX3QgcGFkZHIsIHNpemVfdCBzaXplKQo+ICB7Cj4gLSAg
ICAgICB2b2lkICp2YWRkciA9IHBoeXNfdG9fdmlydChwYWRkcik7Cj4gLQo+IC0gICAgICAgVEhF
QURfQ01PX09QKGludmFsLCB2YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiAr
ICAgICAgIFRIRUFEX0NNT19PUChpbnZhbCwgcGFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tf
c2l6ZSk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCB0aGVhZF9lcnJhdGFfY2FjaGVfd2JhY2socGh5
c19hZGRyX3QgcGFkZHIsIHNpemVfdCBzaXplKQo+ICB7Cj4gLSAgICAgICB2b2lkICp2YWRkciA9
IHBoeXNfdG9fdmlydChwYWRkcik7Cj4gLQo+IC0gICAgICAgVEhFQURfQ01PX09QKGNsZWFuLCB2
YWRkciwgc2l6ZSwgcmlzY3ZfY2JvbV9ibG9ja19zaXplKTsKPiArICAgICAgIFRIRUFEX0NNT19P
UChjbGVhbiwgcGFkZHIsIHNpemUsIHJpc2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gIH0KPgo+ICBz
dGF0aWMgdm9pZCB0aGVhZF9lcnJhdGFfY2FjaGVfd2JhY2tfaW52KHBoeXNfYWRkcl90IHBhZGRy
LCBzaXplX3Qgc2l6ZSkKPiAgewo+IC0gICAgICAgdm9pZCAqdmFkZHIgPSBwaHlzX3RvX3ZpcnQo
cGFkZHIpOwo+IC0KPiAtICAgICAgIFRIRUFEX0NNT19PUChmbHVzaCwgdmFkZHIsIHNpemUsIHJp
c2N2X2Nib21fYmxvY2tfc2l6ZSk7Cj4gKyAgICAgICBUSEVBRF9DTU9fT1AoZmx1c2gsIHBhZGRy
LCBzaXplLCByaXNjdl9jYm9tX2Jsb2NrX3NpemUpOwo+ICB9Cj4KPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCByaXNjdl9ub25zdGRfY2FjaGVfb3BzIHRoZWFkX2VycmF0YV9jbW9fb3BzID0gewo+IC0t
Cj4gMi40MC4xCj4KVGh4LCBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+
CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
