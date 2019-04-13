Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034A1C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 02:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C59612084E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 02:01:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J98M+t/s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mVMDiEPR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C59612084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GQ+fNMTBcNBD9Gj6Me6xUC4jnbkMA6FV3c8dvIz+7tY=; b=J98M+t/sYfs4rH
	6BI64zqRa1Go4oyLVQP8DsPWpH5/gbRFFCPbyiwkoH2Wva6k3ncW0y/7VPgDMKtFgP58c0tsyxyaX
	ZI0cUU9Ori2H2K6pcK7KChUyiRV4YEmf7FS7cuSskD/2og5qpbv8G6QMA/FMv2/pwQy+r2kRbq1x5
	zCG33cDleHKYzlSqaSwcbVS418ZUelhV/rbgHmUg0SQCSEtgg+e0Cd85UNBkatI6kn/QSnrXJ8FIE
	dTfB5cK8iM0kj3kywM/rKXm8z2y4blFTGq3c7fhyodpkMYd9CiqE9e9wVwpNTK3H4ObqS/zjm9CjP
	yny7tShf+w/t5Pwq4PhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hF7yx-0003cl-Kk; Sat, 13 Apr 2019 02:01:27 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hF7yt-0003c5-RY
 for linux-riscv@lists.infradead.org; Sat, 13 Apr 2019 02:01:25 +0000
Received: by mail-it1-x143.google.com with SMTP id s3so4311190itk.1
 for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2019 19:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+hzpRKro/N1+KjPsI2arcM04yh6Mwp469LzcJDDeQVM=;
 b=mVMDiEPRK0liceAJb39tJZOJ7iuOEc4Wh3Eb1kJo7IGT1ZqtirUr8ka4ccKgcG4MJn
 xRXk2kZPHIcFzQRoU0UR7nutGms0kPxL/3CkYfMTWrzaHcw9ii2Tplt+xDFBApZc5dHX
 cLef80qZv+heFk8yVqakfBMTigeIaoG+AmG265eH8C/AaYMIuoWbHCV+rq9BuXDc3OsT
 AV9vjck/IoxRGS9QrDm2sBeyF0IOox7b8gy8wuD1QFYaderw8VsS3dXLswLvodIJVe+V
 q1sqtTksZWEi3muRji1hibls2sRKS48ICGSQ954jbyT9hpybY12JeGMjrzFEX74xKyqW
 QFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+hzpRKro/N1+KjPsI2arcM04yh6Mwp469LzcJDDeQVM=;
 b=g4tqA+XGcn0yfJzkFOtDcPwg6ib6iuAnHtD/ERskEZGun9BxATYXczG8ymoaW4858Q
 O/vDSHk0yRFD9mIwKhzfrYxPhQnNTg5P+ZmBifX4LHZyWRZQOAQjtJHiMqvTkyOZTVhr
 J/0bzEQfrO2Ar0DN4foEviGLcCr6tTHmA1n3M6nU7odYroHkl9u4QHEnEYJqWtqgjD7Z
 RqtKkLhBgeR0eXFuixzf5N0hUTu7Q85hvQ0WWzj509bY2vIUiJD12u6ODhxrzAZPC/XA
 W+DgO7PmsIgdD+dzaXZ81F29DhF9ft7vSuhmTGoJflDtEnBJf72UDMI0SrESgJLXFllW
 FYeA==
X-Gm-Message-State: APjAAAWLmqH14RaCY8WckeoVj3kzqQUszGva04wbD/A/HQdLf15FuaCb
 K2RCKsY3h+gdfJeBH8cWQRpLGx9ATjw=
X-Google-Smtp-Source: APXvYqwGbE8R8O1lyvCcVbMC1YOrPxSXhpmyliWHHsd2K+CctAuU+QvsGB/1igpfeN4hAAeYuSsxFg==
X-Received: by 2002:a05:660c:18b:: with SMTP id
 v11mr16406208itj.147.1555120879991; 
 Fri, 12 Apr 2019 19:01:19 -0700 (PDT)
Received: from viisi.lan (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 v187sm7198473ita.0.2019.04.12.19.01.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 19:01:19 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org, gregkh@linuxfoundation.org
Subject: [PATCH v5 0/2] tty: serial: add DT bindings and serial driver for the
 SiFive FU540 UART
Date: Fri, 12 Apr 2019 19:01:09 -0700
Message-Id: <20190413020111.23400-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_190123_957794_EC9188FB 
X-CRM114-Status: GOOD (  10.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds a serial driver, with console support, for the
UART IP block present on the SiFive FU540 SoC.  The programming
model is straightforward, but unique.

Boot-tested on a SiFive FU540 HiFive-U board, using BBL and the
open-source FSBL (with appropriate patches to the DT data).

This fifth version fixes a bug in the set_termios handler,
found by Andreas Schwab <schwab@suse.de>.

The patches in this series can also be found, with the PRCI patches,
DT patches, and DT prerequisite patch, at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v5.1-rc4


- Paul

Paul Walmsley (2):
  dt-bindings: serial: add documentation for the SiFive UART driver
  tty: serial: add driver for the SiFive UART

 .../bindings/serial/sifive-serial.txt         |   33 +
 drivers/tty/serial/Kconfig                    |   24 +
 drivers/tty/serial/Makefile                   |    1 +
 drivers/tty/serial/sifive.c                   | 1056 +++++++++++++++++
 include/uapi/linux/serial_core.h              |    3 +
 5 files changed, 1117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
 create mode 100644 drivers/tty/serial/sifive.c

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
