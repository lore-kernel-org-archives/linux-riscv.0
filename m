Return-Path: <SRS0=7WNQ=OX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141F4C67839
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 06:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D80F820811
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 06:21:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZ7biJ5q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KRuGfZZv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D80F820811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=sHqkOo7px7nSz79fs8BjHbkzjBk8Gp5qBuDa93KahjU=; b=rZ7
	biJ5qdaKXmBZdeW4xqZIpVwRBP6uUez+Csd1fWvQ0ndkSCUABqT2EDxp/LU6m3gqvJWol0bKHpbIm
	NNohxPGjrtUW/v3+LKCtP2oHXlcJXps1NkjHgsD3MSnJB0fiwc9mAf3A+p+8MhSpV1VeCerWUZem4
	20OqjQ0oTgpvAYof5PFCQhqvXHWFqkW91cCL27Wv+s8SqdQE24rQeeJCtkEgBE+x9LtDUyx5JMVX/
	UeOSVgOkzExQEXeGCRT+y3OBWbdetxjKshbM3FVfLv/kJk7NZAULLAzfF8nyqERqgKS5AnyXTGAGj
	bMQ4YVCBJhp2HADUF7NkVj+vI66LPeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXgqr-0003HP-1M; Fri, 14 Dec 2018 06:21:33 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXgqp-0003Fq-8V
 for linux-riscv@lists.infradead.org; Fri, 14 Dec 2018 06:21:32 +0000
Received: by mail-pg1-x541.google.com with SMTP id g189so2215025pgc.5
 for <linux-riscv@lists.infradead.org>; Thu, 13 Dec 2018 22:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=jhPuMjuWmZy0Cnza8feEXcHf7PUqiv75e7osHKP1vKE=;
 b=KRuGfZZvjaSJH5dZFYx4KrMDTfkCldom2MtPqxZ+Is5hVpGMFlfEGf/QTQwDiE0Ml0
 wwDlyhhqHkb3PGzU37D0CzzpNri6sz+Mk4fwdQOFoS3s48TSNqfsXJhkTNjPs/xAKd+D
 g8qZWUublVp7sgIp3tt29+iyhWn5Y8q90Vr3l06D9INCfP6hLIn5u+KakBIdZZ+rESnG
 7qFgw0h0oFZu13MZB9YNxBTz/0+G3+y3yihwoFsZ7MBOo0MueCEsib42HEEFFcTCyVOQ
 SaaDiJ4W3kINoqazroiXCXypcae6Sa/eayxxnAkCmVY6jBZqCnQBhibRwGO8BkXZKXqu
 FK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jhPuMjuWmZy0Cnza8feEXcHf7PUqiv75e7osHKP1vKE=;
 b=Vr08ghaIT3vblNAUGoJyzcFrF3w/M8FsND+nAX2HtbUPNmPnk0pqw56QNO+3bpfXds
 +L96K/bIQWRz3Tn4O9AOe9FLA/+y5K8ZFPwkRrVhyX8WEH4Qqt8AFFsXjaw7KtHVHysI
 0dNKpSHjXxOlTm/B8MFqpQ8w88tZEY0aakMoR1CvWIHiIpoiXuBaqxSzOSJv91fQLfTA
 8qvj20cpyVksCzZfPCn7IQZaEQunBHj96CR6iO9TRl6ANuY3R0VVcnrBaLYOkIcYvxQZ
 MqtSg5ZfCEWRcnbVx2nTRYu8hwlaCa/stDnDRk2FxKPvH7Rv8kdCg+mzW5Eilh3V4mrT
 XefQ==
X-Gm-Message-State: AA+aEWYSABgAcJpt3yXNyt38ZaFrB+/JbytKuZbjk8n9S24JqgTB73D+
 Ch9Vnbbwu2s5oUZyECgx5SJ5gQ==
X-Google-Smtp-Source: AFSGD/XaIFQXj6O2MKM0S1rfoTxMlT1toxiF3wLN8tnaxL8ykzXbiFBmPCb1qdrRBg8qd00tdYosfA==
X-Received: by 2002:a62:ab0d:: with SMTP id p13mr1668073pff.211.1544768480344; 
 Thu, 13 Dec 2018 22:21:20 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id i1sm4841703pgb.46.2018.12.13.22.21.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Dec 2018 22:21:19 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [RFC v2 0/2] PWM support for HiFive Unleashed
Date: Fri, 14 Dec 2018 11:50:40 +0530
Message-Id: <1544768442-12530-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_222131_309784_756D2162 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds PWM drivers and DT documentation for 
HiFive Unleashed board. The patches are mostly based on Wesley's patch.
V2 of this patchset incorporates below items pointed out in v1.

V2 changed from V1:
  1. Remove inclusion of dt-bindings/pwm/pwm.h
  2. Remove artificial alignments
  3. Replace ioread32/iowrite32 with readl/writel
  4. Remove camelcase
  5. Change dev_info to dev_dbg for unnecessary log
  6. Correct typo in driver name
  7. Remove use of of_match_ptr macro
  8. Update the DT compatible strings and Add reference to a common
     versioning document

Yash Shah (2):
  pwm: sifive: Add DT documentation for SiFive PWM Controller
  pwm: sifive: Add a driver for SiFive SoC PWM

 .../devicetree/bindings/pwm/pwm-sifive.txt         |  44 ++++
 drivers/pwm/Kconfig                                |  10 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-sifive.c                           | 229 +++++++++++++++++++++
 4 files changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
