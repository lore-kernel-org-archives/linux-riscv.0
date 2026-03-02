Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAA1D58E7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QTR713NVSwW1zHiTdfbDUS2ZRFPpOVphcfUWhPUy7Uk=; b=roKFJVZ+0bJeSU
	Ie98MsGINSd1xQ9h2OB5uECJaXe/EHwl2Vh8np7B5C3IzSrJWyE0gfh0ttyv+5nnr8TCPdillf/n6
	+JgseUpJlHZpRuZPw41eaKzC8tcNjks5MXbxGeq3mJ39gfDpOtlL+IZeGC05NyYuVtYjeoFU+mMZF
	zAnzvPBCsXN2aHSA/jd8PW1W0cf+y7A475FRgZuTBY9v4HnSAjYKaaHBvVnO04R2Xvl0jzKiualJs
	5QawKfWIpkPyF2CggPhH5X1chtd2D8YBjUfJsys5yHtxgISFbFlSnap0QZbLuenN8rmirdQ9W6Jol
	0LLiYH8P4gFr/+qCkcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwz3d-0000000CYOb-32Pw;
	Mon, 02 Mar 2026 08:55:17 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwz3a-0000000CYNQ-0bmW
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 08:55:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C01CA4E424D9;
	Mon,  2 Mar 2026 08:55:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A7635FE89;
	Mon,  2 Mar 2026 08:55:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A417410369514;
	Mon,  2 Mar 2026 09:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772441709; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GolTPQTz/JkLYWONicK1ZiOMxmW8WOdbYREGhj5V2VE=;
	b=JHGl83/EukVWIZ/SFdAWt9yhzJriahQdYX09JxyQMGmtBSCskhZN7xckRr17bc2Vw62UfB
	qcGKw/ehj38y6m8ranUWNvyq3NRat6jfinq37P9NycrZiU/fSo6zR+MAJiG9AhmJ7KC/l4
	pBFI+KMgG5bhtUnvQCPWwENae2cpXhV2+vViIDxFpYE7xo882EU8nRvBOjJ0gdwpsXhLqI
	sRiEnHGjGE2s52NWpuK1u5OwsdRnqI2clKShjvkoUZcd+o/kBWHnQdvFWe0ePY9nwbq5ui
	iQ6Wugpy3aHWjvYrs8kRkNbHf2N86vXCFfVQ/+D6u5JeWKdfRBxrq2xPO8mA1Q==
Date: Mon, 2 Mar 2026 09:55:01 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thomas Gleixner <tglx@linutronix.de>, Daire McNamara
 <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC v11 1/4] gpio: mpfs: Add interrupt support
Message-ID: <20260302095501.3104146f@bootlin.com>
In-Reply-To: <20260227-divinely-drift-93307c6763d8@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
	<20260227-divinely-drift-93307c6763d8@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_005514_320434_E1E56848 
X-CRM114-Status: GOOD (  14.90  )
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

SGkgQ29ub3IsCgpPbiBGcmksIDI3IEZlYiAyMDI2IDE0OjUyOjI3ICswMDAwCkNvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gCj4gQWRkIHN1cHBvcnQgZm9yIGludGVycnVwdHMgdG8g
dGhlIFBvbGFyRmlyZSBTb0MgR1BJTyBkcml2ZXIuIEVhY2ggR1BJTwo+IGhhcyBhbiBpbmRlcGVu
ZGVudCBpbnRlcnJ1cHQgdGhhdCBpcyB3aXJlZCB0byBhbiBpbnRlcnJ1cHQgbXV4IHRoYXQgc2l0
cwo+IGJldHdlZW4gdGhlIGNvbnRyb2xsZXJzIGFuZCB0aGUgUExJQy4gVGhlIFNvQyBoYXMgbW9y
ZSBHUElPIGxpbmVzIHRoYW4KPiBjb25uZWN0aW9ucyBmcm9tIHRoZSBtdXggdG8gdGhlIFBMSUMs
IHNvIHNvbWUgR1BJT3MgbXVzdCBzaGFyZSBQTElDCj4gaW50ZXJydXB0cy4gVGhlIGNvbmZpZ3Vy
YXRpb24gaXMgbm90IHN0YXRpYyBhbmQgaXMgc2V0IGF0IHJ1bnRpbWUsCj4gY29udmVudGlvbmFs
bHkgYnkgdGhlIHBsYXRmb3JtJ3MgZmlybXdhcmUuIENvcmVHUElPLCB0aGUgdmVyc2lvbgo+IGlu
dGVuZGVkIGZvciB1c2UgaW4gdGhlIEZQR0EgZmFicmljIGhhcyB0d28gaW50ZXJydXB0IG91dHB1
dCBwb3J0cywgb25lCj4gaXMgSU9fTlVNIGJpdHMgd2lkZSwgYXMgaXMgdXNlZCBpbiB0aGUgaGFy
ZGVuZWQgY29yZXMsIGFuZCB0aGUgb3RoZXIgaXMKPiBhIHNpbmdsZSBiaXQgd2l0aCBhbGwgbGlu
ZXMgT1JlZCB0b2dldGhlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+IERvaW5nIHRoZSBjaGFpbmVkIHRoaW5nIGtp
bmRhIGNvdmVycyBhbGwgdGhlIGJhc2VzIGF0IHRoZSBleHBlbnNlIG9mIHRoZQo+ICJkaXJlY3Qi
IG1vZGUgaW50ZXJydXB0cyB0aGF0IGhhdmUgYSBkZWRpY2F0ZWQgY29ubmVjdGlvbiB0byB0aGUg
UExJQy4KCgpTZWVtcyBvayBvbiBteSBzaWRlLgoKSnVzdCBhIG5pdHBpY2sgaW4gcHJvYmUoKS4K
ClJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KCi4u
Lgo+ICBzdGF0aWMgaW50IG1wZnNfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ICsJc3RydWN0
IGRldmljZV9ub2RlICpub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7CgpkZXYtPm9mX25vZGUgaW5z
dGVhZCBvZiBwZGV2LT5kZXYub2Zfbm9kZS4KCm9yIG1vdmUgJ3N0cnVjdCBkZXZpY2Vfbm9kZSAq
bm9kZSA9IHBkZXYtPmRldi5vZl9ub2RlOycgYXQgZmlyc3QgcG9zaXRpb24KKHJldmVyc2UgWG1h
cyB0cmVlKS4KCj4gIAlzdHJ1Y3QgbXBmc19ncGlvX2NoaXAgKm1wZnNfZ3BpbzsKPiArCXN0cnVj
dCBncGlvX2lycV9jaGlwICpnaXJxOwoKQmVzdCByZWdhcmRzLApIZXJ2w6kKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
