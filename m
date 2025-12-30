Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1738BEE0203
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qOSf591/oHd0mUd32w6OTOmFxp8p2yqmLzNdjGC1X90=; b=gdmRkcAD7vTFRB
	mmJ2bb+s2BEfTaK3s5WA9MjALGGfzcwf2b4VvCD6c/2auNdH0WLmSuZ5FMQhT997RSQ6r2eyUxO3q
	reRT9gsV8ih/wTcZC1YCYuLrxKoQbuSHChZf6vyriNZ6To3/K15PBP2HOLYFzAaRnnCyzKWdOzKuB
	BoYuqt+18k8Y/w7cG8Y8mB/VmqLmO5NDqtSUf3VN9ISk0d4FtKShl0L026q8KF4375o3ISHltoJpT
	Bde/FGR/hHZPzv18A0ELx9UdCC+PHJ+VBWX5jv4q9JeWdhB5haUUwEFuezJzE1tvqFpds4VPCZtcJ
	MaWWNUmCP0qUV5zkGt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaajI-00000004wAi-1wwL;
	Tue, 30 Dec 2025 14:29:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaajG-00000004wAM-05Cg
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 14:29:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0c20ee83dso127519125ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104981; x=1767709781; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RxCXRDx0w1yWm9FY0vwmJNFDCxUNTSO4kUQ4eb5iubM=;
        b=QT72mtWKKMTOrdv+bBZb+MmQDmG4d7eRbgiB9+65J1s+ExAj7JaHZBkmceXHd577WS
         MvfPP7JSeb5QhvgDBaNwDun33KyRr0e1p0qnWP7T/jDnAGuQp1LQ01XNWiek2k65HGLd
         Q+BmgtMdcu9T0sn/t/YQHZBY4+cZKT1TqzTv90bhqlDS4zrraNWSLtwOpnr4u5FAz/Fb
         blS/aGc+UrHSMGFqCyROfbZy8B0ZPzif6LiFgZBRSoglRuiZHSqYMvaAoJ9nGtK3mAkj
         2XtoXRxd4qZu0zgGhjj2zFcafiLIrkjRG7nXVjYc13+o9eT/iwRYdy97V20dFdJioWRp
         TSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104981; x=1767709781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxCXRDx0w1yWm9FY0vwmJNFDCxUNTSO4kUQ4eb5iubM=;
        b=o3q8hhkLIv+FPFnI/uUcYBKvYMTwi3jYRC1Phx1etSL1CcxRWGvt1F2bU0KRaoirdQ
         AEDxH1GoNZM5WULPrfzRZIHcmeAwQtUxy4ajmkzMnUEsyVWdcJJ37K/M37BMlO5a++LP
         uGvLegtO+OLLjHJL3NUA4jLyietZGLT1e3N5YQnHRl5Rm4dr1bDjB34rBa7HL9T4FEAh
         TfoMRne68LlFz8V3UL4HzmET/EIgGkRe8hFVxIPlURs3zBxtpe/re70Vpw4DrgCCoiqR
         jFu7xJ+iKKlipdELWkpiS/2rOEZwxoKdCM6HyWX56c5oppI5Rlzvol/QwXlOgO/+8YqX
         fYiw==
X-Forwarded-Encrypted: i=1; AJvYcCW0+wo34BRRDUoJ7ml2vTTrW3eF1awIDkXJiukmkzuwWgN4kVfY3V2qqvYHe6Ptcw4Qgu26orLkOQ3x/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkl71OPoo4y6fmmvNsIgZThUke4rUjszmGJhJVmX3nFGU7zuA3
	Gc0pzH0R7vpOiu2gmyd4iWCqWYDk6VnkHlhyCmYZei+Qx2vtAnkKPmWV
