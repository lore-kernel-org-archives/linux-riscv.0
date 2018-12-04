Return-Path: <SRS0=2eJe=ON=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09C9C04EBF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 14:11:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DCB2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 14:11:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UTPnm/gd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="bzkGSdoH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92DCB2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=W3pfOCLMWWVuvisPB6iofr3qNfrJPRL+fOhQpRKkRn0=; b=UTP
	nm/gdpkZooJsC6AX2FPtd7iLx1IuRXVppDEFtc9xjrVIxRlpRMyk3mND+DEdnqrWW3n+4wKl2HVu/
	wBdGnhYGlCVEWlPpbIHYEFt5SkXugH5aApouuuWXrAqxa3mdNuRpQvuaUBN2LvayIDAcy8VvcMwFw
	Jx7Kak4oAsU/E7zKb9/kmpHDc0yLs6u9BY4h2zBFbDxOFzTWxYhsFbnf7PhRTtEqD6NPinV874F3U
	gWX7ybO/4sGmu1bxvP0r0bQxw20xEA08yPoHJ1rYt4QK8sK+V9uZtHdKb49X5AuZFRE8qQeJ7v3hn
	7I16Vk/FgYbEszshdQtWxT8ZlUMVvfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUBPi-0006zn-W8; Tue, 04 Dec 2018 14:11:03 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUBPf-0006y5-LR
 for linux-riscv@lists.infradead.org; Tue, 04 Dec 2018 14:11:01 +0000
Received: by mail-pf1-x442.google.com with SMTP id 64so8261712pfr.9
 for <linux-riscv@lists.infradead.org>; Tue, 04 Dec 2018 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=OgI1Biz216dTM0OsrwyzMGJvKRXra4cITiLXHfMziwU=;
 b=bzkGSdoHurfqVV+cCDhQg/vyockM4Lxh2yBA8Rqhpm5PNqHggJwGmJB5uasnUHOsi+
 e/5NO+FBaKF/a9WjmI2wNqB+fBeclgQ5U8cmT1wqfsj2L/OvseftewzLw6xQaUHoTGWu
 mQ/1SBJtm/nGr766Ar0USHwioVdaR0tD6Kwb9T6OhesCXiiKaBs4CWX8M88Ru/eRQP5w
 rgltm6aOdBD+Kw/wGZLCleeCqZcxSna37TR10lx3MQlEAqzNTYVeq2YTlIr69IH8r6T1
 yzUCxnf1tHzLVAeDbBcS20I0y3KQwQV5F4q/xAkUiGoVGYtDvUqZYwN+viwC/2ctgRcN
 QwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OgI1Biz216dTM0OsrwyzMGJvKRXra4cITiLXHfMziwU=;
 b=SgfPiBJLFJCQA/qh5Y2N++t8d8Je+9F+yElDNzda1ihPRSLEpuyQMEJ8KBQA8zXnZO
 MnlgwppzfOuwMjakKL2rlsz/0WYz/W/Ks3JYkW1Wbxs7xT803dUFXHcFUZI1UBTqM7wm
 BH/3nSLeWaF4Lx+HvoUnxqeGJ2NFy9oGTjX9ltT0OlnnPzVbyVuzdQOU8ZEXberoR882
 Ui5vQP3g2vmcQomI+KUfqrV6Q8/JYF/NvhXLJLY5CwdNvyZfAWv8lHvbqIBPlg3DtIDT
 HVZ5/xFm26ZzWnU+FvKlmwD/sZiPss7+irtA+V3GC2fztBFUWKqC8vN98DEinGkfidTh
 usjw==
X-Gm-Message-State: AA+aEWaBhdxPcBKvYDT2TTo5mxn4D8gwIKcmTAkjFFF7Y/fiUlFOcqJz
 R3FMWxc3uPmcKU+b1VmGxwGO2g==
X-Google-Smtp-Source: AFSGD/VOE0dTE1stKeXyqSc9tQDatJthKkd9vkpV86uxpqbSW8qOAgrhfs8dKJl+f+D4pqMxQT5uXA==
X-Received: by 2002:a63:4706:: with SMTP id u6mr15984635pga.95.1543932647480; 
 Tue, 04 Dec 2018 06:10:47 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.53.58])
 by smtp.googlemail.com with ESMTPSA id
 k129sm31298884pgk.29.2018.12.04.06.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 06:10:46 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/3] RISC-V SBI earlycon
Date: Tue,  4 Dec 2018 19:25:04 +0530
Message-Id: <20181204135507.3706-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_061059_704122_5A10BC9C 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, linux-serial@vger.kernel.org,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset adds RISC-V SBI earlycon and removes RISC-V EARLY_PRINTK.

We should use earlycon over existing EARLY_PRINTK for SBI console because:
1. It's a more generic way of implementing early console for debugging
2. Current RISC-V EARLY_PRINTK is a compile-time option whereas earlycon
   is enabled at run-time via kernel parameters.
3. To use earlycon with SBI, we have to pass "earlycon=sbi" in kernel
   parameters. If earlycon kernel parameter is not provided then kernel
   boots much faster which is very useful in real-world RISC-V deployments.

The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc5
and can be found at riscv_earlycon_v1 branch of:
https://github.com/avpatel/linux.git

Anup Patel (3):
  tty/serial: Add RISC-V SBI earlycon support
  RISC-V: defconfig: Enable RISC-V SBI earlycon support
  RISC-V: Remove EARLY_PRINTK support

 arch/riscv/Kconfig.debug                |  2 --
 arch/riscv/configs/defconfig            |  1 +
 arch/riscv/kernel/setup.c               | 28 -------------------------
 drivers/tty/serial/Kconfig              | 12 +++++++++++
 drivers/tty/serial/Makefile             |  1 +
 drivers/tty/serial/earlycon-riscv-sbi.c | 28 +++++++++++++++++++++++++
 6 files changed, 42 insertions(+), 30 deletions(-)
 create mode 100644 drivers/tty/serial/earlycon-riscv-sbi.c

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
