Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF302C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 11:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcS2IGHsVbRwL8zy3nZu8KWR26+uoJxhJKKj220c4vw=; b=ZbgGpQ2saTPcDR
	Lhkcrd5C0/ooXsnluXfWchRFT9Q4LEWJD5MG8tKeGb2LF52NNICMvBHRMJZ9UuHXjp6E9W3kgnKGN
	hQT7EG+WpUVnfeR4C7jCrdy/1/o+ExSy7blHIBCX8RC4ohXItWBBF2lS++tFqzHLaglDtaudTZxvf
	4lKjEcQuHSPg7Q8eYqOh7RzTg/LZ7HzDlbpVkv1JsVMRtCPuU3t86Vy5XeImQ4/AR2BNO7N2VfB+g
	NZF9JCHRDUXZ52XsfVWSaLsM+7/bOxEmxkUreuIkwrQ6n6JG324jQVN/fSBGfd05hd8ydNBa1jtRc
	hcjZ8F+p8jVfRWRmmghg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzD8-00000000SsD-3VlD;
	Thu, 08 May 2025 11:14:42 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCzCO-00000000SlR-1C1d
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 11:13:57 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso864018276.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 04:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746702835; x=1747307635; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wz0l5OYYb4wZW+mHv+F5ZoKS8UyIRgGRSrQBEHKOgR8=;
        b=s4zkViaZdy/TUt0JfFJIfqtJRWHkAEIp7hpEl5sOrsZdU9hJ6ZlI5Hi0j0Skqg8L7X
         ImC5D0zk9QGdFGenM0WEdLvaJwc22+7Hsp+nRSSqVgA4TSfwqlLu+IqY+GyBTV9kZ4Bl
         axlnOteQNDpmBVKYFFPStPpAanFZmWRowDyiQRDZ7TBIo0CQLsXloNFNjr0GbY4xhj/d
         aV+2t8vT8E2c8UxEjKpK7OLjQ2fXUumxhrS99A1mYDHvAlxC23Q5IvzmjDtZHPFkgV0K
         fk6/6VD5QYs7EaDIgd8C0g+kTBxDNgZskmqRtUiLha5UDU7jAN00GXt4sq+xi/nCYX1Z
         aPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746702835; x=1747307635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wz0l5OYYb4wZW+mHv+F5ZoKS8UyIRgGRSrQBEHKOgR8=;
        b=QmroxeXg8OOMRV8I/V6SQ1mvaVoqbJeV7ERfCt98zsIPzYg5U6hwWGaxbpkK5jEF4C
         P1VuxAr23uSoJ4d9Vsv/ooJ0CduqicHx+tmGx/Gi/tYCnTLgYsHOGA2GHNndQr6AM1A+
         iOONYvFp93WB1pDWPRxmd6i5aRuG0FtaXOs6kqArh8TNAAnZX0md3DykIbY4EHHIqj3k
         5G8kknTw2FTACqDE9tGU5a4w7l7jAy4CH6KdxBb+WWvdNrQxhzOK1lykqHW9/eGRvLya
         mvQOQ0hyLfVOL/NAmzrJH0DpW5k6DbFPDnIC+irVCDJgKi41FJi2OogzAWk9lXH36OLk
         /AGA==
X-Forwarded-Encrypted: i=1; AJvYcCWXPpKrGhifcGazNxefjcviY7iwaCeeYOBFnt3XGFGxgZ8D5H6nFR49g3LzXSbf2pwSwvwbRtAm3ct+AA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdcQPIcBaVxS4lTHYrJit0gU+aO4bCXoJSZzeBcar7b0hxnW8g
	6QSyOwkbLKw41ZUVFNnM2ZiNttTazlsBADNtt4l3OEOHXu+xl/Xwatn8ZwonpxmlpbKnYJCHLcD
	JUZGIadSFqs+gn3BmzRFf8+kCC33qbWsYeP7LRQ==
X-Gm-Gg: ASbGnctmqvPcKmpcQb2lwNA8SNEmEEk97MuMNqOq3kdQ5mpyLtURzWUXjwH6FvYxpCf
	WigiR6Vh8OoiAxZWGi2xaJ/PCOq9ssPDdm7oQT8bGr26MDxhmmrJec345fazZpEfAaIYJRMliU+
	jcS9ZvxGziks85a6A0PnyGcFs=
X-Google-Smtp-Source: AGHT+IFqQdI6e1trWbJBwK/oeHTdsQLNh5rp3zpOH+TfiAJBCwyBTZ7DbhV2v2lokDznxkf4DSHMOmiGIM30cUQx248=
X-Received: by 2002:a05:6902:1b89:b0:e78:ed12:6d92 with SMTP id
 3f1490d57ef6-e78ef73b5d7mr3479249276.40.1746702834996; Thu, 08 May 2025
 04:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288@eucas1p2.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com>
 <20250414-apr_14_for_sending-v2-3-70c5af2af96c@samsung.com>
 <CAPDyKFqX5cjQe3-MX3W9wMoQW3gzwSvb0QMf-_sTJuq_TeGsCg@mail.gmail.com> <5413f5c7-8049-4490-bdd6-8c03f6e2057f@samsung.com>
In-Reply-To: <5413f5c7-8049-4490-bdd6-8c03f6e2057f@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 8 May 2025 13:13:19 +0200
X-Gm-Features: ATxdqUFZBkfWWqLt3Ds_1EAZOWb0PLKmTy9yLzgOWSvL-CIrLIE3LaF4c8kkZg0
Message-ID: <CAPDyKFpi6_CD++a9sbGBvJCuBSQS6YcpNttkRQhQMTWy1yyrRg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pmdomain: thead: Add GPU-specific clock and reset
 handling for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_041356_336359_5CDBDA39 
