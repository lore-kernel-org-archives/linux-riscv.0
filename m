Return-Path: <SRS0=TnxY=7C=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D678C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 May 2020 01:15:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AC1720708
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 May 2020 01:15:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xv8u5pJt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="de/dkpon"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AC1720708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2epbnXt/qyxg2wIAsJNGGs3c+mHSSqu57LJYIjAlUQ=; b=Xv8u5pJt2XJMK2
	+pfI1YNIjAZPS13lJ9PZU3VbysRgNVKXpeZy2L+FSy29G74nBJXtrO6QiYdSyDcjzVKDMad7AWxXc
	hWRscKut1/eQYKjqftmJC3DgFO7MFAUu4CaRdsDEnnpr7tpCTtsQy7y7FZgEZFOgecSrSX6XwNgvx
	A/SeY889GLW308edWcXurEyf2J2awl7Fn+YKryJ9uVuf/FVGw2b5mIs0JLy5sbu4g3AluMfigBvQn
	Kqm+gq+RW7s5Kd8Le7J1isF3T9QlGGZJ/Dh6rcZALBHS982UR0fIJt3q4YtVRHP0P/bGecHKOYPbv
	AMx4FrsLUcryoK0FWekg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbDK1-0003Y3-5s; Wed, 20 May 2020 01:15:01 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbDJy-0003XW-RE
 for linux-riscv@lists.infradead.org; Wed, 20 May 2020 01:15:00 +0000
Received: by mail-wm1-x342.google.com with SMTP id m185so1172733wme.3
 for <linux-riscv@lists.infradead.org>; Tue, 19 May 2020 18:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K2epbnXt/qyxg2wIAsJNGGs3c+mHSSqu57LJYIjAlUQ=;
 b=de/dkponQWsvYBvKCdidTRLToaZF/S4ImkV+j5yM7b5we4hjNsoBbOOxWvWfz3IWvA
 FJCUumA3Kj89syDqZc7wZ9sh/MUXIlPPmguAmU1K+zj00v+qlAlo/cjR0QxD0gFY/EM4
 4asDfHBJgn50U4H8omWGscPD4nAlPPjRKB8k1iCfPRlJ+7FK2Qwh2euSS7REw1TPJYn4
 HhVfefiEi3jeXEvDibQTRez0TNYhoK5gYQcTlatNpc7njIHV1gzeFiMLm4k5pwV9YTvh
 787w1k8u1Se4Cwz1SkZhSY07T5DNe5yvU0ozm+7aHFblu0OQQ+CQNduk9tpwJQLPy5eC
 YsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K2epbnXt/qyxg2wIAsJNGGs3c+mHSSqu57LJYIjAlUQ=;
 b=uPrWuV0ZUwEHrjOdXocQdJHJgCwqfhwyGMew0RBiLQ+fv/oQJDjq77iiDZiWGNDj6F
 XiHFDfMHjpl1njM0vqdSPeQk4SXls0ZNp3kv6a0NoZVc6iRvIdoDTidmzMYP9SYGRSl3
 BVnhT7c6z8g7z6ck3R+uYnCFVwSyoHjYKoI2eam/oZETbxz5cde/g0fZ9XghlI0rzqUn
 OAyX3vJUAKyFp6/G8zyeEy3U4NvuVRHLLNDUvcrNaPilpmElb/z+YltViqWzk0nYipji
 cwWKY3tonda6S4Oyve8KMxYNzrFV1zYP2Id9oqCQN3sv7ZHc5O4bJllX6K7GEiV2CiMn
 kmqw==
X-Gm-Message-State: AOAM533xCL/BMBjnxTFWh0zzFQwr9k2teoJhwG4S7AA3NWfuJQzYmr0b
 9BQ4q9fmLojn1dqdElGbpK201cxhnyimGltbx4HSVA==
X-Google-Smtp-Source: ABdhPJyzl/XxyPdwYt8l0bZn6VCPsb1ht7zSdC7tE0o4uwIM6zuGV7Up4G3KICdfOwg0Y2Rrxga+Y1opJ1QIChKufz8=
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr1988043wmh.157.1589937296422; 
 Tue, 19 May 2020 18:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-0c491e9e-41fd-4f76-a048-55c03d9359f0@palmerdabbelt-glaptop1>
 <66121f9a-48f3-d3a5-7c96-d71397e12aed@linaro.org>
 <0bc3eb36-7b9d-7c86-130c-68b566e85c10@huawei.com>
 <e1916079-c209-bfad-6b0c-ccfb2e136ca4@linaro.org>
 <29dc112e-d8c2-2749-7f5d-7c0c19aa9092@huawei.com>
 <8c5ecbd3-c23a-ccd4-b5d8-2e7d2bd10699@linaro.org>
