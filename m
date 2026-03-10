Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA36FCC9DE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 08:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uISE7KIsDX1tgvVxbmvG2WiForCV9qDlJdd2j9zItgQ=; b=J5HH5mM1nMo5LC
	gm5V5pjX6E6zNXUaErBN/eSPmz9Bb02W4Y/gCIY55e7EZL8lw8dD4CnegzUDlhxtFUkYL9xiKBbg4
	45Jyt7Uyw+037s0zl/RQ4oX+NYhSs2aOCZLH37M6ToE2Ko7G0xjUG/5+TojSD+jfQ8Ft3ooqi/1VT
	nwZ2ysSNOHFJ9VXCfzcgmjDUQBwZJ5wQInPJg231BMcSsYvG0dEFRpjLu4rccwNyFQGib6W+bo89F
	2gxYPJuW7RGfxGl59KlkfAnTHMycZFob5h2fIhTWLBeQDt18O1+ij6ML8vsGF7MpOTLQyIqg4VRnn
	4j0GH+1kosOMMi6QVyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsOg-00000008wFC-1wJW;
	Tue, 10 Mar 2026 08:24:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsOe-00000008wD9-0ULN;
	Tue, 10 Mar 2026 08:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=2W8R6JKoSWBQ/NVWe1VH8DTpdfOcfJODkzczD104anE=; b=JuC/yhxDoPy5BzKCllx+4lcx/F
	aT/7U8Uk8l3EzePnMXUbbxXawsxzRHryg8fghP2VOHv5kHVBckllNBimOOiJ0d8LfnHjtGmniMUoP
	q+tI4zY5GQIiNsEUe+qxnask3JoIfvvZdpBRFnoZGdldxQgpw2opTa6+/x5nJBA//K40leHf2j3eZ
	QL1kjydLamseRW0i8hF8yC9BA+ISD2o9MPNpUsGC0DfntkB9k4h7pa/Fd+8ADCPiSf0DDEzQCBI5M
	9HJQrDTSAcTC9UmZ18rrV1bkPrtisS78iMGtNExAIokgAvG70PlOoOoPpo/Lna+ZPaU1pgFFTLn9P
	iDkZROYQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-phy@lists.infradead.org, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v3 phy-next 10/24] drm/rockchip: dw_hdmi: avoid direct dereference
 of phy->dev.of_node
Date: Tue, 10 Mar 2026 09:24:43 +0100
Message-ID: <2218670.OBFZWjSADL@phil>
In-Reply-To: <20260309190842.927634-11-vladimir.oltean@nxp.com>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
 <20260309190842.927634-11-vladimir.oltean@nxp.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_012456_159317_F0DF1613 
X-CRM114-Status: GOOD (  13.16  )
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

QW0gTW9udGFnLCA5LiBNw6RyeiAyMDI2LCAyMDowODoyOCBNaXR0ZWxldXJvcMOkaXNjaGUgTm9y
bWFsemVpdCBzY2hyaWViIFZsYWRpbWlyIE9sdGVhbjoKPiBUaGUgZHdfaGRtaS1yb2NrY2hpcCBk
cml2ZXIgdmFsaWRhdGVzIHBpeGVsIGNsb2NrIHJhdGVzIGFnYWluc3QgdGhlCj4gSERNSSBQSFkn
cyBpbnRlcm5hbCBjbG9jayBwcm92aWRlciBvbiBjZXJ0YWluIFNvQ3MgbGlrZSBSSzMzMjguCj4g
VGhpcyBpcyBjdXJyZW50bHkgYWNoaWV2ZWQgYnkgZGVyZWZlcmVuY2luZyBoZG1pLT5waHktPmRl
di5vZl9ub2RlCj4gdG8gb2J0YWluIHRoZSBwcm92aWRlciBub2RlLCB3aGljaCB2aW9sYXRlcyB0
aGUgR2VuZXJpYyBQSFkgQVBJJ3MKPiBlbmNhcHN1bGF0aW9uICh0aGUgZ29hbCBpcyBmb3Igc3Ry
dWN0IHBoeSB0byBiZSBhbiBvcGFxdWUgcG9pbnRlcikuCj4gCj4gUmVmYWN0b3IgZHdfaGRtaV9y
b2NrY2hpcF9iaW5kKCkgdG8gcGVyZm9ybSBhIG1hbnVhbCBwaGFuZGxlIGxvb2t1cAo+IG9uIHRo
ZSAiaGRtaSIgUEhZIGluZGV4IHdpdGhpbiB0aGUgY29udHJvbGxlcidzIERUIG5vZGUuIFRoaXMg
cHJvdmlkZXMKPiBhIHBhcmFsbGVsIHBhdGggdG8gdGhlIGNsb2NrIHByb3ZpZGVyJ3MgT0Ygbm9k
ZSB3aXRob3V0IHJlbHlpbmcgb24gdGhlCj4gaW50ZXJuYWwgc3RydWN0dXJlIG9mIHRoZSBzdHJ1
Y3QgcGh5IGhhbmRsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBPbHRlYW4gPHZsYWRp
bWlyLm9sdGVhbkBueHAuY29tPgo+IC0tLQo+IENjOiBTYW5keSBIdWFuZyA8aGpjQHJvY2stY2hp
cHMuY29tPgo+IENjOiAiSGVpa28gU3TDvGJuZXIiIDxoZWlrb0BzbnRlY2guZGU+Cj4gQ2M6IEFu
ZHkgWWFuIDxhbmR5LnlhbkByb2NrLWNoaXBzLmNvbT4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3Qg
PG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8
bXJpcGFyZEBrZXJuZWwub3JnPgo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4KPiBDYzogU2lt
b25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPgo+IAo+IHYxLT52Mzogbm9uZQo+IC0tLQoKWy4u
Ll0KCj4gQEAgLTU4OCwxMyArNTg5LDE3IEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9yb2NrY2hpcF9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAo+ICAJCXJldHVy
biBkZXZfZXJyX3Byb2JlKGhkbWktPmRldiwgcmV0LCAiZmFpbGVkIHRvIGdldCBwaHlcbiIpOwo+
ICAJfQo+ICAKPiAtCWlmIChoZG1pLT5waHkpIHsKCm5pdDogYSBjb21tZW50IHdvdWxkIGJlIG5p
Y2UgaGVyZS4gSS5lLiBoZG1pLT5waHkgYmVpbmcgYW4gb3BhcXVlIHBvaW50ZXIKc28gY2hlY2tp
bmcgaGRtaS0+cGh5ICE9IE5VTEwgaXMgbm90IHBvc3NpYmxlLgoKV2l0aCB0aGF0IGJlaW5nIGEg
ImdvYWwiLCBJIGFzc3VtZSB0aGF0IGluZm9ybWF0aW9uIGlzIG5vdCB3aWRlbHkgc3ByZWFkCnNv
IHRoaXMgd291bGQgcHJldmVudCB0aGUgbmV4dCBkZXZlbG9wZXIgdHJ5aW5nIHRvIGNoYW5nZSBp
dCBiYWNrIHRvCiJpZiAoaGRtaS0+cGh5KSIgd2hpbGUgdGhhdCBoYW5kbGluZyBjaGFuZ2UgdHJp
Y2tsZXMgZG93bi4KCgphcGFydCBmcm9tIHRoYXQ6CgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJl
ciA8aGVpa29Ac250ZWNoLmRlPgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
