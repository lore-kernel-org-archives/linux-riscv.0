Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A88B606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VoWDooUx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZwIzZq+o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9dGZA1jJ0P1AivOgUTR0Q3VdvsPfy5ChXzXQWDfEN+c=; b=VoWDooUxSeB0o0exgi2OZ1yoz4
	Y5dzoAWErYBpJn1ffugrVdsN5QJRUoBqy+KMQyewcdyd2WeRHAEit1mVfffxur+mxbxCGL1DCeoZh
	PWmDsJtrqKEMkJzxU6YvSJ04yy7NlUYimNePzWbToy661TROAr6Kc4Cv0qJ+rWIczPxlUCZ7zCSCv
	vhcf0CzrbmoYA0AcXF11MaVO5hd2iuRXLoKP/rVE5x8f82fuy3DymZFpOdVOoWBsOUxtqNN2X7oj9
	wBwI4noHpfAN4WiO6Yw+5Ow2dfzY5XiLqmOEjsh4kMCScDcUe0Ao+mw/F5shEJdpjXTi+VMWE6l7O
	vlAfD4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM49j-000000078Wd-2Bf8;
	Wed, 28 Oct 2026 13:57:31 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM49g-000000078Vi-1wuM;
	Wed, 28 Oct 2026 13:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793195849; x=1824731849;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kjoWncs6Ir+gA9d8rwO7aJw5Gvr2T1m9bpDOqJloaOw=;
  b=ZwIzZq+ozL1CIxqmw2WKf+NvZDuyx0YsJkKbifCOXplLjHYlj78YhoqF
   GZ4T178s+rBLI0Wf6czymlgpO66CsBppllp38+eBcU8J3hQ6f/cDvKtZP
   JxjJWmRb2EZ85mYaiFpCFTqq1X9LCeVFZI0KEkHbn5cHqU6SaU5u8Ncm6
   qpjQnIPSURjzw6CSmmKs7fntpwTeurt2QIiDz2WcQHuXOKCj5UAbCF00b
   +zyFqLAA89r08MVecMbTUErEtSMGZbNtyJmpRCJdRVvqPHMJu9IlCFQbH
   Pu5OqHFRAcxSTEnq9VeFFBD26ZA/xsK/L4Znb8vsztKCUnFTErbKNOmFS
   w==;
