Return-Path: <SRS0=IH7i=JP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06FDC433B4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Apr 2021 03:27:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC19611AF
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Apr 2021 03:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DC19611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pT4Vw/pLqd6UwWcfKZEjjWAJVeVDsoE9M5jWQRHPpHg=; b=nJFB+2yPABeGu4eMPpItJT6q4
	UYn2E3lMDXvFkhbKk499aC+vyx4oF/o0nHfn0sIeiFyZib2QAComYBVyR7edMKMbFtXvWlHLCbnJY
	VxCDKRjPo3XyJl5L3OQjcimyVvrOLCbiaRLulIay2IyDQUe9JjbDVU+EQcqa5ER7UMyCTW7xWKfTc
	j4gA1NTI8lUogt9fltmkSppAaHK/0diIuDjoxWTw/INGAy3j4eVy0UXvcqGDpx0YqhYDdS4DUY32d
	enk5GKeixma+nAQKvs1RnRstUOCVqZdZqwZDF9ZubZ5eOyyXMs1WEPbu2fRe1YCdfxc1QGkjf5Mov
	Updny14lA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXy55-0071eu-9S; Sun, 18 Apr 2021 03:26:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXy52-0071cS-Oq
 for linux-riscv@desiato.infradead.org; Sun, 18 Apr 2021 03:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GhbECeGyzRtXiWbJRfZBM4VJiTtUc/ySzbQfVi5aXX4=; b=IupRIJXpnBOPQsknmH/rwJFn/S
 mi3ZmA8AwuydH+2n9Zlspfl8nFlwNfg+lDJ+wExWQtyUVRY/EjSgX2rxXs0+wGqpQUnZ3dwaA2nnn
 iSxdI68wlowSFFt2a6uRa+jXa4zoUXrdVwGgL7gBT/pUFb1dbpnmLzzodkwmvc1A4eojLBcCe97hD
 kbFc8b5R8GpfhWwRHSLEjGO++Ydi5ScaPDW9Rtmx3fZQ501FLJl4LB7MZq8r2GHYerHQ1fjlG3zxy
 P5bgHppNKAGyoivZR7cpyY2NDwTHYTRi46vtaFbXF3NRUUCIDG2fDFhA9OwtUVg7fdbAr40rCagbJ
 jjgCkUDQ==;
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXy4x-00AHrY-Sw
 for linux-riscv@lists.infradead.org; Sun, 18 Apr 2021 03:26:39 +0000
Received: by mail-il1-x133.google.com with SMTP id v13so10346175ilj.8
 for <linux-riscv@lists.infradead.org>; Sat, 17 Apr 2021 20:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GhbECeGyzRtXiWbJRfZBM4VJiTtUc/ySzbQfVi5aXX4=;
 b=OaVcxRUn6l0+mDaTiJsiWTF3rb7iInX+gn5zDxGEO29mlPe36A3kkXg48zAFhZxWIW
 Ib/F6bbebEosb+i1uNrGYnxTQxokkuXMw/xnWv8VsFkN0H7ZcIKatXdgzN8YWo9V9Zby
 AOsQ0KtkhYpNWf2lVek77gPSu1EaCtk9cH0Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GhbECeGyzRtXiWbJRfZBM4VJiTtUc/ySzbQfVi5aXX4=;
 b=TDnpyGetDo3DBwtSaFAVwhb4LVy5IpDM91oFugn8hdPxKqyHPaeKItWPEZFyYE/SpT
 oDLx7gKshAkgrNt1Yf7wIcb6xJJ+a1koPDlax/kpHeqg5FwN/mxb5w/lgIDSEMi6K/u/
 KHwyttPhlCjeBkcr4B62OtnEOM2TJmQWJK3RttkwOOrIduwL68NCYx9H+GJV3yV/6USi
 cpX1qwCDYVa5nkXHkfxB2nGf9QPjbeD3NNefCf55YL4PNhsg0EU5Gd8rN00Qy0E/2BWg
 wk7vJ8Pg/Rs4E4u9ef0/QPemDVAjNygd01aJ6m23GKQ2fR82QMiKpVvI3hyQR2cNjyjs
 SEzQ==
