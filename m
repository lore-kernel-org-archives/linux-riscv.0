Return-Path: <SRS0=HMje=M7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CABECDE3D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 18:49:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA9C421470
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Oct 2018 18:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JA6e1qOv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="b05AGQAI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA9C421470
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zXNEPb0G58/NwCfnirDH+rwgcvKHRCyhKfSVRnLMX1Q=; b=JA6e1qOvLki8KB
	+BJljmfry0o/rUbTNnFKJQ7o4DJm7o9Mqim3ZFxRDt9eb8vFoVRe2cFxOANGf4jiiSWYYU1aiv/Ch
	9+h2jmEDUYFtWfMgLaz6RTG9qxrEGBbnJHq3l2CHHy2FD8b0a1mAhSV3JQtK154KabiAi6fKtm7TX
	kqpHK6/J4VSMnceGQhoaHUbKZJe8mviqydnYaleRjZNjw1M8Lj6xkB8RGoV2M0rOuObUB/eT0T72Z
	yBZlaGprp/YN+O7tan2I0xpBCk3V3OrX4yy7Krdha/Tw25Gp7WKsp7rLi1gJOhJ+IbTiU1OAsZ0bd
	qrSVwhozAZkMyXao1o3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gDZpU-0002VW-MN; Fri, 19 Oct 2018 18:49:00 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDZpR-0002Sv-Kj
 for linux-riscv@lists.infradead.org; Fri, 19 Oct 2018 18:48:59 +0000
Received: by mail-it1-x143.google.com with SMTP id i76-v6so5652966ita.3
 for <linux-riscv@lists.infradead.org>; Fri, 19 Oct 2018 11:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cOR2IJIowt4OkXEi+YRhZzCYyNynhKMj+YhQKSHNISY=;
 b=b05AGQAIPo7lxePa3iJZHr567v2l0b1Ldjzm9JRACleC3LvzBJ0xWPmsgxRnryqdBt
 YeTO1tYInccCiJaaufah4L8Ved1wewZUMd0DQ81EqJuvq5A/fdjJC+Sbs73X2aULDE89
 PUZVsd1a/XQNYvxkjkaYk+Iq19TgsRJWUO2Vzyu7eBcd0ZMe8vo/IHylolKsWc6V0xVO
 2tag9wlOooNX0JQcRYvl+v7PCuctHV37IvmZAsa0nlhFRWEiZ7cjS43PiqXCSPXbAST3
 0ahwt44fYM9F0VvKyYxgyqfEJQE+pIWSzeXlPp0tet8m2A+Z3bkBQrm9rmfPQZbM5mfn
 QWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cOR2IJIowt4OkXEi+YRhZzCYyNynhKMj+YhQKSHNISY=;
 b=lFguV5qpqX7qI/f6KpT6iewmbPBoaX6hrjoIWTA3Na648x869chu+GLb0o/PgNgjCy
 mixw/3zuUKGx2x7aYDRhrOkc0lScP8qC7bwMG5nyWrExczGViIKX+HTZ1a0UnOJqH3SV
 oFDu1hzQ8tUM4dljOEAPluYRWA4nG7USQjKECrkUoiNK1/0SvBFJhkHFp6TakiqVXp0R
 0ZZ1fKCP/MYVwYRHSabfjjo//k0/VDs2sbTxmSRVy3Ly4+dEhJu2vClKNxaUMmnfUMqH
 zcxKjL8j5n0THgWuCDZWubNTiOxF44ScVP4hbfsyq63Ic8Oh6uT0xu27NWL+1HxonUw4
 vxqQ==
X-Gm-Message-State: ABuFfoiIFW2R+IhN+mVF81TOpzIqnWshPXm9LDf5XDDbYhKlah56MePX
 +sL0gp4CCDBP0/5iB0+N7sQMWQ==
X-Google-Smtp-Source: ACcGV61aKh+F0b/UL3DZbcm7cPaAlkxEPwwda6xhyIOsXCU0duUBfeacPfegSOONACojQkJiHC7YKw==
X-Received: by 2002:a24:f884:: with SMTP id
 a126-v6mr4051948ith.113.1539974924382; 
 Fri, 19 Oct 2018 11:48:44 -0700 (PDT)
Received: from viisi.dia.dnvr ([67.133.97.101])
 by smtp.gmail.com with ESMTPSA id f9-v6sm7528873iok.25.2018.10.19.11.48.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Oct 2018 11:48:43 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-serial@vger.kernel.org
Subject: [PATCH v2 0/2] tty: serial: add DT bindings and serial driver for the
 SiFive FU540 UART
Date: Fri, 19 Oct 2018 11:48:26 -0700
Message-Id: <20181019184827.12351-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181019_114857_685969_1986D630 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 Wesley Terpstra <wesley@sifive.com>, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181019184826.bTeHZDRZ4NWCvS4JebxbqMqgLRTSaRjl-t9IR4KmLFo@z>

This series adds a serial driver, with console support, for the
UART IP block present on the SiFive FU540 SoC.  The programming
model is straightforward, but unique.

Boot-tested on a SiFive FU540 HiFive-U board (with appropriate patches
to the DT data).

The patches in this series can also be found at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v4.19-rc7

This second version fixes a few problems identified by the 0-day
build system, mostly focused around remnants relating to
CONFIG_CONSOLE_POLL, and a missing spin_unlock() in the ISR.

Paul Walmsley (2):
  dt-bindings: serial: add documentation for the SiFive UART driver
  tty: serial: add driver for the SiFive UART

 .../bindings/serial/sifive-serial.txt         |   21 +
 drivers/tty/serial/Kconfig                    |   24 +
 drivers/tty/serial/Makefile                   |    1 +
 drivers/tty/serial/sifive.c                   | 1067 +++++++++++++++++
 include/uapi/linux/serial_core.h              |    3 +
 5 files changed, 1116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/sifive-serial.txt
 create mode 100644 drivers/tty/serial/sifive.c


Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Wesley Terpstra <wesley@sifive.com>
Cc: linux-serial@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
