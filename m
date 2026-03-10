Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC33FEFCD9F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86NDnFsi3bKkPbQRW49S7xPNuOXHsa+WacN3oYrmFGM=; b=1eIeyz/X5diBOf
	KrOwXRh9aFVwwq0PYG8CXc7IJZgjv6jF75U6ZNDNhKMaiK5dDCZzUdY+Z0TZ0ictl7lM3IZPo7qrO
	zW5x9s4R14rn/+3GNCijFJBzwkY38ZDoIZ+Q96rSBsCC57pt8Apt5Wc4rwMz4ftm7HlDJjAk6pMW3
	Ema9JGXihaaeDqn6LQBgQeWFqLJf2XNExoy18+z7d5fkC4C45BpHKIBBBjq94Sm0l/cEC30YdKxz4
	1sF9z/R4RbzVd3zf3bp2IYigwWzBLF7ZxZwEn+Y6aaw7Vm0QjTzBNi+FtiKUcwhvNZEr/pErvJGHS
	ORhw4sjsL3wd27KZ03NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt4h-000000092Vz-3SV8;
	Tue, 10 Mar 2026 09:08:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt4e-000000092T7-0tTH;
	Tue, 10 Mar 2026 09:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=x+sKkqEen+FTZVcatdq7BWmJBRObIwAqW8MBSeFsbCg=; b=2P8w16KW4mcJ4VoQcD9GwW+Aaw
	LPnWPTjV+iBSgpGU8VvlZBgivFQ41jbbUv9xPLTe0UGiC2O/TtxW9n87YjtaKXtEvok+d9X3m90n3
	88MyVWdnk4KdCug4lCgmQ65VmF5YA3tIEvuVR5jNAJV+kyyiI3aJ/12D7cJW361aI64t62QfKt+G8
	DpRgtf8aKTCqaf2K91HStN6cfzfIMJzfn16r4ZEdGteuKTcM5375CxPjFb+Zcjq9TyhP53oWNANrb
	QG5VUTphEsm3do+5av7k096Uzt/+LkiRWIWXHy5//oKgMhx3VYbZAmsubGNimoJORazjXzWfE9QP0
	iOm5zq+A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct dereference
 of phy->dev.of_node
Date: Tue, 10 Mar 2026 10:08:07 +0100
Message-ID: <2772778.X9hSmTKtgW@phil>
In-Reply-To: <20260310083752.ms6u4qpy3snl4h6w@skbuf>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com> <2218670.OBFZWjSADL@phil>
 <20260310083752.ms6u4qpy3snl4h6w@skbuf>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020820_252540_E1A53DBC 
X-CRM114-Status: GOOD (  20.56  )
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

