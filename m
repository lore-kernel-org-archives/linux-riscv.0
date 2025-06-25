Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9825C7115C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 11:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z5IMk8UbPsEzpG8UIPXfvco7Rv4kd8c0QmN0T6kRCHY=; b=YuyjOpBXvBgsFz
	qsYXViPdQNEZ4El4dteASJM0fRHGbkcXsyoPOplLvpYRxzy0UzRXtWaXoJDAQuFaZB06CtQuoIVxh
	LrVQIMDDKeIpWrt6VpufCCalMYLeS7hTaqyqfUV0yUJqvqmGR3H2U+B59hB14fLdN3zL4ZsPlV+By
	JTZOCw8pOuUc4xsSTVBs89l5kabrugCXE70nUgMGCLi+DmP+Wp8SM2BP/GbNi+bb/8h0tTFrOtMfQ
	7nyzLNNg4pQKbPtJisJoQF6ImDOzaVTSha36e9WkPBv8eh3ZQB7UcKCfWp8y1w+Nq+S0YJlpP/Jtl
	4/1nMqP/jjMU7jl0PVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNyJ-00000008Q9j-2NlU;
	Wed, 25 Jun 2025 11:07:19 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUN5Q-00000008Gsv-36Hv
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 10:10:37 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e84207a8aa3so3997572276.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jun 2025 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846236; x=1751451036; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NyqCTrWRH38g5oBlyqrDfAPMaqAjSD4w/gNXRimf4zI=;
        b=tYpKIon1PzXxh4LHm1ab0+wYqEWwMrruys3IGkaAjlPgvY4344kpjhSaMHhZtB8vOP
         9K8vUOYSiOoBb2S9q6MvCCMuCz972DXVjXcRymThwXmMSx53BSIvViaWsdURObtaWYek
         iAnN3z9C4W3LTSjL9WC4DBEM5X6EjiPVY59zH6yhYV2TT/F0e38dT+AYALjE2/Q9kGNu
         CY2v6rYv5ifiYYLexNVzcyWDKCbL92R/xDR8P+QS7BQdPLm3KlN1WWrWy60aBXN/FYru
         HVgH9Tno5FLswfe7tmQz2i2KbqWFqW1sUw+yg4vzhp/980i2aV9U0WfSQZX4rVcT523M
         s13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846236; x=1751451036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyqCTrWRH38g5oBlyqrDfAPMaqAjSD4w/gNXRimf4zI=;
        b=WunblSG5JF8NFRoEGWHJ/61nlHak1F16/r1JE4+nAXAsa+m1sySp5cdD78m2PVgjVu
         97AFIS/ondKSrtZgdWY16XSddoiF4yBZ0oJwEhulbSMjVcbiVb3nI2s+yqwU8GASBkAF
         dw0hmW+vQvCSLUJGtaMvlsy4DdMvUyfqGXcQPpErG/nn2swCBcEwc1XVmzbwclGDM0HG
         lV66Lw0yAx8QEs4mRmQz8mj0UniPqAcXLoXGxwmmRqHFb2WrV5vyEotiz8AtOiqeogYK
         kaT5RSAHWs6bsLtJ3re+rFth9CtWvOfNk5TJ0qWKTAANRpL3kV0DGcxtxg8BMY+QkoyP
         RkOw==
X-Forwarded-Encrypted: i=1; AJvYcCXKEQF6G+HukiujFWblE4N0lCo1s8ENKvMYXH85k8voNvgtU5iHCPm+/7g9h2kCckvgxyZ48CgRpjsPDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YybPIR2KrlHfzLOlR/oVeXtQ5PWbPR8oNDJUrN8Tn3IJ01sOEIh
	nur6NFY9wGlZOO7ORZ2EiLddaO+goKLWgLtb/wseR4Xxe7lAAOrCVkVIKuiuZcHksVzUNUuuIBG
	82njGR6sMhHKJiugG9NOjFr2ifSkKNMCiRSRrxM7O9Q==
