Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641B0D58E7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byAmEtPp/adpKQZfcOiyNTbMgVSBX5mQXGdTu2Lxxx0=; b=EEKA94vWJsYwoQ
	5Kycu0EibvNgO96VrGBQ83C2X8qu9ZElThlyrxzzhyIGK7A4N11ipi+0yV71X6Om/rUqXmKgsmsD/
	WeBa0lpAlJNfVXlNgyIfbb6v5Z5rDiNq8uZung5+u5vbbrDgPwDW1VV6/VaME680gyhzgEyjM0X86
	ZvzY06EtKhZHM9puXBTSzF25mWEFG4rkvamDcKVLP22ZUN7ZRVdP3rFmbTsR6BSdR6Iwm6LJB8qi7
	DcYvWKlFxNW+7n99CM9DYpMgEQ72Igp/pnOuM8V05FcC4b9T3iTiYuBi4Ee3hHvix9cj2wwbhYK1Q
	E0PtjtZ+BGV+KxfRff4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzBE-0000000CZ1I-1vap;
	Mon, 02 Mar 2026 09:03:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzBB-0000000CZ0k-0Vel
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 09:03:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 787A3C40F8A;
	Mon,  2 Mar 2026 09:03:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 553CE5FE89;
	Mon,  2 Mar 2026 09:03:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C63210369474;
	Mon,  2 Mar 2026 10:02:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772442180; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RbOLWapj2Sdu5RKu4bV2/ciyBZZjSU315sJ15hiTWUU=;
	b=D9PYJG/1SSdEjAptVAwMp3G+jvjqTqCNWcoMr2pQlvogqVdd5LE62pA89peIHNMpBw3VBL
	5a5KNQ2tpppodSS0XYV0ru+HxxzVbvSDXel0My0S4n28S5YH10x5HKnw9gPQ1kZ2cY6PjM
	ZlIe3xdcHYBxaaQuWxX7+i7EiqsrZfH0HR4jZ6LsIaYhYwEYJ8Fan9Whncyr5tSDiSV17Z
	kIlDFT5DeFj9iE6pSM7j0/inUdO9oabjUy1ZM3z96hVH7poCcDY4KgaNdAcR73NuSOZO/7
	fw3vbHmTNJpjFNHjSm3+Asv16Cld7n4s0DoKql9W14ARwoBo6+eiwLh3jsNDvw==
Date: Mon, 2 Mar 2026 10:02:55 +0100
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
Subject: Re: [RFC v11 2/4] dt-bindings: soc: microchip: document PolarFire
 SoC's gpio interrupt mux
Message-ID: <20260302100255.5d9639b1@bootlin.com>
In-Reply-To: <20260227-unbounded-disposal-dcac091b8ec2@spud>
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
	<20260227-unbounded-disposal-dcac091b8ec2@spud>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_010305_304669_C89EB6A3 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

SGkgQ29ub3IsCgpPbiBGcmksIDI3IEZlYiAyMDI2IDE0OjUyOjI4ICswMDAwCkNvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gCj4gT24gUG9sYXJGaXJlIFNvQyB0aGVyZSBhcmUgbW9y
ZSBHUElPIGludGVycnVwdHMgdGhhbiB0aGVyZSBhcmUgaW50ZXJydXB0Cj4gbGluZXMgYXZhaWxh
YmxlIG9uIHRoZSBQTElDLCBhbmQgYSBydW50aW1lIGNvbmZpZ3VyYWJsZSBtdXggaXMgdXNlZCB0
bwo+IGRlY2lkZSB3aGljaCBpbnRlcnJ1cHRzIGFyZSBhc3NpZ25lZCBkaXJlY3QgY29ubmVjdGlv
bnMgdG8gdGhlIFBMSUMgJgo+IHdoaWNoIGFyZSByZWxlZ2F0ZWQgdG8gc2hhcmluZyBhIGxpbmUu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KClJldmlld2VkLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNv
bT4KCkJlc3QgcmVnYXJkcywKSGVydsOpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
