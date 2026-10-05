Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE5BCA5FF0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 09:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XxsNCLDElNszcK5cN26hTiAJT7Pq+Reijr2IJYuVRBg=; b=SnQZArrsfiyo1z
	WfJVwEyAIlpGLDoUmxzj1mqXT/V1iLNDMqe1BRLun5fn7WvvivxjO7Q4eaes2/eU3uPTQlFu8w/PQ
	kV1+rWHG2l3tf/TY0/xcQXywxu3pIsSeSAVb5uNrOWg8gVUBv0azGU4D3wX9q0qipKYeZV3jEnfM6
	ILVVTswxCZNuSqCYTyjHUX0axLHMvyVRTrrsCIPDV0/JmqAi/fnZgEQ6uY2TvufwcMTIaVU3spS0o
	wc4B5RUX1k//mKapAatPFqKU6U+LlMpa+2La3+gk42rw5lgPccuSw4aiXQjq7m6SsNPSCLQ/5y2sw
	idz2K8fW5U1x/l7OtHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf94-0000000G1Jw-1vQ0;
	Mon, 05 Oct 2026 09:38:06 +0000
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDf92-0000000G1JL-0ZoN
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 09:38:05 +0000
Received: by mail-pj2-x2a.google.com with SMTP id 98e67ed59e1d1-3a4bbc51755so102262a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791193083; x=1791797883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pizd1CDxJLDh2tlooS3lUpX6Wou0K6RZNg4IvzQLo10=;
        b=czFOPKx0qL+9Di2lzOtpXoPSrpV+vUQ/lZT6UHKyJRGC26GlwokgSYYxITIp4rivwk
         4qheDcVECSYhtEYNnoxlh9r1HXHIPVVY7WP1nPjKe+NS82pgcG8Lm5k2zkHHvTFKjteY
         SIAucNIbpc76wXQv1BWW6v4OAcuUDX67KuysmmnJBVHZ4X1XD5RJhuSE7cZno+s2zRIt
         qtON5aQd85so7pdGyEnj7d2iIBcE0j5+L9eZTtYXKKQjri3e8IcUBTKfWmgTi5Sao7tu
         ZTW4hhPE4tA1k0+BXJ8BCKkRj+/gMh/SuQCiDNrH0BUfi08rE2d4bEiY8DiTA1sbb0yV
         E1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791193083; x=1791797883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pizd1CDxJLDh2tlooS3lUpX6Wou0K6RZNg4IvzQLo10=;
        b=ijOAi8yh9l/XG5Ld1xQNf3KrNslbFdAGQUIa7iL3zh/+vXZqkV9FT1RTrhBA4F+UQd
         PMdpA1dexmmaSgGUXebPteFZLsXdAJ3H11+wDNKCVWvsH+qBa7gl6CnOGbwX7j4s6qh8
         k8iNjUEudQYlETMjkW6fNiViideZnsXyKfjU3klOErSn1CW4VrcdEB7GExKuoOf4d1Ub
         mA/DGBb19qnERuSLyMHndCfZF81N2yV59iECrOL94nEeDmV73ut3zHCnQhwjJbtY7dV0
         bxuwDDRACW+JSf3f3PBdotk6dQaQU3DpL0ObtTHYRM6dEYQL8Z4Jo5kNz7CvRUh+Kh8i
         UYqw==
X-Forwarded-Encrypted: i=1; AKwUvByrAYU2Sc67PrVibxSSm03Zy6nGftQosJ5Ed3IHWp0r2iODqpJr+wg+4N8W3YVLHDgN6iBPsOYeG7FyoA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLWIs9UJdkoYKkPCjiGcSNt/WnWlBOrf2N2foC8GrPagA8ejSJE
	pG4ajo3H9m/RNWLDyAIMlM7zKp8UghXD5jlsRKKt2A0Jw55H5OIo+bixHd75/qdb
