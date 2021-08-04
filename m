Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A145DC4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 04:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4240C6056C
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 04:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4240C6056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=O7rYrGRRxC71AGtqYUmm/7RGaJWbKPMeNLoGykwAjLs=; b=f9sTTQMlfTbBOSJh/4jWfIWoVc
	SfY5Cs/Mnoe8TyoiyWdIpWqhIUIM3R5YTpv83PDKFKEBW9FnmVRjG9mGJTce8fDDHZDUZtg2YMCGQ
	bPKH8fqfYCene8JFDZY717glqpVFwOV/irLFTaQPvLs7X67VWJvtu+o3jcCdliFrOSmWQtu+SnXDB
	on/W2SFcTdTsnfKhVDaQ5rJy5MIjzWfzh4GiARf57SQtCeFRrAwZzh0tSjyM/SVBijI7L7B9kXg1G
	2tPtR1p3AZLma1Hl0pp9oxuwmX5DJLv+CRhzPvhpfG0VyYR6SxaXjhc9QPEBbiwsd8g8OKzgjRFcZ
	/09y4JTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB8Mc-004kAM-2C; Wed, 04 Aug 2021 04:18:42 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB8MZ-004k9a-Kj
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 04:18:40 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so4632909pjn.1
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 21:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=AVBDmbZxIiSB+JvUtCo7LKbGoRxIowV1K44hTYKQFcw=;
 b=Rn6RWWdeegjUJZwrfChQJszAOm8q4mGdqCPBrVnKncqPgLdOvKlG9j3WHQAKSCnhlX
 +MmfROqx+XxNn9wIzmHzcAEYSFP62wd8XeM0ijkVFlhVRuSMSIjQ9WiytmpWSVjOZoMJ
 gNcWvUAn/34VN3zzy+Zv+w5wCC8zHFhGme1m2Tmc6B7nA7H5Or56jj3D71T8dHGdQLSA
 eqTIzZljxmrCYbo3iM7HC7uASeVSxtmEXvJZB9wT4fiTlPSv9PgtXiEeRHOhaZLrKG+E
 1ri/uC4WIBmnA08OwWUsCX/AtFBCij2g2k/dNoLM5P+xSAqwe3CF6oxUFRODYEugarzt
 l0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=AVBDmbZxIiSB+JvUtCo7LKbGoRxIowV1K44hTYKQFcw=;
 b=AIfxtSSwsI3bwe8m7Y4EmQ+5/h077wTIXIVqMtieN4q048mKk95perhSkz2FDyuDEc
 d/9QXR8zV/KVHUzHi60vk3K8Eo4cTPd4MaaL5yxRz/1oVDEAkBj5DushrqirHq4puoqz
 2nq5dOG+qRiTmUafm1dkvx18PjJ4l01NltNEGQDkUZippTUOCrlDQMIEmYsySzwgu4Uq
 K6TeGTR9bLUIcevCQdp/fyT4SFVk8hjQ+atz3dFmAaM/vfsgzc08mhg/38i+eUfpQrH6
 lwV4OuFmo+d6mSRCzkyXO5I+gWTO69NVsEcOycNDM7j1aZmhHReFmYhsJpeb/3QtZzpm
 n02Q==
X-Gm-Message-State: AOAM532yUZSUpk47T7kKzoAI8k8iFqYTLzf01lG5xSixq+jSWRCW2cUC
 hsgu3LurQBw2kCYFgvXHkSseIA==
X-Google-Smtp-Source: ABdhPJybzW1336H4eQQJ/i9ieuJkpt9rQoV9Ju4Z17xmKuAHpCDCdw5bcgy8r+hMXLrCTz+zHQwWqg==
X-Received: by 2002:a17:90b:3b83:: with SMTP id
 pc3mr7744055pjb.42.1628050716835; 
 Tue, 03 Aug 2021 21:18:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k25sm754679pfa.213.2021.08.03.21.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 21:18:36 -0700 (PDT)
Date: Tue, 03 Aug 2021 21:18:36 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Aug 2021 21:18:34 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: dts: microchip: Add ethernet0 to the aliases
 node
In-Reply-To: <CAEUhbmUkuKd7itzvQyzrYeqfUQv6LCqkXDsO=yufQppDBceLQQ@mail.gmail.com>
CC: geert@linux-m68k.org, lewis.hanly@microchip.com,
 Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, bin.meng@windriver.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-e1c39f7c-9667-4711-b2fc-0875cd0695a9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_211839_722186_F120D34C 
X-CRM114-Status: GOOD (  23.22  )
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

On Tue, 03 Aug 2021 20:55:56 PDT (-0700), bmeng.cn@gmail.com wrote:
> On Wed, Aug 4, 2021 at 11:55 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Fri, 16 Jul 2021 04:34:02 PDT (-0700), geert@linux-m68k.org wrote:
>> > Hi Bin,
>> >
>> > On Fri, Jul 16, 2021 at 12:14 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >> On Fri, Jul 16, 2021 at 5:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> >> > On Fri, Jul 2, 2021 at 3:44 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>> >> > > --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> >> > > +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> >> > > @@ -9,6 +9,10 @@ / {
>> >> > >         model = "Microchip MPFS Icicle Kit";
>> >> > >         compatible = "microchip,mpfs-icicle-kit";
>> >> > >
>> >> > > +       aliases {
>> >> > > +               ethernet0 = &emac1;
>> >> > > +       };
>> >> > > +
>> >> > >         chosen {
>> >> > >         };
>> >> >
>> >> > This should be added to the board DTS (microchip-mpfs-icicle-kit.dts)
>> >> > instead.
>> >>
>> >> I was wondering the same thing before doing this, but when I checked
>> >> all other DTS in arch/riscv/boot I found the aliases node is put in
>> >> the SoC dtsi file instead of the board on so I think that's the
>> >> convention.
>> >
>> > The numbering of the aliases is supposed to match the labels on the
>> > board, hence it is board-specific, not SoC-specific.
>> >
>> > Gr{oetje,eeting}s,
>> >
>> >                         Geert
>>
>> I don't see a v2 of this.
>
> Will send v2 soon.

Thanks.  I'm assuming you're going to send both patches.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
