Return-Path: <SRS0=2eJe=ON=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AF9C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 10:45:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE4FF20851
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 10:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cID+rwtc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="WSU1xHpU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE4FF20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RWUaEo/qktRcMkky5LhS+2z1SKS6sqSyUXpfthozUwA=; b=cID+rwtckGnJx83E/syqg8qFIC
	B3De0RXIa+w1KrzCKqYjzU4qjt0Q+VRJJg+di71kgusiNgb+V00S5WVyw/xYdpPgEd+etGCj/Vv0L
	j3HVnO8zFeOLP026RP2PYeakBGEkYM4ZUOTavPBR77CW/LdDNrpEOxfTwtRUSsoPF+rWUTs1P3Rrl
	9ErPg0jyA3Vy7S1Fkeh0X6YMHltM1Ial6fKDu/TZdvq55IK9M6DPUXMKHIWzgyZe/fp6bFcwd3vIV
	taunCMGpJmYvwkOsn9aQ6JRuvMEPUvazMhrLSlEV1lnO2qj/zxYhZ6cUbKVf/+DKYApo9WFcASxDk
	6ZnqKoPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gU8DD-0004P0-1V; Tue, 04 Dec 2018 10:45:55 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU8D9-0004LQ-TR
 for linux-riscv@lists.infradead.org; Tue, 04 Dec 2018 10:45:53 +0000
Received: by mail-pf1-x444.google.com with SMTP id q1so8016912pfi.5
 for <linux-riscv@lists.infradead.org>; Tue, 04 Dec 2018 02:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j4avgKxJ7er1mkSgLv64vmGkmY63IGVLkeRJB+3yExU=;
 b=WSU1xHpUmzmizOSvpN72KaeN2XZ8/7U+r8fWZAv3osZYg0oBPm9JBHzmo865sFHHo3
 et6IlRcweK8Qru2TFutmmYeKd23IYfmk/lzVby6S1N4dBuK/XSwD84KF9Ui9UWxsagvU
 TVWTDHSmXv3NrUqvFOpV88V8o0rB6pRbLUDkGFI2d/FsNc9zh/tDfPfUXuI3NINHjbEu
 /HjjGJppSP6tA7zhwI0aHXUAQ6mfP4oX+D91BuH+BlkVccu8x/86dz4wDMR2aISYciDp
 VBtghfj32yA9LTdBgGoIAfvS8egJFJLup65dRMx2ZcGBfIl2wmy07VI5GRMtsVfRvi7v
 g6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j4avgKxJ7er1mkSgLv64vmGkmY63IGVLkeRJB+3yExU=;
 b=GsCTDBAylCh0ccqXyNzZWpUkxHwKJL2NP38WNyk0yHjmFyrW9BpijALd8hr+UEKpVU
 CCXqQhmBaZ2CEbXZhCAkrx1V7LNUVMN7fmWpJqhB5xrEIRni3XQG8Nbavc6oaYGPEOZR
 Q0z2O8YBn9VoyiWbzJ4Q8JV5FiWQp0nLKCLlh9llNDxPUHGIv9O5HkYwKhWR+x6thHla
 DsSs/F9jx49P46boQJvhuDA+yrMXXc/onkna0suMZA9jcE2QexWt5ab/dg1zB37+g2um
 P2Q0pSMLrW4DsF+MG6uAlG2LZWY9Yi2FPPAHRK+5/fyMB71sslJNScP0z1R6PCJKzW9c
 ZSFw==
X-Gm-Message-State: AA+aEWZFZygeXXvuL80yzbyFfSdRZ/KxFOCWEVOy18xvjP4IGGoSjRKD
 4mBVK2AQ3qWXU0w12FELX6h19g==
X-Google-Smtp-Source: AFSGD/Wtvji/X00CS395VNSz+1FZ95aC6LHfk23e/UOH/alPQ3I8LuRRnct+LM9YFxLP4/syqguAEA==
X-Received: by 2002:a63:cd17:: with SMTP id i23mr16162337pgg.13.1543920340951; 
 Tue, 04 Dec 2018 02:45:40 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([106.51.23.39])
 by smtp.googlemail.com with ESMTPSA id s37sm19034734pgm.19.2018.12.04.02.45.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 02:45:40 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 1/2] RISC-V: Select GENERIC_SCHED_CLOCK for clocksource
 drivers
Date: Tue,  4 Dec 2018 15:59:51 +0530
Message-Id: <20181204102952.21297-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181204102952.21297-1-anup@brainfault.org>
References: <20181204102952.21297-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_024551_962810_6FCA4D8B 
X-CRM114-Status: UNSURE (   9.99  )
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

The riscv_timer driver can provide sched_clock using "rdtime"
instruction but to achieve this we require generic sched_clock
framework hence this patch selects GENERIC_SCHED_CLOCK for RISCV.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 55da93f4e818..09a0f2582cad 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -24,6 +24,7 @@ config RISCV
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IRQ_SHOW
 	select GENERIC_PCI_IOMAP
+	select GENERIC_SCHED_CLOCK
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
 	select GENERIC_SMP_IDLE_THREAD
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
