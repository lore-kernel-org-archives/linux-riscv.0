Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB444C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 08:14:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0D761050
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 08:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A0D761050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3+vZEO4kE+EOnibiCTw15bn4W3Y0MZ4gggLLnB4WRG4=; b=Eo3TzaRJdggXdE
	hlNTXgZjxmZoqRKY7FUmhilA+d1h76YNfFCywkoohdtuWkBA4or+lE7U0hGz2Bex+pE7fTq5/B+Ac
	G4udfG8f7t4YOIfFsKYQP6y35avh4LorA8JekplaD8jlny/IlEspTw1bfY1aiDAbCi/Zx7qzZbcoc
	8A8S4ARSU9aeaAJ2JpaO9Rn0Nq5KE6SNAzE0oloZoif+6fQGXxtM+W/J9V7W/sI25wSgEXOKT78Kd
	GOy/sL2HbUfItKvmUUffVr8LMkgJVErVo1ckzD3ZR31duK+PBo//vBmem8JP45Ag9HTo7JlY1bdtT
	zJopKMOXLT9v7uLbNbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBYW9-008cZk-1J; Thu, 05 Aug 2021 08:14:17 +0000
Received: from mail-yb1-f181.google.com ([209.85.219.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBYVs-008cQX-1S
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 08:14:02 +0000
Received: by mail-yb1-f181.google.com with SMTP id c137so7431219ybf.5
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 01:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E4JiRs4SLIpq2z7YmzfETWqM01LASuIHNJhpMEvug1s=;
 b=DLphmTP2YZrBWfRj9skNv/5rNbxlY7vK/79BJR1OIHd+QSamo7jU9mkYKgztWugwAB
 8p1s4gL53+hUt2F3CV3Zxc/Ygw9/3bR6AwZIEsKCVtfyGgLcVp6rYcahauTCfGjby2wD
 YkrRYkmHxrCYNduHlB5z0M33xQHjRdOAFiBJ6tiqfSK+mljCh/2wtSr3Mpd/gQlOidjm
 1M4etQ2Opxe7/6FH0RKPedqsMlgW8zYUjWt4By/vw6wdaXPYuDz8SnOoTJTUFRR5Km/3
 BVLScEOu98aXvVB7/I9rgZ4nVIe8HZM9xk3rvCLEh6V1reFzxaZZZE2K75VZ7+Vqhyrn
 +ypA==
X-Gm-Message-State: AOAM531HFYrvlc3E/r+Sq6ylMlt5WBWO1Krf+AKlgK2yUQffTGr1RgFN
 Y4zmYg6OMba/WMHFAT1IlOX5dbgsTD33r+ZlvR8=
X-Google-Smtp-Source: ABdhPJzsnmXBTwXVtAmKIPdr1xZOgPa9wWKTWsAgJUABTvuNi+iyrHPRqfp+0uiX1JT7I9tADwhB7lUvW81pL2PsVQk=
X-Received: by 2002:a25:4907:: with SMTP id w7mr4420162yba.393.1628151237954; 
 Thu, 05 Aug 2021 01:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCUL9uU5G1LOgfYPz9Ny77yFYaP5sgtdxG3_w=Zcsi+f96Q@mail.gmail.com>
 <mhng-c9300c9e-6877-492f-a290-7c51066d3920@palmerdabbelt-glaptop>
 <20210805023024.GA12312@x1>
In-Reply-To: <20210805023024.GA12312@x1>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Thu, 5 Aug 2021 10:13:46 +0200
Message-ID: <CANBLGcwczBsc-mfU2t9=7No7KhHfBFHFzGy=5hdyEE+4VN8ksg@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
To: Drew Fustini <drew@pdp7.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 jack.zhu@starfivetech.com, leyfoon.tan@starfivetech.com, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_011400_163347_164691D8 
X-CRM114-Status: GOOD (  47.73  )
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

On Thu, 5 Aug 2021 at 04:30, Drew Fustini <drew@pdp7.com> wrote:
> On Wed, Aug 04, 2021 at 02:13:47PM -0700, Palmer Dabbelt wrote:
> > On Wed, 04 Aug 2021 13:54:16 PDT (-0700), atishp@atishpatra.org wrote:
> > > On Wed, Aug 4, 2021 at 1:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > >
> > > > On Thu, 15 Jul 2021 19:17:23 PDT (-0700), bmeng.cn@gmail.com wrote:
> > > > > On Tue, Jul 13, 2021 at 2:34 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > > >>
> > > > >> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> > > > >> BeagleV Starlight JH7100 board [2].
> > > > >>
> > > > >> [1] https://github.com/starfive-tech/beaglev_doc
> > > > >> [2] https://github.com/beagleboard/beaglev-starlight
> > > > >>
> > > > >> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > > >> ---
> > > > >> v4 changes:
> > > > >> - removed JH7100 SoC revision number after discussion with Geert
> > > > >>
> > > > >> v3 changes:
> > > > >> - added revision number for the board and soc after question from Palmer
> > > > >>
> > > > >> v2 changes:
> > > > >> - removed "items:" entry that only had "const: starfive,jh7100"
> > > > >> - correct typo in Description:
> > > > >>
> > > > >> Results of running checks:
> > > > >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
> > > > >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
> > > > >>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
> > > > >>     DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
> > > > >>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
> > > > >>     DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> > > > >>     CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> > > > >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
> > > > >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
> > > > >>     SYNC    include/config/auto.conf.cmd
> > > > >>     UPD     include/config/kernel.release
> > > > >>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> > > > >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
> > > > >>     DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
> > > > >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> > > > >>     DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
> > > > >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
> > > > >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
> > > > >>     CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> > > > >>
> > > > >> The dts file is from vendor repo and is being cleaned up right now in
> > > > >> preperation for submitting to the mailing list:
> > > > >> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
> > > > >>
> > > > >>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
> > > > >>  1 file changed, 27 insertions(+)
> > > > >>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
> > > > >>
> > > > >
> > > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > >
> > > > Thanks.  This is on for-next, as Rob suggested taking it via the RISC-V
> > > > tree.
> > > >
> > > Given that beagleV starlight mass production is cancelled [1], are we
> > > still upstreaming the support for this ?
> >
> > I'm not sure, but I wasn't quite sure where to have that discussion.  I
> > figured that the boards exist so there's no reason to shoot this down, given
> > that it's just the vendor DT list.  At a bare minimum there's out of tree
> > support for this, so having the DT strings defined seems sane as that's a
> > defacto interface with bootloaders.
> >
> > Maybe this is more of a question for Drew: I think we were all OK working
> > through the issues with the first-run chip when there was going to be a lot
> > of them, but with such a small number produced I'm not sure if there's going
> > to be enough interested to take on all that effort.
> >
> > I'm not quite sure where we stand on support for this: at some point there
> > were some ideas floating around as to a way to support it without major
> > software changes (allocating into the non-caching regions).  If that pans
> > out then I'm fine handling this, at least from the RISC-V side, but if we're
> > going to have to go through all the ISA/SBI stuff then it's probably not
> > worth it.  Also not sure if there are a bunch of starfive-specific drivers
> > that would be needed to make this boot, in which case it's probably best to
> > wait for whatever comes next.
>
> I think that the discontinued beta prototype could be useful as a native
> build host for those of you that have it and don't have an Unmatched.

Also according to this statement [1], they're still planning on
producing new boards with the JH7100 (same chip as on the BeagleV
prototype) at the end of Q3 and the JH7110 further in the future, so I
still think it'd make sense to support those.

[1]: https://www.design-reuse.com/news/50402/starfive-open-source-single-board-platform-q3-2021.html

> The arch_sync_dma RFC from Atish [1] is key to the board running
> mainline. Most of the peripherals (USB, SD card, ethernet) are already
> supported by upstream Cadence and Synopsys drivers. However, the vendor
> kernel used ifdef's to flush the L2 cache at several points in those
> drivers and subsystem cores because the peripherals are on a non-cache
> coherent interconnect.
>
> Without the proposed solution from Atish that uses the non-cached DDR
> alias, then only serial console would work on mainline (assuming the
> system is running from a ramdisk that the vendor uboot loaded).
>
> Thanks,
> Drew
>
> [1] https://lore.kernel.org/linux-riscv/CAOnJCU+ip1ccc9CrREi3c+15ue4Grcq+ENbQ+z_gh3CH249aAg@mail.gmail.com/T/#md422e9de172a179f8625c5bb595cf40e5942db67

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
