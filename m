Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F52C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 05:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F35360BD3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 05:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F35360BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nZ/5WSory6IAm0hfZoFBg6l7DQ15EmM7h3KF/rTVPzY=; b=rExotQHDlGwZYsed7MzD/HzDQX
	MkKmPflyPHlmb7fqR912rbtbEmviqDw69exSf3njwrrwU2tB8lE4Coz9nXmP6OqHxR2kIkFkirULi
	mjrVzBbR+Lb2vbksDUx3/M2VPYRbCilF2inbWSq5rWRWwdm+mYyIXDA2RPHXbityCbu4tHW+6gPTO
	ulHju9QebFnGaeH8CfSqUqfAKbFabLHOTjeVoQHwR+otqQTevvApIAcBmd+N7bw17lFuVT5rjDOkj
	+2jpNlSHfp9z2o4Ipvj36SnW2pRd1Rqh4oQaD8FOh6NI0b/9mYXHzyDeqEK2j6BsFRaWMY5GJGdpv
	VRJIbtwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB9Ep-004sDc-Ot; Wed, 04 Aug 2021 05:14:43 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB9Ea-004sCr-A9
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 05:14:30 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so1959729pjb.2
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 22:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=QuJ/DSgDGn0JlMMJQHxu7ihQz9wjd0GmZ+lCLjhFct4=;
 b=OiIpX8UaAcRZdo72FpN9duyjItlWATx3iEX6M2+EgThDjf90KrCQoB8A/UIGf23Djv
 C3hfXE6XYCcuMioHL91Vxw8945xlO7E2a3nINqCzoeKdPohaswaa89GLPjPDeoKtO6Dd
 DlrqcsjNWxR+v+TpeVsty09l84drfWyY+Fz2CaMEmvN3KsAmBJ0+K5gQCE3IOwVvW7tc
 BMBB5e/ggUXPJXAglralmVCd/EbGi5F1XQdK1XuU7b+lpn+22Q67yhDcPaKFhctvkl+/
 t72+pWNq/NQ0dRoQtpIJdl6w7T+voDWLyDbI/fQCFthZeNDfWDxDG5hGI55+1mSsz12n
 YkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=QuJ/DSgDGn0JlMMJQHxu7ihQz9wjd0GmZ+lCLjhFct4=;
 b=dEpq+K2Ncgxu7vDGPARoXfD8+TkFSif0A5d574tgoTQXrrKzFAd+whv2PqpWoC3ve/
 kYw6QnjFME/fYhI6QX+BJ6o0xKXJXwYZqY14p3hqGmYwjSstORKUJsdWb7Thv8cfafPy
 vxffk4VbAcuiOxIUz6qimA3q0BGIqrWpEl2MVQ7VaVXH2VNoGXcwt5jFwbhev6ss7hv1
 DPOBCrNBPIJU82lam9XYe3CCPY+MyM8+FL+ynO9Mw/VsBfToUo80iYBVgqiV9F0lEoTY
 FyZhSw0B6D0urw59om4mkEfB6G06pPGhzNuGWOOe+RMowOkM53TM2BoiHhGJmZA3PWGH
 4+/Q==
X-Gm-Message-State: AOAM5317JC4K0UAg9wSinyyvx+AF51R3c7IWaEDokYXw57uJbPWFVZAm
 U1NNCqCgR+BeMckAvJpLS/GXrg==
X-Google-Smtp-Source: ABdhPJytoWTQUBCl4vFgy0Xbp2cMHVqzyHGt/l5Ixy1g0Ti4uEzBniEzsIbU1B43UtIZFPH2WyMnmg==
X-Received: by 2002:a63:1352:: with SMTP id 18mr1302291pgt.348.1628054066921; 
 Tue, 03 Aug 2021 22:14:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c2sm253954pfi.80.2021.08.03.22.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 22:14:26 -0700 (PDT)
Date: Tue, 03 Aug 2021 22:14:26 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Aug 2021 21:37:34 PDT (-0700)
Subject: Re: [PATCH] riscv: Disable STACKPROTECTOR_PER_TASK if
 GCC_PLUGIN_RANDSTRUCT is enabled
In-Reply-To: <mhng-1b892781-2ee8-476b-90b8-44b5cca45cf9@palmerdabbelt-glaptop>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, guoren@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@roeck-us.net
Message-ID: <mhng-5b3c9fa7-2e28-4788-9013-3a988ac5280d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_221428_468478_843CC523 
X-CRM114-Status: GOOD (  19.28  )
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

On Fri, 23 Jul 2021 17:58:13 PDT (-0700), Palmer Dabbelt wrote:
> On Tue, 06 Jul 2021 09:26:21 PDT (-0700), linux@roeck-us.net wrote:
>> riscv uses the value of TSK_STACK_CANARY to set
>> stack-protector-guard-offset. With GCC_PLUGIN_RANDSTRUCT enabled, that
>> value is non-deterministic, and with riscv:allmodconfig often results
>> in build errors such as
>>
>> cc1: error: '8120' is not a valid offset in '-mstack-protector-guard-offset='
>>
>> Enable STACKPROTECTOR_PER_TASK only if GCC_PLUGIN_RANDSTRUCT is disabled
>> to fix the problem.
>>
>> Fixes: fea2fed201ee5 ("riscv: Enable per-task stack canaries")
>> Cc: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  arch/riscv/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 469a70bd8da6..3afb84fa2190 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -486,6 +486,7 @@ config CC_HAVE_STACKPROTECTOR_TLS
>>
>>  config STACKPROTECTOR_PER_TASK
>>  	def_bool y
>> +	depends on !GCC_PLUGIN_RANDSTRUCT
>>  	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
>>
>>  config PHYS_RAM_BASE_FIXED
>
> Thanks, this is on fixes.  I do an allmodconfig build and haven't seen
> these failures, is there something special I need to do to get this
> working?  I know nothing about GCC plugins...

Sorry, looks like I screwed something up and I didn't actually merge 
this onto fixes.  Not sure what happened, but this time it should 
actually be on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
