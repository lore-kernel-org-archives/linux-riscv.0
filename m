Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C439AC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DFnOYtVj4uRL4fJlzJHkmULk9+M6+YHxqiB4+UGBJKE=; b=zG8yue1RHLgRBl
	XsUGRCFptKMJXiuF3QZ1jQQ12xjn453hoGbNb25XzIEsnNQavr25Y7zFve9HjeUBFzXC5y28SpO+9
	o0r0pVcGJWJrIfD7tUDM/CFQphH4aJK+RCxWlqURX8FZcvscz7pZgDf31e8WZg9i4bc+qrICFJJkT
	d+P1QQ/RNOfct65Vo1OIKgKyOyguEw7ehn6Sc13qKvaWdtuqJ4QZboLtEZ3Apei54AYca4+mY8Ohu
	PWiqlQjhuR2USsU7LvIX2+m09K7kZKZ/kVWDQtXkv41Wi0E8vuvuxMdO067/Og86+ETsrGMY9qE+w
	/DV+awp+oysndjmpCOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8d-0089Xu-1B;
	Wed, 19 Jul 2023 16:34:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMA8a-0089Uw-0F
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:34:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bb119be881so49612705ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689784488; x=1690389288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHD3s3Vv6K0BaM5EQ+IYYZEfsrjIJcH2yFqvTWy9ha0=;
        b=ZCsF62F6DzCb43m0ibFaEfnlJcU8sX/vUpG+pV5DIPQVyidywfnCi1lnyoPTKPPPmK
         LF0oBwTcENyStWLvAiUL/rJ0Hm0SO8je9WfYui6+niPD4ndOFHyDgdvMsPENOlBcOKwQ
         j5zsB5LP7VTXIJLD2g5bKyU7kFZObPep8lrqFsEM1KAOBirKzOiRu7jXTZUnIK6KAGDX
         5QVJxWN8s99oI3eGBVpT+w9+9LGD3wnUqFC7RzeEo2pXyvW2QKW6Qip4/MZuzf4zrqIz
         CiZe3uCkCpN1Y1r8ShIge3v+scaAdCHSugF/ACFDa36MxfsuClkBIIB2r3ZOX9Cvk5UP
         4DDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689784488; x=1690389288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHD3s3Vv6K0BaM5EQ+IYYZEfsrjIJcH2yFqvTWy9ha0=;
        b=D9A5honDnzHdky20gJl/T4/Wf2X3pVOKZM/uTALNOQpGvE1ovRojrmHr//tWXlG3wf
         riEBb8i+hJuHfh4bF+otC8YA6Tvw0AhR56rCnqkGPV5QMPTTxvYCOWPGqRW8WayO1Zcg
         liuCPFI+MEw/WNBsQnCqvLaE4wZn8wtYI5YXBua8L9AuNHOLGVy7zSi3MCJ33IO3uqTY
         Z3g7nX+VcipwYv6kEWS1DZII+klAWtdDvGhCfkvLbKz5hwhHex7tyOJF8mRfm5uMDrQu
         KNrCvE6gvj2BXxEhbi++QY0jA4yKSbjnXr5mRFSViwFSPU2faSiFZc52KCoMbZRxDtsB
         WA1A==
X-Gm-Message-State: ABy/qLb1yGQGOS0O2QgZYYLErCPWFWmnfF2NVow0K6YMB9QUN7/88rbW
	xXHerZlm0zLB3qj7QUxaB3fsZA==
X-Google-Smtp-Source: APBJJlFy35TVoZNTEgWdHT4WsoV1Tt6FWOxXOKMX8NuNrnEj2LUqFscu2j0yVJUDskROheemv4v2kA==
X-Received: by 2002:a17:902:e88d:b0:1b0:f8:9b2d with SMTP id w13-20020a170902e88d00b001b000f89b2dmr21365359plg.29.1689784488451;
        Wed, 19 Jul 2023 09:34:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id x6-20020a1709027c0600b001b0358848b0sm4199276pll.161.2023.07.19.09.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:34:48 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/4] gpio: sifive: Module support
Date: Wed, 19 Jul 2023 09:34:41 -0700
Message-Id: <20230719163446.1398961-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_093452_113231_07BD733A 
X-CRM114-Status: UNSURE (   9.01  )
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

With the call to of_irq_count() removed, the SiFive GPIO driver can be
built as a module. This helps to minimize the size of a multiplatform
kernel, and is required by some downstream distributions (Android GKI).

This series removes the rest of the of_* API usage in the process.

Changes in v2:
 - Add 3 new patches removing of_* API usage
 - Add MODULE_AUTHOR and MODULE_DESCRIPTION

Samuel Holland (4):
  gpio: sifive: Directly use the device's fwnode
  gpio: sifive: Look up IRQs only once during probe
  gpio: sifive: Get the parent IRQ's domain from its irq_data
  gpio: sifive: Allow building the driver as a module

 drivers/gpio/Kconfig       |  2 +-
 drivers/gpio/gpio-sifive.c | 45 +++++++++++++-------------------------
 2 files changed, 16 insertions(+), 31 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
