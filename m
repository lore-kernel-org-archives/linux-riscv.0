Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE919C79F99
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 21:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=snwqdlwnT8j8OUzWUJfeM2dJb4ErHXTteYdsgdstDDQ=; b=hZdZ9h0LVC4Lzs
	eog+ZyP58kVRk5D6oKlnjVvzRafFbrAzPoXhL8z7dXW2PFTTopkTX3NDaMMCEI7PLaelK2XBtkql5
	if0D5QeslsPtIP+cuSy5ULuP1lu3fji4GCvmmrNtiGMdoD1qr2uUzYMWqQJOP5POzHLfB/hLpo/pj
	w4WbiGplaFTPfJwdpVDaPAr3gOMJXBlGTAlws11eEimL0LTqh6IrSioyapqIM0EMNCN0auF84xKOb
	5MuBXVoa7G+qj9cldsqa4OT9bBkQX9RraVW5XO621Y49KOh1Nk1GT6eTHGd4j+YjbJLsIcJMtHrod
	OvmkFgg2Q87oos4F1fxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3KIo-00000005a06-17wp;
	Sun, 06 Sep 2026 21:21:26 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3KIl-00000005Zz6-4B1v
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 21:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=Y9LS7SYHFlkHvaK4ZooIhwRFHr3vUhLavYrz1nuVPqA=; b=f4AoxTbb7TWe9/8DFTs7RutDb7
	L82gmbWW2DODqTgiGpBE+E/m0FCkwVtngj8SNAYQuewyWcdMlGTbsVC2+lwNR6wO2xoq3DR7498yq
	mirf/cmsxLfxhCtGUqUheLnnAbkfCX9gaXuU2mFHeLlZAAYlJNtKMn4nOkQazdx2SK3u2RUlqfOFM
	KWcbkU4Q73N5/5H/UvoLmg1kZBTNJRKz56T6MAydZXl+bJWQ9dQs7uiQsvZqBs6/e5nhDWZB1AItV
	U8MJg2E733lKvHsWsYvc/4PDZ1t2e/Smd1u09n+LeuXOg4Y4OLkmRVpwVyptbunYr32iPGvPB515T
	BJuyiljA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <domibel@debian.org>)
	id 1x3KIk-0011JD-18
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 21:21:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so3533957b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Sep 2026 14:21:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw98j0o/z9XpPV4v0RSmrYfXSr3FQlr/9KvMEJALJ5Yr26bUWWy7kV57AggrADjw6iM1zZ4db0rBAzOYw==@lists.infradead.org
X-Gm-Message-State: AFuF++nqLGaKZG/FZx4K4KjoBo8Gryrnqt5XjS70x+HcA8+pNHfcw3Xl
	a9JPUh2olZt4objCllE4KWnzIXSXqiKynOaODjJ5IEJvbjvoDctfNfcq54Gi/5HGxdtI+C/GKdD
	SRUa4Ey4KF6OkxsxJko3+FN9T0FDaa+c=
X-Received: by 2002:a05:6a00:c206:b0:851:d12e:389b with SMTP id
 d2e1a72fcca58-8628622c78fmr14582711b3a.14.1788729379886; Sun, 06 Sep 2026
 14:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io> <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
 <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io> <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
In-Reply-To: <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
From: Dominique Belhachemi <domibel@debian.org>
Date: Sun, 6 Sep 2026 17:16:08 -0400
X-Gmail-Original-Message-ID: <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
X-Gm-Features: AcwNN1W3Ei1cx4_W0731mEUNvW6xw1POICbdb9C66iM9zFCtDZzsTbla6YfIM_c
Message-ID: <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maud Spierings <maud_spierings@murena.io>, Dominique Belhachemi <domibel@debian.org>, 
	m.wilczynski@samsung.com, Laurent.pinchart@ideasonboard.com, 
	airlied@gmail.com, alex@ghiti.fr, andrzej.hajda@intel.com, 
	andy.yan@rock-chips.com, andyshrk@163.com, aou@eecs.berkeley.edu, 
	bmasney@redhat.com, conor+dt@kernel.org, conor@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	hal.feng@starfivetech.com, heiko@sntech.de, hello@big-grey.co.uk, 
	jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@esmil.dk, 
	krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, luca.ceresoli@bootlin.com, 
	m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com, 
	maudspierings@gocontroll.com, mfd@lists.linux.dev, mripard@kernel.org, 
	mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de, 
	palmer@dabbelt.com, pjw@kernel.org, rfoss@kernel.org, robh@kernel.org, 
	sboyd@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
X-Debian-User: domibel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_142124_032895_A4DDA9DE 
X-CRM114-Status: GOOD (  18.41  )
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

