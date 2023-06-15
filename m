Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90478EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 13:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Yxjfytumn+sCwCAm5r89947YIccJlbGtB2wF3rkc19U=; b=cdSc9l7L3iAbOGFWywNulHZeG+
	+o6OD+eifxtVf5ts0I3vBFNmFfP7NFPJ4sX49hmRxbYCquh0MtcqxupwWZ/zHKGfj9WUZlZfJMpVi
	ZPusfzj89OODaxaiVqjms6d6AEt8O4e50wzoM96e2ZGzzWKVXhMIwvQCB0W/pjdm+wNUMo/MHaEE5
	LiK7wzAzKE/bQgnlGjJeiRnQmUfqiNipW4r0/K9bgTqG3NiYBA2EC7Tg6/04VurePO1f6GQeix1r5
	fqb/tL/cUtX75lu6ift+asrcQf5tdmF4yhirwAEZUBCucpZG6joEJN3oaOREe/Jm69FOT89DLvmov
	t4EzUN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9nQt-00F3ro-0G;
	Thu, 15 Jun 2023 13:54:39 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9nQq-00F3qs-2T
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 13:54:38 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6b29b9f5c40so5844442a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1686837274; x=1689429274;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aL6s+S70COXWhSW1xa78Cs58KFjDmq4WzqQOCdiOiQ=;
        b=gO90/AdNIolSs15osNgKPkFkIycjW7AtQYUlLN1kYKDXG53CQt5/HpTfPL0SNKfV+q
         SBWNbTDKbv/9XgznIq3QER7UkD+YWke3zclHBDwZ2nHPc4ylAj5ge1f1IcR3+d2kahjh
         FjwxFrj3VTydDLQ8yv1GwQc4oPAYYSqq6rAimwqpm4MWQF1ys3owYsjib5W9t3oPlflv
         CDxfBNyUSej0G/0GHx04kNAQv57eAAF0dPazGO3Io2PRLrW6FNWGhJg1fsAUgp5GjzPp
         UgoQUCxffIfRWnbiqH/Yl9jZh0limMMAjS//SbPA5K1ihbmZnzRuFEVkb1B+JtDuEwVQ
         cs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686837274; x=1689429274;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aL6s+S70COXWhSW1xa78Cs58KFjDmq4WzqQOCdiOiQ=;
        b=BLmugX0qZ6mBxj8AhL3IfmGYoGbj8y7UGsKFtDGHq+loQa2fIHa9ifHsVFyhjgOa7M
         n2o5RuwKkorMooRMKAIH/qNBhfdBW5e/2HxtSC7sSjkNC2wwwWBtpkQTz7o4XiuRoRMh
         Ch8ONGHe+WCeIUtpeddnkrM4C9M1XaIndNhXmgUiQcRqcjQkUsM+oJX28r4zFiPzRlQA
         O+WLyVzh9+pEO1Jsj8VPUwlGpMnfeN/sWa1YIkdpOVMOTSyPWFayRPJhbsdVnYrF8YsN
         GSVbLJ01ma6gpC3ZbHAhzmq/58OIQso9n6IA4nmAyKRNsZxFz4F5uXti2AFxB/ZmDCwL
         TYMA==
X-Gm-Message-State: AC+VfDw7/gCsc3J3kGiyhLHOPVfplGOic4xuqoR1SrizhUzyEbPuOURT
	X8Gq0d9fM2EULL//sfq1HBWLPrMc70SszDFrIvM=
X-Google-Smtp-Source: ACHHUZ5I63uqJ8FKjWG+8uwoFHcGcg1JHnF32YJoVu3zwVNY0nDaVNwrqRY/Q7wnBZo524tHS2PlDw==
X-Received: by 2002:a05:6358:cb2f:b0:129:c6d6:ce40 with SMTP id gr47-20020a056358cb2f00b00129c6d6ce40mr12848161rwb.15.1686837274461;
        Thu, 15 Jun 2023 06:54:34 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id g25-20020a633759000000b0051afa49e07asm12980492pgn.50.2023.06.15.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 06:54:33 -0700 (PDT)
Date: Thu, 15 Jun 2023 06:54:33 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Jun 2023 09:58:00 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <ZInqDdXh6wNK3NHq@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-41a06775-95dc-4747-aaab-2c5c83fd6422@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_065436_975305_E072E051 
X-CRM114-Status: GOOD (  26.81  )
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

On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wrote:
>
> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:
>> > When trying to run linux with various opensource riscv core on
>> > resource limited FPGA platforms, for example, those FPGAs with less
>> > than 16MB SDRAM, I want to save mem as much as possible. One of the
>> > major technologies is kernel size optimizations, I found that riscv
>> > does not currently support HAVE_LD_DEAD_CODE_DATA_ELIMINATION, which
>> > passes -fdata-sections, -ffunction-sections to CFLAGS and passes the
>> > --gc-sections flag to the linker.
>> >
>> > This not only benefits my case on FPGA but also benefits defconfigs.
>> > Here are some notable improvements from enabling this with defconfigs:
>> >
>> > nommu_k210_defconfig:
>> >    text    data     bss     dec     hex
>> > 1112009  410288   59837 1582134  182436     before
>> >  962838  376656   51285 1390779  1538bb     after
>> >
>> > rv32_defconfig:
>> >    text    data     bss     dec     hex
>> > 8804455 2816544  290577 11911576 b5c198     before
>> > 8692295 2779872  288977 11761144 b375f8     after
>> >
>> > defconfig:
>> >    text    data     bss     dec     hex
>> > 9438267 3391332  485333 13314932 cb2b74     before
>> > 9285914 3350052  483349 13119315 c82f53     after
>> >
>> > patch1 and patch2 are clean ups.
>> > patch3 fixes a typo.
>> > patch4 finally enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for riscv.
>> >
>> > NOTE: Zhangjin Wu firstly sent out a patch to enable dead code
>> > elimination for riscv several months ago, I didn't notice it until
>> > yesterday. Although it missed some preparations and some sections's
>> > keeping, he is the first person to enable this feature for riscv. To
>> > ease merging, this series take his patch into my entire series and
>> > makes patch4 authored by him after getting his ack to reflect
>> > the above fact.
>> >
>> > Since v1:
>> >   - collect Reviewed-by, Tested-by tag
>> >   - Make patch4 authored by Zhangjin Wu, add my co-developed-by tag
>> >
>> > Jisheng Zhang (3):
>> >   riscv: move options to keep entries sorted
>> >   riscv: vmlinux-xip.lds.S: remove .alternative section
>> >   vmlinux.lds.h: use correct .init.data.* section name
>> >
>> > Zhangjin Wu (1):
>> >   riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>> >
>> >  arch/riscv/Kconfig                  |  13 +-
>> >  arch/riscv/kernel/vmlinux-xip.lds.S |   6 -
>> >  arch/riscv/kernel/vmlinux.lds.S     |   6 +-
>> >  include/asm-generic/vmlinux.lds.h   |   2 +-
>> >  4 files changed, 11 insertions(+), 16 deletions(-)
>>
>> Do you have a base commit for this?  It's not applying to 6.4-rc1 and the
>> patchwork bot couldn't find one either.
>
> Hi Palmer,
>
> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
> series is based on 6.4-rc2.

Thanks.

>
> Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
