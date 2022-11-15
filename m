Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D47C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 10:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKIW4xHv/9gRESKxf6OkmcGZNno2pkK2yqkIz5GbZOA=; b=OHlhrJa4oFUzDr
	OPmx9v7oRb8FfqmsDE9lG9mLGsHz0dFNrLAAqegTUYpEiRNFCxapL14mFpML1+1ljdj+QtfbJW2wb
	m+M63YVMR2PE2gCFA+qzngffVOvQK+UZpahLjHg/ribq31uk5N66JJkjaADrw+hzOdTLIG/A/UHlz
	DGoJIs+Nzir0GgPUAQ6qsTEH/HE8zW6ry6VlqT216eejBk0tsuEl80D05GQdzqWPynmvwg+OOhem9
	awAlG8dQF83js51NPwNBBNZBTVirSttxtERX1VW2UXCs1q9JWbkIzS03nPKcgPSBqLaxL6BOj6STm
	6QD3wq7QJtsLIcqve0Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outf4-00AFl6-0q; Tue, 15 Nov 2022 10:59:26 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1outXj-00AAii-Uq
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 10:51:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id g12so23378665wrs.10
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 02:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMziarFdlN574Jm70LJY3GIW1tVMw3fEoLjKN4Ko0Oc=;
        b=iWfyr4RRlzz7gtM2f3lxzyJ0A2fkcZqWxfJTIgcHWcKD2Pt3dJzEAmXmAqPet31f/e
         N+XvhPvm4tIErNw5FpkQHrdZ7lIchD1uLmZ2hO7qBitjU8xS1aaQZ5PD4xmsvwmgvrkX
         yclgrNPkhQzC3fWUl4G40vtNyydWTzBFQkKfkO51qvBq/ko5JE58t2uZ984GuzgM56gz
         7elKAuvq3aXxZan0INxWrEHKNCA4Gq+L/wMysSkEmpWPiAuVWpPg4QYPdfmmJK1MEEJX
         k89sLyB+8jZjewJX8vqqmZ0FI+QHNcpJyXslh/u/I9aWpMVALNdUAB15BHVUxaiqCrTQ
         BY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WMziarFdlN574Jm70LJY3GIW1tVMw3fEoLjKN4Ko0Oc=;
        b=MrkYhXDbKKRDE0bd/etDz85q3pXvpwoYRm7Jpj7VGt/Y09SsOQKAVlcYzF5LimVUv8
         abRfQO65b8Ridzc+ISzpngE4Og7ttjwR3QjDNYBXIGmKUCRaqp+L3Cdt3xCslILX6Gsp
         ASgp7vxU7y2aREtpmlOrsrvCHgQUbDZgYJBZeUx2aM0UB7HrtFcPals3eT6lXZNhdwMI
         u2YwWTWQjZTIS2eNqV93V85DYUnIGQgefftq/PaytBXeLGWHLVw4VIlIOJwag0AG/9QM
         QeZ4WkYObfTUeL3fJqhMGQUrUcwD8PkGxiaESaGqNmiieE3dk2zDhif37BKfoHwIxYjx
         rk2Q==
X-Gm-Message-State: ANoB5pl/MXQK8LNEQ8EonWXtMh5AdLgh5cWxCsaExt2XAIGN5L9LQ9fm
	sbqPRBFl0Rys6b5yRcD1NKw=
X-Google-Smtp-Source: AA0mqf5h6L8q2mgB1tbE2qf/spcjGpsvY9nzROH2iRGJbdCcquCPox+0ghQbVmMbcVrwNgeabhV7/w==
X-Received: by 2002:adf:f008:0:b0:241:9cb9:d473 with SMTP id j8-20020adff008000000b002419cb9d473mr1141026wro.59.1668509508120;
        Tue, 15 Nov 2022 02:51:48 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d94a:6345:c378:e255])
        by smtp.gmail.com with ESMTPSA id az9-20020adfe189000000b002367ad808a9sm12210528wrb.30.2022.11.15.02.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 02:51:47 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] riscv: Kconfig: Enable cpufreq kconfig menu
Date: Tue, 15 Nov 2022 10:51:33 +0000
Message-Id: <20221115105135.1180490-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221115105135.1180490-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_025152_071468_3B5EEC3B 
X-CRM114-Status: UNSURE (   8.08  )
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

Enable cpufreq kconfig menu for RISC-V.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fa78595a6089..ce905454a3bf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -691,6 +691,8 @@ menu "CPU Power Management"
 
 source "drivers/cpuidle/Kconfig"
 
+source "drivers/cpufreq/Kconfig"
+
 endmenu # "CPU Power Management"
 
 source "arch/riscv/kvm/Kconfig"
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
