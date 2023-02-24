Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEC7C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 15:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gsq0E8cLVioteC/xahecbxCXjaNcmBqR6wLaMVDWd4M=; b=NxGA5cRUBQZXou
	xQI/HE04qUak+C729zrP1aF9QIUyVljbNYMyJu5FtwejrMgHuCjZdncAqjnrnVZdNcWfhU7G8tF47
	ZrazXEKuAqjQ4D5n1fs5mFeDmUHSlJjGNoE0vflDndzH0GE4LuQ/p9u0Wo0EFWFPlJdcQq4NdQ9Fo
	19t+dZavWJBYS3kP+FyzV4+u01E+Jtt1N/NnaTpiXYd9C4MKk8ohKdWt7btnkhQitwEVuSfE75Q78
	7XqmJHYzfcTsel/aNxjjo69ibmKHhfRSQpnTq/TnYfCFoYzasENIKOUYulsOCEOHgAHbJfJ8nDDOF
	rgw45b8RL2xTbanA+/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZrW-002vga-ED; Fri, 24 Feb 2023 15:19:54 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVZrS-002veI-8i
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 15:19:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso1962658wmi.4
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 07:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fC6oYMwmtO5KYErOXzRpec74ti6/DTvM7ji07Q6hYeA=;
        b=Hi3u4uA+2sMpS8TGZr4OX75lp4qI6HKBgupJ9hE0sii9J7OsDmqe9F4wLyCw5422cP
         sstlDry7gjwklu/FJuuIYJnG+9116TY5TXA/7sa7gIBMctVtMEcKHdMdGHg3xfE2eWRA
         Hmvnf6cqNmSinh4pBuc+M5yp1F8qz0y46+tqqcUvezVn+AqylevpBlibvunq5vli+Y9r
         1LLkD4n2nVsOFZHREUo9h4jp3rhVJjou43KqF781CSLGCKO25gy4nRXm4LA/yTDkNGQD
         sYNxTP6bB7aviUdFeMPeE5nhP3MSJ+GGhG+RPQzYYlsSQQ9rqMKx/EQ9lGuTXDvWoaE5
         jMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fC6oYMwmtO5KYErOXzRpec74ti6/DTvM7ji07Q6hYeA=;
        b=BPxXjhmo8xky/ITXQBi8zEnc9zXlqmHJDUGonRGkcFQgObkdvuw5PppiaXyRPwF5fE
         kpArll+D2OYMeqbPAGoon2R8z2CALagR8EXpwmr1kvGWlO9TcXZkHvuu1J6/L5mzmuXT
         rT4e+53yLahM/IaJ2UrrDr9qU1odyp4MgykxPgy4v2bGTYErH09jteR3OzUV9/cqPXm9
         ejlnpTX6X51VH0xwQU/SGdZurnpn4XkpAdrXfXQuwTCPpZFKvpV1GvoTuM4uqgiOpI95
         fRW/wyqD9vlGjplwBeIp410oAo+Ydzyh4wtd0aFCZ1D8h8b1/tC+ErJFxXsQsAUAM7eC
         pW0Q==
X-Gm-Message-State: AO0yUKXug1uErFliu0yp9m0nAlUOQpwPKaoK1CgQCHswJXR/4IyTfaOW
	XgmGS709hClbvxJBIGo9zbRsaA==
X-Google-Smtp-Source: AK7set8DciOcIRo70kOWkW9pRoR4i+i31QW5OBpHAqgFl0RBQGJvDnkklwDCUVu7JdaorpN0NjxH/A==
X-Received: by 2002:a05:600c:1695:b0:3ea:bc08:8f0c with SMTP id k21-20020a05600c169500b003eabc088f0cmr4377825wmn.8.1677251986431;
        Fri, 24 Feb 2023 07:19:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bd12-20020a05600c1f0c00b003e0015c8618sm3241373wmb.6.2023.02.24.07.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:19:46 -0800 (PST)
Date: Fri, 24 Feb 2023 16:19:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Subject: Re: [PATCH] RISC-V: Fixup clear_page export when using Zicboz
Message-ID: <20230224151945.od3ye74pk5ye3paz@orel>
References: <20230221190916.572454-7-ajones@ventanamicro.com>
 <20230224135844.619054-1-ben.dooks@codethink.co.uk>
 <20230224141812.nftdkbtt4gbgvnts@orel>
 <d9944799-7887-8c0b-ace1-7b340dacf9af@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9944799-7887-8c0b-ace1-7b340dacf9af@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_071950_343887_FA78D318 
X-CRM114-Status: GOOD (  30.96  )
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

On Fri, Feb 24, 2023 at 02:42:11PM +0000, Ben Dooks wrote:
> On 24/02/2023 14:18, Andrew Jones wrote:
> > On Fri, Feb 24, 2023 at 01:58:44PM +0000, Ben Dooks wrote:
> > > When the clear_page() via Zicboz is enabled, the module build
> > > fails as clear_page() is not marked as a ksym entry. Fix this
> > > by changing the asm code to use <asm-generic/export.h> to add
> > > the correct export.
> > > 
> > > Also remove the weak clear_page() as there's nothing else in
> > > the build defining this symbol, so just make it the entry when
> > > the Zicboz is enabled.
> > > 
> > > Fixes modpost errors such as this:
> > > ERROR: modpost: "clear_page" [drivers/gpu/drm/ttm/ttm.ko] undefined!
> > > 
> > > Reported-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
> > > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > > ---
> > >   arch/riscv/lib/clear_page.S | 6 ++++--
> > >   1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
> > > index 7c7fa45b5ab5..4ed5fef52d80 100644
> > > --- a/arch/riscv/lib/clear_page.S
> > > +++ b/arch/riscv/lib/clear_page.S
> > > @@ -6,6 +6,7 @@
> > >   #include <linux/linkage.h>
> > >   #include <asm/asm.h>
> > >   #include <asm/alternative-macros.h>
> > > +#include <asm-generic/export.h>
> > >   #include <asm/hwcap.h>
> > >   #include <asm/insn-def.h>
> > >   #include <asm/page.h>
> > > @@ -17,7 +18,7 @@
> > >   /* void clear_page(void *page) */
> > >   ENTRY(__clear_page)
> > > -WEAK(clear_page)
> > > +SYM_FUNC_START(clear_page)
> > >   	li	a2, PAGE_SIZE
> > >   	/*
> > > @@ -70,4 +71,5 @@ WEAK(clear_page)
> > >   .Lno_zicboz:
> > >   	li	a1, 0
> > >   	tail	__memset
> > > -END(__clear_page)
> > > +SYM_FUNC_END(clear_page)
> > > +EXPORT_SYMBOL(clear_page)
> > > -- 
> > > 2.39.1
> > > 
> > 
> > Hi Ben,
> > 
> > This looks good to me. I agree that I shouldn't have made clear_page weak,
> > but not because there isn't currently anything else defining it, but
> > because it's not something a subsystem is likely to ever define. Exporting
> > for modules is also definitely needed.
> > 
> > Is there any reason I shouldn't just squash this into the patch which
> > introduces clear_page? That patch is still under review, and merging
> > it broken just to immediately fix it would break bisection for no reason.
> 
> Yeah, as long as you note fixes from myself an sudip, then go for it.

I'll mention it in the changelog, but there's not really a good way to
give credit for things like this. There's either nothing (except the
changelog) or a Co-developed-by tag. I don't think this warrants the
latter.

Of course, I'd be happy to pick up T-b's and/or R-b's from you and Sudip,
which would then be applied to the patch(es), if you submit them.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
