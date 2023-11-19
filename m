Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE68C5AE5B
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Nov 2023 13:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i6gTQWs9ORkOzO5GokOgXEpzCUVSXAF6dGNZw42B6W8=; b=fILqY8Xsj0Zbr/
	i7lvMm7wnJlUbGWaCi+1djQDo72A5zTeuO0m2nuZiC2LPQb1CU+4q/ahKBKkcBVC26dJb3mvFK2dx
	AeSO9rRxda1Sta3CX4GcgfntiKoYtpy3qmwZxOB9gaY56VyCSKgLrpoHX5I6SE1wqzAxvXmneEs2K
	Da74U4rfuqHob+ccXN0rBsXY2jnLtEVZE5NaaBquy20FheuDTrfGItTl0X2cT0rB+IRjYZzPZVeqL
	3yotpd9R+sFXwNex6u18Ed3txwGQQMqiuE30oMDGBjcM5is7LanvI6VNX2/rls0uER7uf7nyExCt1
	XJi2EfkQF8Yf7C4NSIww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4hoR-00ADgz-0j;
	Sun, 19 Nov 2023 13:26:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4hoO-00ADdv-1H
	for linux-riscv@lists.infradead.org;
	Sun, 19 Nov 2023 13:26:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CBA78B80BA2;
	Sun, 19 Nov 2023 13:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5B6C433C7;
	Sun, 19 Nov 2023 13:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700400355;
	bh=MuFb6Jk9Fj76Lk+Y+AfZIu/0pw2dOjOHcPcPCdb0bN0=;
	h=From:To:Cc:Subject:Date:From;
	b=GOx03R5nPTBsQnissHt8HthhnhQrIwZoWcMEeXlxxS2qVhJ0T92DKCneDDOWYF7SB
	 b0AbiMh+Wgvv0gQpynwxysouNqvSPBa9b6R7TZ/UTNnnxWC9Je7K7i9C9L29jQUsbC
	 5yYbGYggAmUXZtIf6SLdAL9J2hAgwJddAaMsSzccRfztFCIG1+dKoSB+vJPsYJwCZv
	 RgWZ9HmsvJv836LDg6p0o6oXZlA9vEDZOSyas29qY4PFjOeU7KAoj0vJOXMuRINu6E
	 dma626QmB3gHpnc3w5pgxF6bUKdRDTePXrXU9Hqfktdxat0cMJnvR96iJiDE5LNwAZ
	 /YfulcGiB8N+A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 0/2] nvmem: Add Sophgo eFuse driver
Date: Sun, 19 Nov 2023 21:13:30 +0800
Message-Id: <20231119131332.999-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_052608_583943_928731B1 
X-CRM114-Status: UNSURE (   8.90  )
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

Sophgo SoCs such as CV1800B contain eFuses used to store
factory-programmed data such as calibration values for the built-in
ethernet PHY.

As for CV1800B, HW automatically loads the eFuse content into CONTENT
base registers which are organized as 32bit values exposed as MMIO.

Currently, add read support for the eFuse. This is a preparation step
for supporting the built-in ethernet phy.

Since the clk support isn't mainlined, so cv1800b DT patches are not
included.

Jisheng Zhang (2):
  dt-bindings: nvmem: Add sophgo,efuses
  nvmem: Add Sophgo eFuse driver

 .../bindings/nvmem/sophgo,efuse.yaml          | 54 +++++++++++
 drivers/nvmem/Kconfig                         | 13 +++
 drivers/nvmem/Makefile                        |  2 +
 drivers/nvmem/sophgo-efuse.c                  | 97 +++++++++++++++++++
 4 files changed, 166 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
