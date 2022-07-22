Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D4EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 19:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVQ+qhufrMY5azbCOe2/wb13tFQhw+mZX+/hny3LLSQ=; b=zAHySuqgC3W/5a
	cJq0OrJSJQdYCHKDyT6G0fjLGvPrY92wo90jsMPNrst5/tn3y3a3eHt3cCGwS25ndKiYXZFXv9bbL
	SC3kVTfY/WqFwYB+HQZwfyxCHlfCchfju+S3i16TNwe6XEfAugghBzMJoEwqUiDi5H0WvzdqaIKUh
	rJ0tLnbdoT3XxgGuzKUaBOOkLJa09ss4ig+nXv8NsHfquwdH3y2qn8QvdfwoAmNTLdvVs1Lpwv05k
	UtEiA/RjvU/xM7dtUKPiEUNZmBdNE2VIZQU13THamVXhMudzTRqQoH+P+9BsdVddF3mr5LBWVTB0b
	94XT802WqSJbtolpQYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEykF-009c1W-0a; Fri, 22 Jul 2022 19:55:31 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEykC-009bwI-LA; Fri, 22 Jul 2022 19:55:30 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MC3H1-1oMS3A0Ydp-00CVYZ; Fri, 22 Jul 2022 21:55:21 +0200
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-31e1ecea074so58240567b3.8;
        Fri, 22 Jul 2022 12:55:20 -0700 (PDT)
X-Gm-Message-State: AJIora+NevP+S54YIRiNLImRwtw2m0iZoON+ckg438uhadiIdgKGQkNd
	AA336HNX/L8tnzKBwB2Y3jj6YjFOHPKnvVUyXxM=
X-Google-Smtp-Source: AGRyM1uXuwQnOqTAc2eAgULJ3gnB6/3HxjqG6YsVYm4rwIeb3o/ICJSu11fKuAtGWX5g0pRwxfQ7v0EfBH0rTQPFdhs=
X-Received: by 2002:a0d:cec1:0:b0:31e:590c:c6e4 with SMTP id
 q184-20020a0dcec1000000b0031e590cc6e4mr1302476ywd.42.1658519719648; Fri, 22
 Jul 2022 12:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_Jsq+_5-fhXddhxG2mr-4HD_brcKZExkZqvME1yEpa6dOGGg@mail.gmail.com>
 <mhng-7e3146ca-79b8-4e16-98a9-e354fb6d03ba@palmer-mbp2014> <CAL_JsqJHZEcnJi+UHQbYWVoy1okQjHSc9T377P1q8oOJnHBWFw@mail.gmail.com>
In-Reply-To: <CAL_JsqJHZEcnJi+UHQbYWVoy1okQjHSc9T377P1q8oOJnHBWFw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Jul 2022 21:55:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2aTS74TG8F+cVHX969hMQHKP3Ai5V0h-m+GeAq6kq5pQ@mail.gmail.com>
Message-ID: <CAK8P3a2aTS74TG8F+cVHX969hMQHKP3Ai5V0h-m+GeAq6kq5pQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
To: Rob Herring <robh@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Stafford Horne <shorne@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-um <linux-um@lists.infradead.org>, 
	PCI <linux-pci@vger.kernel.org>, 
	"open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:6CqFIc+bMc9siF2i41yJ5BF0RXy0ZHr1uEIqRfFHJp8m3yK34Uz
 fE3Kz1kW4YnxxtFocsq9FTAVQKS9SxBcoN+nyey+4ZtnU1R7ZE7rsVRpirT4Br4mAIz5eK9
 DqusGwUsBF+SkbUP2O5e7+9M4MBCvGwjeXQ1oW3KLOpxGrgWOPZ1U2qi2nC+n4TdUUZLSZt
 ugJhxZvcneMiYc7M50LUQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dqMGzWar9qE=:zk5zJlJldfqtFwwGWBfmip
 EbUy1VW7zQ0UazAUeimfzS+Q7A4zFjKI/iJGk65+VSEXkW2DUSP21j8N202poG+4QbVYdYpZn
 EDUH5szBxSEOP9zemKlMo4c9pW7pErES9NW8ocYRz/QhWTv7uFVlP8ZchPOzXH/DsIm4OaiCK
 9QAYQo8VovBUO4JzOTEkNe14/BW62JyGr42Oe8X+DeRpKlO/cYtDx1Dpdy3p4hYoV7LEO/FzL
 m7ykavjxspRjD+/AihmC04EgB0cbwNuXY9ds52LBlQ/n9P7Lbp24yzv/GnNnjznIONZ7m0RNI
 cKNBfFrshka36XA28zbpZwW1+Xpj3a7cv/6PkGGXTl6LYAiMyHxqL1MJF0ZhziaCt0FfGetDJ
 B6UWY0EVy9bsy6izJ4C6oGAwT1qsBsH5WSPh8YtDnsFgmxangXHk/Y1lDi4TIhW5taJGRgNqG
 LDFTOlXJTIYpCSHG5XZXhIOBLzMjqSX0D4lRTwcznrAfreOdWqDbmRG2MlTvA76env5do6xSY
 PeJmGjclwcTcIdJs8EZskWuFpyJDf9uRmBJ/UwEwSudRnUvU8a+BcBR9nKX+SIyBzjUQdvkwG
 99fWXCR/iF9fbAEOd8qMDWJ0hzUxG8LqPB7aoTrPU+Rd2essFKWV1xC1ilAHQe0LcHC7K6XH9
 ZRVE8UidzZr2aSta1kPSRJlUiHHfh4H2Kv5aXUE6hANb4+g8/ezEFr97F94/bir4D/PlZzBYx
 mDW2jb3op/sjlIC87B/X8gMShcG05oKJOTXnKFTT1l5n6whoSp7dubZetUpgyyZDW+L/K8RM9
 wQ6ffJ79tU2P0cZzH3L08cqo33Tec454SIGx5ujDXZ/y4GAt0NVprb3Fg9chU9LiAursK4YPp
 jx6+piG4dh+HijNWDPCg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_125529_012709_53078648 
X-CRM114-Status: GOOD (  14.32  )
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

On Fri, Jul 22, 2022 at 6:36 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, Jul 22, 2022 at 9:27 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> From fu740:
>                        ranges = <0x81000000  0x0 0x60080000  0x0
> 0x60080000 0x0 0x10000>,      /* I/O */
...
> So again, how does one get a 0 address handed out when that's not even
> a valid region according to DT? Is there some legacy stuff that
> ignores the bridge windows?

The PCI-side port number 0x60080000 gets turned into Linux I/O resource 0,
which I think is what __pci_assign_resource operates on.

The other question is why the platform would want to configure the
PCI bus to have a PCI I/O space window of size 0x10000 at the address
it's mapped into, rather than putting it at address zero. Is this a hardware
bug, a bootloader bug, or just badly set up in the DT?

Putting the PCI address of the I/O space window at port 0 is usually
better because it works with PCI devices and drivers that assume that
port numbers are below 0xfffff, and makes the PCI port number match
the Linux port number.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
