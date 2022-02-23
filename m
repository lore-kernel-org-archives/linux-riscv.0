Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37600C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCfB9WhAR1jiffJwO6oVpE1hbCOzFQzSMRe6zXhcex4=; b=TUSP8i2g4wkCIp
	UXPyqfcF5qbQZqz92zX4aIvdxvHIHzv6sm8uV7w49mRcEL6oJeBpTjvEwIP1KJLIQngBcGpW1A93t
	Qx6pcHIUAeb2Zld96VhF3u506BNE262ZdN9E886/DQ/DN9oQzawkNfRgmtsT36fWcHk3XRaqTeP7E
	owYVc9RrSaeYpzVcUWBN0VY1BRIpfyXyFtxWPrvuPCJk7gEXduRKad5qx+t34EkXIY0iUiCi/Jsu0
	M/3v53KIDT1Axqj5cdU00vmDtnQnEvQCqz9e8u6S9RDlbwIKXgGH5fSuxUiYnIq2BxFsfQiupwG4R
	/89nfCX7Fa09ZsgqrKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMnOk-00DKud-2a; Wed, 23 Feb 2022 08:53:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMnOh-00DKsJ-3f
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 08:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645606399; x=1677142399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gf7fLnuz2/+PWrNrtqGk1PKFdI0hQYHsrfCkNF3N2OE=;
 b=AUrI4gO5dVbHpDNGGNNjDh/VHoH5/X5aMjYw665BFCAlr2+bhRgtBk/Z
 cxFQEjgCGgSeFx8xz3GuuT05hanzG88BNKUEZQw4fb9SFBm/SX7iLiQSU
 Pb+HFCg2FhqIzHJ6U4mIG510/ml5aq+KuFDJPLsNTrO4gcdfe2U5ragST
 NebO1Zt4T3/fUsh+nvnuoe/CBKpUHqD6cXn6crQNts1pPPCvD1eyxWDuE
 RJ3NIs9wynqwJlvmhHssywZ5t0OHV7r8UQ9ne7P1bB6DK2wtbOIwLGHTh
 Blj6r3RGMPxFNkJsrqTaNegCYIg2wJM4HFfZcfUZNC4+ykzVwHllnV0rR Q==;
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="149703384"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2022 01:53:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 23 Feb 2022 01:53:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 23 Feb 2022 01:53:09 -0700
From: <conor.dooley@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <krzysztof.kozlowski@canonical.com>
CC: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <aou@eecs.berkeley.edu>, <atishp@rivosinc.com>, <brgl@bgdev.pl>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <devicetree@vger.kernel.org>, <geert@linux-m68k.org>,
 <ivan.griffin@microchip.com>, <jassisinghbrar@gmail.com>,
 <lee.jones@linaro.org>, <lewis.hanly@microchip.com>,
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
 <palmer@dabbelt.com>, <palmer@rivosinc.com>, <paul.walmsley@sifive.com>,
 <robh+dt@kernel.org>, <robh@kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v7 05/11] dt-bindings: pwm: add microchip corepwm binding
Date: Wed, 23 Feb 2022 08:55:10 +0000
Message-ID: <20220223085509.3664942-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223082018.degrftmxpk5uc6xn@pengutronix.de>
References: <20220223082018.degrftmxpk5uc6xn@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_005319_227950_8C386E98 
X-CRM114-Status: GOOD (  21.35  )
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

