Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B2AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 20:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IvBM6QY9M1wioGljmJkhGn/IKJtsMb52+1LuYzz5hKY=; b=ZnhAMCuRmWi3la
	kO/hUvYJs3l7LIqLeDYiMY6mph/xrODy+PcyazJgXSL9jlwGhJoPw6SZviK3MfuyuYLC7jOA6f6kW
	4dw++xuFbG7qWgvTEvynJZWDm2iNBEZ5/vmUxDNZ8x5oPf/GLfPPSXglwtMzM/pteTdfug880gvtb
	g78bExCE+8Ur05sFbOYXqOT0SIzp0GGFgxz/sVhAS4NnkKkr34IvV2pHexWZDBgHdonx/JbbEQxKG
	gC4sSnwa86HfZu1MgbaIuG2bCfOOww0rIywcPrJfcxHXqayL1QD88a3Ov0QO30QDrfLKSz4ivn8NL
	HpEFK6CGFTXpVKL8GaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMc5P-00BZft-Mv; Tue, 22 Feb 2022 20:48:39 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMc5J-00BZbR-05
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 20:48:34 +0000
Received: by mail-oi1-x22f.google.com with SMTP id ay7so15933224oib.8
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 12:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klZ1jMjbBvLLqWpFcVVPQAyVMxl5JTcih5hQrWe+IKM=;
 b=SToRoHvrgISX5HcL1lbaJnzkK53qsAnL+YhbPx/ajhID82BuLQq8fsttj+vq9XmDCC
 X7QwCrMMZkcCMi7ZE0u94fuFeCGYyg5edz2U7bSCAbGgipkNoiK5UAxKwtXA4JdfbXbs
 1i3mF7sY1OX+rmyhL9+OddhiwK58X1jeGNoL57g/izIWG+KE15ndTqxJ2Y8BD4GWW+9R
 QXpluEmcSJRwLW5L4joKNrFJ2MJuIELZHAzYtBuq4IsLAem1+r2jw07dj6Kih4iB3xqJ
 0DMZcdx/YYhDqHHb27H5ogfGGRUAX7AUSplf06dE8EWm5AZI03ROUP6hAfQ48LnlDZFe
 0uXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klZ1jMjbBvLLqWpFcVVPQAyVMxl5JTcih5hQrWe+IKM=;
 b=CeoCbyhNq9LR1oQUgvi/HmxGiOJfjTPmB5xfjGoHFc8qhrnQFQrKpWvdkxrCS5kOUj
 S/5aW77MpHgtEjX7bsvANT1IleQBEm5dRTRiBQlRp2ai3vu41UvgLmVtRfgLSwLzvK+C
 DaP3njt6r3bNB3kW6mZzwSitkwbFnTXXD41vhlSZ8tOXfldLBLhPiCga+waPDJ56zZmD
 fqteJhDubSUuFNfT4D7u35Kl6RS3BMmBuEX26x0p1+ntJ9pIDwon9kU6GyvkxIXkDL76
 bu2GArFgkTZWoHfdSUQsvyRy0Qp2iWIh4hOFCfaWfvPRhApAJniQZ2gNy/DmDxsIlKTU
 Agdg==
X-Gm-Message-State: AOAM530jNUC0qYkeaXQ0hVQFNYdD7IOoXukkiIUxN5FlWyTdlaxfwWee
 QNtsI/l8IklhCN5yXUNWK1m/QQ==
X-Google-Smtp-Source: ABdhPJxuDinis6H1SdDayKBv5l4KVw4gpSxffp1LNNYuA9r/JGZwEVp7PVaiYmeyU7yakZXDrftMjA==
X-Received: by 2002:a05:6808:1441:b0:2d6:9ee5:99b1 with SMTP id
 x1-20020a056808144100b002d69ee599b1mr1571540oiv.18.1645562911821; 
 Tue, 22 Feb 2022 12:48:31 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id o14sm16508197oaq.37.2022.02.22.12.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:48:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 5/6] RISC-V: Do no continue isa string parsing without
 correct XLEN
Date: Tue, 22 Feb 2022 12:48:10 -0800
Message-Id: <20220222204811.2281949-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222204811.2281949-1-atishp@rivosinc.com>
References: <20220222204811.2281949-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_124833_075289_C0B8750F 
X-CRM114-Status: GOOD (  10.74  )
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

The isa string should begin with either rv64 or rv32. Otherwise, it is
an incorrect isa string. Currently, the string parsing continues even if
it doesnot begin with current XLEN.

Fix this by checking if it found "rv64" or "rv32" in the beginning.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6693873e95c..f3a4b0619aa0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -84,6 +84,7 @@ void __init riscv_fill_hwcap(void)
 	for_each_of_cpu_node(node) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
+		const char *temp;
 
 		if (riscv_of_processor_hartid(node) < 0)
 			continue;
@@ -93,6 +94,7 @@ void __init riscv_fill_hwcap(void)
 			continue;
 		}
 
+		temp = isa;
 #if IS_ENABLED(CONFIG_32BIT)
 		if (!strncmp(isa, "rv32", 4))
 			isa += 4;
@@ -100,6 +102,9 @@ void __init riscv_fill_hwcap(void)
 		if (!strncmp(isa, "rv64", 4))
 			isa += 4;
 #endif
+		/* The riscv,isa DT property must start with rv64 or rv32 */
+		if (temp == isa)
+			continue;
 		bitmap_zero(this_isa, RISCV_ISA_EXT_MAX);
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
