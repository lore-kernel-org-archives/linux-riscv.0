Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973F7E732FD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 17:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LKj7BSCJX1q2xsbMbrOWjeSftEN8XDU6IhjZTLKrTHs=; b=2POuqWKkSUq6jG
	iE7T9+SEvZKRZKlK+F2y8wbem2TQVC1z3/L+cmXGBaoSxlDnPl2+XsHVxYJ7eYDYILO/yPxempPRp
	Sme0ybr4ip8aUETS/EBStrnK5CpENuEiXI6tL+P0pVAr5Q4ISPKtu0BFsdsXpV43Q0RxtOgXU4D/j
	16k7Uc/+kpeCzHlTYXH9P3phO6prWtZ3TTwHLXENV9Rsim2vU7JxD7JPrwU0Vhi0QIYm6Q6CMyu2l
	mSXVzXg1FOBlsuOoYFvrQ+HhUaToyhooeydsaaXk8ENJhg6fmwXAK7XW4TaPHZgl8DX98krLYrM4A
	Oh2tqVszp5If+ukW9Pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlubS-006PEX-2R;
	Thu, 28 Sep 2023 17:15:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlubN-006PC4-0H
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 17:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C36F3CE1FAC;
	Thu, 28 Sep 2023 17:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8808C433C7;
	Thu, 28 Sep 2023 17:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695921298;
	bh=Tw/MBuqJbVhiahwI6Oee4TQln3rp94ykoKAprce0/ro=;
	h=From:To:Cc:Subject:Date:From;
	b=r5qCzk+rPVHtWc/EEbQL6oIpiG4dGv8t1ICFQP1GjEdl7w+TfNkQd0M73Qus8ngV+
	 NmUYHbyaoI2aX48wzQaW+kCrJezTfySz10bY+QqY7r+mlAyRe5wkwUFy3q7xYM85lX
	 eObkO0OVHsq76nyhuRG1E7fQqJV3TZ3Qd2HtQId0yYqSPHAS/vj+Z30gAu78VFrfu7
	 IQxRurbNS/cr1mP6hX9fksfEziEcRqFlsDnh5o4DHnX8tRd7YlwD9w/LhPHrpDgd+F
	 ciR2097/18ttEoKMuh9wtx543l9wtIlfV1nSCSZYkpremZ+6d+/gj/VYt9JNk7lK+E
	 VJGSEQ62PEQ2w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] pwm: add driver for T-THEAD TH1520 SoC
Date: Fri, 29 Sep 2023 01:02:52 +0800
Message-Id: <20230928170254.413-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_101501_317850_3B267573 
X-CRM114-Status: GOOD (  10.90  )
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

T-HEAD SoCs such as the TH1520 contain a PWM controller used
among other things to control the LCD backlight, fan and so on.
Add the PWM driver support for it.

Since the clk part isn't mainlined, so SoC dts(i) changes are not
included in this series. However, it can be tested by using fixed-clock.

Jisheng Zhang (2):
  dt-bindings: pwm: Add T-HEAD PWM controller
  pwm: add T-HEAD PWM driver

 .../devicetree/bindings/pwm/pwm-thead.yaml    |  44 +++
 MAINTAINERS                                   |   1 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-thead.c                       | 289 ++++++++++++++++++
 5 files changed, 346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-thead.yaml
 create mode 100644 drivers/pwm/pwm-thead.c

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
