Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E21C7618A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXpatxWEFeAxhj54EGRQ8BQFCdgL1t9Xj/z1aJJPVnU=; b=DuCk3fgmjE3CYH
	aoM2izeaBeNUPNAbqS0Ribn40tifp4gdpqzIfS8bbZQrk0LTOtlR5ZVSO1LGNxY2oD6emH4/uSMOe
	p3jDVbSBUmdXxQnMlcVqh57jcAUGclJBwBV62jM8ptXuEUCx9rfIgEq2zkpNBpwZxgeJnaceCBMDF
	phI27fmUzOdNF9di98VfrrD0RcKekJGyaRw7kAwlLNv75bRwBwnh7bTu/CvRODw86kXNzvfYxO/7F
	rLCSAuTzRy7WZ9NTUPd6kaFjwLkohHvSzmMtVs3oElANSbxj1/9k0hCXv1ps4NlytdCMLR5SXj1pj
	S8jxa524t+w8cKOAnKzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe0SR-007TDh-12;
	Sun, 19 Mar 2023 21:20:51 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe0SN-007TCJ-0S
	for linux-riscv@lists.infradead.org;
	Sun, 19 Mar 2023 21:20:48 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5416b0ab0ecso192912677b3.6
        for <linux-riscv@lists.infradead.org>; Sun, 19 Mar 2023 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=;
        b=yxYOpG1BTRH8mP4CO9pabOiIVp8JZr5VwAuFO8HU6vbaqpTxWmCE4iIgG/OVL1bC1K
         h3LhfvJ9Emngr37qgSs4y3135OyBRvx5CQrGOhqBQ1h52Thw6LlPUCXerXAafRWoy3r/
         FDFDT9ERbcJkGc+2G4eLkbvA5KcKtQ6KYbmnVg4lq1vniUExZ2sFYpXbvCD7hKDVMLon
         QLx20N80Tf488Dgbj44gJ9XeDYP2w0y+6+La+/a0ASo0Dh+zkjSg2/P4RcnR2PKoZR8Z
         jdQ+VbU+0FFOQcGsff14UjVnV15EfKcDuX6yib3W9b/IG0H6KARxUCDOXylMZHreZLWk
         0npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=;
        b=It20/PA0Xqgg/d6cA2oF9tk3pjIab1Z+j9Zm8EirLSMteQviSmUWWgakoZtywEOH2C
         GfIIOb3U7fD6q6/DFjbIAr7lUsWQTgRbg7L6GX5V90cnerpjJ54fJH0Tm2XQikJ4mMG7
         zn6zNb3FOMQqNhZK2/p1cyDKUMXXMJXZEpOfLGsup2PgK4ACEzls9Yr2ksTOdcw5Nt2O
         v+ctBzko1um6weoFdlG16GpWZzhxMgX1dzTdWQqcpf1d0I2aCJczObJaSPasp/z+ILC3
         MC8PKD21Uh7KYltcrxboKIkrOi/+CNl83oO38q/Nfuce7PSdQbyYZGcpA8bN1wF7jD5t
         +hEQ==
X-Gm-Message-State: AO0yUKVb0tVOOB75c34eZX0m5RSJ6Lo8eOhhU3OudQ3I2MgNVUg0g8gZ
	cfOSWGsl4+EN0jyJPzYxUGTeV/yvzXpEhi/gyhgNiA==
X-Google-Smtp-Source: AK7set/4tcKb2KcMcmhkFSECkX9UEXl6Q7CPyM6DmVWY/gBDswc6Du79KNPC9UhC3cNpQzNAw1FAAnNdRAYmdab1914=
X-Received: by 2002:a81:ae5f:0:b0:532:e887:2c23 with SMTP id
 g31-20020a81ae5f000000b00532e8872c23mr9029129ywk.9.1679260846054; Sun, 19 Mar
 2023 14:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230319115925.1317654-1-sensor1010@163.com>
In-Reply-To: <20230319115925.1317654-1-sensor1010@163.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 22:20:35 +0100
Message-ID: <CACRpkdbxSNCKNfous7h2dBQ_AW9KS9qyxPfPxOO=3PMDsDxcng@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/gpio : Remove redundant platform_set_drvdata().
To: Lizhe <sensor1010@163.com>
Cc: brgl@bgdev.pl, geert+renesas@glider.be, info@metux.net, rjui@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com, 
	sbranden@broadcom.com, shc_work@mail.ru, j-keerthy@ti.com, 
	hoan@os.amperecomputing.com, fancer.lancer@gmail.com, orsonzhai@gmail.com, 
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, kaloz@openwrt.org, khalasa@piap.pl, 
	keguang.zhang@gmail.com, daniel@thingy.jp, romain.perier@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, 
	grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org, 
	mani@kernel.org, ludovic.desroches@microchip.com, andy@kernel.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, jonathanh@nvidia.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, michal.simek@xilinx.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_142047_188608_772C5296 
X-CRM114-Status: UNSURE (   9.29  )
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

T24gU3VuLCBNYXIgMTksIDIwMjMgYXQgMTowMuKAr1BNIExpemhlIDxzZW5zb3IxMDEwQDE2My5j
b20+IHdyb3RlOgoKPiBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YSgpIGlzIHJlZHVuZGFudCBpbiB0aGVz
ZSBmdW5jdGlvbnMuCj4gdGhlIHB1cnBvc2Ugb2YgY2FsbGluZyB0aGlzIGZ1bmN0aW9uIGlzIHRv
IHBsYWNlIGRhdGEKPiBpbiAqZHJpdmVyX2RhdGEuIGJ1dCB0aGUgZGF0YSBpcyBub3QgcmV0cmll
dmVkIGluIHRoZXNlCj4gZnVuY3Rpb25zCj4KPiBTaWduZWQtb2ZmLWJ5OiBMaXpoZSA8c2Vuc29y
MTAxMEAxNjMuY29tPgoKWW91IGhhdmUgdG8gYWxzbyBhc2NlcnRhaW4gdGhhdCB0aGUgZGF0YSBp
cyBub3QgdXNlZCBlbHNld2hlcmUKbGlrZSBpbiBzb21lIGNhbGxiYWNrcyBvciBldmVuIGluIG90
aGVyIGRyaXZlcnMgaW4gc29tZSBvZGQgY2FzZXMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
