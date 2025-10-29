Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B1CCF9EA
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVPLEZABMdXYgFDq2tY2WYhzBCHr9BUrTRSrAXqJges=; b=VdedcD3lRTxlAR
	7zf4q3uuAoaRDnx8AvknI360B7XKUonuashMX2/02TDOOXIn7/AHANyNpRv4Spm0SNC51Cr3em+ND
	pc1YIJuf1T/ETtF/Sz8/6w0m6d1PvyM/1vimVp+lyAZftBTGUbX5FtO+sjYwXouttb5OjKcAoQmBO
	FFDw3Sq768TA3PqU1asquIUIAHcOdR88Y2U6neK8KGXo/EXaMOM0E1OzvD+7XKIgW92NbgEkpjMHS
	wEEA80lZ1l48CKydVg3N6nID9eJjfisTnjtjz+2ZlowtdP3GEDXYWk87tMFmgL2kj7DMN4zev5+vU
	VzAQjWAeeYaZOIt1Plvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuR9-0000000GsnR-3r6l;
	Wed, 29 Oct 2025 00:53:15 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDuR7-0000000Gsmj-1vfP
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 00:53:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-34029cee97fso1622556a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 17:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761699192; x=1762303992; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m8SBa+XRdCWeVW9AmWkZ3MCowA+/EYnxZNZHdIoneiw=;
        b=B55zIo15KZBGnd3YO9VwibfkKGUh5huw6pKffThxBWkUSK2K2UtjNTZKD0FVMpZZYm
         Wtg0TEUs4a3Y10GDi/UIj+GxDa8lnjukxM4LWu2Sui0N5ySTiwAzFj+cvuAqohbs0Xxz
         Wi1DQbyoYFivIzF5kzdk9D9Q8GNCvE75+SPg6TV9Ixcsafv686iJaCnEaLQcYugBalh0
         YTpRYr+N+s4EUel8txd91lS/9dQ4R9y2hf8g6xI+r7ZI7RhLphLB434RHxO5nIXVZFuy
         HLvoK9qDqdfGF9GblMFSX3mTHoyFHGR1oPWjidf6TTv02+2mY4Sj8IkN/1TKH50yAhDu
         kbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761699192; x=1762303992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8SBa+XRdCWeVW9AmWkZ3MCowA+/EYnxZNZHdIoneiw=;
        b=P6GJUQf+NCgFEPgI9P6anfzzdLVCwFjE4nJrNxaJNv8qkw9S1b3MUEg3UZP1mS2TWP
         Xr0M0A11Gd0hMbq1nP7k9fEX8KtjY7eDcMAVl40R/rI+N+qci1pIjrbm+K2WTOlQjZmf
         eTzGyZ3JlJ4SD8paVhhBVKiGY10MDRZxgK0VwKC3tT/AbuE1z0ebp2CPeUhETui76uli
         OmDozZv7NjfjLCq6b/QAvULDqQsImldYd9z+t1jjUqS7Y9pqwqnLlCvS4xA1BrG1hsnq
         Oxg9P8F7EOhHF6FHcdZkFURMnndAT+FHwfnnmc/zSAZF7gh5dBorbN5eKUud+H98RCGB
         lxNA==
X-Forwarded-Encrypted: i=1; AJvYcCXLfCuWxGpI0MrMePOXLc8/MI25dhDrDYZcKRzptmSj55enjATsHZfZxLOCSNOziO7IC9b9HvPaBLdpPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yywvi8IFGxZ4MxBYhN9QhRe+BZ6rt4TinDj/8dkQaqJzG7MKbOh
	oxTmHWzV5XG6cTRB9FcG3E3Atg3jE1nRkJOWY1Tj+YTVnTyf5nh5DB9G
