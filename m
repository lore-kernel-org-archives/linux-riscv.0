Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEA7CA1000
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 04:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9TeU4J77b33a7KwApnY3Svc+m7RmMjtrHTcfUh/Yyl4=; b=ICI2nkfiBX3v/Q
	28mWAQWTzEkMU2Ejeh8i8RMnyzuCiwu2svLWWkv0JLdVRW5Hx20gYPZMS8Hm2q+arp8tpJ2oAouLQ
	ezeDToLjE4Fc8ioTk+hCqvW2cAkrIHPxXJ5JBa2kC37BLYKa3Xp/Mq2OqYO4PDHn7ndTe1OpJ0q5w
	nq6wKc4V3+1G4i5G02866bZY5LhbSA/DfJgrhdvxBx9SxpQapLVA/OeIDPbBMpWvIMFF1CBDRrtl5
	Jv3iukdYHuYrygGm7EJt2CLtCt1RiOfsuqLIK3oHKIxI25HK3nAlEzXgD74dej45I8R4U7ppTJvuB
	FMSWprXa4I9l+zCJ9pxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usw5q-0000000B8G4-19Am;
	Mon, 01 Sep 2025 04:24:34 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usw5F-0000000B889-3qax
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 04:23:59 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 97FD422DE4;
	Mon,  1 Sep 2025 06:23:53 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ICk8xOlxs98S; Mon,  1 Sep 2025 06:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1756700633; bh=h8irg1+qrtdt4GYLBVX3WcdvSdq4JPFr1Ov37zh6/xc=;
	h=From:To:Cc:Subject:Date;
	b=X6QJh1Bq87FrQRGhg7J+UyVbvgZx/QZhNsxUij15wfNNSgePu1xWE3erysbJlEjD0
	 i2GQz5wo+SxoI6j97TvUdkkJlWBaW4PfM0La6neo/8HULNwCu5YnSLKQTmJPnWKXLL
	 CKcpr4t8ujj/NO5+cvGBVZQRfoprpGD1yxMg+uiEL3DwoJjpM7u+FI1pNTXMjxC4Ur
	 BSC2kJkWAHHLd/xVAB5JbVhwvpt+727G05RsJQzN8yNYPBmB0B8dt7WKWDXYQY7gOb
	 r+RMLboP5jq9Ev2E29amedxa2Co5utItJApl3KMa9OmtQuqhp2P7c9dy3vvP7T68ef
	 LIfCdcENaZb6A==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH 0/4] Add reset controllers for other TH1520 subsystems
Date: Mon,  1 Sep 2025 04:23:16 +0000
Message-ID: <20250901042320.22865-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_212358_353460_2B67919B 
X-CRM114-Status: UNSURE (   7.75  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

TH1520 SoC is split into several subsystems, and each of them comes with
distinct reset controllers. We've already had the one for VO subsystem
documented as "thead,th1520-reset" and supported, and this series adds
support for others, including AO, VI, MISC, AP, DSP and VO.

Note the reset controller for AO subsystem is marked as "reserved" in
devicetree since AON firmware may make use of it and access in Linux
side may cause races.

This series is based on next-20250829, thanks for your time and review.

Yao Zi (4):
  dt-bindings: reset: thead,th1520-reset: Add controllers for more
    subsys
  reset: th1520: Prepare for supporting multiple controllers
  reset: th1520: Support reset controllers in more subsystems
  riscv: dts: thead: Add reset controllers of more subsystems for TH1520

 .../bindings/reset/thead,th1520-reset.yaml    |   8 +-
 arch/riscv/boot/dts/thead/th1520.dtsi         |  37 +
 drivers/reset/reset-th1520.c                  | 835 +++++++++++++++++-
 .../dt-bindings/reset/thead,th1520-reset.h    | 219 ++++-
 4 files changed, 1083 insertions(+), 16 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
