Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB2EC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Z5oW6JAfqoO3Wnyupt3N9HStA9ddMDFd2I7rPTXbQU=; b=t3K2FWGYIUJsqa
	CKNtAO8HV/E8UxQQheXK9G1hRUUXOSuPVYNyjchw2b1L674VbahqTQQhVxEWEmcL54UHo7qjAkdTW
	eCCW6VVKW98vVt+4bHGqqM4Y3jA8JlKJzqG+ryJ/5rU2QL/xQmh1zwA47lhmj8KaQRWPbJQDr2lae
	rOd4iJHGKrjyzoKZWbQ/evpMVlny4Jjl54hJ6FnQdifARLkdD/3avT+xouQ3RNSK8QaucqYvukijk
	xBehG3XGLAIb4iv1mpjvOu1IOXQVY+eTxcmJQSFVI9J1BFoJ4cXnr3CpQue2SPZ7Qr7SqqCvF7rR5
	jIyrTNMOuDIpEN6075Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDZi-00000005E4u-37Z6;
	Fri, 10 Jul 2026 15:55:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDZh-00000005E2l-0KUW;
	Fri, 10 Jul 2026 15:55:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D03E41944;
	Fri, 10 Jul 2026 15:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3C31F000E9;
	Fri, 10 Jul 2026 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783698935;
	bh=SuBn+qM9tZrJlvXW+nzoxQ4e9HtFDIaF9zBrPfyVFeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UPenvW+mFXYRa5Xjsm6aXAqYufOqCJ5V7fxPkJr2mIKaD/B0InGGoaeo1ry1282gY
	 AKm5H+mLP65IpFPClBzRBZkk1fVyz+2KA6R4USZWlbw3NxAH1sCRKDSuxbd5xRWFoe
	 qG/9OoIrV5HUXKI0DQSKkd8vxf+nCDV6NZpa7GSZJtpHqyQzFJcA+EcpyJbc/YfGMC
	 ss0/TyqbVZdom5eYeAoAIDtmYbVvZntsEud+VeGpomsb648OJ3lhr6X1B64K/dkdK1
	 AKoIEXnVP11RNyMIAsXL6yCd1UhMyxG9mx6yfj7Fk92OCkFdnzvZhI+i8410pJGon1
	 lY1HoUNgUt8yg==
Date: Fri, 10 Jul 2026 08:55:33 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: Re: [PATCH 11/12] riscv: dts: thead: Add Lichee Pi 4A IO expansions
Message-ID: <alEV9XJ2pr23CJ3B@gen8>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-12-zhengxingda@iscas.ac.cn>
 <b8fc8356212012d92186a1a4cd3ad641f01461a6.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8fc8356212012d92186a1a4cd3ad641f01461a6.camel@icenowy.me>
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

T24gRnJpLCBKdWwgMTAsIDIwMjYgYXQgMTA6NTY6MDhQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNi0wNS0wN+Wbm+eahCAxNjoxNyArMDgwMO+8jEljZW5vd3kgWmhlbmfl
hpnpgZPvvJoKPiA+IEZyb206IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0
aGluZ0BjYW5vbmljYWwuY29tPgo+ID4gCj4gPiBMaWNoZWUgUGkgNEEgaGFzIDMgSTJDIElPIGV4
cGFuc2lvbiBjaGlwcyBvbmJvYXJkLCBjb25uZWN0ZWQgdG8gdGhlCj4gPiBJMkMwLzEvMyBidXNz
ZXMuCj4gPiAKPiA+IEFkZCBkZXZpY2UgdHJlZSBub2RlcyBmb3IgdGhlbS4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcKPiA+IDxlbWlsLnJlbm5lci5iZXJ0aGlu
Z0BjYW5vbmljYWwuY29tPgo+ID4gW0ljZW5vd3k6IGFkZGVkIGNvbW1pdCBkZXNjcmlwdGlvbl0K
PiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNu
Pgo+IAo+IEkgYW0gZ29pbmcgdG8gc2VuZCBhIG5ld2VyIHJldmlzaW9uIG9mIFBBVENIIDl+MTEg
aW4gYSBmZXcgZGF5cywKPiBiZWNhdXNlIHRoZSBJMkMxIGNvbnRyb2xsZXIgaXMgYWxyZWFkeSBh
ZGRlZCB0byB0aGUgbWFpbmxpbmUgZGV2aWNlCj4gdHJlZSBmb3IgV2ktRmkgc3VwcG9ydCwgYWx0
aG91Z2ggdGhlIGFscmVhZHktbWVyZ2VkIHBhdGNoZXMgYXJlIGEKPiBsaXR0bGUgd2VpcmQuCgpU
aGFua3MsIHRoYXQgd291bGQgYmUgZ3JlYXQgaWYgeW91IGNhbiBzdWJtaXQgdGhlIHNlcmllcyBh
Z2Fpbi4gSSdsbAptYWtlIHN1cmUgdG8gcHJvbXB0bHkgcmV2aWV3IHRoaXMgdGltZSBhcyBpdCB3
b3VsZCBiZSBnZXQgdG8gaGF2ZSBVU0IKc3VwcG9ydCB1cHN0cmVhbS4gSG9wZWZ1bGx5IHRoZXJl
IGlzIGEgd2F5IHRvIGNvbmZpZ3VyZSBJMkMxIHNvIHRoYXQgaXQKd29ya3MgZm9yIGJvdGggVVNC
IGFuZCBXaUZpIG1vZHVsZS4KCkRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
