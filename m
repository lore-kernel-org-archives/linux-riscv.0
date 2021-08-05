Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA258C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:29:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A896C60F02
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A896C60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ydhO2HYaFdxTdoRbL7ftELQaJeONvXkzcbTL85aJZU=; b=bmlmOA91EIMPZ/
	ddkiImadX52lHkrCcTxdWKFlrdizggyK424hSCQ66aBT9eJq5eDkB0fSFMwwScx/XdBp4OsoKULYJ
	/vv0PHd7d5hi2krGZT4F4k1qkEAkoDHQzuldxEiiUGDeLD8CRh4X6/0qwhh3eJzRhw55Qwx0O2plB
	wxjZSQaMK59+WAqyrew33yss1W9R24qck6BtfPv3MSlY2GVL3aL2FePOKwht0LMMc9rVBnZ07rWtX
	WTk6aHNP//7bxANaXGMUWkINowP2jgFonkt+bWo7OkrBFuA3iRDapYtt/QFIRobXjSTstqlV/A81B
	AFJMbe62zVM3iK97RFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBi6l-00AX4E-0X; Thu, 05 Aug 2021 18:28:43 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBi6h-00AX3t-Ad
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 18:28:41 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 cl16-20020a17090af690b02901782c35c4ccso7884832pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YGCouswH2GHW8Pe9yNUK7G9pYNQGrUoLBPY+7PuOUPI=;
 b=XXVigsKYi2Ekgg4sTYHse/ofeYfpERaqCu3m9dcXsH/n+THel7lVyPzavfSXYdJ4sQ
 WBQ9acW8B4ZCGjZuaB/if3rcAcACxCF43psx966LrPSVE3rrXJjr7hhdTEACLlH/KDxl
 BC1hpzQxh6xcLPrj3vyAzPlu126jya2VB1B9Dn/zqSumtG9Y6FjU9XyPVYw38ehQ6pM6
 VwMGViUWcqZOx/sW2iNyQ+gJQijCIo7hg0d+mNpuFStqbTt1Z1iItm9zkaN6qwi1KulM
 VhBRGFpT6P3P6wxe9GI6Yab/v4E7fLUBlMjEHpp+MfyzATG7BuEG9Qz4nEaLwz6WlrRY
 WSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YGCouswH2GHW8Pe9yNUK7G9pYNQGrUoLBPY+7PuOUPI=;
 b=rHEjT4cFTXDVNR1uuKthUJs1X9LL5qXtu2KaAGdRaWesvEQ4RnNMXgcz44HbHXVPTU
 OfrisP6N3w+CVtsRphPrhtHjG5ulEcWRf5c3YaWPcwWi+7QFy5e2HsJ3h1pugBk1iXj4
 k7madeXQl2lBtYIvv6c2OOvq3Lu+uM4iAL+V/H2yMxPzQbislABSYqUdUoVGlW75KlnQ
 2wjdnh2/2sVcHKB2m09rPCTSOtQQMRFujGm8qGLQRwpRJaYAu/8YJOzIlN4E5xby/qft
 E3AslGhWda0XGL8Ffo5gQTBk+C0XtXKXDviXpnhRFr94GJ5V3aKQTFbanmZTMB5+PV6V
 royA==
X-Gm-Message-State: AOAM530iGPpFtrUHMJg90Eg7uXT5Or50HQb1Xh0+T7me3NxOCdC0rslM
 7QKz2qXv5NLBJq4XVrIfp33+gJ8oEZP+3Bpi
X-Google-Smtp-Source: ABdhPJwhAh8lgT+1ZMJecUd5olFPxP6rXJaigXlazVzjp7zvAweU5icsVR5dL9NjXJRvm7U1xXh7aA==
X-Received: by 2002:aa7:83d0:0:b029:3c6:7261:ecb with SMTP id
 j16-20020aa783d00000b02903c672610ecbmr6507212pfn.61.1628188117531; 
 Thu, 05 Aug 2021 11:28:37 -0700 (PDT)
Received: from x1 ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id z24sm6696956pfn.150.2021.08.05.11.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 11:28:36 -0700 (PDT)
Date: Thu, 5 Aug 2021 11:28:35 -0700
From: Drew Fustini <drew@pdp7.com>
To: Atish Patra <atishp@atishpatra.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, jack.zhu@starfivetech.com,
 leyfoon.tan@starfivetech.com, Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
Message-ID: <20210805182835.GA52068@x1>
References: <CAOnJCUL9uU5G1LOgfYPz9Ny77yFYaP5sgtdxG3_w=Zcsi+f96Q@mail.gmail.com>
 <mhng-c9300c9e-6877-492f-a290-7c51066d3920@palmerdabbelt-glaptop>
 <20210805023024.GA12312@x1>
 <CANBLGcwczBsc-mfU2t9=7No7KhHfBFHFzGy=5hdyEE+4VN8ksg@mail.gmail.com>
 <CAOnJCU+-orqjP5dND0QNh+08UhXitS=LPpg1VpnBcp=6YJU7EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCU+-orqjP5dND0QNh+08UhXitS=LPpg1VpnBcp=6YJU7EQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_112839_478922_F467309B 
X-CRM114-Status: GOOD (  59.45  )
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

