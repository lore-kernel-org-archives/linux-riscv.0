Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083FCECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 13:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/v0kMfE4GKlslmONp/rrAg/7RoqioCVpx8ND89ZiYQ=; b=UE7ED5jDPOtmqA
	yEBAdSDiZEdjK0fIG/TCNO2RVroHPRpzDYYkWTDV1A3gymIpnAGfWci3cL6wtyxxNGV+mQEcB9nQ5
	ejVzCQD9896CUFtx/cT18TOmSZzYIsQuCf3IHzcuC2KbyKlc4SsgZnpsnEHcznPJI/w9DjzTvR60/
	KBO7eCQsUlO9NfsKHmyye8LveReN4LeMxevt3Qr67sVPTBCB3mCk6K9FTa9UkjZGx9Zgr1ud7GI15
	6EeQZVJdfnICQDtcpq+nbTJWpEcZgGwzKnStnXscsF96gvG4ng+qCHUBNX+Z3n8trd1wzLki3iAkC
	7ola3VR36LEyrWBZI5Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYKs-00Dcqj-S6; Tue, 06 Sep 2022 13:09:50 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYKp-00Dcll-DQ
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 13:09:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id u6so15017166eda.12
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=88S83VgtdPyH77FG9hMS+SUCEVS9Ip7NvKSaBXxAsxM=;
        b=mAyIh9BL6U13TF8OsThv9eGZVdT6lvAT5c+VkmlaX2Blb9QVFDnzwRqY3DlVOjnVyp
         bF33+Zy3zElL8dojbFmG5JVyijBo+Em15s8Hjp11XZGOsBa4L1JKNshzsdSXlgY5Up3a
         Nz1bq8y6+yl5SuqRWlAnNFwUljDjPrGqMqxqjplClzH1JQZB17kI14cEE0/HY8Ef+Wxz
         KiPmBw815Dl4lsAJxOsiwXYaTYhfnJLsOAo8dSd95m4YSd65uVgNnkTAwSfLYDEGL+Vb
         8lgEK+0gOlk05N5Kv2A96lZMo7AHB8Raxp9OmR4nv8ddpe44e5IcRMYMpyhdq5BLpXXI
         ODuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=88S83VgtdPyH77FG9hMS+SUCEVS9Ip7NvKSaBXxAsxM=;
        b=06mrFUKvAF3ISYWIDUhmJ6L4n/N7OLTA0d8iD6LkpAJFNBK4xZXfJQkL8Y/ETOxRzd
         dmKNhQk2fGfn+8O+JQTIDPG09rncRwV/iDproyqe0KPmXLyrLBJEhiU0WvxuH+5/t171
         80xJq7eTTpf3IXsAb54ia+DZWjTnMS+1t5WkMI0EYMHsmzy990RM/jOKptorayTXCRul
         OMsr4kwtrmXtOu5nxH01zkbwojtteHvDn4XSdDErnqHSqnDaLFLqHWoqepZ9tp6r//vp
         VTSBA2cJnPg/C5MUwKWpgA98zSvb/oLKZbGoI7yTJx0FgCXkaeZvkyEjxJc3SAcbDhq7
         bYEw==
X-Gm-Message-State: ACgBeo3bcX/tMQ+34hqPIra5yi0hSaDFOgQMu+Q2OzZ5dfsL79t7slZ2
	0JdseP8vAaJeIMcyf4DufWkqis/wXwU+OaJa3MQbWQ==
X-Google-Smtp-Source: AA6agR4jq9Z8dAf/3EQ95TiI0FXT5EC2lhCOyeBmcWkquxjlowspq2Bm8Wgn4darPlB5Du0MQ8kJI+uN9l2iRtOKLqE=
X-Received: by 2002:aa7:d6d9:0:b0:44d:e1b7:d905 with SMTP id
 x25-20020aa7d6d9000000b0044de1b7d905mr11675722edr.32.1662469783678; Tue, 06
 Sep 2022 06:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220815120834.1562544-1-lewis.hanly@microchip.com>
 <20220815120834.1562544-2-lewis.hanly@microchip.com> <CACRpkdbk_ZqYnDzXgmbnAxhs+mEe9f2X-y++9HDS-O=UO_tUmg@mail.gmail.com>
 <31d2bd0514652685cb87a7c9d17529b9064de2bf.camel@microchip.com>
 <CACRpkdZqvEvqjzTN3oQqrV_CNK+D2+c4FjLiC1_ZoKQ-rMMe5A@mail.gmail.com> <23d74882a69b39025005495886faec3e5b129ba7.camel@microchip.com>
In-Reply-To: <23d74882a69b39025005495886faec3e5b129ba7.camel@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Sep 2022 15:09:32 +0200
Message-ID: <CACRpkdYiLqiK9bzYoOX-fz3cCdojDjQj-amsQYQRcF2HVUWzqg@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] gpio: mpfs: add polarfire soc gpio support
To: Lewis.Hanly@microchip.com
Cc: linux-riscv@lists.infradead.org, Conor.Dooley@microchip.com, brgl@bgdev.pl, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, 
	maz@kernel.org, Daire.McNamara@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_060947_500973_F55F0284 
X-CRM114-Status: GOOD (  17.85  )
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

On Mon, Sep 5, 2022 at 12:45 PM <Lewis.Hanly@microchip.com> wrote:
> On Wed, 2022-08-31 at 15:19 +0200, Linus Walleij wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the content is safe
> >
> > On Tue, Aug 30, 2022 at 6:51 AM <Lewis.Hanly@microchip.com> wrote:
> >
> > > We had looked at the bpgpio_init, our controller is not fully
> > > memory
> > > mapped to support the bgpio_init() and get all routines for free.
> > > While we have in/out and intr (interrupt state) 32-bit registers,
> > > we
> > > would not get as much free as other generic memory mapped
> > > controllers.
> >
> > You're not really saying what the problem is?
> >
> > Is it that some registers are not one-bit-indexed from 0 per GPIO?
> Yes some of the registers are not one-bit-indexed per GPIO and for this
> reason we had not implemented bgpio_init().

OK that's a valid reason not to use that. Thanks!
The regmap may help though, have a look!

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
