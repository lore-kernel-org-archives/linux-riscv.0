Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C274EC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnJICH4Oa1IO6Oo7gke2KMTCzx/YFFMxz0vCwG+cYYY=; b=VPsOSm7YWW31Ka
	pfKQOjL0+XsTQD6N6xyuOMV2UdK2tN3ggEYovrXLMRNicImtQZUTIYlY/0ELcMde2jaY4b3scGBO1
	xCkeq3QN+Xfc3nzipbYeVr72eJLq01zPymbeUZT/Grz8EamBxHpHQPnuVZH/sdxTMl3/zHqRbaDe/
	ndFPlR08FFrjUyleHJcyeBSJLlUdmg9kw46S6frADCObXoYKEqPzMICgn8y64EwTMkXtQBfJGYu0h
	af4wa2QSh5Ota+kqY24CcQ4dUvFBK9zxfb/p5Z3N4x9pW+GZeuqgsrE1Q0A2TkB03fu/s+dCOYkqQ
	nkXbJFU/ZzYDxAN7NWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDmGU-008eRt-Aq; Tue, 19 Jul 2022 12:23:50 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDmGJ-008eN1-Hg; Tue, 19 Jul 2022 12:23:40 +0000
Received: by mail-pj1-x1031.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so15578147pjf.2;
        Tue, 19 Jul 2022 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kIYV5VQPGWT9n+zj1ToFYouxX7n+Y2qnPZPLUj/fcdA=;
        b=NKy5nlv/FgYWq5UB602U/dYy8pXGBSA/jwkZtdtOKtDZ4vPJ/6EEjuzkkAzArMrwN3
         FuQlR0H4BF/mtLJNlyQaig3CLYvbQeeAqr2FGyTUh7s77maURmahcOE/pizZU1PMAPrA
         DA4prFvpVk+1ECNLWdiC8Ge3GseJM+xz8nqjXk4bk4wvfAlQQoVSmGSGdGVIbN4JBQfY
         Odz7jQVRqsxY9dfuWtS6ADjjOJb/iZq6d7B4oaw9B/tgdW55wluuTmosyHe/YrSBWxes
         hK5Dj19eLFoffro358zde7A0JTdg2Tk5Zg7ncOqlrsMEbldY48cHS5bO06Rd1EUyEx+5
         Ldhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kIYV5VQPGWT9n+zj1ToFYouxX7n+Y2qnPZPLUj/fcdA=;
        b=HEGLmXZgzJMi2NxU4dIrbzxODxXJx1qQa1kGiHw7+5Nr2g6bsl9wQLKusNPBnfXoS9
         ZIitx+iN06v1RNN2/VtlQPk0w3QcNmtn8YKfla0SRI0wS05R/LpsIZuaIihoKhhPj9w9
         CFOqKreHw7V9JbHNIz9XiE2bNXLVKpXCM/IN8MpqqecGpNdB25JY5ffTOxWkCZ4Lv/nI
         5RDbYGbQamnacW0wBG/+kGHgOAfiicJx0cCIyepmwitmcTBsPbElwwDB4TObKkkzSjcA
         9SfF5tVcbuDOUBtmOin2AU974QyXrAWNcI094qEWZP/7jegdRBU9JJyUE2jJxLWObMOr
         QH+w==
X-Gm-Message-State: AJIora+hxszlV7absD9SFbiwJEp6M8mEI9qQ1SWqT+Hep9fCnZ+0gZ1F
	yyfwQqdOfLB0PLbo4vQ4u9LfPsT6/1qrrw==
X-Google-Smtp-Source: AGRyM1tV/ZXqUclGzygmdbB9fkVeLqpHz5v6xGriFND4vNwQKgaV2SfSn2yac7l86GveLLylCjLTdw==
X-Received: by 2002:a17:903:18c:b0:16c:51c6:675d with SMTP id z12-20020a170903018c00b0016c51c6675dmr32808811plg.153.1658233418097;
        Tue, 19 Jul 2022 05:23:38 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id cp16-20020a170902e79000b0016397da033csm11416832plb.62.2022.07.19.05.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 05:23:37 -0700 (PDT)
Date: Tue, 19 Jul 2022 21:23:36 +0900
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
Message-ID: <YtaiSEAnMhVqR4HS@antec>
References: <20220717033453.2896843-1-shorne@gmail.com>
 <20220717033453.2896843-3-shorne@gmail.com>
 <YtTjeEnKr8f8z4JS@infradead.org>
 <CAK8P3a1KJe4K5g1z-Faoxc9NhXqjCUWxnvk2HPxsj2wzG_iDbg@mail.gmail.com>
 <CAAfxs740yz1vJmtFHOPTXT6fqi0+37SR_OhoGsONe4mx_21+_g@mail.gmail.com>
 <CAK8P3a1Mo9+-t21rkP8SDnPrmbj3-uuVPtmHbeUerAevxN3TNw@mail.gmail.com>
 <YtaNvpE7AA/4eV1I@antec>
 <CAK8P3a2UTND+F83k2uQ+f=o1GWV=oa5coshy8Hy+cKHUGuNzEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2UTND+F83k2uQ+f=o1GWV=oa5coshy8Hy+cKHUGuNzEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_052339_618151_40A9B171 
X-CRM114-Status: GOOD (  18.16  )
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

On Tue, Jul 19, 2022 at 01:55:03PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 19, 2022 at 12:55 PM Stafford Horne <shorne@gmail.com> wrote:
> 
> > diff --git a/drivers/comedi/drivers/comedi_isadma.c b/drivers/comedi/drivers/comedi_isadma.c
> > index 700982464c53..508421809128 100644
> > --- a/drivers/comedi/drivers/comedi_isadma.c
> > +++ b/drivers/comedi/drivers/comedi_isadma.c
> > @@ -104,8 +104,10 @@ unsigned int comedi_isadma_poll(struct comedi_isadma *dma)
> >
> >         flags = claim_dma_lock();
> >         clear_dma_ff(desc->chan);
> > +#ifdef CONFIG_X86_32
> >         if (!isa_dma_bridge_buggy)
> >                 disable_dma(desc->chan);
> > +#endif
> 
> There is a logic mistake here: if we are on something other than x86-32,
> this always needs to call the disable_dma()/enable_dma().

Oops, thats right.  Sorry, I should have noticed that.

> Not sure how to best express this in a readable way, something like this
> would work:

Option 1:

> #ifdef CONFIG_X86_32
>         if (!isa_dma_bridge_buggy)
> #endif
>                disable_dma(desc->chan);
> 
> 
> or possibly at the start of this file, a

Option 2:

> #ifndef CONFIG_X86_32
> #define isa_dma_bridge_buggy 0
> #endif

Option 3:

> Or we could try to keep the generic definition in a global header
> like linux/isa-dma.h.

Perhaps option 3 makes the whole patch the most clean.

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
