Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855DA606D804
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0umK4RcO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdKeqRHF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+ynEs4VQFXSBoEBZToX+7G84SBpZTwRSFmicDRAzbNc=; b=0umK4RcOAjxmyUiFbSBI+Slcbe
	tDB+byfUOGsTI4cjVsmM/vGMCMkf+MTBWpGLPBK38I+QkPldVjVJLgHMKswS03/V0EEI8Iok90Xyw
	DmiVspO3lT73U+kZxKrW+GTqUsmy2kXn0GiSrm2LMi62xvk7MXKRKwjnhXYrRiR8SqcAyqED5tlk3
	0U0KnzgCIVYlx7FktlSpLh708USalLnd4q8PM0NHdc45gprBCed/ZONRLVsu2KIkSkDzaXHqvv5/H
	dtvRpPaSULQP+grgluUMb3/DeXqOgnkRLBdtvrJVb8pWb6TtZVfpxWcQ5TvueBoVJXMlu9LXaE7h4
	VCT0oOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIUR-0000000CDRB-3d8b;
	Fri, 06 Nov 2026 11:52:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIUQ-0000000CDPY-0oyT;
	Fri, 06 Nov 2026 11:52:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DACA743BBE;
	Fri,  6 Nov 2026 11:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8731F008AB;
	Fri,  6 Nov 2026 11:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965933;
	bh=x4R1KJ8aSDphl2LcCS6CvgrEOcfwytQMmMr8A/7wcqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mdKeqRHFYOg8ENrNWN71+qqIn1anHGJLPU2Fp+Ej948gLRr96t/1AEydZuO75yBs9
	 DmFWEq0hQAEFbLt3sHBH8kMRb8QsAXN289DmBlwCTscHWZSaLTSZ292UbXLYHlN/Lh
	 9rfv5+bkF/1zG2yRucyhD6IpgW7NSq0wew0T10Rf1ernIbYzXnlSRwQiOs5en7WPkJ
	 uNLv330A/Hlx74I2ILfc+HazPXlGXgEcyDtSFYibGEsqN/0zzdzZmJvNhFKyigs/BP
	 b9/kEbIui1ok/wZflXvNQ9yPclYlaamPxIed+Z77KivCrpx7U9ApbJPlw6axU0tOP6
	 gG35Cwzd1z0Dg==
Date: Fri, 6 Nov 2026 12:52:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jun Chang <jun.chang@metanoia-comm.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>, Mark Brown <broonie@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Randolph Sheng-Kai =?utf-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, linux-phy@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 23/25] usb: dwc2: add support for Metanoia MT2824
Message-ID: <20261106-glistening-flounder-from-mars-3ec4af@quoll>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-23-86087eaf5af4@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106-mt2824-v1-23-86087eaf5af4@bootlin.com>
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

T24gRnJpLCBOb3YgMDYsIDIwMjYgYXQgMTA6MzA6MjBBTSArMDEwMCwgQmVub8OudCBNb25pbiB3
cm90ZToKPiBBZGQgY29yZSBwYXJhbWV0ZXJzIGZvciB0aGUgTWV0YW5vaWEgTVQyODI0IERXQzIg
Y29udHJvbGxlcjogaGlnaC1zcGVlZAo+IFVUTUkgUEhZLCBubyBob3N0IERNQSwgYW5kIG5vIE9U
RyBITlAvU1JQIHN1cHBvcnQuCj4gCj4gT3JpZ2luYWxseS1ieTogSnVuIENoYW5nIDxqdW4uY2hh
bmdAbWV0YW5vaWEtY29tbS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVu
b2l0Lm1vbmluQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBkcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5j
IHwgMTMgKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jIGIvZHJpdmVycy91c2Iv
ZHdjMi9wYXJhbXMuYwo+IGluZGV4IDA5MWJmY2ZlZjc1My4uZDZhNmE1ODFkMDIxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMKPiArKysgYi9kcml2ZXJzL3VzYi9kd2My
L3BhcmFtcy5jCj4gQEAgLTMwMyw2ICszMDMsMTcgQEAgc3RhdGljIHZvaWQgZHdjMl9zZXRfc3Rt
MzJtcDE1X2hzb3RnX3BhcmFtcyhzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpCj4gIAlwLT5oaXJk
X3RocmVzaG9sZF9lbiA9IGZhbHNlOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBkd2MyX3NldF9t
ZXRhbm9pYV9tdDI4MjRfcGFyYW1zKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykKPiArewo+ICsJ
c3RydWN0IGR3YzJfY29yZV9wYXJhbXMgKnAgPSAmaHNvdGctPnBhcmFtczsKPiArCj4gKwlwLT5v
dGdfY2Fwcy5obnBfc3VwcG9ydCA9IGZhbHNlOwo+ICsJcC0+b3RnX2NhcHMuc3JwX3N1cHBvcnQg
PSBmYWxzZTsKPiArCXAtPnNwZWVkID0gRFdDMl9TUEVFRF9QQVJBTV9ISUdIOwo+ICsJcC0+aG9z
dF9kbWEgPSBmYWxzZTsKPiArCXAtPnBoeV90eXBlID0gRFdDMl9QSFlfVFlQRV9QQVJBTV9VVE1J
Owo+ICt9Cj4gKwo+ICBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3YzJfb2ZfbWF0Y2hfdGFi
bGVbXSA9IHsKPiAgCXsgLmNvbXBhdGlibGUgPSAiYnJjbSxiY20yODM1LXVzYiIsIC5kYXRhID0g
ZHdjMl9zZXRfYmNtX3BhcmFtcyB9LAo+ICAJeyAuY29tcGF0aWJsZSA9ICJoaXNpbGljb24saGk2
MjIwLXVzYiIsIC5kYXRhID0gZHdjMl9zZXRfaGlzX3BhcmFtcyB9LAo+IEBAIC0zNDcsNiArMzU4
LDggQEAgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkd2MyX29mX21hdGNoX3RhYmxlW10gPSB7
Cj4gIAkgIC5kYXRhID0gZHdjMl9zZXRfc3RtMzJtcDE1X2hzb3RnX3BhcmFtcyB9LAo+ICAJeyAu
Y29tcGF0aWJsZSA9ICJpbnRlbCxzb2NmcGdhLWFnaWxleC1oc290ZyIsCj4gIAkgIC5kYXRhID0g
ZHdjMl9zZXRfc29jZnBnYV9hZ2lsZXhfcGFyYW1zIH0sCj4gKwl7IC5jb21wYXRpYmxlID0gIm1l
dGFub2lhLG10MjgyNC11c2IiLAoKUGxlYXNlIG9yZ2FuaXplIHRoZSBwYXRjaCBkb2N1bWVudGlu
ZyB0aGUgY29tcGF0aWJsZSAoRFQgYmluZGluZ3MpCmJlZm9yZSB0aGUgcGF0Y2ggdXNpbmcgdGhh
dCBjb21wYXRpYmxlLgpTZWUgYWxzbzogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djYuMTQtcmM2L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3VibWl0
dGluZy1wYXRjaGVzLnJzdCNMNDYKCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
