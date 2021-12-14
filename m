Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACB7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Dec 2021 11:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zy8NWl/Fp8Mc+SfQBKL+DTWhvALLX4Gm/DwHPD8WT9Q=; b=zw0574W3r4enZ0
	Qeo7pDvCjHnfVyhLaTIyoP4RwIlWWKylVhrpuEPbikaRuZ7MO/XKR9lQjs8QYFk/DcZyrrWqXTpSb
	7qrgPGFCbibkJd4Z/sgO231ftDb67knE7lic8EB+3keJO9oTzS0dvzQVhPKJMeHT6Mgb+rZHgb/kT
	nnPTAJGgn8XlMJtSdi3SnrU7OqApQgzdpfqUR4LWC+uznf/kYdDVbxbO0usNZqJosdQM1yS1rjCEc
	ZPB0mWC0fg2AsXqZJVpousoVQyE77DreG8FixI6RDpciCTY+bUUx2gpyQ3u2a5/y4ah0CXEG6/azF
	xPnPFlAx0KxM8QsOMaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx5ny-00Dfbh-Mm; Tue, 14 Dec 2021 11:17:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx5nv-00DfZs-0B
 for linux-riscv@lists.infradead.org; Tue, 14 Dec 2021 11:17:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id n8so13317286plf.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Dec 2021 03:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdUzozq/ia4XNyw9Pm+HSSllN+T8ynAAyub4gDqEXTw=;
 b=FF5tC5p1JHjCujakt/eVqkNtMr03J1AZ8FOQ+ekPma2ooNlljwmVltMYe9EKxww/hX
 zCfBSt/w75HmySey0Rz8KzE1Tg+08qJnTrh+kYOc+SGtVXDDrRuMdeIzJQHh7Bf5zkCr
 wm6KNdFwKAij7S2PHIzNOZmfTw80UCoRl6w/bl3dqNfRx+dVBW3VOOczVzhaEWXBtBE2
 AuEQyYdkLlw6x/Nmm5SQerxI2cH8ONofrxR6oAXxvRyRpqHYvE1Ua2Fh1N0H+6ar0tl0
 zA613tINPbuL6xvA7vx7F1aX3HLXLy5LAptD342AfSIM4cfj1VtcYe4eQJqTDnwVr1Ba
 WGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdUzozq/ia4XNyw9Pm+HSSllN+T8ynAAyub4gDqEXTw=;
 b=1IvIIdeMOycjLdRwN4SMgSf7zGd0EG9CFdSff7OrPAKh5IgnpegKFlM9ayiJ4zoDAb
 AIqTW+DRu5hhU3oZQQsbu1/rXXs/Wk8uyJzWULGeEzvjXD0eLs7wJjBZvXWFRh+X5hTg
 v1LY7U2EZFODiYkCMpSl0/rS2PuEdvwmBrOshRrTXj50a+FMtEyauVCDUkl+eJjwS3YC
 7GvBjSHyug5kq471HRCgPrMeCcbpaAPNw3aVcf1lR2WWEJzh2p3SkOaiVFVkcGQ1pxqR
 8WkO1hUuYDRQOVDxa0qZRWGZv9DIawse1UMxceNN9OCPJLoC7j/gmNxcn2AbuiN0n97H
 6EtQ==
X-Gm-Message-State: AOAM530YbCZaJhLLqky5deJB3m9EPxFN915LnkG26KMGUU378vSnA9xl
 yUGj+0C6ljqsMZF913M7m3E=
X-Google-Smtp-Source: ABdhPJxi7Vc0gMieaSDjbfQ5fHLxKKOvYsOCvjCR8XYyECgIAJVp2lwcgY5K8ae/LxW3MUlTnu+GFQ==
X-Received: by 2002:a17:90b:17ca:: with SMTP id
 me10mr4777718pjb.134.1639480625025; 
 Tue, 14 Dec 2021 03:17:05 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id u3sm17410146pfk.32.2021.12.14.03.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 03:17:04 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
 by localhost.lan (Postfix) with ESMTPSA id ACE2C90090C;
 Tue, 14 Dec 2021 11:17:02 +0000 (GMT)
Date: Tue, 14 Dec 2021 11:16:59 +0000
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>, "open list:RISC-V ARCHITECTURE"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: dts: enable more DA9063 functions for the SiFive
 HiFive Unmatched
Message-ID: <20211214111659.29bf5ea4@gmail.com>
In-Reply-To: <YbhqNY/w36XT5zx0@aurel32.net>
References: <20211108214629.1730870-1-aurelien@aurel32.net>
 <mhng-7ab80707-35c0-4123-8340-cf1feca4cca2@palmer-ri-x1c9>
 <YbhqNY/w36XT5zx0@aurel32.net>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_031707_088136_D17D11D5 
X-CRM114-Status: GOOD (  18.69  )
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

On Tue, 14 Dec 2021 10:56:05 +0100, Aurelien Jarno <aurelien@aurel32.net> wrote:
> On 2021-12-13 18:13, Palmer Dabbelt wrote:
> > On Mon, 08 Nov 2021 13:46:29 PST (-0800), aurelien@aurel32.net wrote:  
> > > The DA9063 PMIC found on the SiFive HiFive Unmatched also provides an
> > > RTC, a watchdog and the power button input.
> > > 
> > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> > > ---
> > >  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > > index 2e4ea84f27e7..c357b48582f7 100644
> > > --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > > +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> > > @@ -70,6 +70,10 @@ pmic@58 {
> > >  		interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> > >  		interrupt-controller;
> > > 
> > > +		onkey {
> > > +			compatible = "dlg,da9063-onkey";
> > > +		};
> > > +
> > >  		regulators {
> > >  			vdd_bcore1: bcore1 {
> > >  				regulator-min-microvolt = <900000>;
> > > @@ -205,6 +209,14 @@ vdd_ldo11: ldo11 {
> > >  				regulator-always-on;
> > >  			};
> > >  		};
> > > +
> > > +		rtc {
> > > +			compatible = "dlg,da9063-rtc";
> > > +		};
> > > +
> > > +		wdt {
> > > +			compatible = "dlg,da9063-watchdog";
> > > +		};
> > >  	};
> > >  };  
> 
> Thanks. However, wouldn't be better to merged this patch and the whole
> series instead:
> 
> http://lists.infradead.org/pipermail/linux-riscv/2021-November/010234.html

My apologies about this, by the way: I had prepared that patch stack
last summer and was witholding it until the IRQ-fires-only-once
situation was resolved (it does affect at least the onkey subfunction,
although in a non-obvious way when the event triggers a shutdown or a
reboot). I did not think of checking recent submissions until it was
too late.
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
