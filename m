Return-Path: <SRS0=gYOx=TW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7419C072A4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 04:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86EE62184B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 04:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uoWR7hSY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="V6m9X+Zm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86EE62184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4zvahZjswxxP3pIuOE25B6UO1PJdbCuywemQ/4ML1w=; b=uoWR7hSYwUmTbC
	MYv9csbTZZU9U4eGw+mKqBnJRuD8dOUI4FLbHFP4TnhyAV+KTypVKwsnjH+KRL0TLVyFoIcEkUR6H
	Hqd45q4Lzt8xc5coozxTUPlpFM/hCrR3Zkux2k3PpKVqXXa9GCiQeSiOf4Jc6YUgvRLfF8JxYWD9D
	Ow8oAfX4qb9l+tHEqMV33N0wMpINIWt+9b5Ci2oGaTfsgDYalmzCUCTZiZx0bw/m+8eOcgn5srD6I
	wOOgnXhYtwujjtA7iqc56q42bUPvVJx0ZztfhakIHv0qZtBRD9sAEF68ZIUqYBgi4TU3e5hdEX9R6
	66KKcyp2DNm+pHrVlV2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTJ5S-00056Y-JP; Wed, 22 May 2019 04:42:46 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTJ5Q-000566-4n
 for linux-riscv@lists.infradead.org; Wed, 22 May 2019 04:42:46 +0000
Received: by mail-ua1-x944.google.com with SMTP id p13so392118uaa.11
 for <linux-riscv@lists.infradead.org>; Tue, 21 May 2019 21:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6X2R7TeyYlINAsMB5hsTxhy4FZ9pQ1FqqKbMOZWIzE0=;
 b=V6m9X+ZmJ3xj9dgHGZJZHdhdJRP3HzQNCQp2KLB7LW3YJNWXnFR0U0V4oGKLPZXu6h
 uVA1efMsREJkvY6iGfFzoIjZHsCqEst7JJbvI+QBw0mi5YwfJW9HVVyxVf0RHuyXk69z
 aMMkFByQ/S7Ec4sz6Y0x86n9CeDxZ7MWOMp26fSubdvbUuaSWWlzSq3P4z9qpvhhRz34
 b2ZX3eONt0xN7QmU3NHongYNpgRoPTVx8ZbxbRzlj82DiTo78DSjZtDatZ1dVy4IdzMC
 UuCnzNHtMab9jRP3wTiFdGAvVpDaUWZjNZcmR7rDzcrXc6ROBU3szF4vw70mYGmrrvg1
 KgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6X2R7TeyYlINAsMB5hsTxhy4FZ9pQ1FqqKbMOZWIzE0=;
 b=XniRhzLfxgM1Bmq6fE7/0IzLMy9Ld3DHWVxyvF1ZD6rn1UonA5a6z2nKBEFwyZZMvt
 4szFzkn7Nm7+laKVMt7kbXCOEA2hJisZY8HBUMHwmv8219clNchw81p4UKej9uqar2fK
 q50ef9W1J0TEWgt1oP6/OZc9nmS8JhVX5C5IbfI2khg/aF2FZXfSf5v/VSeEvd8YK+k4
 YH044r1l5J4+VMc6/WFvXEBQaXQCBbDXXPgDAw6hunx1lZLQtjvlvbAEPZGlWCiN8Js5
 XH/sp2CrxEKWhf2sKm2jxslUst1yHiyEQVLj/EItBKaeU6IdVOIJwM7o6/blI+928gEe
 MoFA==
X-Gm-Message-State: APjAAAWyYLrGwSBcxc66FuYvRpYPoSUyYgFrumGt8ZKNmvAkxyRJJAz9
 Gfc6gaGNBS58cgsipoNxLR0wmTH6aLCaL6VGdSvdtQ==
X-Google-Smtp-Source: APXvYqx4gcA3u8FWbxsMDSWyJjOGkt24f0cPp/59T+gWMqIyt2Wm/DOZVwwE0CNHDAvtzZj243KNedSsdo6hxXVUMP0=
X-Received: by 2002:a9f:2b0c:: with SMTP id p12mr35605801uaj.143.1558500162507; 
 Tue, 21 May 2019 21:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
In-Reply-To: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Wed, 22 May 2019 10:12:30 +0530
Message-ID: <CAARK3HmewOZzv-p4JxTb-Cb2PT4qqJoxFO8mhHtz=qDq8XGS9Q@mail.gmail.com>
Subject: Re: 5.2-rc1 boot on Unleashed
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_214244_217014_08067BD9 
X-CRM114-Status: GOOD (  20.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,


On Tue, May 21, 2019 at 5:03 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Hi,
>
> 5.2-rc1 still requires some out-of-tree driver patches.
>
> Here is my tree (successfully tested on Unleashed.)
> https://github.com/atishp04/linux/tree/5.2-rc1_unleashed
>
> Issues:
>
> 1. Thanks to Paul, uart & clock drivers are merged. However,
>         a. upstream clock drivers require DT changes
>         b. Those DT changes are still being reviewed.
>         c. FSBL need to be rebuild & updated for these DT changes.
>
> That's why I am still using the old out-of-tree clock drivers for now.
>
> @Paul, @Palmer: Can SiFive share the updated FSBL binary so that
> everybody can use the upstream clock drivers without having to rebuild
> FSBL by hand?
>
>
> 2. We still need the following networking hack. I had to rebase the
> patch on top of 5.2-rc1.
> -----------------------------------------------------------------
> commit 1cae94e4f38f (HEAD -> 5.2-rc1_unleashed, atishp04/5.2-rc1_unleashed)
> Author: Atish Patra <atish.patra@wdc.com>
> Date:   Fri Sep 7 10:22:27 2018 -0700
>
>      RISC-V: Networking fix Hack
>
>      It looks like that kernel driver now supports reseting the
>      signal one additional time. As it had been  already reset
>      twice in FSBL, PHY gets into incorrect state causing below error.
>
>      ----------------------------------------------------------------------
>      macb 10090000.ethernet (unnamed net_device) (uninitialized): Could
> not attach to PHY
>      macb: probe of 10090000.ethernet failed with error -110
>      ----------------------------------------------------------------------
>
>      This patch is just a temporary fix until we have a fix a FSBL.
>      It is just a **HACK** and **NOT TO BE MERGED** into mainline.
>
>      Signed-off-by: Atish Patra <atish.patra@wdc.com>
>
> diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
> index bd04fe762056..4b99b226c885 100644
> --- a/drivers/net/phy/mdio_bus.c
> +++ b/drivers/net/phy/mdio_bus.c
> @@ -94,9 +94,6 @@ int mdiobus_register_device(struct mdio_device *mdiodev)
>                  err = mdiobus_register_reset(mdiodev);
>                  if (err)
>                          return err;
> -
> -               /* Assert the reset signal */
> -               mdio_device_reset(mdiodev, 1);
>          }
>
>          mdiodev->bus->mdio_map[mdiodev->addr] = mdiodev;
> -----------------------------------------------------------------
>
> Can somebody please look into this so that we can avoid this ugly hack ?
>
Yes, I will look into this and submit a patch for the same.

Thanks & BR,
Sagar Kadam

> --
> Regards,
> Atish
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
