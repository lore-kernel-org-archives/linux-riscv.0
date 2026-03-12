Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BD7103E2FC
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 01:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ntku8UHH/5wBBZkuBYm9Ce57eDyMX1YZpmu8pP2L+uM=; b=Uzs0EPXIGLMgkK
	ajcUpTpCuQA2TTtS7gMuJ29aKxKEt1HkW9dp678hPiWO8LrbRi8j/GGRdG92A5EXv1VTyjwXqmZRc
	YTcYEU/J4NLqcNzP0UmfRitjPUva81j/vGkZoSSd/f5p8X1PM/xUpp76t9GSxyTfG4pkykjC4pMoE
	e6gnVKg+Dc8uXSsq8FLlCJhqM8XmEsQYtx30syc2zmi7IZk1qzz+RPYYM1qpr066iv09tMJlg/xOD
	nc02jzEyK2Fwbg7Q/jbv0WbTr+o45I29qByGh+yYy7GDuFeeCRCaM30eY2oAeuDe9eXkEEmrq7igi
	DOVGQVKkd0q9abTNWQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ull-0000000Cznc-1vnd;
	Thu, 12 Mar 2026 01:23:21 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Uli-0000000Czmt-3D81
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 01:23:20 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8cd751a4e93so21172185a.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 18:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278597; x=1773883397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VyB5pKnWn9O1wtjxVZxKBeu/DBXMCZY1EfBDXvBRKnY=;
        b=ekSEuVMWAOmqAEVrkRqyZmjJ4cTMNBoqr4Om6hEg6kZgG/43Q4TYw6n1kxyu2msYik
         uzpNnKF4TY6N0XIe6KlxC3W7slomTUOycJ9brevLQEUhiR1O2MLh7s0DsQWaFtqWeGcO
         gnCTNmH23hKOY/gLKRdbAhhSOAhP6x2IxDepUHi37hmp4hbx0wJXyL1rjodCL9sdZVJn
         22T9FUnqOFMH+jR1vBkFl5PYc2zAqWVyK3yuRvvQSyjhYHRNMvbA5e+UHPF79SIYzJad
         iY8SPk84kRWhwk4IR1CyfXd+JEYxeAlkJlNjlHhjq2RSjNrZ7g7h7D8A5d8oQjbmywZl
         svxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278597; x=1773883397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyB5pKnWn9O1wtjxVZxKBeu/DBXMCZY1EfBDXvBRKnY=;
        b=Ld3DHK3pCAOc444ZsDp4ed0pGslOoc5bQFp7IXJN6v/q3YrDwiCehvmDQLVM1RmhcT
         31RoeMfvzCIxlB4Y0RsFVLl1bMveIp2/vhX20cmsvyAM0hpS5Hn+psiHHbl3LJHXxTRy
         i+T76SsisXnXrNu8pBQ5DAi8In7WVp7cTCGOv7fHN3nAqwsHT3Kh97piAYqoVJJn5uHo
         fmwjRgUSzXHM+zQwVbkWDc1Jli9boo9fsnPdQCOMZH9Bj00BMy+Nd9pIdVwIwYgEjHjr
         ae+Tson9KtTXNTVPSkpKaZWhetONPPqGp4a/hOzzZPGndrxQf2fs9w7KUXemm3NjBUdK
         6b2A==
X-Forwarded-Encrypted: i=1; AJvYcCVAu4+wVuJ72XBFUgu3ZQvdjCKLno/55bfaDTy9NkraQGhmCLfJOqU3ndM1a8omyGgRFjFlEIHsljsKdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/qAeQVQOgOi4bK0MMShP/BD5CSuWsDCmoNY+SUi77Hh/GxF9I
	G0SOrkC9zGjNZVoN1ordFJZ81NbQsSzGTw8PtVrFJyS71H3hHPeqC6nz
