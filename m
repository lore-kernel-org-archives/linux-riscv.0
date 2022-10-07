Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39653C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 03:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=f6blcuhdv6mIowJH3z4dwb450PMHzsolD56egYSZGy8=; b=Crj/gFVyEb38f1qVJIqQi8Xow1
	IRsFfsR9CTqmucLDxxvhzPscqPIj5rzZ2/pzvQzHSYy3bZM4nPL0ThoMpYTtPjjXeVa/nKSzJLJbm
	5ic/gm/9gZrFro5u7L4/g6hxpR+XH8Yp5Pc9z+GEMItitHOWtM9uK7aijbKFyy5Lb/3C/AXkidFCs
	+24ra2EYDLCbwswNaHzTIF7XxgQ/oVCU71IaymSk14C/V1PHmWTdHf7JPy625q4uYtKjx0Q//Uww0
	sViOSqbHKyoGID0nKLGbb+dw+l1ibZVZlz/oQrZE4WoBPOG06Zcx4xn0GXfiITsqK06Mc8MYYUs/z
	fP6Gylcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogdg9-006lNh-GI; Fri, 07 Oct 2022 03:05:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogdg6-006lME-2B
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 03:05:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id l4so3401083plb.8
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 20:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J0flw4m11S0YkBSfXTbnOZpdPQvclpjjpCP9ZUVoipg=;
        b=Zvkian0aIr7blYD6OMaPdxJzgrIEi3mAcpdPwjkvXe5Il6UvoATmwhKS2hmLMjMLJk
         v4khv7zNX/u7Uft1BCXbI2vLlBkYU7emGbUkI+IsH8nBCDrANfuTK/JkNTXzsde7F9B5
         unR1ErQrFRpu4hQ8YJxgsjq2Aa4r3XwlARx51/X+mdwfnittcqNrFxBYdUpIKSlHRh7T
         LqxuFBVsfH98fUWXId9oCZ6Me2KDCiiToc1SmaZcUeBRBxJNTbp7NnGKUoiPAoes9JmP
         W8s3X0WJ5M+RRALTOB4TjE0q4LE0IGH3KwjJc2h68bJt6DvxtPwdS0ztWifptNoWy8X8
         PAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0flw4m11S0YkBSfXTbnOZpdPQvclpjjpCP9ZUVoipg=;
        b=rdjLfmZwzO2aMoEj0uHojIVmWmELCUvmWb428WSvMiqLcBfZq1Aks1zT0k0EYHHevv
         GC5IjH0h/KVVi93MQOx0wB4YntlxmtgpRNZJG0U8ggrq/gN3FHlIcxm00eCmfwFIdlfk
         kJ1MKn86v4kI+QV2P17tK/UHGLKSgPQ5ABT1aItuESoRgx6vmJgxqjcQfNjsaxYHf3Gq
         z3JrRB2IHVkb8vXwx9ftrQ4XVrwqm503dWGGs6rNR9zePurZF4w8GD25eKmuxi9YiR7b
         FDq6T+gxifFchPJt65eZTwcMYEvZ5PGSeu/tJ2NGrHw5kZ3KaQcno0bjz1q1BKCtk3cv
         5GAA==
X-Gm-Message-State: ACrzQf1qEYXtXy/08jtWpugU5EYwBHm9r08Hpq89P2ZLfpf9m+LWxi+f
	DVygYUwRTibxbDoCgL8346xDISiGaFfmS2X9
X-Google-Smtp-Source: AMsMyM6onODrgPKfFIvPd397f6B2dV1HH1hcB8Pqn6pkZPpaqhERaSy1DiQEr7M0ivHPTA39GIJuCQ==
X-Received: by 2002:a17:90a:1c02:b0:1e0:df7:31f2 with SMTP id s2-20020a17090a1c0200b001e00df731f2mr13444790pjs.222.1665111930878;
        Thu, 06 Oct 2022 20:05:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090340c300b00172e19c5f8bsm341162pld.168.2022.10.06.20.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 20:05:30 -0700 (PDT)
Date: Thu, 06 Oct 2022 20:05:30 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Oct 2022 20:05:28 PDT (-0700)
Subject: Re: [PATCH] riscv: enable THP_SWAP for RV64
In-Reply-To: <Yz57T4eob3pXAVSP@wendy>
CC: jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: conor.dooley@microchip.com
Message-ID: <mhng-382406aa-3eaf-4318-b5e6-9fc8a370f4d9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_200534_123854_830C9542 
X-CRM114-Status: GOOD (  20.52  )
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

On Wed, 05 Oct 2022 23:53:03 PDT (-0700), conor.dooley@microchip.com wrote:
> On Wed, Oct 05, 2022 at 07:35:53PM -0700, Palmer Dabbelt wrote:
>> On Sun, 21 Aug 2022 10:05:59 PDT (-0700), jszhang@kernel.org wrote:
>> > I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
>> > memory optimizations such as swap on zram are helpful. As is seen
>> > in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
>> > commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
>> > swapped out"), THP_SWAP can improve the swap throughput significantly.
>> >
>> > Enable THP_SWAP for RV64, testing the micro-benchmark which is
>> > introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
>> > shows below numbers on the Lichee RV dock board:
>> >
>> > thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
>> > thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
>> >
>> > Improved by 382%!
>> >
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > ---
>> >  arch/riscv/Kconfig | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index ed66c31e4655..19088c750c7f 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -45,6 +45,7 @@ config RISCV
>> >  	select ARCH_WANT_FRAME_POINTERS
>> >  	select ARCH_WANT_GENERAL_HUGETLB
>> >  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>> > +	select ARCH_WANTS_THP_SWAP if TRANSPARENT_HUGEPAGE
>> >  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>> >  	select BUILDTIME_TABLE_SORT if MMU
>> >  	select CLONE_BACKWARDS
>>
>> Thanks, this is on for-next.
>
> FYI, this is v1 of a patchset that went to v3.
> v3 only changed the commit message, but v2 had a functional change.
>
> v3 is here:
> https://lore.kernel.org/all/20220829145742.3139-1-jszhang@kernel.org/

Thanks, not sure why I missed those.  I've put the v3 on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
