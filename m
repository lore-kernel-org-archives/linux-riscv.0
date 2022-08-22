Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EC7C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJ8r74Arc+fdD7jTUutEjU5zB+aUMXMoo4TuLFvLLQk=; b=qnBysQbpvBt3An
	lEIMP32jdnYnXPfxDfW1LzDSEUFvVny2kzTOFEnTXItuJIe7dfGx2vgvgVWm7O/KlW5NXE8K+zjc9
	V4xmoICWDK1pBKO4e2fmyZ4tIbOl+Y3azuqSs8HSX8e0k0BAJ6/StINUu/o6iR+4e23wAEHPXZmOe
	iz7828jCLTl/pV9oojTavmzdFitamPLPd6dkFayGFsAE5gnFehaeoOoWnqLUr1SctGAFyp1R/La3N
	m1luxH5uo/jG3/4gWefczyLyzEiKDQHNyQyV+OpDmlW/joydTPulc+c8G4b+4sjH5viT4R9HTTEeh
	yZYr0WB61y2zwLOOKpRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQFMr-00FCfz-Hp; Mon, 22 Aug 2022 21:53:57 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQFMo-00FCbh-Vm
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 21:53:56 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-10cf9f5b500so14604126fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 14:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=bcDzoWFkVNTZ2Tko5DKpI1+Q/hCmaWzs38DtfFsmGpY=;
        b=T8G1ThG5v0MfIZNyTURW058qhLrcdMNlJ/miV9IVMlTBrsH9fzlxOp0HgW89GE71og
         hwULPMK5+dJmD0mRvzfimDzmiRNQUzCaNXc5rXfIqal5MkmHbEgkZQUD02EqTrFa8dQj
         nZSw9P9BTW5nNZsSJiazF4BxOEmrkcLWcwevxQ01eLe7vyODQow5E1LEaTppSpZSI3R3
         HJeZ2V1S2DO7mcGD/cfd2O6IOw3Ohy4k4hCbVEuARXaYQjNJmY1YSxyiBX3Qn+ZYvE8V
         RiT1ZYJgPJUdnji9oMsIMNe+x38KOWCUcSLbNNfyIxOlF9hQD431OkqfcXL9KEuW/Z98
         Y8Lg==
X-Gm-Message-State: ACgBeo1HF+7dPOxrAugKnQ7VQbez2szusGV55J15e9d+Y4cHzfE9jzPM
	NsH7GxFDyTBivRiJNCDV9Xq6UPTC7g==
X-Google-Smtp-Source: AA6agR4F4261CrVdouxraTqRKAlEX9mH87I0UOzWRhgc3aFcX60CBsldqkUugDri/nQw2U17krFs9w==
X-Received: by 2002:a05:6870:9690:b0:11d:1e78:2674 with SMTP id o16-20020a056870969000b0011d1e782674mr160632oaq.90.1661205231495;
        Mon, 22 Aug 2022 14:53:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f30-20020a056870899e00b00108b31bf8fbsm3183119oaq.53.2022.08.22.14.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 14:53:50 -0700 (PDT)
Received: (nullmailer pid 923856 invoked by uid 1000);
	Mon, 22 Aug 2022 21:53:49 -0000
Date: Mon, 22 Aug 2022 16:53:49 -0500
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-riscv@lists.infradead.org, palmer@dabbelt.com, sboyd@kernel.org, aou@eecs.berkeley.edu, Hugh.Breslin@microchip.com, krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com, linux-clk@vger.kernel.org, Daire.McNamara@microchip.com
Subject: Re: [PATCH v2 2/6] dt-bindings: clk: document PolarFire SoC fabric
 clocks
Message-ID: <20220822215349.GA913400-robh@kernel.org>
References: <20220822112928.2727437-1-conor.dooley@microchip.com>
 <20220822112928.2727437-3-conor.dooley@microchip.com>
 <1661197242.557172.413609.nullmailer@robh.at.kernel.org>
 <92e15fa9-65f4-1dea-48eb-f3afbea5d3f4@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92e15fa9-65f4-1dea-48eb-f3afbea5d3f4@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_145355_041229_A3897D3E 
X-CRM114-Status: GOOD (  17.90  )
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

On Mon, Aug 22, 2022 at 07:44:20PM +0000, Conor.Dooley@microchip.com wrote:
> On 22/08/2022 20:40, Rob Herring wrote:
> > On Mon, 22 Aug 2022 12:29:25 +0100, Conor Dooley wrote:
> >> On PolarFire SoC there are 4 PLL/DLL blocks, located in each of the
> >> ordinal corners of the chip, which our documentation refers to as
> >> "Clock Conditioning Circuitry". PolarFire SoC is an FPGA, these are
> >> highly configurable & many of the input clocks are optional.
> >>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  .../bindings/clock/microchip,mpfs-ccc.yaml    | 81 +++++++++++++++++++
> >>  1 file changed, 81 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
> >>
> > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> Heh, been waiting for this one all day. Messed up squashing commits
> before sending v2... fixed locally & I'll respin later in the week.
> I tried to mark it "changes required" in patchwork so you'd not waste
> time on it but I think that got reverted?

Could have. The CI job messes with the state and then I do, and my 
scripts don't expect the state changing underneath it. Most users don't 
have PW accounts.

Don't worry, I don't spend much time on failing patches.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
