Return-Path: <SRS0=t+O9=OG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0462C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:03:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7469D20873
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TewAkrhu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Mi2u6F64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7469D20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zVRN6948lGH0FjfHS+UWfzaSLnA0VU8sh8Nz7GMoooQ=; b=Tew
	AkrhuYrpCp5GhvTRipJJdsjYZTUvynm607Rc76SngWtZO+QVZfx9NSFPKvIA+iE1q8ciop9DaGP2t
	FvnO7NrbAIblDDvq5LwZPhXtn6Xzl4UUxmBp/r61Ag6hM55Y+7GUyAFpOTF0HC8RbFjblJ1c3VAym
	7oVgk9IPErbn2R/ofOgMUGBU0gY7iSBK+K3k4coKULanYARauJOA3telh1tla1UD3/qYI/1Rvc96g
	tY2z9Tkw24RHvN6Bd50NAPvIw2UnCEspMa6v7wD0fM5JxKDsoGKZhU9I6JCOrsmGV98veubMLa6P/
	S7h6qvdi53USYJjVdvXXpHD2c51nelw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRaDe-0005v0-Ux; Tue, 27 Nov 2018 10:03:50 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRaDW-0005ok-NM
 for linux-riscv@lists.infradead.org; Tue, 27 Nov 2018 10:03:48 +0000
Received: by mail-pg1-x541.google.com with SMTP id 17so7640797pgg.1
 for <linux-riscv@lists.infradead.org>; Tue, 27 Nov 2018 02:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=zQclvUuAWO43QDDHbS+I1HAFxUvaKASGir9+ioQf6KA=;
 b=Mi2u6F646NSMHZe4zbEJMAL46YhGacWYD+Vmg9zVt8AzLl/c/UvEXpYR94FzTGURIy
 NgtYyzXIi/oW77XavD2uVdBHd7y4IIyM8ak4/O1hFwuWDm9KXgwqMyrzZiY1pyoIhst3
 zjC2oxM8rrvhSURijGROXYT09YXqx1LWqCiMp85bAcr2dLV5XTZDMCI5b3YNf4uCXlrH
 48mDmYuRpCmMafK/ezRG8zt8xjjLwEVKQMLhJqO39ypJzjTVpjOe1cxGkFy76LFOMps7
 fp+Sw44j/89CW0g7xeWqAUFMQd2N4+kaRFz5B+hfvP+JD8YMKQJzXb9R29oV9/3krRiN
 /rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zQclvUuAWO43QDDHbS+I1HAFxUvaKASGir9+ioQf6KA=;
 b=bNLTy95UCuV4vLBONGr4Dq97q3AmLNkyNXwx+TahMy3GSjEyhNSkFu2px3n4hBowD9
 vFF3uGHFXpghNeDLgA8WrZ0vzqgRp2Tiu4MsqEP/DEbx+rK6bSPoSJH5Hc4v0vFrvyQf
 cSi0f/xbeL4W5FJZE0OoIBCwLc0vPeiVyQ6cmtCY2DumeOn4DH/xRwBelFktsGIvuGeP
 vgfNMqmk5hoxAOzABJVVufieJoXp3tBxCmO9o+C4UOw1IasiVsTdLScdE1Ejr6HmAKGu
 gVRltfmflLbsv3kgI4jVjX5R8mQhQCkqIhpl17bIy3yK+WNYns3nfycUs/cj+Vsq5G/f
 f0+g==
X-Gm-Message-State: AA+aEWaUyBUEHHB5NXK1wUWjuOlOys/IeIpyziKU4lo/o0M46VlE05cj
 9VrT3i5XrGniOzv7Cn7WpFFoUA==
X-Google-Smtp-Source: AFSGD/UERRYpH/8nayEUL1RNFfaJHjAtC/dEpPIxVOt71LLPD8IdBLStMU3s4oP7fqTjAlOWfaUPeg==
X-Received: by 2002:a63:e19:: with SMTP id d25mr28523025pgl.272.1543313009752; 
 Tue, 27 Nov 2018 02:03:29 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.48.241])
 by smtp.googlemail.com with ESMTPSA id t87sm9519590pfk.122.2018.11.27.02.03.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Nov 2018 02:03:29 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v2 0/4] IRQ affinity support in PLIC driver
Date: Tue, 27 Nov 2018 15:33:13 +0530
Message-Id: <20181127100317.12809-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181127_020342_755709_F773E472 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20181127100313.I3WMSPAvdEXMVU5KbN4lZ2uMPEbsPMQ9dOMwJnHPdwM@z>

This patchset primarily adds IRQ affinity support in PLIC driver and
other improvements.

The patchset gives mechanism for explicitly routing external interrupts to
particular CPUs using smp_affinity attribute of each Linux IRQs. Also, we
can now use IRQ balancer from kernel-space or user-space.

The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc4
and can be found at riscv_plic_irq_affinity_v2 branch of:
https://github.com/avpatel/linux.git

Changes since v1:
 - Removed few whitspace changes from PATCH1
 - Keep use of DEFINE_PER_CPU() as it is

Anup Patel (4):
  irqchip: sifive-plic: Pre-compute context hart base and enable base
  irqchip: sifive-plic: More flexible plic_irq_toggle()
  irqchip: sifive-plic: Differentiate between PLIC handler and context
  irqchip: sifive-plic: Implement irq_set_affinity() for SMP host

 drivers/irqchip/irq-sifive-plic.c | 144 ++++++++++++++++++------------
 1 file changed, 86 insertions(+), 58 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
