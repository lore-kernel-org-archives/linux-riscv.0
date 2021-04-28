Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301FEC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 03:35:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0679613C2
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 03:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0679613C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=4nB1L5q8qbpwYmJNHay8RYV8ww9Xb2wA2JgYuZgMlj8=; b=qGv6bWmHY/9FTOV99/6FZ60Pk
	7yO3l9g5f8XzSBhZH/Zmokm5GeXjhCd0orQOPmZcykKGRfo6v0Yy174sKAhiRtqCVET9tP1+Pk9Ew
	7ZeLo15ubZIcJIrAdpPe/LlF8nfsqXleq/qXRdhsmTz8JWFhxmSW18GXHvR1TQVmHbtnk9v0kGuPk
	cZ4KMK0SMXE9Yl6EuYCk5He5/dFSVJBLv2LMOrx1LTCmy5Fhx/5AD7S0OY7CDE37e2PKuy2lB0Dxv
	n11qWwqJL891hCDfSAvAe0GjGQBxoDLqKtP7bZduU/P/aRPbNvL4o6Ac4V2+7lBiBB5hc6Bmk0oJ0
	GC6z86QtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbaz8-002gbM-6T; Wed, 28 Apr 2021 03:35:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbayz-002gaW-7d
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 03:35:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=pkolduBNLLIr5vIIXbQQOt2wpdaq8aKiRXOt5tHWv0k=; b=rVl7x/No5/3kxgZ3gCW6LaHXgY
 9U0F+VCRilC/BG7Ss13w4dp3qslX1ftFjm84sqQsygzXAMjs52OTZekVALDYwN17dvwxhjgSh/UjV
 kWlqmRt7MXmK/Wefh6L5vwDrkympFbNNYMh3MJBjAf5LAUyklHNMWfoBtzd6qMDnDrcZwMbWcwM0X
 8VZ7fNbgxyw2ZCyisWJb1KHsHRPIPMGSDqhvWLsRvHbADGkf4gLqv3jZD/fQ1rCzgh1kpEHWqUcSz
 1maMbcpQwbMiAT2B0GM5hOntcZMMok2SVxNt+BuEXzJpFvgEcIAa0VKIOEHl/1tQmVqvnG1zleewl
 ZG1B9HJw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbayw-00HA3J-Ir
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 03:35:23 +0000
Received: by mail-pl1-x62b.google.com with SMTP id h20so32042464plr.4
 for <linux-riscv@lists.infradead.org>; Tue, 27 Apr 2021 20:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pkolduBNLLIr5vIIXbQQOt2wpdaq8aKiRXOt5tHWv0k=;
 b=AQ8FCd36kKveqrMIgf7gDWhpb3Z2GF9RhV+CpYRyHF3aTCzjysEv4uLA3Nc/ctIMr1
 FPYLA4bAcRcw0su3LPEK77MXyoAK1/Y0Kawr+7hLLF5oY+4FkGXkSEvuPhWoN40Lw7pj
 MF0NKPcfpE+yM+YAm1UFH3Rh4SP/4nCVjmtJqeruOH2yFL67Pxcxu1nnAPBX227IDRen
 tfG9YMFGLaLIFrKrkCHETFFYXO3IS/QADhw2OmI1EnYSlDeeji820daFlYUT6Kni+/dw
 2I/AOw8spRHZRiip3Gq186c8GufOHoaHt45x0NqHXlU3DHaIFkR4frwxh405j4erOK2O
 ftEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pkolduBNLLIr5vIIXbQQOt2wpdaq8aKiRXOt5tHWv0k=;
 b=ElMbVRyaAL+L4JTSyAj0K8NsJZIOZv+KfYAUznbMqEE4ACJhnnT6ph04mwHI7l+T2x
 tTqlU9VDmS3vcUJxuq0S139Qn0tkKsvQkPsS3MhpnWPbkszMk8GTVB3Oa+IpqX1ID44D
 iXDFNvL+q4Iz+3oZNSgvEMJbEBm2pAjAfLRmE2DZORDMSGC8586FumhkebKiNp8Y8L43
 cJy9INoD592nTdFWTHf7/2thJjDDJF/s3J7qwgHiYiPkjaPzE96Zm4ZbWqCvbdAZdTie
 FKcUjzWIj0dN1eHj2AmK04viv78ePTnrL9ZdfZ4IFzdZzmpYn3x932qlslPusDD0IrOV
 7JSQ==
X-Gm-Message-State: AOAM531P+s19wMjQliY7zNxqWx1jrzE58cqCZL/DVQMASCtRRVo2ZH4I
 tbFdNxt7WDwF8sihde2Y48xVJw==
X-Google-Smtp-Source: ABdhPJwMgSQQE79CAJ3VE3v1uID2azdmj5M/8eezAiYtjefmEN0N+WVUz8Ar2sct5D1D7zmhD50G2w==
X-Received: by 2002:a17:902:6b4c:b029:ec:a55f:f4e7 with SMTP id
 g12-20020a1709026b4cb02900eca55ff4e7mr28397654plt.72.1619580921559; 
 Tue, 27 Apr 2021 20:35:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b4sm3260291pfv.188.2021.04.27.20.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 20:35:21 -0700 (PDT)
Date: Tue, 27 Apr 2021 20:35:21 -0700 (PDT)
X-Google-Original-Date: Tue, 27 Apr 2021 20:35:19 PDT (-0700)
Subject: Re: [PATCH v8] RISC-V: enable XIP
In-Reply-To: <20210428030824.GA196954@roeck-us.net>
CC: alex@ghiti.fr, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, vitaly.wool@konsulko.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@roeck-us.net
Message-ID: <mhng-6764680f-437c-4733-8569-6f76d9c3aa4f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_203522_639862_99660040 
X-CRM114-Status: GOOD (  17.66  )
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

On Tue, 27 Apr 2021 20:08:24 PDT (-0700), linux@roeck-us.net wrote:
> On Tue, Apr 13, 2021 at 02:35:14AM -0400, Alexandre Ghiti wrote:
>> From: Vitaly Wool <vitaly.wool@konsulko.com>
>>
>> Introduce XIP (eXecute In Place) support for RISC-V platforms.
>> It allows code to be executed directly from non-volatile storage
>> directly addressable by the CPU, such as QSPI NOR flash which can
>> be found on many RISC-V platforms. This makes way for significant
>> optimization of RAM footprint. The XIP kernel is not compressed
>> since it has to run directly from flash, so it will occupy more
>> space on the non-volatile storage. The physical flash address used
>> to link the kernel object files and for storing it has to be known
>> at compile time and is represented by a Kconfig option.
>>
>> XIP on RISC-V will for the time being only work on MMU-enabled
>> kernels.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr> [ Rebase on top of "Move
>> kernel mapping outside the linear mapping" ]
>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> In next-20210426, when building riscv:allnoconfig or riscv:tinyconfig:
>
> arch/riscv/kernel/setup.c: In function 'setup_arch':
> arch/riscv/kernel/setup.c:284:32: error: implicit declaration of function 'XIP_FIXUP'

Sorry about that.  I thought I'd fixed the last build, but I guess I 
managed to just miss these build failures in a spew of successes.  I 
just sent out a patch to fix it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
