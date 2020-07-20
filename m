Return-Path: <SRS0=LUeZ=A7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D116C433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 22:11:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F6F20773
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2020 22:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p8X8TWN1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEffvtAR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F6F20773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rjzqbu6oakpW5NVS3QVSfZ/RjffBetqs4pLeQxozWxY=; b=p8X8TWN13hAnfDDAeCDZI4Itd
	yw2J8le4uHAYMAz1CGaxRVe1e5vtI8jryJhqie93bOL9zeKAr/6vinANBXBZJP0QIFOXNL75fu+7F
	HWntByGBs/j9glOhQaewNwMJ4TfdIu02PeTja74NgM72yULHjE/e7/dChPHHHhH8xElBo+7AKvYQ8
	DqUU9/fPm/5ZIH2WBibFXuzYF/PkwtsO58NCkIkD4cbLOwP1DyQ/J8dlXv3Kdg+Sdy9wVNdMgsudt
	XWDRTVFVN9q7NhfJTIlSNAIkZMGy4vfnhRjLWgWkhtZBDQz5tYzWnOvE8NCivNZGA12UIPGgRn/qH
	aUDb4MVzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxdzs-0000ei-J6; Mon, 20 Jul 2020 22:10:56 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxdzp-0000e2-Tf
 for linux-riscv@lists.infradead.org; Mon, 20 Jul 2020 22:10:55 +0000
Received: by mail-pl1-x644.google.com with SMTP id 72so9344208ple.0
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 15:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h0GEicoGZvUY4aSOetLAK7yh5EuOCMqYG/Hqy0bSab8=;
 b=rEffvtAR5yY0laEVInca+LKZUHy7fvvHGPywogRX7YS2qAduLQJ0l+6YVHo0eZh2+J
 xB8kMhyRt6fstkCPtgGeoMwCFEvHRsfx9PtG0/ZgvhduN38XzekAFIKa0oniNUvqnFru
 +qG/DOKHpgFgAntgCwTdaZjaY8Nx6dk606FiOtWk0hdKFfhFV7O0o8Oz9pGv6Pqon2Cd
 99wrcDypHEybAOdNoNA3FhZWnbYQb6ggkFFfmQOQQIelNIIphQ4A3IqRDCeq6hGWy0zq
 uZAkEZqTPYeAMyDKrPTkKBPrXc6XqXor0opjNfNwor9pdTsYMleGK8hfzVkj0nbGL6bQ
 qopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=h0GEicoGZvUY4aSOetLAK7yh5EuOCMqYG/Hqy0bSab8=;
 b=chDueMJ/SB4f3rDyTg99uXdp/ixt3CbCLGynq/69xVonqdT2Gk/Rl4BL2cvw1+2aAs
 suoioJKL1T9LzMtUySCgcDRr7Oc8MyXOtuQaT8vn6C4wG96lr3MotvmUNhB15wGI/IPo
 tcQ09bIrAAO30aglf9lKThhfWvetEf0nlIpRDgvU9ayEgmmHn/ujN2GoSJWkXL2wHAZs
 xAJCp//5QsOK+ZEfv1rwEvXa7dbN3eU6Zwf4oQgr/NMNfNanBdouJnRph02vtyaxuiil
 gmv/e9u2g2UE7jJUwz5CfL65WGY6rY5DU/7oQQAqGh9EIY1aIeLBJqs+8KwHdWNteDNh
 drng==
X-Gm-Message-State: AOAM531yhincFT/kN87gMy5s+QPvhKyvz0jYTYBf2JAl+SvqDGR0Lkg/
 8pNwV4EatNar1ba/jnMD1sAWLSog
X-Google-Smtp-Source: ABdhPJyAtwghREh+cNVe4GBVZ28Uhys24HSMBEM0bwHPLTtJGq3WqPh0KHblwq+XQJwxzII+Zp5Afg==
X-Received: by 2002:a17:90a:d684:: with SMTP id
 x4mr1458894pju.62.1595283049018; 
 Mon, 20 Jul 2020 15:10:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e28sm17823273pfm.177.2020.07.20.15.10.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 15:10:47 -0700 (PDT)
Date: Mon, 20 Jul 2020 15:10:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/6] syscalls: use uaccess_kernel in addr_limit_user_check
Message-ID: <20200720221046.GA86726@roeck-us.net>
References: <20200714105505.935079-1-hch@lst.de>
 <20200714105505.935079-2-hch@lst.de>
 <20200718013849.GA157764@roeck-us.net>
 <20200718094846.GA8593@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200718094846.GA8593@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_181053_990283_8E84CB4B 
X-CRM114-Status: GOOD (  22.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jul 18, 2020 at 11:48:46AM +0200, Christoph Hellwig wrote:
> On Fri, Jul 17, 2020 at 06:38:50PM -0700, Guenter Roeck wrote:
> > Hi,
> > 
> > On Tue, Jul 14, 2020 at 12:55:00PM +0200, Christoph Hellwig wrote:
> > > Use the uaccess_kernel helper instead of duplicating it.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > 
> > This patch causes a severe hiccup with my mps2-an385 boot test.
> 

I had another look into the code. Right after this patch, I see

#define uaccess_kernel() segment_eq(get_fs(), KERNEL_DS)

Yet, this patch is:

-       if (CHECK_DATA_CORRUPTION(!segment_eq(get_fs(), USER_DS),
+       if (CHECK_DATA_CORRUPTION(uaccess_kernel(),

So there is a negation in the condition. Indeed, the following change
on top of next-20200720 fixes the problem for mps2-an385.

-       if (CHECK_DATA_CORRUPTION(uaccess_kernel(),
+       if (CHECK_DATA_CORRUPTION(!uaccess_kernel(),

How does this work anywhere ?

Thanks,
Guenter

> I guess that is a nommu config?
> 
> Can you try this patch?
> 
> diff --git a/arch/arm/include/asm/uaccess.h b/arch/arm/include/asm/uaccess.h
> index b19c9bec1f7a63..cc7daf374a6eb6 100644
> --- a/arch/arm/include/asm/uaccess.h
> +++ b/arch/arm/include/asm/uaccess.h
> @@ -263,7 +263,7 @@ extern int __put_user_8(void *, unsigned long long);
>   */
>  #define USER_DS			KERNEL_DS
>  
> -#define uaccess_kernel()	(true)
> +#define uaccess_kernel()	(false)
>  #define __addr_ok(addr)		((void)(addr), 1)
>  #define __range_ok(addr, size)	((void)(addr), 0)
>  #define get_fs()		(KERNEL_DS)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
