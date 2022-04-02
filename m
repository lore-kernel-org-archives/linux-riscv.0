Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB24C433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyQTMs7x4WW5UCHvKDCFJSiOKrDv3TJgHfe+Fa2HNGU=; b=PPPsj4qqUDdsew
	Mr5N3S2/XS/wrlQCU2mJy10FybWdZgXT29tVVQyCtbtN4Xaiv7WgcJYxNOXk18Jv4yZWa6C8NZnGq
	23wIzVWrJj351W85RZWe9GkT+TSktFIUOH9sdyg6xDRAq/n0bIIpBFtAUIHAfYu9mq1zOq2LoHAV6
	iSkp8+3eqK/8DZawK+y+jBG9SZ/BmJoT74FXw7sLtmYI2xpY61frM56W3BvXUiWNsWUIWZlAOO/uG
	m0DREdKs5oYJk9GUN3s7bMNQ7eGFW2h3czbwi8agBI5QkeNbzNyhzahQOFMdwCJyJRDwawHKMD4kZ
	df0G9xQN1UyFYsxZUO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naeFa-0094Jf-36; Sat, 02 Apr 2022 13:57:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nae1V-008wUm-8X; Sat, 02 Apr 2022 13:42:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCA71B8077C;
 Sat,  2 Apr 2022 13:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9906CC34110;
 Sat,  2 Apr 2022 13:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648906954;
 bh=Gu+xq607wcJLBd5767EU4rcp1lhQFK3gX5NsYIlfwpk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=P5SNXXiZYJlwtDY9K7ILgja4Zc87hqaPdzZuA4XcIfQiCgWqgEAqauONat3Oymksi
 87Z+SmQtQCTWwkSUosNSjXfEN/6Jo7qguivEZVbHhPO+6f6ILrIyWD7+UlL+sR9eJi
 vcVJx+BsnnC1yfzFNFurIc6kR9rmo9R49wRg7UcSyTRxRPxKcLrwpgVt+0sOVwfu6c
 4Rw1eHf9eLdaWDKUZgEDb0kGbGBBTkThcnsCarYvj8Dv8khaCb4nOXAguU3V3I6XGi
 Mm/KhWYBr79E28kngvHTPnvvO3WVy6LkMMukedXIJwUV/9UhFvHbYbapjP7HcxRTx/
 Tr0ioD8VxBNgA==
Received: by mail-vs1-f50.google.com with SMTP id i186so5122618vsc.9;
 Sat, 02 Apr 2022 06:42:34 -0700 (PDT)
X-Gm-Message-State: AOAM533GsFh+1FidjYojsxGqHwd+yKH+IkK9bb7Ob52GUNKBxpD8kXW0
 W623CRX6ciGHMk4hskyOqG2GBS/eW28zLMASAsI=
X-Google-Smtp-Source: ABdhPJzkOByPICbGCNWRRHvRte+HkSIGERCcxR6bEJaVQtPFOc687kt90hJEYHoJbA8dMpQCnDf3561ZC2qPkk8E2t0=
X-Received: by 2002:a05:6102:1241:b0:325:6bfb:ab75 with SMTP id
 p1-20020a056102124100b003256bfbab75mr22778557vsg.2.1648906953574; Sat, 02 Apr
 2022 06:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220402133544.2690231-1-guoren@kernel.org>
 <20220402133544.2690231-5-guoren@kernel.org>
 <CAK7LNAS8i2xe2zFQo7mcJeujymhWB7hyp36UWS4Rp9T9dMUu2g@mail.gmail.com>
In-Reply-To: <CAK7LNAS8i2xe2zFQo7mcJeujymhWB7hyp36UWS4Rp9T9dMUu2g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 2 Apr 2022 21:42:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQvDHFijfq+ekjZV4qj75Yyer84tY_eggsdxz3dL3SrYA@mail.gmail.com>
Message-ID: <CAJF2gTQvDHFijfq+ekjZV4qj75Yyer84tY_eggsdxz3dL3SrYA@mail.gmail.com>
Subject: Re: [PATCH V10 04/20] kconfig: Add SYSVIPC_COMPAT for all
 architectures
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
 linux-csky@vger.kernel.org, linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 X86 ML <x86@kernel.org>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_064237_564279_1721E5D8 
X-CRM114-Status: GOOD (  16.98  )
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

On Sat, Apr 2, 2022 at 9:39 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Apr 2, 2022 at 10:36 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The existing per-arch definitions are pretty much historic cruft.
> > Move SYSVIPC_COMPAT into init/Kconfig.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > ---
>
> Please use "arch:" or something for the commit subject.
>
> I want to see "kconfig:" for
> changes under scripts/kconfig/.
Okay

>
>
>
> --
> Best Regards
> Masahiro Yamada



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
