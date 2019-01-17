Return-Path: <SRS0=9Vsv=PZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7BDC43612
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Jan 2019 06:46:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8E4720657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 17 Jan 2019 06:46:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CNb+kQ5e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jXmfboBo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8E4720657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7bV+RqvPG6QdAmwcfp5idYt2PsoxdZWDmrEN2o3mc4=; b=CNb+kQ5eeWz3yD
	mqTsi7xnBerGe7xKyKuxv4o4YA4uplOHzYJYlACBbZrTH2mF70eYBeOPu0q2wseYRUHLaqJB7Dslu
	er1SwBy6DRwB5/6lDEDrg4LgF9gtZLKNEhMuHRHH7dbGCFHM+2DU5f3lqBmOm/5VsqtYUsdEKMW56
	a2c3rARMBIEsc3H8ftMGcJKjrEOIkZCRUxnHl7Fs1BmtBNl/QToWXRB1ZwKxYoNjYSPZyvz3mX4Oa
	vQr2LORsatcNTu4j1EUH4gGvsTf+qqlWtmXKnAIsekpp3uTymEpV6evGBGAXLvGFPrJA4e1kFKdNJ
	AQGoIjYHSh7x94m2C//Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk1RU-0000Qj-Nw; Thu, 17 Jan 2019 06:46:20 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk1RR-0000Pu-4Q
 for linux-riscv@lists.infradead.org; Thu, 17 Jan 2019 06:46:18 +0000
Received: by mail-lj1-x242.google.com with SMTP id v15-v6so7541753ljh.13
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jan 2019 22:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NxoRT2Ol19EK1HMAFEdy4XkQkzKkEOo4TrYDIsKJ16k=;
 b=jXmfboBoK6xjenebEmj9iey52h2s500qABifhDxqK+OF5EdXVZhY9aFAyM1QFlyn9v
 dIAegw5wQSsYjAxcyFE9Ya9T5TKDsZrKQFktee4YdtlzXFpNJfNrQGgR5R75SotSiypR
 MslAT5USWx7rU/IeQydxm0RB6CtFD5BG/6HHoyFsfOi6s8XOgQ4nscr2LY2N6EXWnsjV
 Xmzsuh2K+Ut0svyDMJQn1pwjyzSht1y98vnddhMPtpc4kjbeD0eBX2tl8oLYYoWbIPOg
 meKsqWslX7hNuoer4kHcTGwoqEeN//ZrI+bZ0V5NP2yrsFYKh7s0GWbFScPfPIBVxXNP
 VEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NxoRT2Ol19EK1HMAFEdy4XkQkzKkEOo4TrYDIsKJ16k=;
 b=JXBl7ctbdNTdhtifsnKnEGcE08B9QKXXl2Na2VMpB0Q3gAydu2WMWUaMstOlw1HLqs
 a+0E2MsSrdMHlu9f13z5TggmmegvWeWDMWr0YWSe0mjlSLRVUe+o3HT7hVittUfbP+T2
 6RahhmyW8owXnMku0Rw0vI7GTPIdEVq65hX9dXSZFdKsHy1jOwl2sT3pt+sgHqITpfXy
 +kx4+7tpW9zdNAfGV+lrChksdSeWQX2HjgyvTsOKdsJShmY8mw4y1RgKxsgimA+L+Np1
 nYJwNMLxDnjjofSYG7WgJDpsbYiej6TOWVHP0s8Q2e+8ZnkG4N3mlqgXTVh7XNPsItrn
 fHVg==
X-Gm-Message-State: AJcUukcQehsibXrHb4zWmDqKEGo5YPwTkBOsdMc7u/F5YqJ/SkKskadt
 Pl+tTagotZTsNS1yaHv4KBMfC4hBKQtToH+YYMpsyA==
X-Google-Smtp-Source: ALg8bN5o/x7JmSy8U/cUP7f6/KOxQ7/EQdSX/cXm89FRRs4FIyIj2odzpOYkmINP2uoSI96BZznz0qBlgZda+BRgg5w=
X-Received: by 2002:a2e:1603:: with SMTP id w3-v6mr8892390ljd.33.1547707574678; 
 Wed, 16 Jan 2019 22:46:14 -0800 (PST)
MIME-Version: 1.0
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-3-git-send-email-yash.shah@sifive.com>
 <20190115220046.etgbno6ymsux75dk@pengutronix.de>
 <CAJ2_jOEuU_=bpbVmdsq7FFEKEm_wHza-h7Hu8QmZ3BgsGgi-ng@mail.gmail.com>
 <20190116164640.mi3zjbhbhc6k5v7p@pengutronix.de>
