Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEA0C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 09:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B9E2084D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 09:00:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gtKORVkb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="V/AOBYRD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87B9E2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gXq2hiXfDX0KGNk3aSAyWsCRpsncwfMZU6j3zNhHFuU=; b=gtKORVkbOBnFMb
	lHQPU4BlKCIdTri1TswKYii/OBmqkQpkwzyWTe05Pifj5fmAizV453Z63o/1UpDNce1Cpah2gvAzg
	4clBXURu2OeJgjVSWxbLr8u/O2S455x5UuM5+3IY3JqK8LQdkH8Dld7CSVehmYqZBQSNAJK5xVQWj
	vbfLNjEfmXI7MXHDtWUCZN5Wxpm9kj1dHWQ7MMcYXtd4pG44x54eVd7ZlsQ76LgwGGt/32BDEfY1c
	9+N8PPYq3TEIl0qmq4mNiKKDLiQZya/yF7kxjJ7HOYn6Q8scOYqDMGM1FFIBPcMkd84LOg9K0Yyf8
	9euG2cN9+YyPrBPlRNcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVZd-00015W-OA; Thu, 11 Apr 2019 09:00:45 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVZa-000158-SC
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 09:00:44 +0000
Received: by mail-pg1-x543.google.com with SMTP id i2so3191858pgj.11
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=frJX+t0qve0rvf3r8LM28APcFZPyTl1bsa5j7cIVrPw=;
 b=V/AOBYRDlQbzjRGJCoP0AO747lJxK1E0b6yBordaP73mSpH13q3xrnrhAo7zANOhKq
 /kc9soi71g+8qig/5AewWyq8bnGL+nWI8OMm6oV3nv/CAVOp4y2Ysr+jaifggz6iYR4X
 u1s/NkK2pvi4yorUXuQcc6i4Vo8NLsAcopOSZSSO9VU4m9kLz5zHlDO65iBEs8LZNo+E
 GJ9l6L4XHo6zJtu2ouKu3dxI+ZrveejgVIBT5tFmYRzrbwmCTYZ78HDWdwi0kgdWlIfK
 4WRYq/O4GXKfNAr9Qz9AAA6meGFpnzsxVDisACP6wMAWtoGmlCQ9kJkx1oKaxcuKh/fD
 twHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=frJX+t0qve0rvf3r8LM28APcFZPyTl1bsa5j7cIVrPw=;
 b=IaAbndu5jQ+dHg8e/bz27QgfK4MaVkoCl/x1VUmyUhQ57Ltxx2Xzpunro5IAyXpx6K
 LREo9oci/9MpNvzLaRaoQRrZbjHu0ziKUsQIbmepq0Ckb8e6qll9yRRxoQOXI1gmTSlU
 KV0tVvRz8uSh8U+vM3oBQTurhIFaCI5UcFnx7Gur26c4yLWsTKUEV94xkGW5wFgTm9yZ
 siDt9WJ9Lb1ElQQFZhpoIzjfJuVESOdb0dUEJ/i+0eA3zyYtpgZmTofF5+jwIu/Ir+to
 xDGgOWqcPZwcT+NuuFNtQIhhey/8pYkiTfU4OTkzpIANWOrAuJxCLVBgFgT7eyaBZIlf
 R+JA==
X-Gm-Message-State: APjAAAUn0+C21Wr5NmSra5iE4YKE4VDUofKmXirlXwGwezjD7ppyTZKi
 H1nYGfsib5+EXqvodx41Ifb44Q==
X-Google-Smtp-Source: APXvYqwnwryDuYaJoeuBpmKcv+V+hzo4KNfAncAHXRXUeIU/yiGJDhxdzCOlWP+yC+Do3J51O4H8Pw==
X-Received: by 2002:a62:70c6:: with SMTP id
 l189mr49304294pfc.139.1554973242222; 
 Thu, 11 Apr 2019 02:00:42 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m2sm64317272pgr.74.2019.04.11.02.00.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 02:00:41 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org, gregkh@linuxfoundation.org
Subject: [PATCH v4 0/2] tty: serial: add DT bindings and serial driver for the
 SiFive FU540 UART
Date: Thu, 11 Apr 2019 02:00:26 -0700
Message-Id: <20190411090027.8670-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_020042_910538_F00D80C6 
X-CRM114-Status: GOOD (  10.49  )
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

This fourth version incorporates a few more comments from the lists.

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
 drivers/tty/serial/sifive.c                   | 1067 +++++++++++++++++
 include/uapi/linux/serial_core.h              |    3 +
 5 files changed, 1128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
 create mode 100644 drivers/tty/serial/sifive.c

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
