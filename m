Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FC6C7EE23
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 20:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyjvFPqQcjVXR7e6Prl6Hn7NS4BoCccP5gFi5LOkGCs=; b=vC8KjZcStoyZsp
	lcRxASBHhMKSub64G4lUex5SpnCBXpHPBS57kEn/aLuUq43Bi8O0cR1gTtE42dopNN8zy3xJ4TJcd
	+eJyg2uIWzZ2sZC7fBYEHkMU0eTZ0pa7SxkA20rIXad5uDsWzp4UBK4O2e1mYArM4WQ8eWcBhYV/0
	U+76l5mMqEE7mugbTnYgsIroYnuqAUETiWDT1GfGN9msG4dvB8rSfcte25lIi/+QAEdCY9ci90sKq
	UpERxyVI+oomykiS/G5R9r52Vcoi0Rh8yVRLS1Af4VDBWqnW8QyS+xh1qbYzbzErMtvPeV5XQUo5c
	JO5OZntfbPeNqF8SQaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ujU-00D5Aa-1L;
	Sun, 04 Jun 2023 20:53:48 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ujQ-00D59c-2O;
	Sun, 04 Jun 2023 20:53:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-973f78329e3so658403966b.3;
        Sun, 04 Jun 2023 13:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685912023; x=1688504023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMdRlD3RmAquqJCxpsCbMeN6ju6zKj6JUFR8/2WFs3c=;
        b=SiYLabF9JME+54M7MIop3FXo02GsPPG737XXA75vfgXysx6JEEVveTtcYnD4M351P1
         /s/rKCh7h1fZ+wwaITQAKu5C94jPce1i5zUiPFL4LGx5VgSldI62tkTy6V1D3AOmASrR
         B0QssVgniWHFxAKQBO2a+zn1Cm1fvjfSDjYNnpuRK3B4alME2Cd0LkjNY+gFdcsSBa2v
         4CTiIqGSsDWOK9Nih35PvQ0p0HvA6cOr8fZYSVRZOkeHsXGTyXUZs2KVHaOHFayUuL2z
         3e/iAwBBcI6aS3YdhO6SnLp8YcfiBCpMu2Zd0SM+3/6f/V4Ne8nI98FNeahGUEatZj+W
         W+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685912023; x=1688504023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMdRlD3RmAquqJCxpsCbMeN6ju6zKj6JUFR8/2WFs3c=;
        b=YWvDd9rCnH8Lcc1cPVqzGDimyFeQ8DmSBa+SWLPuabDF1Y8lBPWSr0uIvfaTQVh8xh
         UQCDTyrnSYjggW6pysJdMKZfz84Q2pCXfj2Z5lxIK2bGfKpAgdnwDjjT9b+xa+Bh81n0
         RN5LUR4NDGf1Vh69r73G5TVQq8R2BQAD9SmCGb/7uYlzZISxb2NuA+FRD7e7NRGaKCir
         cfOcjvEJ45ZgWnS0ZU0s7PbEW96ZGk2cW23I6tHfwEQ3KQn9ECWTHT7ik6vAUHEiZU4w
         48klayZKc/L1NzF/4Ue0IZNh1mTw8KOCZaVTo3OKBnxOx3d0CF2y3JE3RvkUmnOhJ8BK
         J2Dw==
X-Gm-Message-State: AC+VfDwPUY4hJw3jZhVJ4MvGl8+jmGTG12NUMjU/fM/KdImya6+iN+6C
	9grHSQciJLDfBz6MRF/ylPm9TbDWdwsS/VjjUP8=
X-Google-Smtp-Source: ACHHUZ7GR+ovbrMerE3jxZsLZ74is1r45C4hfWtsepG9CDX8PQO48qsjVKDBY5/BCpbiDVBGRDX1z+EO138N2+BqZ7g=
X-Received: by 2002:a17:907:d29:b0:969:e7da:fcb1 with SMTP id
 gn41-20020a1709070d2900b00969e7dafcb1mr6049931ejc.13.1685912022545; Sun, 04
 Jun 2023 13:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-2-bigunclemax@gmail.com> <ZHoBXxM80aqvLZNt@smile.fi.intel.com>
