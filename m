Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26289C79F9F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BB6ilKIEfzE56fOdFKfH/m9Suwydy2Bi2dGS8NvdD3g=; b=XEj0iyY8xD0JCh
	CL302WMn5hB0HcH1YYJZzyoLr5IKkf2eguatSpffe4ulxYUw51akXNmVAlorr8lBE3PcGCc6/2P+A
	StLVXKW2llyFdfXlwTLj/AF1EEP9Dq/CXHJabzBinTF9kQXwK3MXH/MBfRv1COsuKD5gB0lIt1qUG
	4RA0ah2eiJQoAMZw1hxms0u8oT5a0coBHKs7RlSq7Vagpvk5f+eI07QXTKEQJKT2hhK9FLEXHlpsB
	xWBaXOre3ZiZUZ8aBVhR133Mt4xo2Kbcl8/JUDjyBb1aqoMnRAGhITmsaliz4czCTLh42v+GvkHii
	4cWJFm6slK4BubApOXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3EfG-000000057sg-2Esb;
	Sun, 06 Sep 2026 15:20:14 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3EfE-000000057rz-0dMR;
	Sun, 06 Sep 2026 15:20:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788707913; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ieCQabN8EQGpXXgECYodCz/ZWBOkqYLbzC0IAYMG8eiFuCymE52MFXM8XcT6yw39sVHBIc2qXnpsaVNw2sn4SSeLTcwBmMpWDsjggGIuvL0BodFvmlMmHh3DI+WnadXCEcpuLwct5OCPKQjaCpLS3L2vKFHX8ILaEEH5q1Uo+Bw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788707913; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=68YKKfbSFTtU2N7wERD+i3nPtQ0y2cRum0iBDFTHv+I=; 
	b=TEEpCx/b1ggvFyy06XzGaMbNMSzL3Ih8lcq69dr3LzhH4NfQtlm+qC/5NnaXvUWQGG8GnayoaudlRlMZFVEHGWH/q6QuAWKVLEzpHRMlAFc7V5nXD+CtW5vK5MJ63hQ+c8dqyh9/JXMwWiDP0NfnLEz1g/88RIYJE0h3d8NLPuw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788707913;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=68YKKfbSFTtU2N7wERD+i3nPtQ0y2cRum0iBDFTHv+I=;
	b=jzAEdxks3X3M2tjU7S5FuCIjaTDUi2qtrtP7DnXmOiMnbT5vFdOwzOCbCPMbWKFd
	AqKsFENq9fN5HGwqjXYuSfHrxGy6MiIXzb3vnOYn3nzwW+fuarkCTIU9wCTTGE6s7dK
	zAaUKxcwqTq4iUaFNNoYTk842WVM7mirHdmg6awrwY8XJ/eB3xIFc0o0enQj9Zl3yM/
	nbcOVOSCgfi8MC0mZIvUnwM80hrNWjqgvIHCUDS52pR0CkaMje0TKgVUzpp2WmiQoW7
	EB/H0s5j/mdyvhAKH+NZhmAd2zA/4zIfyCb7SDaeazKFS5Qg5Rw7hZUamsT52lO1IpZ
	oRuXG8vMBA==
Received: by mx.zohomail.com with SMTPS id 1788707909777230.01672967805905;
	Sun, 6 Sep 2026 08:18:29 -0700 (PDT)
Message-ID: <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Maud Spierings <maud_spierings@murena.io>, Dominique Belhachemi
	 <domibel@debian.org>
Cc: m.wilczynski@samsung.com, Laurent.pinchart@ideasonboard.com, 
	airlied@gmail.com, alex@ghiti.fr, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, 	andyshrk@163.com, aou@eecs.berkeley.edu,
 bmasney@redhat.com, conor+dt@kernel.org, 	conor@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	hal.feng@starfivetech.com, heiko@sntech.de, hello@big-grey.co.uk, 
	jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@esmil.dk,
 krzk+dt@kernel.org, 	lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, 	luca.ceresoli@bootlin.com,
 m.szyprowski@samsung.com, 	maarten.lankhorst@linux.intel.com,
 maudspierings@gocontroll.com, 	mfd@lists.linux.dev, mripard@kernel.org,
 mturquette@baylibre.com, 	neil.armstrong@linaro.org,
 p.zabel@pengutronix.de, palmer@dabbelt.com, 	pjw@kernel.org,
 rfoss@kernel.org, robh@kernel.org, sboyd@kernel.org, simona@ffwll.ch, 
	tzimmermann@suse.de, vkoul@kernel.org
Date: Sun, 06 Sep 2026 23:18:11 +0800
In-Reply-To: <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io>
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
	 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io>
	 <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
	 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
	 <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_082012_273374_2E96F9CA 
X-CRM114-Status: GOOD (  15.88  )
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

