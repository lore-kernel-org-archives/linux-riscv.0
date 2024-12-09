Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AB4E77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 07:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hqj0GaFIu4luRWbg1PUnp0ZMymt64O7feZRG+0EkyAI=; b=3T6ND2gVpGA0EC
	UQfDSQc/pQnpI/IBJrTUFGJPbPFUW/PzRZ6TxutAxh0/+fRgCfKofgRtjS+Sppayd6QEl49EcdF4/
	9N1G8P2cK/H8Ao4oG3nf8mHpqwOk663GOKuRWmAVCtGzYuZIQF29YhlcljaIlewb6CJTEslxkTdBF
	cw+Pd+/j5850KMvl3+lqQJ1C4I16Wm7uyuRmlp24bEcwvEZ1uDfFqJcfiZ/BizmoGt36S22UHK5ag
	SzqeY4ANlGRtxyEVh4cEJFNuaHOwpoOkKWYH2WSTQnsAd0D9vjlKNDM3M38AHnIiEmw5JwhIRy64P
	N6y4fK4AG/tZIPqWUzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXvP-00000006fGn-3XTj;
	Mon, 09 Dec 2024 07:11:23 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKXvN-00000006fFW-0r3j
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:11:22 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3eb4b6106c8so393553b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733728279; x=1734333079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dXCvGSQBhoZb4HfsO/a7NHa2iM3ytg+7BazDpU9q9ug=;
        b=U/2l4Tf+02OgZe0gGJ9XoMSqqvnORUmhZOId61Wnyxa7x4HL+Vamx3+48GXTWvK3s/
         WyL9j6ugCPjRNlstHdV/c8w3vK43fklapGmV3CkQpXnk5q0tTo5W4a/twdrawfDV1J1Y
         4CTJGshuZJ2tZv8IMHzt+ijZE2HU/+VU0hUQ9iwCcmyZwGzR1HKMUeeCkh7SWw1st9UL
         siMRaji9PqRaQxD+Ej//0pIuyHBJbXftD5Bc7USpbctcF+uasmbu/+wA/voUoB/U3EVD
         Ww1ZIzdEJADT9+QU5Vw718NiDabr9OvbZUbrNeQ3WefKig2XZXESNyeWAbCHYPPuHdn+
         84pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733728279; x=1734333079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dXCvGSQBhoZb4HfsO/a7NHa2iM3ytg+7BazDpU9q9ug=;
        b=BOtwb1z3C6KO4TF70iJxvLX+78ohQbzHWSYfMct/4PsgOIyuBPbhUCwQ9Zlt7yHgpe
         Ncv1DA++U8oR+XUaviL8DG18UePD/pHfUlDDsb6qVmpXUr+VUu8ArsFux4Uh2KR8fisK
         MLC/TYpfXTfSgVjnUBKHuglIb1wIBd8BtCGUL7BYdQNvQi9Qs2G2nmjxhV4Sjo/JMxdh
         52lS5m4RA7OJ1OFJIk/k8Wzc+t7BDPIPyCOPSW5brWJLCoDVzH0k35k+DA/Pf4LSugMQ
         VjIH5KO5rJqIAG7EZy++zc0VFRO8e4TN7k3GZQ0FHmBzmjb4wlcWdodpsIm7MWWX9deN
         nZWw==
X-Forwarded-Encrypted: i=1; AJvYcCV06LvD8YiVZEtF2ZHNg2/uIThp1tZkKaoLIgMF4gdCkNPAk/7wDAgWZ3mHCAhiwYgk0NesEAQiHutZpA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+qmLuOkprKjFhpHrGdsycj1vVT1fs6fuy9OW0tB3mYo6hQrx1
	A0UGXysfiLbCmKVM00z/UDIR/n7AtBZUkQc3d+DPQOnzuT9tZLxq
X-Gm-Gg: ASbGncsg3EJRVbPhvptMShAc7FzwZpCkjeTkM85r3gPQBRii8nlt1W1393NDPdBi6LB
	uk53tQMcd0nYmBssT77RJFDC63qfJWT8C9W9nRE1gNgD36QqKVzT5ypWCdMdLzaxNDhJlqZHjOx
	444Dv8Ub32UCljuqRG8yEav5sWNkVLyaAgwsX1uQN0ZvtmuYN0GzGTgJpUUgh1fttMIYS28iIqT
	IrNwxA9J5sS9Rg22fVbvnlRvK/SrGDX1bOz56DXaYklLRblx8hDVhEAge28
X-Google-Smtp-Source: AGHT+IFwsqT7VvH1ZQKLkcly4Q3Eht2MXjBzxc0eFSNqVIH3M+ua4qIPPmMIpviBVPhw56Hs9UWc8A==
X-Received: by 2002:a05:6808:1522:b0:3e8:1f5d:b7f8 with SMTP id 5614622812f47-3eb19c1fba7mr9768212b6e.1.1733728279562;
        Sun, 08 Dec 2024 23:11:19 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f2bdb73d46sm293812eaf.13.2024.12.08.23.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:11:18 -0800 (PST)
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
Subject: [PATCH v2 0/3] irqchip: Add Sophgo SG2042 MSI controller
Date: Mon,  9 Dec 2024 15:11:10 +0800
Message-Id: <cover.1733726057.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_231121_243135_E439831F 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Chen Wang <unicorn_wang@outlook.com>

This controller is on the Sophgo SG2042 SoC to transform interrupts from
PCIe MSI to PLIC interrupts.

Thanks,
Chen

---

Changes in v2:
  The patch series is based on v6.13-rc2.

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
---


Chen Wang (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2042 MSI
  irqchip: Add the Sophgo SG2042 MSI interrupt controller
  riscv: sophgo: dts: add msi controller for SG2042

 .../sophgo,sg2042-msi.yaml                    |  63 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  10 +
 drivers/irqchip/Kconfig                       |  12 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-sg2042-msi.c              | 285 ++++++++++++++++++
 5 files changed, 371 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sophgo,sg2042-msi.yaml
 create mode 100644 drivers/irqchip/irq-sg2042-msi.c


base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