In-Reply-To: <ZHoBXxM80aqvLZNt@smile.fi.intel.com>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 4 Jun 2023 23:53:30 +0300
Message-ID: <CALHCpMjc5+rsNvTHyy3V-+0bJ3yez+ewnGwyk+k-hvmNaF6TsQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs GPADC
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Cosmin Tanislav <demonsingur@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Caleb Connolly <caleb.connolly@linaro.org>, ChiYuan Huang <cy_huang@richtek.com>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, William Breathitt Gray <william.gray@linaro.org>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	Haibo Chen <haibo.chen@nxp.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_135344_872467_67681769 
X-CRM114-Status: GOOD (  14.19  )
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

0L/RgiwgMiDQuNGO0L0uIDIwMjPigK/Qsy4g0LIgMTc6NDksIEFuZHkgU2hldmNoZW5rbyA8YW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPjoKCi4uLgoKPiBUaGUgbG9ja3Mgc2hvdWxk
IGJlIGV4cGxhaW5lZCAod2hhdCBhcmUgdGhleSBmb3I/IHdoYXQgZG8gdGhleSBwcm90ZWN0Pyku
CkkgYWRkZWQgdGhlIGV4cGxhbmF0aW9uIGNvbW1lbnQgaW4gdGhlIG5leHQgdmVyc2lvbi4KCi4u
LgoKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgc3VuMjBpX2dwYWRjX3Jl
Z21hcF9jb25maWcgPSB7Cj4gPiArICAgICAucmVnX2JpdHMgPSAzMiwKPiA+ICsgICAgIC52YWxf
Yml0cyA9IDMyLAo+ID4gKyAgICAgLnJlZ19zdHJpZGUgPSA0LAo+ID4gKyAgICAgLmZhc3RfaW8g
PSB0cnVlLAo+Cj4gSSBmb3Jnb3QgaWYgSSBhc2tlZCBhYm91dCByZWdtYXAgbG9jayBkbyB5b3Ug
bmVlZCBpdD8KCkkgdGhpbmsgd2UgY291bGQgZHJvcCB0aGUgcmVnbWFwIGFsdG9nZXRoZXIuIEFz
IEFuZHkgc3VnZ2VzdGVkIGluCnByZXZpb3VzIHNlcmllcy4KCi4uLgoKPiA+ICsgICAgIGlmIChu
dW1fY2hhbm5lbHMgPiBTVU4yMElfR1BBRENfTUFYX0NIQU5ORUxTKSB7Cj4gPiArICAgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAibnVtIG9mIGNoYW5uZWwgY2hpbGRyZW4gb3V0IG9mIHJhbmdlIik7
Cj4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgfQo+Cj4gSXMgaXQg
cmVhbGx5IGNyaXRpY2FsIGVycm9yPwoKWWVzLCBhcyBKb25hdGhhbiBhbHJlYWR5IG5vdGVkLCB0
aGlzIG1heSBsZWFkIHRvIG91dCBvZiByYW5nZSBlcnJvci4KCtCy0YEsIDQg0LjRjtC9LiAyMDIz
4oCv0LMuINCyIDEzOjQ2LCBKb25hdGhhbiBDYW1lcm9uIDxqaWMyM0BrZXJuZWwub3JnPjoKCi4u
LgoKPiBXZSB0cnkgdG8gbWFrZSB0aGlzIG5hbWUgaWRlbnRpZnkgdGhlIGNoaXAgaW4gcXVlc3Rp
b24uCj4gSWYgdGhlIGRyaXZlciBuYW1lIGlzIHN1ZmZpY2llbnQgZm9yIHRoZXNlIHBsYXRmb3Jt
cyB0aGVuIGZhaXIgZW5vdWdoLgo+IEl0IHNob3VsZCBjZXJ0YWlubHkgYmUgZW5vdWdoIHRvIGRp
c3Rpbmd1aXNoIHRoaXMgZnJvbSBvdGhlciBBRENzIG9uIHRoZQo+IHBsYXRmb3JtLgoKSSBiZWxp
ZXZlIHRoZSBkcml2ZXIgbmFtZSBzaG91bGQgYmUgZW5vdWdoLiBBbGwgbGlzdGVkIFNvQ3MgaGF2
ZSB0aGUKc2FtZSBHUEFEQyByZWdpc3RlcgpsYXlvdXQgYW5kIGRpZmZlciBvbmx5IGluIHRoZSBu
dW1iZXIgb2YgY2hhbm5lbHMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
