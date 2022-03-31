Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD0DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 03:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=r3DVox8vgsFeD9WzxSF9bQTSYq+H3z53MZrUaUzJLgw=; b=Kh2Gt7PosRfJqXp3yKLf0LeKdg
	/vf8HO5nZ3t3QnF3Qi776bH8DyQmuprgn/wQhqQbNu12UuAg19q453bGpSfzyniUHP2uvP7rM4qHx
	OE2u9svFdT4kcvPbMMZOeII3UQNa8l0BenhAGduu9xAN+aqSYtCgwI9wOOtL8aqhDO3ISWAiLfS3b
	7fKMr4lEt5XpZd0xKsGhuo7pnQrzQDccc4pIQRZTZR/IlbTerYagIZqnq2cpidbFBbUGXhs7vPtRS
	rAiFXlLD7YYKTRZHq9yBWasc5z5NCNfp0jJyJ1QBz4XlEFpQhx03iLKe6L2gKfRgmi7yUIZuvyT3A
	+u9a7fWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZlHy-000W0d-20; Thu, 31 Mar 2022 03:15:58 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZlHv-000W0F-SM
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 03:15:57 +0000
Received: by mail-pf1-x430.google.com with SMTP id y10so17376299pfa.7
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 20:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=su81uPGLPlEfo3kKBvUrtbr7Q1bO5QHvXSGg8dkL+fQ=;
 b=GYdBweRk6GWXxrgZswn1g1wP5TqlOb2xYijX08he5T593LHNvihsBdxclepFnR7wPA
 EFDojWqpJICiiOKuQB//cisuhUNkO2u5FfDMfQ7xraDnZxIEaXhE6D+qkAGFe35j0/rl
 RO1qQO2LmKibxy7DGGirkpOSCxRw8dZ1qqwkj5cP30AjJuMIpCmQTXt3dxGQDeMiEtGh
 d5Q45bU3pivpOU71UsQ4SeFHJOX5d+mhVbGaKTWoO3ihezhVAZ1Mq0dvBZ4CY44+2+zJ
 Rnop+XYoeO70UTzueOxVxj/wtrVhWM9hBdPQqsaCO5lfOkdCgm02VVu0RnVDsDwNYnXW
 NNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=su81uPGLPlEfo3kKBvUrtbr7Q1bO5QHvXSGg8dkL+fQ=;
 b=qU/kxl8IjOvsOFfg1W5I3sjtyoz6/lkIdSQ4y/62cP8J4uirP+k3eiY6o7lvDg9EwL
 R15gAjg/gH8KQ0cacHd8ikNoLo4MxlsFe4RaGSD3dptIUi+KoLWIB5ef9dYEcRD93iRo
 aIygfZV3MasQ2GPOoyHc577620fyJaBSvtVmmwFq4699j3mtIVUxdgcOgdJwW5aeDF8S
 sTCbUOQybz4YlGrDfUHWYLwtBsdO0B9nt5YIPARHQm9g5m70HEPfbWGrGt1CP9oN4QVP
 0E9kzib90yTNt95JOQnZjqzg9vt3v0uEfwV8CDlI+XhGlm4CJq6yD6oAi4+LwxUPUD0M
 S0fw==
X-Gm-Message-State: AOAM530kmvbcVFWyLvbM9/5H3040McIyq9j1yfLNCEsaQzaZMbgFmbMf
 UENUvWeFKOfx+Q9hb+2X4WWoKA==
X-Google-Smtp-Source: ABdhPJxn9RkJDNkJxLQzGDRKo5bfKfQwmmRCBZ37Qr3/YIQ4rdiA5g9/oIepoLeX5+Fe6RYyeS5Nqw==
X-Received: by 2002:a65:6d87:0:b0:374:2525:dcb0 with SMTP id
 bc7-20020a656d87000000b003742525dcb0mr8997668pgb.248.1648696554441; 
 Wed, 30 Mar 2022 20:15:54 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 w9-20020a056a0014c900b004fb2ca5f6d7sm17801820pfu.136.2022.03.30.20.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 20:15:53 -0700 (PDT)
Date: Wed, 30 Mar 2022 20:15:53 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 20:15:50 PDT (-0700)
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
In-Reply-To: <cover.1648461096.git.zong.li@sifive.com>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, 
 geert@linux-m68k.org, bin.meng@windriver.com, green.wan@sifive.com,
 vkoul@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-6ddf988e-9f86-4f3e-8b6a-6be65f384829@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_201555_961313_A83599E9 
X-CRM114-Status: GOOD (  18.62  )
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

On Mon, 28 Mar 2022 02:52:21 PDT (-0700), zong.li@sifive.com wrote:
> The PDMA driver currently assumes there are four channels by default, it
> might cause the error if there is actually less than four channels.
> Change that by getting number of channel dynamically from device tree.
> For backwards-compatible, it uses the default value (i.e. 4) when there
> is no 'dma-channels' information in dts.
>
> This patch set contains the dts and dt-bindings change.
>
> Changed in v8:
>  - Rebase on master
>  - Remove modification of microchip-mpfs.dtsi
>  - Rename DMA node name of fu540-c000.dtsi
>
> Changed in v7:
>  - Rebase on tag v5.17-rc7
>  - Modify the subject of patch
>
> Changed in v6:
>  - Rebase on tag v5.17-rc6
>  - Change sf_pdma.chans[] to a flexible array member.
>
> Changed in v5:
>  - Rebase on tag v5.17-rc3
>  - Fix typo in dt-bindings and commit message
>  - Add PDMA versioning scheme for compatible
>
> Changed in v4:
>  - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>
>
> Changed in v3:
>  - Fix allocating wrong size
>  - Return error if 'dma-channels' is larger than maximum
>
> Changed in v2:
>  - Rebase on tag v5.16
>  - Use 4 as default value of dma-channels
>
> Zong Li (4):
>   dt-bindings: dma-engine: sifive,fu540: Add dma-channels property and
>     modify compatible
>   riscv: dts: Add dma-channels property and modify compatible
>   riscv: dts: rename the node name of dma
>   dmaengine: sf-pdma: Get number of channel by device tree
>
>  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  5 ++--
>  drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
>  drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
>  4 files changed, 38 insertions(+), 18 deletions(-)

Thanks, these are on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
