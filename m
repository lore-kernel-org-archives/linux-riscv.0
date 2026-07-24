Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D10C531FA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 07:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+xOv/3iB4oecMSc7V2PBhQeH380UJMD5nVm3n/Oj3gc=; b=QSguwZ+kdoUzCZ
	I2RQqBwrxLIy3oIk/WCBiwNIBv0pfCcogpFPbcb5xUGA6cezLIkttlAoV8P/vfWmAbLP19J915JjA
	qlsY/vWNZER3/nKCgnk9WRmQodptp2Uqu+388zncvKzg23w6uD9vq14CD2ZZG5pWi2q6kECyjNzud
	4TuOMf9TJNofpaGCFjGlahuQqnUsDmJ2BP5t3SJLhg9Vu1wdkOQOZRFSRQyi2fqc3545Sn7gVJuG4
	I/OHAQPNClpWxs/EhGUvjts16MkpO7ma5CcS3rZVO+fouHU3sDAsODIe7cfuDZrUQ2ZkZLDlyEo3P
	GbJvNP+pnEfioTJmlzHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAGz-0000000FhFn-1UEv;
	Fri, 24 Jul 2026 07:24:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnAGy-0000000FhFR-1xKY
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 07:24:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBEEB44011
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 07:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4791F0155D
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877883;
	bh=jvCoVMrq482sRltMKIA0wngG+Be2zNs5wkXwHMhSAUg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GHNyHY4hC7tojuzaxlZtjiFy+W2Qk8/5I2WoTb6mbQZ0xAjikAArouvFN+l07ZCvO
	 brE8FuPIw0Aru8OuXBQhtcU7m0cz7TR4lmGhST2Kj/RY757fAlXkXssOyVT0Q2LZKM
	 otyrVgqN0reooRcHojkIbP07aeS4c73hdiXMqtE2vvC+aeD1cPY9iuRysB3RmDitSB
	 r7yDUqn30oQH5yrPu8nyWihTTbvAkO7GpiNVLakd7G2jxkvtwdfe60LebsJVTIhOjt
	 ngEYp6fjbVTeuXYkUN03sB4L/YPIL704ulORfYx3eJgnygH3bJEvugSb1EwI+FNGCH
	 b4mgnvHXPHTpw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aebd52488cso135792e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 00:24:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoBR6uBI3zJqaxfJ1XvZuXt+/PM3MY4CzJJ9YqgT4dOBJ0RqZdsH0y1IL+PrCL1L2e2O2eirWq1Cmu3xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc6R29o3497RJysICwcwK+2mB1ejnArHUjVDxqfv77mjrp16Pu
	CUyRxxh5qiwMCGMWKfWjHN/XlGzTX2RDkuCEZrscG/V378T9aQQaDV3O8RnqhPfiybbipoU0+ta
	uBD3JvNZ2WCap1HgZ25y7FO7emfnfvGc=
X-Received: by 2002:a05:6512:12ca:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b2b2e4a6d1mr1388989e87.13.1784877882305; Fri, 24 Jul 2026
 00:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com> <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:24:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Cu=CKVdFTyrf7qfP--U-K==6Q-oMgerMfian_pwks=Q@mail.gmail.com>
X-Gm-Features: AUfX_mwgzz4U49kjYn2t0Q6F2gaYlikzFa7qviMieYEmwgYwO8V-etZipo96ywY
Message-ID: <CAD++jL=Cu=CKVdFTyrf7qfP--U-K==6Q-oMgerMfian_pwks=Q@mail.gmail.com>
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
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

T24gVHVlLCBKdWwgMTQsIDIwMjYgYXQgOToyNeKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUg
Q2FwYWJsZSBIdWIpCjx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKCj4gQSBk
cml2ZXIgbW9kdWxlIG1hdGNoaW5nIGRldmljZXMgdXNpbmcgYW4gb2YgZGV2aWNlIGlkIHRhYmxl
IGlzIHN1cHBvc2VkCj4gdG8gZGVjbGFyZSB0aGF0IGluIHRoZSBtb2R1bGUncyBtZXRhZGF0YS4g
QWRkIHRoaXMgaW5mb3JtYXRpb24gZm9yCj4gc2V2ZXJhbCBkcml2ZXJzIHRoYXQgZmFpbGVkIHRv
IGRlY2xhcmUgdGhlc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhl
IENhcGFibGUgSHViKSA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4KClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlq
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
