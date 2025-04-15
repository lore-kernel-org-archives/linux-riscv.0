Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB3DC369B2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 01:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqNZZiMkBqPlk+CfkzvAP26Bdr/+9zbuA8SUmdweiwM=; b=NwoFVMjZnIeO2v
	FgI8y9NjNNcGHY/acluBwnv4TXuB6clpUQdkfZ+R+wAzj4bRvakFEEB4NYzqmodLPkbWtp3djVhiu
	Z5PTllnu6/wvoT2IzbahdoZZRpiuu/i7lRVJpBEv9lNSGa9d9AO8zpaf3HGG/7g3X59+t95qZYknW
	y435Eng9G+msQbb8G9oEGMIoNF9S9XxEhPgpBI8BGPPxtmZEmAD8i3/ONY4kIxHg4GXdYav1e8yL4
	SHxIvRbypGnBwCqwgD0adGTYPcn1eTnLNqJ3f0agswtHI4O/wLkGEijEszs20gQOJVJA+aqIRlt/y
	kISYpN9JLTdbRWcGiSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ufn-000000044HF-39T4;
	Tue, 15 Apr 2025 01:01:11 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ufk-000000044Gq-3SuT
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 01:01:10 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso2106480241.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744678867; x=1745283667; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uy7YAJZKOai1D7ABZjjN+bQn5zDwS2Ij5HcVijKw7Bs=;
        b=XUaNzv68QwA4K7hfRjtVTKKN3NJJmOYwP88uJjkurDR+WcBk1yg44cl4wyZn1rUsu2
         QI/txosVrui4DWEkdU1wSQZXCRKDVyXo235m0pOygc1fblMkG0aXupvXlFb2qqyxcrz4
         nDsx5Rq+QQmYWWvpFIdzE1ISZ87FhCXgRR3ZGcEZGPasvqDKWKE1ZvISruGeypKqHU7r
         RP5SEjkOMehculyLY1uSgXN5GsH9tUkgofuUzk5MLWkCyffd5EGCAQIZU/d/0LDWejMc
         jce53J/LuSYNJrShsYBQk0fUONI4X5Sk9qiYLdjnGRXFS2MQ6X/tVSwcdgu8H+21KZs5
         e2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744678867; x=1745283667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uy7YAJZKOai1D7ABZjjN+bQn5zDwS2Ij5HcVijKw7Bs=;
        b=n113PfanmE/yzcprtDZgmJZECuCsPKqDyBYjH2rwKsvXtLKGfG7oY/rft1NMRuhFRC
         jiq2XtW/5XW8fj0qf/Ga7Y2M3amaLX96aNN8m2JXeu8BFPktbESm+zQIevsV3YUwniQ9
         ln22B3m/4XyOZBmryk46AQEiVwuuEtfDjfX2wwKmNQbAJY3eIMAumYOAXiN09wP2ZMr+
         gYcU0jaiDqsJqM5CgiO7m5VpBGXKq3BPJezknw0AuJ7L6/KcN0BlC06PjA2E+RrnpjK3
         zZAMcWHo5v74nJmV3NrLw27VVvcn6oKvVOrcSCU1zqQeIOcBRcmBs6Fy5H19YXIt/wkF
         JQ+w==
X-Gm-Message-State: AOJu0YwbL3zeKxTZg5LJF3lCDqFi5qFuVRAbTYU9xLxuV3YXdCWCoy4v
	mu9gbm02y9JHolxY46iiO10DhpJojF/WCC9egVZMmAt0IGTX+wYP
X-Gm-Gg: ASbGncuZZlHtX5C+KOyq3LofVoytHbyGTY79mcPgVC7C8kgISIuFUyEbaF0m529MVnl
	5rZvg/mwteWlTwWGhFoudn/6dChsdAvauOeWs0kGPeA8IwdaxTbRY/zpP0muQpra5k9Dmn7pgCc
	bzoy8WzTUMH0JSXLepXOr5kubUd/UDN85QnvltxKJdWZfAQEkEJH0KCKBrFXgy9B5mA7KyFjsnZ
	k4wbhprWCcoEUf6rFROd5WBYFOhdhxLlVFyIfBNEMx5uYWqEBBVG9Ym5/ai42CLt47N3mh+/ILV
	rD4ub+/pIA7XH7Hx
X-Google-Smtp-Source: AGHT+IEg5WHo6qDq3mTM3+gnVU2hOs9hdPqiMDeyWKuT5X6RpeIxFCETbXntue45FyG12HX43MWGmQ==
X-Received: by 2002:a05:6102:5489:b0:4c1:924e:1a2a with SMTP id ada2fe7eead31-4c9e504c3aemr10457091137.25.1744678866709;
        Mon, 14 Apr 2025 18:01:06 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de970badsm92754026d6.26.2025.04.14.18.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 18:01:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:00:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <smgd2dymwnxkuvi4nevukt2fxcz3b5vuqt6wnuc2cf2bqaxisf@vtj7qnd5ws4t>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250412074423.38517-5-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_180108_868348_F5ADEBED 
X-CRM114-Status: GOOD (  13.39  )
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

On Sat, Apr 12, 2025 at 07:44:21AM +0000, Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy
> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  drivers/clk/Kconfig               |    1 +
>  drivers/clk/Makefile              |    1 +
>  drivers/clk/spacemit/Kconfig      |   18 +
>  drivers/clk/spacemit/Makefile     |    5 +
>  drivers/clk/spacemit/ccu-k1.c     | 1154 +++++++++++++++++++++++++++++
>  drivers/clk/spacemit/ccu_common.h |   48 ++
>  drivers/clk/spacemit/ccu_ddn.c    |   83 +++
>  drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>  drivers/clk/spacemit/ccu_mix.c    |  268 +++++++
>  drivers/clk/spacemit/ccu_mix.h    |  218 ++++++
>  drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>  drivers/clk/spacemit/ccu_pll.h    |   86 +++
>  12 files changed, 2086 insertions(+)
>  create mode 100644 drivers/clk/spacemit/Kconfig
>  create mode 100644 drivers/clk/spacemit/Makefile
>  create mode 100644 drivers/clk/spacemit/ccu-k1.c
>  create mode 100644 drivers/clk/spacemit/ccu_common.h
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>  create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>  create mode 100644 drivers/clk/spacemit/ccu_mix.c
>  create mode 100644 drivers/clk/spacemit/ccu_mix.h
>  create mode 100644 drivers/clk/spacemit/ccu_pll.c
>  create mode 100644 drivers/clk/spacemit/ccu_pll.h
> 

If possible, split the patch into multiple one by the compatible
so others can review easily. Otherwise, it is LGTM.

Reviewed-by: Inochi Amaoto <inochiama@outlook.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
