Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A8BC5B549
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0YWVfdZoRdQtnMSkxCt6ENKIu+8RyL/6pC+kNGkBCc=; b=f9kuFo4wEhFC1X
	vID+uW3OeRDxz5jJQG8Dg6WPm/AYymF4DRO6hXTWRMWeCuh0W4aOsFxXvU81wGkSAKpb21mETnraQ
	H6xRBjG0UdVtnoESPsOeojm3CUFXb6tiTU0AR9z1s1QlvWE2C/fnBFQ7vA+wDulP509Vxct+z9E/N
	Ea5CUMqt+0uOQFm9oDhCKLRPMFF39RibO0ZPth24sXHxPry8hawUrQv2/flwtdY4aGlNrzkcSvmeE
	gKOIvzx3DV3ncCy9//cE3zV5rYCy0KKr6rQ8iSExrUaeNHh27GV9+r0/3r0WgwJlN6QVG+gLR3F55
	LsiH1KxjKdvP8MIQHkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMod7-0000000DVPL-2sGn;
	Wed, 04 Jun 2025 13:58:09 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMod4-0000000DVOk-1wde
	for linux-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 13:58:07 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e812c817de0so3996608276.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 06:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749045485; x=1749650285; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IFWXnsIMSq1bn0DUFYmY7z6V87/rRA1du54TZxFaV2Y=;
        b=p5SvLMtwNigersF1pqCPO7CdvFoCxkwqv+GtzwUZPgho0dPEAEDd68vqEA8pSkh1BW
         Kht2fAhOT7X2VOKhLUB0Ndl61KHQ1qjwX2m8iiqmUdTTTlEZEeVOpZ29I+t4rSregHI+
         ZEOBdsDtxrZDsd6316lJGkwRCZrVrdmOPh6KZGlBTSmODUea4GNB+sBmikZMfNOMLa2C
         rG2wnmJkRhxTHkl6Wuv0DH5j49RCyEOGfbNuk6V6cNtf4m0XIv3UeU2MDeHU3bsSHqY0
         C1FdX9ikGD8qXhbal65VF4O06OKnT/qF+/Am2eiLNhrDozKFdXpEkwPuvJHCFi4mzIBV
         earQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749045485; x=1749650285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFWXnsIMSq1bn0DUFYmY7z6V87/rRA1du54TZxFaV2Y=;
        b=EIrvztemaOoq27FcYFRqCQo5uDW7cuyXgg5QRFhYbnPmgycYGny+g1P04EWyiMEinu
         0jewo17OuTAPD/S9Kjg1++xNoEd5SQSgGtj/DqxFyu1cSpGIJ9GDiuPx0FZNjtpykA3O
         vRPgB1PDhDOZpyGy1zZ9A8ScQpMpW5Gwg5A9xWPpfi89+SJ1AbEXNC77sCX8TotOIHCC
         wbCdcnAdNkDWOFhe1sJrybQ4YSJ2F6xREPnfwHiXxgV4bZizfGaj8mT4WhGwmEiyTFId
         6HvbYVtx36bDJImbXVHhqY0eFucgq2V8ukY+TDTS36mQeWhXn/0sQNZ9CXafP04QP5bw
         2REg==
X-Forwarded-Encrypted: i=1; AJvYcCWd0GkqbFEdZz+xswGpqoOiLse4t2nNr2z80R4vXRfFAptPi9eQ7eocWoVph9/qKnAD05A56e/L8rGO3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSxCeqXD8LEeyG1Kcnh4XT5WsaPJfB/ltB3Ty4bOZPQV9EGuSV
	LUigvTvxZ48bC7CZOAXYSYQ+EmW5D80sX+qWqKFGLy5S21OdMDcQMrugSPgTBqcfYSCr1iV2z+d
	BGMeBCLLuZdMvnxkit8/vVpNwdmhqM1oOYsIIr8mr0Q==
