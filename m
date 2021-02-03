Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D988C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 209C064F6A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 209C064F6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=aiQrWdA+2jMqm3pVOKSSiJ9C2E43V0QE27KkLtM2Tqc=; b=ha8a7TU8X6zmh/ziUkSykxiR4
	xeouyywhJqDyNzK2CT0mWhaamNL/iz7p4b+1zxx5r2pbN+No//LWkrjy0reKQ4mA8jmqHGlowPxks
	rHCkogwgxYlJowLwZ0MxeFlrlP3n/Xm2PTthd9hZbzuzrbZA/auTiHuZEnLG2XYHPgFmwzedAgQtq
	HHjaighWrj9LUHC6KO5HXkaQgg8y5ByX/njPXhwQfB1wbfQ3X30qxPKhz4BLenEJrvDczjAkoOGMP
	i330NS/T67ARYYWL0mCoHKQu4C7it8HERvoRRd5B1HU15JV6cMQZ2xLudF7/9kxs1+IqL8diSZ/i0
	9dUvdmgqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l780W-0005RP-Eq; Wed, 03 Feb 2021 02:35:04 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l780T-0005PR-6g
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 02:35:02 +0000
Received: by mail-pj1-x1029.google.com with SMTP id lw17so2659813pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 18:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OsVRDdfzv2cQbndm8SwipZXw//lhG27z+lIqx8n8u4I=;
 b=ev1N4tqbQGAmcYrqbbf7aYJ1pHLWCRq5evlGjJ+X8gLY26uHoe9J+rGvi973/X3Qdq
 M7hnsGE6k4jqow/ZvdNNcSX+BbIyhycdU6Wjh5xPUjzlOW/0+9bKGB71PdEMAGDnr6C7
 +RuAugnZ4hlFokomD5cipwrHAAqVugFb0ivn4vpVOfEU9gwhKnUP/0IZ86LcX6ghYvj7
 KI+27jSZgH3WUX4DC80ES/PiYfL/PS5VhBSOvnuQRExzoJx+NdLDAERKajYLZ2Bw9/HJ
 Hzoid43wxPdtEJ0cZU0op7iwxPeyzK6kQxQaB6p6CYh9Zo7SbDJVqKDZc+TOguKFLT1j
 9BaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OsVRDdfzv2cQbndm8SwipZXw//lhG27z+lIqx8n8u4I=;
 b=hEn2UOcNE717D2cT65BkIXQQeybqmPqX7rbeWWiMfRiYReUkIpCvdcu0SJ8/EpenbU
 /JBfh3GielTwI2JiemgKV47zk7G8wvEzbSMPwPrBo1CjHofEBR6+2sam0v6q8Raf0pfF
 We5i4/2Bfucpc5NQTVgZVP1CnlwDat/0oKjjlZFrfRczdjVUCG9FHqAQN9o39M0GDWCT
 QyfUh9CC9cSFbcp+PIKM+3JBd6LbwE3vUkqkaRUB6U15NJKdpy8Ja/8yYEVgWpIChLIH
 yrriGE/+lZoAm+DZOd7yg/GaR2I/lxXFKiP47LgC+yLoayLha1XySF9uBwFsCmYDe5SP
 yc+g==
X-Gm-Message-State: AOAM530+zwdUNVFeN5xhjXhk2SGNvP6Y5tuojcjtU2vk6aVee53QRaZv
 kNpPK2+hT8sSBqz1CbxXeHbPXQ==
X-Google-Smtp-Source: ABdhPJz1fAW3weygbL3KOp7CRNmIw8lvfQugj7PN6ZHI0VXzW5uHNSemyVGxyiaYFQNctaUPSIxSlw==
X-Received: by 2002:a17:90a:17c8:: with SMTP id
 q66mr848452pja.167.1612319699220; 
 Tue, 02 Feb 2021 18:34:59 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c5sm294732pfi.5.2021.02.02.18.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:34:58 -0800 (PST)
Date: Tue, 02 Feb 2021 18:34:58 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 18:33:29 PST (-0800)
Subject: Re: [PATCH 3/3] RISC-V: Define MAXPHYSMEM_1GB only for RV32
In-Reply-To: <20210129190038.1001626-3-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-3aa36699-55e0-4f82-80f7-0d7248ac3b5c@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_213501_362791_2B054E27 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: svancau@gmail.com, rdunlap@infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 ndesaulniers@gooogle.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, ardb@kernel.org,
 kirill.shutemov@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jan 2021 11:00:38 PST (-0800), Atish Patra wrote:
> MAXPHYSMEM_1GB option was added for RV32 because RV32 only supports 1GB
> of maximum physical memory. This lead to few compilation errors reported
> by kernel test robot which created the following configuration combination
> which are not useful but can be configured.
>
> 1. MAXPHYSMEM_1GB & RV64
> 2, MAXPHYSMEM_2GB & RV32
>
> Fixes: e557793799c5 ("RISC-V: Fix maximum allowed phsyical memory for RV32")
>
> Fix this by restricting MAXPHYSMEM_1GB for RV32 and MAXPHYSMEM_2GB only for
> RV64.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e9e2c1f0a690..e0a34eb5ed3b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -252,8 +252,10 @@ choice
>  	default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
>
>  	config MAXPHYSMEM_1GB
> +		depends on 32BIT
>  		bool "1GiB"
>  	config MAXPHYSMEM_2GB
> +		depends on 64BIT && CMODEL_MEDLOW
>  		bool "2GiB"
>  	config MAXPHYSMEM_128GB
>  		depends on 64BIT && CMODEL_MEDANY

Ah, I guess here's the patch :).  This is on fixes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
