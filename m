Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7452CCA0FE1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXDDqY0TPrvdUqtoRBiBZjB8FNQrf34MnSmlG/N9iu8=; b=eOM6BkhaxEk91/
	NtZWunQuz+R4QUxfd5yaO/BSrARmceLDDFJH1WzOH3NjI2FrytrDdMwd/Mv/zeK4TTe0gE8z7qQKX
	Bv009jmrJ50q4O947Kk6MlxWpriPnKrJKef4Uzd326Ll1+ysBLk9X/XjYjYRy8MDrbmKk85/eVzVG
	BumdipLkHIqetSiL8m9iEVT0wm/RdCR817nNUKAY5XNkOfb+ZCkdhs+A6om0IAu7mTRMS/ZwkbCay
	zvKa9xrSg9fds6MivgcgwJuvV6ZZHOxYuzE4cVKqIw3CLRlmw/N5RS7zPhqd6gHPf9sscOqjocOUl
	LiYVknzTD7K/xavx31tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRek-00000007AaZ-3Tkr;
	Mon, 25 Aug 2025 07:30:18 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR83-000000075cg-35wn
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 06:56:32 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-30cceb07f45so2636230fac.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 Aug 2025 23:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104990; x=1756709790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr502dmQ4odPuahV9+jfQPzgPn5kXy7yEDTTv9ShcH0=;
        b=ahuEDRBkQapviYzvlPEKYnKkIS2M8+Ot3krpsWgLZuG9ybcmXUxSmb6zAt8OCZrFLr
         91KUNkmgvvBvp9EiSJBCd8mkQDtoQYVTTkfrB0MsFOY7cKFapyECH0UyfxtXRh1Vouu5
         MxGZSut9XxpH0iGjdiH2LmlG40d3/FwOspq5ccWinrVWwz5NM8xRi+noPNHeD0ohqinS
         dETX5gEUb+cNbaCoRy3qbIh3vQhGIeoRpnqmX+Wry9gdVYe6lo/7rjXNgvoyOcGyuIbb
         UPxHKfHXrSlfII5/2qWCDi4eD/r2+IxSOwmT3NJDYsh9pYnH81ehBQBsjMNdnDRpk16k
         nw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104990; x=1756709790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr502dmQ4odPuahV9+jfQPzgPn5kXy7yEDTTv9ShcH0=;
        b=C32hkdg61VIGgR5TKaMCQptxw2gJ/ejS+ZbtSjaI50NTMLxKk62hrd4g5M/J49rOdM
         wUJIlvUlJNmBDggeJs706htp3vPpH20HfcDLi3zws3rGlTvA7+6DED1Tr77wf72z0pqm
         aX3UNBizX5uIOqDXln0jeMflVm9+LZ6PcukvmtETUEa8Sl/Yx4QnK0BRDnbfWSYZyMMp
         ky7fWScKl91mikbPJnR5LBVhlZqGEWWazHuiX3djf25p74GeJU01d3Dz9d880D7mHC1a
         Fen19xGvJ6iGTo5pwQAF+AjkoG/TOP/D0ptxtsi2JcqtjI2Dpy/ZZ7gBFXb04xg5Ufwy
         5rYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6tegU9kH5DOoGCqzlqLN9UPS/4pI7bYQv1cI1mDnal+Mz/NxcJEo9Ur1vSOkGXR61u8yDqkqaXch0OA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+AUZ3EwsMR+kklwRc3rVywTXxrmsPGAFEBmT4YG3OYcMf/Zey
	eOWBAUoR+dFT2V07R7d7M5i0A3xMjBPsu+CU1Nfxt7Ad0hwKLqhhWvEr
X-Gm-Gg: ASbGncsJL8nJ15VWjuSt6EEgKvdhOpx/XBtsG9d1uALnj+K2F6lwJr/O1s62W1lvUH4
	ITNkxNQYb3EldmPGZ+Csl9mOU03yzzRteiWac+pJkNnbaugLOQOFGbafMLAeRKcdN2HtnQbWIrD
	+flmp9cw9MKfKGsj+KRUxzgRA0pKoxznOQReUt245m5yB4G2GaOc8PTiPyYGtwf103dKbFSnVSp
	nfsbM4nAqMp2Zc/3xvD3V6ov1vZlLLwe5ZpGWOtJkZ+pqg4+BTK3f3pgPaIgxdL/E0ksOB6hGha
	4a411ZQq9ZLtXJDvIhKZGgZAgxRoN+yUrEG7tou1yGxN1mYnYyEUCmXfe7NNiNcnAn8JGBfONPd
	XlPfnFLGv2r9si1O378291iXHZlxXzpfY
X-Google-Smtp-Source: AGHT+IFR7r2iERKhQBivRTMEUEiZRAfQkh3FKggj/0CGOOtJuAdCOPNqJjADbkLjgPMG1RSVyRhGKQ==
X-Received: by 2002:a05:6871:3a1e:b0:30b:6e6e:3477 with SMTP id 586e51a60fabf-314dcd2dc5cmr4797064fac.32.1756104990380;
        Sun, 24 Aug 2025 23:56:30 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7a21bdfsm1630277fac.8.2025.08.24.23.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:56:29 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 3/4] riscv: sophgo: dts: sg2042: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Mon, 25 Aug 2025 14:56:22 +0800
Message-Id: <6cfe6dd32d875fc6811d74d15afe8719d2368308.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756103516.git.unicorn_wang@outlook.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235631_774774_CC779344 
X-CRM114-Status: GOOD (  12.19  )
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

From: Chen Wang <unicorn_wang@outlook.com>

The latest MSI driver will read the DTS configuration to set the IRQ type,
so correct the IRQ type in the DTS to the correct value.

This field in the DTS was not used before.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..6430c6e25c00 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -190,7 +190,7 @@ msi: msi-controller@7030010304 {
 			reg-names = "clr", "doorbell";
 			msi-controller;
 			#msi-cells = <0>;
-			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 32>;
 		};
 
 		rpgate: clock-controller@7030010368 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