X-CSE-ConnectionGUID: NzN1LAoPR5GOC5+F1c4rhg==
X-CSE-MsgGUID: fUtc+uuEQoaybo+koIXSFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1929839"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1929839"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:57:27 -0700
X-CSE-ConnectionGUID: XGvMYi6BQtyLHQWIIJ1jww==
X-CSE-MsgGUID: zT8iJdk1T9Kr8hcOLr1FEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6667408"
Received: from ncintean-mobl1.ger.corp.intel.com ([10.245.244.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 06:57:14 -0700
Message-ID: <733ef8df15abeeacea0ac12dd93ad1eba5755dbe.camel@linux.intel.com>
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, Sakari
 Ailus	 <sakari.ailus@linux.intel.com>, Broadcom internal kernel review list
	 <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli	
 <florian.fainelli@broadcom.com>, Eugeniy Paltsev
 <Eugeniy.Paltsev@synopsys.com>,  Frank Li <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Imre Kaloz	 <kaloz@kernel.org>, Conor
 Dooley <conor.dooley@microchip.com>, Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>,  Daniel Palmer <daniel@thingy.jp>, Romain
 Perier <romain.perier@gmail.com>, Robert Jarzmik	 <robert.jarzmik@free.fr>,
 imx@lists.linux.dev, 	linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Hoan Tran	 <hoan@os.amperecomputing.com>,
 Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, 
	linux-hwmon@vger.kernel.org, Matti Vaittinen <mazziesaccount@gmail.com>, 
 "Enrico Weigelt, metux IT consult"	 <info@metux.net>, Viresh Kumar
 <vireshk@kernel.org>, 	virtualization@lists.linux.dev, Yinbo Zhu
 <zhuyinbo@loongson.cn>, Thierry Reding	 <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, 	linux-tegra@vger.kernel.org, Geert
 Uytterhoeven <geert+renesas@glider.be>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Srinivas Neeli
 <srinivas.neeli@amd.com>, Michal Simek	 <michal.simek@amd.com>,
 linux-aspeed@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Michael Buesch <m@bues.ch>,
 William Breathitt Gray	 <wbg@kernel.org>, Robert Richter <rric@kernel.org>,
 Andy Shevchenko	 <andriy.shevchenko@linux.intel.com>,
 linux-acpi@vger.kernel.org
Date: Wed, 28 Oct 2026 14:57:11 +0100
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
User-Agent: Evolution 3.56.2-9 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_065728_561693_C67807A0 
X-CRM114-Status: GOOD (  12.75  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgpPbiBUdWUsIDIwMjYtMTAtMjcgYXQgMTE6NDggKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmln
IChUaGUgQ2FwYWJsZSBIdWIpCndyb3RlOgo+IEhlbGxvLAo+IAo+IHRoZSBvcmlnaW5hbCBtb3Rp
dmF0aW9uIGZvciB0aGlzIHNlcmllcyBhcmUgdGhlIHBhdGNoZXMgdGhhdCBjb252ZXJ0Cj4gdGhl
Cj4gYXJyYXlzIHRvIHVzZSBuYW1lZCBpbml0aWFsaXplcnMsIHNlZQo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC9jb3Zlci4xNzgwMDQ4OTI1LmdpdC51LmtsZWluZS1rb2VuaWdAYmF5bGli
cmUuY29tLwo+IGZvciB0aGUgaWRlYSBiZWhpbmQgaXQuIExvb2tpbmcgbGVmdCBhbmQgcmlnaHQg
YSBiaXQgd2hpbGUKPiBpbXBsZW1lbnRpbmcKPiB0aGF0LCB0aGUgc2VyaWVzIGdyZXcgYSBiaXQu
Cj4gCj4gQ2hhbmdlcyBzaW5jZSB2MyAoYXZhaWxhYmxlIGF0Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL2NvdmVyLjE3OTMwMzA4MjAuZ2l0LnUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5j
b20KPiApOgo+IAo+IMKgLSBQaWNrZWQgdXAgcmV2aWV3IHRhZ3MgKGI0IGV2ZW4gZm91bmQgc29t
ZSBmcm9tIHYyKQo+IMKgLSBBZGQgYSAybmQgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgLi4uKSBp
biBkcml2ZXJzL2dwaW8vZ3Bpby0KPiBtcGM1MjAwLmMKPiDCoMKgIChNeSBncmVwIGRpZG4ndCBo
YW5kbGUgPjEgZHJpdmVyIHBlciBmaWxlIHdlbGwpLCBub3RpY2VkIGJ5Cj4gU2FzaGlrbwo+IMKg
LSBOZXcgcGF0Y2ggdG8gdXNlIG5hbWVkIGluaXRpYWxpemVycyBmb3IgYXV4aWxpYXJ5X2Rldmlj
ZV9pZCBhcnJheXMKPiDCoC0gRml4IGNvZGUgc3R5bGUgb2Ygb2ZfZGV2aWNlX2lkIGFycmF5IGlu
IGRyaXZlcnMvZ3Bpby9ncGlvLWdyZ3Bpby5jCj4gwqDCoCAoTXkgc2NyaXB0IGRvZXNuJ3QgaGFu
ZGxlIG9mX2RldmljZV9pZDo6bmFtZSkgYW5kCj4gwqDCoCBkcml2ZXJzL2dwaW8vZ3Bpby1wcGM0
NHguYyAoZGlkbid0IGV4aXN0IHlldCB3aGVuIEkgc2VudCB2MiBhbmQKPiDCoMKgIGZhaWxlZCB0
byBub3RpY2UgdGhhdCBmb3IgdjMpCj4gwqAtIEZpeCBjb2RlIHN0eWxlIG9mIGF1eGlsaWFyeV9k
ZXZpY2VfaWQgYXJyYXkgaW4KPiDCoMKgIGRyaXZlcnMvZ3Bpby9ncGlvLXNoYXJlZC1wcm94eS5j
LCBtaXNzZWQgYXMgSSBkaWRuJ3QgaGF2ZSBhIHNjcmlwdAo+IMKgwqAgZm9yIGF1eGlsaWFyeV9k
ZXZpY2VfaWQgYmVmb3JlLgo+IMKgLSBEcm9wcGVkIGEgZmV3IGJyb2tlbiBlbWFpbCBhZGRyZXNz
ZXMgZnJvbSBDYzoKPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKPiBVd2UgS2xlaW5lLUvDtm5p
ZyAoVGhlIENhcGFibGUgSHViKSAoMjMpOgo+IFsuLi5dCj4gwqAgZ3BpbzogVXNlIG5hbWVkIGlu
aXRpYWxpemVycyBmb3IgYWNwaV9kZXZpY2VfaWQgYXJyYXkKPiBbLi4uXQo+IMKgIGdwaW86IFVu
aWZ5IHN0eWxlIG9mIGFjcGlfZGV2aWNlX2lkIGFycmF5cwo+IFsuLi5dCj4gCj4gWy4uLl0KPiDC
oGRyaXZlcnMvZ3Bpby9ncGlvLW5vdmFsYWtlLWV2ZW50cy5jIHzCoCA0ICsrLS0KPiBbLi4uXQo+
IAoKRm9yIGdwaW8tbm92YWxha2UtZXZlbnRzCgpBY2tlZC1ieTogQWxhbiBCb3J6ZXN6a293c2tp
IDxhbGFuLmJvcnplc3prb3dza2lAbGludXguaW50ZWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
