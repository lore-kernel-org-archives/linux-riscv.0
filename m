Return-Path: <SRS0=/fWr=LN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA1EC2B9F4
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 07:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DCB86113E
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Jun 2021 07:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DCB86113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=LJXGBFT4xNqB7RpJhdG6Mcq3ZmdvH27e06FL8WwGfT4=; b=ImUDTI8ktkSELMjiNYNaSqbnDx
	3WvL79SRq2YRjLdI5oPZugM8oVhgOZqfcNmN2pl3yHU0qHv2rTbndKOVqM5qa7gZuBmrjbjpJ9LSX
	jLqnmMv0rq0+Fv469zLXvlCDM4hF3oO4sqfaNo26gt7Ctp1tKt9nFCgAAfrH8tzsQs2wBPbE+h4MX
	49bCMuMOmnJJ8c4/KFfH7ZgAxWBDPlySMtn96K5bQID4+R54Ur089tS/pbMwENRmCmA89L03D3XSR
	rfjfgWjF29A4ITWvLAgdbs4q9q06j6rwnyaHdF47k4RqpWSNHOvjvVis0g1Ve2WZBLLEE1F57p1aS
	yNEPXgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luV8r-00GYQv-MN; Sat, 19 Jun 2021 07:11:45 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luV8o-00GYQM-Ad
 for linux-riscv@lists.infradead.org; Sat, 19 Jun 2021 07:11:44 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q15so9700088pgg.12
 for <linux-riscv@lists.infradead.org>; Sat, 19 Jun 2021 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=J5596F94Ds1nTlu/rsVNxmZfDQIuq2fmNSy1PA4+8/M=;
 b=WnZqQ1zC5M4OAHcX6oeeQaOB2g1TNNExyECx5vtP7FQP3VsW5cWBCQjXYQYuiSH8Ag
 STMLyMWi8mXF6xv//Urx19NfBXRpDuPK4WNjfDqJbaa0Zxt6cKjGn6AUL6LFNHWhjxxj
 ct5hlmj4x7Xpj+qTf9Xwp8C6RkTqda4N/dS62P0FQBRLNUqiWXXwapIiec1eNACHKBrY
 JfrFOXWg+TMmZByxHbx5iV2syICOdLBKgKZAU/ZFWDMCW94P47RLT6hEv0lMkpDUqTuJ
 5OeiupmOSkqTOzADw2au7LgxQaKMRFjILMwBdKatRn87auiJEULPCkV0Xw4WSkyGWgX+
 sEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=J5596F94Ds1nTlu/rsVNxmZfDQIuq2fmNSy1PA4+8/M=;
 b=PnXGqpoFJruZ2xnPuIDR7IJV4W9SpXP5DTRMk+h8xMJ29904LH2ItGNz4QCKRy2EdJ
 N7YMbtRaP+JnQvkRUArd7H4Xmov7w7ip02wzZNjH8sEPFWpHGk7J0MqKMlsi+fcw1XYP
 Ux2oiBrz5pylRWrxXV+XVw9F1vzB73ZBk/TJH7BM1V9c4U1dDqx4rI3H0wAI4EBB4b/P
 s3Noxm0FBMqmoIiCfoYAz35GmdNP6HMQVt0wo4dYpcYzFLyL8QgL0vt0vHf6fhWi5v5S
 tXVyjWSrfbKOxoqlnZjhL9DILmdK0kyudrlp7oJ9SWc2FTWvmW4gFEpNGpzRDB07xqvA
 h3KQ==
X-Gm-Message-State: AOAM5310aJrhApXqrdLi2F+Dp/C4cqxJpoIZ/yYHKHn5J6LV3q5qivPM
 34I6ob0ozAzF6scIeugShs1Uily4zg9Kmlvp
X-Google-Smtp-Source: ABdhPJxmgcopJ1xX08zjUasKt2M2w7Q+YgZo0A4zz/YOl5/wRc7Z60c1aCKUPuPlbDQOHOUhfxjSLQ==
X-Received: by 2002:a63:2ac4:: with SMTP id
 q187mr13709152pgq.370.1624086701254; 
 Sat, 19 Jun 2021 00:11:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t14sm11960512pgm.9.2021.06.19.00.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 00:11:40 -0700 (PDT)
Date: Sat, 19 Jun 2021 00:11:40 -0700 (PDT)
X-Google-Original-Date: Sat, 19 Jun 2021 00:11:37 PDT (-0700)
Subject: Re: [PATCH] riscv: dts: fu740: fix cache-controller interrupts
In-Reply-To: <CAEn-LTrcLL7EvdskX3+f_Youi0ApC8-0p6u8r8LpyATKCOKA9g@mail.gmail.com>
CC: david.abdurachmanov@sifive.com, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 greentime.hu@sifive.com, lorenzo.pieralisi@arm.com, 
 yash.shah@sifive.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: david.abdurachmanov@gmail.com
