Return-Path: <SRS0=b7IV=KA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDA7C433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  5 May 2021 04:27:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C08ED610E6
	for <linux-riscv@archiver.kernel.org>; Wed,  5 May 2021 04:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C08ED610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+TZPA3nLaP1JtP/RIZt47VPJLNo1/eOzkjSnp0i6GuA=; b=RBt2f9K9AclhwMJoedkDiAssK
	H8/X5yEQhFzgZwTuIY+g5SUwOXe5Utyos5iwinqaVg662iY6eSU+6sxNh1pGegNeOpVoEDPPRe+/z
	rXAzhZlK0m+Rw2TJPJ4JgMUJUFGt18RPdPOqtxZX76pNpSFsIWiveLtiIVfCpaV72a8qDrs5gb5+h
	8S9agxzvlXfErJIHjcXMUnl3bcmvRicQAnfU8ukSbyAzUpZAz5SRJo7DXYYT4Iqh+hUx+TFwvocz1
	ulZSSNvVJWcVHQ8odwIk9Jz4xzk+6xpXp02IWVHPaUk1lT4QW2OHTGSf/UcWCwgkVZG0iKAy17NtZ
	hgS5BYSBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le97b-000CZ5-87; Wed, 05 May 2021 04:26:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le97X-000CYm-J8
 for linux-riscv@desiato.infradead.org; Wed, 05 May 2021 04:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=MWSpjxBHV1vRQCEcIIgUFYsW0arewhxrx2qqTW/rPlY=; b=AWosW/Eec+vkq/+RVEGqEX3pmR
 oaG40HFDHGzym3OZC0oI/DMbwqtY8PnVwrtdUbTi3G5KvDujVA7u3AmLy7yJxH6HSYS1aReenrpl+
 pqwAZY+n8unLaVWKcfh5sqSlIGnleK2DX9IQVuodLlJ701+Yj7hs01DczX2xwCXExfGXfGb2J/18l
 W8KcVGsRUZtljjY2fR/IbMC0mP6W2acN3sgLzThvKaC6ExMPP+LDsoFepdlUfSJzX2tCVX1uvWyNz
 kRsn8Pc5z1YHTvGlhiDOMI6Xj4U6jctZhuLB+g0kbcBXRs3Fkk+HQLpuiZH2A7nPdgFIz8mvfHQv5
 5Q7/rLaQ==;
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le97U-004SKm-Ih
 for linux-riscv@lists.infradead.org; Wed, 05 May 2021 04:26:46 +0000
Received: by mail-qk1-x72c.google.com with SMTP id a2so398560qkh.11
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 21:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MWSpjxBHV1vRQCEcIIgUFYsW0arewhxrx2qqTW/rPlY=;
 b=eG4DO5aZCjdAptZWJyANSIWrnjQfoI+YnXphlXLmQkVHW2OlYy15msNEav3uhLMHv+
 9MC/49Ilp4ZUGHTZ91k1Ztq8VXZ2uQSVkHGeyblBNhtAfJ/YyYKFdWPXBjBocTAWnRIM
 xNsyfLfBo83J+sPbjEojQCHGGi8NYXE4aDpKBLoaqOjgQDifZaLk5OyDBgE2i0d3vGh8
 SK9AnSO5usHR4SWn950rRy8EzLZraCq90VeDCdzstYUKx4Yh0W1qka2UuaQlmaLu7agB
 IvNIuhwuWm/QYlxp+BzrW6JNQs30u2smfSWsYf4m6c8GnnrGfiAFwEHjRcHArXFI6tsu
 XDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MWSpjxBHV1vRQCEcIIgUFYsW0arewhxrx2qqTW/rPlY=;
 b=WEWoQcdxLvaalDIZ92FvwdZjx8014oJF8EK5rHmfV7Qo16bdIWaTBcjIeKrKRWiHce
 nENQHLg1M4BmsDOsv5PNjAByavtLoeNt4u1OwlK+/VEHPw08zVZHFHTGM72H7dAEUw2T
 cclEF5463+tHvafV03Tb+94XuqkymI/vtcM06z6Purpmrn5cqE/JcdrKe9yCzrb9DIrE
 9Rm1EHYp/3a7PbY4PouTyNTIHzlxNgaJ7V0BwbH0XWcOvldpl7BkixFr9bUDN4Kc36OQ
 A+MAe4sC0jkomKjyFxfIJOpkwCON1Ol/ghC0k7S7AXn+8mD5q9GV31aw7nU32bFS0xcv
 M+gQ==
