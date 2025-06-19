Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBD5C7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 01:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQDUY5VijWyrH9w2we4zRSGFehtLIfE51RUnvTwMbKU=; b=jhxW3gEs00mxaA
	K1m/e4Y4pDrsxBDW283JP7WjFyF8BZAMF7E9ZxSKJQ6YctOHnHDuZ9lDC1ZX3DIFzaUEXbn+osZm6
	uZcBlJxp/tOiVUogEoeY7pZLql+ZVMAPpqcTjQ3xxyFwpyMCshjhVNRw1rGtrsbMzmaOHY5WcD5/Y
	V4D8Efw8GNRt2m87xEqM46G1+EV8F6C88S0KlKAVz7VBi7hdp1c0rYL/dczJjAKi6OicS0dmnNB3V
	Sk/+Rf1ye+ZS/oxnEZm9HXdt2z/x1EExk0r0ZaBGC1sB/Kra4o+Vd7Kj9vDrqXa/oRjbUupP+w8K4
	DT8CWGe1MM0Q9pUl5ijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4JY-0000000Bluw-1lQT;
	Thu, 19 Jun 2025 01:43:40 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4JW-0000000Bluc-0qgE
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 01:43:39 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso189138b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750297417; x=1750902217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9RBzLiRa5kP007xKu/khAw6xLYgVFKSnX02dITEELMQ=;
        b=y4JU9a9c+9yqWdVNIT7sihl1fCVCHhPb73ndtATr/0TLdIQA2HQSsED6vounmdu6fD
         eJ59NPoGpT+xYXX09HQDbpa8PKe2EApo1RZN+4MPqIGakplPMQ1eRQwncIxUwpxWCjK2
         umrHHot70NdSLt3iVdBBLV5sVFBHvgNgo6uB/Z4rzfJoGG3b3H1lJDQDlkdJRe8GSKxQ
         3JYr0ganSL8XSoZbh9EUxkRGOxQXHwT0b/yufOILw5qgwfarSCzf+8+ApfaTKks8TQSP
         EmZHp1Eapq+qv/VnP1PG8HBgi3pbcxAPO9qLZB8kGV/a2WVw0Mgr8jgzBctet/hyTEDW
         a57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750297417; x=1750902217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RBzLiRa5kP007xKu/khAw6xLYgVFKSnX02dITEELMQ=;
        b=LCDi5x66ejlTJ5bUnG5q5CDxEfzKj/zr3wi9mlcY6L7dZDbnuB6qn/M+NjNsDL1Ql/
         e30BuOzT0QS1YUkPjbRvCcSkpNN7u264CS8W2OHYTBpG5qA5WzgOo3D/UcCyk2DoL8Of
         A3LzwYoNvqiBZbkYV1eeGMifJ1LatEnCeDuV+9wojVXsK5nEp/U85DMgPQ3s940rJ3yV
         T21Qj+4hgo/IGhHdlxUdmUpum1w0uHCYVMftygVy9nfNscN0mPdt9WFV0vKJXO6MlVGh
         WLhUeQiKw7UvR7+IjkZpXcfvfmzjbQxpMUbweLVqIgGWe7A56j2E745wZRoADD+kMkgc
         5liw==
X-Forwarded-Encrypted: i=1; AJvYcCW+1t0U4olV/4f8XgNp2Z8Br611P/uvRSJxzhe2sAl//3i7FNoVSTOMtJLFzct4eigT4YNJSU4U8xUBag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/dx8JliiCidFvNQw7xiILLJZcWNXqYO9HTEFk/aB71s/rGobq
	LQ0LqRpkE9SOYYlDU5mjQSvQ2n6GDT3wXY3jK3bT1DKJCNSCXJjMOlK+o4iMT60hi0U=
X-Gm-Gg: ASbGnctiJ7a9F5bpRK0ECM3iefeO8lB0Y6baR/4X+102nMslwhy7yhN00jqr4jypvqJ
	pe3APxhEHvQ5lNAV9buBX1Jt+DGk2Cjc8RN10yVFhq2ey1WJ7vyvynphcrFjodOGB4x13JfNcbx
	WeNp+/upG9HJRpguECKs72YAxwus7Fi0wP/YEBA0LNR0SOpGit8TBb8NcCS5KM00scEoDfyYAyE
	IoZmYes9H+KBVedF42uaT7iSKwhqmVck2gjNLpJ9H2C8U1RsPIUW3pusVMnKEyPiruGUvzoWkqp
	C++D+gdewTK3tJUeahIyziS9HG0ajbm7iA6tOsTceakaXtWJ/UaEGo1Vt3MwMadxZEwpIgU=
X-Google-Smtp-Source: AGHT+IER1GlKqenGCJq3qD2Xqlv8+ahed3DymdmXx7TwJgKJZxq18ZlqN5MmHKY9e5pztJs0I4bquQ==
X-Received: by 2002:a05:6a00:178e:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7489ce45893mr32194637b3a.8.1750297417247;
        Wed, 18 Jun 2025 18:43:37 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748fbce0f13sm291934b3a.37.2025.06.18.18.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:43:36 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:43:34 -0700
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
Subject: Re: [PATCH v5 0/8] Add TH1520 GPU support with power sequencing
Message-ID: <aFNrRtbWzeRa7GmQ@x1>
References: <CGME20250618102225eucas1p129b1172bf54521c1eb0f718cb31af468@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_184338_479332_135592B9 
X-CRM114-Status: GOOD (  22.88  )
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

On Wed, Jun 18, 2025 at 12:22:06PM +0200, Michal Wilczynski wrote:
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

The powevr probe complains:

[    1.060383] powervr ffef400000.gpu: Direct firmware load for powervr/rogue_36.52.104.182_v1.fw failed with error -2

Where is the correct place to get the firmware?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