X-CRM114-Status: GOOD (  37.06  )
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

On Wed, 30 Apr 2025 at 14:17, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
>
>
> On 4/25/25 10:50, Ulf Hansson wrote:
> > + Bartosz
> >
> > On Mon, 14 Apr 2025 at 20:53, Michal Wilczynski
> > <m.wilczynski@samsung.com> wrote:
> >>
> >> Extend the TH1520 power domain driver to manage GPU related clocks and
> >> resets via generic PM domain start/stop callbacks.
> >>
> >> The TH1520 GPU requires a special sequence to correctly initialize:
> >> - Enable the GPU clocks
> >> - Deassert the GPU clkgen reset
> >> - Delay for a few cycles to satisfy hardware requirements
> >> - Deassert the GPU core reset
> >>
> >> This sequence is SoC-specific and must be abstracted away from the
> >> Imagination GPU driver, which expects only a standard single reset
> >> interface. Following discussions with kernel maintainers [1], this
> >> logic is placed inside a PM domain, rather than polluting the clock or
> >> reset frameworks, or the GPU driver itself.
> >
> > Speaking about special sequences for power-on/off devices like this
> > one, that's a known common problem. We actually have a generic
> > subsystem for this now, drivers/power/sequencing/*.
> >
> > Perhaps it's worth having a look at that, it should allow us to
> > abstract things, so the GPU driver can stay more portable.
> >
> > Kind regards
> > Uffe
>
>
> Hi Ulf, Bartosz,
>
> Thank you very much for your suggestion, Ulf. I took a look at the
> drivers/power/sequencing/ API and agree that it seems like a suitable
> framework to model the specific power-on/off sequence required for the
> TH1520 GPU, allowing for better abstraction than embedding the logic
> directly in genpd callbacks.
>
> My plan is to refactor the series based on this approach. Here's how I
> envision the implementation:
>
> 1) Provider (th1520-pm-domains.c): This driver will register as both a
> generic power domain provider and a power sequencer provider for the GPU
> domain.
>
> 2) pwrseq target Definition: A pwrseq target will be defined within the
> provider to encapsulate the required sequence (enable clocks, deassert
> clkgen reset, delay, deassert GPU core reset). The target will be
> named using the GPU's first compatible string with a "-power" suffix.
>
> Example GPU DT node, adhering to convention introduced here [1].
> gpu: gpu@ffef400000 {
>         compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
>                      "img,img-bxm", "img-rogue";
> };

I don't think the power-domain provider node is the correct place for
this, from DT point of view.

Instead, I would try to follow the same approach as
Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml,
which uses a separate device-node to describe the pwrseq provider.

>
> [1] - https://lore.kernel.org/all/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com/#t
>
> 3) Consumer (drm/imagination): In its probe function, the driver will
> read the first compatible string of the device node. It will then
> attempt devm_pwrseq_get(dev, compatible_string_with_suffix) (e.g.
> devm_pwrseq_get(dev, "thead,th1520-gpu-power")). The result

Make sense, but we should probably use a more generic target-name,
such as "gpu-power" or something along those lines.

> pvr_dev->pwrseq_desc will be stored (it will be NULL if no suitable
> provider/target is found, or a valid descriptor if successful). The
> driver will still acquire its necessary clock/reset handles via
> devm_*_get in probe for potential use outside of RPM (like devfreq).
>
> 4) Consumer Runtime PM Callbacks
> (pvr_power_device_resume/suspend): These functions will check if
> pvr_dev->pwrseq_desc is valid. If valid: Call pwrseq_power_on() in
> resume and pwrseq_power_off() in suspend. The driver will not perform
> its own clock/reset enabling/disabling for resources managed by the
> sequence. If NULL: Execute the existing fallback logic (manually
> enabling/disabling clocks/resets using the handles acquired in probe).
> Unconditional logic (like FW booting/shutdown) will remain within the
> RPM callbacks, executed after successful power on or before power off,
> respectively.
>
> 5) Resource Handling (via genpd callbacks): To allow the provider
> (th1520-pm-domains.c) to access resources defined in the consumer's DT
> node (specifically the clocks and gpu_reset needed in the sequence), I
> plan to keep the attach_dev / detach_dev genpd callbacks as implemented
> in the previous patch version. attach_dev will acquire the consumer's
> resources (using the consumer_dev pointer) and store the handles in the
> provider's context. The pwrseq unit callbacks will then access these
> stored handles via the shared context. detach_dev will release these
> resources. This seems necessary as the pwrseq API itself doesn't
> currently provide a direct hook for the provider to get the consumer's
> device pointer or manage its resources across the pwrseq_get/put
> lifecycle.

If we have a separate node describing the pwrseq, as
Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml,
it's should be rather easy to hook up and pwrseq driver for it too, as
drivers/power/sequencing/pwrseq-qcom-wcn.c does it.

>
> This approach uses the pwrseq framework for the sequence logic as
> suggested, keeps the generic consumer driver free of SoC-specific
> sequence details (by using the compatible string lookup for this), and
> retains the genpd attach/detach mechanism to handle cross-node resource
> dependencies.
>
> Please let me know if this plan sounds reasonable.
>
> Thanks !

[...]

That said, Bartosz is better with guidance around pwrseq
providers/consumers. The above is just my view of it - and I might
have missed something.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
