Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FCEC71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NIQdasqVRXnLUNJ96/zEvZ4NOck6CePocixdfYr0J6s=; b=A+USxiDxZ12lBq
	gaSuDpEPWAk5AAmY2QUrIUTrio+XQ8koIz9yUDrynA2sfl6hxJ3Ykq2C+F1ebH9uCs+8jovzxLZ2H
	tJYnk/xrZr3ObIoAdbm7a5JFIc4oXUGqn5FrBeK7MrGzKtRyRnVpwEQM1cW22EYLJXLkBdpxRYVg5
	MyJk/iodPL1v1grNqiO7Sfp/ELnd4+ZZGr8/NVQn1PsRmEUoQqACoBPZ7oxzpTswQu12mXsCFZg0r
	Md11zUpf+Z75/9OkOsH3qGSJYc/0X5fMTj1B/on4FY1MYHk2K74lQ7yWa1aLDfT0JA7VX4ESZ1JxD
	+bIsYeVD1cm0b07Bov5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQNg-00000006QCq-2jS8;
	Tue, 17 Jun 2025 07:05:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRQLX-00000006Pnv-0EFA
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 07:03:04 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-235ef62066eso81748465ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143782; x=1750748582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UaG/t7KG9r8h6CuNkV1Xs54wfnnVvv58385nUogNAos=;
        b=GuTOOFkfZ/gbXtG4+vKeyrKrCgNETNaidDGJYkvHOsCUNH8faMaZNnb/ZCUWrNLhB/
         uBmw/2sRDOOEd+Zn8enjS90sBU9OxmoMSis6Oqdf39L0oxadtBHHAxTC0yWSRBHVNoN7
         oeP+qOEBaZOLIWF9ve86WQGSIwTM0VqYO563gnAJad9EucModR5Wbqiq+566GjkJ2VxT
         D4W/kjQq/9ldKO0WvSvANp8SgpUjZ/R0tL0fz3A92YMKewNPDX/kvh4jpZMvd22ih1oK
         6OlmX9vrWj/XqKQ8gREU7RsySH8mxktevgG3OzFKxe673NMPl/5RLY/UgZKOLE5jl7XX
         +Ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143782; x=1750748582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UaG/t7KG9r8h6CuNkV1Xs54wfnnVvv58385nUogNAos=;
        b=VScUgxQwLbKRzBF+y6nSI836/DPVhlr6MNe+MHyPZd1WVuwWaZu13hCU05karZi/wZ
         7BCBG8Lb0WZYjs48ARDUOyX9TMVVPdWy5KvfFYaOC5RUogKKG54eglxrvIr/f5T3/Xux
         VWJdZdpiu9WOsnsQpkcIMJvVXr+VXjn9NR3WevOEsgOwfFM49fNQzG2t0PmhltSh00hg
         qNnyXIKBTYKzqUcABxX3WPJ8TjnM6by5hl+rFHWq91MomhKseAV3+nY4jxMDLLk+1LX7
         XzuLl/aanz22PUaVfH9Ucif7B18VqgTV5pCyNrs9iefOkoiR13IY96LRBHKI15KX29WR
         olSw==
X-Forwarded-Encrypted: i=1; AJvYcCVDAtl5sOdNGwFdsTASsH+ovYRAlBR/QUIjWgfNCWvNZjElteaH05tasm1ikNMHhlmZz/kJor1rOEdnNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YypAviLawvcLLNirnUHXp3tjtiYRwDXS88eh790JqzfTS2mrGxQ
	VIoftJasEhNvYrA84kZHECnyK7yolENvUVP88Q+LNCkym4s/9b58eEWO
X-Gm-Gg: ASbGncvZwBeZ6FD9pCBHixMf7g/3AGQ29hUqL59MpX0oD1Yx8Y6m3eozMF0dDQP+glI
	U/G8gASTKknIASQUSi8GQ6CaatLdEaheDIq8QGJzo04andIF3Y9g3ygt6VLwDnlzEv6d5UH5JEi
	lv9d7U2DeBmksjqs0nPtnidTYiFqcAEqdcUGQu1E31bqeiN24xLSBe3o5WWAbC/KjeJbbNmLJhv
	kivhKnG+0Aezo8m6qAdHcB0Dt16miuFDw+0zvx0lWMx+5CgOkd6SH/UFXNFUZFcfV9Qeg4UkTQv
	r/vwwj8qlXpB0IGjDMbMqyJfTDf//ds8AIB6WTEQpyOc521TjMuqjpBK9k/tqA==
X-Google-Smtp-Source: AGHT+IGqDk0ZeWL4AT26rDLpFZ8Aq+pamnX39szXBefKiFUBuwuWNS2youv83CQvs23AFpZt39mjJQ==
X-Received: by 2002:a17:903:2f4b:b0:234:a139:1217 with SMTP id d9443c01a7336-2366b3505c4mr146544715ad.18.1750143782107;
        Tue, 17 Jun 2025 00:03:02 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23692e44fcesm6154635ad.169.2025.06.17.00.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:01 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator support
Date: Tue, 17 Jun 2025 15:01:38 +0800
Message-ID: <20250617070144.1149926-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_000303_103523_FFA757EE 
X-CRM114-Status: UNSURE (   8.80  )
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

Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
Add necessary code and bindings for it.

Changes from v4:
1. patch 1: convert the compatible as entry of enum.
1. patch 2, 3: apply Alexander's tag.
1. patch 3: apply Junhui's tag.

Changes from v2:
1. patch 3: fix wrong reset ID.

Changes from v1:
1. rebase to v6.16-rc1
2. patch 1: apply Rob's tag
3. patch 3: fix wrong reset ID

Inochi Amaoto (4):
  dt-bindings: reset: sophgo: Add CV1800B support
  reset: simple: add support for Sophgo CV1800B
  riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
  riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series
    SoC

 .../bindings/reset/sophgo,sg2042-reset.yaml   |  4 +-
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 25 +++++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h     | 98 +++++++++++++++++++
 drivers/reset/reset-simple.c                  |  2 +
 4 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

--
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
