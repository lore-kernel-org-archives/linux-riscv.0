Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A378C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 11:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NFVvBCjWt3oQ0NVW/KVLpu+Oe12rO7eFIX0cT8V6Gsw=; b=M8QiynH9wgXRc0
	WHnJFlpXQpHi/K9ZhozqToArft8DBTJgnVVk4uBe6iJx2WGo75FrEEiAg5/WkCo6qLZORbZEKHuo/
	12vCI8GXLuHVenAnN8063zkS9tgVp1yjwBSFKNw8GJ1k1ifHFx/2RNGBRwZW/azooDiVMiHt0SyS9
	IE6xC81g2w+qaDp1fJJvouDwz1Xubc5Emh1aOqQhWmC2P5AJLUXq43/6dd53IK20F/0C6Pg0XTrvo
	QmzWqYXyIbnMSm2Co6yUNZuDS4spvi6IsxfkHYRaHhHjVqqy0UICoxcPscRg4YczcGBGSYCWuk8GX
	/6Vv1NkOleIx8J6JaPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQHD-000000023dx-1GKK;
	Thu, 18 Apr 2024 11:50:03 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQH9-000000023b4-0y4T
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 11:50:01 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c66b093b86so1353546a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 04:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713440994; x=1714045794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iqyoJWzuWR4+FOLKtd9tRL31vzpGg5YN4G5Q0FBkls=;
        b=eQJcmA88jhqh74uULQqc815drSBDWrSJbm0zeL7L52CLvzSkTcR1PBX+Lja/JOYVh7
         I4Uadfwr/Eij91puQ2K48/TylOkAwtOet9J9LL5d5DHvD8PdthETQ5u1WZ6X3gdKmnKs
         7BzOOo6cYEDwgz2rQLviwjX9Ac3WCb65zxn3l67SxDMjnwie7AF+Dr3T6HHO692T278i
         vXPUp0D6xKtuCjTJgReXEbZzDfn+80zRPkJQFQXhMBwmehyqcTfWD0qK+GjSclcuiUpn
         AnUGBHvPrkMleIhxuTiIY9qb9qs8tuk67TM/g4A4biDIZTtZaGxsrT3BChst81d2Z296
         g9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713440994; x=1714045794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iqyoJWzuWR4+FOLKtd9tRL31vzpGg5YN4G5Q0FBkls=;
        b=XJP3ZV8AZxtAWNNOzJtCPv3gMiLpDppnGFfv+6qhu2aF9YQfDyLnk5QuSG2GVsagVR
         Zr/bYFYBL06v70/IB5a/GdyFnkA6gkQyKgSGUqy4UeBsB4K32pdKw/7A6uvLk/TeUAlg
         GbU+92X/Q5VId1MkNndNsaTXVm2MGPwBhOhtmdJt4Wr4J30GSiDTvVjofzha8JaWd7c4
         zmLi1TqHtE3OSBLbzfDopW70Fa+2u6g7Ar9ZHzak/BU8rXxOGOtFo8jdp1HE2DViEYPe
         W9VfspGSrsa3TM1FbTqQjDsIx0iUobMZP3KejWTgFUvAL+3XYO5zVBr+gm9xBwOy3cFJ
         al3w==
X-Gm-Message-State: AOJu0YyuhSxFB2CkXJm1lS0137Rr5bvkMfnMlwPGZGAwp4cPzrLvjds5
	KzrZ+/4lnhwR5x1XTVMugc4Ek4YgB77sbswx6+BDVC0tTLQSInhtRLoluUm7lLg=
X-Google-Smtp-Source: AGHT+IFzJX4vQg0mSbjsa4tzJvphqs9eiIY0dUdAoFpN3kI6aYxPZMplxn2RgSz5efj4pCHYSlZaMg==
X-Received: by 2002:a17:90a:668a:b0:2a5:6f5f:210d with SMTP id m10-20020a17090a668a00b002a56f5f210dmr3175018pjj.23.1713440993618;
        Thu, 18 Apr 2024 04:49:53 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090aa40700b002abdb19f499sm1032293pjp.26.2024.04.18.04.49.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 04:49:51 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lihangjing@bytedance.com,
	dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 0/2] riscv: Idle thread using Zawrs extension
Date: Thu, 18 Apr 2024 19:49:40 +0800
Message-Id: <20240418114942.52770-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_044959_298069_B2A74F23 
X-CRM114-Status: UNSURE (   7.78  )
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

Xu Lu (2):
  riscv: process: Introduce idle thread using Zawrs extension
  riscv: Use Zawrs to accelerate IPI to idle cpu

 arch/riscv/Kconfig                 |  24 +++++++
 arch/riscv/include/asm/cpuidle.h   |  11 +---
 arch/riscv/include/asm/hwcap.h     |   1 +
 arch/riscv/include/asm/processor.h |  31 +++++++++
 arch/riscv/include/asm/smp.h       |  14 ++++
 arch/riscv/kernel/cpu.c            |   5 ++
 arch/riscv/kernel/cpufeature.c     |   1 +
 arch/riscv/kernel/process.c        | 102 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/smp.c            |  39 +++++++----
 9 files changed, 205 insertions(+), 23 deletions(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