5ZyoIDIwMjYtMDktMDbml6XnmoQgMTY6NTkgKzAyMDDvvIxNYXVkIFNwaWVyaW5nc+WGmemBk++8
mgo+IE9uIDkvNi8yNiAwNzozOSwgRG9taW5pcXVlIEJlbGhhY2hlbWkgd3JvdGU6Cj4gPiBPbiBT
dW4sIEF1ZyAzMCwgMjAyNiBhdCAxMDoxN+KAr0FNIE1hdWQgU3BpZXJpbmdzIAo+ID4gPG1hdWRf
c3BpZXJpbmdzQG11cmVuYS5pb8KgPG1haWx0bzptYXVkX3NwaWVyaW5nc0BtdXJlbmEuaW8+PiB3
cm90ZToKPiA+IAo+ID4gwqDCoMKgIEkgd2FzIHN0aWxsIGhhdmluZyBzb21lIGdsaXRjaGluZyBo
YXBwZW5pbmcgb24gdGhlIGRpc3BsYXksIGJ1dAo+ID4gSSd2ZQo+ID4gwqDCoMKgIGZvdW5kIHRo
ZSB3YXkgdG8gZml4IHRoYXQsIHRoZSBxdWVzdGlvbiBpcyB3aGF0IGlzIGFjdHVhbGx5Cj4gPiDC
oMKgwqAgaGFwcGVuaW5nIGhlcmUuCj4gPiAKPiA+IMKgwqDCoMKgIMKgIMKgMHgyOTU5MDAyMCA8
LSAweDAwMDAwMDA1Cj4gPiDCoMKgwqAgVGhpcyBvbmUgSSBoYXZlIG5vIGlkZWEsIGl0IGlzIDB4
MDAwMDAwMDkgd2l0aCB0aGlzIHBhdGNoCj4gPiBzZXJpZXMgYnV0Cj4gPiDCoMKgwqAgd2l0aCB0
aGUgdmVuZG9yIGtlcm5lbCBJIGdldCB0aGUgdmFsdWUgYWJvdmUuIFdoZW4gSSBob29rIHVwIG15
Cj4gPiDCoMKgwqAgZXh0ZXJuYWwKPiA+IMKgwqDCoCBkaXNwbGF5IChyZWd1bGFyIDE0NDBwKSB0
aGlzIGJlY29tZXMgMHgwMDAwMDAwRCBvbiB0aGUgdmVuZG9yCj4gPiBrZXJuZWwuCj4gPiAKPiA+
IMKgwqDCoCBCdXQgSSBjYW4ndCBmaW5kIHRoaXMgcmVnaXN0ZXIgYmVpbmcgd3JpdHRlbiB0byBh
bnl3aGVyZSB0aGVyZT8KPiA+IAo+ID4gCj4gPiBNYXliZSB0aGlzIG5lZWRzIHRvIGJlIHN3YXBw
ZWQ/Cj4gPiAKPiA+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW5uby1oZG1pLmMKPiA+IMKgwqAg
LSNkZWZpbmUgdl9IU1lOQ19QT0xBUklUWShuKSDCoCDCoCDCoCDCoCDCoCgobikgPDwgMykKPiA+
IMKgwqAgLSNkZWZpbmUgdl9WU1lOQ19QT0xBUklUWShuKSDCoCDCoCDCoCDCoCDCoCgobikgPDwg
MikKPiA+IMKgwqAgKyNkZWZpbmUgdl9IU1lOQ19QT0xBUklUWShuKSDCoCDCoCDCoCDCoCDCoCgo
bikgPDwgMikKPiA+IMKgwqAgKyNkZWZpbmUgdl9WU1lOQ19QT0xBUklUWShuKSDCoCDCoCDCoCDC
oCDCoCgobikgPDwgMykKClZlcnkgd2VpcmRseSwgdGhlIG9yaWdpbmFsIGRlZmluaXRpb24gaGVy
ZSBtYXRjaGVzIGN1cnJlbnQgbWFpbmxpbmUKaW5uby1oZG1pLmMsIGJ1dCB0aGUgY2hhbmdlZCBk
ZWZpbml0aW9uIG1hdGNoZXMgSkg3MTEwIHZlbmRvcgppbm5vX2hkbWkuaCBbMV0uCgpTb21lIHdl
aXJkIG11c3QgaGFwcGVuZWQuCgpUaGFua3MsCkljZW5vd3kKCgpbMV0KaHR0cHM6Ly9naXRodWIu
Y29tL0RDLURlZXBDb21wdXRpbmcvZm1sMTN2MDEtbGludXgvYmxvYi85N2M2NGZlMjgzMmI2ODI2
OTE0YjZkYTdhYTRmZWJjZGQ0ZDNkNDQ0L2RyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi9pbm5v
X2hkbWkuaAoKPiA+IAo+IAo+IFRob3NlIHNlZW0gdG8gb25seSBiZSByZWxldmFudCB0aGUgMHgw
OCByZWdpc3RlcjoKPiDCoD4gI2RlZmluZSBIRE1JX1ZJREVPX1RJTUlOR19DVEwJCTB4MDgKPiAK
PiBhbHNvIGluIHRoZSBjb2RlOgo+IAo+IMKgPiAvKiBTZXQgZGV0YWlsIGV4dGVybmFsIHZpZGVv
IHRpbWluZyBwb2xhcml0eSBhbmQgaW50ZXJsYWNlIG1vZGUgKi8KPiDCoD4gdmFsdWUgPSB2X0VY
VEVSQU5MX1ZJREVPKDEpOwo+IMKgPiB2YWx1ZSB8PSBtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZM
QUdfUEhTWU5DID8KPiDCoD7CoAkgdl9IU1lOQ19QT0xBUklUWSgxKSA6IHZfSFNZTkNfUE9MQVJJ
VFkoMCk7Cj4gwqA+IHZhbHVlIHw9IG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxBR19QVlNZTkMg
Pwo+IMKgPsKgCSB2X1ZTWU5DX1BPTEFSSVRZKDEpIDogdl9WU1lOQ19QT0xBUklUWSgwKTsKPiDC
oD4gdmFsdWUgfD0gbW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0lOVEVSTEFDRSA/Cj4gwqA+
wqAJIHZfSU5FVExBQ0UoMSkgOiB2X0lORVRMQUNFKDApOwo+IMKgPiBoZG1pX3dyaXRlYihoZG1p
LCBIRE1JX1ZJREVPX1RJTUlOR19DVEwsIHZhbHVlKTsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
