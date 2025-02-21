Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABDDC021AA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 05:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A5/YjFnogvxTjcSu8mJFAzoZOJFoaA2oAuRoi1VnPwM=; b=BU6oKmJaha6xAE
	axcm8F0FtZ1IEIHZnZzSB9YQAU4JkfPccEgub9af8901kRZ9OpjAcK6bJD6mynKwK6VYvXo3dMv+J
	IAWw+TsHsIcVspQ7ponlgJG2aMviC2cU/hAh7weuJXj4wltdnqrXlTDTgHZY/UxJEw4IT3n6JqRIx
	yYJpEFgn+Hp743dpyRcvMNDI41RnTVch2rI5NGRN44pgjP5hnhW3GvTN7THhTBkeuoE057n0AAzNf
	H9FyiFU9hbzbCALyCTZo6WxnkRD1AsvyyVZpdEz5mnCS3r3SoGvFEHxjSe8K064CRtwlI8cVmwe1W
	3MaEqmX0s+XdYHxe3/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLv3-00000004H5q-2TWZ;
	Fri, 21 Feb 2025 05:49:49 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLv1-00000004H4v-15ge
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 05:49:48 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7273b01fe35so1059683a34.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 21:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740116986; x=1740721786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCavblbMoHmD+OWEl2E4UCrJ0dCMxRnLcf2xtCAUbD0=;
        b=W4106lDiciOwetMkqTGRSFvK8tvNIuktT6IaCJ6gtKIKgzqm0iIybU7pzlHLrV1FU2
         Sw9WjLlMh+zrAc1kCbUrMx6ZMfR4V/YHlc1SNT9bHfcWYCirm9l0du3fhKYAA/DEUFmi
         V47gFHVLioYct7SWCURjVAGYVPbKwG3JI4visJ21O4WZOBa4BWS+rO7ulPSFaSCLstzQ
         pDNg6vu/2AWTTiU2YBCXTaD1A9z9PwdiIpXlgaoFWuUvheeEeWa7jJdvlIWl7UfsTJuv
         Aba0+4b63zCv/sHwnjqiRtoFiiUray68ZnLhSkIt756KUXqjGkiOEPFrpCqZRa7gGcJL
         Fw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740116986; x=1740721786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCavblbMoHmD+OWEl2E4UCrJ0dCMxRnLcf2xtCAUbD0=;
        b=BjiIqCGtdw1HmIZS+Awm9aoI9W7kn1Vz6Lzl5NYgeOSV1Qjk8LGoGSnn05Y8XPfH4E
         3PlTHO+rhejXeJJloastj5iRAHNUTnSUF/wUwwBklO+R0c7TZ2H90XViyUw3NW9ew7Jm
         Tq6Pa0gtQSMsFtEgx7Ugc8uRkVhLXl+EU/AWzGQS7cUWbPwxLW2WlhRRcXu7ywAAVUwa
         p7HD0QJ+4Lf71k38nPgDhQ8oBy2oe0bYg2LAMcISHso1CubiohD0kt/kcMBeUW+Rf13B
         zB3E+svAgMxlBSAah0o9C2PK3dCU2e+TNaIoK+ghGFvDcZonxiBSu7klYBtMFZYKuWl0
         d5qg==
X-Forwarded-Encrypted: i=1; AJvYcCXkAX8/WVAELIsFV6IRji/MWAHvfST3u7uRi6O8g1BxUfP0uBV+iNDnaJZY8eavvRZtVbiz3WEphj3Y9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAe7UgWK46X2uQkAC9Dxo1kdc3mLEXxOMiFOurPV2wV9lVOsd7
	KDfYApckrWSmqJNXKKVfoHd2c+6OoXQyi/nHYdsCA9HzucIKT1POSuD9rG/F
X-Gm-Gg: ASbGncuGiBly8Vrg0pDBk7MHUbg0LUL3b8LdfWUrlH65ONo3dLu2CBb/eqg3jKO3cda
	gPv1wVfb0MLF7ciiZA6IJhL2pKr8yyhX/4Vq5VNG1G7gkIPSeOA+iC69zddQiqpp7SNOrjyilrb
	sMQp5rHArzeH9SgOYkFiUgEN3uhb3CN/jx1Ii4g+s/TMtvRjRXA/MIVcRXaxw1VIbpjkkGeRQZF
	+iopIPSNKwHUVr9frDmsg0w2241WVLZYrInG044A+tAJiGjpLRCJaslL6iphuEvXNqKs7Tk5W93
	d1ojRd7qVROw8oShYJhqn5NKxZ8uI2gB9PvD
X-Google-Smtp-Source: AGHT+IEIbRjoWeNHOm3Cl1YrZmaUoHwxP+dMPkuDZtG4zQ0e4sUMxBmAIIJDZYUwNMixpn2BSGXgGw==
X-Received: by 2002:a05:6830:925:b0:727:413b:ea73 with SMTP id 46e09a7af769-7274c4a23c6mr1244314a34.3.1740116985578;
        Thu, 20 Feb 2025 21:49:45 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fd0645aadasm889207eaf.6.2025.02.20.21.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:49:44 -0800 (PST)
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
Subject: [PATCH v4 0/3] irqchip: Add Sophgo SG2042 MSI controller
Date: Fri, 21 Feb 2025 13:49:29 +0800
Message-Id: <cover.1740116190.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_214947_300797_A61C9C52 
X-CRM114-Status: GOOD (  10.81  )
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

Changes in v4:
  The patch series is based on v6.14-rc1.

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
---

Chen Wang (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
  irqchip: Add the Sophgo SG2042 MSI interrupt controller
  riscv: sophgo: dts: add msi controller for SG2042

 .../sophgo,sg2042-msi.yaml                    |  61 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  10 +
 drivers/irqchip/Kconfig                       |  12 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-sg2042-msi.c              | 264 ++++++++++++++++++
 5 files changed, 348 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
 create mode 100644 drivers/irqchip/irq-sg2042-msi.c


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
