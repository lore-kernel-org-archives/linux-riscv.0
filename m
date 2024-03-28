Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F42FCD1283
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4HM0tUW7CtEQWX4DfHt8ANYgqEIc+xRgO6PYhhZF5E=; b=aHpcO04uzma/J9
	JxuHw0/YLhTP9ZYx/5OzV2W9KEXb1THzHEm+vph+y4/is9ROgRVtuE3YQAAgdZgZEe4JAw5owztCf
	wAJVQJHIw1gM+jfp0xG+OSw/6Uh3tyLaZQfHnA+NC4Rtgmq9uH2AXyu7cTnep2F8NuO2/TbKuko0o
	yJaEo91wWwZ8XjFOUDAtCPNks2MvI/kA3cWHPbvKe8wdzUv/ODPAq4gkPxX8Js2ROTCoZEajE2spp
	hDvJB7P78vrKJ+If91Qw/0cEaM2Uu2myHHVX3PPnYrzX2Ajx0xX1qsIeOhzrV/zH6HqRWUkQ1rVw9
	KDE2NfRtNaPjMdSqqDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptqa-0000000F1Yx-3fRR;
	Thu, 28 Mar 2024 17:47:28 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptqT-0000000F1U6-2Kl1;
	Thu, 28 Mar 2024 17:47:23 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4d870fb9f5cso429458e0c.3;
        Thu, 28 Mar 2024 10:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648038; x=1712252838; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=;
        b=HZ5IVTmXHtivwO/6/aTl1s6o/ZOIlwBRg93/T2Y3uCW91gSPu9oqMaOxvXdcztliIO
         Qq+NyrHsYiDd9ARyM7QHD/hqlM8DiDrVqzRIg+y0A/TncfcaFvd88XJqM78qu4VKESvD
         h3mqaWTsVw4eB+E6mnPWOWusTvmzLFTORNr8yvHE1GfbiLNC7a0PXZYDD1YYUDVf0+Q+
         E+MbqEeI0RMR+x1Yh6IJwa4CMmx31qPDnu50OMdGANPP2BOIzwqLKWMLFUjE/pvBPiWL
         d1XXMflZUIGkYVd1AIqziujdynReOQioqt8Or53Wj20SdvGGCCmS1CX3c4RSgtYzPkCH
         EDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648038; x=1712252838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=;
        b=jfL8MisCqBtU/JxOra8hw9gxRCjHDIzePVWuvaXp1lnWEmjEEwvdV2Ji3rKFjDMvkj
         ij3VyXQZ7FtfX/YpNzYflGJ2Xcs3lzvERiVCHOLq0WagX597ZbUZNG3+n3jX0zgxBs8C
         dv3d6ITM3rrDP6W3/T9E6NZFs0FKYNUd+CiYU6aa5E6IpMnMBOGkGi8HmwLzRqG65Nhm
         KLd8L7KlB6l9aMJs3HcI4FPYmGixSBziRy+MiyEwqo44ibAEM0mv35e7k1MNV03KmBr5
         8Mcu2Z9XCP4aozd1GBkEvFNMNSfvQ4z/O1Hb3my/O387SZveTXf6hDGtiDTAevnepg+R
         Ch7A==
X-Forwarded-Encrypted: i=1; AJvYcCVUJKKprlYoadVZFeFFlquzQQhynmw5hlFELX/1684EQIxSoKQ/fSsE5EFv2TP9wO7aq3SkSaIeQD0+WZ9dc10bhNHiGWSB1sLpYfd0xTuRnVkfAyX2iTzBiqC7ZGSDpucHqUlrPwe2nBfbhEML/HQfyWBwO8jZUHG3eAd/EteKaLgM799aKMoADooUbZWbuAfQmJpVH6zThlH0UzuAqmOiM/7/2ZwRq29zPw2/KJ4Q5grolOONUEIKmJNQwvbQJiUj2kMTICnSIKfUS61mxuAV0QqiB/NoyiDyJZpVjzoiZWFy
X-Gm-Message-State: AOJu0YwjQIQB4313jhwIElBKfsMgPzhKfJgiRv8SbKYnfJQWX0bwksCF
	XDH2k7AonJUsPZXW49zNVVUQYWCm2bJ4YabSYoiKHtXnr1L9mO+qC9XVb1DL/H6yvYLUqN7lajK
	KnJx/AWCeaZNAk97UYEzeyrzpMAQ=
X-Google-Smtp-Source: AGHT+IHhsrATdsPlGDNfn/hR7BQXc3o4d86Rd7NcYHBOy9LUQjNRQoJ0rDqs8OMJuSA4Qyiba22Ugt9rz6m/+ouyIBc=
X-Received: by 2002:a67:f7c6:0:b0:476:fbbb:14bc with SMTP id
 a6-20020a67f7c6000000b00476fbbb14bcmr3836850vsp.30.1711648038557; Thu, 28 Mar
 2024 10:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com>
