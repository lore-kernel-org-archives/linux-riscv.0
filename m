Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00738D12D6D
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 04:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBoRi9de+UX7ljatwlnRAQ/7dwO7qzmi0+9uxGEZz+8=; b=hgXmKFXGaJ4Hgk
	9PpD7ALM5ZJnKuI4PoJErtOaZIeCFrCQCLAWW14a+Q2vdCLIEO2xV/S6d+wQzD3q940DxAie/1xhB
	8X77mNFkLHMElmRMiyCV0Je7vfdl8RqJUBWXNYuLr7GCOv0DejIiLGT9FueN++eIfRKoAcUAKoock
	y+NGDVMTbFEcCx01VDSkuppT/6H8XTlM3sX7LTfbLMCSiN/T+Ibi4NGkVRZ/3K9ky4rpqyf6zBxUs
	APwKxDxtBj0K2gd5jeQBZuxMpLT5jp2eN+oi7jsutBwjBTUSIfV3j/5vj+6I+jpY/s7tNqOygwasR
	yw8xC/H42gvLcBoJMzkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALdC-0000000GGuD-2R5G;
	Mon, 11 Nov 2024 04:02:26 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALd8-0000000GGrw-3nWs
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 04:02:24 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7180d9d0dcbso1806299a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 20:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731297741; x=1731902541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjbTWmVjfUhEoQ8d2IpKkdBlmgYXhZxjwlzph6pX4qM=;
        b=e7+Y560kQIMQC4g616A647RybkOCT4Jj4E1fL/JobWYs0+qZ+MWq+3JsZWfnYg3/BL
         NY1INVz/kVBdttG2WpG319qUtRaT9ajJ/1D93TqTbLwQOFe1vAuav3huiWDcVTGb0NZg
         Jb86wk4rrfgYpkAENSlAPH0VunaqWxdOT+Lb7y4oPucD2uj/fQ+/4vvsBJUM5tAvpMAt
         L+r6JiRfjc4zwW9iH8n7nqYQ8KT/37VGetj4g25XauzGVjkBdqQyJ+7d8rISkniveDFn
         8Vg11ovnHUGKC63ASaEn7s0knbI0CqeKDBnV8flbSHQ/yuGAfwojD5zzBHeyxrZHGuG3
         3mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731297741; x=1731902541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjbTWmVjfUhEoQ8d2IpKkdBlmgYXhZxjwlzph6pX4qM=;
        b=lzgDxd31jCG11JYdogBCWhDJOmmJJZD9Lz5rHNB66igYJF7j2FiSaXPjDA+zbRgmNS
         JeG3joqnkgJE5TRBZYihL5kPVpfRRlly+JkZiw73TKzYeXpr0O0LPXmQNolTTPy/dkar
         OPZ7Ima32knJFuSKqZNEFfzZhayLJXrG+Bta4R1G2grQj/9ajxoTmcNGWxrxr81qewki
         vXdgk2oCPPapwuCLbr6pv4NzizT/uNlJySzJZy3YxXZ7aDaurLJJNuNsDAfXkUTZiGfk
         E/rsHnfOaVUfv/rLYMPeqOepkWZWkxd61wHFwM5Dv+BH0M4hgNE/TM0sGy7v6TPmfEgI
         KJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT0+OJ/pbcRW2O43cQw+7M3ZYgm0VV+Iqy7L77l14Rh4FL0Cl48Lfub5X/ZX/5MAtbsbxWHWNVmoFx4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyloDLjYRywd2+XY8EZXPqLImhFuJtNQPliKZShs/XEmJjEtmGY
	7EVb4qnSg3VS/ko+f3b4xmYg5+JXslaCXKCLS6OWDR1gRFkcuxQm
X-Google-Smtp-Source: AGHT+IHRYsyTEdBELcqPuXy/sNavXTBAGqMPTcuBIGgQENdK8cQW/SG/AKtr2fmcdqlADupSFPq7ng==
X-Received: by 2002:a05:6830:3c10:b0:718:1cb6:e593 with SMTP id 46e09a7af769-71a1c2b1247mr10068611a34.27.1731297741396;
        Sun, 10 Nov 2024 20:02:21 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a10834aabsm2083654a34.32.2024.11.10.20.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 20:02:20 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 3/3] riscv: sophgo: dts: add msi controller for SG2042
Date: Mon, 11 Nov 2024 12:02:12 +0800
Message-Id: <90bce35ca34b3c9f86f1af89d70ab34b2e497e0e.1731296803.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731296803.git.unicorn_wang@outlook.com>
References: <cover.1731296803.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_200222_969696_D0E756FB 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add msi-controller node to dts for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..35651cbac764 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -173,6 +173,19 @@ pllclk: clock-controller@70300100c0 {
 			#clock-cells = <1>;
 		};
 
+		msi: msi-controller@7030010304 {
+			compatible = "sophgo,sg2042-msi";
+			reg = <0x70 0x30010304 0x0 0x4>;
+			reg-names = "clr";
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			msi-controller;
+			sophgo,msi-doorbell-addr = <0x00000070 0x30010300>;
+			sophgo,msi-base-vec = <64>;
+			sophgo,msi-num-vecs = <32>;
+			interrupt-parent = <&intc>;
+		};
+
 		rpgate: clock-controller@7030010368 {
 			compatible = "sophgo,sg2042-rpgate";
 			reg = <0x70 0x30010368 0x0 0x98>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
