Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46845C369AE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 22:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7lCpDFVW7Z+GqMplBq+W6Eg4LM4NAd6h54tv4xes2Y=; b=znMResGOIxU/26
	xDciTuqaOYIqcmMBEHQxQo8dPwrqNOEU2XhM/ldAXu+3FOOHkTRUJ6dpWxDeVbfSRaK+w+izGME2D
	FszNtH8XXlV0ppYcaXUK324hfZs3B58nqGQDT7tMCji4+nm1akepqH9/60YELPyJ0/Glmj1/BzTvh
	l4BH2ExNzne/mM4JYjvFC6wWTIvVPS69/DUW0OQvb3C3dah5c1hKNQu5hkjAZAksB7uRDJ8jye1T3
	S+aXfNE0PjiHZlR8gaqVwYoZBxOg0tuv7BWV6Kk7ueRj68zCphBk9A3YNRYTTMGCW4Mx9+PXH54IK
	mbMb08Mh4YHv1XFzt/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NEs-0000000F1Wa-3m2D;
	Fri, 11 Apr 2025 22:52:46 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NEq-0000000F1W6-1iV3
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 22:52:45 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso27536936d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 15:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744411963; x=1745016763; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+pL39NwqtcbYwkvvLQB2h2yxEcQFSSiMNcOUnB8oXOc=;
        b=f5Th9tbvQs1jf+ix0tRvZPdjapWQZ1aGK5OdjZCORPrU8jBVtdfownblwNObyCddci
         TFPx4fCzUrEguhQY0kx5jgLzzDJ0nA/AjbWPnrPiEqZfRhIEaJyNIhmK/dlLfQdQAQuH
         +i20hjK2JOLgUeeeTzAB/t6wivcN+oaUVCtY9eCZcaD19dhjmCDnXK094O/DruZbwu69
         BFIlDqrOkZcWeXGwcNBW8q9JtE1kUIIPKFd9ZJEoJ8hH2TUohd4LjnsCaqX87gIgJdTi
         nOcrny07Vj2CPjZkSAVuvTh1bniaUcTZwkQcMz3f4P7H4J3njBG7cU1p0FfT0RUo2WFz
         7q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744411963; x=1745016763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pL39NwqtcbYwkvvLQB2h2yxEcQFSSiMNcOUnB8oXOc=;
        b=KU8Xiw//qk3kfjDCxE2OBoimzAaiu8LfAwCLX+IKecf5Advm+/H9LHm2SGkjFQIluO
         KOe91s6hmwVt4uCDbisHpNw8H4Nbkv4BQ578brsp7PWyKjDQmiv6/plATNJheeZ0uFgY
         HTxwf6tRWkqotriMYvr6G95fS8THtl0XbMN6hFUktjz05ENWkP1prLAA9wTuFW4wlkgZ
         fchQPl2EAfbvTVtHrAAH/H/UBH67iu3H6WWI9/hejELx0V6Bajry/xfacCsT5Q/A1HVa
         2ActJGFOVXNNVXfiWT6shr8eQNYSWFUAGy1cTapeR6CMp3IV3N0cox78vZaLzJ9ddYL+
         zi9w==
X-Forwarded-Encrypted: i=1; AJvYcCVDDRZQJbg1rl2v+u9RWHU162swc4vtqSOr10CfJHufaK6e9ed/7Fn8CBBpdR/DLyxpKpA3TIYR7BzfiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQPvj1iUKQqr7Z8RaSrJykht9dvVffa7utBJ6HfaWceBr5ts1Z
	vUy+5DCIZrkhx8wPVtfDARmO7oj6SspA2rqHO9yIo93j5UTpVrRM
X-Gm-Gg: ASbGncuuReZsCKvVwa9RfNXFdC0tT/pSQQIwn3s3uBu656qfBUvUcK8+XzW1fqANmoZ
	4vmsTB1rWT1MbZuwE1Mzf1eoOZo0bKGJqM84lo5lfyQhQLaA/aWg8xEzs7kneaCdKfdqeKfxdAe
	8K7O2cppsE2bMQbmQGqzh1tgqssNhRtPGzS49djwQmFhF0IGE/TIQfTGC9RHJp2Gp9zI5zVJfiF
	f4WX750XUpqD79SxmPJ3UBVEyAKpzVisYmu8UH8iCkm+V/gcoQ2oapEMsAk2kQq70wtuqeAA5kE
	cAsIic7ytCtgco1L
X-Google-Smtp-Source: AGHT+IEtXcGKPfNuWYv/aDDJ2tC8l5U6EHJb2KzYLLEpb/rDKTBSVSyfh6IvpIF3Bho/Sys5i6hwmg==
X-Received: by 2002:ad4:4ea2:0:b0:6e8:fe16:4d45 with SMTP id 6a1803df08f44-6f23f16135bmr58411176d6.41.1744411962994;
        Fri, 11 Apr 2025 15:52:42 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95fdfbsm42753596d6.1.2025.04.11.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:52:42 -0700 (PDT)
Date: Sat, 12 Apr 2025 06:52:03 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Guodong Xu <guodong@riscstar.com>, ukleinek@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr
Cc: elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH 9/9] riscv: defconfig: Enable PWM support for SpacemiT K1
 SoC
Message-ID: <6fywndrxglozw2oqrfs66l3hxxsrv5uf5hdiuyv4a2uczwiiki@tmijrmuidlin>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-10-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411131423.3802611-10-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_155244_449557_A469C87F 
X-CRM114-Status: GOOD (  13.38  )
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

On Fri, Apr 11, 2025 at 09:14:23PM +0800, Guodong Xu wrote:
> Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
> to support the PWM controller used on the SpacemiT K1 SoC.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 4888529df1d8..9bd972867e0a 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=y
>  CONFIG_RPMSG_VIRTIO=y
>  CONFIG_PM_DEVFREQ=y
>  CONFIG_IIO=y
> +CONFIG_PWM=y

> +CONFIG_PWM_PXA=y

Why not m? This can reduce the Image size.

>  CONFIG_THEAD_C900_ACLINT_SSWI=y
>  CONFIG_PHY_SUN4I_USB=m
>  CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