In-Reply-To: <20190116164640.mi3zjbhbhc6k5v7p@pengutronix.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Thu, 17 Jan 2019 12:15:38 +0530
Message-ID: <CAJ2_jOEuE1Y8G3xnYqa+aA9GSRGmN8xN7fh4nBs0_Yb68Br9bg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_224617_205149_3C5A09D9 
X-CRM114-Status: GOOD (  33.29  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMTYsIDIwMTkgYXQgMTA6MTYgUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+IE9uIFdlZCwg
SmFuIDE2LCAyMDE5IGF0IDA0OjQwOjQyUE0gKzA1MzAsIFlhc2ggU2hhaCB3cm90ZToKPiA+IE9u
IFdlZCwgSmFuIDE2LCAyMDE5IGF0IDM6MzAgQU0gVXdlIEtsZWluZS1Lw7ZuaWcKPiA+IDx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+ID4gPiBPbiBGcmksIEphbiAxMSwg
MjAxOSBhdCAwMTo1Mjo0NFBNICswNTMwLCBZYXNoIFNoYWggd3JvdGU6Cj4gPiA+ID4gQWRkcyBh
IFBXTSBkcml2ZXIgZm9yIFBXTSBjaGlwIHByZXNlbnQgaW4gU2lGaXZlJ3MgSGlGaXZlIFVubGVh
c2hlZCBTb0MuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBXZXNsZXkgVy4gVGVycHN0
cmEgPHdlc2xleUBzaWZpdmUuY29tPgo+ID4gPiA+IFtBdGlzaDogVmFyaW91cyBmaXhlcyBhbmQg
Y29kZSBjbGVhbnVwXQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaC5w
YXRyYUB3ZGMuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlhc2ggU2hhaCA8eWFzaC5zaGFo
QHNpZml2ZS5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvcHdtL0tjb25maWcgICAg
ICB8ICAxMCArKwo+ID4gPiA+ICBkcml2ZXJzL3B3bS9NYWtlZmlsZSAgICAgfCAgIDEgKwo+ID4g
PiA+ICBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgfCAyNDYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyNTcg
aW5zZXJ0aW9ucygrKQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wd20vcHdt
LXNpZml2ZS5jCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vS2NvbmZp
ZyBiL2RyaXZlcnMvcHdtL0tjb25maWcKPiA+ID4gPiBpbmRleCBhOGY0N2RmLi4zYmNhZjZhIDEw
MDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcHdtL0tjb25maWcKPiA+ID4gPiArKysgYi9kcml2
ZXJzL3B3bS9LY29uZmlnCj4gPiA+ID4gQEAgLTM4MCw2ICszODAsMTYgQEAgY29uZmlnIFBXTV9T
QU1TVU5HCj4gPiA+ID4gICAgICAgICBUbyBjb21waWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxl
LCBjaG9vc2UgTSBoZXJlOiB0aGUgbW9kdWxlCj4gPiA+ID4gICAgICAgICB3aWxsIGJlIGNhbGxl
ZCBwd20tc2Ftc3VuZy4KPiA+ID4gPgo+ID4gPiA+ICtjb25maWcgUFdNX1NJRklWRQo+ID4gPiA+
ICsgICAgIHRyaXN0YXRlICJTaUZpdmUgUFdNIHN1cHBvcnQiCj4gPiA+ID4gKyAgICAgZGVwZW5k
cyBvbiBPRgo+ID4gPiA+ICsgICAgIGRlcGVuZHMgb24gQ09NTU9OX0NMSwo+ID4gPgo+ID4gPiBJ
J2Qgc2F5IGFkZDoKPiA+ID4KPiA+ID4gICAgICAgICBkZXBlbmRzIG9uIE1BQ0hfU0lGSVZFIHx8
IENPTVBJTEVfVEVTVAo+ID4gPgo+ID4gPiAoSSBndWVzcyAiTUFDSF9TSUZJVkUiIGlzIHdyb25n
LCBidXQgSSBhc3N1bWUgeW91IGdldCB3aGF0IEkgbWVhbi4pCj4gPgo+ID4gQXMgb2Ygbm93LCBN
QUNIX1NJRklWRS9BUkNIX1NJRklWRSBpc24ndCBhdmFpbGFibGUuCj4gPiBAUGF1bCwgRG8geW91
IGhhdmUgYW55IGNvbW1lbnRzIG9uIHRoaXM/Cj4KPiBJZiB0aGlzIGlzIG5vdCBnb2luZyB0byBi
ZSBhdmFpbGFibGUgYXQgbGVhc3QgcHJvdGVjdCBpdCBieQo+Cj4gICAgICAgICBkZXBlbmRzIFJJ
U0NWIHx8IENPTVBJTEVfVEVTVAo+Cj4gPiA+IEkgd29uZGVyIGlmIHN1Y2ggYW4gaW5zdGFuY2Ug
c2hvdWxkIGJlIG9ubHkgYSBzaW5nbGUgUFdNIGluc3RlYWQgb2YKPiA+ID4gZm91ci4gVGhlbiB5
b3Ugd2VyZSBtb3JlIGZsZXhpYmxlIHdpdGggdGhlIHBlcmlvZCBsZW5ndGhzICh1c2luZwo+ID4g
PiBwd21jZmcucHdtemVyb2NtcCkgYW5kIGNvdWxkIGRvIHN0dWZmIGxpa2UgaW52ZXJ0ZWQgYW5k
IHVuaW52ZXJ0ZWQgbW9kZS4KPiA+ID4KPiA+ID4gSSBkaWRuJ3QgdW5kZXJzdGFuZCBob3cgdGhl
IGRlZ2xpdGNoIGxvZ2ljIHdvcmtzIHlldC4gQ3VycmVudGx5IGl0IGlzCj4gPiA+IG5vdCB1c2Vk
IHdoaWNoIG1pZ2h0IHJlc3VsdCBpbiBmb3VyIGVkZ2VzIGluIGEgc2luZ2xlIHBlcmlvZCAod2hp
Y2ggaXMKPiA+ID4gYmFkKS4KPiA+Cj4gPiBJIGNhbiBlbmFibGUgZGVnbGl0Y2ggbG9naWMgYnkg
anVzdCBzZXR0aW5nIGEgYml0IChCSVRfUFdNX0RFR0xJVENIKSBpbgo+ID4gUkVHX1BXTUNGRy4g
V2lsbCBkbyB0aGF0Lgo+Cj4gVGhpcyBvbmx5IHdvcmtzIGZvciB0aGUgZmlyc3QgcHdtIG91dHB1
dCB0aG91Z2guCj4KPiA+ID4gPiArc3RydWN0IHNpZml2ZV9wd21fZGV2aWNlIHsKPiA+ID4gPiAr
ICAgICBzdHJ1Y3QgcHdtX2NoaXAgY2hpcDsKPiA+ID4gPiArICAgICBzdHJ1Y3Qgbm90aWZpZXJf
YmxvY2sgbm90aWZpZXI7Cj4gPiA+ID4gKyAgICAgc3RydWN0IGNsayAqY2xrOwo+ID4gPiA+ICsg
ICAgIHZvaWQgX19pb21lbSAqcmVnczsKPiA+ID4gPiArICAgICB1bnNpZ25lZCBpbnQgYXBwcm94
X3BlcmlvZDsKPgo+IFdoZW4gdGhpbmtpbmcgYWJvdXQgdGhpcyBhIGJpdCBtb3JlLCBJIHRoaW5r
IHRoZSBiZXR0ZXIgYXBwcm9hY2ggd291bGQKPiBiZSB0byBsZXQgdGhlIGNvbnN1bWVyIGNoYW5n
ZSB0aGUgcGVyaW9kIGlmZiB0aGVyZSBpcyBvbmx5IG9uZSBjb25zdW1lci4KPiBUaGVuIHlvdSBj
YW4gZHJvcCB0aGF0IGFwcHJveC1wZXJpb2Qgc3R1ZmYgYW5kIHRoZSByZXN1bHQgaXMgbW9yZQo+
IGZsZXhpYmxlLiAoSGF2aW5nIHNhaWQgdGhhdCBJIHN0aWxsIHByZWZlciBtYWtpbmcgdGhlIGRy
aXZlciBwcm92aWRlCj4gb25seSBhIHNpbmdsZSBQV00gd2l0aCB0aGUgYWJpbGl0eSB0byBoYXZl
IHBlcmlvZHMgb3RoZXIgdGhhbiBwb3dlcnMgb2YKPiB0d28uKQo+CgpJIGFtIG5vdCBjb25maWRl
bnQgYWJvdXQgdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSB3YXkgeW91IGFyZSBzdWdnZXN0aW5n
LgpBcyBvZiBub3csIEkgYW0gZ29pbmcgdG8gc3RpY2sgd2l0aCB0aGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbi4KCj4gPiA+ID4gKyAgICAgd3JpdGVsKGZyYWMsIHB3bS0+cmVncyArIFJFR19QV01D
TVAwICsgZGV2LT5od3B3bSAqIFNJWkVfUFdNQ01QKTsKPiA+ID4KPiA+ID4gSWYgeW91IGdldCBh
IGNvbnN0YW50IGluYWN0aXZlIG91dHB1dCB3aXRoIGZyYWM9MCBhbmQgYSBjb25zdGFudCBhY3Rp
dmUKPiA+ID4gb3V0cHV0IHdpdGggZnJhYz0weGZmZmYgdGhlIGNhbGN1bGF0aW9uIGFib3ZlIHNl
ZW1zIHdyb25nIHRvIG1lLgo+ID4gPiAoQSB2YWx1ZSBpIHdyaXR0ZW4gdG8gdGhlIHB3bWNtcFgg
cmVnaXN0ZXIgbWVhbnMgYSBkdXR5IGN5Y2xlIG9mCj4gPiA+IChpICogcGVyaW9kIC8gMHhmZmZm
KS4gWW91ciBjYWxjdWxhdGlvbiBhc3N1bWVzIGEgZGl2aXNvciBvZiAweDEwMDAwCj4gPiA+IGhv
d2V2ZXIuKQo+ID4KPiA+IE5vdCBzdXJlIGlmIEkgZ2V0IHlvdSBjb21wbGV0ZWx5LiBCdXQsIGlm
IGRpdmlzb3Igb2YgMHhmZmZmIGlzIHlvdXIgY29uY2VybiB0aGVuCj4gPiBkb2VzIHRoZSBiZWxv
dyBsb29rIG9rPwo+ID4KPiA+IGZyYWMgPSBkaXZfdTY0KCgodTY0KWR1dHlfY3ljbGUgPDwgMTYp
IC0gZHV0eV9jeWNsZSwgc3RhdGUtPnBlcmlvZCk7Cj4KPiBUaGlzIHdvcmtzIChJIHRoaW5rLCBk
aWRuJ3QgcmVkbyB0aGUgbWF0aHMpLCBidXQgSSB3b3VsZCBwcmVmZXIKPgo+ICAgICAgICAgZnJh
YyA9IGRpdl91NjQoKHU2NClkdXR5X2N5Y2xlICogMHhmZmZmLCBzdGF0ZS0+cGVyaW9kKTsKPgo+
IGZvciBiZXR0ZXIgcmVhZGFiaWxpdHkuIChNYXliZSB0aGUgY29tcGlsZXIgaXMgZXZlbiBjbGV2
ZXIgZW5vdWdoIHRvIHNlZQo+IHRoaXMgY2FuIGJlIGNhbGN1bGF0ZWQgYXMgeW91IHN1Z2dlc3Rl
ZC4pCgpTdXJlLCB3aWxsIG11bHRpcGx5IGl0IHdpdGggMHhmZmZmIGZvciBiZXR0ZXIgcmVhZGFi
aWxpdHkuCgo+Cj4gPiA+ID4gK3N0YXRpYyBpbnQgc2lmaXZlX3B3bV9jbG9ja19ub3RpZmllcihz
dHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBldmVudCwgdm9pZCAqZGF0YSkKPiA+ID4gPiArewo+
ID4gPiA+ICsgICAgIHN0cnVjdCBjbGtfbm90aWZpZXJfZGF0YSAqbmRhdGEgPSBkYXRhOwo+ID4g
PiA+ICsgICAgIHN0cnVjdCBzaWZpdmVfcHdtX2RldmljZSAqcHdtID0KPiA+ID4gPiArICAgICAg
ICAgICAgIGNvbnRhaW5lcl9vZihuYiwgc3RydWN0IHNpZml2ZV9wd21fZGV2aWNlLCBub3RpZmll
cik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIGlmIChldmVudCA9PSBQT1NUX1JBVEVfQ0hBTkdF
KQo+ID4gPiA+ICsgICAgICAgICAgICAgc2lmaXZlX3B3bV91cGRhdGVfY2xvY2socHdtLCBuZGF0
YS0+bmV3X3JhdGUpOwo+ID4gPgo+ID4gPiBEb2VzIHRoaXMgbmVlZCBsb2NraW5nPyAoTWF5YmUg
bm90IHdpdGggdGhlIGN1cnJlbnQgc3RhdGUuKQo+ID4KPiA+IE5vLiBXZSBjYW4gYWRkIGl0IHdo
ZW4gcmVxdWlyZWQuCj4KPiBNeSB0aG91Z2h0IHdhcywgdGhhdCB0aGUgY2xrIGZyZXEgbWlnaHQg
Y2hhbmdlIHdoaWxlIC5hcHBseSBpcyBhY3RpdmUuCj4gQnV0IGdpdmVuIHRoYXQgeW91IG9ubHkg
Y29uZmlndXJlIHRoZSByZWxhdGl2ZSBkdXR5IGN5Y2xlIHRoaXMgaXMKPiBpbmRlcGVuZGVudCBv
ZiB0aGUgYWN0dWFsIGNsayBmcmVxLgo+Cj4gQmVzdCByZWdhcmRzCj4gVXdlCj4KPiAtLQo+IFBl
bmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8IFV3ZSBLbGVpbmUtS8O2
bmlnICAgICAgICAgICAgfAo+IEluZHVzdHJpYWwgTGludXggU29sdXRpb25zICAgICAgICAgICAg
ICAgICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8Cj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
