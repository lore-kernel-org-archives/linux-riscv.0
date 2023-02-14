Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7B1C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 12:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+LHIBwc8VVybpEd17T9LfIwXXoWmVbGDGUOvvkicEM=; b=q1N2HCwb6CZfdD
	xolSkv1yqE1nRHu/hhNYT/5CxBHcY+HDxvrnOO1n6pBoOFgjlmAqEXXAtf9MR58n02aHQ2brkYKlu
	MKXvY4UbXJ9SBvAC9tKaFebjCFj51q7RDJ4Gte3wOuuJQu0E4gInFXCTuwWCnSkuvDHXQ5MAHqWCz
	KoFKmt8yRQDCVTEWlGs6zEib8ZjKc2xoTCyOuBDhNFh0mrRcvUv2h+rzSG8gKq6TCM+FnigoulLSL
	IRKEnPRuwJVHlEJYP31EFCp0noNpX5LIZO80LNbgCaEs/KCnm1TqwfzC4rwB9Bm95wzwHOmrVg05y
	3wH/z65NYic2IbiKCyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuGy-001XlF-FA; Tue, 14 Feb 2023 12:19:00 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRuGw-001Xjr-82
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 12:18:59 +0000
Received: by mail-pg1-x533.google.com with SMTP id x31so10111967pgl.6
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 04:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mJF25grJEGbcmrR3blVtuGbf0zHzSa1eHqZOGdnJEao=;
        b=RvLdMEI0M9Y/FEc1QfjNc3t2QPnlRQp4LhYoK6aCFKM27Pgab6Wxr0vnSagxdIgnrx
         /8uFtlua7yNH+Juz/Ws8B61SAjU88QMZdyixJOFwkDf79eI8dbiQdiPmlu5G086QdqiK
         JKrpUHaFPxklQzGoOcswbTAF4kk7OjRXuXVV/cvp75gvzS+YnSibBAYYI1AEpyw4yxCZ
         v8eDSBhPnt89EHS2R57f2hQAG9hY34J8mjQsyjfmuIDrWGdFybV6gcwdtdGPD4dFGxMB
         H2RU3AdR28cmCqIj13B/7e7jwtrUdaA2eiPquNnGONYaEujF+/R+FLFAOwg3FPFIjvAk
         HaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJF25grJEGbcmrR3blVtuGbf0zHzSa1eHqZOGdnJEao=;
        b=MD9OKlxKTjW/doQLlD3wPVhRz1fNTRIuj3Jl+rdmEoZbFOq2b4ngCNuS2ZUNqauJOw
         8ZT+A0UwRHHd/2+siw+9Y0d+SUeeyFOWEytMnaNjEWjtwJOYcvNEGC6qVbr3rhgikUJy
         rsAcHrHQUSDV8190+ny0E5ukw6XNQOohzNlcvfYQ+D7mSDHUNMdwucDxm4PjERqkbV2s
         Lm8eBU7eGjJNg7su4GoJV+zODATsdKEAgB4hYhiKh7Mnq/UcwXNZxoFb3iCIs6xPzzBy
         ptuabr2SRfxR/a/amKoZnSTFOdBbGVCwOke2kkF4WeuyTg38RAZm2ai4P+TJjP/ySjaH
         kNrw==
X-Gm-Message-State: AO0yUKVmOaNteihGFfyXzzNmQO4ux19wHTRyjEHSL+wN31kpV8aX91Mc
	bmB1sKaf0aCdiNoqZt4d0Tnvh+wj6X6yl7R9GXUjGA==
X-Google-Smtp-Source: AK7set9r6FA2oxfaL/Gdvw6T8lOPC0lfz9vEUH09Doy2PfK7K4PKN/y5UpizMnUOEyCW+zd+Iarf90OGN7ZCkpc06+s=
X-Received: by 2002:aa7:9e84:0:b0:5a8:925b:f68e with SMTP id
 p4-20020aa79e84000000b005a8925bf68emr369542pfq.28.1676377134742; Tue, 14 Feb
 2023 04:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20230203081913.81968-1-william.qiu@starfivetech.com>
In-Reply-To: <20230203081913.81968-1-william.qiu@starfivetech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 14 Feb 2023 13:18:17 +0100
Message-ID: <CAPDyKFqei-GjKpBUQnDZUbYnSyn-JS5f_EnTLOuA1U4PdYTyVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] StarFive's SDIO/eMMC driver support
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_041858_303836_B3E78378 
X-CRM114-Status: GOOD (  16.55  )
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

On Fri, 3 Feb 2023 at 09:19, William Qiu <william.qiu@starfivetech.com> wrote:
>
> Hi,
>
> This patchset adds initial rudimentary support for the StarFive
> designware mobile storage host controller driver. And this driver will
> be used in StarFive's VisionFive 2 board. The main purpose of adding
> this driver is to accommodate the ultra-high speed mode of eMMC.
>
> The last patch should be applied after the patchset [1]:
> [1] https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/
>
> Changes since v2:
> - Wraped commit message according to Linux coding style.
> - Rephrased the description of the patches.
> - Changed the description of syscon regsiter.
> - Dropped redundant properties.
>
> The patch series is based on v6.1.
>
> William Qiu (3):
>   dt-bindings: mmc: Add StarFive MMC module
>   mmc: starfive: Add sdio/emmc driver support
>   riscv: dts: starfive: Add mmc node
>
>  .../bindings/mmc/starfive,jh7110-mmc.yaml     |  77 ++++++++
>  MAINTAINERS                                   |   6 +
>  .../jh7110-starfive-visionfive-2.dtsi         |  23 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  37 ++++
>  drivers/mmc/host/Kconfig                      |  10 +
>  drivers/mmc/host/Makefile                     |   1 +
>  drivers/mmc/host/dw_mmc-starfive.c            | 185 ++++++++++++++++++
>  7 files changed, 339 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
>  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
>

Patch 1 and patch 2 applied for next, thanks!

Note that I fixed some checkpatch errors/warnings. Next time, please
run ./scripts/checkpatch.pl before you submit your patches.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
