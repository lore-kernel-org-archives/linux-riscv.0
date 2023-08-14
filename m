Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FCFC001B0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bHzakIT+ADTFK+rxgCmVUlSkZwnuaUr2ypC58tCstE=; b=dQw0T4IIRqyFBf
	ldh0Z1c40gPr0V4xvHNsosTTUc5kmxv+aJwN++OgVxy0PEegbI0WmmNyA7mAoqhO7cHj2joywsYkZ
	b+z1A/WGs9FVpcV2lGO9DpGPNbtKCloga+u3w6pAuX1eOBvs/CWVcSC118frz6GdHHgCmKT6PJYhw
	xmePSXHjrw5+SByfkYXC0tPN3LMTTWCrjZOMeVTCZtyicAxvr8pUnOhevLEv3N7PSHnAKbN18KT9Y
	kEw2W6056zbno6xbTHpul7Kc0kzoNQFuVt5T2z7TLDOIOJdlWmAh0VwEQ1oK9sYV2u/PSsbjKtLmC
	CzOlTTS6FOMPBbu+t4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeeJ-000KYi-2r;
	Mon, 14 Aug 2023 20:58:51 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeeF-000KUi-1z
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 20:58:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe1fc8768aso47947445e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 13:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692046726; x=1692651526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQLIiVxRhbv1KuVaK1dhNf4UzFIBILNWkE7IAI5OtK0=;
        b=jxVGneVTdElRhDZ3u4EIt/CLh8/K3sYbbEz3NcGo41YK2bJ0tKqLJEvu7inB2KO/9D
         gLl7bEEOGgH6RYw1WERG1/hYlGyqVEklVhEoC0sx3Xr6aJfciedn00KVy8gOkmLyJ5yO
         T+GXUWmP0eInDQ6dBPhT5xiMjItdCn3/yEf6RSrIfGZ5EprhFv7Hlk/3G8HZu2ojVsmD
         2h5namiDGu/gIL1U+MrTUUyw3HIRCD+u6jRfFltXqy37klTpD2dsVYtpxroT9reljZKk
         yNdYCz3pY3lUeztb2gpqK+zC9a7DwtV1Eqc4ROU8t/WRNF/nJk17xpQ17pZYBTtL0FwF
         JMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692046726; x=1692651526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQLIiVxRhbv1KuVaK1dhNf4UzFIBILNWkE7IAI5OtK0=;
        b=jXz78Y6ykSCHub3dRy75cwI2+QqpOHwN2oaega0FIG1WaohlPGGoBKkX4F4L1uIUwv
         gIMCg4k6TMu9ShwT0tXdkdX9WYdzO2qUY9QPPhF1v1wQP8CKTVBGZzX7zefK0ed1RqBM
         6umEMJPKhVoJ4o10d89B30eyXkN6NCffVj1fNTZf7f6OsVw3x7g1jaUCej9PntGV0i/A
         KR33sUHjijFPOsu1vyFbNB47e0klTVanqcV5QqpHerDlhgEW8sBMmFFqiXDwgBXQLv0Y
         FNJeY981pAs7TcfYOSJuScSUq+IzLjJffQktLHKfUvfKNDgWFriB8/4uQbdA1j6guz7D
         ExKg==
X-Gm-Message-State: AOJu0Yyac+2HafGxmZ5CneBZaDKGxknzFOuvg8RoBVLPiTVeHo580069
	3ruE7pxuRot6O1yQp3WbNm0=
X-Google-Smtp-Source: AGHT+IEQ+Xs/+GJF5RWbUy0orkVcy6CYrZyKDE5YofRDcX4ZqEQ0OX2PIu+E9gPI8OHqMehGN5uO5g==
X-Received: by 2002:a05:600c:253:b0:3fe:1d13:4664 with SMTP id 19-20020a05600c025300b003fe1d134664mr9211797wmj.6.1692046726040;
        Mon, 14 Aug 2023 13:58:46 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:20e9:baea:a4f7:d880])
        by smtp.gmail.com with ESMTPSA id h5-20020adffa85000000b003197efd1e7bsm2161806wrr.114.2023.08.14.13.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:58:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guo Ren <guoren@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 6/6] soc: renesas: Kconfig: Select the required configs for RZ/Five SoC
Date: Mon, 14 Aug 2023 21:57:19 +0100
Message-Id: <20230814205719.79647-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230814205719.79647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230814205719.79647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_135847_714427_7D81945E 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Explicitly select the required Cache management and Errata configs
required for the RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Conor Dooley <conor.dooley@microchip.com> # tyre-kicking on a d1
---
v10 -> v11
* No change

v9 -> v10
* No change

v8 -> v9
* No change

v7 -> v8
* Included RB tag from Geert

v6 -> v7
* Included RB tag from Conor

v5 -> v6
* New patch
---
 drivers/soc/renesas/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index de31589ed054..67604f24973e 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,6 +334,10 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	select ARCH_RZG2L
+	select AX45MP_L2_CACHE
+	select DMA_GLOBAL_POOL
+	select ERRATA_ANDES
+	select ERRATA_ANDES_CMO
 	help
 	  This enables support for the Renesas RZ/Five SoC.
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