T24gU3VuLCBTZXAgNiwgMjAyNiBhdCAxMToxOeKAr0FNIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vu
b3d5Lm1lPiB3cm90ZToKPgo+IOWcqCAyMDI2LTA5LTA25pel55qEIDE2OjU5ICswMjAw77yMTWF1
ZCBTcGllcmluZ3PlhpnpgZPvvJoKPiA+IE9uIDkvNi8yNiAwNzozOSwgRG9taW5pcXVlIEJlbGhh
Y2hlbWkgd3JvdGU6Cj4gPiA+IE9uIFN1biwgQXVnIDMwLCAyMDI2IGF0IDEwOjE34oCvQU0gTWF1
ZCBTcGllcmluZ3MKPiA+ID4gPG1hdWRfc3BpZXJpbmdzQG11cmVuYS5pbyA8bWFpbHRvOm1hdWRf
c3BpZXJpbmdzQG11cmVuYS5pbz4+IHdyb3RlOgo+ID4gPgo+ID4gPiAgICAgSSB3YXMgc3RpbGwg
aGF2aW5nIHNvbWUgZ2xpdGNoaW5nIGhhcHBlbmluZyBvbiB0aGUgZGlzcGxheSwgYnV0Cj4gPiA+
IEkndmUKPiA+ID4gICAgIGZvdW5kIHRoZSB3YXkgdG8gZml4IHRoYXQsIHRoZSBxdWVzdGlvbiBp
cyB3aGF0IGlzIGFjdHVhbGx5Cj4gPiA+ICAgICBoYXBwZW5pbmcgaGVyZS4KPiA+ID4KPiA+ID4g
ICAgICAgICAweDI5NTkwMDIwIDwtIDB4MDAwMDAwMDUKPiA+ID4gICAgIFRoaXMgb25lIEkgaGF2
ZSBubyBpZGVhLCBpdCBpcyAweDAwMDAwMDA5IHdpdGggdGhpcyBwYXRjaAo+ID4gPiBzZXJpZXMg
YnV0Cj4gPiA+ICAgICB3aXRoIHRoZSB2ZW5kb3Iga2VybmVsIEkgZ2V0IHRoZSB2YWx1ZSBhYm92
ZS4gV2hlbiBJIGhvb2sgdXAgbXkKPiA+ID4gICAgIGV4dGVybmFsCj4gPiA+ICAgICBkaXNwbGF5
IChyZWd1bGFyIDE0NDBwKSB0aGlzIGJlY29tZXMgMHgwMDAwMDAwRCBvbiB0aGUgdmVuZG9yCj4g
PiA+IGtlcm5lbC4KPiA+ID4KPiA+ID4gICAgIEJ1dCBJIGNhbid0IGZpbmQgdGhpcyByZWdpc3Rl
ciBiZWluZyB3cml0dGVuIHRvIGFueXdoZXJlIHRoZXJlPwo+ID4gPgo+ID4gPgo+ID4gPiBNYXli
ZSB0aGlzIG5lZWRzIHRvIGJlIHN3YXBwZWQ/Cj4gPiA+Cj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvaW5uby1oZG1pLmMKPiA+ID4gICAgLSNkZWZpbmUgdl9IU1lOQ19QT0xBUklUWShuKSAg
ICAgICAgICAoKG4pIDw8IDMpCj4gPiA+ICAgIC0jZGVmaW5lIHZfVlNZTkNfUE9MQVJJVFkobikg
ICAgICAgICAgKChuKSA8PCAyKQo+ID4gPiAgICArI2RlZmluZSB2X0hTWU5DX1BPTEFSSVRZKG4p
ICAgICAgICAgICgobikgPDwgMikKPiA+ID4gICAgKyNkZWZpbmUgdl9WU1lOQ19QT0xBUklUWShu
KSAgICAgICAgICAoKG4pIDw8IDMpCj4KPiBWZXJ5IHdlaXJkbHksIHRoZSBvcmlnaW5hbCBkZWZp
bml0aW9uIGhlcmUgbWF0Y2hlcyBjdXJyZW50IG1haW5saW5lCj4gaW5uby1oZG1pLmMsIGJ1dCB0
aGUgY2hhbmdlZCBkZWZpbml0aW9uIG1hdGNoZXMgSkg3MTEwIHZlbmRvcgo+IGlubm9faGRtaS5o
IFsxXS4KPgoKVGhlIHZlbmRvciBjb2RlIGlzIGNvcnJlY3QgYW5kIG1hdGNoZXMgdGhlIFJLMzEy
OCBUUk0uCgpIRE1JX3JlZzA4CiAgICBCaXQgIEF0dHIgIFJlc2V0ICBEZXNjcmlwdGlvbgogICAg
MyAgICBSVyAgICAweDAgICAgdnNfcG9sYXJpdHkgICBWU1lOQyBwb2xhcml0eSAgIDEnYjA6IE5l
Z2F0aXZlCjEnYjE6IFBvc2l0aXZlCiAgICAyICAgIFJXICAgIDB4MCAgICBoc19wb2xhcml0eSAg
IEhTWU5DIHBvbGFyaXR5ICAgMSdiMDogTmVnYXRpdmUKMSdiMTogUG9zaXRpdmUKCk5vYm9keSBu
b3RpY2VkIHRoaXMgc28gZmFyIGJlY2F1c2UgaW4gNzIwcC8xMDgwcCBib3RoIHBvbGFyaXRpZXMg
YXJlCnBvc2l0aXZlLCBidXQgTWF1ZCdzIDM6MiBwYW5lbCBoYXMgZGlmZmVyaW5nIEgvViBwb2xh
cml0eS4KCkJlc3QKLURvbWluaXF1ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
