Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9FBC369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 10:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuyLFDwtEacUTatk6geXzRHG8nthUq7Z8I+4ePJ98k8=; b=siWo0Bcur3lxoW
	K9IEYYmgFwHnSWQq6hGMq/qOktJQGVLQYT7fWUVLFM9JKa6A+VsSPR5ULGKchAjS8oncgHF00NzBC
	G9JedgO1L91nS+OsrMz7T3g4pzTlVQReRP9yB6h6kTT/ICSQgqOmj2i+m7kXS+blbEOa47VAH9exX
	r1MRA9i/UZ22ZMe980hyGjmDxTE9BotAEeS2rZdlTeZE+jf68Z9VncqY+jGTTUzWjDuiGOZRkeWcC
	tvYO2IT0HZ8BkahyuFrezQdqxmtvK4lCYEGAo0HyYAzibbtjTjPu1HTvxyRLwptuITReLMrx1BK5d
	e/zCKbvXTkWsCE4+lM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XXM-0000000ACvq-2zqP;
	Wed, 23 Apr 2025 10:41:05 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WbW-0000000A16O-0mAK
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 09:41:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745401270; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C8o3k/MNKgokhJ/HASLGbQyUh60PC5Hw29hzZ6sHRk/lH7QXyZNAVNpD0SoeEzIMmTEMQuSvSns7SvYqpjM4vh+N50kM6AZ5NYRR5GqcEeP730gjqcbem1sqCfV42Tq3EjMpfDSHEMsKVIxElXzX4L4BdtqdQYqANNWEIZ1jgOA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745401270; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wW5kFrJgTitCYAlrW6MnWYT7C3pZ0s7BzoECLOXQLSA=; 
	b=SG3BFC0J28ZjJf7+QjDGQbeBOVQx6dwrDWsCHFj+fvZWR7lJQmE6lUaViF+aglBb44CC2FJfIuFaEF1XVh6SLOwkM1UDJbLvR9aam+wKbPh9yaWhZvabVW6i/0nwN01yGveJfqvAx6ucTUyxzapT55FzfNzjLZloH6v7Y5OjLdo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745401270;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=wW5kFrJgTitCYAlrW6MnWYT7C3pZ0s7BzoECLOXQLSA=;
	b=c4PAb5qLq55mEXHWomaV1Q59jzLSiqxwbV2fhuJg34/Ed/heUYX6CPJgAiIGfTt+
	K2m4msbW83z4vlykFpteoTMQgjxeWSIfhJI8itB0TXbWxtQaAFzzteUammVeTiZKNrm
	hx0ejHOMLndNiXDYeNNYQWw2plDKi+pJ5qYWDSLQAjbkUDFSZo2ucfo6iy6NL4v5YSp
	yZO1o7yLAKjU8iF0NmUhEPeHSTIQsSrgvPDXs/asgroohBv2gnwZJ85FLJk8AE5CqbY
	1bUtIWLhD14KJ6zR5xElbiK1hlMyRIAmfbemnjxJEnjtsejXuRfxNg+SPmQ9r0o+qPj
	0oo687eECg==
Received: by mx.zohomail.com with SMTPS id 1745401267041866.6059217283805;
	Wed, 23 Apr 2025 02:41:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 17:40:58 +0800
From: Icenowy Zheng <uwu@icenowy.me>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_1/3=5D_dt-bindings=3A_pi?=
 =?US-ASCII?Q?nctrl=3A_jh7110-sys=3A_add_force_inputs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
References: <20250422162250.436169-1-uwu@icenowy.me> <20250422162250.436169-2-uwu@icenowy.me> <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
Message-ID: <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_024118_298332_54EF4050 
X-CRM114-Status: UNSURE (   9.00  )
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

Cgrkuo4gMjAyNeW5tDTmnIgyM+aXpSBHTVQrMDg6MDAgMTc6MDk6NDLvvIxMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IOWGmemBk++8mgo+SGkgSWNlbm93eSwKPgo+dGhh
bmtzIGZvciB5b3VyIHBhdGNoIQo+Cj5PbiBUdWUsIEFwciAyMiwgMjAyNSBhdCA2OjIz4oCvUE0g
SWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+Cj4+ICsgIHN0YXJmaXZlLGZv
cmNlLWxvdy1pbnB1dHM6Cj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBUaGUgbGlzdCBv
ZiBpbnB1dCBzaWduYWxzIGZvcmNlZCB0byBiZSBsb3cgaW5zaWRlIHRoZSBTb0MgaXRzZWxmLgo+
PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJh
eQo+Cj5JIGRvbid0IHNlZSB3aHkgeW91IG5lZWQgdGhpcyBoYWNrLgoKVW5mb3J0dW5hdGVseSB0
aGVzZSBwcm9wZXJ0aWVzIGFyZSBub3QgZm9yIHBpbnMsIGJ1dCBpbnRlcm5hbCBzaWduYWxzIHRo
YXQgaXNuJ3QKYm91bmQgdG8gZXh0ZXJuYWwgcGlucy4KCj4KPlVzZSB0aGUgZXhpc3RpbmcgcGVy
LXBpbiBvdXRwdXQtbG93IHByb3BlcnR5IChzZWUKPkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9waW5jdHJsL3BpbmNmZy1ub2RlLnlhbWwpLgo+Cj4+ICsgIHN0YXJmaXZlLGZvcmNl
LWhpZ2gtaW5wdXRzOgo+PiArICAgIGRlc2NyaXB0aW9uOgo+PiArICAgICAgVGhlIGxpc3Qgb2Yg
aW5wdXQgc2lnbmFscyBmb3JjZWQgdG8gYmUgaGlnaCBpbnNpZGUgdGhlIFNvQyBpdHNlbGYuCj4+
ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5
Cj4KPlVzZSB0aGUgZXhpc3Rpbmcgb3V0cHV0LWhpZ2ggcHJvcGVydHkuCj4KPk5vdyBJICprbm93
KiB0aGVzZSB0d28gcHJvcGVydGllcyBhcmUgcGVyLXBpbi4gVGhhdCBpcyBtb3JlIHRhbGthdGl2
ZQo+YnV0IHdheSBlYXNpZXIgZm9yIHVzZXJzIHRvIHJlYWQuCj4KPlRoZW4gdXNlIHBpbmNvbnRy
b2wgaG9ncyB0byBtYWtlIHN1cmUgdGhlc2UgY29uZmlncyBhcmUgc2V0IHVwCj5hdCBwcm9iZS4K
Pgo+WW91cnMsCj5MaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
