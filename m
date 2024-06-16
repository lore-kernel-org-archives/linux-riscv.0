Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F1DC27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 02:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o02AZIgLoOVGVsHkXot07b96jky5CdXlOvArHR7rHJo=; b=43zBPOYfZrFgKX
	+quuxoGKJq/7wsI6J7s4Jvm4vjdaF2reoFeCEcRO6fwRPWosx16E6lXyal3hzFnuBzmpvX23JvuEH
	q72xEb8YnGxGX6iNZ91IqkZWoB4sVshE37RQw+s2nOvJDTSG+B3fqP+mtVLkn9phOIY1+Z86ANLrQ
	3mt/9Ho9rV0h2tAGA/rhVVG4aEq4XBQwBazaFBi0R7vJZlSt8DNPoJA9Dh57V9jVmRrEKJR3scZSX
	BrwUNuLxZNqFZd1UmYhOpMOpyLbMmcJ1eNwybqu81FGvyIrsqz8kHX2m/KjiSxoHjhFaSXkO/WsCU
	WwBBXxVME+2boAA6dY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIfff-00000006XL7-1fFa;
	Sun, 16 Jun 2024 02:31:07 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIffZ-00000006XJu-1Zc1
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 02:31:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1f64ecb1766so24922625ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 15 Jun 2024 19:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1718505060; x=1719109860; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cVSak/2X/IwDlKdGQQzgvzyVeWSkvN8eQX8+7AouNcQ=;
        b=HWoaf7Mrp2l3++G1WVJPiynRUg7wnTwrnsl2wxNHm1RYNVQ9OkrvIiuqcKrzyr7pL7
         0VFH9jLPkGy2erLBM7eD2xw9SWxmxHEUn1u4ejr36WSjQ48YAR3QYQXwVB8Y8AAiYMBu
         VNeDE7Hg1Z++zD/rQj68Yuj3zDENl7cvhhKIhkrmZivfUAhc+KDIp1K8VK7bBfP6ZhLE
         eov9VYplv+/V5fYlmiXb2zVgBccQvBrKpfive4bfZkeOEnswIhApuUotAki3/9pMocFt
         eiDiuB7gmpd0ZHmbqlJFryfkKhOND0j3xO/CEGgmQOlKHttvmcVzNiNJkIADCvAiZu5i
         pyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718505060; x=1719109860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVSak/2X/IwDlKdGQQzgvzyVeWSkvN8eQX8+7AouNcQ=;
        b=C4lbMT2Ldo8FoMZGEJSA0CENvGvOZeOAx7OI3wh9JJc5qN9IZZ8efuyCDNlni7U8jR
         EWFWDO8fcPP3pPXSmXE4BqPCLJPuQcdemhMzJpPDidkbboGDrTFdbkxdnRYRqOxnKQJO
         NGC1SuJX0v+HUhsUA+W4h+7pjZ2T4o6T1Q3nNHUXHEC8NBQfhsbT5k8SJdBB2l0IxU1C
         ryJ1mqqZsio4zheuIDJNeDlTxIUTFllZwsh0M8m+5kM0zbFUj1Ob64A7UudULHEMkyS5
         t/Feo3+Vtl/i+A76L7lLOXCN5sAxRBNxpCuvWPHjjEHtBc5o0plcXnrnN87DSDjiWIZF
         BurQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbSlK/9Ey9o4qZb6zPeryOYMtLXw/61PTxDQh99vJxxeZftAJkjL9IJgq5b0qwdARD69TGcRPZJkkY9uOwzoupj+UpwwT5o8aO9e7v9kvL
X-Gm-Message-State: AOJu0YwwZbD+MdCU62tnexCUFHFTGgagpP0LgdDYIv9v5rqoUbfQNZRo
	Gs4lDyw+XpaLuBoP2LQKiqGTH9fB7cTy3lZZvDJ6ZffHhpzrgpANHWkZiex6Os0=
X-Google-Smtp-Source: AGHT+IG8MRFHbtUBSzVWOgxiGuIFdTVlR9rAtbWbkR9X+BbLOkQa3sOeajP3P9i4kf5dBJcOkBplbA==
X-Received: by 2002:a17:902:f683:b0:1f6:7f20:d988 with SMTP id d9443c01a7336-1f86280604cmr74376395ad.42.1718505059587;
        Sat, 15 Jun 2024 19:30:59 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:f6d1:94e2:a616:9280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e55e99sm56591445ad.4.2024.06.15.19.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 19:30:59 -0700 (PDT)
Date: Sat, 15 Jun 2024 19:30:57 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Chen Wang <unicornxw@gmail.com>
Cc: adrian.hunter@intel.com, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	guoren@kernel.org, inochiama@outlook.com, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v3 0/4] mmc: sdhci-of-dwcmshc: enhance framework
Message-ID: <Zm5OYfzMSv6hnCdL@x1>
References: <cover.1718241495.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1718241495.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240615_193101_540933_949A7F7D 
X-CRM114-Status: GOOD (  23.12  )
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

On Thu, Jun 13, 2024 at 09:42:03AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> When I tried to add a new soc to sdhci-of-dwcmshc, I found that the
> existing driver code could be optimized to facilitate expansion for
> the new soc. You can see another patch [sg2042-dwcmshc], which I am
> working on to add SG2042 to sdhci-of-dwcmshc.
> 
> By the way, although I believe this patch only optimizes the framework
> of the code and does not change the specific logic, simple verification
> is certainly better. Since I don't have rk35xx/th1520 related hardware,
> it would be greatly appreciated if someone could help verify it.
> 
> ---
> 
> Changes in v3:
>   
>   The patch series is based on latest 'next' branch of [mmc-git].
> 
>   Improved the dirvier code as per comments from Adrian Hunter.
>   Define new structure for dwcmshc platform data/ops. In addition, I organized
>   the code and classified the helper functions.
> 
>   Since the file changes were relatively large (though the functional logic did
>   not change much), I split the original patch into four for the convenience of
>   review.
> 
> Changes in v2:
> 
>   Rebased on latest 'next' branch of [mmc-git]. You can simply review or test the
>   patches at the link [2].
> 
> Changes in v1:
> 
>   The patch series is based on v6.9-rc1. You can simply review or test the
>   patches at the link [1].
> 
> Link: https://lore.kernel.org/linux-mmc/cover.1713258948.git.unicorn_wang@outlook.com/ [sg2042-dwcmshc]
> Link: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git [mmc-git]
> Link: https://lore.kernel.org/linux-mmc/cover.1713257181.git.unicorn_wang@outlook.com/ [1]
> Link: https://lore.kernel.org/linux-mmc/cover.1714270290.git.unicorn_wang@outlook.com/ [2]
> 
> ---
> 
> Chen Wang (4):
>   mmc: sdhci-of-dwcmshc: adjust positions of helper routines
>   mmc: sdhci-of-dwcmshc: unify the naming of soc helper functions
>   mmc: sdhci-of-dwcmshc: extract init function for rk35xx/th1520
>   mmc: sdhci-of-dwcmshc: add callback functions for dwcmshc
> 
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 598 ++++++++++++++++------------
>  1 file changed, 339 insertions(+), 259 deletions(-)
> 
> 
> base-commit: d6cd1206ffaaa890e81f5d1134856d9edd406ec6
> -- 
> 2.25.1
> 

I have tested successfully on top of 6.10-rc3 with the Lichee Pi 4a:

Tested-by: Drew Fustini <dfustini@tenstorrent.com> # TH1520

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
