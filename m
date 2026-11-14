Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58905606B0D7
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i2nr7l1j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf7YOYxV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KS0qsMv5GRA9NYvi+wpl0nPO5hq8LqmPO0U+XtrOmWs=; b=i2nr7l1jfWaZnmPwn5VQ2Ea2q4
	3gyjn4sQBB/10E2kxW/XlJiF3YlPyUPsIMcuVPSGSjCotYmK7LPsVgyQzrFtQmxOGq0N4JSNfZ5O0
	936SivC7usHiBZvgl3PvC8v0qxBAvjiAlMU53bypuZmoI3yvPHbK1wQdHHMgV73AENMxs5gHSK/ro
	Vg6ZufzLc1iUplyv2g1DZyjWIbpobOxPADlwIKluDdCUelF+bXWVEw3lZ4jpTl5fGr4vT05XAI/oG
	eGIeEBta1IhVLKzOawUxCEqL1VrjYFDpSCUZpaK4VHJa1CxkBrm4eJEvgYGV65hUKryjYLcxEL4SN
	F45d3mPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDbE-0000000G5gS-2Cad;
	Sat, 14 Nov 2026 13:15:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDbD-0000000G5fz-3ivS
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:15:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A256745EF4
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB101F000D1
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794662119;
	bh=vNQVHHIZZSTfT1nrplfEiIhLIPg6pXBmqlh+M+H8vW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lf7YOYxVYTo5d0Tbx5gjgNZgPFz3MxuFXw29Z0fXtpyvQLlRrt2F0jRnECvFS16r7
	 430u/94eNRLSN8StKFXd5LKPWVBYC1YmrUZCOGWBSbDeS2mC0JiTT+JGiARRZNMo20
	 Vf/baGSX3peSR8oLnSEzJDLJ+cSDFHAri6ZstYW4/MNQe+8OTtzEScdG1Tt3kOzQz5
	 EkInjFMaSoynkqxUCzlB+LBP17jf5p+BjAXmQT5Afitek8u6KhlK5VTbb3IU9EAq4Y
	 09a/neI1QYgYvPd8juYRJOS+ySsYJOjR26YtDPUj9Sob509vbXEM6thWCsomRplVQW
	 rED+Vwwv0D4sw==
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so9146205e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 05:15:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEUvA0F8GU8LeifN6HlFAToH8a0/dlTgFM3EYp2F9rPzNPLJK9rlgrpe6BEhOGoc5n8sEhT6MRFly8FEQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+I6++lti7eoPILwVcfzq/GydATqi/3i+YyBBTYIdGOdPRjSfwi
	Ves2LvowPWLMzy2Oc6+nZJkejz4Rb55XsIPiStQeJIgZN59HrvNCM930zrD6DpdCZgVp6IvqRae
	n0r818EqiQW8SmA0Dsz0H/gPc+Ziiqrw=
X-Received: by 2002:a05:600c:470a:b0:4ac:b0b2:fa12 with SMTP id
 5b1f17b1804b1-4bb559f5d44mr107933255e9.1.1794662118139; Sat, 14 Nov 2026
 05:15:18 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:15:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQQhhDe6vxjNSUfoC87D5hW_DFS+gUnrt3ojnzQJEd5jw@mail.gmail.com>
X-Gm-Features: AclHuK9KtD0Arqx9onqXzPVHTGELkECSfl6DqyPNiPMBBAgZM_jcqAKpqYXH_44
Message-ID: <CAJF2gTQQhhDe6vxjNSUfoC87D5hW_DFS+gUnrt3ojnzQJEd5jw@mail.gmail.com>
Subject: Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgMTQsIDIwMjYgYXQgNjozM+KAr0FNIEhhbiBHYW8gdmlhIEI0IFJlbGF5Cjxk
ZXZudWxsK2dhb2hhbi5pc2Nhcy5hYy5jbkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEhh
biBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+IEFkZCBteXNlbGYgYXMgbWFpbnRhaW5lciBm
b3IgdGhlIFY4NjEgYmluZGluZ3MsIGNsb2NrIGFuZCBwaW4gY29udHJvbAo+IGRyaXZlcnMgYW5k
IGRldmljZSB0cmVlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5h
Yy5jbj4KPiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01B
SU5UQUlORVJTCj4gaW5kZXggOTNhYmJiMzE1MDY1Li5kZmMzMDBkYzFlYjIgMTAwNjQ0Cj4gLS0t
IGEvTUFJTlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0yNDAzMSw2ICsyNDAzMSwx
OCBAQCBGOiAgICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbnRjLmMKPiAgRjogICAgIGlu
Y2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1hcGxpYy5oCj4gIEY6ICAgICBpbmNsdWRlL2xpbnV4
L2lycWNoaXAvcmlzY3YtaW1zaWMuaAo+Cj4gK1JJU0MtViBBTExXSU5ORVIgVjg2MSBTb0MgU1VQ
UE9SVAo+ICtNOiAgICAgSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+ICtMOiAgICAgbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ICtMOiAgICAgbGludXgtc3VueGlAbGlzdHMu
bGludXguZGV2Cj4gK1M6ICAgICBNYWludGFpbmVkCj4gK0Y6ICAgICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY2xvY2svYWxsd2lubmVyLHN1bjI1Mmktdjg2MS1jY3UueWFtbAo+
ICtGOiAgICAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjUyaS12ODYxKgo+ICtG
OiAgICAgZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjI1Mmktdjg2MSouYwo+ICtGOiAgICAg
ZHJpdmVycy9waW5jdHJsL3N1bnhpL3BpbmN0cmwtc3VuMjUyaS12ODYxKi5jCj4gK0Y6ICAgICBp
bmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N1bjI1Mmktdjg2MSouaAo+ICtGOiAgICAgaW5jbHVk
ZS9kdC1iaW5kaW5ncy9yZXNldC9zdW4yNTJpLXY4NjEqLmgKPiArCkdvb2QgV29yaywgdGh4IGZv
ciBtYWludGFpbmluZyB0aGVzZS4KCkFja2VkLWJ5OiBHVU8gUmVuIChYdWFuVGllKSA8Z3VvcmVu
QGtlcm5lbC5vcmc+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
