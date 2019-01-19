Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8351C6369F
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A2B42084C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 05:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NPvt8FCX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Abbiyo33"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A2B42084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=TGxwxFuFqGUpnHNcXLel/CWI2N7tEOonCbpHeaeOf5U=; b=NPv
	t8FCXevaTubhK7p0cSAXwxDFlRTCyBs3/rI/GeZbf5c0QIDAT4dO+oAjPVtCHJmrup6hlJHz+EDkv
	iOhUtSlWWbRq4shNazPJZ/HKmC8agEt2FDXLcTjXnvaieA1w2+bv7C/kkoqTLt4wM87rbxs8onkpj
	QPS5Gp5yZ+CViKZWwAl5pzPQKGCsNPlqGr9ouy0GabN98rmsVS3/Ehc5/GosYQOaw7qDTx1O9sLAz
	aDqY+0ixGsJNQO/GfnprQWIi8VEIFW1q/cdzh4PLzp7h/smGYQQN518Pkjrnlrqz0vXq6neKnJ4mj
	8twjznxgv34PVYdQBekTSm1EiqZF4gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkjcb-0003Ht-82; Sat, 19 Jan 2019 05:56:45 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkjcX-0003HV-UY
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 05:56:43 +0000
Received: by mail-pl1-x644.google.com with SMTP id u18so7277853plq.7
 for <linux-riscv@lists.infradead.org>; Fri, 18 Jan 2019 21:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=sQoivAFbNDy6muWIVQt/y3vdJRVoP20aiW8gxmhC/Eg=;
 b=Abbiyo336l24wipav+ZxwC19i158Qe2M89QOsU8cICHRf9im14FWdTdwzrJj2QRuUf
 qHAnUDQs1GWIM+kwV+l9Vu1QiSRImZJQMVTCYCUlk1/dfdJ5HlPJhZYlt/uyIRnfTxTc
 1mU3PmS31ZNgj1u3kUjCZ+ts/lSKt0P+3uNBYPaV/bKFIWfV36EM/SkwgZBPzbuxwJV3
 Y7UU0WBnlU3qEWJjCyUHx//1MPmCF+zVHAFOMZt3i5/hyPYWNmLEh0SJZCyC3a002GPi
 vGY8HTh9C4L+uLtZScU5gfnI7jb2Ix7fP2tz3s/IupOHnwy+QeCmWkx/Cshxub2DG0CI
 gGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=sQoivAFbNDy6muWIVQt/y3vdJRVoP20aiW8gxmhC/Eg=;
 b=uO83kMcNEd4A7JXjRYjpkTvMpnh+5dsYN4DedY2veyLItLRH9pXVvb7D9Za+a2np2F
 Bugocbo5WLuESqD0XwUmclklowBh9XtoYsCYwojAvVjSW5gTdvyqtBvSMh1Ji2yQbD0g
 UvaOz6YfxsjuMpWPlBIkNgaYHjZ9XNbaACmbb3Cyds5SXmz+y7HHAykfgMXo3bErMmg3
 LuK9HrLhkdwKI2rxoVFMzk5e+XFKqaAml7TECY4tEhi/NR1DK9mpMx9zie69FEu4TO+3
 qjS9TQ3pCqujaMF2etQo7TB7z+QDC0xhSbFuUUjYElVgOJkIffu/BR30D6sSslRepT/d
 Zu4Q==
X-Gm-Message-State: AJcUukeJ6C1wJ7OmGqon5BK9bCcKv9cHhF13rPvM43+F5i1jbxKyqI1H
 JTopdBxUkmbTzGAnvhn2lEWJZg==
X-Google-Smtp-Source: ALg8bN5r2zDbLwk1v1+PTbuS+mSZwcs2QRA2lm1fnlHMIbAP/DhbWNLuWfx1TZ3q9I21gjSKzYaRfg==
X-Received: by 2002:a17:902:4225:: with SMTP id
 g34mr22348699pld.152.1547877400048; 
 Fri, 18 Jan 2019 21:56:40 -0800 (PST)
Received: from localhost.localdomain ([49.207.51.221])
 by smtp.gmail.com with ESMTPSA id c7sm9295535pfh.18.2019.01.18.21.56.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 21:56:39 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v5 0/5] IRQ affinity support in PLIC driver
Date: Sat, 19 Jan 2019 11:26:20 +0530
Message-Id: <20190119055625.100054-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_215641_991634_D12F9D43 
X-CRM114-Status: GOOD (  11.13  )
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

It gives mechanism for explicitly route external interrupts to particular
CPUs using smp_affinity attribute of each Linux IRQs. Also, we can now
use IRQ balancer from kernel-space or user-space.

The patchset is tested on QEMU virt machine. It is based on Linux-4.20
and can be found at riscv_plic_irq_affinity_v4 branch of:
https://github.com/avpatel/linux.git

Changes since v4:
 - Use "if (force)" instead of "if (!force)" in PATCH5

Changes since v3:
 - Dropped PATCH2
 - Added PATCH to not inline plic_toggle() and plic_irq_toggle()
 - Moved PATCH3 changes to PATCH6
 - Used WARN_ON_ONCE() instead of WARN_ON() in PATCH5

Changes since v2:
 - Fixed incorrect address of enable registers using sizeof(u32) in PATCH1
 - Retained comment about need for locking in PATCH1
 - Split PATCH2 into two patches
 - Split PATCH3 into two patches
 - Minor fix in commit description of PATCH4

Changes since v1:
 - Removed few whitspace changes from PATCH1
 - Keep use of DEFINE_PER_CPU() as it is

Anup Patel (5):
  irqchip: sifive-plic: Pre-compute context hart base and enable base
  irqchip: sifive-plic: Don't inline plic_toggle() and plic_irq_toggle()
  irqchip: sifive-plic: Add warning in plic_init() if handler already
    present
  irqchip: sifive-plic: Differentiate between PLIC handler and context
  irqchip: sifive-plic: Implement irq_set_affinity() for SMP host

 drivers/irqchip/irq-sifive-plic.c | 110 +++++++++++++++++++-----------
 1 file changed, 71 insertions(+), 39 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
