Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE844C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 22:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4yohNoj58Yl/EAQttNf4u/j1HXG+Vs1rOigezHatOq0=; b=xsDZyXi5M2jWnM
	IazxiQ1wvExvm9GN3VKn35BrskY7uDxmMYfX2dY1OtWB4sLPBuJGAK0oaFcVQ69DWoN5jtYvQNUpK
	ek2WzqT005vwvbPzcRop3dBJ8wOiO1Qh4Yr3VSi8sRgZoxqzCZFTg3GSj50qtsfJqyls+v3PppMJz
	wK/LRj6QWNO2x1a+RhPT7vAb92SjzjUFcRi5Bu+reTihH2NK9PQRzX9yt/1qse9nNI6YuWp8o3xZq
	lcrWjNZ2jvTbxCiC7R4PZCgaZStnzNdi77XKJMpn5kRo2B6rUg+vuapk2l4GvOfmnoGlrXsOBpHAz
	TnU6tLjkOKjls7PfjyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Zzv-000XPY-Kr; Thu, 07 Jul 2022 22:29:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Zzj-000XMK-Et
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 22:29:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so71025wmb.5
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 15:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yBL3Qyiw2yU4MEqrOIkV21CEVLt8E6eaNuc5XFAqVgo=;
        b=FIs7rf6SPWuGcAR0XCFWnjYw5T/OzNPnd9YSnTFkFAORauCxEU4Aczweq5XUCyU7kC
         S6RAs/jQU9b9oym4qyKPg8K7NvN+W2Vqk+MfOsIkqhFSyTG7R1rpvU/VnfhMOfJKREgf
         OYH40nwLHktSF2Fmgwdrt7PGSxYOuuMS6lwniQpOYOQjmOQCDMXunwkOoB/XcfAGxPcW
         k9y2BBZmIKiNI1EcqHHmxgbwIveR1WuD4foEDFPBS0PYWKl80+8iwMicmElV0Yeuf3ah
         6mq7A3UoXc8Kw2cdGowOwd4goKJ6pH1HhidVzp1le/gHe7ifDIu0YMC9wBqp2j4Shy5H
         jCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yBL3Qyiw2yU4MEqrOIkV21CEVLt8E6eaNuc5XFAqVgo=;
        b=3ZJoet3UwVx+jDZ2N2KcvfiNxT4TTJc1tMZRFf9rtUDKfTvBTn7nKdPvcwTIpi8QHU
         xhYxmdSzTmff5WBmxxIWyS2yhfP8WKncYZlCpspPGtW7PepMzBRzBXBCvqHLaU0ECaJk
         u5lq9ZNH2D9C3XULDXqBDctXUpDNX4VSPmVfSxGZNvkO8j9JsNvkde6i+V82LfjljYTJ
         CVjFfxN3oXjQN8ZuJJhjz6C0DmdcbIyjjbUrROyPYv5CcKDaoFb5yp2kLw71YHomu0YB
         cpCOVhw8MLmsxRCgGKuA9h+rWPTfweW/5lJ9tXg/SwViTT4TiBwNGRz2Q9SMviKsLm0V
         LYtw==
X-Gm-Message-State: AJIora+ELEPI0ll/veOkQcT3sfqU6Bj8fNwJOVIA9mstvk1BNTu/U1OY
	F0cNdXAEjenyvWqSWAjuMhuPLw==
X-Google-Smtp-Source: AGRyM1vHQ4F1C7uBW7hPq+3do+lBz+obsL6jknlXj5UKr4APcprktMviJ51oUK55Q3Z3fUeppuJe/A==
X-Received: by 2002:a05:600c:1d17:b0:3a0:481b:f1e1 with SMTP id l23-20020a05600c1d1700b003a0481bf1e1mr7023439wms.136.1657232949057;
        Thu, 07 Jul 2022 15:29:09 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id r190-20020a1c2bc7000000b003a18de85a64sm148855wmr.24.2022.07.07.15.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:29:08 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: zong.li@sifive.com,
	robh+dt@kernel.org,
	palmer@dabbelt.com,
	daire.mcnamara@microchip.com,
	niklas.cassel@wdc.com,
	hahnjo@hahnjo.de,
	kernel@esmil.dk,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	paul.walmsley@sifive.com,
	mail@conchuod.ie,
	damien.lemoal@opensource.wdc.com,
	krzysztof.kozlowski+dt@linaro.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brice.Goglin@inria.fr
Subject: Re: (subset) [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Date: Thu,  7 Jul 2022 23:29:04 +0100
Message-Id: <165723282709.4170238.17783892176422654947.b4-ty@microchip.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705190435.1790466-1-mail@conchuod.ie>
References: <20220705190435.1790466-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_152911_553870_2604D3EE 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 5 Jul 2022 20:04:31 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> It was reported to me that the Hive Unmatched incorrectly reports
> its topology to hwloc, but the StarFive VisionFive did in [0] &
> a subsequent off-list email from Brice (the hwloc maintainer).
> This turned out not to be entirely true, the /downstream/ version
> of the VisionFive does work correctly but not upstream, as the
> downstream devicetree has a cpu-map node that was added recently.
> 
> [...]

Applied to dt-for-next, thanks!

[4/5] riscv: dts: microchip: Add mpfs' topology information
      https://git.kernel.org/conor/c/88d319c6abae

The rest is yours Palmer once reviewed :)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
