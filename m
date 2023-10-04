Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD18E7B5E4
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AoX5LQ5Ej1NMq1voVePajSRNulmMrIntCOvbk5yLnG0=; b=1J//Q55v3KP8Y3
	YzhVrX5Xbzl+jPPSFLN8joZ4VhAe8CENRWv4TCEjA3kOPGRjxOzLbao7rpQoBZd+BFptjoDLphr5r
	07S32GBnymJWVDjUAAZ8VJBd7CI0j1wCW3INdgF0mrQq8187MaW10ufQWcByiiKpnYqGrnGGA/zF/
	QyJFlgmPYycFixdtoIGFNgym3dgE1SwoXIcCNP+JDYI8uW1D/89XKp1MvhXa/Gwf8UftRJ2uU6Rjk
	Xiplbr8ZTmbLLmWEjUb/ibNWauEUmCBHxSI44SbzjbftN1h3FqEhc8F4RXYdLAcceF0wpWmNPTY7v
	YZwZzPVzb/51QJICNR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyM1-00H5sF-2w;
	Wed, 04 Oct 2023 09:39:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyLz-00H5q9-24
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 09:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 42B5BCE1AEF;
	Wed,  4 Oct 2023 09:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8B7C433C7;
	Wed,  4 Oct 2023 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696412376;
	bh=Mo9aBSue9VgCsnzG+WTcEHnQB+oqgaq0bf1pV4lpD7s=;
	h=From:To:Cc:Subject:Date:From;
	b=j8Tr0MiZaTgG2SgRnZTV7+1OuMwIoz8poMpoC5wZM+h+1Wp4gQhB4uJc1OrJl+iy5
	 BCr2XqZ4FzC8o71iWEgHlY+LnM2NJ/B65xYXFLwZsaDurmNYivr+ESxvNYTCt15on0
	 22gtaA35KcSe0zY1WSNEAfOGavpt0Kybof/3PViaXe0KKQARS5XTjO1z5mY/WacIb+
	 F8GNHTNlNPExRwrVtO6lMtuzaZJbGKeVcsNCD2lwMUFId/wUEIMzEkM+Zliflf57vk
	 uYdwjXA3ljT6I2G0oxpzTqdY2qODHtv0meyVUVbnKQpVKvTyuY0s90QZe19scZvsuP
	 5AZ15FkVv8lGA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] pwm: add driver for T-THEAD TH1520 SoC
Date: Wed,  4 Oct 2023 17:27:29 +0800
Message-Id: <20231004092731.1362-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_023939_876591_D447F7B5 
X-CRM114-Status: GOOD (  11.70  )
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

T-HEAD SoCs such as the TH1520 contain a PWM controller used to
control the LCD backlight, fan and so on. Add the PWM driver support
for it.

Since the clk part isn't mainlined, so SoC dts(i) changes are not
included in this series. However, it can be tested by using fixed-clock.

since v1:
 - update commit msg and yaml filename to address Conor's comment
 - use devm_clk_get_enabled() and devm_pwmchip_add()
 - implement .get_state()
 - properly handle overflow
 - introduce thead_pwm_from_chip() inline function
 - document Limitations
 - address pm_runtime_get/put pingpong comment

Jisheng Zhang (2):
  dt-bindings: pwm: Add T-HEAD PWM controller
  pwm: add T-HEAD PWM driver

 .../bindings/pwm/thead,th1520-pwm.yaml        |  44 +++
 MAINTAINERS                                   |   1 +
 drivers/pwm/Kconfig                           |  11 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-thead.c                       | 274 ++++++++++++++++++
 5 files changed, 331 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/thead,th1520-pwm.yaml
 create mode 100644 drivers/pwm/pwm-thead.c

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
