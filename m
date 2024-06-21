Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D68C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kijYczKi/+izS6JrwT+CF+IVj5czLMQqWuzkYLEfDFw=; b=PmTwxvbDCytYij
	N6qxsGHNKuYkJlt6hFf29FjkcUwq53CMrDi5zqdOg20iUYYMcN4oFob55csbPFEnPXy2Fwpnmn4aS
	kdWBvT6ysuNzwXboXVJ6jj0S1GwYfQxO7LFqeqTNJZDj1fqB40biKTw/1qg81IcbYvURwdOPGe9yC
	QpW3gdiQsbZzkIKkkEGqthFl/WuHUFIelILNpUzexQkP0JmoCyRLBj9O5OATi19oqnyYY0tr2JWgh
	BMfIgirpBpvU+ie5JnBufqtN04woXrea1f+xlgBQqNGl1WXBPT3v7aqj75e63tKZuE/JUGTllRJeU
	Sm5d4OyJXYaMiqvdLpMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKadQ-00000008Z2e-0U4V;
	Fri, 21 Jun 2024 09:32:44 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKadL-00000008YyR-2sNi
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 09:32:41 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3c9c36db8eeso903036b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 02:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718962354; x=1719567154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3wqIpx/xNWV6IHwMrdSRTckXkxxvetpMu+iSEo5dv+4=;
        b=MZTpQBZ7Av2SFyBq+FIc4LePDX+zbZe8y+K0vwNVNi/YCQH2W1FLhBQSdsnNBeppN/
         l86TSLMK/wB8w4LjxwlHL4umo7nJewPRP1kaakk4SnsUgcCijf1tEhw5vNYC5Z38CAXj
         B/akDg+2IdO0bsHEIliD9oe0TJdlLZ4NnbgSYQMa6cRl8y+t8ktpBgwWENbzTRZ+Rflv
         Xhm0KyeAbCv7WUQeLFvcPksswFemH4I26+g6ivePFwjPZRg+zJVoybCmw8uR0ekQMqH9
         c8Z1zmfKKYRrMZlkbn8q3X0hqZZ3is17J3dh1cPoaomh19K3opbIG+NcY7cynC/055K2
         DFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962354; x=1719567154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wqIpx/xNWV6IHwMrdSRTckXkxxvetpMu+iSEo5dv+4=;
        b=UNUFozPkrWNqqzHbsapJptD1Ug8SEVSgMKDR8DHBghqOBl4PTz0FhMMurEsAWmOt8c
         ABBoIiPhABvMJxPdEw3UilONGnrrGx6aijjjsFI1sfjhf414TVkrTYz4K2wLwmPzomC+
         moUumARLt2UDWXO3fLy/GPxHUXPW1X6KkabOl6DTpEhTUSYbYuUmGkVPz2b+9u4L86rh
         xRFSenfQ/esBWHUXvtNKuQTFD1iV0YgrhTapcQZtE3bTopR5InCl6J0qpywpEEexEszF
         bTqE8aE31WdpzMU/5cVpWUM4lSs+WFK48vBp5cK/lt4034SgG387uVOwERaO/H22ONgI
         zE7A==
X-Gm-Message-State: AOJu0Yxxw9FJ3O1PqaOb1b4645n9TYT0SBX8MjBUhSVR+ZMW8D7tlv7Z
	sxyqRkduPrOie/2ZxxQUqD3/QZqZtna+GxBGeb4FtzRSIK4ZnDK61qQtjQIPyj6kfYuqK5mwMmi
	K8zE=
X-Google-Smtp-Source: AGHT+IEYiPdKpLIiyynObeE7nm0iaBRvcw73rKG2SXQrJii6TwMzCurVIpNbfHgviOCPq4wnb7YnDA==
X-Received: by 2002:a05:6808:16a2:b0:3d5:2bb7:867 with SMTP id 5614622812f47-3d52bb71282mr4012256b6e.17.1718962354114;
        Fri, 21 Jun 2024 02:32:34 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065124dd26sm968415b3a.127.2024.06.21.02.32.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Jun 2024 02:32:33 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@aculab.com,
	parri.andrea@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC v2 0/2] riscv: Idle thread using Zawrs extension
Date: Fri, 21 Jun 2024 17:32:21 +0800
Message-Id: <20240621093223.37893-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_023239_907140_E8BAF3F8 
X-CRM114-Status: UNSURE (   8.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is the second version of idle thread based on Zawrs extension. We
rebased our code on Andrew's patch series[1] which provides basic
support for Zawrs as well as optimization for spinlock.

This patch series introduces a new implementation of idle thread using
Zawrs extension.

The Zawrs[0] extension introduces two new instructions named WRS.STO and
WRS.NTO in RISC-V. When software registers a reservation set using LR
instruction, a subsequent WRS.STO or WRS.NTO instruction will cause the
hart to stall in a low-power state until a store happens to the
reservation set or an interrupt becomes pending. The difference between
these two instructions is that WRS.STO will terminate stall after an
implementation-defined timeout while WRS.NTO won't.

This patch series implements idle thread using WRS.NTO instruction.
Besides, we found there is no need to send a real IPI to wake up an idle
CPU. Instead, we write IPI information to the reservation set of an idle
CPU to wake it up and let it handle IPI quickly, without going through
tranditional interrupt handling routine.

[0] https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
[1] https://github.com/jones-drew/linux/commits/riscv/zawrs-v3

Xu Lu (2):
  riscv: process: Introduce idle thread using Zawrs extension
  riscv: Use Zawrs to accelerate IPI to idle cpu

 arch/riscv/Kconfig                 |  10 +++
 arch/riscv/include/asm/cpuidle.h   |  11 +---
 arch/riscv/include/asm/processor.h |  32 +++++++++
 arch/riscv/include/asm/smp.h       |  14 ++++
 arch/riscv/kernel/cpu.c            |   5 ++
 arch/riscv/kernel/process.c        | 102 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/smp.c            |  39 +++++++----
 7 files changed, 190 insertions(+), 23 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
