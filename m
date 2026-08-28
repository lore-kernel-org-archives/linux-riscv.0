Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA16C61DCB
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 14:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdQzlk98yd/EjCouCdoT7ijhj0yGau+Bd14qSmQSeMQ=; b=NfGsbapr2/IClR
	YrgfpDNuQwllvqiSETHjWBQRymWMy7K2B3PHKZSH1CqmFlqOT6t+/37OIulPwzSXfz426ytdi2GFF
	RDeSwX/hMrZ+RxiFNoHYOrFhuC0ZvjG3+k7aY1AsS6cOafvMICzvKPh60kDpQyXJaoqngga+uoxna
	O/zF8fAM4AZaf/sf9QY1ZHlQaBK2zzHZipU7l+9fAbDP4tmTALfqd2peRHh/nHy5gCGCYU5LI3orI
	09vngSAsBVSaWbfK5TgY5zr075uCS+uywAA5l/oT4ICO6C3iyScFe/j+WmKMdaGsZYJmYjPrR92j7
	KyEEApJdjm+sENZSLX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxBa-00000005w1N-1leB;
	Fri, 28 Aug 2026 14:04:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxBY-00000005w0P-3tyc;
	Fri, 28 Aug 2026 14:04:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AcXzEC2kuqIzhwnq20y2zRMGD6N0f33XkiLL/jNqsGw=; b=OwubmXW4yoaJ3CmmqNBBOlRyMY
	eZJipBo7hsjNBK0renEcTTgPKaBf9aOVxJ1VRNzjQiGeeF2jGiBe0tXVDIaVkRAlcpXgFDS2wM9Ji
	lqxKE9nIIt0rwmRHttahPA6ywZMhMauXp6F3NVBMeJYK1J8+qgsFRQGKpysaKsDUo3FfhvdPjx/uP
	QVU+GV5N49HGz80xCfxwKLjagiCpErLIrSi9n0FzMwQwtQxqT1Wx5RBIDXIxLpKlYfwjDEc6iAhEh
	uIlUQsrKq2vzYzYfbUKoJUjFXyY73cgII8UqxVeHipcGbI2fJ0RkOKbiCZ17Akqo7AqAfeIicbc3O
	Z06XWVjQ==;
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wzxBV-00000008IlL-45A8;
	Fri, 28 Aug 2026 14:03:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1787925747; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CkdrSK+t6z6SdsXa/+YswjsfkKz6vkB7f4zOJZiGd/L0A5xCXZtK8CSfDkxjidRWoQAJU0Tcipu6SkLnpkIE8/5zPL1C7qQe9PDTrCyPI5UZtlQ5sxKV4cm+f0zWEYN8lILhsJbgj2N6OdH2ET/HDnC35HZJO/yOV95UPbn8wzg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787925747; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AcXzEC2kuqIzhwnq20y2zRMGD6N0f33XkiLL/jNqsGw=; 
	b=FJ+T2YzD+KAu4aq1ICrOUu7v8JNEfoEmTq3OoYQ7mx3N3Y1jMWnmrEbjIeAf2RX3wvKetzJfHkgHcICyfCH3lwJmTJqtZODehgO830XRLNNUxLvVGD38K370k2Ed6py7WDCSoQRKl/PnpjJMXHQJtYG1Dg0kgTmA9o8ri0Bf8Ks=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787925747;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=AcXzEC2kuqIzhwnq20y2zRMGD6N0f33XkiLL/jNqsGw=;
	b=dkbPNzY0Ew4xwpeqis9CoFDU6p+GAyjuPvJyBTFv3WIcYF/zhG7b/QntFccUgGti
	Ik7KORNmkF7/EWl9I+Vaf5BJqKyPWmgXdlVc4xqLQ/MZAWyJMAR7kynyWndqlg/N6F5
	4+JVm9l6Pd9mZlqPj0Z9jfj0DDpnTawRWbQH8BwZAGL7kbTyU+DYhc4lDTjeA6KTHn2
	QY9nMcrAYUw3FPBGld8Q21fXAeB8gnIYSZMvcK0vMeyQ19Aov1Uzh/kfSKK+wpe0nOB
	TWinRhJEuMh6/nVMromEWrT5RSRoXfpZ4/ZbqWVEoR0g08S6rZwgptEUL3d+GRkEkTk
	IFMcGy8jeQ==
Received: by mx.zohomail.com with SMTPS id 1787925743638449.66154944275536;
	Fri, 28 Aug 2026 07:02:23 -0700 (PDT)
Message-ID: <d64ff3f2a03473e4263e2f68823c2cb0f7fd1599.camel@icenowy.me>
Subject: Re: [PATCH v2 15/15] MAINTAINERS: Add StarFive JH7110 display
 subsystem entry