In-Reply-To: <8c5ecbd3-c23a-ccd4-b5d8-2e7d2bd10699@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 May 2020 06:44:44 +0530
Message-ID: <CAAhSdy2wsnkYMLpT1_2OAjr334t6dAy9LCPNefC=h+aPuRqFrg@mail.gmail.com>
Subject: Re: [PATCH 09/10] timer-riscv: Fix undefined riscv_time_val
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_181458_941397_AC517C17 
X-CRM114-Status: GOOD (  21.58  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 hulkci@huawei.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 19, 2020 at 7:21 PM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On 19/05/2020 14:39, Kefeng Wang wrote:
> >
> > On 2020/5/19 4:23, Daniel Lezcano wrote:
> >> Hi Kefeng,
> >>
> >> On 18/05/2020 17:40, Kefeng Wang wrote:
> >>> On 2020/5/18 22:09, Daniel Lezcano wrote:
> >>>> On 13/05/2020 23:14, Palmer Dabbelt wrote:
> >>>>> On Sun, 10 May 2020 19:20:00 PDT (-0700), wangkefeng.wang@huawei.co=
m
> >>>>> wrote:
> >>>>>> ERROR: modpost: "riscv_time_val" [crypto/tcrypt.ko] undefined!
> >>>>>>
> >>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
> >>>>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> >>>>>> ---
> >>>>>>    drivers/clocksource/timer-riscv.c | 1 +
> >>>>>>    1 file changed, 1 insertion(+)
> >>>>>>
> >>>>>> diff --git a/drivers/clocksource/timer-riscv.c
> >>>>>> b/drivers/clocksource/timer-riscv.c
> >>>>>> index c4f15c4068c0..071b8c144027 100644
> >>>>>> --- a/drivers/clocksource/timer-riscv.c
> >>>>>> +++ b/drivers/clocksource/timer-riscv.c
> >>>>>> @@ -19,6 +19,7 @@
> >>>>>>
> >>>>>>    u64 __iomem *riscv_time_cmp;
> >>>>>>    u64 __iomem *riscv_time_val;
> >>>>>> +EXPORT_SYMBOL(riscv_time_val);
> >>>>>>
> >>>>>>    static inline void mmio_set_timer(u64 val)
> >>>>>>    {
> >>>>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> >>>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> >>>>>
> >>>>> Adding the clocksource maintainers.  Let me know if you want this
> >>>>> through my
> >>>>> tree, I'm assuming you want it through your tree.
> >>>> How can we end up by an export symbol here ?!
> >>> Hi Danile,
> >> s/Danile/Daniel/
> > Sorry for typing error.
> >>
> >>> Found this build error when CONFIG_RISCV_M_MODE=3Dy and CONFIG_RISCV_=
SBI
> >>> is not,
> >>>
> >>> see patch "4f9bbcefa142 riscv: add support for MMIO access to the tim=
er
> >>> registers"
> >> Thanks for the pointer.
> >>
> >> The question still remains, how do we end up with this EXPORT_SYMBOL?
> >>
> >> There is something wrong if the fix is an EXPORT_SYMBOL for a global
> >> variable.
> >
> > Not very clear, there are some global variable( eg, acpi_disabled,
> > memstart_addr in arm64,) is exported by EXPORT_SYMBOL,  do you mean tha=
t
> > export riscv_time_val is wrong way?
>
> I do not maintain acpi neither arm64.mm.
>
> AFAICT, riscv_time_val is globally declared in
> drivers/clocksource/timer-riscv.c
>
> The driver does not use this variable at all. Then there is a readl on
> it in the header file arch/riscv/include/asm/timex.h
>
> And finally it is initialized in arch/riscv/kernel/clint.c
>
> Same thing for riscv_time_cmp.
>
> The correct fix is to initialize the variables in the place where they
> belong to (drivers/clocksource/timer-riscv.c), create a function to read
> their content and export-symbol-gpl the function.

I agree with Daniel. Exporting riscv_time_val is a temporary fix.

The problem is timer-riscv.c is pretty convoluted right now. It is
implementing two different clocksources and clockevents in one-place.

I think we need two separate drivers for RISC-V world.

1. timer-riscv: This for regular S-mode kernel with MMU. The clocksource
will use TIME CSR and the clockevent device will use SBI calls.

2. timer-clint: This for M-mode kernel without MMU (or NoMMU kernel).
The clocksource will use MMIO counter for clocksource and the
clockevent device will use MMIO compare registers.

I will send a patch to have a separate timer-clint driver under
drivers/clocksource. (@Daniel, I hope you will be fine with this?)

Regards,
Anup

>
>
> --
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for AR=
M SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

