Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495E0C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 02:30:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02EC60FC3
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 02:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F02EC60FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4Ud4x/vcLoQWi5Hr4eBgVoyhAQQf7MWqI4Xhfe0k84=; b=hfABtxtbUCRTpL
	QZpIGo4arKw+co+KurgHiyDPpzsSrVML5J426GsGnFD6HtDPlbWlSQDDWEUOenr2xV2z82CMLTGjW
	VWvpBz8oeVg2WcCZj03cVgdrXAIpV7Yd6CE0UKYyk3LF6L8wshZctigIjyf+HfzpeZD0CTvLSSdtO
	U8qVnAnCd6TmtfGt5WcLBRdXEtPU14ysvsn8d8dWh/5X/cvg2DH5AYbVz5s2Ay4GCTWpKWgjC8j5e
	MhJF9VRXjQuexGI41Cu9n4jhMjV8vt9mjWcTnv6rUMORH5SYY+WsB7Yl7J1FlEzSm+pVePm5s9SCd
	YhFq754KNQPd1tXQJ5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBT9V-007tcZ-GI; Thu, 05 Aug 2021 02:30:33 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBT9R-007tbz-5F
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 02:30:31 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso6395402pjf.4
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 19:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pdp7-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vdygkbgOoifQ2P3uS173U/W4DkZaZSva1QHWbIr+JoI=;
 b=eYBCE9AHR3MLbexOdgpJeNUt8ue0DcQvnep8V2CdXekpSbK750mX5sv5aI7XlzcNmf
 ASxatPjlZ+xL8whJR888VZR30wYLyRHho8Tutpvv33YwC0VnTWYOnIs6sH+X0orilpS3
 y+FKwls2Kvsn3hBENrdbuQrGCE1AhqFVkEtqkEq4H/VF1j0U0mDsHtrFknYVZu2i/Nxe
 +8RfjhVvsQen/8b9D0D2JeI0nXqg9Ue9AfOYQ/7Yljd1REYtyY58HrNvtR2/0PU0PUul
 3gLW0emPdallHJ8f8BDhgm6gN35aQRHNKVPN3Hi8prUBgytdQuM/MZ3Xf2MVLdErReY7
 quVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vdygkbgOoifQ2P3uS173U/W4DkZaZSva1QHWbIr+JoI=;
 b=NtSaVDV3TmASL3GafOGCxL+tz+869usUYnM59LLh0pca/F/U1cuRPmpfy8osv3STQY
 /24wNy4zlt/BkBXLs2fh7k92Kx8HqCfvMgzbsxWDjKEQkZ3Agvmi2duqA+n1jjb6TxVc
 XnSTBwu0k7x9Pu5LaRVrLCpXcqe8OKbfwFe6VnQMshmh7BtGZQPloebWrHGxd+R+HJF5
 fLci+mR7eW5Vo1TyjT2U6iBtT8VOIYHv7/QiS60DVerqDsXfWugQHbKc5Y2lylaEetIH
 WfniBsxhFOA1y1Kc9gDyZjkBTy/FOC1SQgg7RQkjH9zGG1gBilplQJhD0h9I86UTVi4E
 SW3g==
X-Gm-Message-State: AOAM532NaYFKVsCypruSCc7quPCR9PwCyrwvXI9U+uWoggkF73WWWYS3
 tMA+B1e+IUy/nnd7eH0tPv220g==
X-Google-Smtp-Source: ABdhPJySAd8vmVVvU3tqw0td5HWMMUYoY9S1Qy9OO1Zx+ygWd4e1FtwfDUEhJSRER70AzJoDJ01r5w==
X-Received: by 2002:a63:1621:: with SMTP id w33mr539976pgl.291.1628130627580; 
 Wed, 04 Aug 2021 19:30:27 -0700 (PDT)
Received: from x1 ([174.127.163.79])
 by smtp.gmail.com with ESMTPSA id 22sm1918868pgn.88.2021.08.04.19.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 19:30:27 -0700 (PDT)
Date: Wed, 4 Aug 2021 19:30:24 -0700
From: Drew Fustini <drew@pdp7.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: atishp@atishpatra.org, drew@beagleboard.org, bmeng.cn@gmail.com,
 robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 michael.zhu@starfivetech.com, tekkamanninja@gmail.com,
 jack.zhu@starfivetech.com, leyfoon.tan@starfivetech.com,
 geert@linux-m68k.org, kernel@esmil.dk, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
