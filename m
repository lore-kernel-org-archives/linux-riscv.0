Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22776C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5PAiYcuYZM6vhufXcz8pQbrJNaI21wF/Uy/0u91MO0c=; b=WQm1JTKxRRWq9Z
	gmWEOjpsd7EykFPlSc/OfNuTscbG15R23ZnupG8hSEdPvZkjjRSjQ6vK/WEZH/64hMGZc8bzbHmzf
	s61GlNz8nnm9/fCzK+m+o3F5kCTsHS+c89NoJsdqG+c4B3e/fAZby8iChWLXo5jCIUxS7NQ0qndBR
	5ih5RPX/iQsdoeuoarhDzybHAHE93ogn8p45JhJRchOBZdnOnz6defuF/y0U7v8mshGElJYzmigga
	aNIvhTw6wHp1u7qH9Eal3kBlC7IdKrsLHz+UOKINWj4jv2zWjeWAjamoq1HmKYqv1OB4IjH3eSVQj
	DxbYxBT59woryI7rwRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSpB-00Djzg-MT; Mon, 17 Oct 2022 16:18:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSp9-00Djxq-23
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 16:18:44 +0000
Received: by mail-ed1-x52c.google.com with SMTP id a67so16746808edf.12
        for <linux-riscv@lists.infradead.org>; Mon, 17 Oct 2022 09:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EvKXXBfjBxozfV6WFzYGdtAGU5x1cXP77F9OEOiHjRA=;
        b=hF2zG+QODFU7vhHtcL27fRDayxvbsN8P6jQWLQnMg+jXt4yc3MymyuXu/gGux8kTI1
         0Zrhj4OCrvC5HA1Gaq4zgv3DgVeyC/S34yGYcYwTmo8ouI/Ail+VUQRwFI2mV2DZoZUv
         H31iS/2OgtsBzHK76ThDDMx8h/4R68ZyRWspWPIM2swVIa6g0ufgzXGJQW8v7T/y1bZj
         a6xjYRGYmtQndob/ZtBcIQHfjrZNScOcPt3bhi+HYh/OCqvt384HKOr1X8WSaCt5qwxv
         2W7+mnYglhCAcBlzDfqgTybNZa61lWisHM7zcf+PDYKhaa0Ga8bQAkwlgbcgMb8Wm8K+
         wc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EvKXXBfjBxozfV6WFzYGdtAGU5x1cXP77F9OEOiHjRA=;
        b=uKp5Nx+kF+tfjYbIl631TzFIUNGltFt6vUZgFAi/3ehBoS8XrnOlshocoQzxvY0yp7
         qq8eIN0HaAQxhD04dev2P250j46UfTVfzScXqlxr5xZrPeGGAzNJDKTRZ5cWsxo77WDm
         1AdTwacIQeEagUwNh8thr1xWSBWOpzRd6tyWaQUyrgMJrdGYJeSABebi+H8oAiu4zuqk
         Oj7dt+JaeCpFpQGCjlIfmy5H0K1oQDyYWM+dkL0LL+z2tTItPNKAm6RiElQrYGdH56GT
         k34RQPEqbbeycKUndzoXyqWgeK8LYJbwPohM3CyTQ0F/rbUzlOx8hZT5neaj9tlODM57
         Gkbw==
X-Gm-Message-State: ACrzQf1lZSWXyrzs2cLGIv3eWt8c+nTVaBxfF9Je7F6chmjxmxtTZc/9
	4saykq6q/5u2rlILuEXcIOtzwsH66lKTyQ==
X-Google-Smtp-Source: AMsMyM6ARby/6+Um7l8K2gj3ebnctRHo0Xc/NKdIW4tMZZYU4QtVwZMcJLLaa41J8jCUicQYTvhBHg==
X-Received: by 2002:a05:6402:42d0:b0:457:d16e:283d with SMTP id i16-20020a05640242d000b00457d16e283dmr11053428edc.395.1666023521673;
        Mon, 17 Oct 2022 09:18:41 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id et11-20020a056402378b00b0045c47b2a800sm7483488edb.67.2022.10.17.09.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 09:18:41 -0700 (PDT)
Date: Mon, 17 Oct 2022 18:18:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] (attempt to) Fix RISC-V toolchain extension support
 detection
Message-ID: <20221017161840.7o5tpsjox7klyvvs@kamzik>
References: <20221006173520.1785507-1-conor@kernel.org>
 <20221017155103.4dt5uzmnlbtibqcn@kamzik>
 <Y0185O1zjyfv7WjN@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y0185O1zjyfv7WjN@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_091843_135367_C24D55EB 
X-CRM114-Status: GOOD (  19.70  )
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

On Mon, Oct 17, 2022 at 05:03:48PM +0100, Conor Dooley wrote:
> On Mon, Oct 17, 2022 at 05:51:03PM +0200, Andrew Jones wrote:
> > On Thu, Oct 06, 2022 at 06:35:19PM +0100, Conor Dooley wrote:
> > 
> > However, we could also drop the compiler and linker checking if we
> > converted our use of cbo.* to the insn-def.h framework (I think Heiko once
> > mentioned looking at doing that, but I'm not sure.) I'm looking at adding
> > Zicboz support right now and for starters I've duplicated and modified
> > these checks. But, I think I'll look into defining the instruction type
> > needed for cbo.* and using insn-def instead.
> 
> What is the ETA of your zicboz support? Do you think these patches
> should be applied to v6.1 & backported before being replaced by insn-def
> when your zicboz support arrives? Or just wait for your zicboz series?

I hope to have something posted by the end of this week, so if all things
go well, it could land in 6.1. I think it's reasonable to merge your
patches anyway, though, as they fix the current code and we don't know
what rabbit holes I may fall in with my series yet.

Thanks,
drew

> 
> Trying to decide what status I should set for this in patchwork.
> 
> Thanks,
> Conor.
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
