Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5847DC6787B
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 18:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nP08bIcuRmEg+PekRpAxCKTCJIizo07BIa/NAqhFP0E=; b=o9vXPknxXMwxWn
	H/dIywSGYrjoZDSmCSI1OVDTElT5da9Ag4CWckP/RC40bFzT9RgEJJHg0k2rFTha8skG5zjdGeYJN
	aIz1YrwnFv6KSedngs37p7BrOsNef2FrZOyRYRZ8eqF6ncV507TawhHZkLbNfVEmBHGMvy9K31G3Z
	Kg06xP2kQAg64bRxvXLHea75z3AJbd42gGs3Q+hkoTbb+fB+gNwgO1DVu/8MECFhzb3IKRAAZ0/wW
	x1Q76rYpYmUFr9+Qgy+F3caT7wXcPIZ6lsZ74yeXC2ZgSx5HQAkuoEu8hmVN7vebSwDn1CvAvzp/L
	dLuGfWqG+9xM/JfGLBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbSv-005rWL-1O;
	Fri, 25 Aug 2023 18:23:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbSt-005rUq-0l
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 18:23:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bc63ef9959so10165055ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692987798; x=1693592598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ9zjJeALE62O4cw5IYTaJTtY+w53cmCJ0tqcg+cbfo=;
        b=HnyXQbm8I0wncS7q6bqpL+84nVc+SRO3gOlr6HSanLhtlUGqe3qLtjl9NoeWnceonY
         Wszkh9DExW9bToZKm+r3bfPJgD20l6FVa29cqrrXaEROEvs3vo6ecpcyMCQpnRom2zMm
         0cq8MEdGxeVtq9mis1PNV+itkvcfNqdyC6/XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987798; x=1693592598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ9zjJeALE62O4cw5IYTaJTtY+w53cmCJ0tqcg+cbfo=;
        b=k3/fat5KW8QApazgfJGL4p6LtoPwjdLhbUPjzTSNd6jSHKG/uA6YRurROTysiSsoBP
         3u/WX42yi+gLwqHc4Ea/RfqxQfEzWUHnlUwCvAcRVRpKNPYzYXKsGMSJn0ivVrWD9KR1
         DLBBpGYKgh6XXG6/fPsy7HQ4hMeTE6AtHLOSbNyOchlzOjeWOaD6dkThzTo+0T1mSOd6
         EZPXpNBXDxXAI3O6qiPJn7l32a/sG09uMevydWk2VSDyqCu2gYFTIFezPs5RqkvKuugn
         58Ns0r2tsqe5DNF4y1N+zFb3Y5baHy1qD89kBDyuxurjlyWtH0gNdU54xXXohytU+KlS
         E2GA==
X-Gm-Message-State: AOJu0YwtgZQCP+OvKcaw/8OdY7c/3PoPv3dYtdUZADifndXEWha2fQ08
	JHSmDh+SMegYnzz/KI5aw+pYnA==
X-Google-Smtp-Source: AGHT+IF5mGfC+hpo4uDUVvE34Zd1neo+8AiXRx90NzQv5YAzJzW8HNQDHc63LgGceQ+tSuoW87RpyA==
X-Received: by 2002:a17:903:24f:b0:1bf:4833:9c25 with SMTP id j15-20020a170903024f00b001bf48339c25mr22325045plh.36.1692987798689;
        Fri, 25 Aug 2023 11:23:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d10-20020a170902654a00b001bc930d4517sm2078150pln.42.2023.08.25.11.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:23:18 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:23:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Nicolas Schier <n.schier@avm.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251121.23BAF46E@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <ZOg/pqoqhp/3rerZ@buildd.core.avm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOg/pqoqhp/3rerZ@buildd.core.avm.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_112323_274091_7DEDDFB6 
X-CRM114-Status: GOOD (  24.01  )
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

On Fri, Aug 25, 2023 at 07:44:06AM +0200, Nicolas Schier wrote:
> On Thu, Aug 24, 2023 at 03:36:10PM -0700, Kees Cook wrote:
> > Doing a "make help" would show only hard-coded Kconfig targets and
> > depended on the archhelp target to include ".config" targets. There was
> > nothing showing global kernel/configs/ targets. Solve this by walking
> > the wildcard list and include them in the output, using the first comment
> > line as the help text.
> > [...]
> 
> Thanks for that patch!  Several times I found myself searching the tree
> to find a specific kconfig fragment; I think you found a nice solution.
> Two minor things below.
> 
> [...]
> > diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
> > index 2f0e6bf6db2c..ac4d254abc3f 100644
> > --- a/kernel/configs/tiny-base.config
> > +++ b/kernel/configs/tiny-base.config
> > @@ -1 +1,2 @@
> > +# Minimal options for tiny systems
> >  CONFIG_EMBEDDED=y
> 
> (just a note: Randy prepared a patch for removing CONFIG_EMBEDDED:
> https://lore.kernel.org/linux-kbuild/20230816055010.31534-1-rdunlap@infradead.org/)

Ah yeah, I'll rebase this after the merge window, I guess...

> > diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> > index 00009f7d0835..ea643e8f7f14 100644
> > --- a/kernel/configs/tiny.config
> > +++ b/kernel/configs/tiny.config
> > @@ -1,3 +1,5 @@
> > +# Smallest possible kernel image
> 
> For this fragment alone (not within 'tinyconfig'), "Size-optimize kernel
> image" possibly fits better?

Sounds good to me!

> > diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> > index af1c96198f49..c523f24b504a 100644
> > --- a/scripts/kconfig/Makefile
> > +++ b/scripts/kconfig/Makefile
> > @@ -93,11 +93,11 @@ endif
> >  %_defconfig: $(obj)/conf
> >  	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
> >  
> > -configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
> > +configfiles=$(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARCH)/configs/$(1))
> >  
> >  %.config: $(obj)/conf
> > -	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
> > -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
> > +	$(if $(call configfiles,$@),, $(error No configuration exists for this target on this architecture))
> > +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(call configfiles,$@)
> >  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> >  
> >  PHONY += tinyconfig
> > @@ -115,6 +115,7 @@ clean-files += tests/.cache
> >  
> >  # Help text used by make help
> >  help:
> > +	@echo  'Configuration targets:'
> >  	@echo  '  config	  - Update current config utilising a line-oriented program'
> >  	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
> >  	@echo  '  menuconfig	  - Update current config utilising a menu based program'
> > @@ -141,6 +142,12 @@ help:
> >  	@echo  '                    default value without prompting'
> >  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
> >  	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
> > +	@echo  ''
> > +	@echo  'Configuration fragment targets (for enabling various Kconfig items):'
> > +	@$(foreach c, $(call configfiles,*.config), \
> > +		printf "  %-20s - %s\\n" \
> > +			$(shell basename $(c)) \
> > +			"$(subst # ,,$(shell grep -m1 '^# ' $(c)))";)
> 
> Better use '$(notdir $(c))` instead of forking a shell with
> '$(shell basename $(c))'.

Ah! Thank you. I *knew* there was a function for this but couldn't find
it for some reason. :)

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
