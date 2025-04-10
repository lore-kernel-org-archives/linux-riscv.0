Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA447C369A6
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIEY0kjPOuQGK/dR/qa3o7eeoXA7T+5e36ZHRpNXXhI=; b=W4POIg0F+l0vE7
	cnwg4WhXVoL76jYtkWJXfWvjuKmu50HLQ8SF+W20HJ+RMKnACcCo8LAU/MpXPuMGBepE60ioombnI
	o0i792UF6zWVd79qE153p3mXmOP5VVvrSC24gNdDhAtdUKSDv8IovD62/BLpzpU3palLaLOfg9jVE
	m0Ms3/Rjun/czko8YhjvBnyCNjQCVezvIyZ5wv4DHF//8dVP4Y0XpgHnAEMsLHeghPWt/dfSNtZSX
	i2n11NuHP24wNEACu7K8T/4kDwLlUfnLT89UbDkNQPMtHfdrN20/aEzCe4UID5ucNrNbJ8GRWtkui
	5HCq6TTXdz6yBLPPaM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rH4-0000000AY2a-1xvH;
	Thu, 10 Apr 2025 12:44:54 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r7N-0000000AW81-1Jk0
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 12:34:54 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6fed0620395so7922687b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288492; x=1744893292; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rqOD9OxXJmvSDblyShGiywTB8bqKw04tVNsGe+lxyzo=;
        b=GWCK/aRiCf2Z9MUciz7F05OJ/C6LHX7iK1EsRCr3lo+rNjzXDPQv7Bd75TTjNqg16q
         7uh8wVsw2654fHM5rQlDxQ0AKS+YCzukAuz37CTvrev7K4UUVqxgV84AdKMxuTsppfCv
         ySMq6WZ5m7wJPnlGcWnN4xXTcKidF8VVM8BsucCBMXReBObKvn2IHNR4qGqsvmJfXtuN
         xCPfMcR/9ssXOLAUmb8mNscmnVvgLcgktdfrIgmqKLvSCl6IqVSwkIGkXg33HK3pLZEc
         lm394doQdcj913/7g2YjIsBrUimyA7USLyYy+rD+vK30ANKFCR24YquKaHquE1WjT/GA
         Oo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288492; x=1744893292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqOD9OxXJmvSDblyShGiywTB8bqKw04tVNsGe+lxyzo=;
        b=NaxQ87htb96rY1fxTSSOPjinuGe47eXzqHcOj/uebUY11fDFgGsWdDCPTE09+phOXz
         DbVlQAnEERCL312wLB5VEAbF3SIpscz8pJ9//xDp/A5uhydDOOHE9DLsP83Vq7MFEeJP
         WYtRmY1sFCSLpzTlz8vyJZzcrDhj2yrDfQZe/VyN/EsxkpnFBqlMzav/o1UjYSbE/EZ9
         rSxHIjNTixN34+RT+0yEBd2MyfOA/E9ROxx7oZJVQ1jhYt/uX+aSqF4fbICElQCcTTXY
         opFokE6FV2rLhhVYP6kkjaARluXdx45/wGHKzvCbkjTMc+mlfhAwJlXDAFol7gADUKDf
         tFVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKIA+0wNzCOTdNAik5N9ZrLvNQDj8pVJ/C5ErhXrsqHQ6ZDOUPcwX3MbbhmpqVQUKEtqyJEh0S3IKD4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YykfR+P3d8EqOhNSPFn2WV7LYQSYiTC405Pv+T63Y2s7jubEeO5
	YVDMNf0kLA6uFy298GX3P2noOklYJ4izAPs28/LoqG4njygL7FuqUV3FwIN5llGiASO9Iagsc7a
	7LH05jb55X2kLBobZW6064B/wH7YfK3BSpF/NCA==
X-Gm-Gg: ASbGncuUvXHBNIyWG9P4N/DkVDCi+L/HJf3sKOE5PStZtARzc72I7AuiOfHEAATuzqj
	gLagDLNNO02QkD8JPFnV5aZ2pqj2Co4LW6NXiR9xzfXfMNOHiwsSrRD7RgOOI3YYtAwvjbRz2sD
	ytvfd5849wKEyNhgawvHmI1tt1qVhNcyF6YA==
X-Google-Smtp-Source: AGHT+IE96uvkSKWw6YPtFVcby7pWdKNYA2UEmsGaoJPHRvl5S/OcYn8T2l4wlOx/RbleIvNqeqZYcO8OmfDh5/zO70A=
X-Received: by 2002:a05:690c:3582:b0:702:4eb0:4a60 with SMTP id
 00721157ae682-7054c7d0e89mr28286317b3.33.1744288492295; Thu, 10 Apr 2025
 05:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf@eucas1p2.samsung.com>
 <20250409093025.2917087-1-m.wilczynski@samsung.com> <20250409093025.2917087-2-m.wilczynski@samsung.com>
 <CAPDyKFpoSwKAmiWyvNt1fVyu6=NU1oVOmQLVuzX_bG=-5KrM2Q@mail.gmail.com> <75f97336-6cb5-47fc-ac88-5fe7842e2838@samsung.com>
