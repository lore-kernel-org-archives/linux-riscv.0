Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FEBC5B559
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 09:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BfMwGhdm0RMlmuBOtAk5HbomNTYBazwjpjPv09SU6bk=; b=mSSQFiHh9JY/GK
	mw3TTKaejh1oY1lhMOHLJqZv6tcPA09NXJ+dFQT6w//fxy0amj8bafzr68gn4GWFjWKMgwstrqpmX
	ffYsd7hPwrUZp75rOE0Le+8fF6PHRpSkqjsQL60llprsynH5Me9YN0r4Xey78ZdgQN4HVwjq/5pt+
	LABi8nQWCdaA+ulnbsVxTm4Eq7BXBhOFpgtY7C6tXztFXvnuDysq1dFWn4q4O6BrbxqjOz0z7DB6i
	z2LmDo9kwI/eq8+k/mjruXaB3K3HICaGjj4Lfu3KOxif5mv/LWXZwz+MSCRz5O3uB82SwnZHcvIZ9
	MIBUIp3pbSl4/JxBQsWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7Mn-0000000FCtQ-3P6S;
	Thu, 05 Jun 2025 09:58:33 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7Mi-0000000FCsv-3E94
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 09:58:32 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-70e1d8c2dc2so7538187b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749117507; x=1749722307; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4zPdTQVDPRTSNl8wo5w6MeNmYmfyR+yoWh8tW6/DZaY=;
        b=CtBhsnewqubkm3Qp9nJsJczSW8ZaVSAPZ/8nclEGJGtFoxa87H4nCbfGfyCNGdR5+Y
         a5P6V2Ha0DE6cRvbGLX4+OHFdEW0hzgZBIfuMOPc0ZWlXcx9/gcWqeirg/yak4Yv643U
         vUZkuEz5NNAr0jdVDaKCIbsEfwGd1YWC42EKOathNTVaAERQbW+z+pHpw4s78KFkhyi3
         1Nj4C+QB11k5i9FNwVXK2C3viwjWSAtsf13qEUYjJATn3RRLE6ehn6cFOOVmiGim3AN5
         Ny0h0p8uqiCweL64NM50sT+AZHUYp66mmjmWEYo5ziExKwolnW05JHZ4Xb0a3eopdxYy
         EStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749117507; x=1749722307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4zPdTQVDPRTSNl8wo5w6MeNmYmfyR+yoWh8tW6/DZaY=;
        b=TOPzs4YHEkCXk2mY5RLSgzlgpxmgadBHBBSn41KaYF54BWtICnaPhCMCLkQ6KDyTok
         YzKebjFK2vft0y1UZTz34xobaM4/fHVtSA8UvQFoNjlTjruIhOwS1AkVWMasGJ+mmp8U
         fcoRgVRbWeI6vcsmodnzwBH7BRsr52yMSwVtR3NqXb8xJcZDEDFMYsv6Ls8/ObN73eXn
         4tV7I0FSRfuZ3csqX1WYI6NZGo3XDY58wK456Vct2m5XHAsLF615SFvqDfURReURGVYY
         rFcishA2Yxxw+xp8Z+70XHm5cYD/EsAj/KAV29oDfXiSnVCRUPkRMIuvH5ZjhPU31DQA
         XUag==
X-Forwarded-Encrypted: i=1; AJvYcCWN4d8MNxri/wlJbxfCo4Ojp59U86YnicCk9xQyueSUcfyKX7qhlNxdb8MJWSDhAHHYf8TaqHGEdzyKNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuM/riKgwzpWPN0gbhi4/JbgPUz6+meG+nQA/z/Pc4l31unihZ
	cWQpvSfKssgKIIb4g7LC0mXTDLQFUEwgpEpl5nXdKvJkDWJFWzE/TFli/l1P5QIGKRmjTugrFHy
	ycD74RK/10JZQ7UPxNzJqCzDC829Qmr08vc0HpE7JPg==
X-Gm-Gg: ASbGncuZOWNxtHHJVnJ9hXOK6/yeR7FnK1BQRPftlbVAbO77z49weTgtofzglMgDG7W
	40IQgFZuScVr7qdq7n8gXesBRVGwF5gMz60oUfMMQqicowKxHmJPPGJ3AV1oPDrU92GgygTK0Cw
	nhE9MWrpzCipNvuMw8IyrPSYyBPJYCGcbEOA==
X-Google-Smtp-Source: AGHT+IEs9z2qDMjfH7cC75fVmmSjHZHDht5i6D5bKkcjTo5PY949JkkRdQafZEhuxNNXbWaU8JI1NrPxlkNCttr89yg=
X-Received: by 2002:a05:6902:1006:b0:e81:89b9:f7fb with SMTP id
 3f1490d57ef6-e8189b9fd46mr2688470276.20.1749117507589; Thu, 05 Jun 2025
 02:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250529222410eucas1p2e1d41a2fc717caef1aed51367a7db944@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <20250530-apr_14_for_sending-v3-7-83d5744d997c@samsung.com>
 <CAPDyKFpYfZNthdRN=pCv4FEdFCzrKEH4aFBy4ew-xLKtpbJ5Tg@mail.gmail.com> <e39c6748-59aa-4c4a-98f3-263751a120c1@imgtec.com>
In-Reply-To: <e39c6748-59aa-4c4a-98f3-263751a120c1@imgtec.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Jun 2025 11:57:51 +0200
X-Gm-Features: AX0GCFs9t2KTNaikDlvnZamDB-7XXtdndYPeCom5IA-jJ40VSGgqWKBlwED7Z-4
Message-ID: <CAPDyKFrxqp30RWGoudVsy2NR7dSUoKwxc=nk3Bqp9RVZGZ6_vQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Binns <Frank.Binns@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_025828_838001_0C81EF06 
X-CRM114-Status: GOOD (  22.06  )
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

On Wed, 4 Jun 2025 at 18:48, Matt Coster <Matt.Coster@imgtec.com> wrote:
>
> On 03/06/2025 13:27, Ulf Hansson wrote:
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
> This isn't the first time our unfortunate power domain names have come
> up [1][2]. Sadly, we're stuck with them for Rogue.

Wow, that's really crazy.

BTW, are there any reasons why you can't rely on attaching them by
index instead, via dev_pm_domain_attach_by_id() for example? Thus
entirely drop the names in the DT docs?

It sounds like the names don't really have a meaning, or do they?

>
> Matt
>
> [1]: https://lore.kernel.org/r/ff4e96e4-ebc2-4c50-9715-82ba3d7b8612@imgtec.com/
> [2]: https://lore.kernel.org/r/cc6a19b3-ba35-465c-9fa6-a764df7c01c1@imgtec.com/
>
> >

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