X-Gm-Message-State: AOAM5327iLXPvJCVfNKekAEKBiZPsOsjVO7F4HgzUmTvIocErchAbUhF
 78BATTuCQMnqxifQCQK8ARdgzbxQx+F4WHCF7sK1/g==
X-Google-Smtp-Source: ABdhPJyyjim3sI4ReEhGXSHiHPSliwht/DIqCZWGZeFpAExlyKtWwB5fVEGkkFBLw60H7cFK5hOmWGBArsLX6P7qFAk=
X-Received: by 2002:a05:620a:29c4:: with SMTP id
 s4mr25568588qkp.401.1620188803215; 
 Tue, 04 May 2021 21:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210504105940.100004-6-greentime.hu@sifive.com>
 <20210504134632.GA1088165@bjorn-Precision-5520>
In-Reply-To: <20210504134632.GA1088165@bjorn-Precision-5520>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Wed, 5 May 2021 12:26:31 +0800
Message-ID: <CAHCEehL21cFLp+JWMhKP8rAVtGunMv2fmfo6C6tbTGpgL9q2RA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] PCI: fu740: Add SiFive FU740 PCIe host controller
 driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com, 
 Erik Danie <erik.danie@sifive.com>, Zong Li <zong.li@sifive.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 alex.dewar90@gmail.com, khilman@baylibre.com, hayashi.kunihiko@socionext.com, 
 vidyas@nvidia.com, jh80.chung@samsung.com, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_212644_669249_08C4B7E8 
X-CRM114-Status: GOOD (  30.73  )
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

