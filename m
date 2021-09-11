Return-Path: <SRS0=Il0f=OB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F82FC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:06:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CF2260FDA
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Sep 2021 06:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CF2260FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1P+S4c0FcxVoIK5gXfmaK6p8CnUpSxwLqPfM3kuYNP0=; b=Qd4NHFFHeOTXK9oE4yIHi2u/kt
	VGT/RPJh4zzibA25b5viCsRphUSHyukuydfadBRjQlQ917MQ1L52r2sPLOzgRZebxoiyh0Uc66rgG
	q24PVFdOCHaM0x0CdlM6XuRSQqLHR8/mu2+E2XcFj1Sq39HvDuryMuV+PDqrnatkbbPLg8k38Gktp
	Q9v3ykNFra0TL9NHOl3Eem+Tcg5e9H/t42UY0gXtK0DHKUN48QrYFYcoNiqw4z/7qW0DJbiJ+npE1
	M24Rf0wXHEQCwvGNGjxKKpNMfnSLWBJejbtHMmIS1qF9k/XuRN+1U8AMioTbwIdpllePKKSkzFJM2
	eCV2jhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOw9l-00EMCt-CG; Sat, 11 Sep 2021 06:06:29 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOw9i-00EMAn-FU
 for linux-riscv@lists.infradead.org; Sat, 11 Sep 2021 06:06:27 +0000
Received: by mail-oi1-x234.google.com with SMTP id q39so6235337oiw.12
 for <linux-riscv@lists.infradead.org>; Fri, 10 Sep 2021 23:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YRsAXOR+B9ZJhLqPByr9zY9zfv70ssIn9o4Iz9oUNV8=;
 b=DmTbOXYDZvaasRAHqyn3tRk6ZDWQwiSJCvLqHPgOjrfi+DncylQXr0s73a5T3R5tMt
 ZcPpThiF5bKh5DRKeWRr8XLgLZWu7NxT9E0ENYdpthJGhnyqDrpS2HzPTojKB/SKFf4x
 RYpANlTLh3UdEjG9K3X9hah4iALnBNenu6QafBmR7Gc2ZQC3zeMTyuW5b5iuxpKZfW2M
 z572RlDP2JacXhU8tm14dHBOo6C3axJjs+t+BsDpWKmSEAJxGp/KcGC6LOJhKlfrXQYy
 sl6oej7eSLCJGH7vef6OnIUX57a1ASf9XVDCXKBphi1p1fQb44p6BnfASu8YqWC5EHrI
 54Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YRsAXOR+B9ZJhLqPByr9zY9zfv70ssIn9o4Iz9oUNV8=;
 b=SHvJCv/xHIyjNbZMVZEaLPyhmKvNc+nTO+B3rBgjYtSpB+d3dN5ZtsIUPeSHQ+ZkQn
 6VDYwr0ImoNeLJVUsaONOTqWvkjrcUkgj07hCuQR+F8Bm82baQ+/wEoJ7aWUnwPF+bNM
 tuhZQzA+rMcZelv9KKjUvi7aoaPB/v3Kz3wzqTh8kCDO1vzBR61UaLwMkRDCA7fKRMiE
 rCnEVFBk33EYbYfVWbfG3lEcMXRXbtTEexTcbSMEdb/NmpjTv0NFPsgwMFsL9SrUi4XH
 LJfDpyQuW2v2XQmtznxH4wNAFQ+gQcXjsTsq6xv3gEQEmr0Bxwd1RS0VALZ8mjK9+FDN
 JH4Q==
X-Gm-Message-State: AOAM532Qg/ueZ/qCxCcSXmYmY1qStDZLqWDhnhmUqYsr4KiDpzAOCT9F
 e7m+8QSUlc1w96i9+GAS2nBMBA0EmMU5JxkgW6g=
X-Google-Smtp-Source: ABdhPJxKYHEPa4g89Ud9G/MK85H6caqR3uD39776+VSORo9NcviayvA2g0mOM983eyNkxvb8lObN/A==
X-Received: by 2002:aca:6747:: with SMTP id b7mr919629oiy.134.1631340385072;
 Fri, 10 Sep 2021 23:06:25 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id bi41sm238534oib.54.2021.09.10.23.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 23:06:24 -0700 (PDT)
Date: Fri, 10 Sep 2021 23:06:24 -0700 (PDT)
X-Google-Original-Date: Fri, 10 Sep 2021 23:06:19 PDT (-0700)
Subject: Re: [PATCH] riscv: add rv32 and rv64 randconfig build targets
In-Reply-To: <25894c79-120f-8885-34cd-2e9dec0017ba@infradead.org>
CC: linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-a1bcb222-57a9-4ef5-82bc-bed70d1a7e38@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_230626_556908_0649E04C 
X-CRM114-Status: GOOD (  16.31  )
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

On Thu, 12 Aug 2021 07:29:30 PDT (-0700), rdunlap@infradead.org wrote:
> Hi,
> Any comments on this patch?

Sorry, I must have missed this one.  It looks great, it's just that I 
don't see your Signed-off-by on the original patch.

> thanks.
>
> On 7/16/21 9:44 PM, Randy Dunlap wrote:
>> Add the ability to do randconfig build targets for both
>> rv32 and rv64.
>>
>> Based on a similar patch by Michael Ellerman for PowerPC.
>>
>> Usage:
>>    make ARCH=riscv rv32_randconfig
>> or
>>    make ARCH=riscv rv64_randconfig
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>>
>>   arch/riscv/Makefile              |   10 ++++++++++
>>   arch/riscv/configs/32-bit.config |    2 ++
>>   arch/riscv/configs/64-bit.config |    2 ++
>>   3 files changed, 14 insertions(+)
>>
>> --- linux-next-20210715.orig/arch/riscv/Makefile
>> +++ linux-next-20210715/arch/riscv/Makefile
>> @@ -132,3 +132,13 @@ zinstall install:
>>
>>   archclean:
>>   	$(Q)$(MAKE) $(clean)=$(boot)
>> +
>> +PHONY += rv32_randconfig
>> +rv32_randconfig:
>> +	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/32-bit.config \
>> +		-f $(srctree)/Makefile randconfig
>> +
>> +PHONY += rv64_randconfig
>> +rv64_randconfig:
>> +	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/64-bit.config \
>> +		-f $(srctree)/Makefile randconfig
>> --- /dev/null
>> +++ linux-next-20210715/arch/riscv/configs/32-bit.config
>> @@ -0,0 +1,2 @@
>> +CONFIG_ARCH_RV32I=y
>> +CONFIG_32BIT=y
>> --- /dev/null
>> +++ linux-next-20210715/arch/riscv/configs/64-bit.config
>> @@ -0,0 +1,2 @@
>> +CONFIG_ARCH_RV64I=y
>> +CONFIG_64BIT=y
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
