Return-Path: <SRS0=igOf=LS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82615C49EA6
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 14:43:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4275D613DA
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jun 2021 14:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4275D613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V7MR34ekk1nNL17by9rgOYWTs8OqlXRQbyvh74PQyqc=; b=RqAqua9YoBVdnCtV3O0I2mCnqi
	cxEoOEBpNztBkmygNiPN6dfgTxg3osoq1y3L+t3LOJ8WiQFUoPbXnfsIMMnzpjuxL+P6P8dUWXW4P
	nvoAzFOGM5EcaFwQINrC7rszKf/I3KXK7Oxmwa0VfC7VGVWSB1Wl2BzPazk0cnsgoedFDFVHsqD2X
	YXkOwbO+o99+fChc3NBmG6woB80J3UKgyKQk9Cz9rRQwCMAHTEuAFx7mspPhoa8kGv7gDT3W4+ZHM
	hYxLcElboGg1EvaM9bEB0R6hEQls1FG0hZYq8TBuGFB4tNAdWebZP+ZxlHiBql0bR/ai5f4Fq2tm8
	RadRAp+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwQZL-00F5xb-OT; Thu, 24 Jun 2021 14:43:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwQZ7-00F5vt-V3
 for linux-riscv@lists.infradead.org; Thu, 24 Jun 2021 14:42:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id v12so3059845plo.10
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jpLKG7EX/DpF/rCxDLo63s+UUOl3uRoWTd6EMjgdS+s=;
 b=bLBkOcqrvice1PQ1fSWBYJQjYhzLfzzegg6BCJE00Sk9C+B2/1x0g8gsLyinP6IOTc
 /cQj95YpY/JA+9y+bvFHE1BJLWdSsg4bemuAqGF+mnPZHWHGvkJtnitIOIGsRe3iN9nw
 dkKHOotQgmn3PXgSXij4l26Hvnl0XEkdEeqa1NF126YWWAG4qT+IUxMbnFwwJA6uc07I
 xZ2gKnafqSMY4mPvjPEz963Ur4pwSFjoKfxqhGQq1nC/TC2ZKzSmeDMc4BRGgJmxBlj8
 jwVAVD2MygxX7to2zYIyu3tZntCCBHJfKJ8hVIhZuwsyVIz+1BXzIUj47pxKi9MnTgvk
 +MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jpLKG7EX/DpF/rCxDLo63s+UUOl3uRoWTd6EMjgdS+s=;
 b=W0Hkqd4OOS2dMahM4IyiqEJNkV56Fy1Bd41l/iYK37wqHmrcO6VXtgYhb6gB4fJJ2g
 wRbFQ9dDtH53GN+5dWolGMy+p/UatQhn9xGXRn9nEjossmzwOn/qcekbP+vsTlqdQ+Og
 yS5ZjoXRKKzD2kYrs2N1yM6O2yhctDQYjWWnCG9eHr/szGaZvwXOJYTTGQHwtk3wmRyb
 812vPdXG52ePN1Yl692Q/C/Tv7lp16kt/8bd9xSgaevBkVjq/gWUCQxoEDXYaB96UtBT
 Y/+L+BoI4UOi+znAPLBlqYixzlGSFbAeqjsSntlp7qNpSBF0TnjsdeJ3fCVc/8c4dW3q
 GQkQ==
X-Gm-Message-State: AOAM532wAUAp4mL+CIUEput8O64jhaxaedlKkeZnxmRXP2YO+jHGvBN1
 Eu14Uwljg1TAE9+A9P7+gbk=
X-Google-Smtp-Source: ABdhPJxlaUFjqZH5QlPS4uxjAgbTWQUIwUi3KOvyml8TAI4pMrx1s7cRrU2gvO2mSmzrSSjWrXb7fg==
X-Received: by 2002:a17:90a:db16:: with SMTP id
 g22mr5815750pjv.111.1624545768974; 
 Thu, 24 Jun 2021 07:42:48 -0700 (PDT)
Received: from [192.168.1.153] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id i27sm2660453pgl.78.2021.06.24.07.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 07:42:48 -0700 (PDT)
Subject: Re: [RFC PATCH 0/1] Adding jh7100 SoC to defconfig
To: Drew Fustini <drew@beagleboard.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <f22f6d7e-97ab-85db-5448-c2bcef0ea0e7@gmail.com>
 <20210623185043.GA493015@x1>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <d707ceab-c59a-1b90-bd15-f875a5fe59c1@gmail.com>
Date: Thu, 24 Jun 2021 23:42:45 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623185043.GA493015@x1>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_074250_037944_80604F22 
X-CRM114-Status: GOOD (  21.15  )
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



On 6/24/2021 3:50 AM, Drew Fustini wrote:
> On Wed, Jun 23, 2021 at 09:45:52PM +0900, Akira Tsukamoto wrote:
>>
>> Would like to have comments for adding jh7100 SoC to defconfig.
> 
> Thanks for preparing this defconfig.
> 
> Let's refer to the SoC as StarFive JH7100 SoC [1] which is used in the
> BeagleV Starlight JH7100 board [2].
> 
>> To make the upstream friendly, try to add as minimum as possible in
>> arch/riscv/configs/defconfig required for beaglev-beta against the
> 
> Please use "BeagleV Starlight JH7100" instead of beaglev-beta.
> 
>> upstream defconfig. I might have added too much configs.
>>
>> Then the distro vendors could use:
>> make defconfig beablev-fedora.config
>> or
>> make defconfig beablev-debian.config
>>
>> while distro vendors keeping beablev-fedora.config and
>> beablev-debian.config in their own repositories to make one binary kernel
>> which boots for all riscv boards.
> 
> Note about naming, BeagleV refers to any RISC-V board produced by
> BeagleBoard.org and likely in the future will include other SoC
> families.

No problem, I will rename them all to "StarFive JH7100 SoC" and
"BeagleV Starlight JH7100 board". 

> 
>>
>> Probably, it is not good practice to add a different defconfig file under
>> arch/riscv/configs/ when each new riscv board comes out.
> 
> We currently have:
> 
>   defconfig
>   nommu_k210_defconfig
>   nommu_k210_sdcard_defconfig
>   nommu_virt_defconfig
>   rv32_defconfig
> 
> It seems like 'defconfig' supports the SiFive Unleashed board which
> makes sense as it was the only board for a longtime:
> 
>   $ git grep -i sifive
>   defconfig:CONFIG_SOC_SIFIVE=y
>   defconfig:CONFIG_SPI_SIFIVE=y
>   defconfig:CONFIG_GPIO_SIFIVE=y
> 
> I suppose the kconfig options needed for BeagleV Starlight JH7100 could
> be added to 'defconfig' as long as there were no incompatibilities.  I
> assume the k210 versions were added because that is a rather odd SoC
> that has a non-supported MMU and thus runs in m-mode.

By adding configs for BeagleV Starlight JH7100 booting fine on the current
defconfig which were SiFive Unleashed. Would like to have comments from
the users of Unleashed when this patch starts to settle down.

Akira

> 
> Thanks,
> Drew
> 
> [1] https://github.com/starfive-tech/beaglev_doc/
> [2] https://github.com/beagleboard/beaglev-starlight
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
