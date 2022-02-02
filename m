Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60417C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 12:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R23//P6QSzd0vnJ6bvK1HBE6dG2+PVGwKwYcssuYTu0=; b=v1tFjpR8Try8dU
	9mHutD1XzTxcb7hyA7tAVaGp382wm7mN7y7gpwZH1xXU8gF3SyrGAM4aE1htKQtLqnYCj1/vYMXgs
	mbGLpqhdBi5Y0GuBK8RIgI9SVu6WVBBk/xiRffqs+uf8vrP2IV7gVZjMN6VEllTWe+PT0zElOP6LZ
	ednDff8zlefX0moO4oLOThWv57PyNmyBj9/YgYsOAlLpGwggwRYOQX7odtg1jT3c0Ger/ZSGuISoU
	xuMRG+dchKRVG0/RJMJljAf3S9Gg7FKFyOm3cM7RqJ/jLXnHTR8dYX7S11x9HBVbdjTshoAXJ+AOd
	OiXggSVA+R/ZOVfLCE2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFEpa-00FCDE-H3; Wed, 02 Feb 2022 12:33:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFEpX-00FCBx-Eh
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 12:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643805227; x=1675341227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pYU5FQ/JJWkjarXsj92sSCMadMJ6TFecm/dnACqqyys=;
 b=eTwogCKoN7jco5c4vyq4RCSLBfGGKpPI11oS9v6AN9CG0LJYYWHwKucU
 VeRtbbnEiGqUbX4n5mLIZwS/W6b42qB1saGaZ+3KanWH9o8CoXCDgqmHh
 0BIkuxF6hXWRU8hk7/LqmK/rPlHEIPx9g+nMcAa1B3ah+e8gAxvLcehV7
 eF1r2aLgflWQ0u+WtNkJ9szOc0IHi50zTWKGbNhkqoV/kRa6OO0leESoo
 nRQ+bInJ9y6gGy+HjU1Q5Q/Tt9Qkg3Z3Les9KWISbqar8RGMWhfzyJh3i
 7+9KV3fzwYhj+cePaaSAie7hDdhT8lEceXz/AP930a93BycT8hprTweFM g==;
IronPort-SDR: 7qsMJQHHrSrSYB0Ug6RqvefqkDO/1rpW2F8FImVYsrFCggq/PkQsFp8t6dqRd793Kkh+LWK/Kx
 qJXzVACrhS7xv/wVVLoS2LiyrKVuVh7XRkqovfvSC8NmWk9AZVkD7hgU8ORzs24uvg1+tCcRP0
 3kgF7T7W3YW5ZI+F46sXem9DOtP+QJx0gOi3hhbzJa+P6kHf2loRnmb6sWeeDjwp6buaByh7dD
 Rm1M8H30CQxwbJU9Oo5HQCOgTRQQ81sfpKjgKI94BPJx1XCeA8loaeg6ZsYTTopbeOMsXxsHB8
 IiSzX6vH01VBzn4LwAK/KCL7
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="147376453"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Feb 2022 05:33:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 2 Feb 2022 05:33:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 2 Feb 2022 05:33:39 -0700
From: <conor.dooley@microchip.com>
To: <u.kleine-koenig@pengutronix.de>
CC: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <aou@eecs.berkeley.edu>, <atishp@rivosinc.com>, <bin.meng@windriver.com>,
 <brgl@bgdev.pl>, <conor.dooley@microchip.com>,
 <daire.mcnamara@microchip.com>, <devicetree@vger.kernel.org>,
 <geert@linux-m68k.org>, <heiko@sntech.de>, <ivan.griffin@microchip.com>,
 <jassisinghbrar@gmail.com>, <krzysztof.kozlowski@canonical.com>,
 <lee.jones@linaro.org>, <lewis.hanly@microchip.com>,
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-rtc@vger.kernel.org>, <palmer@dabbelt.com>,
 <paul.walmsley@sifive.com>, <robh+dt@kernel.org>, <robh@kernel.org>,
 <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 06/12] dt-bindings: pwm: add microchip corepwm binding
Date: Wed, 2 Feb 2022 12:35:44 +0000
Message-ID: <20220202123542.3721512-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
References: <20220201075824.aixrvkvmjde2ihxx@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_043347_605720_EFC66940 
X-CRM114-Status: GOOD (  18.52  )
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