QW0gRGllbnN0YWcsIDEwLiBNw6RyeiAyMDI2LCAwOTozNzo1MiBNaXR0ZWxldXJvcMOkaXNjaGUg
Tm9ybWFsemVpdCBzY2hyaWViIFZsYWRpbWlyIE9sdGVhbjoKPiBPbiBUdWUsIE1hciAxMCwgMjAy
NiBhdCAwOToyNDo0M0FNICswMTAwLCBIZWlrbyBTdHVlYm5lciB3cm90ZToKPiA+IEFtIE1vbnRh
ZywgOS4gTcOkcnogMjAyNiwgMjA6MDg6MjggTWl0dGVsZXVyb3DDpGlzY2hlIE5vcm1hbHplaXQg
c2NocmllYiBWbGFkaW1pciBPbHRlYW46Cj4gPiA+IFRoZSBkd19oZG1pLXJvY2tjaGlwIGRyaXZl
ciB2YWxpZGF0ZXMgcGl4ZWwgY2xvY2sgcmF0ZXMgYWdhaW5zdCB0aGUKPiA+ID4gSERNSSBQSFkn
cyBpbnRlcm5hbCBjbG9jayBwcm92aWRlciBvbiBjZXJ0YWluIFNvQ3MgbGlrZSBSSzMzMjguCj4g
PiA+IFRoaXMgaXMgY3VycmVudGx5IGFjaGlldmVkIGJ5IGRlcmVmZXJlbmNpbmcgaGRtaS0+cGh5
LT5kZXYub2Zfbm9kZQo+ID4gPiB0byBvYnRhaW4gdGhlIHByb3ZpZGVyIG5vZGUsIHdoaWNoIHZp
b2xhdGVzIHRoZSBHZW5lcmljIFBIWSBBUEkncwo+ID4gPiBlbmNhcHN1bGF0aW9uICh0aGUgZ29h
bCBpcyBmb3Igc3RydWN0IHBoeSB0byBiZSBhbiBvcGFxdWUgcG9pbnRlcikuCj4gPiA+IAo+ID4g
PiBSZWZhY3RvciBkd19oZG1pX3JvY2tjaGlwX2JpbmQoKSB0byBwZXJmb3JtIGEgbWFudWFsIHBo
YW5kbGUgbG9va3VwCj4gPiA+IG9uIHRoZSAiaGRtaSIgUEhZIGluZGV4IHdpdGhpbiB0aGUgY29u
dHJvbGxlcidzIERUIG5vZGUuIFRoaXMgcHJvdmlkZXMKPiA+ID4gYSBwYXJhbGxlbCBwYXRoIHRv
IHRoZSBjbG9jayBwcm92aWRlcidzIE9GIG5vZGUgd2l0aG91dCByZWx5aW5nIG9uIHRoZQo+ID4g
PiBpbnRlcm5hbCBzdHJ1Y3R1cmUgb2YgdGhlIHN0cnVjdCBwaHkgaGFuZGxlLgo+ID4gPiAKPiA+
ID4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNv
bT4KPiA+ID4gLS0tCj4gPiA+IENjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hpcHMuY29tPgo+
ID4gPiBDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNoLmRlPgo+ID4gPiBDYzogQW5k
eSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+ID4gPiBDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+ID4gQ2M6IE1heGltZSBS
aXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiA+ID4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPgo+ID4gPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWls
LmNvbT4KPiA+ID4gQ2M6IFNpbW9uYSBWZXR0ZXIgPHNpbW9uYUBmZndsbC5jaD4KPiA+ID4gCj4g
PiA+IHYxLT52Mzogbm9uZQo+ID4gPiAtLS0KPiA+IAo+ID4gWy4uLl0KPiA+IAo+ID4gPiBAQCAt
NTg4LDEzICs1ODksMTcgQEAgc3RhdGljIGludCBkd19oZG1pX3JvY2tjaGlwX2JpbmQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsCj4gPiA+ICAJCXJldHVybiBkZXZf
ZXJyX3Byb2JlKGhkbWktPmRldiwgcmV0LCAiZmFpbGVkIHRvIGdldCBwaHlcbiIpOwo+ID4gPiAg
CX0KPiA+ID4gIAo+ID4gPiAtCWlmIChoZG1pLT5waHkpIHsKPiA+IAo+ID4gbml0OiBhIGNvbW1l
bnQgd291bGQgYmUgbmljZSBoZXJlLiBJLmUuIGhkbWktPnBoeSBiZWluZyBhbiBvcGFxdWUgcG9p
bnRlcgo+ID4gc28gY2hlY2tpbmcgaGRtaS0+cGh5ICE9IE5VTEwgaXMgbm90IHBvc3NpYmxlLgo+
ID4gCj4gPiBXaXRoIHRoYXQgYmVpbmcgYSAiZ29hbCIsIEkgYXNzdW1lIHRoYXQgaW5mb3JtYXRp
b24gaXMgbm90IHdpZGVseSBzcHJlYWQKPiA+IHNvIHRoaXMgd291bGQgcHJldmVudCB0aGUgbmV4
dCBkZXZlbG9wZXIgdHJ5aW5nIHRvIGNoYW5nZSBpdCBiYWNrIHRvCj4gPiAiaWYgKGhkbWktPnBo
eSkiIHdoaWxlIHRoYXQgaGFuZGxpbmcgY2hhbmdlIHRyaWNrbGVzIGRvd24uCj4gCj4gVGVzdGlu
ZyB0aGUgTlVMTCBxdWFsaXR5IG9mICJzdHJ1Y3QgcGh5ICpwaHkiIGlzIHN0aWxsIHBvc3NpYmxl
IGFuZCBsZWdhbC4KPiBJdCBtZWFucyB0aGF0IHlvdSBjYWxsZWQgYW4gIm9wdGlvbmFsIiB2YXJp
YW50IG9mIHBoeV9nZXQoKSwgYW5kIHRoZXJlCj4gd2FzIG5vIFBIWS4KCm9rLCBJJ2xsIGtlZXAg
dGhhdCBpbiBtaW5kIDotKQoKCkhlaWtvCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
