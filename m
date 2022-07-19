Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D09C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRZeLUFISf//qVdh24kTeJP9LE+Ai3YIhp6qB/AKVIA=; b=HYOfXd+wtDrQXy
	X/R8o6C/ET6yq1HryJchkbdyi/bQkdGIODWnkz1Om6rFYWeCa00UiCqFJGNQ50MwGWB05eFaO9YcJ
	djPl6Io3Eew+ngKDmefUSsCzHelrTKNa+Ej7p54uEWc38PtxCwuDVh00yKXJm3EOa4vX8BWbKNXiY
	tvsH7Y1sFKqf+MyFihdShDeLmTBSmwRIftBJPqfTU0kqRbLtbz1YDpZUTXbuuB/qqDwJOFrpfjZRc
	3z+fCW2S9lraFO5gH07mvTYOuYow1K12qqx0f2hTGvhyLemv2kIVjxlhGifJjKoQPmJcuGrNXXMgo
	0ex7pnQL64srVuEzfq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnMX-009Evp-Ig; Tue, 19 Jul 2022 13:34:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnML-009Enp-Sc; Tue, 19 Jul 2022 13:33:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id j12so11974656plj.8;
        Tue, 19 Jul 2022 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gq2qxu4tTCNdzYLjjggHvDXAaB2s/OnX5S80d1QYkSQ=;
        b=Lk4L/aYkRyKZZ37rXnThkj/S+iHNwOUqTGA928Y2CtUFrSgRa7PdcsYAX/OO3pnG4l
         cRtBcxAtV5plRTM1azRyTzwd4kYIgWPO1dqCRV0isud69pVYsJvKYQRoXUrGoWHKsTDd
         zFRbtrT8Ebr7W9JBOwQb2yMhCOm0mBRH/jWitZwYyZHjNFET8+Mc2qHma6W0QtY42cBr
         VyZHPeH2u3B+jcKuSAU6wIGOvUWLg/qKkh2BOnrCLn6zm5Vg2EqJTfCEzmanGiuDMcv2
         r9uvWSFzeVS9c9OXzw+UcWN2nDriDcbQOif4OSIr7hCW21K7CHbM+464cSW/XjrwSOi8
         FIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gq2qxu4tTCNdzYLjjggHvDXAaB2s/OnX5S80d1QYkSQ=;
        b=22sebfaUXsfM/Ko0f/tODvmuRG0inaFGlcz6mfWC+zHRz1qwUD/ZWSYk/7ruwxffeq
         qVBgyZ/s0EhI+ieXyUIcdjFQLjzYFhnZ7b0AwET6AjHpe9qwd1lCzVlcWwSdbWUsjk+W
         2eRSoRWCIzcKfAK19i0bI3euMSIMXzSTLznqYHsPQBl839xkXovz/8tVM4JfvHxow1WU
         LtnSY/iWiVHjD4ASmRLB101rxl67uZnUVGLwDKrjs9RHD+z2SRAxwlHTP5bwgsM84uha
         8NJHgUrbPOs22hJYlrJAv3fFIEaggTCZzys6jqUwlC2OSIFg3ppKF6M9wX5AgU3jE7Yk
         sE/A==
X-Gm-Message-State: AJIora+CBl/2JIWVf8x6qmla2Db9IVH4rTKOd/PPK9F4W+gMow8NqE6l
	F/iqU1ksW1+7K31UjGo4Nhs=
X-Google-Smtp-Source: AGRyM1ufAcy9+0qGF+PMepx23ZSZ4uoBR0c029afe7Mu0be8OvKFq0+uoKSlPzwuI0s85UsLCN8U9g==
X-Received: by 2002:a17:90a:bc8c:b0:1ef:91ca:1c24 with SMTP id x12-20020a17090abc8c00b001ef91ca1c24mr44620254pjr.81.1658237634812;
        Tue, 19 Jul 2022 06:33:54 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902cf0b00b0016c06a10861sm11551154plg.74.2022.07.19.06.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 06:33:54 -0700 (PDT)
Date: Tue, 19 Jul 2022 22:33:52 +0900
From: Stafford Horne <shorne@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-csky@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
Message-ID: <YtaywBinmYuMUOoI@antec>
References: <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org>
 <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
 <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
 <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
 <YtaNvpE7AA/4eV1I@antec>
 <CAK8P3a2UTND+F83k2uQ+f=o1GWV=oa5coshy8Hy+cKHUGuNzEg@mail.gmail.com>
 <YtaiSEAnMhVqR4HS@antec>
 <YtasKiPrkFlBXZvh@antec>
 <CAK8P3a0wraTmA6aEF+XJ0RyZV=LSrZ2uPvQmvdw=Pe=nktyGjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0wraTmA6aEF+XJ0RyZV=LSrZ2uPvQmvdw=Pe=nktyGjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_063357_955914_EB751789 
X-CRM114-Status: GOOD (  21.39  )
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

On Tue, Jul 19, 2022 at 03:18:17PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 19, 2022 at 3:05 PM Stafford Horne <shorne@gmail.com> wrote:
> > On Tue, Jul 19, 2022 at 09:23:36PM +0900, Stafford Horne wrote:
> > > On Tue, Jul 19, 2022 at 01:55:03PM +0200, Arnd Bergmann wrote:
> 
> >
> > And this is the result, I will get this into the series and create a v4 tomorrow
> > if no issues.
> 
> Looks good to me, just one detail:
> 
> > diff --git a/include/linux/isa-dma.h b/include/linux/isa-dma.h
> > new file mode 100644
> > index 000000000000..9514f0949fa1
> > --- /dev/null
> > +++ b/include/linux/isa-dma.h
> > @@ -0,0 +1,12 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef __LINUX_ISA_DMA_H
> > +#define __LINUX_ISA_DMA_H
> > +
> > +#if defined(CONFIG_PCI) && defined(CONFIG_X86_32)
> > +extern int isa_dma_bridge_buggy;
> > +#else
> > +#define isa_dma_bridge_buggy   (0)
> > +#endif
> > +
> > +#endif /* __LINUX_ISA_DMA_H */
> 
> I would make this file #include <asm/dma.h> as a step towards making
> linux/isa-dma.h the official replacement for it in the driver api.
> 
> Including asm/dma.h from a driver is already a bit awkward, since we
> are generally moving towards including only linux/*.h type headers, and
> the dma.h name is too generic for something that is completely obsolete.

OK, that makes sense.  Then I can remove the asm/dma.h include from:
 - drivers/comedi/drivers/comedi_isadma.c
 - sound/core/isadma.c

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
