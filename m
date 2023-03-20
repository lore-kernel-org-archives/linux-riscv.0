Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266DAC7618D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DMVHxoaxg3YueapLTaXW3BWZ96FblYapnpyEPPpTF7A=; b=Jh/VHKDEgphIuD
	cRzMtVs1SogMHGZ3mGZ/H47E7y6sWbmzB3h8myET0CXe7ksboUByvvC3s0eNsLGsLze3vTA/oSsPV
	peXqrmB5W0D/cc4IVdH9D2dl58rjXbVajHa2jPvGzmuL+Z3kZ2Lur2ZGIqj8Y6irQjllSCtCufGH7
	FRU8/9Fan1VPo60eRew+e/ZsMUtWq/sORwC11jZRCQ0P92v8QyvkmEFLEBRuZreJs55417dIUsHO0
	e1JpAxwMzAPR5Ow9sTtI6CBuFY4JlrpJadb1l1pRLGuQv6mgzM6Qa9VB9/+WFcp1R2tANbGBZH9O1
	hN1detC3qIHd6JTXYBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCUn-008aYG-2P;
	Mon, 20 Mar 2023 10:12:05 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peCUj-008aWM-2L;
	Mon, 20 Mar 2023 10:12:02 +0000
Received: by mail-qk1-x72c.google.com with SMTP id o1so543650qkh.7;
        Mon, 20 Mar 2023 03:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679307115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEHX2H3FPvonaNoZg4d3ZXKZZZCxjwbRPNv3Abil3kY=;
        b=pGRG8DR8czC6mIySn8c+XY/QyPsxNJby0FDmm6hU8zH3srOc1pzYmcAtzW++zTsVST
         oIKxOe+AVWw3Q/vF2tZU81xD0VZuk+6u66OpAtC8p6jZyD8wmZhAZSJFOAuerqDP/Vo7
         TBo9jbf5dZR5AvNjqQ8y4q31DORWt/TGC1jexEA460NOlL8vYpwY1zSiFzLLTZMDoQuI
         2IZbSZnw6mQl4D81ehGAV4TERB7EvlqTNvfy4Mr9ntcUMQjf2WYyzSa68Nbzy2ZU3Koa
         P3KZ1aMChHLD6su7o5vLa3LQ+d2V6OaFKe2DagbmdM9TKAlM4Ol7RHA3UY53SbomsUy8
         z5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679307115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEHX2H3FPvonaNoZg4d3ZXKZZZCxjwbRPNv3Abil3kY=;
        b=6GgjpyB71T8MdoHNLk91pJQAEFz9Yi/dCVkZeQfasS2Jei5aL/XZyTLjetbK2U2Y9D
         C7fX07V80VVHL25/nylzw0rx9x/yJXyh99NweDHd0Qj2mOkYbopFV9qgmq3fWFeTqqgt
         UbE3H7JYxQLQ11jdH11SUWk0R5Vhlyd+9XJf2LsATaGeiO0pV2oDR8HbbFDOZLJfGRyQ
         BnYzbhWBuyuJsVDpiKfamEJXziEekG7AtTfyITKiQZNuuWojgrMT9KIRG6uZwLUf6cyZ
         T9skM+99PjRxpIfM4jWRtefEMV8PLtxCEx24bPvkms5tXtFZdRXJyUQOM4f3VrBr2NMJ
         y1Fg==
X-Gm-Message-State: AO0yUKX9xqeEX3ldgolZS/HaspsMddBw/Ookhwo0ryTc6FZcLksyVD10
	ngM+l3C/uYfHVOuA/8CVlCancYQ1a7SRPqiKpUM=
X-Google-Smtp-Source: AK7set/7f2o3MXyyuIp0oW2dzmomSD1AeJIwa/bkGf1KaepstcBoZ2oGQTq2OW/QrKdEOrRxx9NAQwjPPU8J1KTvGK8=
X-Received: by 2002:a37:e119:0:b0:746:3c7f:7524 with SMTP id
 c25-20020a37e119000000b007463c7f7524mr2618315qkm.14.1679307115447; Mon, 20
 Mar 2023 03:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230319115925.1317654-1-sensor1010@163.com> <CAHp75Vf9kwhbZaGjZeN5Jq0Wr_yJtDdj9N48-3o79AMORqmS3w@mail.gmail.com>
In-Reply-To: <CAHp75Vf9kwhbZaGjZeN5Jq0Wr_yJtDdj9N48-3o79AMORqmS3w@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Mar 2023 12:11:19 +0200
Message-ID: <CAHp75VeLoMPtTU8TCuPjXD_YTY-_V-TmVJYeZiBB_BPqh8EVrQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/gpio : Remove redundant platform_set_drvdata().
To: Lizhe <sensor1010@163.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, geert+renesas@glider.be, 
	info@metux.net, rjui@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	f.fainelli@gmail.com, sbranden@broadcom.com, shc_work@mail.ru, 
	j-keerthy@ti.com, hoan@os.amperecomputing.com, fancer.lancer@gmail.com, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, kaloz@openwrt.org, khalasa@piap.pl, 
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
X-CRM114-CacheID: sfid-20230320_031201_763215_6715F9CD 
X-CRM114-Status: GOOD (  12.05  )
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

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgMTI6MTDigK9QTSBBbmR5IFNoZXZjaGVua28KPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+IE9uIFN1biwgTWFyIDE5LCAyMDIzIGF0IDI6
MDHigK9QTSBMaXpoZSA8c2Vuc29yMTAxMEAxNjMuY29tPiB3cm90ZToKPiA+Cj4gPiBwbGF0Zm9y
bV9zZXRfZHJ2ZGF0YSgpIGlzIHJlZHVuZGFudCBpbiB0aGVzZSBmdW5jdGlvbnMuCj4gPiB0aGUg
cHVycG9zZSBvZiBjYWxsaW5nIHRoaXMgZnVuY3Rpb24gaXMgdG8gcGxhY2UgZGF0YQo+ID4gaW4g
KmRyaXZlcl9kYXRhLiBidXQgdGhlIGRhdGEgaXMgbm90IHJldHJpZXZlZCBpbiB0aGVzZQo+ID4g
ZnVuY3Rpb25zCj4KPiBZb3UgbmVlZCB0bzoKPiAxKSBzcGxpdCB0aGUgc2VyaWVzIG9uIHBlciBk
cml2ZXIgYmFzaXMgKG5vdCBhbGwgb2YgdGhlIGRyaXZlcnMgYXJlCj4gZ29pbmcgdGhydSB0aGUg
c2FtZSBzdWJzeXN0ZW0pOwoKcy9zdWJzeXN0ZW0vdHJlZS8KCj4gMikgaW1wcm92ZSBFbmdsaXNo
IGdyYW1tYXIgYW5kIHN0eWxlIGluIHlvdXIgY29tbWl0IG1lc3NhZ2U7Cj4gMykgY2FyZWZ1bGx5
IGV4cGxhaW4gaW4gdGhlIGNvdmVyIGxldHRlciB5b3VyIG1ldGhvZHMgb2YgZmluZGluZyB0aGUK
PiBwbGFjZXMgeW91IHRoaW5rIG5lZWQgdG8gYmUgaW1wcm92ZWQuCj4KPiBCZWZvcmUgdGhhdCBp
dCdzIGEgd2FzdGUgb2YgdGltZSB0byBsb29rIGF0IHlvdXIgY29udHJpYnV0aW9ucy4KCgotLSAK
V2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