Pk9uIDAxLzAyLzIwMjIgMDc6NTgsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+PiBFWFRFUk5B
TCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlv
dSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4gT24gTW9uLCBKYW4gMzEsIDIwMjIgYXQgMTE6
NDc6MjFBTSArMDAwMCwgY29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+IEZyb206
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+Cj4+IEFkZCBkZXZp
Y2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIE1pY3JvY2hpcCBmcGdhIGZhYnJpYyBiYXNlZCAiY29y
ZSIgUFdNCj4+IGNvbnRyb2xsZXIuCj4+Cj4+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9i
aEBrZXJuZWwub3JnPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+PiAtLS0KPj4gLi4uL2JpbmRpbmdzL3B3bS9taWNyb2NoaXAs
Y29yZXB3bS55YW1sICAgICAgIHwgNzUgKysrKysrKysrKysrKysrKysrKwoKPHNuaXA+Cgo+PiAr
ICBtaWNyb2NoaXAsc3luYy11cGRhdGU6Cj4+ICsgICAgZGVzY3JpcHRpb246IHwKPj4gKyAgICAg
IEluIHN5bmNocm9ub3VzIG1vZGUsIGFsbCBjaGFubmVscyBhcmUgdXBkYXRlZCBhdCB0aGUgYmVn
aW5uaW5nIG9mIHRoZSBQV00gcGVyaW9kLgo+PiArICAgICAgQXN5bmNocm9ub3VzIG1vZGUgaXMg
cmVsZXZhbnQgdG8gYXBwbGljYXRpb25zIHN1Y2ggYXMgTEVEIGNvbnRyb2wsIHdoZXJlCj4+ICsg
ICAgICBzeW5jaHJvbm91cyB1cGRhdGVzIGFyZSBub3QgcmVxdWlyZWQuIEFzeW5jaHJvbm91cyBt
b2RlIGxvd2VycyB0aGUgYXJlYSBzaXplLAo+PiArICAgICAgcmVkdWNpbmcgc2hhZG93IHJlZ2lz
dGVyIHJlcXVpcmVtZW50cy4gVGhpcyBjYW4gYmUgc2V0IGF0IHJ1biB0aW1lLCBwcm92aWRlZAo+
PiArICAgICAgU0hBRE9XX1JFR19FTiBpcyBhc3NlcnRlZC4gU0hBRE9XX1JFR19FTiBpcyBzZXQg
YnkgdGhlIEZQR0EgYml0c3RyZWFtIHByb2dyYW1tZWQKPj4gKyAgICAgIHRvIHRoZSBkZXZpY2Uu
Cj4+ICsgICAgICBFYWNoIGJpdCBjb3JyZXNwb25kcyB0byBhIFBXTSBjaGFubmVsICYgcmVwcmVz
ZW50cyB3aGV0aGVyIHN5bmNocm9ub3VzIG1vZGUgaXMKPj4gKyAgICAgIHBvc3NpYmxlIGZvciB0
aGUgUFdNIGNoYW5uZWwuCj4+ICsKPj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MTYKPj4gKyAgICBkZWZhdWx0OiAwCj4KPkknbSBub3Qgc3VyZSBJIHVu
ZGVyc3RhbmQgdGhpcyBjb3JyZWN0bHkuIFRoaXMgaXMgYSBzb2Z0LWNvcmUgYW5kIHlvdQo+Y2Fu
IHN5bnRoZXNpemUgaXQgZWl0aGVyIHdpdGggb3Igd2l0aG91dCB0aGUgYWJpbGl0eSB0byBkbyBz
eW5jaHJvbm91cwo+dXBkYXRlcyBvciBub3QsIHJpZ2h0PyBBbGwgMTYgY2hhbm5lbHMgc2hhcmUg
dGhlIHNhbWUgcGVyaW9kIGxlbmd0aCBhbmQKPmluIHRoZSBzaW1wbGUgaW1wbGVtZW50YXRpb24g
Y2hhbmdpbmcgdGhlIGR1dHkgY3ljbGUgaXMgZG9uZSBhdCBvbmNlCj4obWF5YmUgaW50cm9kdWNp
bmcgYSBnbGl0Y2gpIGFuZCBpbiB0aGUgbW9yZSBleHBlbnNpdmUgaW1wbGVtZW50YXRpb24KPnRo
ZXJlIGlzIGEgcmVnaXN0ZXIgdG8gaW1wbGVtZW50IGJvdGggdmFyaWFudHM/CgpDb3JyZWN0LiBJ
ZiB0aGUgSVAgaXMgaW5zdGFudGlhdGVkIHdpdGggU0hBRE9XX1JFR19FTng9MSwgYm90aApyZWdp
c3RlcnMgdGhhdCBjb250cm9sIHRoZSBkdXR5IGN5Y2xlIGZvciBjaGFubmVsIHggaGF2ZSBhIHNl
Y29uZAoic2hhZG93IHJlZyIgc3ludGhlc2lzZWQuIEF0IHJ1bnRpbWUgYSBiaXQgd2lkZSByZWdp
c3RlciBleHBvc2VkIHRvCkFQQiBjYW4gYmUgdXNlZCB0byB0b2dnbGUgb24vb2ZmIHN5bmNocm9u
aXNlZCBtb2RlIGZvciBhbGwgY2hhbm5lbHMKaXQgaGFzIGJlZW4gc3ludGhlc2lzZWQgZm9yLgoK
SSB3aWxsIHJld29yZCB0aGlzIGRlc2NyaXB0aW9uIHNpbmNlIGl0IGlzIG5vdCBjbGVhci4KCj4+
ICsgIG1pY3JvY2hpcCxkYWMtbW9kZToKPj4gKyAgICBkZXNjcmlwdGlvbjogfAo+PiArICAgICAg
T3B0aW9uYWwsIHBlci1jaGFubmVsIExvdyBSaXBwbGUgREFDIG1vZGUgaXMgcG9zc2libGUgb24g
dGhpcyBJUCBjb3JlLiBJdCBjcmVhdGVzCj4+ICsgICAgICBhIG1pbmltdW0gcGVyaW9kIHB1bHNl
IHRyYWluIHdob3NlIEhpZ2gvTG93IGF2ZXJhZ2UgaXMgdGhhdCBvZiB0aGUgY2hvc2VuIGR1dHkK
Pj4gKyAgICAgIGN5Y2xlLiBUaGlzICJEQUMiIHdpbGwgaGF2ZSBmYXIgYmV0dGVyIGJhbmR3aWR0
aCBhbmQgcmlwcGxlIHBlcmZvcm1hbmNlIHRoYW4gdGhlCj4+ICsgICAgICBzdGFuZGFyZCBQV00g
YWxnb3JpdGhtIGNhbiBhY2hpZXZlLgo+PiArICAgICAgRWFjaCBiaXQgY29ycmVzcG9uZHMgdG8g
YSBQV00gY2hhbm5lbCAmIHJlcHJlc2VudHMgd2hldGhlciBkYWMgbW9kZSBpcyBlbmFibGVkCj4+
ICsgICAgICB0aGF0IFBXTSBjaGFubmVsLgo+Cj5JbiB0aGUgbGFzdCBzZW50ZW5jZSBhICJmb3Ii
IGlzIG1pc3Npbmc/CgpJdCBpcyBtaXNzaW5nLCB0aGFua3MuCgo+VGhlc2UgdHdvIHByb3BlcnRp
ZXMgYXJlIG5vdCBkZXRlY3RhYmxlIGluIHNvZnR3YXJlPwoKVW5mb3J0dW5hdGVseSBub3QuIFRI
ZSBjb25maWd1cmF0aW9uIGZvciB0aGVzZSBvcHRpb25zIGFyZSBvbmx5CmFjY2Vzc2libGUgaW4g
dGhlIGZwZ2EgZGVzaWduLiBZb3UgbWFrZSBhIGdvb2QgcG9pbnQgaG93ZXZlciAmIHRoZXkKcmVh
bGx5IHNob3VsZCBiZSB2aXNpYmxlIHRvIHNvZnR3YXJlLiBJJ2xsIHN1Z2dlc3QgdGhhdCBmb3Ig
ZnV0dXJlCnJldmlzaW9ucyBvZiB0aGlzIElQIHRoYXQgYm90aCBjb25maWd1cmF0aW9ucyBhcmUg
YWNjZXNzaWJsZSBvdmVyIEFQQgoKVGhhbmtzLApDb25vci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
