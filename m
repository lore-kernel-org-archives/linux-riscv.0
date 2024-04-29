Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12D8C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sYQVWOoEnro8uZPUsuQMZSzU7feSU0lBQlYu0xIW3ac=; b=Xss9gvBKOdE0g6CnGktaVNWXHl
	gokzwreCFjKAQj5RrJy8yG2E6fxCy5EjeVi1ET7GXL3xhH8eRp55DNR1vTz2r3lLdCaClB14X1t8G
	CNanso8OESN0TJthM/2YaD8DRcBndSWxd1ncX8pBtKCVmcpvLBJ9qFJrQ26niJ+iDKuoE2uBJyvGx
	1ssthpdAd0I0aGVmH/srJLlfCMbNQ4ZlGSxuDMlH4dweoWFeFfp31kGfVo2TJo2krRPMMW8eAgw8c
	Cc4QycTgV/UFVkS6EvPYZshKXfXGJaigtWPxBBFYdDu6SPqbIvnMk0J0kc7HAJseAYJcNBsWKFEcM
	IbUBCBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RR1-000000030xg-0pRz;
	Mon, 29 Apr 2024 13:52:47 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RQx-000000030w4-1THW
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:52:44 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F10743F2D0
	for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714398760;
	bh=AsKCtbhh0t38BAJJdTfdKeBFCuozd2y8Acb8XDQyUhc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PlZtJbP2CqjnWYNY4iOIMOUjgrExYa7o+fTbdGCd5qXAGZ5sKVpFLQbimcZdqoLti
	 FLWYGudfP8bIhaGMWfpcTCxLRujTOZvG7EO5cAS2F5hXoDIXF3EslsZDdeLgOQVMtP
	 lO22zH3G2rbfVjMAw3CCHPPJR/4OWtn4lWvK13ExSoOEQZjKUd3JleETcVvmbbITl1
	 cqlI+oXSsGuZZxxAoygQIL7q6Fv8h7ewCL9Su33+YS/d3+OG0rBvZyoUcP3k2ASImB
	 oqnbdxw7rFrYyGlwkW/w3SRRNNtA0Ek7w3zOvFAUMCOfJde2IlHtrmRW6ArQGOKuQR
	 sxu9iCAE2Kv4Q==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-439e8824c7dso57620361cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 06:52:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398757; x=1715003557;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsKCtbhh0t38BAJJdTfdKeBFCuozd2y8Acb8XDQyUhc=;
        b=qzma+eARprc6N4WO1+clE/482EdTH2aKoRcvQq4Pvb5FJP/ZmIvliJHyOeRxfBq3eG
         hcITl1dTF3+aHTTi8WVkkytMHhe44TRV8rvUuu731YeLMr7XQIOCo1TBwANPatV1LjZe
         xUTJkcswy8IoOpHerNZVXDMNRbTfAiupQjaal9LKPvUOZYDES3BhoT7eWA00HHgchSWv
         Vf64FERvDt0dlgkaZAcyb1meJYUFYBpkyKjvkOeAfrvWw5gp50vsfcARf0OyWfmu08FA
         a9ykRYczBZQ131UQt2YDhcDk8dzbd1NFrrOBKH6CxWoltraYuo3zHi/+E0G1Kdwvx+T3
         Rk9w==
X-Gm-Message-State: AOJu0YyfoMQQKkQJn0/Vl2rE4CCRu3ahL7z1iIpKyF1H6NAk9H8fiRlI
	0Xeztt/Hf+/pJOop7mjiStFhNdwsLPyzh+UPcTGZ/rAxXzvWTNP2apg+EtjcbhGi6G+hqBLrlQE
	wqfJiG9OQHBrU36HsJwuqJeQY0m+BaBmqZ5qLx2jLhMEcleCOk+fXWEeLmAloq1zN83P1eosJ73
	mytir6aZWHcHjQJTViGaRjRhdSZp2nng5vpPTr2XmVGx2u53un0yxjCy3c
X-Received: by 2002:a05:622a:115:b0:43a:cc86:568d with SMTP id u21-20020a05622a011500b0043acc86568dmr4712042qtw.23.1714398757081;
        Mon, 29 Apr 2024 06:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvsZDMj5ez5DEP73GepCyTJCbf25O42FZuiBqqsRrRWXYhRZe9NxVtx5qVKVmEXoQHNABuLQfLBMvNRJ2qSCY=
X-Received: by 2002:a05:622a:115:b0:43a:cc86:568d with SMTP id
 u21-20020a05622a011500b0043acc86568dmr4712026qtw.23.1714398756859; Mon, 29
 Apr 2024 06:52:36 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Apr 2024 06:52:36 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240429001317.432-9-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org> <20240429001317.432-9-jszhang@kernel.org>
Mime-Version: 1.0
Date: Mon, 29 Apr 2024 06:52:36 -0700
Message-ID: <CAJM55Z9Q3sm=2HPoa5cWh8_hn9xCCgxy+v7H4y9n=jWzhCKdbg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] riscv: dts: starfive: add Milkv Mars board device tree
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_065243_538276_60DD2FCC 
X-CRM114-Status: UNSURE (   6.06  )
X-CRM114-Notice: Please train this message.
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

Jisheng Zhang wrote:
> The Milkv Mars is a development board based on the Starfive JH7110 SoC.
> The board features:
>
> - JH7110 SoC
> - 1/2/4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 3x USB 3.0 host port
> - 1x USB 2.0 host port
> - 1x M.2 E-Key
> - 1x eMMC slot
> - 1x MicroSD slot
> - 1x QSPI Flash
> - 1x 1Gbps Ethernet port
> - 1x HDMI port
> - 1x 2-lane DSI and 1x 4-lane DSI
> - 1x 2-lane CSI
>
> Add the devicetree file describing the currently supported features,
> namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
