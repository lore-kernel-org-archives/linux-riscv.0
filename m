Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AE1EA795F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdYiY8OH2w+fVURyrBqbTWFtBhQ7SIf5pH/sEHjknI4=; b=u41uFUdxyFMh0X
	kx6kW5sKEVU5D8lWrfF1j6/W6AkPrpk9AkRo62+b/tnwCS9cMAIDR+TB2hjvad/O+jDkthbMfYrm9
	ODSWzYsMZuth7K1+RzF4uCzlpFM/klK6Z/WUla4x1m3sk95d6IqVnvznDFkqtoFHihnzLed3qO0F0
	AKy3ANpKVqk5rBUD717qmFsEmAY2MpKgnos6wQs9QKEjfllM2+fIPRpZ0gEX6KqTo8GqK9OpnqT3P
	NmySLOskYInfj3oId/04G2CM0zA3jWObJm79oHeY//+rd6hVSrsCViXE0SiHczEaWgzqpgaMonfIA
	yuEcYN9Hjj2+0q1ehiSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnqKw-00000009OVB-1jHl;
	Thu, 05 Feb 2026 03:47:22 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnqKt-00000009OUq-33hf
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 03:47:21 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b8e9f89a8e3so47875766b.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 19:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770263238; cv=none;
        d=google.com; s=arc-20240605;
        b=gADfeegkqZ/mL+1gP//vCYoOXDDybQeU0DKgMb1oRAL2gP4cEwGps9Tooe4cspQnSR
         vgGQh1CCw+1v53c4PMhKEduyE6qlmB4MQ0Mzet6V1iYuZev7Rkhu8opH6mxbTt2shjxt
         cfhqhNHRla71W8QCTY7aZ5LeMmLDcMQRMbtZijazf6CMENrouotv44JhTMTewdZcopLJ
         PRbgA+XdS0YobAO21PA3jMfoLC8gWPnN68M20OQt1Gi7KE5LgzAT5YI4rvcrVnOsGb7B
         lXM9C1RfBrlxIF58vr5I2X0RnzPOOYIZlujfwfOAtms7kx0pIwJznxsuH5wBa2QbAaz1
         FIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWzU3QUTkSaGp/URwdKcUANl9SeI3h8kqMKRyxrmMQw=;
        fh=ypoK6+4tX8A5znZcPE7B2EcdZY1H70nFlRT7RYxhurg=;
        b=D46mkx9ds7evloFbrzYZNYSWLfEO/NVByMfrCLS2akOkYIv3Cgw3n48vUv2+rVX/ZE
         MgZAG4Kb4oXHZaxuxgsvfiWd3V55qH7KSdYQM/LAK3kH1Pqq7zMhXKXQXUyTJShe5Gbg
         cPaQQv2Qrrq2cmn9mx8tpGLA4uhGbHqSrvkSaqQDINzLNoVJ2wOT4+ryBj1f9E1Hb/Zu
         8PBhC1WSVOkbqSWJ9/VJVz8CL2n3iOQRku3RpgBmsPF3jYWG8n2mhvbJzNJKP089d5Gx
         xfCybdxvuOoaxsRDe/ShA2BqDellOZOLyWdyz1Xdp3bsGJd631bw0QBqhnuG+ehSp/tN
         vUtg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770263238; x=1770868038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWzU3QUTkSaGp/URwdKcUANl9SeI3h8kqMKRyxrmMQw=;
        b=JYRPdmp9LLmLybYobKjYsR6uz0nq/f2YaiaUlSSYx/SDv3DOa0QbuO/zFZ9ZlKHJox
         IgKLSvgd9p5R1kFu7zwqwoZPKQB7GCo+HYTWqQsypDK8tHsfOv1dAuB4QLFJKas0IJ/H
         bh1jTXsVXaCA3XX24d3vncfD844KDr6GXGTG+xUMYDV0iaCMESnVt4AW90gwuEAPhlcN
         GajNhxGGVI1V+5q9AXukQhN9X8Hj2bo7cjuOxenGttfstyKmV5P9Rs+AwqzML2xbEOuK
         fHBCqjF3UiGhv9O/ftOr86QKa80F0prQlRwGunKEI2iXNkC6NTlRbioRX5VAbLwSek/3
         mB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770263238; x=1770868038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWzU3QUTkSaGp/URwdKcUANl9SeI3h8kqMKRyxrmMQw=;
        b=l2oY/6il8vz5IEvkgySUiVGUTYWuhDyMCkmRD6W+bzALUxDXR24VdbTRU8beAO7GpU
         o3NPblAqBg8RBRCknXeJZUg2zZBX8tHB3xBxC783TR3nhK0LI7vkSdHCx3RZqvaHY1Uc
         eHDPqUjQzLFOlwNi4F4V/foWCGSruHn9FE8LnCbseEfGEkut9j1uJtIg2khoyCaBGfRq
         nBPoZhnvP34Mi2ka8MwWE3tgt+/ZiBj5tz2MYKruQHCeXQOnNQuyHjOlKFBZFdB2PjAX
         4wbn+0gC89ObsYqI4jOgsgHoO78+ula8cYb3HiR+tg8Kz6s1ZIw01o43+lQXhDmSdN1C
         ad+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXmBfNALhkp6Z5WN0D/IUk8SAGwawg4hXatPU3mDp53Psi/Q8in0ne/L6VfK4PescqttguGrx8GuGYfpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ9gVowtExTUp4u6QClHhZA8wFJbj4Pw/w/H2ndIhHmBufx/0N
	TWVIjWnW/k2W0UEXI0TiySl+lDayPEYNC/sQW132LiVyRLbOyYfIqA7E97uEFbtD1xEHvC0EgiP
	XkAA/ml4iIycKdaNQT9FSmmE7A0RM1cKsBdljlEVxSQ==