From: Icenowy Zheng <uwu@icenowy.me>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Andrzej Hajda	 <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, David Airlie	 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
 Yan <andy.yan@rock-chips.com>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng	
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko
 Stuebner <heiko@sntech.de>,  Conor Dooley <conor@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
 Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
 Szyprowski	 <m.szyprowski@samsung.com>, Maud Spierings
 <maudspierings@gocontroll.com>,  Graham Markall <hello@big-grey.co.uk>
Date: Fri, 28 Aug 2026 22:01:58 +0800
In-Reply-To: <20260828-jh7110-clean-send-v2-15-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
		<CGME20260828134841eucas1p100590973cc6808103c41d0b0fc82573a@eucas1p1.samsung.com>
	 <20260828-jh7110-clean-send-v2-15-331680c8b9d1@samsung.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_150358_250030_590E6275 
X-CRM114-Status: UNSURE (   9.58  )
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

5ZyoIDIwMjYtMDgtMjjkupTnmoQgMTU6NDcgKzAyMDDvvIxNaWNoYWwgV2lsY3p5bnNraeWGmemB
k++8mgo+IFRoZSBKSDcxMTAgZGlzcGxheSBzdWJzeXN0ZW0gc3BhbnMgYSBQSFkgZHJpdmVyLCBh
IERSTSBicmlkZ2UgZHJpdmVyLAo+IGEgcGFyZW50IGRldmljZSBhbmQgdGhlaXIgYmluZGluZ3Ms
IGFuZCBoYXMgbm8gZXhpc3RpbmcgbWFpbnRhaW5lcgo+IGVudHJ5Lgo+IAo+IEFkZCBhbiBlbnRy
eSBjb3ZlcmluZyB0aGVtIHNvIHBhdGNoZXMgcmVhY2ggc29tZW9uZSB3aG8gY2FuIHJldmlldwo+
IHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNr
aUBzYW1zdW5nLmNvbT4KPiAtLS0KPiDCoE1BSU5UQUlORVJTIHwgMTAgKysrKysrKysrKwo+IMKg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvTUFJTlRB
SU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4Cj4gODAxNGI5ZjgyNTNlZGYxNTIzMWRmMjE1ZDFi
MTQwNjNhNTRhNTVlYy4uODRhYzVjZmU2MWNkZjc3NTE2N2NmOTAzMzg2Cj4gMjcyNGMzNzk0NmE1
ZiAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTI1
Nzc4LDYgKzI1Nzc4LDE2IEBAIFM6CU1haW50YWluZWQKPiDCoEY6CURvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLQo+IGR3bWFjLnlhbWwKPiDCoEY6
CWRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0YXJmaXZlLmMKPiDC
oAo+ICtTVEFSRklWRSBKSDcxMTAgRElTUExBWSBTVUJTWVNURU0KPiArTToJTWljaGFsIFdpbGN6
eW5za2kgPG0ud2lsY3p5bnNraUBzYW1zdW5nLmNvbT4KCkZlZWwgZnJlZSB0byBhZGQKCmBgYApS
OiBJY2Vub3d5IFpoZW5nIDx6aGVuZ3hpbmdkYUBpc2Nhcy5hYy5jbj4KYGBgCgppZiB5b3Ugd2Fu
dC4gSSBhbSBpbnRlcmVzdGVkIGluIHRoaXMuCgpUaGFua3MsCkljZW5vd3kKCj4gK1M6CU1haW50
YWluZWQKPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL3N0YXJmaXZlLGpoCj4gNzExMC1pbm5vLWhkbWktY29udHJvbGxlci55YW1sCj4gK0Y6CURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3RhcmZpdmUsamg3MTEwLWhkbWkt
Cj4gc3Vic3lzdGVtLnlhbWwKPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BoeS9zdGFyZml2ZSxqaDcxMTAtaW5uby0KPiBoZG1pLXBoeS55YW1sCj4gK0Y6CWRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvamg3MTEwLWlubm8taGRtaS5jCj4gK0Y6CWRyaXZlcnMvcGh5L3N0YXJm
aXZlL3BoeS1qaDcxMTAtaW5uby1oZG1pLmMKPiArRjoJZHJpdmVycy9zb2Mvc3RhcmZpdmUvamg3
MTEwLWhkbWktc3Vic3lzdGVtLmMKPiArCj4gwqBTVEFSRklWRSBKSDcxMTAgRFBIWSBSWCBEUklW
RVIKPiDCoE06CUphY2sgWmh1IDxqYWNrLnpodUBzdGFyZml2ZXRlY2guY29tPgo+IMKgTToJQ2hh
bmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
