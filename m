Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6294EC48BE5
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:26:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E298B610E6
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E298B610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eu5ke4HX4c1Cr8w6XrtHo69FUnxGZ1AE5TVVktHtNsA=; b=rA7K7GhL0TmDPEzVpSzkZDBqMX
	G+oZncLKiv8KSwMqfZLvih7xwP3EniZIVjizNaMUYtdcPkLW8eIqnxCpo3p7vw0HPgvfvFRB1A/tH
	FjNrSQByyhBh83iPOxjwjclnDIg00EoZTNbJQIch6fA5tdXbQB89QHmtmC6s1qMdi98jmoXv9+G5V
	sL82RWZzzPSwUPS0eejxWC6fK9oV7mkcEQq9oTvknuWBXD2ft9MXPFbA/jUEC3Wkj2vpsF6KOpf7u
	6DfpaWKvjggmC9Mlmn9iokJVFuGhipSkqvYPVVdz334kmEXwn4/ttdBX3wbP4sHD2Zof9McqxP7K2
	fcd+xsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsDuw-009MPw-6I; Sun, 13 Jun 2021 00:23:58 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsDur-009MOV-Bn
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 00:23:55 +0000
Received: by mail-pf1-x42e.google.com with SMTP id x16so3430224pfa.13
 for <linux-riscv@lists.infradead.org>; Sat, 12 Jun 2021 17:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RXT+8x314xSg/qjd5fCq8QVd9NxiQV34XUsXxK9d4mI=;
 b=fy4xzbpxEif9cjWESCVpB24ftJFC11FSHjybOolw4wIhf3BjMuKWCoTH3xoMdlP3G8
 ZoRdGtYiLJcieQOI0B4So8iP+jHH5wPr2FkS9gBvqW1mdTltM1gwYQ9zBHo0awQmVvlC
 li23Fl7ZJtxOog5Xkq15hPZfmYcokiGDMUbxxDGdeNA2UTj2pj0HsJf4XMIJAzzB0H/+
 BXZXr6FXdSBhluW4LFjE0zO1wEeLuCHN1uxSuicB0FzmTxZJP4caU78PEtrX38LsqYiA
 L+25MIHVbFrSGFROEov+/6/tgqoOkJ4XUsCmN4qeWSdOW7dBB6LXm6y20OQxn/vVlcNg
 V5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RXT+8x314xSg/qjd5fCq8QVd9NxiQV34XUsXxK9d4mI=;
 b=P0I1jctdNQiB83bY5sMUqRoWv7nE95IfJy1eu+tFep9O4xB71al9aEx7QpdpGOi1kv
 n1eJy51dD8g8TZXYP3DQQmJBnmmZTX4iAlRZ9WzulkhYnYMX4aYQ1fhVmGA5SPIgSBi4
 OgdQjzfduBfh9V8fQURRy8JW2DPWSj/8GWG+quqSaEKX0+wczr31sKpm6fG0EWcR/7H8
 aPVKSPPX6sLaizUEyy5YF1qCe7E4qButFVtHieyGWk7p19FuBdKTAc341NpME8TQX1Gr
 7IILUd/YpFHv4B0+d1obxm1X2gS7MCGM5ec3dEFYR05mM2uZpsjof0HfKncaPbRndCLy
 AFAQ==
X-Gm-Message-State: AOAM532LRBYm5RwaN+AQg7CYJm2ftmekwBw9rB1L7NI5c4xWJQIKhund
 3alvCZgmOGRiBm3HvUpRuSGwig==
X-Google-Smtp-Source: ABdhPJz/JYl3ijdhu3ZIRn+LxZXHWdRI1iDoCU6VkYWp2irfhE5KLCD5Lu/IpLQ56OYsbmB937x6nw==
X-Received: by 2002:a63:1d61:: with SMTP id d33mr10500807pgm.331.1623543831659; 
 Sat, 12 Jun 2021 17:23:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id h28sm8568227pfr.10.2021.06.12.17.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 17:23:51 -0700 (PDT)
Date: Sat, 12 Jun 2021 17:23:51 -0700 (PDT)
X-Google-Original-Date: Sat, 12 Jun 2021 17:23:35 PDT (-0700)
Subject: Re: [PATCH v4 1/4] riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
In-Reply-To: <CANBLGcy3HrnmrweSpnDZViVstoWJYh4sCBoaX_24AsgWd=Q9XA@mail.gmail.com>
CC: alex@ghiti.fr, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 jszhang@kernel.org, Christoph Hellwig <hch@infradead.org>, zong.li@sifive.com,
 anup@brainfault.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: emil.renner.berthing@gmail.com
Message-ID: <mhng-dfabeabd-e6df-4035-a9d0-c16269390120@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_172353_414528_1C517BFF 
X-CRM114-Status: GOOD (  18.62  )
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

On Sat, 12 Jun 2021 16:23:03 PDT (-0700), emil.renner.berthing@gmail.com wrote:
> On Fri, 4 Jun 2021 at 13:51, Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> Make the physical RAM base address available for all kernels, not only
>> XIP kernels as it will allow to simplify address conversions macros.
>
> Am I just reading it wrong or won't this patch make it so that the same kernel
> can't run on two chips with physical ram starting at different addresses?

IIUC we were in that position, at least without relocatable kernels.  
Maybe I'm misunderstanding this, though?

>
> /Emil
>
>> ---
>>  arch/riscv/Kconfig | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index b58596b141fc..3d8e7e4bb45c 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -493,13 +493,8 @@ config STACKPROTECTOR_PER_TASK
>>         def_bool y
>>         depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
>>
>> -config PHYS_RAM_BASE_FIXED
>> -       bool "Explicitly specified physical RAM address"
>> -       default n
>> -
>>  config PHYS_RAM_BASE
>>         hex "Platform Physical RAM address"
>> -       depends on PHYS_RAM_BASE_FIXED
>>         default "0x80000000"
>>         help
>>           This is the physical address of RAM in the system. It has to be
>> @@ -512,7 +507,6 @@ config XIP_KERNEL
>>         # This prevents XIP from being enabled by all{yes,mod}config, which
>>         # fail to build since XIP doesn't support large kernels.
>>         depends on !COMPILE_TEST
>> -       select PHYS_RAM_BASE_FIXED
>>         help
>>           Execute-In-Place allows the kernel to run from non-volatile storage
>>           directly addressable by the CPU, such as NOR flash. This saves RAM
>> --
>> 2.30.2
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
