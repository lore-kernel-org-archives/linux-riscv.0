Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80B6C54FB3
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Jun 2025 18:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=311/T2Y4+dZJyQ6Zi+FOO9JdwJQhGIqcwZQpvs3gjJE=; b=QBTpdd/GPU0ga/
	Qy9/WOdiAebczdZa4+E1fh7sUS1ZSwCrnZ+DhJp/8EvBzcoqV7maT9g2yBYHvVxJzKfZmtbAz4qKy
	awU4Y7X9ywYpTC/WecIguPXTJGU5HjQex7EFcXLpS0LWX1mNq49dItD6wEeDYcTScbDdF2OKNTvJ6
	cK64LYS02CH1KaJg5hM5s4n7BhPfSzh8G9kPKP3dS4l1BOenxTIranva8s92n6XZPT8G7tT+co/eD
	7JmyTY6V+b60FMk3dyGcMmJL4j0R/OJWUYsaHeywtw0qJZTcp2L78wWV9B9diNHU892tPtUYwexNC
	n9wML4J8HAnAG99V07iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLnJU-00000005piP-2nkU;
	Sun, 01 Jun 2025 18:21:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLmfq-00000005mnX-17sS
	for linux-riscv@lists.infradead.org;
	Sun, 01 Jun 2025 17:40:43 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-745fe311741so4068171b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 01 Jun 2025 10:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748799641; x=1749404441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FGcwYr4Y+MLOa5A3Y1t4BMM/OO3+HUq+DjYuxkG81Yg=;
        b=3FmWKrP+R574gWtzYsTDfEF82k+5kfT/9v7u1ziUXRxLwDwdU5QwCBjPOh/YGKT6Gg
         rZsMNItcCbFtUrK7z+vwgANOz2RNTyU/DJahAwomOt9tthQKu3BZhrnvpV+Oza5sV1fD
         pqNppECEPE+eBMhIpd4MZO2dQyVr0Imt4wmI2z+50O/ET3mNvBYM2psvJfz1Ex+t/+a0
         MQDUYIMW0yQGYcLd9OeBhluhmEJyNY7RzfwfEJZX/o5d9RpsbZuMYuL8cJKUyW8ZEbgs
         woL5aZtdr+/6kSyIgVeWMyjYI1W+g0J2brT00WJIrB+2mukGCOhQY+6enj1+lFSLvzf8
         LSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748799641; x=1749404441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGcwYr4Y+MLOa5A3Y1t4BMM/OO3+HUq+DjYuxkG81Yg=;
        b=jjT0WvncdZfdjfPguq7SjAE4wmZ6l0BE2K2QcD+fIVRsobODVsNJZthPKgv0EKJYPn
         g7oNUeEOri/lGsLTne7bH+ng7G+QFvdZvnndZKxS5aB5jDD6dQGcT8EUsvTPzmy+gr2Q
         RnuX2s1ID432CLd0U4rouug8xfMqMCYxrQB+nCpCEon92dUefiYwKnRtxoZvA+UxQ8W6
         lirIioLvAwNtqPKW8YBlR07a6AULPeqaUC4V+1Kp/CzcHkkylau26Pd/sYYl8Bnemxka
         0rAyPyRDy3WDA2KjC5U4MPm73dGcgEJDzWYIMIeF2y9NL96J6oFV0ks6mwPieZoTD1WI
         XR7A==
X-Forwarded-Encrypted: i=1; AJvYcCUBJ/HG59rACvLQ3N403WjbinjJDA3TYwTxnd6BLANEqNjPXAbRkOINdA5Djx7vCCLf6Wy81tMGnPM3cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylZ5xyYcjaid77XRDEe9+Dm3Bm13wlyjf0T5gxEIGAjZcZscZI
	lmWDbiiH7gBSCUf0gPdbiaJb5FciMlHGfbljROpa0DbcP8fiGMwr4i8xh5guzadyWrY=
X-Gm-Gg: ASbGncs8XP/8HqCrZ8hwZ9VfSE8XOSFoct4/3CV3IP7/XDbWORN6k/ahF6xj6h50BLx
	WT6gpAYRUDWVhi78p72V3GygwID6k9GWZd/klsDCKuU8QXLzrDOuTUk5HaalkXwqGOCNP4MFqMo
	FRAt0dfd081NDMPJIAkD9y858OYBKd/bapqQeImJB7bOvZMXExYoBkK2LD/wM7Lbt0LSAV4ngD/
	JuSi/MyHDLfmbGpS69Pd/k3X4QhuktinM80JzVWGbJLmS0CSSV2CpB6HDO6++A6zzW4FdOt9j8A
	8MJmYp+j2L/arHovtF7OkavB1TpEToe6
X-Google-Smtp-Source: AGHT+IF2ujxBrmibEGhRD1r5ubHgFgoV1MofVKpoxo8rCC1rOV+5p1PoXq7rqs5EnyuTlJRwnhzInQ==
X-Received: by 2002:a05:6a21:600e:b0:1f5:8622:5ed5 with SMTP id adf61e73a8af0-21ad94e20c0mr17874238637.3.1748799641313;
        Sun, 01 Jun 2025 10:40:41 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab6b2sm6352890b3a.57.2025.06.01.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 10:40:40 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:40:38 -0700
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
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 5/8] riscv: dts: thead: th1520: Add missing reset
 controller header include
Message-ID: <aDyQlqXhdgBAoR8D@x1>
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222407eucas1p233be883d7e84e5a000e4d44b37cf7265@eucas1p2.samsung.com>
 <20250530-apr_14_for_sending-v3-5-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-5-83d5744d997c@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_104042_309092_1B00DF7F 
X-CRM114-Status: GOOD (  17.49  )
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

On Fri, May 30, 2025 at 12:23:52AM +0200, Michal Wilczynski wrote:
> TH1520_RESET_ID_GPU_CLKGEN and TH1520_RESET_ID_GPU are required for GPU
> power sequencing to work.  To make these symbols available, add the
> necessary include for the T-HEAD TH1520 reset controller bindings.
> 
> This change was dropped during conflict resolution [1].
> 
> [1] - https://lore.kernel.org/all/aAvfn2mq0Ksi8DF2@x1/
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 1db0054c4e093400e9dbebcee5fcfa5b5cae6e32..bdbb1b985b0b76cf669a9bf40c6ec37258329056 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
>  #include <dt-bindings/power/thead,th1520-power.h>
> +#include <dt-bindings/reset/thead,th1520-reset.h>
>  
>  / {
>  	compatible = "thead,th1520";
> 
> -- 
> 2.34.1
> 

Thanks for adding the header back now that there is no longer a
conflict. I'll look at the rest of this series and the rust pwm series
soon, but I just want to send a quick Rb on this patch right now.

Reviewed-by: Drew Fustini <drew@pdp7.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
