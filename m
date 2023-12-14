Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14668C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2h7fq/c6HpDN1kMGfn2jAI4QureAy5Dmx65L6umS5MU=; b=3FahjY/tmFCKuy
	lOy7U+nSsp3N4mNit0APXfdHT8uyeQzvEWdIURoxs41ENfqki90hf/6c0Xa5v+YXDWWmdH4Uwzx5l
	aUx2Smponl54FPU4raRAwNdLu+YtpiEoKeIaJl4sD9aVR67/OuK3pA1dZR1Fa97lVeiVy1KaiWijH
	P8qazjeVul+trBDA9o/WM2d1QeMCeZussJG6uDxwJFknw/RBx4retpyQ3Wfjey9fAMu9OWnUxU9cj
	3ClmePCtKtVd9AVLvKh5SQrTh50h55GrCCDj06z4sIbA3L/3vf8WKu4bT0wlOsnePE0L/PhqCBrrf
	ZEZv1//M/dvy/qKrK/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDjiI-0000dj-2l;
	Thu, 14 Dec 2023 11:17:10 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDjiG-0000at-0U
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 11:17:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so6865865a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 03:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702552625; x=1703157425; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PhCwqmV8xLeKliC/IPYCJgesOy9krq9jbqPfrEK110U=;
        b=LUqVEJqHYcWdrFWziRjxaYpk/ZMuKwNM4a/5Fg2bekkQkNcdKnqmuAYNEJNeFn9gJ9
         c97zL2WzlYJhSxXQO/v9OkahQCJFyke/7M6pYHky7qmHOHSATRYpCHILSJmYxPCBSZ7v
         Ji8MSlaHIpG1jn83uGH0Sq7QXBVRYiq3E5bwVo0/5V+h5o8+NQjT0gfAVYl22Dd6D+Nk
         gk0gBz+zfSwlwt5A1yRPXzMKx173SBePJ5yndDpj7A9kqrtSSLeCk3D9LUB6VXmERZKR
         fF8micMVYfyw3+A3EzDUiQf91T1LepCmrNHX7Dj4aEAV2BnzcGtHUG9wPvKhsUO42cTW
         tlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702552625; x=1703157425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhCwqmV8xLeKliC/IPYCJgesOy9krq9jbqPfrEK110U=;
        b=tg+QDkt9KmvyKBVfZxi20pu5X5z8kNM4MBxkgwcaGyW+SjYDgbx5sLwSqDKsO5RnDD
         BvGt9geJgYQepUmOkTaOii1560LvXSbCxI55KRLlKcd3u+jMQc6pN0lJCIaNRLQXjvKn
         YbA2Dd1Q54wiy5k9oH6qH6l1Zu0Pky+2zBLg10BdIg+BpKQQrXL6oQWIQ6AqAtjMjtGU
         occwx0ixCE4dUpY/+1Z8sFLyB7Muwwjevm55ADG6LiWqj6ZATo5RRN8asIBi4opl9lb1
         Ap4TardBcZmnS1zd6NFSnGrtAavkn1K2kho8NE+UF0rWsWcFRYipGutVccxF4cojA+nf
         VfBg==
X-Gm-Message-State: AOJu0YxXPKNeoEyMela9XHT8Oxi0sRPEq4Zh0rExDqLgmcf4mWKCYv6i
	j3riBRag9zToo1dZg3nu/5iUpA==
X-Google-Smtp-Source: AGHT+IEGJ5iYsTvFrjTZorn1/MwkkSYEnSuscp/ZLU2pi2M1jcJ955V1my91fjw6E7prxIYt4wTjYw==
X-Received: by 2002:a05:6a20:8e13:b0:18f:f57a:e761 with SMTP id y19-20020a056a208e1300b0018ff57ae761mr12774382pzj.63.1702552625048;
        Thu, 14 Dec 2023 03:17:05 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id f7-20020aa79d87000000b006ce5b4ade28sm11799418pfq.174.2023.12.14.03.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:17:04 -0800 (PST)
Date: Thu, 14 Dec 2023 16:47:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Yangtao Li <tiny.windzz@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/5] cpufreq: Add support for RISC-V CPU Frequency
 scaling drivers
Message-ID: <20231214111702.xdd7qlcrpqh74i3j@vireshk-i7>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-5-fusibrandon13@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231214103342.30775-5-fusibrandon13@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_031708_193832_38C93DD2 
X-CRM114-Status: GOOD (  12.50  )
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

On 14-12-23, 11:33, Brandon Cheo Fusi wrote:
> Add Kconfig file for cpufreq scaling drivers that can handle RISC-V
> CPUs. An entry is included for the Allwinner H6 cpufreq driver that
> works with D1.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/Kconfig       |  4 ++++
>  drivers/cpufreq/Kconfig.riscv | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 drivers/cpufreq/Kconfig.riscv

We don't have a separate kconfig file for each architecture. Only if
there are too many entries for an architecture, we add a new file.

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
