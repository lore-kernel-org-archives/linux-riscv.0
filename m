Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B734FE95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 01:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taXLYzJZZI/mpoJ/iYr7soKtDIj0R2ApsGkSqBAbwyo=; b=WUZw+mWtsxXbMV
	PzXjlMXndXyqyZ3h0SuYcUULyy4O/RzOG6JnHtMVSESS7MM3fuVW2/AW0w5O9/wn8NhazWJit3B2K
	41fRIFlbTG53PttTn5JWMYw81k2yQdEuGS9Dq8Npq95dsZFOtQMXBqdTLN6F+hc/rr0D6flCYnhuz
	bimlER5fEhdOYZPcgPsfaKNljqNGtdA2PPhblgljSK5C4es/RQL9y1ZHWl1Neez4UPJdJUDnibLBk
	VPitjdU2TXrqT4MHqJw2Fg2uEl1nc0rvqNkbxo1dGu9BclkArygGWleAkbc1FW8kvnlOmJ4agY0gX
	9Pg10YWAWoE/zI90ooPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpeeP-009ZDF-0V;
	Mon, 09 Oct 2023 01:01:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpeeM-009ZCY-1F
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 01:01:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B119BCE0E93
	for <linux-riscv@lists.infradead.org>; Mon,  9 Oct 2023 01:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21399C4339A
	for <linux-riscv@lists.infradead.org>; Mon,  9 Oct 2023 01:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696813291;
	bh=12V8BUvOQDiMroiIaSqNg+ekaSPMnUVQbV6cs0RaO7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Oak9JjnU5uk8yjoGhRdnauLsfoKeTJG5EJpBmIgLFHzIt+YK0/qwkf2el57fx4TLP
	 1I0q6r4pXCN7zATz//1oh2SRs7VRWPP6vYFvyo7uiIqzCJqZ5CchCYhgqcD2ht9Nmk
	 Pu5t9FbJLOQiAJWVakj3DyvKIoZa8ZikhfT826svM7qn4U8P+WGDtR/TDgIzbuq0c/
	 uO+9BMSZoY/8ntPBcB2JVET/0V7GKFvzWGyVcV6z0Bor3LQStlafPvD+MbUkrkLnqS
	 EjIS0IEQSmKnHCMAEU+CEa7gSygVjblKT142gT1z9rvIAA4WiE1F13BTPCrs+CA1hv
	 RlkC0TGF6aN1Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so10975565a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Oct 2023 18:01:31 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw9RhhyAhWY+6QJBidUJv2uM3I3EAGHmXkjMKVJhrC59LfLKshW
	uuNCqSDz6wWc4ctaDv8TMrsl1nNYFHB9DsZCKJ8=
X-Google-Smtp-Source: AGHT+IHIfsPYV3LL5MmuuW4fRb62rbHbzO3zKIowTx57SQthg3QHBVuMCr03hUmOCe0pZutvENlB/38cG81IZDD3OGQ=
X-Received: by 2002:a50:fb0c:0:b0:530:8759:a3ac with SMTP id
 d12-20020a50fb0c000000b005308759a3acmr10568781edq.2.1696813289399; Sun, 08
 Oct 2023 18:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230922081351.30239-2-conor@kernel.org> <20230922081351.30239-8-conor@kernel.org>
 <CAJF2gTR2JmsMhzjzWp85hEwoJwRBN4T4iHz_Z-1cG-XgB=EFeA@mail.gmail.com> <20230923-snowsuit-angled-f49237d27c83@spud>
In-Reply-To: <20230923-snowsuit-angled-f49237d27c83@spud>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 9 Oct 2023 09:01:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ+PJcZguUEN8+Ls_DX4U3xpW+4O-ztrJ0NzM2ODrc_5w@mail.gmail.com>
Message-ID: <CAJF2gTQ+PJcZguUEN8+Ls_DX4U3xpW+4O-ztrJ0NzM2ODrc_5w@mail.gmail.com>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new properties
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Chen Wang <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_180134_795335_87E039FE 
X-CRM114-Status: GOOD (  16.76  )
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

T24gU2F0LCBTZXAgMjMsIDIwMjMgYXQgNjoyNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTYXQsIFNlcCAyMywgMjAyMyBhdCAwMzo1MDozNlBNICsw
ODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgNDoxNuKAr1BN
IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiA+Cj4gPiA+IENv
bnZlcnQgdGhlIHRoMTUyMCBkZXZpY2V0cmVlcyB0byB1c2UgdGhlIG5ldyBwcm9wZXJ0aWVzCj4g
PiA+ICJyaXNjdixpc2EtYmFzZSIgJiAicmlzY3YsaXNhLWV4dGVuc2lvbnMiLgo+ID4gPiBGb3Ig
Y29tcGF0aWJpbGl0eSB3aXRoIG90aGVyIHByb2plY3RzLCAicmlzY3YsaXNhIiByZW1haW5zLgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgx
NTIwLmR0c2kgfCAxMiArKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Ro
ZWFkL3RoMTUyMC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+
ID4gPiBpbmRleCBjZTcwODE4M2I2ZjYuLjcyM2Y2NTQ4NzI0NiAxMDA2NDQKPiA+ID4gLS0tIGEv
YXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+ID4gPiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPiA+IEBAIC0yMCw2ICsyMCw5IEBAIGM5
MTBfMDogY3B1QDAgewo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
InRoZWFkLGM5MTAiLCAicmlzY3YiOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBkZXZp
Y2VfdHlwZSA9ICJjcHUiOwo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2Eg
PSAicnY2NGltYWZkYyI7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlzYS1i
YXNlID0gInJ2NjRpIjsKPgo+ID4gV2h5IG5vdCByaXNjdixpc2EtYmFzZSA9ICJydjY0Ij8gSSBz
YXcgImkiIGluIHRoZSByaXNjdixpc2EtZXh0ZW5zaW9ucy4KPgo+IEkgZGlkIGl0IHRoYXQgd2F5
IGFzIGEgaGVkZ2UgYWdhaW5zdCB0aGluZ3MgY2hhbmdpbmcgaW4gdGhlIGZ1dHVyZS4gSQo+IGhh
dmUgbGl0dGxlIHRydXN0IGluIHRoYXQgcGFydCBvZiB0aGUgSVNBIHNwZWNpZmljYXRpb25zLgpP
a2F5LCB0aGF0J3MgY2xlYXIgZW5vdWdoLgoKQWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
