Return-Path: <SRS0=x9rf=L6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FACC07E96
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 23:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C1A61CAD
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 23:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C1A61CAD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=3DKNl4vZHZmN09XIp7UaHWCxRxgingpZkcQFH3Flk4I=; b=gEjuTbvvciYMWf6p0587rCGKmk
	CWTlYDCfCrm6+Adto6fIg+g6Ere8L3XrcKivxbxF2PaTKUYFgFNSab9Up/EQx2o5HmT11gu3MZaVh
	lqvFqbXQ8UdiHd8evHridhVKD572Pg/SmjBFLfzbErqrh52aGbAC4shmZILnDOpH16PkqzHwaNTFj
	cYGrNAMqDkaO18rd0m5GQFerWiN5y9B0HxVynv+2nN7/Y4jq/LDsBMTzvn4Pf4QothlLg4vo/ct79
	TDl9bPk0zD+u5kjEe11gTMSvTSTia3q5/wBndWEOjj9rod40uvVAgggGtLXVp32mRaZZNT8F8olEu
	rMByscWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0uJJ-00D0hS-27; Tue, 06 Jul 2021 23:17:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0uJF-00D0gJ-PN
 for linux-riscv@lists.infradead.org; Tue, 06 Jul 2021 23:16:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id c15so3452pls.13
 for <linux-riscv@lists.infradead.org>; Tue, 06 Jul 2021 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vhWcX4wZI8Gd9j2rinjQwhp8HvDxjLKtRKdl01al6B4=;
 b=qA3fpEsAe6jsvhZqMAy6cwl8yXzdWfXG00y18wEaoGed37IU/nSfIFlFZLqJ+/lVHW
 mi8cOgkmwjFMQMYZ174Wqm+ZObPLCa7TZadgFajCo+wukrWzsWmRSiOQs7+sOtOjGzCK
 oTPhS5XuCMSwsSjJNI0wLlaZHxqserpJlr1ywLWTf9+B6EYGmwMZ/9oyDCYKSLd+wYFv
 37T/s1Kz9X5nVDp1MncjRkNMgW1lHoPZA2Tnc7HLhFE8xFJmS3gehdrBXMG4hup/4aIw
 LC+VBRzu32Ox/V2hhCnsFFaRGNVgb35g9NVckInof+vYLHfMpI98JywoK0zdTIMCnfPH
 NM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vhWcX4wZI8Gd9j2rinjQwhp8HvDxjLKtRKdl01al6B4=;
 b=noTmgSVQZ3arQS/6bq+jUGOPwWZqTMoChGUlh4b5f19UXjE1hNodOX8OLJIBxggkdS
 la0Zvoz0dlql0xxPKakn/e2SGlqaurRN1viIxAfDBDmFhUWCEbPDipYJvsEvZ9KUQBUS
 EBp7EflKHfuY+QIymmwP3ZLmE4GkENuuWpTssZHayYWNo2yMosMCgZl4QzINQvotQpin
 FJgvSAdGfUiGsZqCnBBn74kdkSNGO/4Y0aFRwLWOhAld2+F/3C/Iu1TWODMRDQ0cbZLu
 5MJUwUORbs6scrFnEeUXoKAM6Ohls2WimxuCucH4RDiRzpNkiMmOvM9QK4aNLSsWgnIZ
 faxg==
X-Gm-Message-State: AOAM530LcZmPHUmDURuchip8iwhvyOhrwY7FJ4UWPKIEBYk+veDERk9t
 f0flunieuS6r/rfXWYILnAEhKg==
X-Google-Smtp-Source: ABdhPJw+S8scqaWlE3MYzQi76RwysDGhn8KLP6B59eb0mJaDLXFWOIh5UV7dvcXMehttPkOYFKPZ6A==
X-Received: by 2002:a17:90a:6a0e:: with SMTP id
 t14mr5449215pjj.19.1625613416939; 
 Tue, 06 Jul 2021 16:16:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w123sm18350483pff.152.2021.07.06.16.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:16:56 -0700 (PDT)
Date: Tue, 06 Jul 2021 16:16:56 -0700 (PDT)
X-Google-Original-Date: Tue, 06 Jul 2021 16:16:35 PDT (-0700)
Subject: Re: [PATCH v2] dt-bindings: riscv: add starfive jh7100 bindings
In-Reply-To: <20210625071240.577796-1-drew@beagleboard.org>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 michael.zhu@starfivetech.com, geert@linux-m68k.org, tekkamanninja@gmail.com,
 kernel@esmil.dk, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, drew@beagleboard.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: drew@beagleboard.org
Message-ID: <mhng-7fbbd583-fe4e-4f11-a028-3df3eca4ab41@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_161657_894531_D05F71A5 
X-CRM114-Status: GOOD (  21.13  )
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

On Fri, 25 Jun 2021 00:12:42 PDT (-0700), drew@beagleboard.org wrote:
> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> BeagleV Starlight JH7100 board [2].
>
> [1] https://github.com/starfive-tech/beaglev_doc
> [2] https://github.com/beagleboard/beaglev-starlight
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2 changes:
> - removed "items:" entry that only had "const: starfive,jh7100"
> - correct typo in Description:
>
> Results of running checks:
>
>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
>   DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>   DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
>   DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>
>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
>   DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>   DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>   CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>
> The dts file is from vendor repo and is being cleaned up right now in
> preperation for submitting to the mailing list:
> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
>
>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
>
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> new file mode 100644
> index 000000000000..68954d0a7108
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/starfive.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive SoC-based boards
> +
> +maintainers:
> +  - Michael Zhu <michael.zhu@starfivetech.com>
> +  - Drew Fustini <drew@beagleboard.org>
> +
> +description:
> +  StarFive SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: beagle,beaglev-starlight-jh7100
> +          - const: starfive,jh7100

The SiFive boards have

    oneOf:
      - items:
          - enum:
              - sifive,hifive-unleashed-a00
          - const: sifive,fu540-c000
          - const: sifive,fu540

IIUC there's no practical difference between a single-option enum and 
the const, but it does bring up the board version number.  Is there any 
revision number on the beaglev boards?

> +
> +additionalProperties: true
> +
> +...

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

as I'm assuming this is targeted towards the DT tree.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
