Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6C8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZACh5CKhlMiMYDwho44Mp6HLkUGHrBOauCVTplGreiA=; b=vemZywnyo2Leom
	VP41oPtZFUHsa9Scbo9+q8kPh7KjCDA5S69Jt4796YA+10+FZmCcZ13m8Du0tXDnPWXbuQOvbNrB+
	4LaShe7ajdw/pAzadVGi41A85Pfc0lseNwNUZVaQC0ZXo+Sxzp05sbSDLkn89YC4Mr21iVbpOAcco
	rfl4IWky9VX6facb6yeipoRP7Fpq7UIZ5i+0nL798Jty2QGYMcodT+wA5g+HC9V3l7tfqp+OLrIPX
	x9m7Z8FPW6aCxNpMjjh3y11DTsmDYGhq4Fz16dQYlFi8e5zNnRDGd6eTUyvk9k29j9QMzJxE2ZDyD
	YwQsD8oW1Gh/3Vafy5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HzE-00AEvo-LS; Mon, 05 Dec 2022 20:22:48 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HzB-00AEpo-St; Mon, 05 Dec 2022 20:22:47 +0000
Received: by mail-ed1-x529.google.com with SMTP id r26so17396579edc.10;
        Mon, 05 Dec 2022 12:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dkl0GaWgeqVQmFYobiRcFtfUz3ufHqhTS+/iP5/CmzY=;
        b=b2zK3kxwbCERv7eiKN8zG2OpB/f3DOYQlaYVNclSh7psvFOndpURX2gBPS7wIUTzVP
         klxZ6VI6nnErkb2f+B/jUZylC/c/Aq+B8Z38vBEU0TlHSK4wvAqR12UeEmrIcL3a5dHE
         WdltyzxWxKtBcOhMl2zaV6JgO4PKSAUnkKmH6B1HGGe41iezzP0OVh+KgQCs/tnz/UnG
         nQgrGyCLV1JmDpEXUSOFrY/B7pYg8e7JCaZMmfY4PS7Ma4VRcC9hEd5j5e9eJzZnkWtY
         W9KO+tJm+gpFTy/o1PLnHD8TP4GyXCc9lfa6f0lqbIJgepsJoYcxQFs24WuHTgRFnhCS
         viHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dkl0GaWgeqVQmFYobiRcFtfUz3ufHqhTS+/iP5/CmzY=;
        b=rU/Aa77qgy+11vfR2RON6bvktrVemUp1O5XngcIIT4EN1xw61paIiY7aeqBYuTXdDP
         JMfkdj6BpVxEgOTvz6YEg8TehL8BFITOr+c0Iu9R/+4AIiJbjEMd6iX+WQ2Xv2f5iR3X
         Azvb7VIPw3mp3wPTFz1tA39oaaezQbraFuruYwdBoXrF6WuLYH2EaJKoRonCrNtw3lew
         TWCqi3NlnXrBQgdifsvkaGCsQsTv3BPwMlKoLAJ6sNAcNAWqDNWJxSPxZbLEnad5VKd0
         h9fxSAFl14mBji/D7M8d1TFAZrEBKI1gmI7truk7R/Z2OZBt7XBHsPKJDOHNwDwW6KVf
         u41Q==
X-Gm-Message-State: ANoB5pktqpm7YfTDSvyiGQteyn1moXlje9pGbtw20qnoyUrjDJBDyBGL
	qWmiIRvJI4oNeQXJE76RGN1CAVvSlJG+bw==
X-Google-Smtp-Source: AA0mqf6OusveNiyokREy9CpPUEzcYnrvTHBiSncuuqjcAmK6ab/MZsPZLAbESEuZEGGmnGGJ5ab0WQ==
X-Received: by 2002:a05:6402:28c9:b0:469:ba7c:bc75 with SMTP id ef9-20020a05640228c900b00469ba7cbc75mr1454416edb.286.1670271762323;
        Mon, 05 Dec 2022 12:22:42 -0800 (PST)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id fe17-20020a1709072a5100b007be301a1d51sm6546663ejc.211.2022.12.05.12.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:22:42 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 01/12] MAINTAINERS: Match the sun20i family of Allwinner SoCs
Date: Mon, 05 Dec 2022 21:22:40 +0100
Message-ID: <3201066.aeNJFYEL58@kista>
In-Reply-To: <20221125234656.47306-2-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-2-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_122245_991675_9FD7B17C 
X-CRM114-Status: UNSURE (   7.11  )
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

Dne sobota, 26. november 2022 ob 00:46:45 CET je Samuel Holland napisal(a):
> Allwinner sunxi SoCs with a RISC-V CPU use the sun20i designator. Match
> that pattern in addition to the designators for 32 and 64-bit ARM SoCs.
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
