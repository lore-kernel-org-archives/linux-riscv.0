Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8798C48BD1
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 11:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C0E561364
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 11:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C0E561364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwWbeogbL0GjhQONe0djZzeWRs0vLj9oGGvPcz3KpTw=; b=HA3ZCjozPMnROK
	hvWwb0ncWFmSKMki63gtshJsquh/RWhWgM+L4Ei/xYY1O9oxZCJWiMusmvm6ZpwJUE+3XK+w531f4
	GjndPiYQzeOZwn4TVS8OUsWMaANrMhKO7MTv0oIHB5ynZpVapdWn5R0wV7wXFpXr4ECUob4P4lfxw
	X0PGiwuScv3BsfWxXsyH30Cz4wMLQ55kdCmXWc99Wx5dzbJPm2guZYczhf/y+pmGFLOFx7jCuc0fY
	WfKjpH/nDRlng6EM92eVKyL8/8nSpfAoKwpO1O12rZjGmuexRxSKEuiK6Nw6HGjMvaB5xDkvORdM9
	6+s38+mG47G5dM+Pe5iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrf0X-004ugN-3T; Fri, 11 Jun 2021 11:07:25 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lreth-004s3e-NJ
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 11:00:23 +0000
Received: by mail-oi1-x230.google.com with SMTP id u11so5425042oiv.1
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QJ/vQZOVwDNIecKs4rsjKD7AQHx1NJ2yzEFPPDK+J9o=;
 b=Buh9x/rvJlBSIbMQ0zE7v3bcZij4O3E9JJdkW3tqQmI5JqNTnMAZcWJvs7vmuWVTFn
 Htbr/HY/hYikk5hZJNolCU4Qo1cOtl8NYOqaWaNdci28W5oTEVyYTT3IHJO8Q5v1MC7f
 YXrRO50UGWmBsOjmZ1mm1u0fM/24aJmJ1WPFHa2KFRP47wyonLYRi7m5H9flGM04AMr1
 mivLE9NqWgK9BYwn8Uu3ae5a7yaryLvMO4iXofDygDgIQJEvvTkKETWjbLvWcXwSaxgt
 jm6VxYYvkYEci2mhTsVcvpa1sbobwZjXcxqRH6xMY9x+oRjHYLBWmgVaPyZzXjZq+SF7
 BBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=QJ/vQZOVwDNIecKs4rsjKD7AQHx1NJ2yzEFPPDK+J9o=;
 b=g1dug/9qYpT53oPfITrSb/XyDGZsw41IThitSyiUghJjLI3qn/Zfayo4PkmIMQ0n2U
 YQTUj2ZeDZDTjlrdTDTedcG74AZS0cnYi4AHPqI6yLSXd28mFZDK3XyTL2troAZqMLA9
 DRnVXms6c4hRiWJJmGZE+zYZw7MszZLg163sDqN3h/kHptHefB3lKuYzD5FUaOxaE/IP
 s2dd7i+eZLnU5iXN6RpbkhG9bW5yEn4qOausr2bM/AfnsAa5p/Te02HpbsEr+GDMLAnJ
 IjJZxL1AVF4TGlIBvYugyLTYSPNbJp3mHCX3/vfdx3akH92qP2EMMD7ii+4C+OIJjYSp
 VdLQ==
X-Gm-Message-State: AOAM532FuTtMrEI+E57bqE2CPz7nrY/1ZOBoYySBTcr7STS8sd97uGvd
 04YeZuIFJhkd+B7FFbXy2Y4=
X-Google-Smtp-Source: ABdhPJy1JDA7tpiIOi/hC6erHzFJVX3BV15RGKQ1aLuwDtD3eWsiOz/a3NhK02aokWP5to0aGTLXJg==
X-Received: by 2002:aca:c441:: with SMTP id u62mr12904876oif.31.1623409220901; 
 Fri, 11 Jun 2021 04:00:20 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q1sm1101652oog.46.2021.06.11.04.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 04:00:20 -0700 (PDT)
Date: Fri, 11 Jun 2021 04:00:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Alex Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 aryabinin@virtuozzo.com, glider@google.com, dvyukov@google.com,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear
 mapping
Message-ID: <20210611110019.GA579376@roeck-us.net>
References: <mhng-90fff6bd-5a70-4927-98c1-a515a7448e71@palmerdabbelt-glaptop>
 <76353fc0-f734-db47-0d0c-f0f379763aa0@ghiti.fr>
 <a58c4616-572f-4a0b-2ce9-fd00735843be@ghiti.fr>
 <7b647da1-b3aa-287f-7ca8-3b44c5661cb8@ghiti.fr>
 <87fsxphdx0.fsf@igel.home> <20210610171025.GA3861769@roeck-us.net>
 <87bl8dhcfp.fsf@igel.home> <20210610172035.GA3862815@roeck-us.net>
 <877dj1hbmc.fsf@igel.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877dj1hbmc.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_040021_803334_E3C79545 
X-CRM114-Status: GOOD (  16.88  )
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

On Thu, Jun 10, 2021 at 07:29:15PM +0200, Andreas Schwab wrote:
> On Jun 10 2021, Guenter Roeck wrote:
> 
> > On Thu, Jun 10, 2021 at 07:11:38PM +0200, Andreas Schwab wrote:
> >> On Jun 10 2021, Guenter Roeck wrote:
> >> 
> >> > On Thu, Jun 10, 2021 at 06:39:39PM +0200, Andreas Schwab wrote:
> >> >> On Apr 18 2021, Alex Ghiti wrote:
> >> >> 
> >> >> > To sum up, there are 3 patches that fix this series:
> >> >> >
> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210415110426.2238-1-alex@ghiti.fr/
> >> >> >
> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210417172159.32085-1-alex@ghiti.fr/
> >> >> >
> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210418112856.15078-1-alex@ghiti.fr/
> >> >> 
> >> >> Has this been fixed yet?  Booting is still broken here.
> >> >> 
> >> >
> >> > In -next ?
> >> 
> >> No, -rc5.
> >> 
> > Booting v5.13-rc5 in qemu works for me for riscv32 and riscv64,
> > but of course that doesn't mean much. Just wondering, not knowing
> > the context - did you provide details ?
> 
> Does that work for you:
> 
> https://github.com/openSUSE/kernel-source/blob/master/config/riscv64/default
> 

That isn't an upstream kernel configuration; it looks like includes suse
patches. But, yes, it does crash almost immediately if I build an upstream
kernel based on it and try to run that kernel in qemu. I did not try to
track it down further; after all, it might just be that the configuration
is inappropriate for use with qemu. But the configuration isn't really
what I had asked.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
