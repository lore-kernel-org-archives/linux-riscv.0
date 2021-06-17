Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EB2C48BE5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 02:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98986112D
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 02:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A98986112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nHlbmT47Tj4g3C9r4AVLdqlOJmtw7G5/MmyFQUBv658=; b=bU4X05oIsHc3slOnaOcXRrNSxt
	/KRcFT4uYE6/y3X1VzUSF2FEDcVVH7xmUm/OgfZmVdUrjhZbkkSialsEovkdROzQnxlYySwo1/2Pc
	zcaJ2HCj8S4cLb+6NpL+PC1Sr7n6b+KrTldp3Yq5D72JuE2Q+CLHHHCEfSBkVy/dRxCMMEwoq3kEU
	7F+Ja4TdlVXt5lIb3shcfk0ij5hMpGLyUaug/m+3jqP4fiH/nkCCKhreuCr0VlDheNZ1Xi6U4IZiR
	EsZCYz+WbamobG1hDM5YKbDv3o/ly5uVTihQCSLR6DpSLljjrasUR0ihcuyhpvBTdFuKskoqqUhSY
	hEd+TEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltiEx-008b5N-V6; Thu, 17 Jun 2021 02:58:47 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltiEu-008b3r-2l
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 02:58:45 +0000
Received: by mail-pg1-x535.google.com with SMTP id m2so3723484pgk.7
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 19:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pAetusrXJOJzWSJzpj/wpmSbSm54E0/FhIpgunOB9fg=;
 b=ukzHIYxmdKkIQf64rUee88mkx/YVndIKeGyPC7juZMCTOHOZ8juq16b0buUyJHPM1A
 JMaWUp7K63bjpALA1waqiGlhBxCR8a4CHnAM/noOylfw+06z1WpT34aH6757NHmsot31
 4DoLbtGvHOiketrzTVIwOeGCGQ6DkFSlPBuFdofL4i9OREH6Qz719CfpP53p26U8YieQ
 gNVM/M5rIQrk5tpUeZqypINbwENqGSXKtKrEY43EyRky19Q/YUhUB3I3ifozlbN2t+se
 zihwN6OigL/4NHZ1Ue/JDuMOZdDDELwua7YPbob6N/xqagVBi6bXI1GBQGQPuLkyvo1f
 y9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pAetusrXJOJzWSJzpj/wpmSbSm54E0/FhIpgunOB9fg=;
 b=cjmZYQyAAD+48IP9iGuWxgxtFHnsQhvAWey0STruU7GQZ0BZTk9oUAYPQHO3Ak1bdV
 spathgIiMZohNakaco90DsxmtL+g2++wIN2uAcPp/6fNaWewu1ug41dQpzrMBups7ko+
 byoVDRMVvCieg467N3ah3lQYXhcJML+u2O++LPWSm1xrT2fpOLPDQFhNSyBxGZbZThVP
 rNjP/7sKfZpNcUrp79NJSrFvdXUibTS24XqLz5ED9PQmiGe583LQRMvP5Ya0+OpZyVkf
 j3w3HC43YwzZ54XsE1Sx841hRkpGd+bdqMVDT92iXFf5CxCC8HZ/Eu5VE10rPwMlW88j
 wDPQ==
X-Gm-Message-State: AOAM531Nmbq8oOo6FlluGk2G6vYRl1rAptZL9/YfZKPSpZgOsIt8ANGO
 dW+oSa7mmb7bDNoMQ0uDE73WUw==
X-Google-Smtp-Source: ABdhPJxM8YGfhTyvdc1ihezx3Yt6LpJ2Zg7c25L7/ASVxuUM6An10/lYTrBBK2BJS6+69kGdNj0Eyg==
X-Received: by 2002:a05:6a00:c2:b029:2ee:9cfc:af85 with SMTP id
 e2-20020a056a0000c2b02902ee9cfcaf85mr3098604pfj.78.1623898721881; 
 Wed, 16 Jun 2021 19:58:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u9sm3633698pgp.90.2021.06.16.19.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 19:58:41 -0700 (PDT)
Date: Wed, 16 Jun 2021 19:58:41 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Jun 2021 19:58:38 PDT (-0700)
Subject: Re: [PATCH v5 1/3] riscv: Move kernel mapping outside of linear
 mapping
In-Reply-To: <20210611110019.GA579376@roeck-us.net>
CC: schwab@linux-m68k.org, alex@ghiti.fr, corbet@lwn.net,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, aryabinin@virtuozzo.com, 
 glider@google.com, dvyukov@google.com, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org, linux@roeck-us.net
Message-ID: <mhng-569bbfda-00d0-4c1f-9a88-69021f258f7e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_195844_207331_3DEF24F9 
X-CRM114-Status: GOOD (  22.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 11 Jun 2021 04:00:19 PDT (-0700), linux@roeck-us.net wrote:
> On Thu, Jun 10, 2021 at 07:29:15PM +0200, Andreas Schwab wrote:
>> On Jun 10 2021, Guenter Roeck wrote:
>>
>> > On Thu, Jun 10, 2021 at 07:11:38PM +0200, Andreas Schwab wrote:
>> >> On Jun 10 2021, Guenter Roeck wrote:
>> >>
>> >> > On Thu, Jun 10, 2021 at 06:39:39PM +0200, Andreas Schwab wrote:
>> >> >> On Apr 18 2021, Alex Ghiti wrote:
>> >> >>
>> >> >> > To sum up, there are 3 patches that fix this series:
>> >> >> >
>> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210415110426.2238-1-alex@ghiti.fr/
>> >> >> >
>> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210417172159.32085-1-alex@ghiti.fr/
>> >> >> >
>> >> >> > https://patchwork.kernel.org/project/linux-riscv/patch/20210418112856.15078-1-alex@ghiti.fr/
>> >> >>
>> >> >> Has this been fixed yet?  Booting is still broken here.
>> >> >>
>> >> >
>> >> > In -next ?
>> >>
>> >> No, -rc5.
>> >>
>> > Booting v5.13-rc5 in qemu works for me for riscv32 and riscv64,
>> > but of course that doesn't mean much. Just wondering, not knowing
>> > the context - did you provide details ?
>>
>> Does that work for you:
>>
>> https://github.com/openSUSE/kernel-source/blob/master/config/riscv64/default
>>
>
> That isn't an upstream kernel configuration; it looks like includes suse
> patches. But, yes, it does crash almost immediately if I build an upstream
> kernel based on it and try to run that kernel in qemu. I did not try to
> track it down further; after all, it might just be that the configuration
> is inappropriate for use with qemu. But the configuration isn't really
> what I had asked.

This seems a long way off from defconfig.  It's entirly possible I'm 
missing something, but at least CONFIG_SOC_VIRT is jumping out as 
something that's disabled in the SUSE config but enabled upstream.  That 
alone shouldn't actually do anything, but it does ensure we have all the 
drivers necessary to boot on QEMU.

It's entierly possible there's a real bug here, though, as I don't 
really see what these relocatable patches would have to do with that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