X-Gm-Gg: ASbGncvPv2tAdOFy8jEybmLcphtriKzH5XkzmceeK8A1alt71rwhrM9IX0/T9xgVjMb
	hbDp/j/n4bBt1zWIlfkt/mJth8q6mZGnwkONSxY5S2QiDOr17cJq4AT6YGs5b9bKfsr7eqZyGKQ
	YrMD8DQdyUTQi4tYhhnSQeH7cIdyD/mcLEIQ==
X-Google-Smtp-Source: AGHT+IGXFY8gppNCB1I6k87GeD/bmWPUV8R4mMgK2i7dZCLcfF2RhkUBwoySiJMKIOMWeHJraaSZXAxgR7paTZPeyFU=
X-Received: by 2002:a05:6902:1383:b0:e81:2447:6b74 with SMTP id
 3f1490d57ef6-e817a0011f4mr3409868276.43.1749045484537; Wed, 04 Jun 2025
 06:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com> <a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com>
In-Reply-To: <a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Jun 2025 15:57:28 +0200
X-Gm-Features: AX0GCFsKqqHfcoyjgQNY4Bx0T-G_vnaUmkhnEv_Xdt_09WriRo8KoB3SpnFxVUU
Message-ID: <CAPDyKFo8scYL59+ELgawop30habZad0Xsd6bKGLXtSF+UNd9Ng@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_065806_515987_FCA1152D 
X-CRM114-Status: GOOD (  24.30  )
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

On Wed, 4 Jun 2025 at 14:40, Michal Wilczynski <m.wilczynski@samsung.com> wrote:
>
>
>
> On 6/3/25 14:27, Ulf Hansson wrote:
> > On Fri, 30 May 2025 at 00:24, Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> >> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> >> the GPU using the drm/imagination driver.
> >>
> >> By adding this node, the kernel can recognize and initialize the GPU,
> >> providing graphics acceleration capabilities on the Lichee Pi 4A and
> >> other boards based on the TH1520 SoC.
> >>
> >> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> >> controlled programatically.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 6170eec79e919b606a2046ac8f52db07e47ef441..ee937bbdb7c08439a70306f035b1cc82ddb4bae2 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
> >>                 #clock-cells = <0>;
> >>         };
> >>
> >> +       gpu_mem_clk: mem-clk {
> >> +               compatible = "fixed-clock";
> >> +               clock-frequency = <0>;
> >> +               clock-output-names = "gpu_mem_clk";
> >> +               #clock-cells = <0>;
> >> +       };
> >> +
> >>         stmmac_axi_config: stmmac-axi-config {
> >>                 snps,wr_osr_lmt = <15>;
> >>                 snps,rd_osr_lmt = <15>;
> >> @@ -504,6 +511,21 @@ clk: clock-controller@ffef010000 {
> >>                         #clock-cells = <1>;
> >>                 };
> >>
> >> +               gpu: gpu@ffef400000 {
> >> +                       compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> >> +                                    "img,img-rogue";
> >> +                       reg = <0xff 0xef400000 0x0 0x100000>;
> >> +                       interrupt-parent = <&plic>;
> >> +                       interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       clocks = <&clk_vo CLK_GPU_CORE>,
> >> +                                <&gpu_mem_clk>,
> >> +                                <&clk_vo CLK_GPU_CFG_ACLK>;
> >> +                       clock-names = "core", "mem", "sys";
> >> +                       power-domains = <&aon TH1520_GPU_PD>;
> >> +                       power-domain-names = "a";
> >
> > If the power-domain-names are really needed, please pick a
> > useful/descriptive name.
>
> Yeah they are required. Even though this convention doesn't seem to be
> enforced by the dt-binding it seems like it's hard-coded into the driver
> 330e76d31697 ("drm/imagination: Add power domain control"). So I don't
> think I have any choice here.

Well, unless there is a DT doc describing the power-domain-names it's
perfectly fine to change the driver too.

Moreover, it looks like 330e76d31697 is a brand new commit, just in
linux-next, so not even included in a release yet.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
