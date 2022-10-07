Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236C2C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 02:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WlzahPdfLKEKymWjfnM6ww38wSvtd4/YSTDrApO1RIQ=; b=23vKlKT/5agipZtK0Iy2QaZ2+g
	8OV9Xp0qNg1WRnKKc27UVwaOZgUkmXjp+VCqpn+Pj9DQj+fY+bPUv3x43Z9BMa8JziL/tYHEig1hh
	s9XdJTkNuB7chzMya7PfHc1tdcp0654n3hXndHf95EtpvpClYoH7fb3iEWfBf8EgUJnWVmfyVeD/E
	ZZTVm05J509Nmy38CksD85In00Wv02+tffhZeFpL1KotRlnhRisiHmUTK1hUfDm0tZc/bA/ZYfN/B
	ZCup32Um+pMyuxS7E6F09YSy8D+t5aHCIbdoEwW8ET70otxIRcRXcPoZVdKV7UjJmyL0gjYd8cH8I
	BqcatKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogdYz-006kEC-C5; Fri, 07 Oct 2022 02:58:13 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogdYw-006kCM-2a
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 02:58:11 +0000
Received: by mail-pf1-x42a.google.com with SMTP id y136so3786513pfb.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 19:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoj5EGA0RYL9Ka7luDj/60Kyu1sOVCj/9jFFGeRwP9Y=;
        b=TnY1XKauPWQ8k6BJT+TkH6jngPwzD2M3I3/ivPWAnBOsOtikW4DiG4DRqNmcDv5jsP
         3T+fYGrtt72fkJ1McvY1lk7El+YU43Duy+HskVv6oQ62Trw+yHvgEz8kkSbVukb1Dv3K
         DT/dQSDulksE1an7I8Lr/HA4FsE6gzs3MlzQ5M9mufsti74syB7DQmfPiurh7MedYo5J
         e5MTPJTo8YnKq52+gl9WFVBKMeCnpKX11vgZEDBSJMn7M2oWkXK/wxxO6U5+W2BvSujY
         VtjiE0O0Y+OkvTmVeh6GsPy2C07afAa5xFm3rica75E5DK/xkgnbepy9AiXEbvsX2WoN
         zZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoj5EGA0RYL9Ka7luDj/60Kyu1sOVCj/9jFFGeRwP9Y=;
        b=P/GjtaJu5eHdPYvXbl7nQhoc5Dfpide4mB17zvPussTQysONmhgen09S9IUlK5+oeM
         wbgMdL6mDq57zTmYZKITDsg+uwdJFpdRdx/+HsKTt6/HhJBX8Ja0zdjXmxvq3pqzKm/o
         9Xxu3F37yN1r+5kBI7yX3bdcSKBnTYp+PM7I5ILjGp0y0pAsIql3rFwodBQMSmsEL7Pt
         SMEwlbYXO3G7Rst6G/zDYBb7itb9s8cp0rD2SS3hxmNGRWvKrrhojaQSyRpB7uOGVwSX
         8PVA8NKVexUhQf0my7VdIPoeZeNe1X3hFCjdb3JXIAlynUHKyKXcdwvpZLgbG+VrPCsu
         lvyA==
X-Gm-Message-State: ACrzQf1rQA8aSLqVmJnwTwGw7fjSnc33TQHv7YLrEziqwtyDAfqpfHzL
	rWFP+puTXECpHuKj4lCGsCXmVg==
X-Google-Smtp-Source: AMsMyM4aHddStVwHJEdJraLuB8qK0pz3TytQVfIvQWiHygu27A1LUyhoO+y89+6zBj1fLgqb9CWA1w==
X-Received: by 2002:a63:6986:0:b0:43c:8417:8dac with SMTP id e128-20020a636986000000b0043c84178dacmr2559548pgc.286.1665111486224;
        Thu, 06 Oct 2022 19:58:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id v66-20020a622f45000000b00561b6705d6esm337550pfv.219.2022.10.06.19.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 19:58:05 -0700 (PDT)
Date: Thu, 06 Oct 2022 19:58:05 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Oct 2022 19:51:34 PDT (-0700)
Subject: Re: [PATCH 1/3] dt-bindings: sifive-ccache: rename SiFive L2 cache to composible cache
In-Reply-To: <20220829062202.3287-2-zong.li@sifive.com>
CC: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, greentime.hu@sifive.com, conor.dooley@microchip.com,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-050016e5-0f50-4366-b4bd-98b4b36a56bb@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_195810_144111_294276AC 
X-CRM114-Status: GOOD (  19.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 28 Aug 2022 23:22:00 PDT (-0700), zong.li@sifive.com wrote:
> Since composible cache may be L3 cache if private L2 cache exists, it
> should use its original name composible cache to prevent confusion.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  .../riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml}      | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive-ccache.yaml} (92%)
>
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
> similarity index 92%
> rename from Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> rename to Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
> index 69cdab18d629..1a64a5384e36 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
> @@ -12,8 +12,8 @@ maintainers:
>    - Paul Walmsley  <paul.walmsley@sifive.com>
>
>  description:
> -  The SiFive Level 2 Cache Controller is used to provide access to fast copies
> -  of memory for masters in a Core Complex. The Level 2 Cache Controller also
> +  The SiFive Composable Cache Controller is used to provide access to fast copies
> +  of memory for masters in a Core Complex. The Composable Cache Controller also
>    acts as directory-based coherency manager.
>    All the properties in ePAPR/DeviceTree specification applies for this platform.
>
> @@ -27,6 +27,7 @@ select:
>          enum:
>            - sifive,fu540-c000-ccache
>            - sifive,fu740-c000-ccache
> +          - sifive,ccache0

Looks like Rob's bot had comments and I don't see a v2.  Sorry if I'm 
missing something.

Also: I'd guess that we only had the SOC-specific mappings on purpose.  
It's kind of a grey area and I'm OK either way, but I'd definately 
prefer the DT folks to get a chance to review these.  My guess is that 
they're not looking due to the bot comments, but sorry again if I've 
missed it.

>    required:
>      - compatible
> @@ -37,6 +38,7 @@ properties:
>        - enum:
>            - sifive,fu540-c000-ccache
>            - sifive,fu740-c000-ccache
> +          - sifive,ccache0
>        - const: cache
>
>    cache-block-size:

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
