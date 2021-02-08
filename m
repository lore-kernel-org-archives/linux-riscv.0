Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92861C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 20:00:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB8C64E7A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 20:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB8C64E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uDl/FnwAJKEEv6xyOuXd1AsQ5xfLiQmgJryjcTODxT0=; b=PQhvmutpb3ososqkuVvGku7of
	CrSLJCb2RAkiKhuaUrxnGct0d3ZO+aKIb91LAokoD7fgGAAr5EmU4N7r10p8AoAEIY/3WpVfNJn8s
	BS6/Opk4j06kYo4SNqPV+wUFvxwVc4cMlY85Yj80zTIF9/WH7ArRPe1y+QKBX5jc4om0wdcweumJ+
	HQ/vSCQgNMEv/zaXTzc08mYx0tMRzNKUAVFm1JVoB9VUMiTIR/i/AdKCvrZlaxUxUbqePwyQ9+oL+
	eqHy7hXq0aSxHtEq3gv0jlo0SEQ49tG3SWoybiKKFe+ymOK/NB54HsKtfi7pyDoKv8tHJzHtjOfzV
	Au4atcBaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Ci8-0001jD-7P; Mon, 08 Feb 2021 20:00:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Ci5-0001ii-HL
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 20:00:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C6AF64EC2
 for <linux-riscv@lists.infradead.org>; Mon,  8 Feb 2021 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612814436;
 bh=nw5cx9R2dyXB0g7HMXdaZI25yvlYlTnfp4TqOf/KTu0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=skxU6r4hj2UW+Ln8wABqwJOsauM5oo4IK2QjQ8ND0nfSmeVTP9sCNpthCzv+VmcNq
 nA9k4lRt24j+si2kDptPjgZG9mIxRM3dcfHrcf1Y/qOlX6RQAYLnK1u/iSr7HoSmt5
 huSvPRpBKZq8wKhZk1GUffoAV0h3LvMo31w9NHaFa+r514jJl4NDk74bzOKN9ES8XI
 AiBqLmN8mmL9rwmhR8OnGgaKRSTaaKOnlqM6fdGG/HGN8m+YSl1dCockFolsPckNL3
 FKY7NAwxFZYjAvO7CKb6BORxwh95wHpVqdNutMRburqnggm82CwnYRj3nY0QD/KIH0
 bay3KKdx7fdBA==
Received: by mail-ej1-f44.google.com with SMTP id f14so27187327ejc.8
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 12:00:36 -0800 (PST)
X-Gm-Message-State: AOAM530liD/dPYtcvOknVMhILW+kX30bye/PORrqjycwXZVjSrkFS04f
 53YA2PW2sA8Jcnmx2VopzotM0PRudq11hnzK3A==
X-Google-Smtp-Source: ABdhPJwKUf124j8Q1eVEAfFwHApYDJlBFnTiwiC8ZoTuxPtOH1bmWFik979G2hwiVAZMbJnvocgRPGdcn9wmwZHoBYc=
X-Received: by 2002:a17:906:fca1:: with SMTP id
 qw1mr17484103ejb.130.1612814434775; 
 Mon, 08 Feb 2021 12:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-10-damien.lemoal@wdc.com>
 <20210205202505.GA3625674@robh.at.kernel.org>
 <aab05bea310fbdbac38990656647dd0fbf3c8323.camel@wdc.com>
In-Reply-To: <aab05bea310fbdbac38990656647dd0fbf3c8323.camel@wdc.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Feb 2021 14:00:21 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLbMbMx3TLf+CPG-MdimHTz2sdzgQdmmuQkLfnsTJQAvQ@mail.gmail.com>
Message-ID: <CAL_JsqLbMbMx3TLf+CPG-MdimHTz2sdzgQdmmuQkLfnsTJQAvQ@mail.gmail.com>
Subject: Re: [PATCH v16 09/16] riscv: Update Canaan Kendryte K210 device tree
To: Damien Le Moal <Damien.LeMoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_150037_768283_C2E3BB62 
X-CRM114-Status: GOOD (  21.42  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 5, 2021 at 6:13 PM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
>
> On Fri, 2021-02-05 at 14:25 -0600, Rob Herring wrote:
> [...]
> > > +                   otp0: nvmem@50420000 {
> > > +                           #address-cells = <1>;
> > > +                           #size-cells = <1>;
> > > +                           compatible = "canaan,k210-otp";
> > > +                           reg = <0x50420000 0x100>,
> > > +                                 <0x88000000 0x20000>;
> > > +                           reg-names = "reg", "mem";
> > > +                           clocks = <&sysclk K210_CLK_ROM>;
> > > +                           resets = <&sysrst K210_RST_ROM>;
> > > +                           read-only;
> > > +                           status = "disabled";
> >
> > Your disabled nodes seem a bit excessive. A device should really only be
> > disabled if it's a board level decision to use or not. I'd assume the
> > OTP is always there and usable.
>
> Please see below.
>
> >
> > > +
> > > +                           /* Bootloader */
> > > +                           firmware@00000 {
> >
> > Drop leading 0s.
> >
> > Is this memory mapped? If so, you are missing 'ranges' in the parent to
> > make it translateable.
> >
> > > +                                   reg = <0x00000 0xC200>;
> > > +                           };
> > > +
> > > +                           /*
> > > +                            * config string as described in RISC-V
> > > +                            * privileged spec 1.9
> > > +                            */
> > > +                           config-1-9@1c000 {
> > > +                                   reg = <0x1C000 0x1000>;
> > > +                           };
> > > +
> > > +                           /*
> > > +                            * Device tree containing only registers,
> > > +                            * interrupts, and cpus
> > > +                            */
> > > +                           fdt@1d000 {
> > > +                                   reg = <0x1D000 0x2000>;
> > > +                           };
> > > +
> > > +                           /* CPU/ROM credits */
> > > +                           credits@1f000 {
> > > +                                   reg = <0x1F000 0x1000>;
> > > +                           };
> > > +                   };
> > > +
> > > +                   dvp0: camera@50430000 {
> > > +                           compatible = "canaan,k210-dvp";
> >
> > No documented. Seems to be several of them.
>
> There are no Linux drivers for these undocumented nodes. That is why I did not
> add any documentation.

Documentation is required when dts files OR Linux drivers use them.

> make dtbs_check does not complain about that as long as
> the nodes are marked disabled.

'disabled' should only turn off required properties missing checks.
Undocumented compatible strings checks are about to get turned on now
that I've made it work without false positives.

> I kept these nodes to have the DTS in sync with
> U-Boot which has them.

That's a worthwhile goal. Doesn't u-boot require documenting bindings?

> Keeping them also creates documentation for the SoC
> since this device tree is more detailed than the SoC specsheet...

It's already 'documented' in u-boot it seems...

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
