Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6946C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 20:14:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030B0229C5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 20:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030B0229C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3tel0DZrNYHKSuEz7s2x8AcozixxM2yD6Bg+zLAP0So=; b=Fn4zkxH3V+RODL4fUyzwNVRVd
	Zd6c8qcaymJRX8NG/FKeQJYrYC42hzLms2IjN8huRa4Khov+Jihd//pA/bnJxoyKESee2AGZKX+wf
	1rjcSdpl6UGHl5ic4cShvYebszSPhleU340hDC9a7UFxkYdDrubeRMZEQH9z6CUM13elxe+EdfM3K
	u3OLhLNljgZioVQOqj/Zq6CB2S/R7xo7+KIkeUbwYgupchF2jTECXVaiJ0K7yaSE8CCdLam7El+30
	VkkG8xw4bVZ6qyTaV2J0zAntDG2R4akwU5iJfJAWpvIdlqcv0PwYDANBS3P41JBhdn0jMAE5FxtFV
	cJTCIEx9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kro3Q-0005pR-62; Tue, 22 Dec 2020 20:14:44 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kro3M-0005oV-LB
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 20:14:42 +0000
Received: by mail-io1-xd33.google.com with SMTP id z136so13122576iof.3
 for <linux-riscv@lists.infradead.org>; Tue, 22 Dec 2020 12:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7zOf6F8ODgFcmacS9f6DCdrzJfrVz8BP88T2NFPCiVA=;
 b=cXF3QvfttDRIq6gJ4Wz3ZKQqCIAXSUZcQeXRHzebIehV4HKBFNWVNn6z1Ou6En9XWC
 pObVsIyeBEPxjyG0GERA2gzo+/ZsKhyr/3waLfWia8Uv4rjS210W9rXrPc+7hhfGEifD
 L0U/GtfZjNVxyBmr9EIZev92P+plFUGWBzWEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7zOf6F8ODgFcmacS9f6DCdrzJfrVz8BP88T2NFPCiVA=;
 b=drcoBSdBhvnCOBQQl+8DkU7h31PQMn9anYf2f+mKMNC0W5utbCqDP5guXZJjRTbmt6
 YPO9ZFSTNy21gniaLnTEh3RkSgGIigbrmGjgV4QGy/oenpXid6dApoutL6w9I9eTH+O/
 9sftlPL5dyYK9yfbOSQIhxv5H9+4GTFMMmn1DUsfiFnRW+xQsEGDAdHQ5ieEZwmEeMfE
 FE54H/tC4svrbrduYpy+sC0nlAyisYuQGxP70RvfM/wtcWEgVZZQ8sF1H8mccc5lLUTa
 kLoYcptRNPSFYF9s78P2uQOiI4AswzpzKIsv8459A40dK8weNmIZkRzfbprG3BDQTWRG
 UA+Q==
X-Gm-Message-State: AOAM5305orT4gAi7hcR2Yb5Pa0Oiu4BD5C1R2VYjhaHsOgCqPGTZST4O
 mdUukCeFaB4xJM1oslkg2ZYkpGo3K19y4+JQtyuW
X-Google-Smtp-Source: ABdhPJyUHJf84Lg2qSP3jMdGstvvHuPcN2/TySq54r/xcVNXu2cRD3MFNmcm4v52z1nN7Jo4djZ2OMIE3EEPlyzUtEI=
X-Received: by 2002:a6b:b74e:: with SMTP id h75mr19143399iof.0.1608668078357; 
 Tue, 22 Dec 2020 12:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <mhng-2a16d74b-c896-4ad0-9d02-87b3b09ee3be@palmerdabbelt-glaptop>
In-Reply-To: <mhng-2a16d74b-c896-4ad0-9d02-87b3b09ee3be@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Dec 2020 12:14:27 -0800
Message-ID: <CAOnJCUJ5UK3Do=uC0R2DVMNt6HmoJHKB1XXr8MkoeBYNzQHZrw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add Microchip PolarFire Soc Support
To: Daire McNamara <daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_151440_847143_14A11EFF 
X-CRM114-Status: GOOD (  31.84  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Anup Patel <Anup.Patel@wdc.com>,
 Cyril.Jean@microchip.com, Bin Meng <bin.meng@windriver.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Conor.Dooley@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Ivan.Griffin@microchip.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 21, 2020 at 7:19 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 04 Dec 2020 00:58:30 PST (-0800), Atish Patra wrote:
> > This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
> > It is rebased on v5.10-rc6 and depends on clock support.
> > Only MMC and ethernet drivers are enabled via this series.
> > The idea here is to add the foundational patches so that other drivers
> > can be added to on top of this. The device tree may change based on
> > feedback on bindings of individual driver support patches.
> >
> > This series has been tested on Qemu and Polar Fire Soc Icicle kit.
> > The following qemu series is necessary to test it on Qemu.
> >
> > The series can also be found at.
> > https://github.com/atishp04/linux/tree/polarfire_support_upstream_v3
> >
> > I noticed the latest version of mmc driver[2] hangs on the board with
> > the latest clock driver. That's why, I have tested with the old clock
> > driver available in the above github repo.
>
> IIRC the previous version was an RFC, but this is a PATCH.  I'd be generally
> happy to take it on for-next, but I don't want to merge something that doesn't
> boot and that I don't have any way to fix (I don't have one of the boards yet).
>

Fair enough. We can wait for clock patches to be merged before merging
this series.

> > [1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
> > [2] https://www.spinics.net/lists/devicetree/msg383626.html
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
> > .../devicetree/bindings/riscv/microchip.yaml  |  28 ++
> > MAINTAINERS                                   |   8 +
> > arch/riscv/Kconfig.socs                       |   7 +
> > arch/riscv/boot/dts/Makefile                  |   1 +
> > arch/riscv/boot/dts/microchip/Makefile        |   2 +
> > .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
> > .../boot/dts/microchip/microchip-mpfs.dtsi    | 331 ++++++++++++++++++
> > arch/riscv/configs/defconfig                  |   4 +
> > 8 files changed, 453 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> > create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> > create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> > create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

@Daire McNamara Do you have a v2 of the clock patch series that works
with the latest upstream.

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
