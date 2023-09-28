Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C342E732C5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7E3xcYHgn/D3BxHUVfzSmiYX74F9FM3u/Ipjjys6nM=; b=SKBT08yt2Em/AU
	InWytJHfuwDgVXgc6h2V3c5exKYSiPaw2+hCW3IhPzkIt2cOc+FYVIJiKQzVW6rf+DzskO36Q+eLt
	nli9sHzv/BCLFm1DbPzMVZS5sajqk8kxPnnm2NBWoERkZHdgiNNRir4R1j5JvkceOsnVvEKL7ubeT
	koZZIcT4Key6dq8s14VktsqrMClrfSGmPCRtwtj7JU3ZRG5FkZTFMy9PW0UeI0Lk8pttCdYOqfCvp
	R+JkpEm26RZHWJmRZdebM3A/vvNaEIouiS0/CjxAZ19CRePqG4yNPFry3ElRToXwte7vTlakLHNAu
	kwQnNmloVWFhLuWL3hog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlpQj-003L4o-1y;
	Thu, 28 Sep 2023 11:43:41 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlpQg-003L26-26
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 11:43:40 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-79fa7e33573so362495239f.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 04:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695901416; x=1696506216; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhAcDN4K7D/vTmH1Qkl5/PH1ae9Q+7eDYlNx5SqvDps=;
        b=GmicHZyD0otKCeL8+MG4pIWl5ZD9cZYeREmn5e5dHyzuAr0gpdAX81P2JdNgsLgsY7
         J9vNKwQsc/K7/nePb8cBZLq9CHfzcopzZh1Tbw+Ipvhr1HLDhUDfZXjGNEtiRUf2bW4O
         EreIXPJUX4GIcPeJM4ALc+EHMP85Uv2ejhxxusARiX3B3RpcxQ3rMbsfIetUF2MmEDY6
         VUxxu/ok3d3/U2VvpfL5sdItxj0vbieXiRnrLGmrCBYO/5UvoeMCF2btNcZimPpLyOPH
         /CgIf2Mk59vtyhFAGGf3kxhndVe1WaCa8a7J5srvLM85pxPuCWwm9eE7ubnHpmXtGIOg
         PokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695901416; x=1696506216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhAcDN4K7D/vTmH1Qkl5/PH1ae9Q+7eDYlNx5SqvDps=;
        b=rqaWwqMZ+Hkssh9uA8eHfVtfxCK4tIi8g+mbaBbniobg3Zx2CZhmTdsFZuZHPbDn18
         mMDLLuTNkkj28tz0uGzV9px1j1FES5TvPnHQqhJcq9Q4Pl84bVHbrIXIqMa7CscbkeQs
         T86n+svn6r1wOk4yhklBZd6FNWjMQwp4jOXbCZXxgxg149FVSihi1blNWiI6+6hawQ/E
         r57k6K1wJJtio1iVtsI8CZCrTUOID2HmvSJTMv6iKR9ajdORCytHCWLXrlYXDj1gQ7bm
         oFH3/0d3Gk9a6PVYRWR8tbYXDgY1/wllRZuhi50FrGGajCy6hn39sdTJT13e0af2eOn8
         FikA==
X-Gm-Message-State: AOJu0Yz6SMxxwvbIKj0FOme0+iYIo42OQKuXpsu8kvtWKLQ0KygC8IqS
	hv6PttT4kLHLMdxwRrQxUMw=
X-Google-Smtp-Source: AGHT+IHv4Y+EOxcAPosS0sv0p0W1NVztEVlhV40SdyBD4tFtuVkRgoUeCMOYryXEi5Pq3F84FjIAmg==
X-Received: by 2002:a6b:6608:0:b0:787:4f3c:730d with SMTP id a8-20020a6b6608000000b007874f3c730dmr752837ioc.18.1695901416583;
        Thu, 28 Sep 2023 04:43:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id cg11-20020a0566381bcb00b0042b3dcb1106sm4596901jab.47.2023.09.28.04.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:43:35 -0700 (PDT)
Date: Thu, 28 Sep 2023 04:43:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Add Hal as one of the maintainers of
 SFCTEMP HWMON DRIVER
Message-ID: <dc5e9253-5d82-4def-b6ff-038b29bf99ab@roeck-us.net>
References: <20230928075249.109459-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928075249.109459-1-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_044338_732167_6EEDD765 
X-CRM114-Status: GOOD (  14.78  )
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

On Thu, Sep 28, 2023 at 03:52:49PM +0800, Hal Feng wrote:
> As he is the submitter of this driver, add his mail so he can
> maintain the driver and easily reply in the mailing list.
> 
> Acked-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
> 
> History:
> v1: https://lore.kernel.org/all/20230718034937.92999-4-hal.feng@starfivetech.com/

The change log should describe your changes, not just point to earlier
versions of your patch. Please do not expect maintainers to fetch old
versions of your patches and compare them manually.

Did anything change besides the Acked-by: ?

Guenter

> 
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b19995690904..2376272bbe20 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19402,6 +19402,7 @@ F:	drivers/net/ethernet/sfc/
>  
>  SFCTEMP HWMON DRIVER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> +M:	Hal Feng <hal.feng@starfivetech.com>
>  L:	linux-hwmon@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> 
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
