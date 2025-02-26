Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C69C021BE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 02:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ut+dBEhjWZsEcPK7aZiUyZCqrhki5Tv+tyjNZEv7pTk=; b=c4fcNRk0Ej3+z0
	HxWRvZ8nRXsPAPzTj5BKsfUzrwiHZ5BM1bJPXTj4kHwB0gJ7Y5EGvAqJpp3fvkVf6bNFEiuS/cAtT
	wwvcZAnJxCpWAP5Pl9HFUOpI2l9OUjLAyZK7u7zKfHVNuVXi8OVvrubXnqFXv0W5w/ugDxxXy8fJZ
	EmXu8zQ2jr/oaOBUDUC2zpgenz5B79AIOL08izE43mclvMcGx7eQqiQzlSGbuo/xpOLJC0LSDQfgB
	bA01SghMwTozZjGybM7qdIltI2nYtjItXa/1nKeQ2RLn+hPAiJr59SpnX5i61UjQcYfn0YM66e3Cz
	VbPMyEST0QoCmW9VnzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6wa-000000028Ju-2Zge;
	Wed, 26 Feb 2025 02:14:40 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn6wX-000000028I3-3CwE
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 02:14:39 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-727388e8f6cso3475103a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 18:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740536076; x=1741140876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ce/2iYbpTG5UcLrAgQquEoIlxzVy1ifFMugXMkqkJRo=;
        b=LPY+xHXn2mB2H42/dTweQnQLmK+Z+xIWHykIovsTYCdIUxvHEw1zcA1pODdeuyuk1z
         mqC5w0QU8ceR/VYdD+e/t800kcVpGHGVxOHVlzMh6HxXM6838ZP76CcUd+ejPumDeO45
         dGfo3DIzNM3WvOwcJ29qhNiwd5By+D3ucMaB25xWCU6Ye2GzL8PMoSW3w77WTle10P0p
         iFz9fHEJsMNRp49TZxNbgNd57VzLVaLEv6iXzr0FHOFP3qVmuG40JwmPhpkYKNtF4gmu
         EYs2x2slWbswy1TxahUR0DWa9gcfzvrkMz4lqZ9yOvhesfIyj+oNS45EiVYhui6zawOl
         aOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740536076; x=1741140876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ce/2iYbpTG5UcLrAgQquEoIlxzVy1ifFMugXMkqkJRo=;
        b=ZONlj3RjV16PhDJF3UZQunhynVNiFG6qyGi8n+DIbbHQLw8YzAlUiridTy3tkRlOyh
         bZt9CLJTUss+dOlmmJMUCg8dZNfYaddXJ8sIFcar8bWQVXj8iDSSeuvdJ8h3BljJk+z8
         XgB6wtqfwfyQwhXt5NOOMCwccsLf5uPbzp105MjblnIynnrycuzQK+O92b3uKsUwkmXz
         bfZfSyJaSZG9kVDzojOZyM3kJtCNoy4GFeM64c3d2Lfo8InvehdXg4lt9I/4rGi2eRqj
         gK/T5PLEnx7As9wgH9GToah026xcqGQoDB1+hgXdQDtrVV5RdIo32/ojIVkXxxgx0U1O
         RajQ==
X-Forwarded-Encrypted: i=1; AJvYcCVm332qEfYv1q1u8mJTSMlqVdkdaxG31DWwXIuxCOJLMqF7AhLru5D2SVqG0ZBkeCxk7AVvlufLeIsfPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6wLmy0JnfvR4notNy30RgbXTYsQt2+FGwU35w2QZiRuqJuLsU
	jTuvCTSd/0i1+x7fXbVNmP73261qDhEZNAqOdX09T0oaz3r/9vCO
X-Gm-Gg: ASbGncuDj8WoR3tfmD45s7ZBwA9qQeSOw/e8eEmwVcKy0g4bfxmsk61RHX8Q9Nz3GVh
	7r06vgSfIGtiU8eF0pEf4j0sXy7llzomEralA/j4clys0LriVj1nR/ugTPSEhVyVlUJ8Z+l6WNz
	vrQuzCATB2xoB9CsFNZz6roSzh7GoxERUoCpqk4ROQhx9rVgKZZY0xb5dXoXWrIfBgdzqE9P6zU
	JcuQlXR/5XRRHIS/1C364AbfPWyoyFDwmVwjU8Fc1HW8ukwICXPh8dnICqj3k85eOHM2BNBcDnp
	/AyeD4LWdqnyhEsQaT8/kq74cktY+PQfG5Fq
X-Google-Smtp-Source: AGHT+IFOiWy5c9aRJlo48U+AxlgoisXf/mCQB2vOucCr0Uu56NK3CF2uZpGGkC+NWk7CxG+H2wQ0hw==
X-Received: by 2002:a05:6830:628a:b0:727:2740:eecf with SMTP id 46e09a7af769-7289d0e367dmr3920392a34.3.1740536075919;
        Tue, 25 Feb 2025 18:14:35 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289dee9c6fsm539210a34.32.2025.02.25.18.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 18:14:35 -0800 (PST)
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
Subject: [PATCH v5 0/3] irqchip: Add Sophgo SG2042 MSI controller
Date: Wed, 26 Feb 2025 10:14:26 +0800
Message-Id: <cover.1740535748.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_181437_814437_2F1EFD53 
X-CRM114-Status: GOOD (  11.02  )
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

Changes in v5:
  The patch series is based on v6.14-rc4. 

  Improved driver code to directly get PLIC node from args.fwnode as per
  comments from Inochi Amaoto, thanks.

Changes in v4:
  The patch series is based on v6.14-rc1. You can simply review or test the
  patches at the link [4].

  Fixed following issues as per comments from Inochi Amaoto, Rob Herring, thanks.

  - bindings:
    - Update sequence of "reg-names".
    - Remove reference to/schemas/interrupts.yaml
    - Add "#msi-cells".
  - Improve driver code:
    - Use fwnode_* instead of of_*.
    - Some other coding style improvements.

Changes in v3:
  The patch series is based on v6.13-rc7. You can simply review or test the
  patches at the link [3].

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
Link: https://lore.kernel.org/linux-riscv/cover.1736921549.git.unicorn_wang@outlook.com/ [3]
Link: https://lore.kernel.org/linux-riscv/cover.1740116190.git.unicorn_wang@outlook.com/ [4]
---

Chen Wang (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
  irqchip: Add the Sophgo SG2042 MSI interrupt controller
  riscv: sophgo: dts: add msi controller for SG2042

 .../sophgo,sg2042-msi.yaml                    |  61 +++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  10 +
 drivers/irqchip/Kconfig                       |  12 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-sg2042-msi.c              | 258 ++++++++++++++++++
 5 files changed, 342 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
 create mode 100644 drivers/irqchip/irq-sg2042-msi.c


base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
