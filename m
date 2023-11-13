Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF47C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dNkMPsFoTY9HU+SmwK+I/T1MXRvVfw7dBkTQT085VgE=; b=T5smRasTbJx8LN
	W86dHfWpRwAg6UPaCvps4V02ZikYkm3+CNugWtL6mQ8fX4J59pi+LMM905eEuKYUSJJ+iJap2rHO3
	cjNOhbS3/BwwygLqQO5uIHZawgwFgiN+jgDZlWEWxldZS+soFftwbfCYjXi0WzUwiles4/w1TW+PE
	PLbMT4MrzeXjv6ZFvT3a1JN42D43p1g0shgpUCftFsk3x3UcLVifJDbAhkKrcGLPFSRudMRU3HBqY
	po0w0VePzAhSehfP5SJ2ovRrkqF7BfKg25jbJthEbAqMZBVh5Sbz9vAC41fdLEvE35k8U8F8yhjnT
	t+/3TsNvj3Co+VItG2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQZ-00CxpN-0t;
	Mon, 13 Nov 2023 01:07:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQW-00Cxls-0N
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:07:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BE0CCCE0F9C;
	Mon, 13 Nov 2023 01:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E3EC433C7;
	Mon, 13 Nov 2023 01:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699837653;
	bh=sOrImuVHq65cb4dbzAFQe06ipFaS43Ps0KtMNSiSL3k=;
	h=From:To:Cc:Subject:Date:From;
	b=K/EOtILU4kBTOHK7+AdCwY8JyGDr76XunsubN2vOGquSeXlCGQMjrQFf3+VkM8M4o
	 PiK2sko+N34cPWapww8zBMNkefZtbnf0MHniQyP8eOPt19uwn+c2juEPbgySOSVStC
	 Uh6M/jErqlDoFracJmQMdY6r3ZvVz1vpNG0HPNb61dMC6mkWS4w5WRMvh/alwf/ZwP
	 JuMlUetTxVetL2WcWgtOfIHfH0JjZ0tbYRSgQosojcg0PQeAL6V0AwK3Kfg20bzozx
	 SpS6HBQhKUVuv9XrQMFvonY4j41+AdpS+wXjmBICDpkTHCf6oyBSbKk4eEU0dV78Br
	 5kai7HYXRn3mw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/4] riscv: sophgo: add reset support for cv1800b
Date: Mon, 13 Nov 2023 08:54:59 +0800
Message-Id: <20231113005503.2423-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_170744_321373_822E3720 
X-CRM114-Status: GOOD (  10.03  )
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

This series adds reset controller support for sophgo cv1800b using
reset-simple driver.

Jisheng Zhang (4):
  dt-bindings: reset: Add binding for Sophgo CV1800B reset controller
  reset: Add reset controller support for Sophgo CV1800B SoC
  riscv: dts: sophgo: add reset dt node for cv1800b
  riscv: dts: sophgo: add reset phandle to all uart nodes

 .../bindings/reset/sophgo,cv1800b-reset.yaml  | 38 ++++++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 12 +++
 drivers/reset/Kconfig                         |  3 +-
 drivers/reset/reset-simple.c                  |  2 +
 .../dt-bindings/reset/sophgo,cv1800b-reset.h  | 96 +++++++++++++++++++
 5 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/reset/sophgo,cv1800b-reset.yaml
 create mode 100644 include/dt-bindings/reset/sophgo,cv1800b-reset.h

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
