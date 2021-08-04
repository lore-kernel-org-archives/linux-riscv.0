Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BF9C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:40:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A72FC61040
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A72FC61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=K8aP6kuDNdNp9LVBvhvTbKfsSAjW1UoEM6I7UFUP1yc=; b=V6GSPX6B4nYfPtitGbxFw/2uNS
	V2CpP3iLXKOlAPwCyzhmA0DjziOBQnY13MHswnyF1K8i7GMLF/mIvzSjApe7Gn7C27bHqrbgoO0mh
	NRMDQilXO+5SVmvaxoWhvWjmaHYK32JPxQzF6Gu7jaTPDAYzUmuS6edOA5YL2O4UdeyGPnA7ByDez
	1wGf9DGXBxE1ZlbuTpBYVSn3+Ho/jYrhyvRFRT/3h1fN1mhxCjkRVsEt58miPnbq8tMIYmy37F7Ai
	jKsjNJb5oE1QSwwHbbGOJndbhBXnjT9rNBbQaZ3bUL24KlGt9y88+PqjnB1Ss2sND89lpl9pLUTIt
	yV2hVJdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBNgb-007Q4b-7J; Wed, 04 Aug 2021 20:40:21 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBNgY-007Q3c-8x
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 20:40:19 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so10550835pjb.3
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 13:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dit+/Sp1lC6totPcj+YpQn69uliJHNZ4tY9ArlksPHo=;
 b=TyhICT6tJ0ec1RQ9pgr0YmqC90JE7hdXdP9UHrKdA7/bYeqUiHI+/nBKIv/P4hiOw+
 e/Yv7wWWzyvnpq21xxdocilZp1rd8PFDdUuAP4+tOm45At8VQXSL9nMgJ+fEe1uuLlDb
 lExEJV936MlFwfML+b9yOzDzNo075cp1cjL3CsLlyTAk4hjENo2fCoHh8pnhn3GkRWyt
 0+taDDBsLRajHbuYiY6LbKPw2+6/KZ7q/5R1TpIMEtP7ZFK/ov9y0fk89ftNF/aXQwXD
 zh/LtCSF+KdYyVSdQE7yfEZUKZMt0CuZe+qQC9ZCX2h6evLEU05WEnfrOVgtXYGmnzH/
 JL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dit+/Sp1lC6totPcj+YpQn69uliJHNZ4tY9ArlksPHo=;
 b=IxAOJp3b+nFE6Rvz3qpDtxzuOOTwrSheb3SRM16RUcFXZj/1/c2dP5M2Ea1YmwP/ZG
 5LUhomNIS0qjrGAHrCVADuItKdenyBrcslhnftm8DrMqfl6BLMhrUzCWsf5vG+PDbtyO
 4pU/S4iMWOEa0jfMT08xNypA62qSUPlrHF8Wvhi+gUjII/y6vR/4v9UV6yrI72IqdSdY
 deU7gb6D4l5BdkB2kNLKF1NsVqdnQi3L6IRB0s5lTwCOaZ+hGPC6DiAHheSHZMqdRAQk
 raMfgjQqQ+EtViT/W6Df0ROvC258MOwCd63WCfpDQ+r6GbaB6+PR9N1Gs8VbdOy/UQM8
 cplA==
X-Gm-Message-State: AOAM531Avr6fnU67Cg1f9YiOkexz+iYZXtYBogNs4vBVpre0yOu3/Tvo
 Odi+qMzJuybcuiv4ow7ogAu/Wn0xzEjmew==
X-Google-Smtp-Source: ABdhPJwnTJVkLHdHiuNAm+IAtSRcOGH2SY6t5oaxIRPc4QRcH3junRf7HX4/2yey0W5WRXV6OeJy9g==
X-Received: by 2002:a17:90a:df05:: with SMTP id
 gp5mr916796pjb.165.1628109617098; 
 Wed, 04 Aug 2021 13:40:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id ms8sm7067173pjb.36.2021.08.04.13.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:40:16 -0700 (PDT)
Date: Wed, 04 Aug 2021 13:40:16 -0700 (PDT)
X-Google-Original-Date: Wed, 04 Aug 2021 13:40:14 PDT (-0700)
Subject: Re: [PATCH] riscv: use the generic string routines
In-Reply-To: <CAFnufp1QpMc87+-hwPa887iQQGCjjkGNanVSKOUsE-0ti82jrA@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 Atish Patra <Atish.Patra@wdc.com>, kernel@esmil.dk, akira.tsukamoto@gmail.com,
 drew@beagleboard.org, 
 bmeng.cn@gmail.com, David.Laight@aculab.com, guoren@kernel.org,
 Christoph Hellwig <hch@infradead.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mcroce@linux.microsoft.com, mcroce@linux.microsoft.com
Message-ID: <mhng-7b8d3a12-e223-4b69-a35a-617b0d7ac8f7@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_134018_388229_C39D4828 
X-CRM114-Status: GOOD (  17.25  )
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

On Tue, 03 Aug 2021 09:54:34 PDT (-0700), mcroce@linux.microsoft.com wrote:
> On Mon, Jul 19, 2021 at 1:44 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>>
>> From: Matteo Croce <mcroce@microsoft.com>
>>
>> Use the generic routines which handle alignment properly.
>>
>> These are the performances measured on a BeagleV machine for a
>> 32 mbyte buffer:
>>
>> memcpy:
>> original aligned:        75 Mb/s
>> original unaligned:      75 Mb/s
>> new aligned:            114 Mb/s
>> new unaligned:          107 Mb/s
>>
>> memset:
>> original aligned:       140 Mb/s
>> original unaligned:     140 Mb/s
>> new aligned:            241 Mb/s
>> new unaligned:          241 Mb/s
>>
>> TCP throughput with iperf3 gives a similar improvement as well.
>>
>> This is the binary size increase according to bloat-o-meter:
>>
>> add/remove: 0/0 grow/shrink: 4/2 up/down: 432/-36 (396)
>> Function                                     old     new   delta
>> memcpy                                        36     324    +288
>> memset                                        32     148    +116
>> strlcpy                                      116     132     +16
>> strscpy_pad                                   84      96     +12
>> strlcat                                      176     164     -12
>> memmove                                       76      52     -24
>> Total: Before=1225371, After=1225767, chg +0.03%
>>
>> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> ---
>
> Hi,
>
> can someone have a look at this change and share opinions?

This LGTM.  How are the generic string routines landing?  I'm happy to 
take this into my for-next, but IIUC we need the optimized generic 
versions first so we don't have a performance regression falling back to 
the trivial ones for a bit.  Is there a shared tag I can pull in?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