T24gMjMvMDIvMjAyMiAwODoyMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gV2VkLCBG
ZWIgMjMsIDIwMjIgYXQgMDg6MTI6NDlBTSArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPiA+IE9uIDIzLzAyLzIwMjIgMDc6MjAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4g
PiBPbiBNb24sIEZlYiAxNCwgMjAyMiBhdCAwMTo1ODozNVBNICswMDAwLCBjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbSB3cm90ZToKPiA+ID4+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+Cj4gPiA+Pgo+ID4gPj4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdz
IGZvciB0aGUgTWljcm9jaGlwIGZwZ2EgZmFicmljIGJhc2VkICJjb3JlIiBQV00KPiA+ID4+IGNv
bnRyb2xsZXIuCj4gPiA+Pgo+ID4gPj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Cj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+ID4gPj4gQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
cml2b3NpbmMuY29tPgo+ID4gPiAKPiA+ID4gSSBsaWtlIGl0Ogo+ID4gPiAKPiA+ID4gQWNrZWQt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4g
PiA+IAo+ID4gPiBuaXRwaWNrOiBQdXQgeW91ciBTLW8tYiBsYXN0IGluIHRoZSBjb21taXQgbG9n
LiAoVGhpcyBkb2Vzbid0IGp1c3RpZnkgYQo+ID4gPiByZXNlbmQgSU1ITykKPiA+IAo+ID4gSXQg
c2hvdWxkIGJlIHRoZSBvcHBvc2l0ZSAtIHRoZSBmaXJzdC4gRmlyc3QgYXV0aG9yIHNpZ25zIHRo
ZSBwYXRjaCwKPiA+IHRoZW4gY29tZXMgcmV2aWV3IGFuZCBmaW5hbGx5IGFuIGFjay4gUHV0dGlu
ZyBTb0IgYXQgdGhlbiBzdWdnZXN0cyB0aGF0Cj4gPiB0YWdzIHdlcmUgYWNjdW11bGF0ZWQgYmVm
b3JlIHNlbmRpbmcgcGF0Y2gsIG91dCBvZiBtYWlsaW5nIGxpc3QuCj4gCj4gd2VsbCwgb3IgaW4g
YW4gZWFybGllciByZXZpc2lvbiBvZiB0aGlzIHBhdGNoIGFzIGlzIHRoZSBjYXNlIGhlcmUuIE9u
ZQo+IG9mIHRoZSBpZGVhcyBvZiBTLW8tYiBpcyB0aGF0IHRoZSBvcmRlciBzaG93cyB0aGUgZmxv
dyBvZiB0aGUgcGF0Y2gKPiBzdGF0ZXMgYW5kIGlmIHRoaXMgcGF0Y2ggZW5kcyBpbiBnaXQgd2l0
aDoKPiAKPiAJUmVmZXJyZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gCVNp
bmdlZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4g
CUJhY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gCVNpbmdl
ZC1vZmYtYnk6IFBldGVyIE1haW50YWluZXIgPHBtQGV4YW1wbGUuY29tPgo+IAo+IEknZCBleHBl
Y3QgdGhhdCBCYWNrZWQtYnkgd2FzIGFkZGVkIGJ5IFBldGVyLCBub3QgQ29ub3IuCj4gKE1vZGlm
aWVkIHRoZSB0YWdzIG9uIHB1cnBvc2UgdG8gbm90IGludGVyZmVyZSB3aXRoIGI0J3MgdGFnIHBp
Y2t1cCwgSQo+IGd1ZXNzIHlvdSBodW1hbnMgc3RpbGwgZ2V0IHRoZSBwb2ludC4pCgpJIGhhZCBw
dXQgdGhlIGFja3MgYWZ0ZXIgdGhlIFMtby1CIGZvciBwYXRjaGVzIEkgaGFkbid0IGNoYW5nZWQg
c2luY2UgdGhlIGFjaywKYnV0IEkgdGhpbmsgdGhhdCBtYXkgaGF2ZSBiZWVuIGEgbWlzaW50ZXJw
cmV0YXRpb24gb2Ygd2hhdCB3YXMgbWVhbnQgYnkgUm9iCndoZW4gaGUgc2FpZCB0YWdzIHNob3Vs
ZCBiZSBpbiBjaHJvbm9sb2dpY2FsIG9yZGVyLiBXb24ndCBkbyBpdCB0aGlzIHdheSBpbgp0aGUg
ZnV0dXJlLgoKSWYgdGhlIHJlbWFpbmluZyBwYXRjaCBnZXRzIGEgbWFpbnRhaW5lciBhY2ssIHRo
ZSBvcmRlciB3aWxsIGJlIGZpbmUgSSBndWVzcwpzaW5jZSBpdCdsbCBiZSBQYWxtZXIgdGFraW5n
IGl0IGFueXdheS4gSWYgdGhlcmUncyBhIHY4LCBJIHdpbGwgZml4IHRoZSBvcmRlci4KClRoYW5r
cywKQ29ub3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
