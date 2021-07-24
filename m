Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17E5C4320A
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 00:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6908660EBC
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 00:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6908660EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CSk5HxFGdQm2cD4WF097WfU8vrAu4gp5vOIqZzGLvzE=; b=O+XJ1G/zlaBFWsYkgKZaXm7Wa3
	NUz2eYMRdQhhgvS6hjcdMMuJAQ9KvInOPx3qVIWBMaH5mOssvcY6sTduyEPfiZ3+cd2gy99jymUV6
	di9qn+z4vRI3HFFZecWKuIF/kqJmafzHpWq74P7Dv+fzfIczrVRtV2wJJOzWovo5NMhTgCm94P60P
	tX0IfiK84YIx2Cda2J1QPIm9QiPQ93RLLlkxBTxCYrDk/m3GRzGULolAOLlEzZsmrprujtH4HNbpa
	VF13mf82A3S27Omm57yMgWAZNVGQ6jT7av2e/HTTv+zu1629keICq3K1vATwN3dNfbSLC+PheZlet
	gYBHPitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m75zh-006UWF-Eb; Sat, 24 Jul 2021 00:58:21 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m75zc-006UUe-KE
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 00:58:18 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so6076232pjd.0
 for <linux-riscv@lists.infradead.org>; Fri, 23 Jul 2021 17:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZH1ep8Lqmfo0hZMi5hH0dqsBptIa9O4wT4x0trrhiko=;
 b=Ci7am3WuNnfoXq/ZHRCMM7iDeb5+/AwGcf888CiGAYi2lp1kWdNbyAaYktxazRT95b
 0E27TnqEQ0vVY5fWr1pXmPXx4ojQH6AcDDLHReJa0fcAdktHePT/ynBFFIE6BJvSqhpN
 fkYBSlv751kxSaRtmAox7hXsYuJLpWkBk8OCcK4m9E7ZNqvPOmsgHmpUIHK7uQfRPOR2
 ls/XuINL0LIFONLJYzdj7VHhBww30JptkEyn3M8JkQbr6Kl2nXKQGx9CHwPQqqHSOaGw
 s1ZrVfTHO8ll3jF/LoRRWXJQZwDZWGEf5w7ZDMtIaqNTw8ij7wdr1o4+lphHGO5F4QbK
 S+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZH1ep8Lqmfo0hZMi5hH0dqsBptIa9O4wT4x0trrhiko=;
 b=K3A179bzVDbyBieJCnUW26PImP1StoPqovv2EO1xwOAtAmjLMh1IBjk9bV/1h5zHZm
 hMu6YDXSA9YKg/KKJFucvwbmwoQeXnoaxF/peUTb8xwj0NduKlXNMngnqqbYonMR0eR1
 eK1m7cvOf/D9W+IWXFVmUYNNpsE/vJHMa/6wQ/UVwRq68yDyAvMLNwCQh5Cit1zPmqOG
 UFjN/d7wV0dLP4gevCNPynESquda0gS4+205jeUOWnjUDA6AM/FJeE/wCUWwerJKDWm/
 uyGX7ENvSS3o/sLiiT5EPKFNRU5hNUmxAFYjoB0So7lcDBSXMFYZCqNdo3+xOB0KTald
 41YQ==
X-Gm-Message-State: AOAM532nzpTaOQXvMfjD9MPGEGH/1P4QBnYIwTZbuXuoZqWVm3FBuwKb
 +HEq8dYmy7nkNdz8DRXhzwgUKDIdWb7pHQ==
X-Google-Smtp-Source: ABdhPJxFGPw8X1roh2e+PgEMBPHCB4+FLlKwJs+z5n+Bv8aMe/xrVfeP5TUMWmdp4a+oEWUr1PXQig==
X-Received: by 2002:a17:90a:d588:: with SMTP id
 v8mr15797861pju.134.1627088295872; 
 Fri, 23 Jul 2021 17:58:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a16sm33873755pfo.66.2021.07.23.17.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 17:58:15 -0700 (PDT)
Date: Fri, 23 Jul 2021 17:58:15 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Jul 2021 17:55:27 PDT (-0700)
Subject: Re: Linux 5.14-rc2
In-Reply-To: <06a1a5fa-3d3e-8037-ee6c-74acc16a0df3@gmail.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akira.tsukamoto@gmail.com
Message-ID: <mhng-858bf7b5-e294-418d-88c1-1d8ae5ef854e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_175816_720599_1A60F403 
X-CRM114-Status: GOOD (  19.94  )
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

On Tue, 20 Jul 2021 17:26:23 PDT (-0700), akira.tsukamoto@gmail.com wrote:
> On 7/21/2021 2:24 AM, Linus Torvalds wrote:
>> Don't know if you guys saw these mainline -rc reports:
>>
>>   https://lore.kernel.org/lkml/2c03b355-86dd-1fa6-dbaf-5857f4a45a66@roeck-us.net/
>>   https://lore.kernel.org/lkml/20210719140437.GA2178213@roeck-us.net/
>>
>> On Mon, Jul 19, 2021 at 7:05 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> Failed builds:
>>>         riscv32:allmodconfig
>>>         riscv:allmodconfig
>>>
>>> No major change here, except that arcv2 images now build.
>>> For reference, the riscv build problem is:
>>>
>>> cc1: error: '4496' is not a valid offset in '-mstack-protector-guard-offset='
>>
>> and from the -rc1 one from Guenter:
>>
>>> The riscv:allmodconfig build failure is not new. It is seen if both
>>> STACKPROTECTOR_PER_TASK and GCC_PLUGIN_RANDSTRUCT are enabled.
>>> See
>>> https://patchwork.kernel.org/project/linux-riscv/patch/20210706162621.940924-1-linux@roeck-us.net/
>>> for details and a proposed fix.
>>>
>>> riscv32 images fail to boot due to commit ca6eaaa210de ("riscv:
>>> __asm_copy_to-from_user: Optimize unaligned memory access and pipeline
>>> stall"). I reported this a couple of days ago, but have not seen a reply.
>>
>> it would be nice to have these basic tests all passing again.
>
> I have sent the fixes yesterday in my time.
>
> https://lists.infradead.org/pipermail/linux-riscv/2021-July/007621.html
>
> Guenter and Geert have confirmed the fix.
>
> https://lists.infradead.org/pipermail/linux-riscv/2021-July/007634.html
> https://lists.infradead.org/pipermail/linux-riscv/2021-July/007626.html
>
> Akira

Thanks.  I've got these on fixes now, I'll send them up tomorrow morning 
assuming the autobuilders don't find any issues.  Like I said in the 
other thread I wasn't getting these allmodconfig failures, so if there's 
an easy way to reproduce them I'd be happy to add it to my setup -- I 
don't really know anything about GCC plugins, I'm just using Debian's 
toolchain for my Linux test setup (haven't gotten around to merging it 
with my GCC test setup, and it's been a decade so I guess I should stop 
pretending that's going to happen ;)).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
