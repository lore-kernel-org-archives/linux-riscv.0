Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF1DC982E6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfFE033VJrqZ2Ih27G/Tri8fCbRrCwekx61U0Zjebr0=; b=Kx24zcJ01/7Lr5
	juVQvfGj6bHokuHrJmL70Ne3bCd0gGmyvEyp9nhaD5pzK8hGrj+oGEpFNVolwz/7HLJYD0azZtNgH
	rZpztsAD1KIo90r6qVZjOnxfkzcFmNkHjnaOBxYFOqhGkq5FSBTpkegdrT9w5D832/l6Uk01BrLHl
	VWRmz9wTT6ohrNBIKOXi3Wdg+1MZ4zns8OeFCavG6+dDnx2ua+/d37Um68DYjFzLhK4teRbm04mDU
	U5JmhNYVoxU8suu5zZgbxMiMwFLfvt0x/RjQPSK7gdmYKdNCMwA4BWImbvD0E00JynQytOB8Vf0gG
	jEiWqd3EHPO0+SqtkS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gT0-00000002lKI-1eHG;
	Mon, 21 Sep 2026 16:02:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gSy-00000002lK2-3qqT
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 16:02:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 60F1443D98
	for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 16:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D921F008A0
	for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006524;
	bh=Eyf5HB7rWUuykO/B4yjrMsebEOm1V7kPMebLHZRCWQY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=MHVHrTUhgy8RLJSB9PCb96C+TwYoxk9OPxsY3WYUd2k1pUPyfhn1jxqcnLx12ZXbI
	 C0zH7D0SYWucL6sTXnsFxG2XnRXG505wid63EKjGDRqyp94l78SpU5yfs9I3E9s5nE
	 WXbF+pUOvv4AWZMdfjgwUSRby/OgOgpSqHRAX4SKAvSMpyq/zbOFoLZ/kYDzgMjRgz
	 ugE5ZMnEKTcPpmROkZHM0DRhibmf7XlTswHDYXcMj4LvmRsBFPTpqMURa/KDisRLaW
	 zz4Rlsh2QivIdiY/m5H9SAaOTlKAURKON3hAb7WOVVqnwGQhoDyprV4XVucAJ/LMi/
	 Hwii7b6VQc6sw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff00b8d8so25548491fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 09:02:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgGc30T70Oxv0jaE2cTbE2LPrGeEp7Ad4xBBY1LtZBPZu73WpmortTSKptnh4PLBTX2wxZoxKUMuSMWA==@lists.infradead.org
X-Gm-Message-State: AFuF++l65/NM2rZ1aIOLdb8D5qxkt7jVN/NjJXzQLdEP6j27lI6tYLQS
	c0fSSdJWz84KZHyOdWGfkMLN4mBJQl5hHr+mO7zovR4AZCuV/U9Peq3QWnJLh+MFNdCeYoL2kS6
	RcdW/+bDKd4Br8MQEWSlLVJGT2rQ2rLQ=
X-Received: by 2002:a05:651c:1443:b0:3a5:afec:9cf9 with SMTP id
 38308e7fff4ca-3a5fbf36939mr24677701fa.7.1790006522575; Mon, 21 Sep 2026
 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech> <20260921-a733-clk-v4-2-9c184ebe9ac1@pigmoral.tech>
In-Reply-To: <20260921-a733-clk-v4-2-9c184ebe9ac1@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 22 Sep 2026 00:01:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v66wbv2W1mcZ_WzKnkgiSYYm89LGR67gYAgsNgSFYw5mfg@mail.gmail.com>
X-Gm-Features: AcwNN1WJSlHI-NjxkeeWhPwtNL0p2-F5vEq-B0J5BRudScG0IjIZ4ZswOa7ekVg
Message-ID: <CAGb2v66wbv2W1mcZ_WzKnkgiSYYm89LGR67gYAgsNgSFYw5mfg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: sunxi-ng: sdm: Add dual patterns support
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

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgMTE6MznigK9QTSBKdW5odWkgTGl1IDxqdW5odWkubGl1
QHBpZ21vcmFsLnRlY2g+IHdyb3RlOgo+Cj4gT24gbmV3ZXIgQWxsd2lubmVyIHBsYXRmb3JtcyBs
aWtlIHRoZSBBNzMzLCB0aGUgU2lnbWEtRGVsdGEgTW9kdWxhdGlvbgo+IChTRE0pIGNvbnRyb2wg
bG9naWMgaXMgbW9yZSBjb21wbGV4LiBUaGUgU0RNIGVuYWJsZSBiaXQsIHdoaWNoIHdhcwo+IHBy
ZXZpb3VzbHkgbG9jYXRlZCBpbiB0aGUgUExMIHJlZ2lzdGVyLCBpcyBub3cgbW92ZWQgdG8gYSBz
ZWNvbmQKPiBwYXR0ZXJuIHJlZ2lzdGVyIChQQVRURVJOMSkuCj4KPiBUbyBzdXBwb3J0IHRoaXMs
IHJlbmFtZSB0aGUgZXhpc3RpbmcgInR1bmluZyIgbWVtYmVycyB0byAicGF0dGVybjAiIHRvCj4g
YWxpZ24gd2l0aCB0aGUgZGF0YXNoZWV0LCBhbmQgaW50cm9kdWNlIHRoZSBfU1VOWElfQ0NVX1NE
TV9EVUFMX1BBVAo+IG1hY3JvIHRvIHByb3ZpZGUgcGF0dGVybjEgcmVnaXN0ZXIgc3VwcG9ydC4g
UmVsYXRlZCBvcGVyYXRpb25zIGFyZSBhbHNvCj4gdXBkYXRlZC4KPgo+IFRlc3RlZC1ieTogSmVy
b21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVuaHVp
IExpdSA8anVuaHVpLmxpdUBwaWdtb3JhbC50ZWNoPgoKUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNh
aSA8d2Vuc0BrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
