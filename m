Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50550C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RypmDtEXs95ZttcInAWS5K+CRmm11/NBdQ3szrucses=; b=XIYzFe7zRXeMAQ
	uoQIzjAowso/X24VDVrYbyyJcBsLBWOxgiYOHn+caqkQPW3DV/xcXvj3qsOagucfD4HvATgGf5qU9
	9MBfmE4wryiCzxeYCoyeR2tId/p/E7EYMAHZDFEasXxeed4yjMS98aAen2ahKT6o8lgRBSJ5PLJCA
	dB0D0ypfVMrI0wrmhoYY2BsjPcjj8RTjdFcVJWol2AaQQBMbDyuKEevO3wqK7BpVaf+DSefl3Gm/B
	sDZ2zLWB8Q//PPecbCO+vV87B2urGnleXNgPrMXI3z/g7i86A4aW+NzMuWrq+naq5a1Y9UA9U2xAT
	JkW609jSlzQf0WMHkuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3vF-0000000DtMi-2ZlA;
	Fri, 27 Jun 2025 07:54:57 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3lo-0000000Drql-3qPz
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 07:45:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-234c5b57557so20088115ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751010312; x=1751615112; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kwXMa0RVLz7EpJ4koQvotLZKLm6G+hz8I9ALzuYytU=;
        b=VqirorWxyHuGZGGXnN/Oe6EwRTm0FuqEOC1ezRAw3qsl/mo2BXPgLcFQmAGww6oycv
         +CDoA/rjqIKfbopkwzbCp7gW6p/JOhyHcfn2vPNu7gv/Az8uWJmAUukhxSfYRPtQ0WzN
         trKlzNDAppJGKZuDEo2k2xqSaXeLbh61iTLy0auucJy1NQWkQCV8/XbIiKAzoSv08o6e
         KvxC+fHoK8FXQ7LW56PSkeg870Uz5a76g8g1Uwi4bAoEoIWQSQwkj56pv8zJp+p4of8B
         5+yktbMlBeJ3I9jG62OueUJ76gkCVBGv6Jd7kH4Y1P1a+Bn8VEzDO0Tu3sKDtkPDsihp
         llNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751010312; x=1751615112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwXMa0RVLz7EpJ4koQvotLZKLm6G+hz8I9ALzuYytU=;
        b=Q/Z7zaVdhqil6VIGw8BthDRWcIliFRil/C3waalGs55sVuqjtelaxrPkLumoHH2u+t
         jZLUhViF9hQWWPCU3YUd29sq01m+Is5uIldY1BBvggHhdI4rdfezhBgN3SeBob5MIkRB
         S8Gl+oxXWAyqAFiDlNBDuwkupC69XmKQlruc/eHHr+cEZZtbeopX7sSMTqC7/v1jDBro
         kF7WmYgzyaGSZPNd2A5b/lbw2Zkvg4rgTGK3+ZBYoy9iuvX1w6HD+VNRCP5nyY+IgxVs
         StkJixxYv0E3l9ixus/1cO6ucw85/J6i2TQRAHigfJefc4NvSh9G0I1AmQ7NZYaOxnDe
         xI9A==
X-Forwarded-Encrypted: i=1; AJvYcCUyAG/jV0bdzHjAZRf1kKfJVHpVmmGexdL/Pltw/ZeqAjKfqNRWHR8B2x6GBLFh4jyMmI2OfyvqSfYQgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkDjO2W9O+15EjQHjyR4ye4ieCsluZ6+gSNndwjhA9coESGpun
	dB6lpd4GzAjEmMnbz0QMEmPm8OnD5HZQPg45nETjH1Q+ol0/zMS05v92
X-Gm-Gg: ASbGncuosItbd3vL5Y8+L8dZejOM4AoCyKTh2qS/cQiLdK5B3a4YqlhLBcagE5l6x13
	zhB4ABL+pRrdpljatH2/MGdGA8WKGSNQR071g4AoCEcQfLTjusIp1Goy+AEnIgUcwL1SUJgn1vB
	PKFKa9pILxRluxJuBA6RMCgu7m1xbxIT88y/BAYglgG24dYAba28rQT3ANqphS2YeUX81sX7SDK
	t1HKjLJ/FpwY2oUy9GLdr6F49TiBik85pgB2HsoxIp5COFz5qo1IPWivKBtfKRvCOeRnTBopQ0G
	wB2ReAga4iCYIgNXKazYKPTyhw0xC+xTIgvp/Xb/O+61HiooMO4mq3VAdVPUfkDbjebhExEL
X-Google-Smtp-Source: AGHT+IEosVdRq8jswGr8fyP/uRwtM7xveOdc4+/YhWRKXXFAv1fBojRPrGKTceYMplzzNMFyzx4jZA==
X-Received: by 2002:a17:902:f601:b0:235:c9a7:d5fb with SMTP id d9443c01a7336-23ac3deaf2cmr35094145ad.16.1751010312004;
        Fri, 27 Jun 2025 00:45:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb39b99esm10595105ad.102.2025.06.27.00.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:45:11 -0700 (PDT)
Date: Fri, 27 Jun 2025 15:44:58 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, Ze Huang <huangze@whut.edu.cn>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Message-ID: <ep7gbthprqyzfdcqvs3wadqflyusdsut3uxt5wv5j7mvazyl5s@muk77uizwcrg>
References: <20250617070144.1149926-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_004512_958573_3D4B51D2 
X-CRM114-Status: GOOD (  14.35  )
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

On Tue, Jun 17, 2025 at 03:01:38PM +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.
> 
> Changes from v4:
> 1. patch 1: convert the compatible as entry of enum.
> 1. patch 2, 3: apply Alexander's tag.
> 1. patch 3: apply Junhui's tag.
> 
> Changes from v2:
> 1. patch 3: fix wrong reset ID.
> 
> Changes from v1:
> 1. rebase to v6.16-rc1
> 2. patch 1: apply Rob's tag
> 3. patch 3: fix wrong reset ID
> 
> Inochi Amaoto (4):
>   dt-bindings: reset: sophgo: Add CV1800B support
>   reset: simple: add support for Sophgo CV1800B
>   riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
>   riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
>     SoC
> 
>  .../bindings/reset/sophgo,sg2042-reset.yaml   |  4 +-
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
>  arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
>  drivers/reset/reset-simple.c                  |  2 +
>  4 files changed, 128 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h
> 
> --
> 2.49.0
> 

I wonder if the binding and driver can be merged, as many devices
require reset to functional normally. If these two are taken, I
can take the dts change.

Regards,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
