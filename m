Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7B7C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:38:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB22613CC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB22613CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=sErWMLHntxYp+AFtBlLJIkBk6CWj5O6xZAsqmvOswuY=; b=if+O/kP3Uo8VuK5p6cic4L1hd
	ahHwmWMUM7LnAFnJZQcjvrlI7trg8sGcdUpgkZ/65JzbbXfeUuXQJpg7SXh1xguYbY9lvV52NEcJL
	/4pB3GXYf06SoM+EkmNrqLHEV+1spCFO0jVSyWmGvAAibMQGHq9WWFmr+cppM5cRBfS15wJb7G7Wt
	QFnSIMvytiR3hilZFAfkg/F2OiddOamDGuccR3QhPaC65J7GQ1dpjENtvNDPEK/o4KazqjOcrEgIS
	zYid3Gfb08WsxFPjhJZCojdt/i/a+yehiRaAiaYK3um3D4T+5naKNCmD9lVrVuNfOd1arg7nSAtVO
	FLZpqgvPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZklN-000I8m-Vz; Fri, 23 Apr 2021 01:37:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZklI-000I7U-KX
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 01:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=pY+RtdgfTG8Ga9unUypOjnGgrTmTrZHcFsVJpQMU7j8=; b=O+ytEF7YWH7ZQCW8aIi1+ZUCIk
 nYSDSGNk1dBEPbxWPqjiM6kLeBz7LJNkeH21OEMvMpIGdZRTeZj6fwaG5/AfJEhLdy6QA8YhtLaLm
 HVdIMHR4SIgJ1ARLOYpgsaEz78ic+zzoIKQNe4zQ0pyRM6xDCRHUrphPGVwjcB/7mnvztHBNfvlhB
 0/bj8I/5JSTZ6u9Bczd2OjAY9SFMPU/0DazVyLZN1y6IdKr713T/Lz3bn4ExDCeqUoCl4O+BSBweV
 tEEx5SE8STrLCKh7MYrAugMOWooeifqDYF2DkEYwikUxBBlPv3/3od94ORbRMOXu0v+ndbKDCBZAZ
 bma05NxA==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZklF-00E5Nj-M7
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 01:37:39 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so383762pja.5
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 18:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pY+RtdgfTG8Ga9unUypOjnGgrTmTrZHcFsVJpQMU7j8=;
 b=RdWLFoBSnlIyDblw/fEjgMJAUDmc5V0f1F8RNrCd6bfvjMmgfbjWaizeyu5DniDxVQ
 9X2Uuz74Y2MtyFgznRAlT7rG7Xg3TKE8cev3PU4hdxRT9Dbb5g7GmBHuTzAgl/AAOPxp
 URNfiHZ11EYUca+tOJHzPMnqhUE9RngD7eH/Ag4QnA3/NkKkQ+6HHdeIz6QQLjp9PVUl
 V9B8YyvoLQj5XoA9jFFNPsePeuMvFh7S2UfHnPy/hYfkktN8wLhCnhAveNN2dQjeH6mb
 uIeo2etuZubn2L/Uyq+8dhvRhGf/ArSH2TEhcmIsqBCrY3EjPlS1yHt1q0HUCir6m3A0
 a2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pY+RtdgfTG8Ga9unUypOjnGgrTmTrZHcFsVJpQMU7j8=;
 b=FUFHGG1zzylg0MT4B7fWCITIXgm60iSCliMaKjRW5dbd/b2vJAoFEN2OcH3kQhVlrd
 0lD/V0i7G8nvz08vS+SwNwZUK67cBjiZpwyLdXrG1lMOMTDJzqazQNvkwW5uUnVUyAYI
 nHpYmzbfesTXnix3Xfxcrl5ZALfCZpwyceF8mIX+EF8qwkOCXfnquiaH80YP0wmcWCMX
 DnNp74eMay6g02HT82eequcKFQjF5VWdWYDlwagNobNB+ieAaRSVpZQ6K+Aqoihl30z1
 BiJjZY680iubfrL22VZf5vqIOPsBia13O7IAsooXU+dkv4nrqEhtkC6yeueKNFI8huQO
 0CIg==
X-Gm-Message-State: AOAM533aiT8GRPlvBJJJ+8JC3YFtzlNqPPkjMfGCNa31qdxbOtTlP1+m
 J1YR4y4RNbTXuNcBGu/MQhwqJQ==
