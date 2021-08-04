Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AAAC432BE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:33:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45AAC60F10
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 20:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45AAC60F10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TLRJ5gun+hDdREGghFCar1jwdS1hNzYofBzK8KEKxCM=; b=WN0YNuQwtR8ry4fae/g8HIt8z6
	MkodVYuA3y4gNxfR/fvutfCPcf8EMuLDJHxTXOiWkLmbvYEEHLuhkjkkgvSgvjGO1U9oy8Ti6LoYq
	aPYZSu1vgAkIkqvo39g3UH5lSDr0HfSwir6+bEdj4ZYEQZ+vvX0oHdGfCTz6CMIEdL/lT4fGGw9Sb
	Xtb+CWeStl7G1k+0PkYpXtB53fnrSx2deQQ9+YJQKnb3FCWyysZhAHlB4zlJtemZ7V8YcikfMJlkq
	p9LIHYxNSnPXp7yxhTmpT65vW3bMpHgTvAG/Cz0OD93fdbmj2+rQCsTunDi1EjDyOWU5JWqrZNmJr
	C94zpAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBNZu-007Pcx-7Y; Wed, 04 Aug 2021 20:33:26 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBNZp-007PcG-Ij
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 20:33:23 +0000
Received: by mail-pl1-x62d.google.com with SMTP id c16so4347526plh.7
 for <linux-riscv@lists.infradead.org>; Wed, 04 Aug 2021 13:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9jQSxiBXPSYpBentqMXnvaUC1NOgte9Rxg3a1FtMxcw=;
 b=hcPMacNw6WfolBanCxdZGJZN/LfXdr/RCeSdcdBwAFgjwqJ+ERyixtB2YmseRY7wc7
 POjN/DXg/PCRTfT0TmhvBXMn2hjWRvP0t89+yoC+R4m2fPg+a79dAaUwSy8g6eX4n8DT
 57B+WgktPz73q0fRcWRjAYnN8urAP+yhedwkzI7LRUuFmSy1NqWC6ofiEWONs453lo9s
 vtDydrpRXqEICilI5IGgE9B5YaqROsTaQOWEnCk31feag0LSbZhvMr5wu9sdTb2uj/u7
 Oz8aph2WKKr2bY5Fi5Km1MHF2ZbzyWFzjdMDsNS4IjQ5o9ApF71pSIvxnw2zpGnfuoZp
 cecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9jQSxiBXPSYpBentqMXnvaUC1NOgte9Rxg3a1FtMxcw=;
 b=qACEzDHwfeXUOszRNNT73DwXGOKCXjJcbFCoCKgFcajcbxSZEUQRh0pHMwhKaETjJr
 GszWSLhPQsjVjkGyodLKh0FE3JNKI1xWfWqIJskcdrZIGKTvMvFYqyPkgq8krwTH4hTe
 vrqmbrpI+Q1K+LCgUOzbVbocvAz15+51Wr+DUi3VEfQl21/QMc9ZVUHpWcpvoWQEUqE9
 SLds6I+0KC/F/gel4o1L14Z5+HUsMgmWHvCKb4lkwG+Xu2BLmSvwvTrVc2BoyrTQ0Inb
 b9YgfhXtZjyyrMn6PJXma9zqfFcW5zxtgifiHg5DcfPNfASDwbWF7W11YJEtk9iS/NRz
 5gKw==
X-Gm-Message-State: AOAM533lyMWNwdiqKc/RyACYHxrmX2slGM2oNutR04yK2V97+9Atb6kb
 bdnxcLQT+gwWKK7Ti3qrWr0ODw==
X-Google-Smtp-Source: ABdhPJzLGzAMkXce7rZjO9cIkPd20NGu7qwRzflC1x3fa+aiv6t02p5ioOEgezqi0ugBfFdGI4C6kQ==
X-Received: by 2002:a17:90a:8b07:: with SMTP id
 y7mr11220401pjn.133.1628109200707; 
 Wed, 04 Aug 2021 13:33:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i1sm3864881pfo.37.2021.08.04.13.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 13:33:20 -0700 (PDT)
Date: Wed, 04 Aug 2021 13:33:20 -0700 (PDT)
X-Google-Original-Date: Wed, 04 Aug 2021 13:23:27 PDT (-0700)
Subject: Re: [PATCH v4] dt-bindings: riscv: add starfive jh7100 bindings
In-Reply-To: <CAEUhbmUg0DX__jSzjm1X_eCiHnkjHVXeq7CYLbW4xpydPS1G3g@mail.gmail.com>
CC: drew@beagleboard.org, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, michael.zhu@starfivetech.com,
 tekkamanninja@gmail.com, 
 jack.zhu@starfivetech.com, leyfoon.tan@starfivetech.com, geert@linux-m68k.org,
 kernel@esmil.dk, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-a2fd6094-0ae8-4f7b-9dee-fd71b85b29f1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_133321_663236_7FDFEF11 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu, 15 Jul 2021 19:17:23 PDT (-0700), bmeng.cn@gmail.com wrote:
> On Tue, Jul 13, 2021 at 2:34 PM Drew Fustini <drew@beagleboard.org> wrote:
>>
>> Add DT binding documentation for the StarFive JH7100 Soc [1] and the
>> BeagleV Starlight JH7100 board [2].
>>
>> [1] https://github.com/starfive-tech/beaglev_doc
>> [2] https://github.com/beagleboard/beaglev-starlight
>>
>> Signed-off-by: Drew Fustini <drew@beagleboard.org>
>> ---
>> v4 changes:
>> - removed JH7100 SoC revision number after discussion with Geert
>>
>> v3 changes:
>> - added revision number for the board and soc after question from Palmer
>>
>> v2 changes:
>> - removed "items:" entry that only had "const: starfive,jh7100"
>> - correct typo in Description:
>>
>> Results of running checks:
>>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check \
>>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>>     CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
>>     DTEX    Documentation/devicetree/bindings/riscv/starfive.example.dts
>>     SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
>>     DTC     Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>>     CHECK   Documentation/devicetree/bindings/riscv/starfive.example.dt.yaml
>>   $ make -j8 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- dtbs_check \
>>     DT_SCHEMA_FILES=Documentation/devicetree/bindings/riscv/starfive.yaml
>>     SYNC    include/config/auto.conf.cmd
>>     UPD     include/config/kernel.release
>>     SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dtb
>>     DTC     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
>>     DTC     arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>>     DTC     arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
>>     CHECK   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml
>>     CHECK   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml
>>     CHECK   arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dt.yaml
>>
>> The dts file is from vendor repo and is being cleaned up right now in
>> preperation for submitting to the mailing list:
>> https://github.com/starfive-tech/linux/tree/beaglev/arch/riscv/boot/dts/starfive
>>
>>  .../devicetree/bindings/riscv/starfive.yaml   | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/riscv/starfive.yaml
>>
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Thanks.  This is on for-next, as Rob suggested taking it via the RISC-V 
tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