X-Gm-Message-State: AOAM531AgAZ+jTTugiaaFLMonN3qOhQhtDFWCHZ4zE/4pzrbGz48qqQl
 Wv5SlULgc+x+uKVdW9XQ/KNj70mLGE/LN6yftpVB
X-Google-Smtp-Source: ABdhPJwUwbhXCzMM5SpTGc47CRl0FHUrP2ttdwB337kADxHsLjfNM6cT2s2vx7YS95uvjnOGOHGVcMFtZexdnZrfnfE=
X-Received: by 2002:a05:6e02:12c4:: with SMTP id
 i4mr13129741ilm.79.1618716394108; 
 Sat, 17 Apr 2021 20:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210303200253.1827553-1-atish.patra@wdc.com>
 <mhng-13c067eb-0011-408d-83f4-2950c1e791fa@palmerdabbelt-glaptop>
In-Reply-To: <mhng-13c067eb-0011-408d-83f4-2950c1e791fa@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 17 Apr 2021 20:26:22 -0700
Message-ID: <CAOnJCUKtt3LF0zh6dKAAUtbCKsYCMby5TasA59fY2hpODX3vnQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Add Microchip PolarFire Soc Support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Atish Patra <Atish.Patra@wdc.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 bjorn@kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>, 
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_202636_104320_7CA82F1A 
X-CRM114-Status: GOOD (  32.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 29, 2021 at 9:17 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 03 Mar 2021 12:02:48 PST (-0800), Atish Patra wrote:
> > This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
> > It is rebased on v5.12-rc1 and depends on clock support.
> > Only MMC and ethernet drivers are enabled via this series.
> > The idea here is to add the foundational patches so that other drivers
> > can be added to on top of this. The device tree may change based on
> > feedback on bindings of individual driver support patches.
> >
> > This series has been tested on Qemu and Polar Fire Soc Icicle kit.
> > It depends on the updated clock-series[2] and macb fix[3].
> > The series is also tested by Lewis from Microchip.
> >
> > The series can also be found at.
> > https://github.com/atishp04/linux/tree/polarfire_support_upstream_v4
> >
> > [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
> > [2] https://www.spinics.net/lists/linux-clk/msg54579.html
> >
> > Changes from v3->v4:
> > 1. Fixed few DT specific issues.
> > 2. Rebased on top of new clock driver.
> > 3. SD card functionality is verified.
> >
> > Changes from v2->v3:
> > 1. Fixed a typo in dt binding.
> > 2. Included MAINTAINERS entry for PolarFire SoC.
> > 3. Improved the dts file by using lowercase clock names and keeping phy
> >    details in board specific dts file.
> >
> > Changes from v1->v2:
> > 1. Modified the DT to match the device tree in U-Boot.
> > 2. Added both eMMC & SDcard entries in DT. However, SD card is only enabled
> >    as it allows larger storage option for linux distros.
> >
> > Atish Patra (4):
> > RISC-V: Add Microchip PolarFire SoC kconfig option
> > dt-bindings: riscv: microchip: Add YAML documentation for the
> > PolarFire SoC
> > RISC-V: Initial DTS for Microchip ICICLE board
> > RISC-V: Enable Microchip PolarFire ICICLE SoC
> >
> > Conor Dooley (1):
> > MAINTAINERS: add microchip polarfire soc support
> >
> > .../devicetree/bindings/riscv/microchip.yaml  |  27 ++
> > MAINTAINERS                                   |   8 +
> > arch/riscv/Kconfig.socs                       |   7 +
> > arch/riscv/boot/dts/Makefile                  |   1 +
> > arch/riscv/boot/dts/microchip/Makefile        |   2 +
> > .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
> > .../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
> > arch/riscv/configs/defconfig                  |   4 +
> > 8 files changed, 450 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> > create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> > create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> > create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>
> I had this left in my inbox waiting for either some reviews to come in or a v2,
> but I don't see any.  Did I miss something?
>
Sorry for the late reply. I am on vacation until May. I think I saw
all the patches have already been reviewed.
Let me know if it is not the case.

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