X-Google-Smtp-Source: ABdhPJyeO81PpFTswF7HZ4KI8ML/nCiuE9HOmt0WmeZKYgnVJ8QqP3+Yko2ukzP9L0suofBxpJEYHA==
X-Received: by 2002:a17:90a:a789:: with SMTP id
 f9mr3113040pjq.192.1619141856769; 
 Thu, 22 Apr 2021 18:37:36 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g1sm3351627pgi.64.2021.04.22.18.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 18:37:36 -0700 (PDT)
Date: Thu, 22 Apr 2021 18:37:36 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 18:37:34 PDT (-0700)
Subject: Re: [PATCH v4 0/5] Add Microchip PolarFire Soc Support
In-Reply-To: <CAOnJCUKvyDPO55QtPXDhCMKYBb70WpR01jM1F=ddA=pmFJo5_Q@mail.gmail.com>
CC: Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, 
 bjorn@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
 Conor.Dooley@microchip.com, daire.mcnamara@microchip.com, 
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-8a0f200a-fc9e-4e6b-a881-433a024e8b69@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_183737_746263_8134D1B3 
X-CRM114-Status: GOOD (  39.86  )
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

On Thu, 22 Apr 2021 15:33:39 PDT (-0700), atishp@atishpatra.org wrote:
> On Sat, Apr 17, 2021 at 8:26 PM Atish Patra <atishp@atishpatra.org> wrote:
>>
>> On Mon, Mar 29, 2021 at 9:17 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >
>> > On Wed, 03 Mar 2021 12:02:48 PST (-0800), Atish Patra wrote:
>> > > This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
>> > > It is rebased on v5.12-rc1 and depends on clock support.
>> > > Only MMC and ethernet drivers are enabled via this series.
>> > > The idea here is to add the foundational patches so that other drivers
>> > > can be added to on top of this. The device tree may change based on
>> > > feedback on bindings of individual driver support patches.
>> > >
>> > > This series has been tested on Qemu and Polar Fire Soc Icicle kit.
>> > > It depends on the updated clock-series[2] and macb fix[3].
>> > > The series is also tested by Lewis from Microchip.
>> > >
>> > > The series can also be found at.
>> > > https://github.com/atishp04/linux/tree/polarfire_support_upstream_v4
>> > >
>> > > [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
>> > > [2] https://www.spinics.net/lists/linux-clk/msg54579.html
>> > >
>> > > Changes from v3->v4:
>> > > 1. Fixed few DT specific issues.
>> > > 2. Rebased on top of new clock driver.
>> > > 3. SD card functionality is verified.
>> > >
>> > > Changes from v2->v3:
>> > > 1. Fixed a typo in dt binding.
>> > > 2. Included MAINTAINERS entry for PolarFire SoC.
>> > > 3. Improved the dts file by using lowercase clock names and keeping phy
>> > >    details in board specific dts file.
>> > >
>> > > Changes from v1->v2:
>> > > 1. Modified the DT to match the device tree in U-Boot.
>> > > 2. Added both eMMC & SDcard entries in DT. However, SD card is only enabled
>> > >    as it allows larger storage option for linux distros.
>> > >
>> > > Atish Patra (4):
>> > > RISC-V: Add Microchip PolarFire SoC kconfig option
>> > > dt-bindings: riscv: microchip: Add YAML documentation for the
>> > > PolarFire SoC
>> > > RISC-V: Initial DTS for Microchip ICICLE board
>> > > RISC-V: Enable Microchip PolarFire ICICLE SoC
>> > >
>> > > Conor Dooley (1):
>> > > MAINTAINERS: add microchip polarfire soc support
>> > >
>> > > .../devicetree/bindings/riscv/microchip.yaml  |  27 ++
>> > > MAINTAINERS                                   |   8 +
>> > > arch/riscv/Kconfig.socs                       |   7 +
>> > > arch/riscv/boot/dts/Makefile                  |   1 +
>> > > arch/riscv/boot/dts/microchip/Makefile        |   2 +
>> > > .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>> > > .../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
>> > > arch/riscv/configs/defconfig                  |   4 +
>> > > 8 files changed, 450 insertions(+)
>> > > create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
>> > > create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>> > > create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> > > create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> >
>> > I had this left in my inbox waiting for either some reviews to come in or a v2,
>> > but I don't see any.  Did I miss something?
>> >
>> Sorry for the late reply. I am on vacation until May. I think I saw
>> all the patches have already been reviewed.
>> Let me know if it is not the case.
>>
> I cross checked and all the patches are reviewed-by.
> @palmer: Is it possible to take this series for 5.13 MW ?

I still don't see any reviews for the mailbox driver, did it just get 
lost on the way to me?

>
>> > _______________________________________________
>> > linux-riscv mailing list
>> > linux-riscv@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>>
>>
>> --
>> Regards,
>> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
