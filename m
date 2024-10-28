Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB066D13588
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 05:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6PYgA6NeUrfxIaYcehvTy3k0iUuZws3Lm4rAVtw46L4=; b=ywM57nv8n0Hwur
	lZP1QBCwOjkfdwWD/DXpJex9XT5aytqxkBGUKP6lkRzKI0Jd1tM9lfHxLKxBUEV5VQxXteJx5tO4l
	kfPFSi1tDZQxh9qU/QvDI4c5XZC5cE4vsRUEBb5ARXmHveriAcobk4g6YBlp39owm35QBKBqBl48d
	cH9q5B1jX10wyuIfGmtrtX4z59gqbkEEP4mAkge8jxcNEAPK7s3r0ZkuNHxbxn63iYvAntpw6ccEN
	FnwiLKTU8/e8cu79tcI+zWch3OkZt+OqfCahlSZjLJ9MwyzFZhXf26qhKDeGjNzUGA9ms6f/4uSKc
	5fA45Bf87xsFqXiEtcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5IR2-00000009c7f-26XQ;
	Mon, 28 Oct 2024 05:37:00 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5IMk-00000009b8A-1K7X
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 05:32:36 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-20c8c50fdd9so30125925ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 22:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730093553; x=1730698353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OE9ZF53+aq50EW6IBKp07AsaB1tUWgDq0HfrchrCLw=;
        b=VHOm9lap+z+VtSVYJKmkkXar2insjJAtpgUOFliFyVr6BjsGQewSz6mVgYH5P73nZZ
         nHGdiomi2WjVqwVk5Z/ePf58FEte+IfBj1MY3zaBnzpzPhxaATZtWkOjgkWbfoUfob9Q
         XPPX8+97BkduX/UrhsMdwFuqx52lJ97yZuOMsLfXXZapuhowEaZcHaudM+qmIkJBp5sm
         DhrJPUv6nDL0woJ9nGLfBnPY+8tmYMgwu/kJazP+VL+284MXkuPyi9pOADq2EGpJR7lB
         5aKJWLwIoU0GT8pCl71Sp9Q4wuDxfnQWlPkjdw9wFlzbMSPZwFTdnCEw/OcJQc5QB2fx
         AAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730093553; x=1730698353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OE9ZF53+aq50EW6IBKp07AsaB1tUWgDq0HfrchrCLw=;
        b=VBU06MU18dzFd+C4hs8otscKY7MGRa+uPtDAIadmN9b1lYQmssypTCH7gXG2ocG4vq
         MOIaryMstyXL/GIsXI9nOaKA8itCv/9Tt8G+pwE4kPQlQ6y3Xpi95CDeqn1SvnIqtuva
         Wbc2RpTCBPM93vQKHrTygoSsNfK5OhwFz8sb2Rs0EwikjI1buuXPVu+xETI4/Z/bKqAE
         Q2EMME7tsG9LrxyUfFiI6evpRMdek6n+3zKcv1akNx7mCIry5KFoj1V9MZGRnVN59bBM
         pRaihKhGZWoyJPvvDVrDrQps29u6gtOIz4yC+z6kfcl9oLvPg7XVcqjijxN0iZMJOAtg
         dG5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJQOIINUli6xtcHBzZQTsgugYl9Abm3DyLsPdXETedhsDF8RsXyO1HJhr6qCP4LM6qa1UtVjeMp3qvWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzirPsU0Q8cE0EFv5t8ctlIS4WcxFuk7x0wv8uZ/FS7r+8LX4xq
	yYcPj7WOdUnTpbw2hCMq+fZWMo3ukC7QePLjhSxspEprjk/tp9EvH/O87tp1Hkf+8Q==
X-Google-Smtp-Source: AGHT+IFOFxvoqutIEMDhLNVuDtQXabCz+PG2NaPsZlB4GWGiMQRlAcO6dUor3vgwVIJJgTxeFwwkwA==
X-Received: by 2002:a17:902:ecc8:b0:20c:cb6b:3631 with SMTP id d9443c01a7336-210c5a76dabmr99486745ad.27.1730093552881;
        Sun, 27 Oct 2024 22:32:32 -0700 (PDT)
Received: from troy-WUJIE14-PRO.tailc1d423.ts.net ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e941sm43216475ad.204.2024.10.27.22.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 22:32:32 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC 
Date: Mon, 28 Oct 2024 13:32:18 +0800
Message-Id: <20241028053220.346283-1-TroyMitchell988@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_223234_374416_1E6B4626 
X-CRM114-Status: GOOD (  10.44  )
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

Hi all,

This patch implements I2C driver for the SpacemiT K1 SoC,
providing basic support for I2C read/write communication which
compatible with standard I2C bus specifications.

In this version, the driver defaults to use fast-speed-mode and
interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.

The docs of I2C can be found here, in chapter 16.1 I2C [1]

Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]

Troy Mitchell (2):
  dt-bindings: i2c: spacemit: add support for K1 SoC
  i2c: spacemit: add support for SpacemiT K1 SoC

 .../bindings/i2c/spacemit,k1-i2c.yaml         |  51 ++
 drivers/i2c/busses/Kconfig                    |  18 +
 drivers/i2c/busses/Makefile                   |   1 +
 drivers/i2c/busses/i2c-k1.c                   | 658 ++++++++++++++++++
 4 files changed, 728 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
 create mode 100644 drivers/i2c/busses/i2c-k1.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
