Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8267C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 22:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ciamim9QWMl2dVbJBMc+vjVOcBHiENW61+NjEDqnLxA=; b=KGN0eIvSjTJVyb
	XVQboNcb2PWatK94807urjUdETIQgzbjEblMlBy3HgnlrLXkAgkqCY55Nph37EgTubalKoqhQuUfn
	ymvyj49tKKlbkgQDrHVf/NWdpZ9GKyg6a61Iwu/igDVnc/5NXFpGilGBl3+n3skMfFiHBTLtQmFqf
	KOg4duz2QAhoqpZ1oXu3+DUSMxml9fCGjSZs3mfWTo4OkHK2K+MivDqIymmm+4lXSIuRxEx6QlxTo
	maDSa/mIuIeq8PHXY4AyJDg6ASYix47Y4DatpbMzuViBnYbDz0wM9+oMQ0EXSHspXCQlD07pLv+kr
	v2p3cdzeozI/1KED6CSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReZJ-00000008UfG-3OvG;
	Tue, 17 Jun 2025 22:14:13 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uReZH-00000008UeU-1IRE
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 22:14:12 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso7265439a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 15:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750198451; x=1750803251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rht1pWqTVlNemlSkA4kJuYwRKU6KD6oE4FAwP7gkVd8=;
        b=mBy5oXEAnt96PY80L8cnh+M3h2GtorRUcqOL4syX0vjcpZjPxl3mka9x6kFaYEQCKc
         ewSJKdz2wndOUQjWJxe71twsBGZm4RGkFuR4ytjVQAntGE+zvPeXMcIYBB0OqIYSCHVj
         pWv5DIRz1cjVcapA1/wqwzC8AQdIp+nzJkkXA2EP0nojajxv6Y+GCeURcMKqSrd+0AR4
         2YAfgIWhk85QrSOOgnPsC7YwjyThTOskPwdEe1dKZ4crjmQOq9zaPRkzTk/9ij2HVzIx
         m6kMGSsFA16E76wRL20aDL8hnbgUFoJd8oACUsF+RmrRVxroMHX50fTnzeqnnvZNsJ6x
         8asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750198451; x=1750803251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rht1pWqTVlNemlSkA4kJuYwRKU6KD6oE4FAwP7gkVd8=;
        b=fJNW/d5ZDyjAvJhTljfLz4K57J9+a9wRYE9MgRtI3Tl5b/HevQMP3bnYsNUkLpi9ve
         tGIm1Eo/zz7+hRgLYwrGdKldK93TZ9B21oC9O/5JuhTBPVIi+zlW2tMYO9hCoDZx+2CY
         iHK8FpkwQ6ci8+DgH4ctrMYNbVi/020vdoRF99P3vMSW2CpRXlgt5jHelWZXzclfj0CO
         zNm+lkr09uueXJvsUhtJUwsOy4F7SUNdk0iBsruTvsdrbRxabQx0gvczJ8Lvl4/uFOpn
         1NdnwjlF+oko41i/Xuq7Gzte8egFJzS43qAVIdqjzPPsVC/n4E0Tr9Iu1z6ZnUxT93Ij
         ATOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyb++Tryptz1tFutaRkysl++jwqm+rAwLcxTO3ipXA7qoJld2ZXJmQXFGyroLa7TC/ebkpuquxnaa7Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy18cw5X86oSId6dMhacTkjaqi2ThjhyRmh6fycxuQSzX/PdFu7
	7jGRBJh7SehfBzRlajJF2aAmth0vWn66tsuEQDkd4UvZYQfeokQGS6/bz15nA+S74Uw=
X-Gm-Gg: ASbGnctpDAkwzZWwBijWcZT5wB4BtDGBLx3XcKTeP9IirRP6Ju+1ZcksE98OIOZQtWt
	67lB3eP8Xms850kR/hsAzBogDSkSXqxycUOqyqdnVJZq1PTETd2T2u5ggVFMOG1y9PwL1M/QHsj
	ogT72KdrnGau8UQtMs08EdT+Ee9riFtKkbxejRqXrX+/3jSLm6I3RESUT6SwAmwm7CwM74G0pCM
	7jvcXSaxoYNfwtmTy5mVbocFDe2lBEjY5zV6NC99VCey0uKm5XrQVJdb9ek4SOz9LFgQ44N4v9W
	7ZlRwfMPzKs8GZ0yDyD5MmZWZSkEz8zY2htadl0Bxoav8KJvDJ48TdGfuGpYqtpqwplEoGs=
X-Google-Smtp-Source: AGHT+IGjtDH8+7Qdmc6DGmjSJpavFXI06zS+xsVxnGKMVqLF3EoMugjqqf5A/sV2C5cZ3H3jbI/Tpg==
X-Received: by 2002:a17:90a:dfc8:b0:311:f05b:86a5 with SMTP id 98e67ed59e1d1-313f19d2977mr26267870a91.0.1750198450546;
        Tue, 17 Jun 2025 15:14:10 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb0fabsm85895565ad.181.2025.06.17.15.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:14:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:14:08 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aFHosEvn35Fr3LFv@x1>
References: <CGME20250614180906eucas1p116f8a13a4013edd3bbedfd2e4a8b0aa3@eucas1p1.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_151411_584951_996D54F6 
X-CRM114-Status: GOOD (  26.51  )
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

On Sat, Jun 14, 2025 at 08:06:06PM +0200, Michal Wilczynski wrote:
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
> 
> An open point in Patch 7/8 concerns the GPU memory clock (gpu_mem_clk),
> defined as a fixed-clock. The specific hardware frequency for this clock
> on the TH1520 could not be determined from available public
> documentation. Consequently, clock-frequency = <0>; has been used as a
> placeholder to enable driver functionality.
> 

I don't have any more information that what is in the public PDFs [1],
so I think it is okay to have a placeholder frequency.

Is it the case that the frequency doesn't really matter from the
perspective of the driver?

Thanks,
Drew

[1] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
