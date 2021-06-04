Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2748BC07E94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 15:52:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54E9613F1
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 15:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54E9613F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rjYfLSZFmOm6hedrv+lI1HxW7vGtVmjL/PkLRYK3Tcg=; b=4t2GiDICOORLylao4qQPoHxoRU
	YgsorY8mc6R1OWyA4SeDRGc5HJEOHvQGIQ+UqqoTYGCFmnKIxMVvC/PeFzmAtEiEiy6evFvefO1V8
	kbpYyFPw2qpkSOPMewve/Gqvf5LE5xqh+7s8M2VioUh9l55uylG1bpVk/dDjXbkf25PVy9EMWimXD
	dyJXuheItpx4cqSOo3+t6EfA17Lf56seRgDjf1i+N6QcZExLEH/afhHLWLkv78mkgKzIc9RwlY4Ue
	taoHPvPtRbxy0LW3zW7bkXi1XORkS/utxjDddUwm+5ew/gBlJcDHnr09fKtgV4Ut0gXurv2vPRsb3
	TJcGpnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpC7Q-00EFjc-TB; Fri, 04 Jun 2021 15:52:20 +0000
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpC7L-00EFi3-CB
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 15:52:19 +0000
Received: by mail-pg1-f177.google.com with SMTP id y11so62941pgp.11
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EblRfcbrw2Bfqfw9tfH547IVGROshi6ov6X25dHCJ4A=;
 b=yRJyGFcI2I1WPSrV9AuioyhAYT7ivG/QNeKzsKD+R3SWR+zmdDzvTJyQHDflLW48UZ
 ZMN9fWF22tbQszlRzxddUiBYPzPGvPeEnHGVjyZ6H7fngyTpw3uXmStjFrVkZy+OQcso
 kXMV0enVx2naw8jI3c2txamHX0gLCKYwF8ACEAmsgd2Et14JHk6UEFvFDvR1oTzWCNbc
 otX5J5MRTZSIUstEeftY1EQ0uKBkF2eZATvJBfiVw08Kk4w5bqIaaJ0MPntelkdjHTOI
 m1IhzpFWbc1BWJeMWkQZo/eHDUvPXDE1MN6zeKvq/oER5cjMWYiEQu4IxZyE8+iPMyTK
 JF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EblRfcbrw2Bfqfw9tfH547IVGROshi6ov6X25dHCJ4A=;
 b=NkKjOX7aWFsBr1/KkcYysNmCTca0RAWRJnei4ftfFH5qAGNWzHBn9gxenc6v0YO1VH
 t6h27Wjo2epm1Ra7qDKyTcar7UjEzOzWI+ExxHO3Mggh8je5oTjow7DDPozHkqv84SU3
 fKlVh4/lIudolLiBxh+UMDzptj6r/jWO1Cf+NF5JSWr8m6DOoEOOYaCQw8Y30LYvwkw9
 pujq2z4VUZXfzouOKPtz2TO1D7KtDT9TYB+ejV5OH5VvxfmqhXc3VnTpch7G3UZuruhB
 HSL7vm5K9jqjVrcmpsbGBBuNIO3PW0yYlnCwvhkdKzKKUh7A2PvHvABlGhZTnciypuTf
 rWXw==
X-Gm-Message-State: AOAM532547yf28XtPIMFaZxz/LmJrp+caIEnILBbOWDRwEUi/P/8oXkN
 5ka7pueXyeDrflwQvN8PyrYMcQs/Dkl9wCXf
X-Google-Smtp-Source: ABdhPJwjL1ysqjo2D10XZSVezd+QjVVOK16oTGexVdRXBHLeQlNEuD+FadY9VPzz6KqoG35+tyVkog==
X-Received: by 2002:a62:5444:0:b029:2e9:c69d:dc64 with SMTP id
 i65-20020a6254440000b02902e9c69ddc64mr4996989pfb.32.1622821869389; 
 Fri, 04 Jun 2021 08:51:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f5sm4869053pjp.37.2021.06.04.08.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:51:08 -0700 (PDT)
Date: Fri, 04 Jun 2021 08:51:08 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Jun 2021 08:51:06 PDT (-0700)
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
In-Reply-To: <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
CC: alex@ghiti.fr, robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-f1a76f5f-ad66-40ae-aad3-cd2f669f33bf@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_085215_438280_226918FD 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 04 Jun 2021 06:08:05 PDT (-0700), Arnd Bergmann wrote:
> On Fri, Jun 4, 2021 at 2:06 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> Fix BUILTIN_DTB config which resulted in a dtb that was actually not built
>> into the Linux image: in the same manner as Canaan soc does, create an object
>> file from the dtb file that will get linked into the Linux image.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>
> Along the same lines as the comment that Jisheng Zhang made on the fixed
> address, building a dtb into the kernel itself fundamentally breaks generic
> kernel images.
>
> I can understand using it on K210, which is extremely limited and wouldn't
> run a generic kernel anyway, but for normal platforms like microchip and
> sifive, it would be better to disallow CONFIG_BUILTIN_DTB in Kconfig
> and require a non-broken boot loader.

When we first added BUILTIN_DTB we actually had a compatibility 
mechanism in there.  There isn't enough in the ISA to handle board 
compatibility, but we were hoping to get something to deal with that.  
It didn't pan out so we dropped the compatibility mechanism, which is 
how we ended up here.

Maybe the right thing to do here is to add some sort of "be compatible 
with the platform spec" Kconfig, which we could then use to disallow all 
these features that result in non-portable kernels?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