Message-ID: <mhng-a7cf1c8e-a740-43fb-bd41-c24a4e7c47d3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_001142_423009_27937C53 
X-CRM114-Status: GOOD (  42.13  )
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

On Tue, 15 Jun 2021 04:54:22 PDT (-0700), david.abdurachmanov@gmail.com wrote:
> On Sun, Jun 13, 2021 at 3:51 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> From: David Abdurachmanov <david.abdurachmanov@sifive.com>
>>
>> The order of interrupt numbers is incorrect.
>>
>> The order for FU740 is: DirError, DataError, DataFail, DirFail
>>
>> From SiFive FU740-C000 Manual:
>> 19 - L2 Cache DirError
>> 20 - L2 Cache DirFail
>> 21 - L2 Cache DataError
>> 22 - L2 Cache DataFail
>>
>> Signed-off-by: David Abdurachmanov <david.abdurachmanov@sifive.com>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>> Olof pointed me to
>> https://raw.githubusercontent.com/sifive/meta-sifive/2021.03/recipes-kernel/linux/files/unmatched/0009-riscv-dts-fu740-fix-cache-controller-interrupts.patch
>>
>> This appears necessary to make the FU740 function properly, but hasn't been
>> posted on the mailing lists.  Given the age I'm hoping it's just slipped
>> through the cracks somewhere, but I figured I'd send it out to give David a
>> chance to comment if there's a different plan.
>
> There are a bunch of stuff that need to be cleaned up and synced with
> U-Boot copy of DT for Unmatched.
>
> This patch is required to boot.

OK, I'm going to take it on fixes.  It seems this is an SOC issue while 
the others are board issues, and given that it's needed to boot I'd 
prefer to just take it.

> There are others patches that do:
> - Change compat string for CPUs to report U74MC instead of bullet0.

You guys should just pick one there, the naming scheme is pretty 
inconsistent between the various projects/IPs.  I don't really care 
which one you pick, though, and even though I generally consider DT to 
be ABI-stable it sounds like this one landed a bit prematurely so I'm OK 
changing it.

> - Change memory to 16GB from 8GB.

Are you sure there are no boards out in the wild with 8GB of RAM?  If 
there are then we should have a DT for them, but if they're only in the 
lab then I'm fine simplifying things and just having one of them.

> - Change regulator values to match what's in the Rev3 board.

OK, though again I'd like to know that there aren't any pre-rev3 boards 
in the wild.

> - Add PWM LEDs nodes.

Seems reasonable to me.

> - Add a gpio-poweroff node (this could change depending on what
> OpenSBI wants to do).

Maybe it's best to hold off on that until there's agreement?

> And most likely the "a00" part should go away from compat strings and
> filenames. "A00" was most likely a copy & paste from FU540 / Unleashed
> board. Regulator block probably could also go away from DT as Linux
> doesn't need to touch it, basically it just runs whatever is
> configured in OTP.
>
> I believe the current DT that landed was written for Rev1, but a few
> revisions happened afterwards. You can only buy Rev3 boards.
>
> I wonder if we should modify the existing DT file and rename it
> "hifive-unmatched.dts" + new compat strings to remove "A00".

This is one of those things I never understood: if there are revision 
numbers printed on the boards, then why is there another hidden revision 
underneath that's not indicated directly anywhere.  We had this same 
issue with the Unleashed, where there were a whole bunch of different 
boards all of which were revision A00.

If you're sure that none of these other boards made it into the wild 
then I'm fine dropping the A00, but if there are boards that won't work 
with this DT in the wild then we should have something for those.  I 
don't know (and don't really care that much about) the naming scheme, 
just that it's unique and that users can tell which flavor they have.

I have one of these, but I haven't opened the box.  Is there some way to 
tell which version I have?

>> ---
>>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
>> index 8eef82e4199f..abbb960f90a0 100644
>> --- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
>> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
>> @@ -273,7 +273,7 @@ ccache: cache-controller@2010000 {
>>                         cache-size = <2097152>;
>>                         cache-unified;
>>                         interrupt-parent = <&plic0>;
>> -                       interrupts = <19 20 21 22>;
>> +                       interrupts = <19 21 22 20>;
>>                         reg = <0x0 0x2010000 0x0 0x1000>;
>>                 };
>>                 gpio: gpio@10060000 {
>> --
>> 2.32.0.272.g935e593368-goog
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