In-Reply-To: <75f97336-6cb5-47fc-ac88-5fe7842e2838@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Apr 2025 14:34:14 +0200
X-Gm-Features: ATxdqUFgmaVfbL47_mXJup4YjWo6ZMMfedtXYPTwprySI8RzBXkwm9C8hCD80Tk
Message-ID: <CAPDyKFq=BF5f2i_Sr1cmVqtVAMgr=0FqsksL7RHZLKn++y0uwg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: firmware: thead,th1520: Add clocks
 and resets
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Stephen Boyd <sboyd@kernel.org>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_053453_360920_4F47FE74 
X-CRM114-Status: GOOD (  38.28  )
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

On Thu, 10 Apr 2025 at 12:42, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 4/9/25 12:41, Ulf Hansson wrote:
> > On Wed, 9 Apr 2025 at 11:30, Michal Wilczynski <m.wilczynski@samsung.com> wrote:
> >>
> >> Prepare for handling GPU clock and reset sequencing through a generic
> >> power domain by adding clock and reset properties to the TH1520 AON
> >> firmware bindings.
> >>
> >> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> >> (core and sys) and two resets (GPU and GPU CLKGEN). Due to SoC-specific
> >> requirements, the CLKGEN reset must be carefully managed alongside clock
> >> enables to ensure proper GPU operation, as discussed on the mailing list
> >> [1].
> >>
> >> Since the coordination is now handled through a power domain, only the
> >> programmable clocks (core and sys) are exposed. The GPU MEM clock is
> >> ignored, as it is not controllable on the TH1520 SoC.
> >>
> >> This approach follows upstream maintainers' recommendations [1] to
> >> avoid SoC-specific details leaking into the GPU driver or clock/reset
> >> frameworks directly.
> >>
> >> [1] - https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  .../bindings/firmware/thead,th1520-aon.yaml   | 28 +++++++++++++++++++
> >>  1 file changed, 28 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> >> index bbc183200400..8075874bcd6b 100644
> >> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> >> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> >> @@ -25,6 +25,16 @@ properties:
> >>    compatible:
> >>      const: thead,th1520-aon
> >>
> >> +  clocks:
> >> +    items:
> >> +      - description: GPU core clock
> >> +      - description: GPU sys clock
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: gpu-core
> >> +      - const: gpu-sys
> >
> > These clocks don't look like they belong to the power-domain node, but
> > rather the GPU's node.
> >
> > Or is this in fact the correct description of the HW?
>
> Hi,
> Thank you for your input. Based on my understanding of Stephen
> presentation the power-domain layer could act as a middleware layer
> (like ACPI) that could own resources. That being said it was also stated
> that the proposed approach should work with already existing device
> trees, which implies that the DT should remain as is.
>
> So I could get the resources using attach_dev and detach_dev, but there
> are two problems with that:
>
> 1) The GPU driver will try to manage clocks/reset on it's own using those functions
>    if I provide non-stub working clocks and reset:
> static const struct dev_pm_ops pvr_pm_ops = {
>         RUNTIME_PM_OPS(pvr_power_device_suspend, pvr_power_device_resume,
>                        pvr_power_device_idle)
> };
>
> So obviously I should invent a way to tell the drm/imagination driver to
> NOT manage. One obvious way to do this is to introduce new flag to genpd.flags
> called let's say GENPD_FLAG_EXCLUSIVE_CONTROL, which would tell the consumer
> driver that the power management is being done only done from the PM
> middleware driver.

Something along those lines. Although, I think the below twist to the
approach would be better.

Some flag (maybe just a bool) should be set dynamically when the
->attach_dev() callback is invoked and it should be a per device flag,
not a per genpd flag. In this way, the genpd provider driver can make
runtime decisions, perhaps even based on some DT compatible string for
the device being attached to it, whether it should manage PM resources
or not.

Additionally, we need a new genpd helper function that allows the
consumer driver to check if the PM resources are managed from the PM
domain level (genpd) or not.

If it sounds complicated, just let me know I can try to help put the
pieces together.

>
> 2) The GPU node doesn't want to own the gpu-clkgen reset. In fact nobody
>    seems to want to own it, even though theoretically it should be owned by
>    the clk_vo as this would describe the hardware best (it's resetting the
>    GPU clocks). But then it would be trickier to get it from the PM driver,
>    making the code more complex and harder to understand. Nonetheless I
>    think it would work.

I guess it doesn't really matter to me. Perhaps model it as a reset
and make the GPU be the consumer of it?

>
> If this sounds good to you I will work on the code.

Sure, let's give this a try - I am here to help review and guide the best I can.

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
