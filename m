Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC45C56201
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 10:06:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F3420729
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 10:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q81lWLcv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UhLRLR89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F3420729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPRP5q9LEwx2OHivm0c3EuoDWunL3J4zeuNhn5vlHaM=; b=q81lWLcvIK9O4i5FGJ11HjVf0l
	2lxoh3PV9HQzS+JB8S63x25Q9wiqmyWET8CfANppGY6OBQuEwuxiywng+u40Xu/LXETKXJePDNSKL
	wReqwrYK+NgMMQjS37muwIM445l2/Sb/Mct6yJFF1uitf1QkqCodSCS4E57fXQ3FQqCr9cBH55ZLH
	2OEH8Wk67YgF87NAelue6beSCYN5e75G7n0BINZeAdHBoSDerlUDJPqb0ifS93mStOMBUxDcqZvS/
	qV1bfHOtT1vh/0c7UyX9UzNn2yj6VnMOpEhYM1waqJCvQ8n8pe+qM4uoyazoc+rmEq0xN+dysjGr2
	edp5w3qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcn19-0001JS-9P; Wed, 11 Nov 2020 10:06:19 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcn15-0001IG-B4
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 10:06:16 +0000
Received: by mail-pf1-x441.google.com with SMTP id w14so1310273pfd.7
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 02:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wjio2OQJw8REk5ObwaBDzXaM2/PC6+LMmDg5VRFzBug=;
 b=UhLRLR898+JF+5m37PQQQ9fie0SvWmdUWsF4dqAxZxgxxLPrm/BGEMC2TfOF+FDcrK
 5ke3OTdnw0s7J3rz6KhfZbo1S82osWZU34YS8fV6S8A0QZvsquXkROWBJ9hHztAOm9eO
 W1cRt7oknvnYB8DjzLTUDsFv12TvMn/ZTPei+M9yd+ytY5tbtXLY7Kqka1objq0qLgt4
 2zG0xamj+1g0ltdRRjq0cORNOHDIv5F9X3h6sgQSgDkSOtZul2gdPjclCA0lYI/jv2C5
 TYzRHZMNmncgoUGvx4PU/yBjdAMWxnJFqInPtbItAJzzF0tdcy0qOTVPIW5PTgIfaans
 BzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wjio2OQJw8REk5ObwaBDzXaM2/PC6+LMmDg5VRFzBug=;
 b=oBYAsJmSLPyneqb0BDfBcF726nUohCoeV6h06Q/1nKP9vfK00OQcQ+FSGNGdAnm6tq
 38nery9PYBhvF+0eI4qGTfOXTdBVN0153lV5mQYLmum6vUyMMPPK2MzY2SvSI1S3lcLe
 HxZBjxwAoKO3EFwxBNs0mMMl9ToLD6n+IzOBzMXkDi/vqkUEmK0/VcWwWr8ifutoIqo0
 SXoxkdb1onTwxAuDrntIttY64azJoWwzHB0vFkM1tn1pE6Q6XlCtkPJ1b6ra/9lKPthJ
 bYM3LGsNraB9NkM1ujuBeED0lhiD9r3QWUwgsPVf2DEqxmS4bdlDKKf8KJ1FH/9fvuE/
 Tr/w==
X-Gm-Message-State: AOAM532snizDz2L0LunvKnekwpXTrYdDuBkLEsg7/NCd4N1itL6RwMtv
 RQC01VLhdkcBZnqV8F8TF6lZRA==
X-Google-Smtp-Source: ABdhPJwvn5g6/MaTvNdSVjL9J92/DK1CBp3bqzQoaUCBlm9kqxW2nEWmVgzahQkg+2XDm7OSY917bw==
X-Received: by 2002:a62:1991:0:b029:155:f476:2462 with SMTP id
 139-20020a6219910000b0290155f4762462mr22921555pfz.43.1605089173193; 
 Wed, 11 Nov 2020 02:06:13 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id u22sm1872801pgf.24.2020.11.11.02.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 02:06:12 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/4] clk: add driver for the SiFive FU740
Date: Wed, 11 Nov 2020 18:06:04 +0800
Message-Id: <20201111100608.108842-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_050615_697482_91D9B09F 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a driver for the SiFive FU740 PRCI IP block, which handles more
clocks than FU540. These patches also refactor the original
implementation by spliting the dependent-code of fu540 and fu740
respectively. In v3 and v4 patch set, it fix the wrong clk enable bit
field which reported by Pragnesh.

Changed in v4:
 - Fix the wrong enable bit field shift for FU540 and FU740.

Changed in v3:
 - Fix the wrong enable bit field shift for FU740.

Changed in v2:
 - Remove the macro definition for __prci_clock_array.
 - Indicate the functional changes in commit message.
 - Using option -M and -C to create patches.
 - Rebase code to kernel v5.10-rc3.

Zong Li (4):
  clk: sifive: Extract prci core to common base
  clk: sifive: Use common name for prci configuration
  clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
  clk: sifive: Fix the wrong bit field shift

 arch/riscv/Kconfig.socs                       |   2 +-
 drivers/clk/sifive/Kconfig                    |   8 +-
 drivers/clk/sifive/Makefile                   |   5 +-
 drivers/clk/sifive/fu540-prci.c               | 586 +-----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 122 ++++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 .../sifive/{fu540-prci.c => sifive-prci.c}    | 499 ++++++---------
 drivers/clk/sifive/sifive-prci.h              | 289 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 703 insertions(+), 873 deletions(-)
 create mode 100644 drivers/clk/sifive/fu540-prci.h
 create mode 100644 drivers/clk/sifive/fu740-prci.c
 create mode 100644 drivers/clk/sifive/fu740-prci.h
 copy drivers/clk/sifive/{fu540-prci.c => sifive-prci.c} (45%)
 create mode 100644 drivers/clk/sifive/sifive-prci.h
 create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h

-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
