Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A071CC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 06:20:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD86061446
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 06:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD86061446
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=tJgzhtIroB2rF0Io6B0ljRnKuKIEazHHx892Ct6Yra4=; b=njMEaQ14ThmOy/3uzFSNetNLF
	vc2z722tsN3kA3Y1bO/KyBAhW06ZSYC0p3wMqNqbG1esVK3NIYSxb2cdBJ8jjXW48AYCfsE9f04WA
	BeWUM2xpQp+KX0KP5LdhOogknjqCT+qN51Ip0hamddxCq+w3fpyNAMgZlMTKJyt0c6xbwCY0d2O/B
	jjJXtCVoQI9y4rUrzT2hQjwY311KcOLddTmRxQpnjzA6REjd7B5vrEjZjIE7Pk8HD5SDjHUGWi1Nv
	zzLknQgpdWWatFak3/3QjbJgbFWKnfXcwT43qtDwj+NARsXdJ9r7akumekSKipd83H+Ca4HIW1Oux
	9pzwtBIew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc02K-0052nn-OR; Thu, 29 Apr 2021 06:20:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc02F-0052gr-PC
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 06:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=eGhjBR4zaGeybot+MbINCHNH51ifDbBua1uieBHnQ+w=; b=pFDdyhqcLvY+JhBOMpDWUt+5s8
 aMmRw7C9xqPAn/wgGCkZYBObWKoYsDmUyQBD8NZVbbrZLirYMXZk6wYQZIklLxYh6TvQfBRrF7Qja
 966vt/iP9eRbe/Qi7Twq7zkys1DGeFq4V13SvgKHo7tecIT0EHtCzDXXhcwmyMq/Madi34LS+C+Rt
 8bWDhKro6rncjnXhyYEWC4lere458SHQzCn4Zfiy2PnkiMqr+YtRTDnXALtEUFTf5jCGpEPaUuf6S
 V3jyzxQ4ZQ3zbXuERrM0M9Tdqoq2yDmMFDtwc2ojzxT1hXOQj3vkBj0dUHPZinR8bUiR7xWXBH9qx
 Qoqawebg==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc02D-000P8Q-4l
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 06:20:26 +0000
Received: by mail-pg1-x52a.google.com with SMTP id p12so46407210pgj.10
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 23:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=eGhjBR4zaGeybot+MbINCHNH51ifDbBua1uieBHnQ+w=;
 b=rJYMvlNW0fPvxvkYd8FjRM4Rdya30nobauOKU5eomIqlua9RCqZy2kemhwj/tlmusI
 ZH5t5+k65DhuxHSAkSkRmyLebc8MWUmMEoy/hbB+O0EzD9paXqz82uwPOPRbavXLAqTH
 tP3iciC+ifk12Sp3lywAImJ2bh9r3LaVXsz/ilGkwtXoJ7JkP818L9+3rpU63N6zpSkW
 EurSraYBmOUcSjGNe7iMcl0GoqCw+SsBg7wc5x1+U9MUlAbS4nYTSB36bi7BsSkErVZe
 qSbpxIwq/pS/Ob5j91lRHIqvYy4V+T04ceumU0Hp6Zb4t9j/1Mzr7716LVqn5syThfN2
 WSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=eGhjBR4zaGeybot+MbINCHNH51ifDbBua1uieBHnQ+w=;
 b=tbzJF8bH31+fGfi7floDTOXCCUCoJR34IIaNHV/i/m5MeCvgrZEPo7pFgTtXiHiyW2
 Y7TnvrUpitn4HHOtaOacF3ri1QobNyrrik512hUBVlGAIzDUxQeDFUoEClMj35IwoA3i
 Ccejb9c2g65MzBK5NaZJA18v9PXYWMeU+ATV1kQyYIesAl51kh2b4POiVB6ysazKzkc4
 ZBJxBzXS3XYHMFpugf8X/Wq+8txMsmW3r+i/a3OOcvUVvTHSG2bsO2gmjFSXdIx/iyTv
 40SThP16nxtyoC81utpePq9Ubk1KS1MHFidyemwHlJYteEzbsZMT4U/KTPGZaucggYAQ
 MgcA==
X-Gm-Message-State: AOAM531LkP/FemtPeBg/eCXaGZ4GP7nM6QAJ+aiYcxlnvSFdI+th9nQ1
 pyi29Hq8vD9IgX7lXsPaqGk1pg==
X-Google-Smtp-Source: ABdhPJxZ/f8l0Cp6+Li7MVzuJ9EGWthR4rmgkLzMcO9VW1vgGn5YwwFBEEqAsNeYqnVTeZpPOOximA==
X-Received: by 2002:a63:1708:: with SMTP id x8mr3202869pgl.266.1619677224052; 
 Wed, 28 Apr 2021 23:20:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y29sm1440377pfq.29.2021.04.28.23.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 23:20:23 -0700 (PDT)
Date: Wed, 28 Apr 2021 23:20:23 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Apr 2021 23:19:16 PDT (-0700)
Subject: Re: MAINTAINERS section RISC-V/MICROCHIP POLARFIRE SOC SUPPORT with
 invalid file references
In-Reply-To: <CAOnJCUKrqOXGY7ePLEqxtAk39_fbhxt0wVhEtrv5m6X2wwuUpw@mail.gmail.com>
CC: lukas.bulwahn@gmail.com, Atish Patra <Atish.Patra@wdc.com>,
 Conor.Dooley@microchip.com, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-cb6aa290-2314-480a-ac89-743a2d5f95bc@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_232025_202209_35AF5496 
X-CRM114-Status: GOOD (  18.59  )
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

On Tue, 27 Apr 2021 23:31:17 PDT (-0700), atishp@atishpatra.org wrote:
> On Tue, Apr 27, 2021 at 9:15 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>>
>> Dear Patish, dear Conor, dear Palmer,
>>
>> Commit df29598aaf5c ("MAINTAINERS: add microchip polarfire soc
>> support") adds the new section RISC-V/MICROCHIP POLARFIRE SOC SUPPORT,
>> but that section solely refers to files that do not exist in the
>> repository.
>>
>> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>>
>>   warning: no file matches    F:    drivers/soc/microchip/
>>   warning: no file matches    F:    include/soc/microchip/mpfs.h
>>
>> The patch series, [PATCH v4 0/5] Add Microchip PolarFire Soc Support,
>> never adds those files, though. Are they coming through a different
>> patch series into Linus' tree or do you intend to refer to other files
>> instead?
>>
>
> The actual files are added as a part of the following series.
> https://patchwork.kernel.org/project/linux-riscv/list/?series=467187
>
> As the "Add Microchip PolarFire Soc Support" series added the basic SoC support,
> we thought it is better to update the maintainers file in this series
> to provide the information about
> the maintainers for the PolarFire Soc.
>
> Should we just remove the Files section or update the maintainers in
> the SoC system controller series ?

I've just dropped this from my tree, it's best to keep it along with the 
drivers.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
