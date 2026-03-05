Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D03F30946
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lw2jZud+kLOZWQOd5F/ugc2t4xi9AKhndRzidzKS09Y=; b=GJ7wYygDWZX49m
	8cauWnhi1RhVPrsCybnqD6mDugWuVZuTmrYMuFvFRJVTjcJhZ+ReO/I5uMHWzMLtkjIDuWe2Tqhma
	1hdcAsPqImP681yDnCGC7gSbZT2ZFSE0WktV5nZftZASnr0kKiNSbUBj3ZyjS0BEyOAOaWn5idWpp
	HPo4fD+hdg41DN8XIb0aLkBqFhvWb5uv52hK84TYyPuMXpJq7McLwpBexB4LCx2jFagyhgd2mG8T/
	LKRcROWNXVfQdPBwFZ1Ak3Inzwc9HothT1EW6AfhIaJTYWcwMMVKNzRH7EP/2O2M1sfiE9ej9mvuJ
	Q8Czbp+jP4Cfff5/Emyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy84X-00000001nrj-2spA;
	Thu, 05 Mar 2026 12:44:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy84V-00000001nqq-2K7s
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 12:44:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD11961340
	for <linux-riscv@lists.infradead.org>; Thu,  5 Mar 2026 12:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618B0C2BCB1
	for <linux-riscv@lists.infradead.org>; Thu,  5 Mar 2026 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772714694;
	bh=7/B3L3Xu38pLEI9aWzEuoVdxX7Qp2NIDeM+Gg1/xjBI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OtqYMvb5oPxe5sMzeuWM/p9QhfY79P8WSa8Oc0dmxSoFCqAxC+CeiyJ4NR/CKYXp5
	 2pWsVJ/8dTjJPaOTsMOrLWg9QrWyIT17qWYKoWkp2uev1+hKn84FX5s0QnjAl8bNE/
	 7JpPIBkXPhGvuxF9NkQde6xY7s3+z78cNibHOOJcW8DPll2R+OOPS/ZPgglANmm0bm
	 z+fq9gwNqWVY2cpjU7AjP46t/Fi3qyyprLoCv6ETr3JC7/UsdbQoEj4fnlA7mjJ3u9
	 kpBnTLkqR3bbedcx3T7TtOd2iumdT2sN3/QFxWt88OY6wGjq0mmb5qwwhn72EVc8bD
	 zEhwMty5ybC+w==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64c9fcc24b3so6000328d50.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 04:44:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXPBnELy9bpE46f8YN2xLBkr1nfrNWQzvPEkK/ZYz1e7Cj+epV/kGFzTLLev+a5PNc9Be/lmi2PuxKYkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6yBId9y2bGjqGW67QO8tRhmfD72YcxX6Kz3eDYvppNpC5UN7T
	OomYJMNernog0qIPBXeAMEU8XfMQzaSOWQiSfzPhedXz8xpmA/kiCZxmtfZh3phnVqcFnmAVol8
	sbuYZ1zPUpWblmLO2bNeyZZ+izY3Rhns=
X-Received: by 2002:a05:690e:1a12:b0:649:5a6e:bc88 with SMTP id
 956f58d0204a3-64cf9bac208mr3552462d50.46.1772714693758; Thu, 05 Mar 2026
 04:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-19-vladimir.oltean@nxp.com> <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
In-Reply-To: <CAD++jLnCtu20rXcg7sMVLBi24EohscJoz0kN46XJaKPJt00O2w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Mar 2026 13:44:42 +0100
X-Gmail-Original-Message-ID: <CAD++jL=m+cEcqy1i2H0tdeBa3Sy76myGAR9HdBqrT4u-x5v50A@mail.gmail.com>
X-Gm-Features: AaiRm53u9phsGhzUDeKiqEnTp_X3DfbqaQ7dJ0SVurbn78IH1263DExaHPtG4YM
Message-ID: <CAD++jL=m+cEcqy1i2H0tdeBa3Sy76myGAR9HdBqrT4u-x5v50A@mail.gmail.com>
Subject: Re: [PATCH phy-next 18/22] pinctrl: tegra-xusb: include PHY provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCAxOjQz4oCvUE0gTGludXMgV2FsbGVpaiA8bGludXN3QGtl
cm5lbC5vcmc+IHdyb3RlOgo+IE9uIFdlZCwgTWFyIDQsIDIwMjYgYXQgNzowMOKAr1BNIFZsYWRp
bWlyIE9sdGVhbiA8dmxhZGltaXIub2x0ZWFuQG54cC5jb20+IHdyb3RlOgo+Cj4gPiBUaGUgdGVn
cmEteHVzYiBwaW5jdHJsIGRyaXZlciBpcyBhbHNvIGEgUEhZIHByb3ZpZGVyIChjYWxscwo+ID4g
ZGV2bV9waHlfY3JlYXRlKCkgZm9yIFBDSWUgYW5kIFNBVEEpLiBIb3dldmVyLCBhY2NvcmRpbmcg
dG8gVmlub2QgS291bCwKPiA+IGhhdmluZyBQSFkgcHJvdmlkZXIgZHJpdmVycyBvdXRzaWRlIG9m
IGRyaXZlcnMvcGh5LyBpcyBkaXNjb3VyYWdlZCwKPiA+IGFsdGhvdWdoIGl0IHdvdWxkIGJlIGRp
ZmZpY3VsdCBmb3IgbWUgdG8gYWRkcmVzcyBhIHByb3BlciBtb3ZlbWVudCBoZXJlLgo+ID4KPiA+
IEluY2x1ZGUgdGhlIHByaXZhdGUgcHJvdmlkZXIgQVBJIGhlYWRlciBmcm9tIGRyaXZlcnMvcGh5
LywgYnV0IGxlYXZlIGEKPiA+IEZJWE1FIGluIHBsYWNlLiBJdCB3aWxsIGhhdmUgdG8gYmUgbW92
ZWQsIGV2ZW50dWFsbHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2
bGFkaW1pci5vbHRlYW5AbnhwLmNvbT4KPgo+IEZhaXIgZW5vdWdoLCBpcyB0aGlzIGEgcmVncmVz
c2lvbiBzbyBJIHNob3VsZCBtZXJnZSBpdCBmb3IgZml4ZXMKPiBvciBqdXN0IGEgbm9udXJnZW50
IGZpeCB0aGF0IEkgY2FuIGFwcGx5IGZvciBuZXh0PwoKU29ycnkgSSByZWFsaXplZCBpdCBuZWVk
cyB0byBnbyBpbiB3aXRoIHRoZSBzZXJpZXMuClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51c3dAa2VybmVsLm9yZz4KCllvdSBjYW4gdGFrZSBpdCBmcm9tIGhlcmUuCgpZb3VycywKTGlu
dXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
