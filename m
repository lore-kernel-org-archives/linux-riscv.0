Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D13EE6456
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5k4dcR2Ak4KgxHS7FklkvcBBlVCAQfIDuO01V4sjuqE=; b=HBl08KG1wSIz8l
	59KKBSO0GLEoqEp1Nwdh/ccI/LORmrUl3zbjUYUx7zp+eOEo9WEYdHVXz806zJRXWXVJAlc+8LB0i
	fpjma131++VcAO2cVUksXfy9cuauMCFupyDS+CcqtWJsVdVrm/WXJ2HQW8F0TR1wmCtHEXJsak2fc
	9BxGBNCUnUxour1TltoctuzCrGvDMQmKvPLrn+Lpu3G6DvVGmCGfaAytNZInuqOBE2uRY2VXp+DiJ
	IaIhEAL+OYSrifsde4bfzlu4WWN7B4md77L73mx0Xzdv3plk/kjlW+xFRHD6SfDXuPYive2OCKLxF
	EPd51xomgIji/j/5LYtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh6DG-00AQub-14;
	Fri, 15 Sep 2023 10:38:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh6DD-00AQtP-2G
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 10:38:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c43fe0c0bfso1566435ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 03:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694774289; x=1695379089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h06fZUjwiGo48JTYiY1T+teTox9j5L/0X7RHl5iTRsE=;
        b=CxlQ39aN/dXm6ZtE1J0lpnVdapSdJF6lBCVdjOZJOmZtJ8SJR85Vy9AdgkzyvIedLw
         iOwOi8WQ+YpXegdd6M7flTooqUm8b3huA1hvYfQPKQI4RLUNuxyBa3+aLD9g7k4CWFKx
         vXbTTbnRLwtUg/ScOrdL/1R1QvNuU0aznt7nM8b11UkA8N9J/BBVlOY2uhIFlii3OoME
         reZTjyGSwmN/zj/xshhrA8XW+J5FWp1TVnnSTn41TzUi1CaT4zpQ4LGJCmhKONNCbgYD
         bcekpSdLyI5Nym8hlwIOfFsWsT1nrOK/b/5ifVTx2fhNB/3288j3yg55ueAi0wnW4DxH
         /ZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694774289; x=1695379089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h06fZUjwiGo48JTYiY1T+teTox9j5L/0X7RHl5iTRsE=;
        b=UyE+gC283F9bgFC5xjeyMa8gPsnRrogeoobMQfTVY0wbacNIVgR3CoQ6pplDvHfggA
         KFqpeQitUf0a0ar/8SHFi91tIj1DKd031XpAJ3dqrMfeTsW7HytIUIaSRjiglx22CLWd
         2DmhZ+pkMEODumo/M+XqnUqkny6qNCFWmLBNusLUyCSAM7tWrA/zAev/8HSvjPzSjgzv
         DR8KjuTpzDAaX830DRiCjmk0ga7JOXTjkbNor6+f8W+BXoU40q/PLAmQYuceO7jwTkI9
         AN5FI8/i7fMvBbElhoUxaocAAwd68dJNNlI0lvJlGeotzI92m+hxIgCKIdku3xVmtX+D
         Op8A==
X-Gm-Message-State: AOJu0YyNm3sRzpqxrLF8lU0PNOwayaGARGsX2sddLT7+IiLu1fs79cjT
	AaRWYOyj/3R0PJ7fnaOFAmk=
X-Google-Smtp-Source: AGHT+IGF2MKTWUpSvo+l5EEmTKLrM/EOxGpA52GVPYRF0w+eP+hN1+VeQDG1wYgBDOGBQFPPLodc8Q==
X-Received: by 2002:a17:903:2345:b0:1b2:5d5b:e871 with SMTP id c5-20020a170903234500b001b25d5be871mr1249171plh.59.1694774288629;
        Fri, 15 Sep 2023 03:38:08 -0700 (PDT)
Received: from gondor.apana.org.au ([2404:c804:1b2a:5507:c00a:8aff:fe00:b003])
        by smtp.gmail.com with ESMTPSA id z3-20020a170902ee0300b001b88da737c6sm3178198plb.54.2023.09.15.03.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 03:38:08 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:38:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Andrei Coardos <aboutphysycs@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org, alex@shruggie.ro,
	olivia@selenic.com, daire.mcnamara@microchip.com,
	conor.dooley@microchip.com
Subject: Re: [PATCH] char: hw_random: mpfs-rng: removed unneeded call to
 platform_set_drvdata()
Message-ID: <ZQQ0D25jsa49+jkx@gondor.apana.org.au>
References: <20230828101757.9724-1-aboutphysycs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230828101757.9724-1-aboutphysycs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_033811_736886_BDF18697 
X-CRM114-Status: GOOD (  12.41  )
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

On Mon, Aug 28, 2023 at 01:17:57PM +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/char/hw_random/mpfs-rng.c | 2 --
>  1 file changed, 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
