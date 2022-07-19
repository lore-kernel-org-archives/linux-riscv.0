Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D7DAC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 13:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXhwHxHawH0URAnNqtEo5MNLOHUTbKopZHU8TlOZel0=; b=b/xlzsYGlX9est
	K/K1Ky92rOiuIt2Xl+w2lGcykUi8vn9d9LND0z25WIl+62qe+fdZAt5BRVW/wtoKUmmqJqRor9uR4
	ulCZfG8Bw9h9PWor3bZSDJCceIZybgKu0AcErgwbsNY+epay3yj4q1fLvgNVs6COFFV8m9ayifsEn
	2Y5P3BVzYZ5w4SsX0nLZn6POfFYjDsvqoRm0pAVbhEW5RgVeYhgE8raAvkrcd3p1ijPTYY+DUEDN6
	Ee64wj9jGAPRwwWfZXP3nT4qMdX0lB0iaMnNqC68tY9yl7mC5lOTPDebAZHjj0EH8gj373uDjyHP+
	r90qujqwKZZrYtf+LDqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDn7c-0095ve-5J; Tue, 19 Jul 2022 13:18:44 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDn7Y-0095sW-Ul; Tue, 19 Jul 2022 13:18:42 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MgNxZ-1nasni2QU3-00hthB; Tue, 19 Jul 2022 15:18:37 +0200
Received: by mail-yb1-f171.google.com with SMTP id e69so26402925ybh.2;
        Tue, 19 Jul 2022 06:18:34 -0700 (PDT)
X-Gm-Message-State: AJIora8JgwERiUj68G8NwUaaj6aSCitiqDgexZmJ9YIO3DvIbNeppJOq
	NING8yvRXEC1FVE3PJPricKZbZooJhtgAuzOYog=
X-Google-Smtp-Source: AGRyM1sj2ZRWajYGSg8uf4g3MyEJ6xSd//jFiMZ2PQtMebEv5Hsb8H9cSwLXrU5Amq5R5Ua/8gA/pnz1fLkON0xIlXo=
X-Received: by 2002:a25:6706:0:b0:670:8d4d:7832 with SMTP id
 b6-20020a256706000000b006708d4d7832mr812105ybc.106.1658236713658; Tue, 19 Jul
 2022 06:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220717033453.2896843-1-shorne@gmail.com> <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org> <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
 <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
 <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
 <YtaNvpE7AA/4eV1I@antec> <CAK8P3a2UTND+F83k2uQ+f=o1GWV=oa5coshy8Hy+cKHUGuNzEg@mail.gmail.com>
 <YtaiSEAnMhVqR4HS@antec> <YtasKiPrkFlBXZvh@antec>
In-Reply-To: <YtasKiPrkFlBXZvh@antec>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 Jul 2022 15:18:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0wraTmA6aEF+XJ0RyZV=LSrZ2uPvQmvdw=Pe=nktyGjQ@mail.gmail.com>
Message-ID: <CAK8P3a0wraTmA6aEF+XJ0RyZV=LSrZ2uPvQmvdw=Pe=nktyGjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
To: Stafford Horne <shorne@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-csky@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>
X-Provags-ID: V03:K1:QnEsLhHFuN/k5dGjibT5aKorkPyAB/9tKLaXdBTY4hNo81MEs7k
 AiK8QAVse+8d6ltyP6RCnTHKpnAvNiR98a7pbW1ZsCBwhuv0u2aKiuWGKn+zKsbBu5NpIrb
 TVsWtuWNUAcudJuyuzNQ6G12F905jjD2YtXM6LT/4t0nZwsRNkm/WxGuV5NQD75jkmN1HHV
 MNq5BFrPq+ohuzn+Usw/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iEhXTT7Cu6Q=:QVOBih1HqzdgLQv3B07d/g
 2qv6H8wbOu9q/XvbhbxrAxdiGmS+tITNt8SsrMb1vmZXRTqlHJl9Nn55nO3PIJYCXTuPTDZPs
 ETQm8roqz4IBeMnaiGM3NkCEcy7Vwnnn5EjsXSKIDSSYHsR1MnLu9Ev5/EViO27glHeVfk607
 lrfj8MiaX0g/fEGVyjBXlLL2Rgb421d+19eWK6fTipSutj52cczViKjoHLR1g44S0ZSrVVak/
 WPZIh1wwg/0qWgWxtKvtcKDlm8ww4E/8cIkcnwfQ0dturpAZSOpwaRAVqQKY0+li2DOlh2XFi
 spg9AYhijD+8x8oaJ4yiEwExBV4V8h3+2oXjNrnuEjY0OvCOkGTjIB1oM6VaSYY0zVNu1SXQ8
 1XmTrK6zLC5i1tu0oCfEJQ6cC9czOjgnuRnbpst1zM8s4Syl3v6vwM8Wde0n+RCfovt6sy8sx
 DYbjcz4Don+iUPtQY9Vw4mvbIkXvRUsZc1p5CakC/VK3RbeqcyPR/7NrwFSwJdYqXNg1EkxcY
 h9wn6j2Vu1/hNN/7F+vR/4lK9sCp4zF0xCKg9g1lSoAZqTnXZ70QAvazq3p32WLT0ef21Bqnb
 CS9aCkjGXWdu5YS0kfgguamfIhtBhvnQjtydZ2hpKyGrW3yx8km0sAf1SCwBQW6vll+AVnT27
 wj6CXTN8Zz6Oo+NturRxZwtgL7N8TDLxLBQom8Z+Xpp2YYMIR0zKdlxoLghjpC3StPkRs0S3I
 pofMxVvi8TDK8N9GslmE/3797k1FCtlvOImRmg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_061841_305457_973CFB1A 
X-CRM114-Status: GOOD (  16.83  )
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

On Tue, Jul 19, 2022 at 3:05 PM Stafford Horne <shorne@gmail.com> wrote:
> On Tue, Jul 19, 2022 at 09:23:36PM +0900, Stafford Horne wrote:
> > On Tue, Jul 19, 2022 at 01:55:03PM +0200, Arnd Bergmann wrote:

>
> And this is the result, I will get this into the series and create a v4 tomorrow
> if no issues.

Looks good to me, just one detail:

> diff --git a/include/linux/isa-dma.h b/include/linux/isa-dma.h
> new file mode 100644
> index 000000000000..9514f0949fa1
> --- /dev/null
> +++ b/include/linux/isa-dma.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __LINUX_ISA_DMA_H
> +#define __LINUX_ISA_DMA_H
> +
> +#if defined(CONFIG_PCI) && defined(CONFIG_X86_32)
> +extern int isa_dma_bridge_buggy;
> +#else
> +#define isa_dma_bridge_buggy   (0)
> +#endif
> +
> +#endif /* __LINUX_ISA_DMA_H */

I would make this file #include <asm/dma.h> as a step towards making
linux/isa-dma.h the official replacement for it in the driver api.

Including asm/dma.h from a driver is already a bit awkward, since we
are generally moving towards including only linux/*.h type headers, and
the dma.h name is too generic for something that is completely obsolete.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