X-Gm-Gg: AY/fxX76vBRlzii+HvDRvLPVYYQ56NJoexT03Zc8hEG7onuqa4VH/pUBerztrhuhqXl
	YGW34o2mxGWySJh2G2RCdmgyM3BgrbIuXs2UwcIlz/TRfjhR14F8QbFs3PmJPXzAw0Lzyjo0H0l
	1mvvG4G9prFb7F98/ocM21YrFSh+JqjoiyRFNuPqR1ujsf/7vYavrU+U6Cre69VbVnzrO8q9Ych
	IqCx7o5CwfkReKH2sGILzMLc1+2v+6EY4VAZZu8Sm/C5qoTVXl7UJYTrLovq1e0A0WFRzPr8gmO
	9TbiuA1lz12saMWvvurEi+WNoAz/USQaKw5iRqqa0gIbnCe4uBcxP7iBdXqZpGo47RA1itnAi5j
	S2RmosKrzN2WEtX/f/G3F9eMdFRuZr7R4UTApz3R18FJC+jyNmGP7lD8rE3KvD3DwBfxCd6v2BO
	RZirvHUMbnOmwaBWM=
X-Google-Smtp-Source: AGHT+IEuziUm5FuVFOLapyO93nCQfCb40IgI2Or9ENPDmWDsqW88deWU184+w+hKs3Tyi+48xUtmng==
X-Received: by 2002:a17:902:f607:b0:2a1:4c31:335 with SMTP id d9443c01a7336-2a2f2717b88mr314299295ad.26.1767104980514;
        Tue, 30 Dec 2025 06:29:40 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a80esm298183155ad.8.2025.12.30.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:40 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
Subject: [PATCH v3 0/3] i2c: spacemit: add reset support
Date: Tue, 30 Dec 2025 22:29:01 +0800
Message-Id: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK3hU2kC/03MywrCMBCF4Vcps3Ykmai1rnwP6SImYztgLyQlK
 CXvbiwILv/D4VshchCOcKlWCJwkyjSWMLsKXG/HjlF8aSBFR036jEIOA0de0NZ31qYhbTxD+c+
 BH/LarFtbupe4TOG90Ym+609p/pREqNB6UtqeFHF9uHaDlefeTQO0OecPQOy0fKIAAAA=
X-Change-ID: 20251218-i2c-reset-a7be139213de
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>, 
 Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Encrow Thorne <jyc0019@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767104943; l=1371;
 i=jyc0019@gmail.com; s=20251009; h=from:subject:message-id;
 bh=a1J69aM75aks5NKEgsk6GGcoN5bgwi6MKrm7NlrTPLc=;
 b=18EDF1Yo3gil3UtsnPjnP04wMrhNkhNbTfRqJtMQTnJdkoA05tCeC3CideDM+jpKg5I8J2niZ
 Bu9piLwlLabC0cfTZuCfH/4VcODZZNdWNjER3S6w/QX91MM1paamAdS
X-Developer-Key: i=jyc0019@gmail.com; a=ed25519;
 pk=nnjLv04DUE0FXih6IcJUOjWFTEoo4xYQOu7m5RRHvZ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_062942_103861_64908EF8 
X-CRM114-Status: UNSURE (   7.68  )
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

Add reset support for the K1 I2C driver. A reset ensures that the
controller starts in a clean and known state.

Reset ensures that the I2C hardware is in a clean state. We cannot assume
that no program used I2C before the kernel booted.

Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
Changes in v3:
- Move reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v2: https://lore.kernel.org/r/20251219-i2c-reset-v2-0-ad201a602e74@gmail.com

Changes in v2:
- Replace reset property in dt-bindings.
- Use devm_reset_control_get_optional_exclusive_deasserted() instead.
- Rebase to v6.19-rc1.
- Link to v1: https://lore.kernel.org/r/20251119-i2c-k1_reset-support-v1-0-0e9e82bf9b65@gmail.com

---
Encrow Thorne (3):
      dt-bindings: i2c: spacemit: add optional resets
      i2c: k1: add reset support
      riscv: dts: spacemit: add reset property

 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi                       | 8 ++++++++
 drivers/i2c/busses/i2c-k1.c                                | 7 +++++++
 3 files changed, 18 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251218-i2c-reset-a7be139213de

Best regards,
-- 
Encrow Thorne <jyc0019@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
