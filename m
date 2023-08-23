Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C034EE49B0
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 11:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUvLgzxlik+luEO97fcYDp8sdK0jiEg6b8TlgrN1n88=; b=KTpowI22D5M6aA
	CToDmb1FLjli0dbtkCFf5SEW91+ozi53Je8lnyLm1dKoRw9I0yYFIxv5+7nXBGtCUtw9WbEfrPp5E
	tJYjFiv1JBsQzKJb0B0H+WzKG+Opq1Eek7m231F+FG/pfhcTuXYHfz90fcGbdP5dWk2vo6dS7RUkx
	pryVfAGAMklLjkIDdM3KjPKSwiZ8bFqTXLkpv8GvRt9qniXVvHR3EDBGd8GyLZO4P1LyrrPB5Us1Q
	gotSjmIBL7y0mtx0nZtHCydZrp6n+EfuCG/HfjZIVDHdN/9CacdSVQzRi8w/8UNO81FQqKGqDdZhA
	g5U0AYAF5Hfx+HApwazQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmQj-000U92-2O;
	Wed, 23 Aug 2023 11:53:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYmQg-000U7W-0L;
	Wed, 23 Aug 2023 11:53:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91350660DC;
	Wed, 23 Aug 2023 11:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A96BC43397;
	Wed, 23 Aug 2023 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692791620;
	bh=9ozTPMOCGjgHLaJa54zNz+3htX4e52MyhqXdip941jo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l24jGUE83dTC5LIpesTj/6es0p1WS7ylU3MUON3FJiuoWQxxRCjlR5z3wIFk4K+oU
	 K2AWIcTPkmDsluBNADDyBlpMDLA8Rp+uKKqJoCHs0avzOBmXGyOqYqn+BCh16bjUI2
	 hvhq9h51Ry+gIiCJSOxxraYuuki2GsBa0J1eiiJ7gXumwLCguGvREwpTyW9YV+YEk7
	 dNwAKeoP3UDdpi+bdNOnHPI9JPaBhU60YEN1dK+7znlOZ/CRo/Tve9mIsDAErxAZ59
	 jKyyPyla2DIuaYkyUmtM5hqQ6DDKwQ7Gc/a1lvWnat8Yxav7r0p1B08W1yk1QFolNU
	 SsschzuYYGj6A==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso85186531fa.3;
        Wed, 23 Aug 2023 04:53:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YxJA7qKFeD7jcJdfpmsNL0rILInXtDgZ6W/lLws//CT9lja+Qe2
	eJxF/PG0LmmWyhQSsdXPe2queHXV3SKOYH/dlw==
X-Google-Smtp-Source: AGHT+IG6AYWn2ZBtqiggebw0M0LEoLpjEjEkmAuyxGb6SqXHXb0v7iaIhaSPWuqzMe7IxI9zjdhMNEvmSNHymSTc/JA=
X-Received: by 2002:a2e:7008:0:b0:2bc:d8fd:13df with SMTP id
 l8-20020a2e7008000000b002bcd8fd13dfmr2086615ljc.41.1692791617967; Wed, 23 Aug
 2023 04:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174702.4059100-1-robh@kernel.org> <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
In-Reply-To: <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 23 Aug 2023 06:53:25 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+EbxHkdXEJsgAETrQj8Ps30umOMcArt1fCaNumxBem5A@mail.gmail.com>
Message-ID: <CAL_Jsq+EbxHkdXEJsgAETrQj8Ps30umOMcArt1fCaNumxBem5A@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Explicitly include correct DT includes
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_045342_229377_EC358237 
X-CRM114-Status: GOOD (  15.61  )
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

T24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgNjowNeKAr1BNIEphc3NpIEJyYXIgPGphc3Npc2luZ2hi
cmFyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAxNCwgMjAyMyBhdCAxMjo0N+KA
r1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRoZSBEVCBv
Zl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBkYXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4g
PiBvZl9wbGF0Zm9ybV9idXNfdHlwZSBiZWZvcmUgaXQgYXMgbWVyZ2VkIGludG8gdGhlIHJlZ3Vs
YXIgcGxhdGZvcm0gYnVzLgo+ID4gQXMgcGFydCBvZiB0aGF0IG1lcmdlIHByZXBwaW5nIEFybSBE
VCBzdXBwb3J0IDEzIHllYXJzIGFnbywgdGhleQo+ID4gInRlbXBvcmFyaWx5IiBpbmNsdWRlIGVh
Y2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3JtX2RldmljZS5oCj4gPiBhbmQgb2Yu
aC4gQXMgYSByZXN1bHQsIHRoZXJlJ3MgYSBwcmV0dHkgbXVjaCByYW5kb20gbWl4IG9mIHRob3Nl
IGluY2x1ZGUKPiA+IGZpbGVzIHVzZWQgdGhyb3VnaG91dCB0aGUgdHJlZS4gSW4gb3JkZXIgdG8g
ZGV0YW5nbGUgdGhlc2UgaGVhZGVycyBhbmQKPiA+IHJlcGxhY2UgdGhlIGltcGxpY2l0IGluY2x1
ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0bwo+ID4gZXhwbGljaXRs
eSBpbmNsdWRlIHRoZSBjb3JyZWN0IGluY2x1ZGVzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPgo+IEkgdGhvdWdodCBJIHdhcyB0byBwaWNr
IHRoZSBwYXRjaC4gQnV0IEkgc2VlIHlvdSBpbnRlbmQgdG8gZG8gaXQuIE5wLgoKTm8sIHBsZWFz
ZSBhcHBseSBpdC4KClRoYW5rcywKUm9iCgo+Cj4gQWNrZWQtYnk6IEphc3NpIEJyYXIgPGphc3Np
c2luZ2hicmFyQGdtYWlsLmNvbT4KPgo+IHRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