In-Reply-To: <9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:47:06 -0700
Message-ID: <CAOMdWSL9GUkoOOX4LNwMOV24-8xnmFKep15xj8NnmnBss-RYAQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Christian Loehle <christian.loehle@arm.com>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_104721_702469_46500B7A 
X-CRM114-Status: GOOD (  16.02  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMzoxNuKAr0FNIENocmlzdGlhbiBMb2VobGUKPGNocmlz
dGlhbi5sb2VobGVAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiAyNy8wMy8yMDI0IDE2OjAzLCBBbGxl
biBQYWlzIHdyb3RlOgo+ID4gVGhlIG9ubHkgZ2VuZXJpYyBpbnRlcmZhY2UgdG8gZXhlY3V0ZSBh
c3luY2hyb25vdXNseSBpbiB0aGUgQkggY29udGV4dCBpcwo+ID4gdGFza2xldDsgaG93ZXZlciwg
aXQncyBtYXJrZWQgZGVwcmVjYXRlZCBhbmQgaGFzIHNvbWUgZGVzaWduIGZsYXdzLiBUbwo+ID4g
cmVwbGFjZSB0YXNrbGV0cywgQkggd29ya3F1ZXVlIHN1cHBvcnQgd2FzIHJlY2VudGx5IGFkZGVk
LiBBIEJIIHdvcmtxdWV1ZQo+ID4gYmVoYXZlcyBzaW1pbGFybHkgdG8gcmVndWxhciB3b3JrcXVl
dWVzIGV4Y2VwdCB0aGF0IHRoZSBxdWV1ZWQgd29yayBpdGVtcwo+ID4gYXJlIGV4ZWN1dGVkIGlu
IHRoZSBCSCBjb250ZXh0Lgo+ID4KPiA+IFRoaXMgcGF0Y2ggY29udmVydHMgZHJpdmVycy9pbmZp
bmliYW5kLyogZnJvbSB0YXNrbGV0IHRvIEJIIHdvcmtxdWV1ZS4KPiBzL2luZmluaWJhbmQvbW1j
CgpXaWxsIGZpeCBpdCBpbiB2Mi4KPiA+Cj4gPiBCYXNlZCBvbiB0aGUgd29yayBkb25lIGJ5IFRl
anVuIEhlbyA8dGpAa2VybmVsLm9yZz4KPiA+IEJyYW5jaDogaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdGovd3EuZ2l0IGZvci02LjEwCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogQWxsZW4gUGFpcyA8YWxsZW4ubGttbEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL21tYy9ob3N0L2F0bWVsLW1jaS5jICAgICAgICAgICAgICAgICAgfCAzNSArKysr
LS0tLS0KPiA+ICBkcml2ZXJzL21tYy9ob3N0L2F1MXhtbWMuYyAgICAgICAgICAgICAgICAgICAg
fCAzNyArKysrLS0tLS0KPiA+ICBkcml2ZXJzL21tYy9ob3N0L2NiNzEwLW1tYy5jICAgICAgICAg
ICAgICAgICAgfCAxNSArKy0tCj4gPiAgZHJpdmVycy9tbWMvaG9zdC9jYjcxMC1tbWMuaCAgICAg
ICAgICAgICAgICAgIHwgIDMgKy0KPiA+ICBkcml2ZXJzL21tYy9ob3N0L2R3X21tYy5jICAgICAg
ICAgICAgICAgICAgICAgfCAyNSArKysrLS0tCj4gPiAgZHJpdmVycy9tbWMvaG9zdC9kd19tbWMu
aCAgICAgICAgICAgICAgICAgICAgIHwgIDkgKystCj4gRm9yIGR3X21tYzoKPiBQZXJmb3JtYW5j
ZSBudW1iZXJzIGxvb2sgZ29vZCBGV0lXLgo+IGZvciBpIGluICQoc2VxIDAgNSk7IGRvIGVjaG8g
cGVyZm9ybWFuY2UgPiAvc3lzL2RldmljZXMvc3lzdGVtL2NwdS9jcHUkaS9jcHVmcmVxL3NjYWxp
bmdfZ292ZXJub3I7IGRvbmUKPiBmb3IgaSBpbiAkKHNlcSAwIDQpOyBkbyBmaW8gLS1uYW1lPXRl
c3QgLS1ydz1yYW5kcmVhZCAtLWJzPTRrIC0tcnVudGltZT0zMCAtLXRpbWVfYmFzZWQgLS1maWxl
bmFtZT0vZGV2L21tY2JsazEgLS1taW5pbWFsIC0tbnVtam9icz02IC0taW9kZXB0aD0zMiAtLWdy
b3VwX3JlcG9ydGluZyB8IGF3ayAtRiAiOyIgJ3twcmludCAkOH0nOyBzbGVlcCAzMDsgZG9uZQo+
IEJhc2VsaW5lOgo+IDE3NTgKPiAxNzczCj4gMTYxOQo+IDE4MzUKPiAxNjM5Cj4gdG86Cj4gMTc0
Mwo+IDE2NDMKPiAxODYwCj4gMTYzOAo+IDE4NzIKPiAoSSdkIGNhbGwgdGhhdCBlcXVpdmFsZW50
KS4KPiBUaGlzIGlzIG9uIGEgUkszMzk5Lgo+IEkgd291bGQgcHJlZmVyIG1vc3Qgb2YgdGhlIG5h
bWluZyB0byBjaGFuZ2UgZnJvbSAid29yayIgdG8gIndvcmtxdWV1ZSIgaW4gdGhlIGRyaXZlcgo+
IGNvZGUuCj4gQXBhcnQgZnJvbSB0aGF0Ogo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gTG9laGxl
IDxjaHJpc3RpYW4ubG9laGxlQGFybS5jb20+Cj4gVGVzdGVkLWJ5OiBDaHJpc3RpYW4gTG9laGxl
IDxjaHJpc3RpYW4ubG9laGxlQGFybS5jb20+CgogVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGVz
dGluZyBhbmQgdGhlIHJldmlldy4gV2lsbCBoYXZlIHlvdXIKY29uY2VybnMgYWRkcmVzc2VkIGlu
IHYyLgoKLSBBbGxlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
