Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F8B606A338
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XSHgx72/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mP4DwPyz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3uuyTRs0sLw57WXvDo+7moc1aZIQodU96NmW2+QZxII=; b=XSHgx72/5fQG5lelUU/8687pfR
	++cSbE1jy9tAcPzgKDXc1ilinBmMPlIocmY+nCKQ4Y8SnO3RMapzuAS6eZpnVHiy7WJEO8p/oQm7A
	3XIfD3yP1QMwZbCx5Pp/fKaWAUj4wCgpfFPRgGoOdU9NksHdYjnDsp9MkhZBb26qc1w7ifj9z7IqD
	PIk7/T8Q0Ej5SIqPc35McOh7VuKe4s8KAp9ghqOxVezkdMwWZ5VjGUwYfqgYzkAnXiIbT/YgWdiM2
	HYbcRD2geeh2jo/7GxjQKbQ3L7GY8wgWeGBK64U6zT+grbeJVueFnTCxAWqkkOhV6xF5pi6KS1iP2
	KxVo3Vpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisn-00000009anh-2rcM;
	Wed, 18 Nov 2026 16:51:41 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisS-00000009aT7-3KDx;
	Wed, 18 Nov 2026 16:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795020681; x=1826556681;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=ajDnh0zw+64dcFPrEUfvS5sWfWZYQWJZbcQwO+AcVNs=;
  b=mP4DwPyzA12OflFAs7cqsLyFUlGk851Vd/gqVwVcN25x8BrQL+i7AmOL
   8mYJpmast9tqACSNx8lBA4jZ4/q1QzUvavsA4vMpmrO4kXPI5tmgD7UvX
   RIKZkYtrXgFcDgMSDp8+RxF/Qsk0Pdt1zP/11+VRi9zgvwFg2kn0/zAaJ
   juFRnpN5gAXJQ16xhWq2lvyYTb3qIRMVB9Yj0aB5dYr71LMGSI/TCUXfu
   Q/vbbt3vkm3f9HlNHt84ek7qFjbaO9159QwvU9BrlJgluRx7ACzWJzJJs
   wtZ+6YyX/GEjAKJa7Ohka54I7IWU1FNw+PjgE6WXf82fCJhvvI5wWCOY1
   w==;
X-CSE-ConnectionGUID: oZ2rE8KxRlG7KJlEHRUcVA==
X-CSE-MsgGUID: 8DpQhJ4ORkulGvnvyMycQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3699699"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3699699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:50:31 -0800
X-CSE-ConnectionGUID: k/DCmaX/Qp2q9S20vakyDw==
X-CSE-MsgGUID: YVFQiz1BSVmcIhLrCJbvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9985477"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.187])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 08:50:21 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sasha
 Finkelstein <k@chaosmail.tech>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-riscv@lists.infradead.org, etnaviv@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imagination@lists.freedesktop.org,
 linux-mips@vger.kernel.org, lima@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
In-Reply-To: <av2rKJQ0AKU9CFZI@monoceros>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
 <av2rKJQ0AKU9CFZI@monoceros>
