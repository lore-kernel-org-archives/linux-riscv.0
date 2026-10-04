Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F70CA5FEC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kdfu+d8w1E69peW+YpMUVGOET95cM+6cZij42cMZN2Q=; b=oJ8qJhns5NvLVd
	4BG2lLRMT15AJFQ7TY4PBdFq204vp8kepe5c/cxaW2LLzrZPQ0eC8yjvb9aO8Xo5xHHE3XOFa92YP
	Zj22zcKC8xkWqfVJ8UnVewxwHgxmamhs65uYB2UYQywZpNm917ZOptMcoe2jNJ9gy0h48UCbGQNm0
	pL3OG6k0ekLcyrYYxjck34TxUxYcV0Rr30nxgXPJ4w2awFouGELt1YD5mtn4C9mFyZ+JsCYanwH0r
	k3hNP8zT1vX6pIqnu7jXX/aeflpMDAqzvvwPZmg48zzDmkoTD1CgUpbPh1EsG+LkSqL4VmnLhr4nD
	2dE8168v4Fkx7mN7T74g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK12-0000000EhMY-2ju2;
	Sun, 04 Oct 2026 11:04:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDK11-0000000EhLu-3spG
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 11:04:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ABF7F447A3
	for <linux-riscv@lists.infradead.org>; Sun,  4 Oct 2026 11:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936E71F00899
	for <linux-riscv@lists.infradead.org>; Sun,  4 Oct 2026 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791111863;
	bh=4+5J5Wk0O+uOTKnZfw9tvqFIpDGg/5JIdr6gLxye25A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=SBx0WO9CxzsArV8P/z64gCOTXQshWfg8Uror7eEDwZdi5aZTCJBQL8qoqrANfEksk
	 mvFOanfmnyco6OyowlaaJ6TrfOtYf6kn93SwgffFfhiHzHcnwssPbFTsfct/AKoqC9
	 /tGCWkevB7fcn9D5aV3ifilhLKt6YnxujLcPJDxbNW9G5cugUjaMIZ6GMLhGATypyK
	 iqGteZb4k/JHXCi9yls6xnv3sDbCdjVeFone4PeJRkjLI5DJ6X00Ch4zN76r6Brsmi
	 YV7SIyDgrEUfkX5W1HMPNv2zitYX60sI+FIRCZx2k5woXVy6UjQwwXaNCRteDbNw+H
	 nP4vpqJV7v6vw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a980c01033so2904431fa.3
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 04:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvZxsVchPO78ZQMKOgyjXlvZMbfHM13tycD/EIxov8WTJR2p0FhpxxyEIAEwCeZZI0FYhCsl/ZEzS4Yg==@lists.infradead.org
X-Gm-Message-State: AFq9FYIKdJyv74f/VMNFeGLJRRnJxc8zGYcX50CPkTmiI1nAohNzB5uF
	O1SaRvYsgAku6v4Ijn8EUdl6YqtAXVe6VzS0jbDSnpxNGbJRG0y+rclg46s2hkAaPHD1FP/218k
	JOfmKTQaiJkOIGH85gFdNqji5SSvrhc0=
X-Received: by 2002:a2e:b8c8:0:b0:3a9:82c2:ec1e with SMTP id
 38308e7fff4ca-3a982c2ed98mr3375891fa.15.1791111861878; Sun, 04 Oct 2026
 04:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-8-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-8-11175b41cd2d@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 4 Oct 2026 13:04:09 +0200
X-Gmail-Original-Message-ID: <CAGb2v653CS4jFNAo+p=-_7wspObh=Cd=pUaSnPA1vu1hegsAOg@mail.gmail.com>
X-Gm-Features: AclHuK_0n2_x4qIGHT4NpCYNH-L_cZ0FJ47BSqio0LkXDY9BAqYTPBXGwXZuSXo
Message-ID: <CAGb2v653CS4jFNAo+p=-_7wspObh=Cd=pUaSnPA1vu1hegsAOg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] clk: sunxi-ng: a733: Add reset lines
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMjksIDIwMjYgYXQgNzoyOOKAr1BNIEp1bmh1aSBMaXUgPGp1bmh1aS5saXVA
cGlnbW9yYWwudGVjaD4gd3JvdGU6Cj4KPiBBZGQgdGhlIHJlc2V0IGxpbmVzIGZvciB0aGUgQWxs
d2lubmVyIEE3MzMgU29DLiBUaGVzZSByZXNldCBjb250cm9sIGJpdHMKPiBhcmUgaW50ZWdyYXRl
ZCBpbnRvIHRoZSBCdXMgR2F0ZSBSZXNldCAoQkdSKSByZWdpc3RlcnMsIHR5cGljYWxseQo+IHNo
YXJpbmcgdGhlIHNhbWUgcmVnaXN0ZXIgYWRkcmVzcyB3aXRoIHRoZWlyIGNvcnJlc3BvbmRpbmcg
YnVzIGNsb2NrCj4gZ2F0ZXMuIEludGVncmF0ZSB0aGVtIGludG8gdGhlIG1haW4gQ0NVIGRyaXZl
ciB1c2luZyB0aGUgZXhpc3RpbmcKPiBzdW54aS1uZyBjY3VfcmVzZXQgZnJhbWV3b3JrLCBhbGxv
d2luZyB0aGUgQ0NVIHRvIGFsc28gZnVuY3Rpb24gYXMgYQo+IHJlc2V0IGNvbnRyb2xsZXIgZm9y
IHRoZSBTb0MuCj4KPiBUZXN0ZWQtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUu
Y29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBKdW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+
CgpSZXZpZXdlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5lbC5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
