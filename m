Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3AAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:10:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59ED660ED8
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59ED660ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=97VgOOQwR/cS/wWWVIzLTLREfPPq59xONZRG+DFXcZY=; b=xw8mAKkpdGYh+ltYC2c2fgixjo
	1HXnmxIomJdtLo2J1+wxMWDM+E/Kl0Eeonc1xXQfSdJINefKbX1IMC12blGa1WzHmywHJrb6vB4b1
	yHfDu/9MxeyKlhzykutwmTDuukbqvwOpFYXTevx6wqOlsCCdjvId9VgTmA78TW1rymbD4JpWk3hyJ
	hpiHmDuGxgjNskom/I+gaJUkdjmi4vxq+hjoKbwaJyn43dkyelZ4+lYeR2Sggj0RisnHGmdAEcBlU
	O0YpoY1wWaOMgrbjjcZ2UUn+jMiPMnMFDzvxy1xxboQK6LIt8E4eQFeC/TT/sbZl3JsjBTSUdnORG
	yzK3RB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7GI-005YbK-U4; Tue, 14 Sep 2021 12:10:06 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7GH-005Ya7-0d
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 12:10:06 +0000
Received: by mail-wm1-f53.google.com with SMTP id s24so9046112wmh.4
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 05:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JC+0egzoxCxJUo8E1fbA/DfFivG3yL6BUgvb6VoV5CU=;
 b=2DJzjI6jeG1u4saHH+hrjhmqs59u08IxoFNIJe0yEkzt0WqVOKBpYN3xL6X1qpRy6H
 mgpoHPMfMCizdFpalBhxJzH4YvExSmcoXpAZl1LH5WJiv5PmwM2gllBe8gayFQf3/kRV
 +2LZVBLieWewhCzO0QRl64M3dYUT/FopjerQ8KgSFO2ZpLgJUzCrJtlZO3CnQ1DidQES
 DvoWNdZBzDscqq8LYlRTTgST8VtLar6gBqcX7UUN7JXdVCnPvQXzaBHtZoYgI4ErfvI/
 Avv59yd3Wnk7kbA0Z0gEhMO7ncAWep1cvTIMyIJJavYGZ2ad2gI6FgxCSlEX/ipSRSXs
 vTtA==
X-Gm-Message-State: AOAM532nQRfdMOCt4Hc7+NMlDl0poA0+RkNer1BwEmHvJGl0hg98TxGN
 1xqMN3wU5QqPTSZMWPEfsO0=
X-Google-Smtp-Source: ABdhPJyXiOMLsQcId48736yD0d9P0Do+Tu3NqR6NebXOOXjYSNDBRPjQRirT5BlPGhLSChrAEirPWA==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr1806704wmb.112.1631621402557; 
 Tue, 14 Sep 2021 05:10:02 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net.
 [84.20.244.219])
 by smtp.googlemail.com with ESMTPSA id m29sm10925063wrb.89.2021.09.14.05.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 05:10:01 -0700 (PDT)
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Maxime Ripard <maxime@cerno.tech>
Cc: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt
 <palmerdabbelt@google.com>, =?UTF-8?Q?Christoph_M=c3=bcllner?=
 <christoph.muellner@vrull.eu>, philipp.tomsich@vrull.eu,
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>, Chen-Yu Tsai <wens@csie.org>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
 <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
 <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
 <CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com>
 <CAJKOXPdH0C0CJe_oxZ2rG1UeE5G9w2mh2Thh8LynpNHQk2g1qA@mail.gmail.com>
 <20210914101327.47baun6mop3mc56j@gilmour>
From: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <c9b18cf8-d432-8636-52f5-a40a342135fe@kernel.org>
Date: Tue, 14 Sep 2021 14:09:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914101327.47baun6mop3mc56j@gilmour>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_051005_098423_4AA52BD6 
X-CRM114-Status: GOOD (  15.77  )
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

On 14/09/2021 12:13, Maxime Ripard wrote:
> On Tue, Sep 14, 2021 at 12:07:08PM +0200, Krzysztof Kozlowski wrote:
>> On Tue, 14 Sept 2021 at 11:31, Arnd Bergmann <arnd@arndb.de> wrote:
>>> Some subsystem maintainers want drivers to be selected by the SoC
>>> option, this is why you need the 'select SIFIVE_PLIC', but usually
>>> the drivers are selectable with a 'depends on ARCH_SUNXI ||
>>> COMPILE_TEST' and enabled in the defconfig.
>>
>> I would say selecting drivers is even more useful for distros and
>> other downstream users. Especially in the ARM world where we have so
>> many different SoCs - how could a distro person know which driver is
>> necessary, important or useful? Having all main SoC drivers enabled
>> when ARCH_SUNXI=y, helps distro a lot.
> 
> Imply, maybe, but select is far too painful for everyone else.

If we talk about UART driver, then sure - imply makes sense. But if we
talk about core SoC components necessary for boot (e.g. timers, clocks,
pinctrl), then select is appropriate. There is no point to enable
ARCH_XXX without these core components.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