X-Gm-Gg: ASbGnctLvH7feIEaj2BMtWmV/mByVaKyPE01MtJRj87Z7v6Fwztzb1Ny4W65VZwzeR1
	485cS2K1WBHW6YTS9ntOBhVhB5LpA0mLpTeUERHzQB1avZIyxIf47dUOE0kImm0d5lZLbB6O5Lo
	STWMu/WNjAqIUVYhGhf/olKpTpJuTz9ReDilaH8WGX0Au8Cq2+00mpLwD184QYqGivu/hFyUod4
	r87pFj1KMG3XRL5a2cOOCU9+H66qnGb0YhaA4Bfl9f9SvkP3WG1RX8edGlTUipBHC/y4qK6t9Dm
	r4nDNCdsGgtdaz9y+2THGtab1wJZvZrkRyo6fXpe77iz3tDltLnmrMPvsKu/JaX2FosdU/cElcC
	VwV7SEzMbeOvWC0dqthQs23WuUiO9ICgJFUeI0KAH8SVKqlp2trdVruTaxWsd5Gvcjso4p2NqL2
	E=
X-Google-Smtp-Source: AGHT+IE90UXiGYJzRQ58CyS5PxlflDC8vEvcklnc4McQT7Hk9PgOXlQ2qQeKd9vAUAOVnUzqvljQKw==
X-Received: by 2002:a17:90b:2dcb:b0:32d:d5f1:fe7f with SMTP id 98e67ed59e1d1-3403a260a68mr941140a91.15.1761699192237;
        Tue, 28 Oct 2025 17:53:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed70a83csm13316804a91.4.2025.10.28.17.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:53:11 -0700 (PDT)
Date: Wed, 29 Oct 2025 08:53:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Joshua Milas <josh.milas@gmail.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <7e37k5hdn7nnn7cxnfrzqfy7h7a3ofnaf4r6rgk7exehrhsn2i@rvxjxvh2sodw>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
 <aP6UJFPP-ReYPzmq@sleek>
 <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4bdad288-250b-4e94-abea-eb231fba5beb@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_175313_523162_5F2A172A 
X-CRM114-Status: GOOD (  33.47  )
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

On Sun, Oct 26, 2025 at 10:48:50PM +0000, Michael Opdenacker wrote:
> Hi Joshua
> 
> Thanks a lot for working on support for Milk-V Duo S. I'll be happy to test
> your V3 :)
> 
> On 10/26/25 22:35, Joshua Milas wrote:
> > Inochi,
> > 
> > Thanks for pointing me twards duo-pinmux. I was able to use it to get
> > the default config which is uart0, spi3, and i2c4. I can change the
> > dts to match, but...
> > 
> > > I suggest enabling devices that are accessed by default
> > Would we rather enable anything that can be accessed by the pinmux?
> 
> If I understand correctly, you can't do that because there will be
> conflicts.

> From the Duo S pinout diagram (https://milkv.io/duo-s/duos-pinout.webp), on
> headers 41 and 39, you have to choose between MIPI, I2C2, PWM12/13 or SD1.
> If at least 2 of these are selected at the same time, there will be a
> conflict, and I assume that the pinctrl controller driver will flag it.
> 

Yes, that's true. Boards with CV18XX always require setting pinctrl.

> Then it sounds complicated to define a default combination for the whole
> board, because it's like a default use model. Who gets to choose? What
> Inochi suggests is to follow the vendor kernel choice, which would
> correspond to the way the vendor intended the board to be used. However the
> community could choose another default way to use the board, so the choice
> may be up to the first contributor to the mainline kernel for this board,
> possibly revised through later discussions.
> 

In fact, I see the maintainers do not agree adding every possible
configuration to the DTS, (especially without "omit-if-unused" flag).
And in many case, it is impossible to add all possibility. As a
result, I prefer to use DTS overlay if there is something custom,
and keep the mainline DTS minimum.

> I guess there are cases when the choice is easy:
> 
> - When only one configuration is available for a set of pins
> - When there are important devices on I2C or SPI buses on the board. Then,
> you want to find a way to prioritize such buses. Fortunately, I guess the
> board design also guides you to the right choice.
> 

In fact the priority is the thing that is hard to decide. This is why
I suggesting keeping compatible with the vendor kernel, as many people
starts with vendor kernel and it is a good thing to refer.

>
> I was facing the the same question today on another board, and that's why
> I'm happy it's raised here. As thousands of DTS files have been written
> before, I'd love to hear from people with experience on this topic. Are
> guidelines written anywhere for board DTS creators?
> 
> Cheers
> Michael.
> 
> -- 
> Michael Opdenacker
> Root Commit
> Yocto Project and OpenEmbedded Training course - Learn by doing:
> https://rootcommit.com/training/yocto/
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