Date: Wed, 18 Nov 2026 18:50:19 +0200
Message-ID: <8ebe3b7219ffd963a498cccbcfe6cefc92717f0c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085120_862726_7CECB254 
X-CRM114-Status: GOOD (  23.59  )
X-Spam-Score: -4.3 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAxOCBOb3YgMjAyNiwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bi
YXlsaWJyZS5jb20+IHdyb3RlOgo+IEhlbGxvIEphbmksCj4KPiBPbiBXZWQsIE5vdiAxOCwgMjAy
NiBhdCAwMzoyNzo0MFBNICswMjAwLCBKYW5pIE5pa3VsYSB3cm90ZToKPj4gPiBbLi4uXQo+PiA+
ICBkcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWNvbW1vbi5jICAgICAgICAgICAgICAgfCAgIDggKy0K
Pj4gPiAgZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1wcmUuYyAgICAgICAgICAgICAgICAgIHwgICA0
ICstCj4+ID4gIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtcHJnLmMgICAgICAgICAgICAgICAgICB8
ICAgNCArLQo+PiA+ICAyNTQgZmlsZXMgY2hhbmdlZCwgMTE1NSBpbnNlcnRpb25zKCspLCA5NDAg
ZGVsZXRpb25zKC0pCj4+IAo+PiBIb3cgZG8geW91IGV4cGVjdCBhIHBhdGNoIG9mIHRoaXMgc2l6
ZSBiZSBtZXJnZWQ/Cj4KPiBVc2luZyBiNCBhbSA6LSkgSG9uZXN0bHksIGluIHRoZSBjb3ZlciBs
ZXR0ZXIgSSB3cm90ZSBhYm91dCBhbiBpbW11dGFibGUKPiBicmFuY2ggYW5kIG9mZmVyZWQgdG8g
cmViYXNlIHRvIDcuNC1yYzEuIFdoZW4gdHJ5aW5nIHRvIGFwcGx5IHRoaXMKPiBzZXJpZXMgb24g
dG9wIG92IDcuNC1yYzEgdGhlcmUgYXJlIG9ubHkgNiBjb25mbGljdHMgKDF4IG1vZGlmeS9kZWxl
dGUKPiBhbmQgNXggY29udGVudCk7IHRoZXNlIGFyZSBhbGwgbm90IHNvIGhhcmQgdG8gcmVzb2x2
ZSAoYW5kIGV2ZW4gZHJvcHBpbmcKPiB0aGUgcmVzcGVjdGl2ZSBodW5rcyAoaS5lLiByZXNvbHZp
bmcgdXNpbmcgYGdpdCBjaGVja291dCBIRUFEYCkgaXMgZmluZQo+IGZvciBtZS4pCj4KPj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wY2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2k5MTVfcGNpLmMKPj4gPiBpbmRleCA4NGE3ZGM2YWI1ZGIuLmZhY2ViM2RlNGZh
MyAxMDA2NDQKPj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3BjaS5jCj4+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9wY2kuYwo+PiA+IEBAIC04NzAsNyArODcw
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlkbGlzdFtdID0gewo+
PiA+ICAJSU5URUxfQVRTX01fSURTKElOVEVMX1ZHQV9ERVZJQ0UsICZhdHNfbV9pbmZvKSwKPj4g
PiAgCUlOVEVMX0FSTF9JRFMoSU5URUxfVkdBX0RFVklDRSwgJm10bF9pbmZvKSwKPj4gPiAgCUlO
VEVMX01UTF9JRFMoSU5URUxfVkdBX0RFVklDRSwgJm10bF9pbmZvKSwKPj4gPiAtCXt9Cj4+ID4g
Kwl7IH0KPj4gCj4+IFBlcnNvbmFsbHksIEkgd291bGQgKmFsd2F5cyogdXNlIHt9IGluc3RlYWQg
b2YgeyB9LCBhbmQgd291bGQgcmF0aGVyIG5vdAo+PiBjaGFuZ2UuCj4+IAo+PiBBY3Jvc3MgdGhl
IHRyZWUsIHt9IGlzIHNsaWdodGx5IG1vcmUgY29tbW9uIHRoYW4geyB9LiBJTU8gY2hhbmdpbmcg
dGhlbQo+PiBpcyBwb2ludGxlc3MgY2h1cm4uCj4KPiBJdCBkZXBlbmRzIG9uIGhvdyB5b3UgY291
bnQuIE15IHN0YXRpc3RpYyBsb29rcyBhcyBmb2xsb3dzIChvbiB0b3Agb2YKPiBuZXh0LTIwMjYx
MTE3KToKPgo+IAkkIGdpdCBncmVwIC1sIGRldmljZV9pZCB8IHhhcmdzIC1uIDEgcGVybCAtZyAt
biAtZSAncHJpbnQgIiQxXG4iIGlmIG0vZGV2aWNlX2lkXHMqW2EtekEtWl8wLTldKlxbXF1ccyo9
XHMqeyg/OlxzKntbXn1dKn0sXHMqKHtccyp9KSkvJyB8IHNvcnQgfCB1bmlxIC1jCj4gCSAgICAg
IDIgCX0KPiAJICAgICAgMiB7Cj4gCSAgICAgIDYgeyAgfQo+IAkgICAyNTk4IHsgfQo+IAkgICAx
MjYyIHt9Cj4KPiBTbyBvdmVyIGFsbCAqX2RldmljZV9pZCB7IH0gaXMgbW9yZSBjb21tb24gYnkg
YSBmYWN0b3Igb2YgPiAyLiBUaGlzCj4gc2VyaWVzIGZpeGVzIG9uZSB7ICB9IGFuZCByZWR1Y2Vz
IHRoZSBudW1iZXIgb2Yge30gYnkgMzcuIEZvciBvbmx5Cj4gcGNpX2RldmljZV9pZCBpdCdzOgo+
Cj4gCSQgZ2l0IGdyZXAgLWwgcGNpX2RldmljZV9pZCB8IHhhcmdzIC1uIDEgcGVybCAtZyAtbiAt
ZSAncHJpbnQgIiQxXG4iIGlmIG0vcGNpX2RldmljZV9pZFxzKlthLXpBLVpfMC05XSpcW1xdXHMq
PVxzKnsoPzpccyp7W159XSp9LFxzKih7XHMqfSkpLycgfCBzb3J0IHwgdW5pcSAtYwo+IAkgICAg
MTU5IHsgfQo+IAkgICAgIDMyIHt9Cj4KPiBXaXRob3V0IHRoZSBjb250ZXh0IG9mIGFuIGFycmF5
IGluaXRpYWxpemVyIHRoZXJlIGFyZSBtYW55IGVtcHR5Cj4gY29kZSBibG9ja3MgKGZ1bmN0aW9u
IGJvZHlzIG9yIGBkbyB7fSB3aGlsZSAoMClgKSwgZW1wdHkgZHQgbm9kZXMsIGFuZAo+IHt9IGlu
IFJ1c3QgY29kZSwgd2hpY2ggSU1ITyBoYXZlIHRvIGJlIGNvbnNpZGVyZWQgb2ZmLXRvcGljIGZv
ciB0aGlzCj4gc3RhdGlzdGljLgoKSSByZWFsaXplIG15IHBocmFzaW5nIHdhcyBjYXJlbGVzcy4K
Ck15IHBvaW50IHdhcyBub3Qgc28gbXVjaCBhYm91dCBvbmUgYmVpbmcgbW9yZSBjb21tb24gdGhh
biB0aGUgb3RoZXIsIGJ1dApyYXRoZXIgdGhhdCB0aGVyZSBhcmUgKnRob3VzYW5kcyogb2YgaW5z
dGFuY2VzIG9mIGJvdGgsIHNwZWNpZmljYWxseSBhcwpDIGNvbXBvdW5kIGxpdGVyYWxzIHdpdGgg
ZW1wdHkgaW5pdGlhbGl6ZXIgbGlzdC4gSSB0aGluayBpdCdzIHBvaW50bGVzcwp0byBjb252ZXJ0
IG9uZSB0byBvdGhlciwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHlvdSdyZSBhZGRpbmcgb3IgcmVt
b3ZpbmcKYSBzcGFjZS4KCkkgbWVudGlvbmVkIG15IHByZWZlcmVuY2UsIGJlY2F1c2UgaWYgSSB3
ZXJlIHRvIGdvIG9uIGEgc3R5bGUgZml4aW5nCnNwcmVlLCBJJ2QgZ28gdGhlIG90aGVyIGRpcmVj
dGlvbi4gQnV0IEkgdGhpbmsgdGhhdCB0b28gd291bGQgYmUKcG9pbnRsZXNzLgoKSSBzdWdnZXN0
IHRvIGp1c3QgYWNjZXB0IGVpdGhlci4KCgpCUiwKSmFuaS4KCgotLSAKSmFuaSBOaWt1bGEsIElu
dGVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