X-Gm-Gg: ATEYQzxmlynwtzrfogFNkuTEuE5C7gVYcgJGQMlqn9W9Y3COnJVnrT2BSPUPVPyDUDJ
	v3uV3QVwHM20XqFbxcOyctEpf6uxMz+lRy+x1Zx2ZesSeEblPMje+3Xpb5hsVRF+dsi+JV4ZoSq
	MwKyv4B0h4JAu6V/C6sYDAYb1C+8CkHzCaDvjmkIal2G7H5wxm4dfgVDq4HWcAzj32/75olNP1N
	mlRGhb8sCNitFX05d5dKCCPHYX62fESeYNc6shNZMJkHW+7fkjsxLB2lr7wo7zNagni7GOP9Lar
	ChyVPrBgy26CxIujQjC+saHLNN909DnaSb8zNx2fnhdBTVCduGNB8KjZmc2FiEURP0qGCp51wov
	brAdFhLoHyz8JLzBfswvjH7AULLaHZyaVSjj9b/c7B0CHU7c7btu8dmD0Z1mPTTQW3jDBN4RwCv
	RYTzLxUv/GjLj4hGRYkEbs6Ew=
X-Received: by 2002:a05:620a:2a08:b0:8cd:95b4:c521 with SMTP id af79cd13be357-8cda1a311e0mr596901285a.45.1773278596866;
        Wed, 11 Mar 2026 18:23:16 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1ff7642sm266671585a.21.2026.03.11.18.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:16 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 0/4] riscv: spacemit: Add ethernet support for K3
Date: Thu, 12 Mar 2026 09:22:22 +0800
Message-ID: <20260312012232.373713-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182318_818840_ED4E0F90 
X-CRM114-Status: GOOD (  14.22  )
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

Change from v8:
- https://lore.kernel.org/netdev/20260309004305.315018-1-inochiama@gmail.com
patch 2:
1. Apply Russell's tag.
patch 3:
1. reverse the order of the local variable to make it "reverse christmas
   tree" for function spacemit_dwmac_update_irq_config() and function
   spacemit_set_phy_intf_sel()
2. Apply Russell's tag
patch 4:
1. Add MAINTAINERS entry

Change from v7:
- https://lore.kernel.org/netdev/20260304080721.1658224-1-inochiama@gmail.com
patch 3:
1. Remove unused parameter in spacemit_dwmac_fix_delay().

Change from v6:
- https://lore.kernel.org/netdev/20260303010630.567674-1-inochiama@gmail.com
patch 1:
1. Drop the extra blank line at the last

Change from v5:
- https://lore.kernel.org/netdev/20260227075718.2243818-1-inochiama@gmail.com
patch 3:
1. fix error from checkpatch

Change from v4:
- https://lore.kernel.org/netdev/20260130022705.1059214-1-inochiama@gmail.com
patch 1:
1 Apply Rob's tag.
2 Adjust clock description according to Russell's suggestion.
patch 3:
1. Add set_phy_intf_sel() and get_interfaces() hook, suggested by Russell.

Change from v3:
- https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
patch 1:
1. fix the uncorrect compatible string postion
patch 3:
1. add "CTRL_" prefix to all ctrl register definition
2. only use delay config 0 to calculate delay code.
3. fix typo in the comment

Change from v2:
- https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
patch 1:
1. remove not needed compatible for select
2. drop empty line in "spacemit,apmu" properties
3. add spacemit,apmu properties to required.
patch 3:
1. remove misused phy_fix_phy_mode_for_mac_delays.
2. use local tx clock instead of the clk_tx_i in the dwmac.

Change from v1:
- https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
patch 1:
1. remove phy clock
patch 3:
1. improve comment and include something special about Spacmit K3 dwmac
2. reorder the included file
3. fix wrong delay macro used in spacemit_dwmac_set_delay.
4. add check for maximum supported delay.
5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
6. use assign for the ctrl register initial value.
7. fix input when calling of_property_read_u32().

Inochi Amaoto (4):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC
  MAINTAINERS: add entry for SpacemiT DWMAC glue layer

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++
 MAINTAINERS                                   |   6 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 7 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
