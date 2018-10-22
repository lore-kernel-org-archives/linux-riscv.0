Return-Path: <SRS0=qhrg=NC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835C0C67863
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 12:04:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F6520652
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Oct 2018 12:04:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Txk0u3nA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="kN56Gi4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F6520652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=C8kIFWGU1pKw1YVDwBKbnNtnjGWOZZ7I1fHbS5uQZW4=; b=Txk
	0u3nAmNQa2sGqMakZjHMnoQw/mJkijiAxZ0nwrYWLJKqPN+b5TK1cCj+oIw+xdj6iCUMKX3JrWRJp
	4u04geAOPWp5MHPzM60aJBu0kvSkW8/0KNqvIGOQPmS8Moy/6vmWjtOw4Q+e0oUk+RimkAooI75YE
	pjIY1Ia/fvu9DYEdsgfZ/l4SvaLh/IBDIqd2DwWq+yTRP6gKZbfA2zRhY8wpeXylFpG2LkIYElZa/
	9fAo30B9W9bZomYwAUHDpHHduagmx4SFyeoya8rjDecueflNDh/XlouSK+KteVwURKRNZkVJ8eOXf
	Sy926rtAG4FiRQM3PDO3kz4+4VxahCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gEYwA-0007VO-BP; Mon, 22 Oct 2018 12:03:58 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gEYw4-0007U3-7N
 for linux-riscv@lists.infradead.org; Mon, 22 Oct 2018 12:03:55 +0000
Received: by mail-pg1-x542.google.com with SMTP id 23-v6so18915947pgc.8
 for <linux-riscv@lists.infradead.org>; Mon, 22 Oct 2018 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=dWqYib6c7YCfkEeuiyUid02W5JbWuq8jXJrrJ2nv3tM=;
 b=kN56Gi4O7/FFa2Xc//BlTk+VZ0+ZxduRW9DN3Dd53WYr/HYBuvZ4EEavfu3eSh1or3
 vc1yIfpRosWXeT6rDEJwKWOcCXREstmPIHvN+A1eVBbik0fHkwqxx7KFXJbte3Bm6A7m
 3ikyCJcR6/yhpbX2a0/b9DQofhzvjSDb/7AuLxXk9tUCLunlnwoWdAqtrm5nEaIMU1sZ
 7Pnhehag+gPyq2f/E6D/ReMQ5H0FuhHFoL7FjKzfYjpBSfLFLZp5edp+0+rn3uR2WY9O
 +ZwluxBDBXvmTYkjb6OqSA1B54nFMV9gb7nD29phNvaY4XfV3SEp3jnWv9J+sIZDnUf6
 Lqaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dWqYib6c7YCfkEeuiyUid02W5JbWuq8jXJrrJ2nv3tM=;
 b=lQ8VKg/w+HQ8AIW3fidQ0crVsvZqCsHFiYZx6RKggcdy5f9Lov5I4DBEzvwMfqTqo3
 Z2TAoEPCx9KaVc86TmINLEaVL+dTSBTaKtoU1mS3KgW9daXHgGcfujW9VkZca5qbVePO
 tAt7wG85zym76t1FI+dtlcvc+yc+9I8e+LYG2xXzyH8cyNZXkwom8J0RfHN4g+i5L/xz
 0ATvViLcNFeSbG2WcbpsNdAwGf1zDz1maZlfcLLQAJ899++Pr7rUuMZ42uTthW0vIEqf
 PnwTeZSezSZlCRWY8/HOm8pES5lMmQJQIz4AMe5Yc4hwp4mPX/DUs0KE5eA569k3F0KC
 Amhw==
X-Gm-Message-State: ABuFfoi67YC6wgqo0Kvjrg9xG/UpDR+97yQbjID2ah0oLFW5HiWGJ4fT
 7m3gGvE53adPWLqCZl/G9/s+4g==
X-Google-Smtp-Source: ACcGV63LjxoASoVU0N9GOjkHm3GIxpYGE+VrCNf3317VMFiXHXpyw88po3hVN1ovB/orTf4wqrA9aQ==
X-Received: by 2002:a63:584f:: with SMTP id
 i15-v6mr42745920pgm.178.1540209820537; 
 Mon, 22 Oct 2018 05:03:40 -0700 (PDT)
Received: from anup-ubuntu64.dlink.router ([106.51.30.16])
 by smtp.googlemail.com with ESMTPSA id
 n79-v6sm55443405pfk.19.2018.10.22.05.03.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Oct 2018 05:03:39 -0700 (PDT)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH 0/4] IRQ affinity support in PLIC driver
Date: Mon, 22 Oct 2018 17:15:13 +0530
Message-Id: <20181022114517.22748-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181022_050352_431254_2AD49123 
X-CRM114-Status: UNSURE (   9.16  )
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
Message-ID: <20181022114513.BGPyU_49towu8zTIHXk6W8klLQNpdz9ZJ-N-IPXScEI@z>

This patchset primarily adds IRQ affinity support in PLIC driver and
other improvements.

The patchset gives mechanism for explicitly routing external interrupts to
particular CPUs using smp_affinity attribute of each Linux IRQs. Also, we
can now use IRQ balancer from kernel-space or user-space.

The patchset is tested on QEMU virt machine. It is based on Linux-4.19-rc2
and can be found at riscv_plic_irq_affinity_v1 branch of:
https://github.com/avpatel/linux.git

Anup Patel (4):
  irqchip: sifive-plic: Pre-compute context hart base and enable base
  irqchip: sifive-plic: More flexible plic_irq_toggle()
  irqchip: sifive-plic: Differentiate between PLIC handler and context
  irqchip: sifive-plic: Implement irq_set_affinity() for SMP host

 drivers/irqchip/irq-sifive-plic.c | 164 ++++++++++++++++++------------
 1 file changed, 99 insertions(+), 65 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
