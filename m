Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B959C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jan 2022 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eUu0iFToJOgZHudBPrL4NXQxykD4FryuXgX5C0nWM+4=; b=Cu5pMFdt+hTPqy5MKSvWZIuJHQ
	QTPjsOdSUJhq/AwU24Y5QxGZ4kfowVeLM3/F0dQyL5JR7Y3g/I4S0/3ALVnDfyYcWZ9qg82LopAu+
	3Z82compq6RvhHVrju4J5DJh5aQzcw57cJY7Glm5z088m5bUKsQY7el7k9KhaeDSrmuKAdsnB1BDm
	NGcKcwKCSUov/fhD4u7rGSGTFh3rnQ0TEsjEzirvpVz1+frr08/lzn5PI1IKhXK79H6MxNVDnxtXN
	2uGaC1FdZ6f3hO2VJYdVJEClK/poXEDvTUmcsQG8J6yImBNmvkD57bCZ9xAcpTS29XxbwnbitCaMS
	4GhOEmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6cob-008E1G-44; Sun, 09 Jan 2022 18:21:13 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6coY-008E0X-3j
 for linux-riscv@lists.infradead.org; Sun, 09 Jan 2022 18:21:11 +0000
Received: by mail-pg1-x536.google.com with SMTP id i8so9294543pgt.13
 for <linux-riscv@lists.infradead.org>; Sun, 09 Jan 2022 10:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GuQcnVKZs9OOggPRZPyjeS2JFVj5SyDZeTLTOgzmibc=;
 b=v+DqREMZeAS3AJzRTkkQGsUqb7r17iWld5zVyc0OitoAV8bDLFDUle9YjS3Bu6cqdA
 jqASO+WkKOOfOl9kqGRmmqEcZKBTTvemUTxd0zob3ta1vap8uih9XHuZgx9HQ14O2scs
 F3+Q27CC/F/bq4WHNC58SXNppftWNcNGAA5iuxZJ7jdoF7eeL5gpxXCCfflSk0ED/2M+
 hmuKPzuxc3hiJhg5jw6bwyWqZJS4PC8ynTsz932TZnbArqn+Mfrie1eA30QiGrCUxxiU
 zCEYQddpYsLhYrGZPKW81/7eALxH++hZGSXJ5tG97zpzXQK+BGZKllET+N3ouekCGHCO
 +80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GuQcnVKZs9OOggPRZPyjeS2JFVj5SyDZeTLTOgzmibc=;
 b=Obsy5prp5WcdmxyPAQxODtt6rvzrac4mxcLnkJcZ2phkqoJRn2g2Z7Nh3aeI3VF9OC
 vj9ynJxLymaBPmktvAMisI2xygbnCtZwjx60WNU0kryrU2MQ5JYfQs/3oWVjbcUvDHdj
 7vdG3Vuufwk50Z7N+EmFFjR/V9AoPHZPPeBny1YBxiVpJoDKi/2iv788qjIrpIADQpKU
 l0ETbQiGgROa7DyyAmlKSXktV9BGWQ/nv9LerN87FJCzBXOYf6VDkbZT7IUorGPX/Hs6
 kRXWlqzE/7tFvcWQuQ0LLAfwneFFu9XZQJ6J2G7Ffwq33xzEpxwxl4IuBt6tRRAX/UJb
 l5yQ==
X-Gm-Message-State: AOAM533FeODJmDlC7VQe+73pXVwEKOqeO16a53tGSUFlVB44xZCOSlJm
 Qs5Cx7eL6flNZvC9zrKv+fWDiw==
X-Google-Smtp-Source: ABdhPJy2Pmouc41IHjgPzgPIjiPIuc0y4eMUaoS4kwPuVVXJSUTmYzSVxP/OIDeH88SwJzYaOOSgwQ==
X-Received: by 2002:a63:9e01:: with SMTP id s1mr1483035pgd.45.1641752468921;
 Sun, 09 Jan 2022 10:21:08 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f11sm3408768pgb.43.2022.01.09.10.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 10:21:08 -0800 (PST)
Date: Sun, 09 Jan 2022 10:21:08 -0800 (PST)
X-Google-Original-Date: Sun, 09 Jan 2022 10:20:41 PST (-0800)
Subject: Re: [PATCH v3 00/11] riscv: dts: Miscellaneous fixes
In-Reply-To: <cover.1639744905.git.geert@linux-m68k.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 robh+dt@kernel.org, damien.lemoal@wdc.com, lewis.hanly@microchip.com,
 krzysztof.kozlowski@canonical.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, geert@linux-m68k.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-4ae7dd75-5f56-4043-bef6-99fe3463b3a1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_102110_182740_4DDEF2FE 
X-CRM114-Status: GOOD (  13.24  )
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

On Fri, 17 Dec 2021 04:49:21 PST (-0800), geert@linux-m68k.org wrote:
> 	Hi Paul, Palmer, Albert,
>
> This patch series contains miscellaneous fixes for the DTS files for
> RISC-V platforms.
>
> Changes compared to v2[1]:
>   - Add Reviewed-by, Tested-by.
>
> Changes compared to v1[2]:
>   - Add Reviewed-by, Tested-by,
>   - Move mpfs refclk clock-frequency to board DTS,
>   - New patches "[PATCH v2 06/11] riscv: dts: microchip: mpfs: Fix clock
>     controller node" and "[PATCH v2 11/11] riscv: dts: sifive:
>     fu540-c000: Fix PLIC node".
>
> Thanks for applying!

Thanks, these are on for-next.

>
> [1] https://lore.kernel.org/r/cover.1639660956.git.geert@linux-m68k.org
> [2] https://lore.kernel.org/r/20211125153131.163533-1-geert@linux-m68k.org
>
> Geert Uytterhoeven (11):
>   riscv: dts: canaan: Fix SPI FLASH node names
>   riscv: dts: canaan: Group tuples in interrupt properties
>   riscv: dts: microchip: mpfs: Drop empty chosen node
>   riscv: dts: microchip: mpfs: Fix PLIC node
>   riscv: dts: microchip: mpfs: Fix reference clock node
>   riscv: dts: microchip: mpfs: Fix clock controller node
>   riscv: dts: microchip: mpfs: Group tuples in interrupt properties
>   riscv: dts: sifive: Group tuples in interrupt properties
>   riscv: dts: sifive: Group tuples in register properties
>   riscv: dts: sifive: fu540-c000: Drop bogus soc node compatible values
>   riscv: dts: sifive: fu540-c000: Fix PLIC node
>
>  arch/riscv/boot/dts/canaan/k210.dtsi          | 23 +++----
>  .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  2 +-
>  .../boot/dts/canaan/sipeed_maix_dock.dts      |  2 +-
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  2 +-
>  .../boot/dts/canaan/sipeed_maixduino.dts      |  2 +-
>  .../microchip/microchip-mpfs-icicle-kit.dts   |  4 ++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 60 ++++++++-----------
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    | 40 +++++++------
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi    | 14 ++---
>  9 files changed, 72 insertions(+), 77 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
