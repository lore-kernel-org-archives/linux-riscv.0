Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD2EC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jokMhS+f+wCqlhemr+EzuvEbdERh/qIs3q7IK/xdqts=; b=LTCl54L0JjqPlX6x0q1EYVqL3e
	hqTFrqIeiFp3zf7RRWj2LWElg8fvDoFxLK+GEiKFhp2bHXoJ00XD4hTlDLknWNnk4dShvYEQWrkb4
	kPn4d74vFOpJF/5pef88kyPjz84mMTNiRVj4q3ah/wqowE0SWJeLuc5VeV/tFKQ+24/w3mMgrT4mg
	HAANBs7KQjtfaQBXMi4z4kfNBGjmDX8AfGl9soWTafHFPA+3W8djv6HSvqL/l686vNqZaRopgOvNV
	BkU3clPzX+82A0+JMSX/eOtjqhhil6/U4exRvetvtyBiQOY0NEu14/kbdknwGBgeK3s3w8FkO8ceS
	pEti+Pbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWPOs-009435-FO; Thu, 08 Sep 2022 21:49:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWPOp-00942b-FM
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 21:49:29 +0000
Received: by mail-pl1-x62e.google.com with SMTP id u22so19173642plq.12
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 14:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=qLqlPl3fKkjW/kEzjQGLWLX73dzJkAc9NWL7f/iWITI=;
        b=Vsvi5ahSHF8O1zx68xg3ZDtXWMgZLgw2zSLjYQDanA5R9w5OTUpww04/BR3mZYFShn
         YIaGhKmhqBOO+rVIzYJ/BRDZ8GLyRrgLEQYBDTao9fr/QTqnSpZbDCNlVqpAVpGqZTdT
         Rel/CITqbl3LV/JH/TLK381R5lcFJ8oeQpO5JIzyyQZZWasZBJ8810RoLQCtM5wDUjJR
         ecDp5G8huiMPAAobvtmRx4zaRRL1d92oF3aaR1jAjWRLBM5URcVjWsJ6jNS6nY8KoAId
         5zFnz+hGBGRdqEZrvuALYqFjygUrlkMtpuw4GT61sR082EtCBfi7MVNrIdMhUu9phScP
         5nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=qLqlPl3fKkjW/kEzjQGLWLX73dzJkAc9NWL7f/iWITI=;
        b=6IZaiP019CeqFkK7vYyR+3Dti2LayZ+y4pfPpPfiW34LWNoCqNT0LaSZFZ1S+KCK51
         yyrEDofOHa2DUBFnssY/ehx3mRATXN1vRPx8V1Tutmgs7XL5FtHRlXIMa2mPuKjwowfB
         E9FVSIxEuCnBynWqPk8C5Y1kc7IyayvwiCJtVOZzCEHbYukspfHzAKIXLBXOLYUcsdfD
         OxNdWr5Y/aaILWjYOZLrugA03m293brhluS7ptJWrZIadOP8Q8P/rWYFwrJiIApgJN7q
         PJIYkn+spO7traCYt+8GIHnr4j8yyGC2msq0TKH2GUwB2Y99LQlPj9cjN2+4tbqPsMlo
         zdbg==
X-Gm-Message-State: ACgBeo0HdnpiulXZF+1VXZJV8HjOwBFJllxMoTNjZCqfiL2OZE+pIttd
	xAK6Ntjbuyo7lILO7iV+GcHw9SdCaIoa4JbBbJ0=
X-Google-Smtp-Source: AA6agR5nFd6NkbqDTcSuiSROf9+8jJttPjGIOVB37v5jKyCNqAjkIp/1TFFUrumx5L5YlfLlfU8I5g==
X-Received: by 2002:a17:902:9b85:b0:16e:cc02:b9b2 with SMTP id y5-20020a1709029b8500b0016ecc02b9b2mr10705077plp.74.1662673764344;
        Thu, 08 Sep 2022 14:49:24 -0700 (PDT)
Received: from localhost (154.30-253-62.static.virginmediabusiness.co.uk. [62.253.30.154])
        by smtp.gmail.com with ESMTPSA id i71-20020a639d4a000000b0041b667a1b69sm13273071pgd.36.2022.09.08.14.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 14:49:23 -0700 (PDT)
Date: Thu, 08 Sep 2022 14:49:23 -0700 (PDT)
X-Google-Original-Date: Thu, 08 Sep 2022 14:49:19 PDT (-0700)
Subject: Re: [PATCH v4 0/3] perf: RISC-V: misc fixes and improvements
In-Reply-To: <20220830155306.301714-1-geomatsi@gmail.com>
CC: linux-riscv@lists.infradead.org, atishp@atishpatra.org, mark.rutland@arm.com,
  Will Deacon <will@kernel.org>, anup@brainfault.org, aou@eecs.berkeley.edu,
  Paul Walmsley <paul.walmsley@sifive.com>, geomatsi@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geomatsi@gmail.com
Message-ID: <mhng-a1ce8d21-649b-4212-93fd-b01c3081aa86@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_144927_728329_F724A7C0 
X-CRM114-Status: GOOD (  17.69  )
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

On Tue, 30 Aug 2022 08:53:03 PDT (-0700), geomatsi@gmail.com wrote:
> Hi all,
>
> Another respin: updated commit message and more RB tags.
>
> Regards,
> Sergey
>
> v3 -> v4:
> - added Fixes info to the first patch
> - updated commt message for the first patch
> - added RB tags by Atish Patra to the remaining patches
>
> v2 -> v3:
> - rebased on top of for-next branch in riscv kernel tree
> - added RB tag by Atish Patra to the first patch
> - added perf throttle patch
>
> v1 -> v2:
> - drop changes for access to the highest available counter as they are
>   now handled on the OpenSBI side
> - drop switch to IDR: in fact there is no need to handle non-contiguous
>   counter ranges
>
>
> Sergey Matyukevich (3):
>   perf: RISC-V: fix access beyond allocated array
>   perf: RISC-V: exclude invalid pmu counters from SBI calls
>   perf: RISC-V: throttle perf events
>
>  drivers/perf/riscv_pmu_legacy.c |  4 ++--
>  drivers/perf/riscv_pmu_sbi.c    | 33 +++++++++++++++++++++------------
>  include/linux/perf/riscv_pmu.h  |  2 +-
>  3 files changed, 24 insertions(+), 15 deletions(-)

I think only the first one here is a fix, the others are the 
improvements.  So I split this up and put the first on fixes, the others 
on for-next.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
