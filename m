Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9B0C64EB4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3A502082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8QSQ48u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="lFKCRrZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3A502082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=3X9EB34WWdfVL1L0l+zV7/qzbOayEmHVBaiZPm3rijU=; b=I8Q
	SQ48uqLZw6mxSTsOzeLD4QqJ3ELF8zPAHH5cW9s4j7TLkyxsnLJBnGpmBZ5Mx2b5za36ew1cVATCv
	O/bbG2HEv25wl93ad+lkcfD6NeB+CZNGp5t3Qd0svnILp1eMnxX2CajZ8ydt7YpMrp7Rtwkgfcwzl
	Vpo+Qswuodl0LCD0qJcAsQYADu1OVGYX3zyIYZuW5c4BtoSC7CFH0iXqj/U+KVy4J2cKHR8CyYmFZ
	AcO/CH3qyrW6jjHE6CPpeZYlOujVYEi9sauSTZVK6i/9FAWtX1GEP4e0OlotMJRBDgC9s4x7txhP6
	qpWIKdP1NCjnlHXfwmndjWByOnU8BMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSdkr-0003gx-5K; Fri, 30 Nov 2018 08:02:29 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSdkn-0003gL-8D
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 08:02:27 +0000
Received: by mail-pl1-x642.google.com with SMTP id a14so2393452plm.12
 for <linux-riscv@lists.infradead.org>; Fri, 30 Nov 2018 00:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=INN3jsKRLwg8ZxL20lAb8hU6CDa49MS7o8/TtSx8NEw=;
 b=lFKCRrZU0ml5pSywxt3O2/vbWpbCYCSLT2N2K4GZCteoayWLUYR4miV6gs2jSF138F
 wtEB3MCh8iWfllnURakdBMmdjRoQ3vuoKs4dGA6bUWLYV77NTe937eUf2VeZ0yHXk6Ta
 Q0qE5Bxd7+1XrHj6wC5lA/Hzg2NCj3OJsn7wBY4uoThcjHvt90wPpgUIRLYkaJXJlRKF
 pWmx5Nd48xiNR1J1BFn/k2HAcY2JXRxBET1vsEpliLGMq+fSV9InOmRz7CLEDLil4/Wj
 ioWz1bjW6aWaQ1oEJrpTzVj+dLS84yPwuYAfqdzG25cHoPpWxkHgtpjHkpksO4RTWANG
 uqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=INN3jsKRLwg8ZxL20lAb8hU6CDa49MS7o8/TtSx8NEw=;
 b=aho4ZJ1sVm4SDHVUs9sN4KFiZ1LKFPGIr4Dv/4Fb4iKquaQBvvcDiYOqi269dTtVbH
 YuEe5Um/rtp7ZeYDVc3gTX22dwOpYCM29sl8Y8jmX01JFCCsp72WAVujLq+UJGXU4y9e
 EQjurnCU/v1zOnjb9h6qZTateC+oWgB+V4s0dNLdQ9UBUXHID067MgXGypoNYA8YAf7s
 eOx/kX5gGcviOTEcrAoy46RYmdIuuggf1gXPb61w99OxuwbrFG1urcCPbWwvDQJZ+MWn
 jpkjn5+5YQxnEqszf8MftOpGI86RQIPgqou+FxmoUJAQcuTmDE4crdjcB94/G0vMFoAk
 VIXA==
X-Gm-Message-State: AA+aEWZ7zABIERXoCed6Fg9zpOZPdo3xNHO4bBtTLyTlVz5Uy15jzZ7S
 D5b1ZKI+19svFPWqAS61b1cujg==
X-Google-Smtp-Source: AFSGD/Xv5ZCnP0BwNcJNz2N2KU9FXaJGaQVMlUyZFu0QfEFjelerL8044KOCfEXFtyNo9K/rXcpxNw==
X-Received: by 2002:a17:902:a710:: with SMTP id
 w16mr4598243plq.95.1543564934242; 
 Fri, 30 Nov 2018 00:02:14 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.52.208])
 by smtp.googlemail.com with ESMTPSA id
 q187sm19218333pfq.128.2018.11.30.00.02.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 00:02:13 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v3 0/6] IRQ affinity support in PLIC driver
Date: Fri, 30 Nov 2018 13:32:01 +0530
Message-Id: <20181130080207.20505-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_000225_293410_E570E623 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset primarily adds IRQ affinity support in PLIC driver and
other improvements.

The patchset gives mechanism for explicitly routing external interrupts to
particular CPUs using smp_affinity attribute of each Linux IRQs. Also, we
can now use IRQ balancer from kernel-space or user-space.

The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc4
and can be found at riscv_plic_irq_affinity_v3 branch of:
https://github.com/avpatel/linux.git

Changes since v2:
 - Fixed incorrect address of enable registers using sizeof(u32) in PATCH1
 - Retained comment about need for locking in PATCH1
 - Split PATCH2 into two patches
 - Split PATCH3 into two patches
 - Minor fix in commit description of PATCH4

Changes since v1:
 - Removed few whitspace changes from PATCH1
 - Keep use of DEFINE_PER_CPU() as it is

Anup Patel (6):
  irqchip: sifive-plic: Pre-compute context hart base and enable base
  irqchip: sifive-plic: Add struct plic_hw for global PLIC HW details
  irqchip: sifive-plic: More flexible plic_irq_toggle()
  irqchip: sifive-plic: Add warning in plic_init() if handler already
    present
  irqchip: sifive-plic: Differentiate between PLIC handler and context
  irqchip: sifive-plic: Implement irq_set_affinity() for SMP host

 drivers/irqchip/irq-sifive-plic.c | 143 +++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 53 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
