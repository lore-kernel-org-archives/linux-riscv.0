Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426AAC352A1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2b5IBnB2V3Fb7Zbx13MwNmk6Sk+aCWhafvGPlgieIs=; b=wfH6nuFkhB0VxJ
	bBHmuGbUAYSm4fE0leWQFEem/j4BPLDViJtYRpsXfBf3JtH6LYhMZ66whRF1CQMoxMzi0dKc8lDVu
	I0x2FTJGAGPkVMUKJeTQn6WLphOEynVWjzC2oBhjrKBbhfPO8hSQmOkl4/sLZ6ryF2yWRGeO12fUr
	VWX3H+OXn/xbeh3RiP0r0edvfXnipdsY+jwzrhIKDKEaBNwUNjd0KnnaTPcBM/z/FhRnl1m9tZcUo
	irx9meH/iYuDIN365WBnC2yq3GPjaZjnxIP/YK9uEbh6+s5n/1cTI7T4qBgA8NnM+V9ZxowbIxerZ
	M645UMmTFg+hU4+avNHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PMw-0006kG-Bi; Wed, 30 Nov 2022 15:51:30 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0PMt-0006hA-4N
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:51:28 +0000
Received: by mail-ed1-x529.google.com with SMTP id b8so24586571edf.11
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=deJC1sDg0uXUF6Du8v14BKQ6Jr/MPpxoK8+snIvk8c8=;
        b=JmJ8WjVxT7ZuxkpjaaaRNUyWKGoHkws2zmybzd016ae5fulufcZeKoujky/zAOfXyX
         t+sIG7FeqAE/TmQjQk9ugzAMa7jlZBLl1nxXsJztVwx9ywBsmdkRMf9pD2zjRRMq6v4L
         tdQhONApKMeAXu9dEihjlPTWsamyQ54x/Nn1gEwDU5AyuRPWDJnXRALYghMnG4V1TmGz
         sM8sMSFsIah1dw2NZmKKoq0ICSEzraRVkjdEcNZJ8MOZOAhJ5txa295s+65psCn7a7w1
         5df4Ks6dnoyNyhZZdfHimqO4PVnjHFXWUimT2pgmSTSxKgy0U+Hcan+Xym2xyKg8+Rt3
         nHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deJC1sDg0uXUF6Du8v14BKQ6Jr/MPpxoK8+snIvk8c8=;
        b=ia2ROozFxZG+LFqyvPxfC8ouqlCCCgU7rZwfbPSgyEXvwgMMt6ZKq3tlnIS3XJYbyk
         sRclo+GF/sD+QVGHmHfXa/NkBmPf7e0CLIVS4BHjsI1UtjCO0wl2+haWOUFZiXGsROtk
         dVGCS0fyeEtGNiOQDmOERFsGx11obei4v1BHjn02oRC1VNdpS9ftpcgacNHJCeXvS0fe
         m0P3XGUj7RN3oQJs90MkVx/2UB+W5DIRAc1IANrdrfiI9AnUDOvL2BwOlBaUTIatu671
         emEBqUpqepT0oyljKQgKifbJs8/klqWdMcglgevX+DJ5tsE7VMhWvXBVAddoicRpRsP/
         37aQ==
X-Gm-Message-State: ANoB5pmrDG3D2C1wwzHd3m7wXuAWbXE/ol5F8slZ3zoGYKZVvGZGY91M
	mtdHxAk7x/9Kszwsd1Cc1nK2yQ==
X-Google-Smtp-Source: AA0mqf5NNuuoFQjGtJ+GLYYqGhbs9zZjMgGkxjEQF+qUT40JoISBeklf8zIWAaK8b4CHWDYTQki6kw==
X-Received: by 2002:aa7:d417:0:b0:46b:203:f389 with SMTP id z23-20020aa7d417000000b0046b0203f389mr17091223edq.303.1669823485196;
        Wed, 30 Nov 2022 07:51:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id kw5-20020a170907770500b007933047f923sm771601ejc.118.2022.11.30.07.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:51:24 -0800 (PST)
Date: Wed, 30 Nov 2022 16:51:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 06/13] RISC-V: kprobes: use central defined funct3
 constants
Message-ID: <20221130155123.vwi56h6g6i5dbx4z@kamzik>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-7-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-7-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_075127_189384_356C171E 
X-CRM114-Status: GOOD (  10.99  )
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

On Mon, Nov 28, 2022 at 11:26:25AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Don't redefine values that are already available in a central header.
> Use the central ones instead.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/probes/simulate-insn.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
