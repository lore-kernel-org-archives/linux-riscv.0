Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29209C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 03:56:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C43264F13
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 03:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C43264F13
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8+BsgArDPOBCc3ZBRtCvHIbT8e+MRoJ3f8mLMFfLfDQ=; b=y2s6hsTak7dhI3GXAwrBwDQkP
	KORgiRZEIs8Je1nt69Nwj1o7RYNhrTGCF1touxnFbfw6D9CXATTWLOurrKsILKNyhLQ7Fxv7HU1Ev
	UTB/OUu05Cw9VskscbRPUOCm4A5hnITnEQyc6j7yl1CStyCbS3DUcPAMMTuHMo2PtHZF80P7eV8R0
	oJStJOZaGPxN0vXnB3OF16T1x6mtg6uHW60LFuSxrDYJrL+R1rt0xAweYqmXvSnwBwyFVu93jWeNi
	ftvg6VLeNRvsKyc87z2gFxJ/i6VwJaJ7DdPRAWS5pqGHN82KVpUtWPJp4otr17WXKbH+HD18PG9ja
	42/3qRSyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFqiG-00024k-28; Sat, 27 Feb 2021 03:56:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFqiC-00024L-Um
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 03:56:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id 7so10494553wrz.0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 19:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gFUEweW7YJBzI3ekrNG7roS8iZCSvnRTwYDpnG7vQuk=;
 b=pM6I4h2mHDT+CVmAC7GmP/X2W0FuZsmcB5ImCodcFLJ3mUwrxW2fFgsx/xtxPQ/xrw
 h3spGoI3oz7Hnrlakjx5bEAhUtOc1+8Xlv+H4GKMRbpq/8/GsbWrbu2Zp3hXjw0zOClM
 0XsU6nkxoH878uV1xUw5r2nrVuYbcYAp6zOEEa6TRmYOOWOOo0vw8ImBUjIH6JPtBYy8
 KHO+/osA1p4KNn78IS81sOVunLWw/oqZ/5XZUBKuXQcvk6JHl7bSo7L4S5QQtv8w3YbS
 u0DqvMkO8OAXHKTyEdI5ceDq1mtlk1Ov2Ktqeu7+6ZRPjm9GzEd0Q4dVoBIDjM5NYCVn
 y2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gFUEweW7YJBzI3ekrNG7roS8iZCSvnRTwYDpnG7vQuk=;
 b=cynLpNIlxd+VloTVIe4KmRpmIqx6kKBWA9CqBZmnQlkNaGyg6G5LxuT/t4/VAD45Ie
 jE04HyzbkA2+mVX0eTf5qH6uG0XhsFkYBTwy1as7ilPLnTixv1nagS0B4+NUONQBpggS
 eKHHoe2lcUKPgCmfB1K4PEs95HyiODwJcR8BicMlpt/HK1CfL0YZGhz5hRIZFC3qoxQP
 7pv0cPmd/g6k8lPAK1FWVupK7vXjILNxaizVohJwJ6zXd3o10mfshSFmWwTdPCw/jW81
 PMUNPPEXmnf3fBJleOvCyA9S7c8r53Ynx+as83hr5aBkMmzoY2I/bjmQg/reV+yTCJPQ
 jlig==
X-Gm-Message-State: AOAM531Z8wDKeEOP+OHN+29dlDr1QBvdwgpvqcSBb7d8REUqGFWx0Dd3
 9emLB6lokyMUCVQ4pbNVqBlFEcrORR9f98WrXNdSnA==
X-Google-Smtp-Source: ABdhPJxYldVHcYvW8MTjwC5dmIQbJsXoKjlbP43ahrwfoDnEWt24PI0rkJ+yme5V8zhe4KF2IaCsacby0jDa5KFAB5o=
X-Received: by 2002:a5d:5109:: with SMTP id s9mr6293250wrt.325.1614398169457; 
 Fri, 26 Feb 2021 19:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20210209054620.25005-1-anup.patel@wdc.com>
 <mhng-ae92ee05-1177-4e83-9385-1e513e4883d1@palmerdabbelt-glaptop>
In-Reply-To: <mhng-ae92ee05-1177-4e83-9385-1e513e4883d1@palmerdabbelt-glaptop>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 27 Feb 2021 09:25:57 +0530
Message-ID: <CAAhSdy0ZJF2uGzYDGxuhbR831GJtyRorfjAMbU8CtJ=0twiZig@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Enable CPU Hotplug in defconfigs
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_225613_131397_39BE1D89 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Fri, Feb 19, 2021 at 12:45 PM Palmer Dabbelt
<palmerdabbelt@google.com> wrote:
>
> On Mon, 08 Feb 2021 21:46:20 PST (-0800), Anup Patel wrote:
> > The CPU hotplug support has been tested on QEMU, Spike, and SiFive
> > Unleashed so let's enable it by default in RV32 and RV64 defconfigs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/configs/defconfig      | 1 +
> >  arch/riscv/configs/rv32_defconfig | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 8c3d1e451703..6c0625aa96c7 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -17,6 +17,7 @@ CONFIG_BPF_SYSCALL=y
> >  CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_VIRT=y
> >  CONFIG_SMP=y
> > +CONFIG_HOTPLUG_CPU=y
> >  CONFIG_JUMP_LABEL=y
> >  CONFIG_MODULES=y
> >  CONFIG_MODULE_UNLOAD=y
> > diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> > index 2c2cda6cc1c5..8dd02b842fef 100644
> > --- a/arch/riscv/configs/rv32_defconfig
> > +++ b/arch/riscv/configs/rv32_defconfig
> > @@ -18,6 +18,7 @@ CONFIG_SOC_SIFIVE=y
> >  CONFIG_SOC_VIRT=y
> >  CONFIG_ARCH_RV32I=y
> >  CONFIG_SMP=y
> > +CONFIG_HOTPLUG_CPU=y
> >  CONFIG_JUMP_LABEL=y
> >  CONFIG_MODULES=y
> >  CONFIG_MODULE_UNLOAD=y
>
> Thanks, this is on for-next.

This patch was missed in your PR for Linux-5.12-rc1

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