Qmpvcm4gSGVsZ2FhcyA8aGVsZ2Fhc0BrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDXmnIg05pelIOmA
seS6jCDkuIvljYg5OjQ25a+r6YGT77yaCj4KPiBPbiBUdWUsIE1heSAwNCwgMjAyMSBhdCAwNjo1
OTozOVBNICswODAwLCBHcmVlbnRpbWUgSHUgd3JvdGU6Cj4gPiBGcm9tOiBQYXVsIFdhbG1zbGV5
IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4gPgo+ID4gQWRkIGRyaXZlciBmb3IgdGhlIFNp
Rml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlci4KPiA+IFRoaXMgY29udHJvbGxlciBpcyBi
YXNlZCBvbiB0aGUgRGVzaWduV2FyZSBQQ0llIGNvcmUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
UGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgo+ID4gQ28tZGV2ZWxvcGVk
LWJ5OiBIZW5yeSBTdHlsZXMgPGhlc0BzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogSGVu
cnkgU3R5bGVzIDxoZXNAc2lmaXZlLmNvbT4KPiA+IENvLWRldmVsb3BlZC1ieTogRXJpayBEYW5p
ZSA8ZXJpay5kYW5pZUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRXJpayBEYW5pZSA8
ZXJpay5kYW5pZUBzaWZpdmUuY29tPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBHcmVlbnRpbWUgSHUg
PGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1
IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL0tjb25maWcgICAgICB8ICAxMCArCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvTWFrZWZpbGUgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLWZ1NzQwLmMgfCAzMDkgKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMyBmaWxl
cyBjaGFuZ2VkLCAzMjAgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL0tjb25maWcKPiA+IGluZGV4IDIyYzU1MjllOWE2NS4uMjU1ZDQzYjE2NjFiIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwo+ID4gKysrIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwo+ID4gQEAgLTMxOCw0ICszMTgsMTQg
QEAgY29uZmlnIFBDSUVfQUwKPiA+ICAgICAgICAgcmVxdWlyZWQgb25seSBmb3IgRFQtYmFzZWQg
cGxhdGZvcm1zLiBBQ1BJIHBsYXRmb3JtcyB3aXRoIHRoZQo+ID4gICAgICAgICBBbm5hcHVybmEg
TGFicyBQQ0llIGNvbnRyb2xsZXIgZG9uJ3QgbmVlZCB0byBlbmFibGUgdGhpcy4KPiA+Cj4gPiAr
Y29uZmlnIFBDSUVfRlU3NDAKPiA+ICsgICAgIGJvb2wgIlNpRml2ZSBGVTc0MCBQQ0llIGhvc3Qg
Y29udHJvbGxlciIKPiA+ICsgICAgIGRlcGVuZHMgb24gUENJX01TSV9JUlFfRE9NQUlOCj4gPiAr
ICAgICBkZXBlbmRzIG9uIFNPQ19TSUZJVkUgfHwgQ09NUElMRV9URVNUCj4gPiArICAgICBkZXBl
bmRzIG9uIEdQSU9MSUIKPgo+IDEpIEknbSBhIGxpdHRsZSBkaXNhcHBvaW50ZWQgdGhhdCBJIHJl
cG9ydGVkIHRoZSBidWlsZCBpc3N1ZSA2IGRheXMKPiAgICBhZ28gd2hlbiB3ZSB3ZXJlIGFscmVh
ZHkgaW4gdGhlIG1lcmdlIHdpbmRvdywgYW5kIGl0J3MgdGFrZW4gdW50aWwKPiAgICBub3cgdG8g
bWFrZSBzb21lIHByb2dyZXNzLgo+Cj4gMikgSSB3b3VsZCBwcmVmZXIgbm90IHRvIGRlcGVuZCBv
biBHUElPTElCIGJlY2F1c2UgaXQgcmVkdWNlcwo+ICAgIGNvbXBpbGUtdGVzdCBjb3ZlcmFnZS4g
IEZvciBleGFtcGxlLCB0aGUgeDg2XzY0IGRlZmNvbmZpZyBkb2VzIG5vdAo+ICAgIGVuYWJsZSBH
UElPTElCLCBzbyBvbmUgbXVzdCBtYW51YWxseSBlbmFibGUgaXQgdG8gZXZlbiBiZSBhYmxlIHRv
Cj4gICAgZW5hYmxlIFBDSUVfRlU3NDAuCj4KPiAgICBNYW55IG90aGVyIFBDSSBjb250cm9sbGVy
IGRyaXZlcnMgdXNlIEdQSU8sIGJ1dCBubyBvdGhlcnMgZGVwZW5kIG9uCj4gICAgR1BJT0xJQiwg
c28gSSBpbmZlciB0aGF0IGluIHRoZSAhR1BJT0xJQiBjYXNlLCBncGlvL2NvbnN1bWVyLmgKPiAg
ICBwcm92aWRlcyB0aGUgc3R1YnMgcmVxdWlyZWQgZm9yIGNvbXBpbGUgdGVzdGluZy4KPgo+ICAg
IFdlIGNvdWxkIGhhdmUgYSBjb252ZXJzYXRpb24gYWJvdXQgd2hldGhlciBpdCdzIGJldHRlciB0
bwo+ICAgIGV4cGxpY2l0bHkgZGVwZW5kIG9uIEdQSU9MSUIgaGVyZSwgb3Igd2hldGhlciBidWls
ZGluZyBhIHdvcmtpbmcKPiAgICBGVTc0MCBkcml2ZXIgaW1wbGljaXRseSBkZXBlbmRzIG9uIEdQ
SU9MSUIgYmVpbmcgc2VsZWN0ZWQKPiAgICBlbHNld2hlcmUuICBUaGF0IGltcGxpY2l0IGRlcGVu
ZGVuY3kgKmlzKiBhIGxpdHRsZSBvYnNjdXJlLCBidXQgSQo+ICAgIHRoaW5rIHRoYXQncyB3aGF0
IG90aGVyIGRyaXZlcnMgY3VycmVudGx5IGRvLCBhbmQgSSdkIGxpa2UgdG8gZG8KPiAgICB0aGlz
IGNvbnNpc3RlbnRseSB1bmxlc3MgdGhlcmUncyBhIGdvb2QgcmVhc29uIG90aGVyd2lzZS4KPgo+
ICAgIEhlcmUgYXJlIHNvbWUgZXhhbXBsZXMgb2Ygb3RoZXIgZHJpdmVyczoKPgo+ICAgIGR3Yy9w
Y2ktZHJhN3h4LmM6Cj4gICAgICBjb25maWcgUENJX0RSQTdYWF9IT1NUCj4gICAgICAgIGRlcGVu
ZHMgb24gU09DX0RSQTdYWCB8fCBDT01QSUxFX1RFU1QKPgo+ICAgICAgY29uZmlnIFNPQ19EUkE3
WFgKPiAgICAgICAgc2VsZWN0IEFSQ0hfT01BUDJQTFVTCj4KPiAgICAgIGNvbmZpZyBBUkNIX09N
QVAyUExVUwo+ICAgICAgICBzZWxlY3QgR1BJT0xJQgo+Cj4gICAgZHdjL3BjaS1tZXNvbi5jOgo+
ICAgICAgY29uZmlnIFBDSV9NRVNPTgo+ICAgICAgICAjIGRvZXNuJ3QsIGJ1dCBwcm9iYWJseSAq
c2hvdWxkKiBkZXBlbmQgb24gIkFSQ0hfTUVTT04gfHwgQ09NUElMRV9URVNUIgo+Cj4gICAgICBt
ZW51Y29uZmlnIEFSQ0hfTUVTT04KPiAgICAgICAgc2VsZWN0IEdQSU9MSUIKPgo+ICAgIGR3Yy9w
Y2llLXFjb20uYzoKPiAgICAgIGNvbmZpZyBQQ0lFX1FDT00KPiAgICAgICAgZGVwZW5kcyBvbiBP
RiAmJiAoQVJDSF9RQ09NIHx8IENPTVBJTEVfVEVTVCkKPgo+ICAgICAgY29uZmlnIEFSQ0hfUUNP
TQo+ICAgICAgICBzZWxlY3QgR1BJT0xJQgo+Cj4gICAgcGNpZS1yb2NrY2hpcC5jOgo+ICAgICAg
Y29uZmlnIFBDSUVfUk9DS0NISVBfSE9TVAo+ICAgICAgICBkZXBlbmRzIG9uIEFSQ0hfUk9DS0NI
SVAgfHwgQ09NUElMRV9URVNUCj4KPiAgICAgIGNvbmZpZyBBUkNIX1JPQ0tDSElQCj4gICAgICAg
IHNlbGVjdCBHUElPTElCCj4KPiA+ICsgICAgIHNlbGVjdCBQQ0lFX0RXX0hPU1QKPiA+ICsgICAg
IGhlbHAKPiA+ICsgICAgICAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCBQQ0llIGNvbnRyb2xsZXIg
c3VwcG9ydCBmb3IgdGhlIFNpRml2ZQo+ID4gKyAgICAgICBGVTc0MC4KPiA+ICsKPiA+ICBlbmRt
ZW51CgpIaSwKClNvcnJ5IGZvciBsYXRlIHRvIGRlYnVnIHRoaXMgY2FzZS4gSSB3YXMgd29ya2lu
ZyBvbiBvdGhlciB3b3JrcyBhbmQKanVzdCBtaXNzZWQgdGhlIGVtYWlsLgpIb3cgYWJvdXQgdGhp
cz8KCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZy5zb2NzCmluZGV4IGUxYjI2OTBiNmU0NS4uNjZmNTdmMmRiNDlkIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L0tjb25maWcuc29jcworKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwpAQCAt
Nyw2ICs3LDcgQEAgY29uZmlnIFNPQ19TSUZJVkUKICAgICAgICBzZWxlY3QgQ0xLX1NJRklWRQog
ICAgICAgIHNlbGVjdCBDTEtfU0lGSVZFX1BSQ0kKICAgICAgICBzZWxlY3QgU0lGSVZFX1BMSUMK
KyAgICAgICBzZWxlY3QgR1BJT0xJQiBpZiBQQ0lFX0ZVNzQwCiAgICAgICAgaGVscAogICAgICAg
ICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIFNpRml2ZSBTb0MgcGxhdGZvcm0gaGFyZHdhcmUu
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwpiL2RyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcKaW5kZXggMjU1ZDQzYjE2NjFiLi4wYTM3ZDIx
ZWQ2NGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcKKysr
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvS2NvbmZpZwpAQCAtMzIyLDcgKzMyMiw2IEBA
IGNvbmZpZyBQQ0lFX0ZVNzQwCiAgICAgICAgYm9vbCAiU2lGaXZlIEZVNzQwIFBDSWUgaG9zdCBj
b250cm9sbGVyIgogICAgICAgIGRlcGVuZHMgb24gUENJX01TSV9JUlFfRE9NQUlOCiAgICAgICAg
ZGVwZW5kcyBvbiBTT0NfU0lGSVZFIHx8IENPTVBJTEVfVEVTVAotICAgICAgIGRlcGVuZHMgb24g
R1BJT0xJQgogICAgICAgIHNlbGVjdCBQQ0lFX0RXX0hPU1QKICAgICAgICBoZWxwCiAgICAgICAg
ICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IFBDSWUgY29udHJvbGxlciBzdXBwb3J0IGZvciB0aGUg
U2lGaXZlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