Message-ID: <20210805023024.GA12312@x1>
References: <CAOnJCUL9uU5G1LOgfYPz9Ny77yFYaP5sgtdxG3_w=Zcsi+f96Q@mail.gmail.com>
 <mhng-c9300c9e-6877-492f-a290-7c51066d3920@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-c9300c9e-6877-492f-a290-7c51066d3920@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_193029_328135_E76D2CB3 
X-CRM114-Status: GOOD (  43.01  )
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

On Wed, Aug 04, 2021 at 02:13:47PM -0700, Palmer Dabbelt wrote:
> On Wed, 04 Aug 2021 13:54:16 PDT (-0700), atishp@atishpatra.org wrote:
> > On Wed, Aug 4, 2021 at 1:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > 
> > > On Thu, 15 Jul 2021 19:17:23 PDT (-0700), bmeng.cn@gmail.com wrote:
> > > > On Tue, Jul 13, 2021 at 2:34 PM Drew Fustini <drew@beagleboard.org> wrote:
> > > >>
> > > >> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> > > >> BeagleV Starlight JH7100 board [2].
> > > >>
> > > >> [1] https://github.com/starfive-tech/beaglev_doc
> > > >> [2] https://github.com/beagleboard/beaglev-starlight
> > > >>
> > > >> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > > >> ---
> > > >> v4 changes:
> > > >> - removed JH7100 SoC revision number after discussion with Geert
> > > >>
> > > >> v3 changes:
> > > >> - added revision number for the board and soc after question from Palmer
> > > >>
> > > >> v2 changes:
> > > >> - removed "items:" entry that only had "const: starfive,jh7100"
> > > >> - correct typo in Description:
> > > >>
> > > >> Results of running checks:
> > > >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
> > > >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
> > > >>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
> > > >>     DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
> > > >>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
> > > >>     DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> > > >>     CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> > > >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
> > > >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
> > > >>     SYNC    include/config/auto.conf.cmd
> > > >>     UPD     include/config/kernel.release
> > > >>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> > > >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
> > > >>     DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
> > > >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> > > >>     DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
> > > >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
> > > >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
> > > >>     CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> > > >>
> > > >> The dts file is from vendor repo and is being cleaned up right now in
> > > >> preperation for submitting to the mailing list:
> > > >> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
> > > >>
> > > >>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
> > > >>  1 file changed, 27 insertions(+)
> > > >>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
> > > >>
> > > >
> > > > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> > > 
> > > Thanks.  This is on for-next, as Rob suggested taking it via the RISC-V
> > > tree.
> > > 
> > Given that beagleV starlight mass production is cancelled [1], are we
> > still upstreaming the support for this ?
> 
> I'm not sure, but I wasn't quite sure where to have that discussion.  I
> figured that the boards exist so there's no reason to shoot this down, given
> that it's just the vendor DT list.  At a bare minimum there's out of tree
> support for this, so having the DT strings defined seems sane as that's a
> defacto interface with bootloaders.
> 
> Maybe this is more of a question for Drew: I think we were all OK working
> through the issues with the first-run chip when there was going to be a lot
> of them, but with such a small number produced I'm not sure if there's going
> to be enough interested to take on all that effort.
> 
> I'm not quite sure where we stand on support for this: at some point there
> were some ideas floating around as to a way to support it without major
> software changes (allocating into the non-caching regions).  If that pans
> out then I'm fine handling this, at least from the RISC-V side, but if we're
> going to have to go through all the ISA/SBI stuff then it's probably not
> worth it.  Also not sure if there are a bunch of starfive-specific drivers
> that would be needed to make this boot, in which case it's probably best to
> wait for whatever comes next.

I think that the discontinued beta prototype could be useful as a native
build host for those of you that have it and don't have an Unmatched.

The arch_sync_dma RFC from Atish [1] is key to the board running
mainline. Most of the peripherals (USB, SD card, ethernet) are already
supported by upstream Cadence and Synopsys drivers. However, the vendor
kernel used ifdef's to flush the L2 cache at several points in those
drivers and subsystem cores because the peripherals are on a non-cache
coherent interconnect.

Without the proposed solution from Atish that uses the non-cached DDR
alias, then only serial console would work on mainline (assuming the 
system is running from a ramdisk that the vendor uboot loaded).

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/CAOnJCU+ip1ccc9CrREi3c+15ue4Grcq+ENbQ+z_gh3CH249aAg@mail.gmail.com/T/#md422e9de172a179f8625c5bb595cf40e5942db67

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
