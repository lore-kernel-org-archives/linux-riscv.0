Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B235FD2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F9unVyV+VhUGamd7KhPI5JbijptqlTWwzdjWIOL8ivA=; b=o1P4xRpz5zG1S2
	Isrwy7Kp9XPwKfk7uiEgNfD0MM+0QQSld4QrGLU5oFMZWlDlxkQvLkpnuOjaAO/GJLQW9ZIuCyP7w
	tvayhTZLqmqMuzmPj46RU5NV5nQT1wZVVJ8nazbWr82kzmt3Vz27piT0pn4Z5gAJt3SGMf3RycHpW
	J42LejpdmgqR2IVfUE8cfM4zJ+4K6KZsqRo027y5A3CXZKdWRsIhABubhbeoNu8uv0eLMVnTf8T2U
	lfncR6gp9/hEbLCCiEoDwL9mddCokl6+gWa8yHKcORuYtk7SwiQtwHG43htptArF04wg8zdF6nO/H
	CCOeXFkh0bTklLGzWqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Tq-00000003C1x-1Fru;
	Tue, 20 Jan 2026 04:36:38 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3Ta-00000003BzG-3lPo
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:36:30 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2b6f5a9cecaso948779eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 20:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768883782; x=1769488582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=;
        b=hpsIxQ8o8nCeOQWhvsUFYSo6BoMNoKjbCfMC7bqDP0waqbxMwaA/V8bqH7IZJCMySR
         3cQ+Gl5pWAJbhz87ADJUdLRmImCW/o/Vka/ZIc1oNrUCKRn9bmLIMQX+YNsUJ/4QQ8G/
         wLM6sHRZBwoovpNpStZQrV71wFDzwKYlbXSFeVoxq39vuAFH/maXWMwDWPEUoe+Aev3W
         OySIrsCGCkMspZIJIY96gMRmsjnpbQV5Vqc1Xzvgg8bb0kYa6g5+8f5g8S9g6gBdA03i
         8pxnH7YKXVuLA1ieQtFe8dvcSUG4biaQm0DeYN+fdnIMHba/GdviJ1EA85c0MSCwHDtr
         /5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768883782; x=1769488582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29OkNoazPkO3Cz/ca1GMRTcjG5fAIFuxe8NjRt6vIh0=;
        b=Am1zHblZKN7DFlnFNbKp0JQ1bdAiaa7mdu8ckuWIqssDPQDEsr0+U7a7fnRjqIuOwS
         nHBra8iCcGsQOUhqnMossJfyp32Ho4zL0fGPzVhSKZXVS0kAPzH6KVqbH1Q6es5Nba/G
         gpt6aqSXb/lQg9OV9lGi6qWZf2hlw+fWYgixZlKtAbYRFTORvuJF46+Q1jct3hacEtCy
         vZ5LFq0L2M47qrM33HBm/QdDDCPiNlDzez7nWOyhioymcsx+FhKGEmRR/xhFWwOpPJ4K
         iHXl0g6u18Dv4YK9m5etUmSaEq1S/x3ozabxsR/VwgMefHwjm58IbxSVG2X/gB/A02xI
         kdVg==
X-Forwarded-Encrypted: i=1; AJvYcCUqlSl7afltKs1qXCZmB8UiWbQ6B8U8arChqGdzWb3ksSonwl/9+v1iS+9m38AIX062Ig3kwL0d7ZQ9FQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL/TQYZXexCB6uhfiO5pGxjUxZaIXjqNdg+bn7pgeN8GES3HQE
	bLfg0IPy4FsGtx1aAN5TYh6QaAzCvPUDIQzb20justBqseJEF9mpTtfa
X-Gm-Gg: AZuq6aJcH/N1MqmASHSRNmffn9ToJ8BBsB43xCpIGLFmN5ZrB8xqioWQHbPxrTD+ebo
	r7s2qwf6adyyE5laxexVyLV9h41PHxpNCwHjZLKRUCY/qqJcmIozvyCKy15/Qeja7m/mYDeAdjj
	vN3xV/FsfV5MjoSIB7/k0RWaDO7LZNlizd1XHRAUqm7/vrhlbVF1Kt5QMIyjAsNFTNCP9c0CaaH
	nrpW4Mew2jzxtv5HpH6deBmG5eekX0faTKswLxpW1J/QiUEBNcQOqEuhXEEzlJRMldYZ2QTL0Lb
	eJAhWA5XkeIpmvAUdMAhYANB0c4tftCSUzBcHNoaEzXNHwVZcztM83673WjQMAIvrRdfhuVx6zn
	MilvByDbutYHZongVig+S1OltOTc+VPxUFOl5+OutCcaIfegusp1T+auIsu1MyVWOv1bf32RmFJ
	iaztMyeyyKug==
X-Received: by 2002:a05:7300:a188:b0:2b6:af85:dd29 with SMTP id 5a478bee46e88-2b6fd3a7b8fmr363879eec.0.1768883781926;
        Mon, 19 Jan 2026 20:36:21 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fba43c3dsm1271369eec.0.2026.01.19.20.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:36:21 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next 0/3] riscv: spacemit: Add ethernet support for K3
Date: Tue, 20 Jan 2026 12:36:05 +0800
Message-ID: <20260120043609.910302-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_203625_717736_90272B7A 
X-CRM114-Status: UNSURE (   9.91  )
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

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 107 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 224 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
