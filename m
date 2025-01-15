Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A00C02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 06:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RXW9yoFgwhduOccsLmoBUkjmcy9oRz6wzaJQMY9lq0w=; b=Gx+WK1rvUqeXcm
	a3ILqMoe3gDeaHTZdu84beFbFBZhMF58xg4twGUIfc2/crcKvpLb3Jts29X66JhW05MEcnTQkXnUS
	apkq4X3iikaqzTod+FFyzySXhWneyCE/VnzvNhROaMgmQahWyVYzRuJR9EdYvWzouP0w1Y+AQK8ls
	xzkXDm4dhlNTfpBoco593BrTF19GmrWcLqnA5Jfgg5Eu8lRhI16T4yl3gonk3ToHK9cW5Yo8Fj5E6
	cR8QSZPUAy9zD3Yn+UmK1rc3uK5B+WBbNNoRJ7u0GD2Ez5Bk8cTfL+qytcHfUsPcNMxIL9j2Kb0A9
	9I6Z2EE5Es+dFaV6MlbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwwd-0000000Anmm-07oM;
	Wed, 15 Jan 2025 06:32:03 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXwwa-0000000AnlP-3lqx
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 06:32:02 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-2aa17010cbcso2717548fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 22:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736922719; x=1737527519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pR3mxRiBEftr5sApBSerpd4B3EpU6PJfrpUR5WHbeUo=;
        b=KgHKRt40ine7IlK40RyzCSYc1l5byoVL2iYal8hhVqZArOfBO+JIlzpPkBzVPnNSsj
         Y3vF2ICoG9wnLP/WLVm/CmEt95OZBkND2ounLIIOgEareN1uXA4h0g1/gfVfTimSK0QS
         HuJSS82pAg8GVgxV8UXZvqULD6B9V5w4r8movcIQbczUmd5Jk0zn+cB/LIdnxJYw1XVG
         KM1zx/F4cwyEIezJ4fGdpaC9hPmLf7guD4pBOBS3rKgop0su3Pwm+PCsdzdB1No9dppy
         LA76zwCoBUxi0WGDuJVbt9vkiH1blL8/KxFfO4N3lueIKMpkIcazS9swYfg4j3j+KQzm
         5E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736922719; x=1737527519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pR3mxRiBEftr5sApBSerpd4B3EpU6PJfrpUR5WHbeUo=;
        b=IVzTilxtVGiD/9xaJDR57qXYntaH/r5wGuDeFLak9jOfFQ56d+cmbxHRGv/LannsMd
         sPhXtAaCy/0fOCl3BqH4XsRHF8XEUvQHsVcaHSzyIFgQQgUfl5E9uNwUcWWbMKF6xgKn
         Vkqw5islTwUnOKDe3ZmF0ZSWschN3evHXvIZIUT60b9enfXH2eViRgHCtJcqxHpbws3G
         fuXzedhlTCOOzqfRyEP1XOrVzzwBxt6/duy24Nbe8mPX69KdRcEyf6odUGZU9QmdHkKh
         qAe9DDksVOTzB+LSG9ZR3amNvl1HGOj0lzosnaO1v1XgJl/qDQ/a4rFLoA6uwbQ14ZhU
         og0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwFCa5p/3ZjCC9ot/9Y88t5XbhXE/orYElBtlafNwpjqkcAQFAq107fr1OMtiob7I7uQ3t5AqT/bKpjA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+HgMlBrCicDS3JhjsuQyuLgn+kR9wbK5OHvai83as+R9+fAnt
	tr/UeVHUhCVMiIpBU8GFyh4px7oA+9+AgWYAc5xbpXDEJCpsdKhy
X-Gm-Gg: ASbGnct29MmoxyqaaSR8WYg6tMh03U/S+LmjSgUbDH0aJ1fe+rg1xLi/la3QnAanCqV
	dVOBX+aDynLLBGMBWnkiRZcx8I1XPMEE4CoT23ddd/S82KZQWrtCipwjmUhCfLQnH4e4+FnfWXH
	QTlpxPps6g6tMargT4PqEz08fPTt1ok7ygdRininbUZT4BReVs+N96l4CBx4PNtV+d/puHNjaz3
	ffrKdJ7jVAfNzL34qtkfHsU+HB8+0LxJlRkxwElWa3fIsOIQ3Zj9EMZbt5aOluR42I=
X-Google-Smtp-Source: AGHT+IHbyh2YSJe1KqvTDUPlBBVKxZ+FlD8cF6ArDNlz7FedkwkHzEwA/Z8QqBJRsLDDzcPlWMuRbA==
X-Received: by 2002:a05:6870:ae94:b0:296:a7c7:6a08 with SMTP id 586e51a60fabf-2aa066c74fcmr14481589fac.15.1736922719130;
        Tue, 14 Jan 2025 22:31:59 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad804af737sm5975440fac.8.2025.01.14.22.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 22:31:57 -0800 (PST)
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
	fengchun.li@sophgo.com,
	samuel.holland@sifive.com,
	christophe.jaillet@wanadoo.fr
Subject: [PATCH v3 0/3] irqchip: Add Sophgo SG2042 MSI controller
Date: Wed, 15 Jan 2025 14:31:48 +0800
Message-Id: <cover.1736921549.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_223200_938636_0A482540 
X-CRM114-Status: GOOD (  10.61  )
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

This controller is on the Sophgo SG2042 SoC to transform interrupts from
PCIe MSI to PLIC interrupts.

Thanks,
Chen

---

Changes in v3:
  The patch series is based on v6.13-rc7.

  Fixed following issues as per comments from Krzysztof Kozlowski, Samuel Holland,
  Christophe JAILLET, Inochi Amaoto, thanks.

  - bindings: use reg for doorbell, fixed wrong usage of additionalProperties
    and misc. 
  - Improve driver code:
    - Fixed potentional memory leak issues.
    - Fixed some build warnings reported by test robot.
    - Optimize and simplify the code when allocating hwirq.
    - Use DECLARE_BITMAP instead of kzalloc.
    - Some other coding style improvements.

Changes in v2:
  The patch series is based on v6.13-rc2. You can simply review or test the
  patches at the link [2].

  Fixed following issues as per comments from Rob Herring, Thomas Gleixner, thanks.

  - Improve driver binding description, use msi-ranges instread.
  - Improve driver code:
    - Improve coding style.
    - Fixed bug that possible memory leak of bitmap when sg2042_msi_init_domains returns error.
    - Use guard(mutex).
    - Use the MSI parent model.

Changes in v1:
  The patch series is based on v6.12-rc7. You can simply review or test the
  patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1731296803.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/cover.1733726057.git.unicorn_wang@outlook.com/ [2]
---

Chen Wang (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
  irqchip: Add the Sophgo SG2042 MSI interrupt controller
  riscv: sophgo: dts: add msi controller for SG2042

 .../sophgo,sg2042-msi.yaml                    |  58 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  10 +
 drivers/irqchip/Kconfig                       |  12 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-sg2042-msi.c              | 268 ++++++++++++++++++
 5 files changed, 349 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
 create mode 100644 drivers/irqchip/irq-sg2042-msi.c


base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
