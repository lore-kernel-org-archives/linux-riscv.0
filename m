Return-Path: <SRS0=KFrn=C2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B480EC433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:27:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F7342072E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2020 07:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xv0A5/F9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGPgNYUp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F7342072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e9iE5d+qtHlA/ZdVPt+dsTim7IwyG1bXGpAJ22ZdtkM=; b=Xv0A5/F92F7CNzJYS3ytkPRb3
	ZEcStK46LYodykxxPjuMKr2g9prqL5ilRCicTnmeaRvPWfgag+QVOc+tROHWXfHF8Kf+D8RL0UfH/
	R5wCUE/cOvvk/m+BKrGrstqTQWDxLofpeoZlnkxzlpPYXaUAwoIG9uYneaIblnFfjEsGgKvX1YRwb
	Uj0pBJut4EBz4gqrOuuVGkYM4Db2DYhpTMMnY2aJPALQMLovfekaYRZDlEBZWOn4ab6jh0difjz9q
	y1Z6A4gCzkhHYaaEVnkfY0VhxZdOvs63Plz+OzNnhLmWQ7FmX4kxwhAO7zQj3g+qDk3cb6G6dOTe0
	TvlGBQbWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoJu-00054D-3x; Thu, 17 Sep 2020 07:27:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoJo-00052x-7l; Thu, 17 Sep 2020 07:27:00 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 247EC21D7F;
 Thu, 17 Sep 2020 07:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600327619;
 bh=tpDo9cyPQ/LQTEOy36D/WBL6LetDpyxtlaRmONJd2R8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VGPgNYUpr88iTJVP2b21eVVpz5wo2NehMM7OnVt94+wRYsXdkF4S1yuwo40TtOPlS
 UxotjMgUFhoaJQsgORUskT5fwxsPNoNmdVujTk1Glo/6rsHcLZxvYHJv3FXD88WMLF
 7IV8tesnG+2RjpEE7tqK0mNx2oeYh0RsFxc4a5Oo=
Received: by mail-ej1-f52.google.com with SMTP id j11so1892733ejk.0;
 Thu, 17 Sep 2020 00:26:59 -0700 (PDT)
X-Gm-Message-State: AOAM530JGRKsII6OMHV4kzFXb0P/2JA5bU1uwGdB92mowhkzcueIHIUZ
 IIFoLSSj4uedqnxL/iX8wgx+IMGGIU5i0SG4vGI=
X-Google-Smtp-Source: ABdhPJxQ7MG7PighDXMf2n5pdUG/ATfzcTwgmqOUXydiC0X5Iwa/aHx2yyQcKBjTkjYJaVujJjiTPxJ2wi8w2RfXlKk=
X-Received: by 2002:a17:906:ca4f:: with SMTP id
 jx15mr29029898ejb.454.1600327617668; 
 Thu, 17 Sep 2020 00:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200916162250.16098-1-krzk@kernel.org>
 <20200916162250.16098-9-krzk@kernel.org>
 <20200917071932.GF3306@latitude>
In-Reply-To: <20200917071932.GF3306@latitude>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 17 Sep 2020 09:26:45 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe_njSOHc-aVGnpbL9ot8vxJsDkhMwXTVmRD1sPsNQR7w@mail.gmail.com>
Message-ID: <CAJKOXPe_njSOHc-aVGnpbL9ot8vxJsDkhMwXTVmRD1sPsNQR7w@mail.gmail.com>
Subject: Re: [PATCH 8/8] ARM: dts: imx: align GPIO hog names with dtschema
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_032700_375507_CEE1C6E0 
X-CRM114-Status: GOOD (  13.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Sungbo Eo <mans0n@gorani.run>, devicetree@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-gpio@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxNyBTZXAgMjAyMCBhdCAwOToyMCwgSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1
c2NoYWVmZXJAZ214Lm5ldD4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAxNiwgMjAyMCBhdCAwNjoy
Mjo1MFBNICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gZHRzY2hlbWEgZm9y
IEdQSU8gY29udHJvbGxlcnMgZXhwZWN0cyBHUElPIGhvZ3MgdG8gZW5kIHdpdGggJ2hvZycKPiA+
IHByZWZpeC4KPgo+IE5pdDogSXQncyBhIHN1ZmZpeCBpZiBpdCdzIGF0IHRoZSBlbmQuCgpSaWdo
dCwgSSdsbCBmaXggdGhlIG1lc3NhZ2UuIFRoYW5rcyBmb3Igc3BvdHRpbmcgdGhpcy4KCkJlc3Qg
cmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
