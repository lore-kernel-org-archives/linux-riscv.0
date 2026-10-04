Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC80CA5FEC
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Twl54c8vuFy4kLB8qJS7kbKsYPxGdJPxz6ZRV5xhG+I=; b=E7qzal1KpTXPHB
	46zfSOnTO12zKx9R7TnQ3TtjgxflIT0IoHTYN5jDqqZ6qBNITJyEw/mu7ALQSbV6DT5AMTyFNmz9l
	fk5GPahXp6Z/c/TXh7mIHgji/JQ69eTt8pTA17v2YQ+CmTD2wRtKSlZWWimYaleHHTDnSnaoMDbyQ
	z2oF+GdLbeuG87ulWMX6ptDwzTZNJk5ARjPIB5cQJESYAwvsviqKLL3rT/uwKDtm/X60UfrPraqko
	KcE6HMAdWwIwhVKZ4cOPPsUbPsBWYlDzpYY0tHgRkXTAnP/RR8b+We4SnbfH/hh7Y3Zu3hMRDTgdG
	Ii49kOL4fUdPHmPIkWUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJKh-0000000Eeh9-1q89;
	Sun, 04 Oct 2026 10:20:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJKe-0000000Eegb-43oM
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 10:20:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F28F447B8
	for <linux-riscv@lists.infradead.org>; Sun,  4 Oct 2026 10:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 351A21F008BC
	for <linux-riscv@lists.infradead.org>; Sun,  4 Oct 2026 10:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791109236;
	bh=Vl53g7rpe8c2NvDVMufClYtHeiVeKNLfh36+hYUKK2Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=gqt4DRaVUlq3TTRXsfIWM+ZzYYHZ6izGC94e7qbADl0A3FjKHf+5f1eVeRUpRQrZc
	 5DY8JHzmgVqA6kEoot3HwdiD/d1WFwBb48n/s7/ChIUU74xfsCIdfNd36BBWVuQ4TW
	 LQtAiG06km7HbsGvLOX5c5DVettgRpizHcRL1V7iV4RSyAEJc/iV2dS94XP6IzmQcP
	 7R/2fRXXTipw20v9loYNPUVdUid+cxZeqqHzasSLqM0XNZOIdflqUZkikTG6RLt0Qd
	 q+OC4Mrc/1g93NatVhYQYpmDjlxeaHlxONdl6f5dbmUGMgalzDZYohMJ+5F9jXNQLG
	 aGKwPaUyOm5Dw==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a77141826cso9274021fa.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Oct 2026 03:20:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8q2qabbs0VySgg9y31ePqIq/yE5c3HPLujsoL76HB3Ygsv7JMB+IJqOvshKmMDmW+RSXYCJT3QQttIQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIN3eh3IJqMzD7fVI0zgpQ3y1Egl8GeeqhcbUwoQNSOUv59eU4W
	rEbCjzgoQOzToiPkTN80RWAHekOfbWk9UCe2tJOYncd4GRBQtiECRhjMuyj4p8LtD9kw0zDQk+f
	3uDcE27E+0LcOSUw4e4cjNhvyI6cbMcM=
X-Received: by 2002:a05:651c:1505:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a8877ae1c5mr17889201fa.7.1791109234518; Sun, 04 Oct 2026
 03:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-5-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-5-11175b41cd2d@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 4 Oct 2026 12:20:22 +0200