X-Gm-Gg: AYBFou3QoxBYY3fPlGBbbtM6i2k7BFGogiLDOmOb4JDZO/kFCRTXc0IGb07csfE6Aku
	Bwh/oy1E43Q2gKJwz5dCVvOgR0+LrAiHNueqm8rwWQ/mE1qC/AGO9PeN+P35n8gryZwA197ECKS
	s9LruDCNvTFVB/aU/YtUzCejCEvoJEv+iZMT1cUacpHtCB1FxpkGi2v3fvFVZEWbdVGDnPYaMuS
	EkpkBy49nmx+KlGgruryPwzJXmiv4O94wrAQixQpsJXinZIIKYWqKh6P0C5RpaIopAynIAVxoJq
	Gxr3jbBgJY3+zlAqID/z0U57IPYwvNL0RSSCSq6lB6ZCNDbfrpyF9NsD1RdVrxWD1FAgV3X5GsV
	R6gK/6P8ErB9mcdLm+8hmv33KLnj2ainPWi1jccCjYb5WWZGeqgSFWARq0PKVb91Vy8nUhnxICz
	PSqxUnMHZL092t3iFMGbDmpYRKyg2J2WBRFLa8ULckDVlS+orACMAyrlV895GKMOGP24agxx7Q4
	RgOSJdFsM+tYEFfK69uf/wzlDr4o4kDZabf3Gd8fK0rQdVQ5/i+RBOyYQ==
X-Received: by 2002:a17:90b:4f87:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3a81759270amr2038440a91.2.1791193082911;
        Mon, 05 Oct 2026 02:38:02 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e42026fsm10568067a91.3.2026.10.05.02.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:38:01 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Hiago De Franco <hfranco@baylibre.com>,
	Longbin Li <looong.bin@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Joshua Milas <josh.milas@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet support
Date: Mon,  5 Oct 2026 17:37:47 +0800
Message-ID: <20261005093749.645014-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_023804_183978_153A8592 
X-CRM114-Status: GOOD (  14.21  )
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

The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
internal PHY is only usable through the optional USB & Ethernet IO
board. This series adds an overlay for that board and fixes the name of
the internal PHY node it exposes.

Changes in v3:
 - Rename the PHY node to ethernet-phy@1, as the commit message already
   said; v2 only changed the unit address (sashiko-bot). dtbs_check now
   validates the node against ethernet-phy.yaml, with no new warnings.
 - Drop the blank line in the trailer block of 2/2 (Hiago)
 - Collect Hiago's Reviewed-by
 - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
   name

Changes in v2:
 - Enable Ethernet through an overlay instead of in the board
   devicetree, since without the IO board the pins may be used as GPIO
   (Inochi)
 - Send both patches in one thread (Inochi)
 - Test link-up and traffic on the IO board, which v1 could not
 - Collect Inochi's Reviewed-by on the PHY node name fix

The overlay has the same shape as Hiago's for the Milk-V Duo [1], so the
two boards stay consistent. The PHY node name fix is in cv180x.dtsi and
so covers that board as well.

Testing, with a kernel built from this branch:

 - sg2002-milkv-duo256m-eth.dtb: eth0 comes up at 100Mbps/Full, gets an
   address via DHCP and passes traffic
 - sg2002-milkv-duo256m.dtb: no eth0 is created, and the gmac node
   reads back as disabled
   
Kernel log with sg2002-milkv-duo256m-eth.dtb:

  [    1.426499] stmmaceth 4070000.ethernet: User ID: 0x10, Synopsys ID: 0x37
  [    1.426536] stmmaceth 4070000.ethernet: 	DWMAC1000
  [    6.052829] stmmaceth 4070000.ethernet eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY] (irq=POLL)
  [    8.138131] stmmaceth 4070000.ethernet eth0: Link is Up - 100Mbps/Full - flow control rx/tx

  # ip addr show eth0
  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP qlen 1000
      inet 192.168.0.47/24 brd 192.168.0.255 scope global dynamic noprefixroute eth0

With the base sg2002-milkv-duo256m.dtb:

  # ip addr show eth0
  ip: can't find device 'eth0'
  # cat /proc/device-tree/soc/ethernet@4070000/status
  disabled

iperf3 against a desktop on the same switch gives 94 Mbit/s with the
board sending and 70-74 Mbit/s with it receiving, with no
retransmissions either way. The receive side being slower is not a CPU
limit on the board; I have not looked into it further yet.

v1: https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
    https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/

v2: https://lore.kernel.org/sophgo/20261003084627.353899-1-chenyou910331@gmail.com/

[1] https://lore.kernel.org/sophgo/20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com/


Chen-Yu Yeh (2):
  riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
  riscv: dts: sophgo: cv180x: Fix internal ephy node name

 arch/riscv/boot/dts/sophgo/Makefile             |  3 +++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi          |  2 +-
 .../dts/sophgo/sg2002-milkv-duo256m-eth.dtso    | 17 +++++++++++++++++
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m-eth.dtso

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