X-Gm-Gg: ASbGnctPn/mHPzycrZqM2WXOWsqiuRPlVhbgv2CjoX3+XDXLV46LqATjsqeZLw4PbrS
	uKJGWVt+EDXMbNmJm8nILBySmTQIzOwave6cFUGm4qAkSyL/QLcQ/b4OsSrXcPH6PyxA6SKEBMB
	7LdZVoS+b1zqCAguF6O4CCcHRP9p8uIZKLY1ESWpKYsIw=
X-Google-Smtp-Source: AGHT+IGe9cdom9zPx5u2qPQ0tKYQR48QY3X3hjRnSL5OJURAbiiA4qXISjJMreIIdvqnR03DBzmyaEkxFKrpD5ccSCA=
X-Received: by 2002:a05:6902:1703:b0:e81:9aa9:88d0 with SMTP id
 3f1490d57ef6-e86018ef2f7mr2666888276.40.1750846235599; Wed, 25 Jun 2025
 03:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250623114429eucas1p1e74e09e74c5873b2f7f01228073be72a@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 25 Jun 2025 12:09:59 +0200
X-Gm-Features: AX0GCFuzRfZFQhIpkvF03Pc7_qxAuJk_yHypckCZgiSZSQVUDRcV_4FwsCAnQX0
Message-ID: <CAPDyKFrCeYxtqscX8Vr165HMOcSof_d62PMtRwt_yDyZ4ujSDQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] Add TH1520 GPU support with power sequencing
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
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_031036_778620_9B3FBF69 
X-CRM114-Status: GOOD (  22.72  )
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

On Mon, 23 Jun 2025 at 13:44, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> This patch series introduces support for the Imagination IMG BXM-4-64
> GPU found on the T-HEAD TH1520 SoC. A key aspect of this support is
> managing the GPU's complex power-up and power-down sequence, which
> involves multiple clocks and resets.
>
> The TH1520 GPU requires a specific sequence to be followed for its
> clocks and resets to ensure correct operation. Initial discussions and
> an earlier version of this series explored managing this via the generic
> power domain (genpd) framework. However, following further discussions
> with kernel maintainers [1], the approach has been reworked to utilize
> the dedicated power sequencing (pwrseq) framework.
>
> This revised series now employs a new pwrseq provider driver
> (pwrseq-thead-gpu.c) specifically for the TH1520 GPU. This driver
> encapsulates the SoC specific power sequence details. The Imagination
> GPU driver (pvr_device.c) is updated to act as a consumer of this power
> sequencer, requesting the "gpu-power" target. The sequencer driver,
> during its match phase with the GPU device, acquires the necessary clock
> and reset handles from the GPU device node to perform the full sequence.
>
> This approach aligns with the goal of abstracting SoC specific power
> management details away from generic device drivers and leverages the
> pwrseq framework as recommended.
>
> The series is structured as follows:
>
> Patch 1: Introduces the pwrseq-thead-gpu auxiliary driver to manage the
>          GPU's power-on/off sequence.
> Patch 2: Adds device tree bindings for the gpu-clkgen reset to the
>          existing thead,th1520-aon binding.
> Patch 3: Extends the pm-domains driver to detect the gpu-clkgen reset
>          and spawn the pwrseq-thead-gpu auxiliary driver.
> Patch 4: Updates the Imagination DRM driver to utilize the pwrseq
>          framework for TH1520 GPU power management.
> Patch 5: Adds the thead,th1520-gpu compatible string to the PowerVR GPU
>          device tree bindings.
> Patch 6: Adds the gpu-clkgen reset property to the aon node in the
>          TH1520 device tree source.
> Patch 7: Adds the device tree node for the IMG BXM-4-64 GPU and its
>          required fixed-clock.
> Patch 8: Enables compilation of the Imagination PowerVR driver on the
>          RISC-V architecture.
>
> This patchset finishes the work started in bigger series [2] by adding
> all remaining GPU power sequencing piece. After this patchset the GPU
> probes correctly.
>
> This series supersedes the previous genpd based approach. Testing on
> T-HEAD TH1520 SoC indicates the new pwrseq based solution works
> correctly.

I have applied patch2 and patch3 for next via the pmdomain tree, thanks!

Note that, the DT patch (patch2) is also available on the immutable dt
branch, if it needs to be pulled into some other tree.

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
