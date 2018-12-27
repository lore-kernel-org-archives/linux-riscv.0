Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBC4C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEBAD218EA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZ7ALOpP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="v4sUq0s1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEBAD218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OW1t4Bg21/udMjBstVyhpFLEzLH8qJZhGSVBjNhoiDo=; b=dZ7
	ALOpPC6m/TZrTTXzv9xx//5awhi598VYadI9bHfNoyQO4DM8pYa7DLw04iDNaDeANGtFuqC52q7JW
	k3tAsR3SljfkBb3WXTKdbsGWV3KkjIoXgeWV0rxLRRbKQIJBhoLHjwMD4M9PX7vDRNdLmgB7QyraZ
	tqzTObRHjFPMeTIJAgIx5Zsi+Ck3vYGigPAmVb2cx1STtTJrRaHtHXRh2xGqmPx4WHPWsTxXToJZd
	M+oInic+inep9d5mK2tpbk6ZFleirpjeDLpogEHraLYV352EVQX9ORHyqZyaqfneSkKhcIqPD2vYK
	XhBSUvx2OX2IEhtAYYq7P5EgrweUoUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcTgf-0001me-TZ; Thu, 27 Dec 2018 11:18:49 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcTgc-0001lH-L5
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 11:18:48 +0000
Received: by mail-pl1-x644.google.com with SMTP id p8so8677645plo.2
 for <linux-riscv@lists.infradead.org>; Thu, 27 Dec 2018 03:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=djb8MENL/623mqGLQLtq4KrCkJHOJsxRY0UHXKe8Sak=;
 b=v4sUq0s12CeTvwimAYl9h4YlypmX5EU2jDU3hkfGx/2cPtHtnt2IuAgStbbF0JOBE/
 lsbH6bc2mtlEZVVv2z8oWiKrXzeC+dqGF+94/tPACwz91yuCJvfm9S7xV1kK9pNUt9Pm
 kTOWxWNBSGlkNE+9C8rK5weVpd0OVF07XqTiJfXoW1ACOdmR1dBbM5lU3JcHQLMd0t/b
 L14xHBTfHopOAOJNaYl0fS8+7ovSbnOI7NXBI4v5rM8g/0yAlLAxbltgn1rYcu7yb50J
 FpqsarJX0zsPSMXlxsOZXBzIB6fdvs/cmiuRya0NobPMj+UW8vmr/PkBIgNNYO5iigxx
 kbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=djb8MENL/623mqGLQLtq4KrCkJHOJsxRY0UHXKe8Sak=;
 b=iZ7TR3LqRIu4JbnEh92j65QbQgwzk1GzNm+A3RwQh5w2BJuoOZc8ciiOW7by/735kZ
 jboAb/ZyDZkOm1JNGdcbBSN45e0Ld4A0ULJxU4pTupF3hT/UgSLucqDb7u+1JPCMJp+g
 ZV9ii/Q+qwP3SUtB5SA+wly/6VEw0nU8lfNTubPjygO8H6nryptjGcR1hNBOe7zdsm9u
 7UZVd/gSwqEOZ9uA0DA0qcsThGtu8s6kxhbofazXyJxoeNTXwgktWy7tJRi3RJeEHJAh
 whW/2QSFVfy48Wan9SV/K9VjRCgjF6f5ud0E2h4LEDLAK7eMoQkSO4xAW35Ztt6UpFax
 WMJQ==
X-Gm-Message-State: AJcUukcLje0NfVRJ0DH6QG+ZPGLNXTP6owhWnLCJHCyUXLRRYjdKpnAW
 n+YFBBmDCvYijgiPctcY/JD57Q==
X-Google-Smtp-Source: ALg8bN6sSH2nHZighgs8yjW+ZKAodEkWhcq8w0DJiA41vf103STRAl+YMj+ZhYXXjeNvS+DJ/UJhSg==
X-Received: by 2002:a17:902:7687:: with SMTP id
 m7mr23084934pll.187.1545909514921; 
 Thu, 27 Dec 2018 03:18:34 -0800 (PST)
Received: from localhost.localdomain ([106.51.18.57])
 by smtp.gmail.com with ESMTPSA id u137sm66830105pfc.140.2018.12.27.03.18.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Dec 2018 03:18:34 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v4 0/5] IRQ affinity support in PLIC driver
Date: Thu, 27 Dec 2018 16:48:16 +0530
Message-Id: <20181227111821.80908-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181227_031846_759902_C779F857 
X-CRM114-Status: GOOD (  11.46  )
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