On Thu, Aug 05, 2021 at 11:09:36AM -0700, Atish Patra wrote:
> On Thu, Aug 5, 2021 at 1:13 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > On Thu, 5 Aug 2021 at 04:30, Drew Fustini <drew@pdp7.com> wrote:
> > > On Wed, Aug 04, 2021 at 02:13:47PM -0700, Palmer Dabbelt wrote:
> > > > On Wed, 04 Aug 2021 13:54:16 PDT (-0700), atishp@atishpatra.org wrote:
> > > > > On Wed, Aug 4, 2021 at 1:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > > > >
> > > > > > On Thu, 15 Jul 2021 19:17:23 PDT (-0700), bmeng.cn@gmail.com wrote:
> > > > > > > On Tue, Jul 13, 2021 at 2:34 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > > > > >>
> > > > > > >> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> > > > > > >> BeagleV Starlight JH7100 board [2].
> > > > > > >>
> > > > > > >> [1] https://github.com/starfive-tech/beaglev_doc
> > > > > > >> [2] https://github.com/beagleboard/beaglev-starlight
> > > > > > >>
> > > > > > >> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > > > > >> ---
> > > > > > >> v4 changes:
> > > > > > >> - removed JH7100 SoC revision number after discussion with Geert
> > > > > > >>
> > > > > > >> v3 changes:
> > > > > > >> - added revision number for the board and soc after question from Palmer
> > > > > > >>
> > > > > > >> v2 changes:
> > > > > > >> - removed "items:" entry that only had "const: starfive,jh7100"
> > > > > > >> - correct typo in Description:
> > > > > > >>
> > > > > > >> Results of running checks:
> > > > > > >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
> > > > > > >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
> > > > > > >>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
> > > > > > >>     DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
> > > > > > >>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
> > > > > > >>     DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> > > > > > >>     CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> > > > > > >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
> > > > > > >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
> > > > > > >>     SYNC    include/config/auto.conf.cmd
> > > > > > >>     UPD     include/config/kernel.release
> > > > > > >>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> > > > > > >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
> > > > > > >>     DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
> > > > > > >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> > > > > > >>     DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
> > > > > > >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
> > > > > > >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
> > > > > > >>     CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> > > > > > >>
> > > > > > >> The dts file is from vendor repo and is being cleaned up right now in
> > > > > > >> preperation for submitting to the mailing list:
> > > > > > >> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
> > > > > > >>
> > > > > > >>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
> > > > > > >>  1 file changed, 27 insertions(+)
> > > > > > >>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
> > > > > > >>
> > > > > > >
> > > > > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > > > >
> > > > > > Thanks.  This is on for-next, as Rob suggested taking it via the RISC-V
> > > > > > tree.
> > > > > >
> > > > > Given that beagleV starlight mass production is cancelled [1], are we
> > > > > still upstreaming the support for this ?
> > > >
> > > > I'm not sure, but I wasn't quite sure where to have that discussion.  I
> > > > figured that the boards exist so there's no reason to shoot this down, given
> > > > that it's just the vendor DT list.  At a bare minimum there's out of tree
> > > > support for this, so having the DT strings defined seems sane as that's a
> > > > defacto interface with bootloaders.
> > > >
> > > > Maybe this is more of a question for Drew: I think we were all OK working
> > > > through the issues with the first-run chip when there was going to be a lot
> > > > of them, but with such a small number produced I'm not sure if there's going
> > > > to be enough interested to take on all that effort.
> > > >
> > > > I'm not quite sure where we stand on support for this: at some point there
> > > > were some ideas floating around as to a way to support it without major
> > > > software changes (allocating into the non-caching regions).  If that pans
> > > > out then I'm fine handling this, at least from the RISC-V side, but if we're
> > > > going to have to go through all the ISA/SBI stuff then it's probably not
> > > > worth it.  Also not sure if there are a bunch of starfive-specific drivers
> > > > that would be needed to make this boot, in which case it's probably best to
> > > > wait for whatever comes next.
> > >
> > > I think that the discontinued beta prototype could be useful as a native
> > > build host for those of you that have it and don't have an Unmatched.
> >
> > Also according to this statement [1], they're still planning on
> > producing new boards with the JH7100 (same chip as on the BeagleV
> > prototype) at the end of Q3 and the JH7110 further in the future, so I
> > still think it'd make sense to support those.
> >
> > [1]: https://www.design-reuse.com/news/50402/starfive-open-source-single-board-platform-q3-2021.html
> >
> 
> 
> 
> > > The arch_sync_dma RFC from Atish [1] is key to the board running
> > > mainline. Most of the peripherals (USB, SD card, ethernet) are already
> > > supported by upstream Cadence and Synopsys drivers. However, the vendor
> > > kernel used ifdef's to flush the L2 cache at several points in those
> > > drivers and subsystem cores because the peripherals are on a non-cache
> > > coherent interconnect.
> > >
> > > Without the proposed solution from Atish that uses the non-cached DDR
> > > alias, then only serial console would work on mainline (assuming the
> > > system is running from a ramdisk that the vendor uboot loaded).
> > >
> 
> We need the clock patches as well. If there is an agreed effort to
> upstream the clock patches
> and other bare minimum patches, I am happy to revise the DMA patches as well.
> 
> However, I am not sure all the patches should be beagleV or
> starfive/starlight given the new announcement
> from StarFive. Does anybody know if they are going to mass produce the
> exact same SBC (JH7100) or some variant of it ?
> 
> Maybe we should defer upstreaming until we see the new board ? We
> probably don't want two different versions of upstreaming support
> for the same board!

The JH7100 was produced through MPW (multi-project wafer) runs and not
as a full mask set for mass production. I don't know what quantity will
exist beyond the 300 used on the beaglev starlight beta prototypes.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
