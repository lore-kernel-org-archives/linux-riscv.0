Return-Path: <SRS0=TeVA=MH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B69C5CFC2
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jul 2021 17:26:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBB3613D7
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jul 2021 17:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBB3613D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKV1Yt5gswEhrgnULzaRafgCbdMXI9ZXxtb2Y6D4suc=; b=k+6zk+qGOTpWvH
	VENU84A9tU7hn3AJuixTK+KO++1/KxtACucwsTTc3pWPHlpy7ub8lnYmuy5aCQ4Z6Ygm6stZE7Sy2
	xcr8AWy2j4epeeMwsYOICTm21NmG7KHUALbaPj8JqJtkLPyuZJgjaB0gWkranAg8fZir2PaJzv9Jo
	/yoB+8sDVCwhjqA3sxx4Yjt55mCwxUqxPNctRelO6PafzdhL/Aq8VMBiSYlPzxsILS2lQym/4AzuJ
	NK+O+3F7VKbjB81LMK3ZdGYLvlh4AlzP37kaLeZUrqwgH0sVZA9Kf6lk9rR0W5oXLz7kGh4ZFJV/Z
	aiIsCSDuw138daj4P/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m457g-001hlT-30; Thu, 15 Jul 2021 17:26:08 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m44uS-001ctq-Hy
 for linux-riscv@lists.infradead.org; Thu, 15 Jul 2021 17:12:30 +0000
Received: by mail-io1-f48.google.com with SMTP id l5so7335565iok.7
 for <linux-riscv@lists.infradead.org>; Thu, 15 Jul 2021 10:12:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZVELhrfvc5pcUyULq5NUcKRjoYbdkpGVUx8160StOzw=;
 b=PwWD9vn3VYL6JuM0HjeTljI3zJbgL2b5RkwPBEyg8XRkMFlZCLIniD4ehI6btaTHdG
 dYfTd7kl8g/HRoH5rQVUdUKHDEUN17oG6UZczRlg3JLEu1Ty41cnDe+SGroZRfTcxX92
 aWSWdn5i6xl/PZzO1UV1qZ0sQg02OXGHFtCcY8Bf7TqtQyBdUR58FJoyGK2jllGGsT2R
 r+8yW0xdhQ7qkP/ZaQVgC/2uxdTDoZa+FjbaeNeq9YthxlM/mnkzNWjsdxj/AMbvt3im
 kZfib7lINi7t28dcM3qP501F35YCsj9m+m9hlv4gEibtnkIkvmh+XYx3GUbSerlxr1Rm
 LnFg==
X-Gm-Message-State: AOAM531qbLaOSqSyAp7LmFQuvpUQaUNqh0jwtL8bJc5dlJM+JsAiACrj
 vGj8zryTvrIOTal04F0iOA==
X-Google-Smtp-Source: ABdhPJykBLYjZ4cF9fSKxRji2zzMcU72ZD0DLVzS2AetdFvKiBYglthqS6FNSvaFO9Ofu8kggqzB8A==
X-Received: by 2002:a5e:a609:: with SMTP id q9mr3804801ioi.57.1626369145685;
 Thu, 15 Jul 2021 10:12:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id i14sm3047235ilu.71.2021.07.15.10.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 10:12:24 -0700 (PDT)
Received: (nullmailer pid 1260573 invoked by uid 1000);
 Thu, 15 Jul 2021 17:12:20 -0000
Date: Thu, 15 Jul 2021 11:12:20 -0600
From: Rob Herring <robh@kernel.org>
To: Drew Fustini <drew@beagleboard.org>
Cc: Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 linux-riscv@lists.infradead.org, Emil Renner Berthing <kernel@esmil.dk>,
 linux-kernel@vger.kernel.org, Jack Zhu <jack.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Zhu <michael.zhu@starfivetech.com>, devicetree@vger.kernel.org,
 Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
Message-ID: <20210715171220.GA1259840@robh.at.kernel.org>
References: <20210713063018.3000459-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713063018.3000459-1-drew@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_101228_668416_8EAD042E 
X-CRM114-Status: GOOD (  14.40  )
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

On Mon, 12 Jul 2021 23:30:18 -0700, Drew Fustini wrote:
> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
> BeagleV Starlight JH7100 board [2].
> 
> [1] https://github.com/starfive-tech/beaglev_doc
> [2] https://github.com/beagleboard/beaglev-starlight
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v4 changes:
> - removed JH7100 SoC revision number after discussion with Geert
> 
> v3 changes:
> - added revision number for the board and soc after question from Palmer
> 
> v2 changes:
> - removed "items:" entry that only had "const: starfive,jh7100"
> - correct typo in Description:
> 
> Results of running checks:
>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>     DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>     DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>     CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>     SYNC    include/config/auto.conf.cmd
>     UPD     include/config/kernel.release
>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
>     DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>     DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
>     CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
>     CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
>     CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
> 
> The dts file is from vendor repo and is being cleaned up right now in
> preperation for submitting to the mailing list:
> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
> 
>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

(I'm expecting the RiscV maintainers to take this.)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