X-Gm-Gg: AZuq6aLmbGL5gc7gVPXIlKsyPLdWivLtVdGjom3l3NeTtXsrEORXM4F9MDaU6vr/QJV
	Ubnk+/ho2WXhhpJ9Tk36SZ3zjGg1hPrvhMqoYgxa3E/PGpuV74LkyNKCLhui9BJgVG/NJRo+jiY
	1N9pc2THhW5y85bM13mEt1kAH73+5lqP36AycyLip+NaCRLczHuvp3X4XeAeGqiKqyTVCI4MZ5l
	nKlvccc5gYHi+dkPXu1nHqmCePxghMoyVcowiPGXu1ysmLz0oyGyRLqnNGBTluSjabMSWFGPmNu
	LOqEV49q
X-Received: by 2002:a17:907:9409:b0:b8e:8874:8384 with SMTP id
 a640c23a62f3a-b8e9ef30487mr317378866b.4.1770263237571; Wed, 04 Feb 2026
 19:47:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs> <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
In-Reply-To: <4D87481E9AABE2C6+72d18f72-9407-4d68-8195-edc6c171df14@linux.spacemit.com>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Feb 2026 11:47:07 +0800
X-Gm-Features: AZwV_Qj4QZXbWJXyq8Jiiv-VQvhct2TUKL3kLYYPr0oB9fDJjewtTcIansChXl4
Message-ID: <CANXhq0q8N5eHx9ytabZR97Y7AULKwgS2-uEGhcaOOGp9mvbtRQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance monitoring
To: Lv Zheng <lv.zheng@linux.spacemit.com>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>, iommu@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_194719_828364_A75663D3 
X-CRM114-Status: GOOD (  27.62  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCAxMTozNeKAr0FNIEx2IFpoZW5nIDxsdi56aGVuZ0BsaW51
eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+Cj4gT24gMi81LzIwMjYgMjozOSBBTSwgQW5kcmV3IEpv
bmVzIHdyb3RlOgo+ID4gSG93IGRvZXMgdGhpcyByZWxhdGUgdG8KPiA+Cj4gPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMTUwMzAzMDYuMjk3MzUtMS16b25nLmxpQHNpZml2ZS5j
b20vCj4gPgo+ID4gIEZyb20gYSBxdWljayBza2ltIGl0IGxvb2tzIGxpa2UgdGhlcmUncyBwbGVu
dHkgb2Ygb3ZlcmxhcC4KPgo+IFdlIGRldmVsb3BlZCB0aGUgZHJpdmVyIGluIDIwMjQgYW5kIGRl
bW9uc3RyYXRlZCBpdCBpbiBDaGluYSBzdW1taXQuIFdlCj4gZGlkbid0IG5vdGljZSB0aGF0IGEg
cGF0Y2ggaXMgb24tZ29pbmcgbm93IGluIHRoZSBjb21tdW5pdHkuCj4KPiBOb3cgaXQgbG9va3Mg
b3VyIGFwcHJvYWNoIHNvbHZlZCBtb3JlIGlzc3VlcywgYW5kIHdlJ2xsIGNoZWNrIGFuZCB1cGRh
dGUKPiBpZiB0aGVyZSBhcmUgYW55IGNvbW11bml0eSBjb25jZXJucyBzdGlsbCBub3QgYWRkcmVz
c2VkIGluIHRoaXMgcGF0Y2hzZXQuCj4KPiBXZSBjYW4gYWRkIFJldmlld2VkLWJ5L1Rlc3RlZC1i
eSBhbmQgU2lnbmVkLW9mZi1ieSBvZiBab25nIExpIHRvIHRoaXMKPiBwYXRjaCBpZiBoZSB3aXNo
ZXMuCj4KPiBUaGFua3MsCj4gTHYKPgoKUGVyaGFwcyBJIGNhbiBmaXJzdCBwb3N0IG15IG5leHQg
cmV2aXNpb24gdG8gdGhlIG1haWxpbmcgbGlzdCAoaG9wZSBpdAp3b24ndCB3YXN0ZSB0aGUgY29t
bXVuaXR5IHJlc291cmNlKSwgc28gdGhhdCB5b3UgY291bGQgaGF2ZSBhIGNoYW5jZQp0byByZXZp
ZXcgaXQgYW5kIHNlZSB3aGV0aGVyIHRoYXQgdmVyc2lvbiBpcyBhcmNoaXRlY3R1cmFsbHkgY2xv
c2VyIHRvCndoYXQgdGhlIGNvbW11bml0eSBpcyBsb29raW5nIGZvciwgd2hpbGUgYWxzbyBhZGRy
ZXNzaW5nIHlvdXIgaXNzdWUuCklmIHlvdSBhbHNvIGZlZWwgdGhhdCBteSBuZXh0IHJldmlzaW9u
IG1lZXRzIHlvdXIgbmVlZHMsIHBlcmhhcHMgeW91CmNvdWxkIGFwcGVuZCB5b3VyIGFkZGl0aW9u
YWwgaW1wbGVtZW50YXRpb25zIG9uIHRvcCBvZiBpdC4KCk9mIGNvdXJzZSwgaWYgdGhlIGNvbW11
bml0eSB3b3VsZCBwcmVmZXIgdG8gZ28geW91ciB2ZXJzaW9uLCBJ4oCZbQpwZXJmZWN0bHkgZmlu
ZSB3aXRoIHRoYXQgYXMgd2VsbC4KCj4gPgo+ID4gVGhhbmtzLAo+ID4gZHJldwo+ID4KPiA+Cj4g
PiBPbiBXZWQsIEZlYiAwNCwgMjAyNiBhdCAwNTowOTowMVBNICswODAwLCBMdiBaaGVuZyB3cm90
ZToKPiA+PiBGcm9tOiBKaW5neXUgTGkgPGpvZXkubGlAc3BhY2VtaXQuY29tPgo+ID4+Cj4gPj4g
SW50cm9kdWNlcyBwZXJmLWJhc2VkIEhQTSBkcml2ZXIgZm9yIFJJU0MtViBJT01NVSwgZW5hYmxp
bmcgcGVyZm9ybWFuY2UKPiA+PiBtb25pdG9yaW5nIGNhcGFiaWxpdGllcy4KPiA+Pgo+ID4+IE5v
dGUgdGhhdCB0aGUgUklTQy1WIElPTU1VIEhQTSBtb2R1bGUgdXNlcyBDT1VOVEVSX01BWC0xIGFz
IGEgc3RhdGljCj4gPj4gY291bnRlciBpbmRleCBvZiBIUE1DWUNMRVMsIGFuZCAwfkNPVU5URVJf
TUFYLTIgYXMgdGhlIGR5bmFtaWMgY291bnRlcgo+ID4+IGluZGV4ZXMgb2Ygb3RoZXIgSFBNRVZF
TlRTIGluIG9yZGVyIHRvIGNvcnJlY3RseSBpbmRleCBpbnRvIElPSFBNRVZUIGFuZAo+ID4+IElP
SFBNQ1RSIHJlZ2lzdGVycyB0aGF0IGhhdmUgYWxyZWFkeSBiZWVuIGRlZmluZWQgaW4gdGhlIGlv
bW11LWJpdHMuaC4KPiA+PiBIb3dldmVyIHRoZSB1c2VycyB0cmVhdCAwIGFzIHRoZSBpbmRleCBv
ZiBIUE1DWUNMRVMgYW5kIDF+Q09VTlRFUl9NQVgtMSBhcwo+ID4+IHRoZSBpbmRleGVzIG9mIG90
aGVyIEhQTUVWRU5UUywgdGh1cyBjYXJlIHNob3VsZCBiZSB0YWtlbiBpbiBkZWFsaW5nIHdpdGgK
PiA+PiBjb3VudGVyIGluZGV4ZXMgYmV0d2VlbiB1c2Vyc3BhY2UgYW5kIGtlcm5lbCBzcGFjZS4K
PiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEppbmd5dSBMaSA8am9leS5saUBzcGFjZW1pdC5jb20+
Cj4gPj4gU2lnbmVkLW9mZi1ieTogTHYgWmhlbmcgPGx2LnpoZW5nQGxpbnV4LnNwYWNlbWl0LmNv
bT4KPiA+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1pb21t
dQo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9pb21tdS9yaXNjdi9LY29uZmlnICAgICAgICAgIHwg
ICA5ICsKPiA+PiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUgICAgICAgICB8ICAgMSAr
Cj4gPj4gICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWJpdHMuaCAgICAgfCAgIDYgKwo+ID4+
ICAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1ocG0uYyAgICAgIHwgODQzICsrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4+ICAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wY2kuYyAg
ICAgIHwgIDEzICstCj4gPj4gICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3JtLmMg
fCAgIDggKy0KPiA+PiAgIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaCAgICAgICAgICB8ICA0
MiArKwo+ID4+ICAgNyBmaWxlcyBjaGFuZ2VkLCA5MTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiA+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LWhwbS5jCj4gPj4KPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