X-Gmail-Original-Message-ID: <CAGb2v66YZtRW=1igjZogmO7qkzOggBDZs6jsE7qnSygrFR8XUw@mail.gmail.com>
X-Gm-Features: AclHuK8lO4-Xwk9IPWxNxJj8KXMJSBu0Tti5GLWoVOI0E89DZO986O0ZYPGFHF4
Message-ID: <CAGb2v66YZtRW=1igjZogmO7qkzOggBDZs6jsE7qnSygrFR8XUw@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] clk: sunxi-ng: a733: Add bus clocks support
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
cGlnbW9yYWwudGVjaD4gd3JvdGU6Cj4KPiBBZGQgdGhlIGVzc2VudGlhbCBidXMgY2xvY2tzIGlu
IHRoZSBBbGx3aW5uZXIgQTczMyBDQ1UsIGluY2x1ZGluZyBBSEIsCj4gQVBCMCwgQVBCMSwgQVBC
X1VBUlQsIGFuZCBNQlVTLiBUaGVzZSBidXNlcyBhcmUgbmVjZXNzYXJ5IGZvciBtYW55IG90aGVy
Cj4gZnVuY3Rpb25hbCBtb2R1bGVzLiBBZGRpdGlvbmFsIGNsb2NrcyBzdWNoIGFzIHRyYWNlIGFu
ZCBnaWMgYXJlIGFsc28KPiBhZGRlZCBhcyB0aGV5IGZhbGwgd2l0aGluIHRoZSByZWdpc3RlciBh
ZGRyZXNzIHJhbmdlIG9mIHRoZSBidXMgY2xvY2tzLAo+IGV2ZW4gdGhvdWdoIHRoZXkgYXJlIG5v
dCBzdHJpY3RseSBidXMgY2xvY2tzLgo+Cj4gVGhlIE1CVVMgY2xvY2sgaXMgbWFya2VkIGFzIGNy
aXRpY2FsIHRvIGVuc3VyZSB0aGUgbWVtb3J5IGJ1cyByZW1haW5zCj4gb3BlcmF0aW9uYWwgYXQg
YWxsIHRpbWVzLiBBbmQgdGhlIGhhcmR3YXJlIHJlcXVpcmVzIGFuIHVwZGF0ZSBiaXQKPiAoYml0
IDI3KSB0byBiZSBzZXQgc28gdGhhdCB0aGUgY29uZmlndXJhdGlvbiB0YWtlcyBlZmZlY3QgYW5k
IHRoZQo+IHVwZGF0ZWQgcGFyYW1ldGVycyBjYW4gYmUgY29ycmVjdGx5IHJlYWQgYmFjayBmb3Ig
dGhlIE1CVVMgY2xvY2suCj4KPiBUaGUgR0lDIGNsb2NrIGlzIGFsc28gbWFya2VkIGFzIGNyaXRp
Y2FsLiBUaGUgYm9vdGxvYWRlciBtYXkgbGVhdmUgdGhlCj4gR0lDIHJ1bm5pbmcgb24gYSBQTEwg
cGFyZW50LCBhbmQgZGlzYWJsaW5nIHRoYXQgUExMIGR1cmluZwo+IGNsa19kaXNhYmxlX3VudXNl
ZCB3b3VsZCBoYW5nIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlciBhbmQgdGhlIHN5c3RlbS4KPgo+
IFRlc3RlZC1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSnVuaHVpIExpdSA8anVuaHVpLmxpdUBwaWdtb3JhbC50ZWNoPgo+IC0tLQo+ICBk
cml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNjBpLWE3MzMuYyB8IDEwNSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjYwaS1hNzMzLmMg
Yi9kcml2ZXJzL2Nsay9zdW54aS1uZy9jY3Utc3VuNjBpLWE3MzMuYwo+IGluZGV4IDQzMGE1MzU5
MTljNi4uZWRhNGIzNDdjNTQwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xrL3N1bnhpLW5nL2Nj
dS1zdW42MGktYTczMy5jCj4gKysrIGIvZHJpdmVycy9jbGsvc3VueGktbmcvY2N1LXN1bjYwaS1h
NzMzLmMKCkkgd291bGQgcHJlZmVyIGNvbW1lbnRzIGhlcmUgZm9yIHRoZSBza2lwcGVkIG92ZXIg
Q1BVX1BFUkkgYW5kIE5TSSBjbG9ja3MuCgpPbmNlIGFkZGVkLAoKUmV2aWV3ZWQtYnk6IENoZW4t
WXUgVHNhaSA8d2Vuc0BrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
