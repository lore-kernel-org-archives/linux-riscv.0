Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A62FC282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE6482084E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:53:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lDETv/zf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="YTfimmhx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE6482084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bjdE554GKhH7TJbvVJjWy5pRRzTkILwCgFecHqSXNaA=; b=lDE
	Tv/zf4u1wO6nY250urwequb0ATEzxafltIHIZ3Mlg/quQdvDAcl+Lo6gCZnK553jZLTIlpYT+gYkp
	dZHbrrLBckInAciA7jMIMC3EzxMZuKUJNa8Tzd0U1dVHSR1S+ouExfMJLI9jDslv4AvtRdZOmJaKt
	U/gTH2kE3mnoMi1DIbGomyVdSaN6aNZOWKtiLSbkfRmYplEo2QJfzR75ksxjH1E2U9jjJo1OYI8Vc
	tqvV0kKu4o6Ilcnzm99jdMHRsSFYAqcNZ+Mhd25mk7jZ98wgVkSKN2HTBk+I9VdFB6Fh4ewamqXU4
	tbzG6M4ntFq2dyjt9yK6Y8+WXOvZnrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtXYd-0007Qb-KJ; Tue, 12 Feb 2019 12:53:03 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtXYa-0007QB-MD
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 12:53:02 +0000
Received: by mail-pl1-x642.google.com with SMTP id p4so1253977plq.11
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 04:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=gudcleFdCAiHH9g+9VtM4J6qJ0j7S0V6CHy56B+EYRc=;
 b=YTfimmhx4jpOCAbeeaUifO8WlUnRge+kE9030Pf7O/nvyg5BAPn51eeBPxdrAgNYK2
 FSJk//xJeKoU6MIR5qhswHQVXA+e3ZAUVllnh4FQHjNiaBpyRKo2nLPXXkKHeJBaT2CD
 yS6MoM2d2bnzC0F0ZWWJ14sDbEfIMiBSG5cBhw9MG6XaT+HyYcGFpH+IwxSVMZ3gkcAh
 z0lWnjWnHwfQuV8+sEAfcrNcw8UHIXGbp0HjHheKuMLUXHXtnn2X4kmqliuN42bLKfyC
 lnT8KdIKIhiTiQmDD+B0KGgOzpnQeLqnCvSG1fGN+Bt+AHbAhwQEOT3tm+XFqjzDL/tb
 PQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gudcleFdCAiHH9g+9VtM4J6qJ0j7S0V6CHy56B+EYRc=;
 b=eRShc4xQ3ssi7QpCkRzYrBmRC0JPuMu3wAqeuU3lNw1Y5zz0Ejvq5YR/V4UJU9h41Y
 1ERolbKYKrjKCS/QAn/sY2vKVOndHmiuHKabZfSrSTGFV8YJjH1yCm/w82d5WDtQglso
 JJpFGzbNiR6/UCrANh4zHMz536YpPbB1yfJEiNAX+MvBweNkGbOuzIpu18ldIlkOw/Xk
 QSyTFmvT4tBHSitdSVz5BXDsZ6w7Stfp/ip9S68HzL5BEQgFwE/5192BXQKwgJDhGBzZ
 uapey6FsIYflRbZqiZFftwxNviI8gzb+GlFUUYh79lCjTOh6/r9meJtyiWOrovme+Lss
 eFEw==
X-Gm-Message-State: AHQUAubYtU7AlZmDvzD2VL7o7kmlfvTrYC6B4IvdxomqUpgInUSqitTl
 o/j15R/cltYp2wQlG5zLK1GnlFvShSEujg==
X-Google-Smtp-Source: AHgI3IZsso0hWlaIOFVRBJoXBZvqmsEO+YefkciCgmtmkZ0+j6xKZih3/WqHfAJXN9AWAYiRWGvPSA==
X-Received: by 2002:a17:902:be10:: with SMTP id
 r16mr3915636pls.304.1549975979427; 
 Tue, 12 Feb 2019 04:52:59 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.205])
 by smtp.gmail.com with ESMTPSA id z67sm27894828pfd.188.2019.02.12.04.52.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 04:52:58 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v6 0/4] IRQ affinity support in PLIC driver
Date: Tue, 12 Feb 2019 18:22:42 +0530
Message-Id: <20190212125246.69239-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_045300_722138_28CBF8A3 
X-CRM114-Status: GOOD (  11.35  )
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

The patchset is tested on QEMU virt machine. It is based on Linux-5.0-rc6
and can be found at riscv_plic_irq_affinity_v6 branch of:
https://github.com/avpatel/linux.git

Changes since v5:
 - Dropped PATCH2 based on discussion with Christoph

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

Anup Patel (4):
  irqchip: sifive-plic: Pre-compute context hart base and enable base
  irqchip: sifive-plic: Add warning in plic_init() if handler already
    present
  irqchip: sifive-plic: Differentiate between PLIC handler and context
  irqchip: sifive-plic: Implement irq_set_affinity() for SMP host

 drivers/irqchip/irq-sifive-plic.c | 111 +++++++++++++++++++-----------
 1 file changed, 72 insertions(+), 39 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
