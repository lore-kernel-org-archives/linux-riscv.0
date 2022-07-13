Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98487C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 17:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TN74rUrGjxdcefj5Uwjp9XrmBH90LK14nLQi+ebUaHo=; b=Y0FtGODTPMAey/
	bho/kVhgaZFQpMRTl7yDDCJwgdp8+Eg0ru29HWvawUBl6VQsXfncEqIxDP7B7LT4mwXjJIO/4beNn
	GLLwBkctxyky9B8s0uiBxnDI90JB48kjYa7RZvxNmmri5iq6pAsGbDDxOzMzFzjlNOZ9PL+q3iFDB
	YT++mEgAaBuoBBMhL/XrixQCjpGfIh3cvt+jde63NrB4okGZMvM7SQ28FoLE9vHV2RbNQ/PYKXJY6
	zH5v7SpVdePxcXjQ/Le4YMZD1A3qTi3QMAhzlEiGnONWjuidu2nZItadadaEfs2TM/036eSStoQPd
	3jn6ewdXeij4/L+qXpBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBgWN-0069Ts-Aj; Wed, 13 Jul 2022 17:51:35 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBgWK-0069SK-Sp
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 17:51:34 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id e69so20545298ybh.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Jul 2022 10:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yvxn6S29978hI/T6QCXVM0v4iM3QSPq55Yrl5aDYI6c=;
        b=jnIlgLZ2fiKVP4qOrCjnBx+br4vJ+AmDf+BbxMlEqjvFesMThRdGWab3fDiIvvn2mB
         CmBxUOCxy2LqsH2wGXitO5Lfd/xlKrNOJ4OOQk0CvE/4662285ihChr5BOeODFoM0Djj
         TE1cAwEZU6cGC1W/hAkA24xyIRtxr7behpzhdScSTAeWzsJV1sS6Jx8NNufcYoq63jKO
         pGMki2J1eHtPAzKT4giZiZsud0sWt3ExHfRjMt0lCsErtHjFsp6AGxka7B8AOPetDhgd
         7YUl2ki7MQVY5/xeiiIRbA7zz3FECmqWo801qtV5C6QC7rpc1fmgRNLwBRzUUndQdpYi
         sAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yvxn6S29978hI/T6QCXVM0v4iM3QSPq55Yrl5aDYI6c=;
        b=sX+eB1A5K1J3pthU+B1ynBOmECzqmQSmqOcP09q/4l3ZdTRiGI7ubtFhKiOFz5JhgQ
         11PwuxK5I/vp8NRawTPUgDgVJ1mIZJWOtvKOnBBIpcKZMvmkjcT2jujjhSRF4FaEZQIY
         S7UyImvsssnc2baKVEiBKDy/b303xwfDy+Wh5YfnfixUwb6iSnpLMVomZeHMtmgKDbZ7
         3l8JhctmDh+gPSRsa3WcecQuTwsAw3ey27PHVSroc1xLcN2aJHo+eU3JkahL+GvWmzCR
         DxFGMAohOZempPT5Vf7bARubwsO/hOFfH55X4kT0FRAOr2PLawsWdLrfZh1fNjWSn34f
         TG5A==
X-Gm-Message-State: AJIora/aZsEEFE9nbtU2nGjLOq/IVATvVttpnhac6hkQ6fI9X5ll+N+P
	jXcf8d3DQNsZ4EweVDqGfMOToQcctZaq/4kMuJQ=
X-Google-Smtp-Source: AGRyM1tc3NLn7Lq5FqcnSNwh12uwTn1m7HqDTESwOhZ9axw2eDvlOUPo/cX8YrMrSaelLE8rqb6sZoX6+2Z9hNYexbo=
X-Received: by 2002:a25:df97:0:b0:66f:6e7c:b3c0 with SMTP id
 w145-20020a25df97000000b0066f6e7cb3c0mr4738839ybg.93.1657734690911; Wed, 13
 Jul 2022 10:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220713105910.931983-1-lewis.hanly@microchip.com>
 <20220713105910.931983-2-lewis.hanly@microchip.com> <CAHp75VfGTd02jKYsFq94BF_Gqro2trk3iyyALBatS1Bps3HYhw@mail.gmail.com>
 <debb6cf6-65f8-53d2-d8d7-3ed1c3d5a8c7@microchip.com>
In-Reply-To: <debb6cf6-65f8-53d2-d8d7-3ed1c3d5a8c7@microchip.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Jul 2022 19:50:54 +0200
Message-ID: <CAHp75VcoiCVrdEMDrDC8qVZZwYgLTdi50tBxB4BQk=tWQWyOBA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] gpio: mpfs: add polarfire soc gpio support
To: Conor.Dooley@microchip.com
Cc: Lewis.Hanly@microchip.com, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Marc Zyngier <maz@kernel.org>, Daire.McNamara@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_105132_945321_209776EE 
X-CRM114-Status: GOOD (  10.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 13, 2022 at 7:44 PM <Conor.Dooley@microchip.com> wrote:
> On 13/07/2022 12:59, Andy Shevchenko wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe

...

> >> +#define BYTE_BOUNDARY                  0x04
> >
> > Without namespace?
>
> Does byte_boundary even need to be defined?
> is incrementing an address by 0x4 not kinda obvious on its own
> as to what it is doing?

The less magic is the better.

Btw, have you considered gpio-regmap? Can it be utilized here?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
