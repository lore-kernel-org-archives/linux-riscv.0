Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE1BC4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:54:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E159561037
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E159561037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5DeJWQOz/DOl4Y5+BLzrEntVCZtf3DSG4PtD6fO23I=; b=vQvTQ34L9wZwnT
	bQ88O//8FVD7OWMwi7Rf0L5C9QtYrILWq+T0PSdBF5O8JZJ91sBFV85Zm29RdbU3YN3WuLXvn/fg1
	EQVBdysrGgAE8wszcI+bQ1TQUhCX7Exb5zea0CLph2ChR5+9IhPokcSoN+HxJ11zm+PnzS6m3R/+c
	1cFxiQ7dc2aO8u4c/cIQbKxlph6Y/ikH3Y6AhLqwPnthXVSa+VYDkQvarGBG1bcHGfstaRq71aPO7
	dn87sysC8CR/wq4QevTV8ItAR6QYeSbqDJW4PjjFKZIm6yhwlIJ4MNKG4PRVqpKUt6LyJchPJRGJF
	2iPxptmpgZKe6O+D5cbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBNuL-007QdX-KT; Wed, 04 Aug 2021 20:54:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBNuI-007Qd4-Iw
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 20:54:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso4754838wmg.4
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 13:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oTlzgcaP7CJ5Drm1mPHCLgsz9Hlf36Or5slblqneVQM=;
 b=c6BgCdohRV0iWQqB58O5ALsq1I8vbunpNRAQDwOWwmENdtxXYrWH0J/NxQh6iEBnih
 FMaeXBSly9wJj7YxMacQWOGfK6z5Zp3Un1wmTpyL0Toq2FRSPO6EZSvAOcBlBVRF2VVK
 hhXk3mJX3uKYdV7Msd4L0C3DKjmGfoDICnhpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oTlzgcaP7CJ5Drm1mPHCLgsz9Hlf36Or5slblqneVQM=;
 b=ji9h5BQKDuTfdXlPSyz7pEIHq9W39fjCUgrG1/7uFXtK2JM0cw2SjlQb4s2sWqLL7U
 01AlJK01h5+gbRQBE6hyuFSign3IRwq5/XxwgLwBCQUnYp6ohdt5RQhCtZ7u10Iw6Ds+
 D+yaWdSVkeiyCOhn7uJxnClWGQ03vi1QTIWSwzXmmqPqioSlnypUMOkMuRjZm6sXUThS
 k4AJDV/ohyjb7b5ai75Nao1l3jN485H8TAzkUA4j5R1Arc7JBjggeAxw3ubmNH3tOXnN
 hGY8H/4O/5Ubqf/tX3YM59A5blGALmmZaTjlntnYtqdEoZSRgFW11VrHSzCocJjpcqpV
 G0/Q==
X-Gm-Message-State: AOAM5307St1O6WTcZMNtA0Minr8h4NXHZOFThdT/HxIyGfFNQUb9+CdF
 1aUVdDFejUPpK628OvGFJRL6pLA4wC/aV/5QcSbS
X-Google-Smtp-Source: ABdhPJzFcX4DJR524QVh9tXD3+bk4SgtYMhEgErLPZNSn3oe5dfHlCAkP0/FSmqZixbsxDX/qk8QR3fTG7jVJ8Qr3ds=
X-Received: by 2002:a1c:413:: with SMTP id 19mr1327972wme.74.1628110467680;
 Wed, 04 Aug 2021 13:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmUg0DX__jSzjm1X_eCiHnkjHVXeq7CYLbW4xpydPS1G3g@mail.gmail.com>
 <mhng-a2fd6094-0ae8-4f7b-9dee-fd71b85b29f1@palmerdabbelt-glaptop>
In-Reply-To: <mhng-a2fd6094-0ae8-4f7b-9dee-fd71b85b29f1@palmerdabbelt-glaptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 4 Aug 2021 13:54:16 -0700
Message-ID: <CAOnJCUL9uU5G1LOgfYPz9Ny77yFYaP5sgtdxG3_w=Zcsi+f96Q@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, Drew Fustini <drew@beagleboard.org>, 
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 michael.zhu@starfivetech.com, Wei Fu <tekkamanninja@gmail.com>, 
 jack.zhu@starfivetech.com, leyfoon.tan@starfivetech.com, 
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Emil Renner Berhing <kernel@esmil.dk>, 
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_135430_718154_08F0518C 
X-CRM114-Status: GOOD (  21.54  )
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

On Wed, Aug 4, 2021 at 1:33 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Thu, 15 Jul 2021 19:17:23 PDT (-0700), bmeng.cn@gmail.com wrote:
> > On Tue, Jul 13, 2021 at 2:34 PM Drew Fustini <drew@beagleboard.org> wrote:
> >>
> >> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> >> BeagleV Starlight JH7100 board [2].
> >>
> >> [1] https://github.com/starfive-tech/beaglev_doc
> >> [2] https://github.com/beagleboard/beaglev-starlight
> >>
> >> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> >> ---
> >> v4 changes:
> >> - removed JH7100 SoC revision number after discussion with Geert
> >>
> >> v3 changes:
> >> - added revision number for the board and soc after question from Palmer
> >>
> >> v2 changes:
> >> - removed "items:" entry that only had "const: starfive,jh7100"
> >> - correct typo in Description:
> >>
> >> Results of running checks:
> >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
> >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
> >>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
> >>     DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
> >>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
> >>     DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> >>     CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
> >>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
> >>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
> >>     SYNC    include/config/auto.conf.cmd
> >>     UPD     include/config/kernel.release
> >>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
> >>     DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
> >>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> >>     DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
> >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
> >>     CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
> >>     CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> >>
> >> The dts file is from vendor repo and is being cleaned up right now in
> >> preperation for submitting to the mailing list:
> >> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
> >>
> >>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
> >>  1 file changed, 27 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
> >>
> >
> > Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
>
> Thanks.  This is on for-next, as Rob suggested taking it via the RISC-V
> tree.
>
Given that beagleV starlight mass production is cancelled [1], are we
still upstreaming the support for this ?

[1] https://www.cnx-software.com/2021/07/31/beaglev-starlight-sbc-wont-be-mass-manufactured-redesigned-beaglev-risc-v-sbc-expected-in-q1-2022/
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
