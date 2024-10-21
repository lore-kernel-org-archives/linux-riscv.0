Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227A8D0E6EC
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 10:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GoJBRcVhqdL7wU053u+VSz8KAGhA/kjEU+sT6zGwXFA=; b=FhXGBn+zq2C8QK
	J9plIq1YdatLqZZBunh+mO/koWDz8Y9PoHwlZJLru3/pEBj6myinLrXBTjw8btjHXmg0ulSlsmk2n
	9zOCbG1f/ckkRlRN49SLPrYOp95UH3jwYQ6UF/VT7ZRpr0YYx2rW1EBSNw6++TGab44Iy5Mcvg+hC
	c3/jXZcgN1Jexsm1jtnZTJodcKqCNrQm/wfpjpY7jjPXmq8st+eX8Xle4AWqxnNcEaSrRXTZRSPzL
	zD/R5b5GCe+CunVqrsAYdVSgPX6t8eh8tGtGKQomzFHj3ztm3JfQaveZ0Ub8wck5Z69Lyf1r5q6uw
	omRuRML+gXZSNsZqfeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pnp-00000006ugL-2BYb;
	Mon, 21 Oct 2024 10:38:21 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pmK-00000006uTY-0UML;
	Mon, 21 Oct 2024 10:36:49 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71ec997ad06so522562b3a.3;
        Mon, 21 Oct 2024 03:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729507007; x=1730111807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h3w+t/hy92F7//9WIWnn/8qnkcbEZ1S9KDEWZUEAsd8=;
        b=bE+odaOzEY9m68DNPAk9EyG85+ap0KfpbBCs2spuw3VptEJBOsTJBMqGS2Gq2e1PU0
         m1JNPk9UtAa2ZVmeAgDNiPhC7fClzx4R6klmRBVgKqwKbvASAQ5XWd6Xmckx723bNr3Z
         g/RjXY83INROvo3pZZZfnsiuk+XOw9rB4d7IOcU49KmEHS1OJaxhePRdMRcm5/2t9PY6
         lxcClekWaiX6H+DqtNTdajHnyMRGb374vq7TQd2wR+Ppq/7pdUscZdSNh12xvkn+ej6H
         O9hVotpIJr7sAb6Kte5GPECsVxA19bsE7io6N+lMfJWj0XD+F01cOfx+hl3aD7jQk0Pr
         RVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507007; x=1730111807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h3w+t/hy92F7//9WIWnn/8qnkcbEZ1S9KDEWZUEAsd8=;
        b=SXStW7seASehpzN+HOZ+z0FPROMnYCZ1qcS6rPF3t6tp4Cq6h5qjX2Fg8YdwAWDTC4
         Evb1zEqMlsh+5PpbkIAxN7fJ8S5zJunBfEsCckccmToVR0RrxZjafq5hTVdd/+6HsaQp
         y6qNQv89w+DQbNXNeylanQtpcWHSN/N5azCmX4LfzijnoZjuNst6fUB5Vyy5JJKoTNFI
         z1gNrqxTCAcIUgzu6WCVK1/z3OF7B1i82xgolaergvTWfHRlqKhO5eEttwkTdBqaKpIO
         F6woNIZYhL5URQNagyZAyOFO5n2HaJG4Mw3hkVzbSaO10ceBXGv6qsR2/B/VbrBcPQ30
         ktvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhmb/VZtvDavXzX2xllEReUFXucoyvX8YI24OjIxP4kVesF8LfuqWgTzGTn94ep7aiJ/cmi3wlH08F97g=@lists.infradead.org, AJvYcCWVkxpOM0eFYMCV8fDU1Hw3SdMDC99c9TSPLGekw6FjIpkgO5+xrb3nm4KWi4OOe3w+76wWpaQCRtDqVjvEd5el@lists.infradead.org
X-Gm-Message-State: AOJu0YyWKfRoh8BXYt4/0saHwgIUv7a5Y5Jr6rEnrtVF3c9/fZ4Nm//C
	AWYQj+5S8EZ5WqwVhzYbwBgLJqXz3/QemgcOWvg/xHqM8+BBmr0G
X-Google-Smtp-Source: AGHT+IElGNzKYcyHQUiYzNuX8VzKK9Yqlu7dfkHxfLYn3GyJigsTd7wxPDUfyzl4ltkknkIdKtCRXQ==
X-Received: by 2002:a05:6a21:710a:b0:1d9:1aa0:10b6 with SMTP id adf61e73a8af0-1d92c4baa97mr14744680637.3.1729507007228;
        Mon, 21 Oct 2024 03:36:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad3677efsm3354501a91.17.2024.10.21.03.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:36:46 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/4] riscv: sophgo: Add ethernet support for SG2044
Date: Mon, 21 Oct 2024 18:36:13 +0800
Message-ID: <20241021103617.653386-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_033648_178090_E38F6735 
X-CRM114-Status: UNSURE (   9.25  )
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

The ethernet controller of SG2044 is Synopsys DesignWare IP with
custom clock. Add glue layer for it.

Inochi Amaoto (4):
  dt-bindings: net: snps,dwmac: Add dwmac-5.30a version
  dt-bindings: net: Add support for Sophgo SG2044 dwmac
  net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
  net: stmmac: Add glue layer for Sophgo SG2044 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 132 ++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   3 +-
 6 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
