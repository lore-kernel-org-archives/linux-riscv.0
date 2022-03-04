Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BF5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 16:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r5mCnc4MidEDQtqkXmfQGcCq/Yg0bTQrdxcTXahMXNw=; b=vAljrOMWGn1vwM
	f7218NZVj260Pc9ByF79pfmIcrW6saupy57WWhqj1OA7Jlds5umg3ViIowcbS6CCehAz0w8fFks6j
	m/0/dgvK0SZnNbHhCXtaPx3PgmvFXWFlpwO4Glh7nj9GvhL8/QZkXngpgsPuCkT//AhynfvxI3dFz
	GOrc5P4ZO2JveOp5/OBXj/7DqxdQkjGfaE5hyImXd0e/DnHq6J5kWYrWwq3Z8vyYTQhDSZlhKQBMi
	U8cfh9UWpJmt73BgzWC2GGbI6EvVmJyW6jZzO2O+PUY6/belu3bGde5Hol7D7x0pAPGC1K/eLEJ+G
	REoBTA1uW7e+iJNwyU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQBC5-00BBVg-PD; Fri, 04 Mar 2022 16:54:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQBC3-00BBUs-3o
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 16:54:16 +0000
Received: by mail-pf1-x434.google.com with SMTP id z16so8099447pfh.3
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 08:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=NPdv2qezfS5eIhrJcLYFdVC8eeVfGqPS0eoMNFwlvYM=;
 b=eGrblmHXcrMIcuINQhyU6BpLqhr/HQ/U0bUzkLevSur4xldQ/HUX8W5kneWV7F1Bj2
 QIgPsHyY6Xe/9nF4x26c9lvRdlRD3eRMLRtUgUjr2tC6DIX9eQuE77XmhaaxSS8RfGm2
 mI6d8rzWdgMDfPmZq42MmT9ed6QB+kcajBrjpaJongd/oqJFOhhdHLuj9RVh7xhBSvWa
 dmuLijZNZBQu9AeCm9IGbzW2K6uEREQ4an9cKC0VB2qu+glvThvzAoOgBEWgduYpzc6E
 UZPNOh6bL48g39avxABV5dZw90lKXnEJW3OJDOGwCV8y5Qb54qeabBpmR/qlpBjeLQ4m
 /gGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=NPdv2qezfS5eIhrJcLYFdVC8eeVfGqPS0eoMNFwlvYM=;
 b=me6SrlHut+8nzGJLEm9gDVDsTBAZwy996Vo2GEyDs4bOdDB4rCcJ/gbCiZsOUTt4ZF
 boXpWTzuhQFKaeOc3o5t49/+1LzzghHl0FKNkcaZZTHwwUXYluvCOKwZt8hVYzkpX3PP
 ccNQmyvdHdVjKdlYFZDGtCPOkwtQkkhI2Yy9fRE7Ai+Uie0JUyKG8ZT8hc24Zx1FUhx4
 iWlzpuJxNIJvCISJ+JnThtw9mZPtJeGeKBQcP2hV9JaoRkxh7EOPV2LFmGDQmNxaBWfn
 p5m84LMVenT/kzMbfmEuOCiNCyQHk6j4mTOP3CM2h9R9L51el+N25tLLrrY4PIhpvKvd
 11rw==
X-Gm-Message-State: AOAM532v8Fx4RQJZgBW6bzGO4NmMkHb+DMGOIHum3SBmgTAVYKgCWyQM
 /epDtjT8LXSywSwpURLN8yAz6Q==
X-Google-Smtp-Source: ABdhPJySdDDgvfRGVHoX72W+Z4WBe0SWSF9l/t2aBvKgAB6CEJvR1IzSLpDyu9seWJOtupaMZQTgzA==
X-Received: by 2002:a63:4005:0:b0:373:9ac7:fec1 with SMTP id
 n5-20020a634005000000b003739ac7fec1mr34639092pga.12.1646412853295; 
 Fri, 04 Mar 2022 08:54:13 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 63-20020a630942000000b00372a99c1821sm5039282pgj.21.2022.03.04.08.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 08:54:13 -0800 (PST)
Date: Fri, 04 Mar 2022 08:54:13 -0800 (PST)
X-Google-Original-Date: Fri, 04 Mar 2022 08:54:05 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.17-rc7
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-35bc28f8-875e-45d8-8c8d-869bb9efce61@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_085415_235755_147F1FC1 
X-CRM114-Status: UNSURE (   9.02  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 22e2100b1b07d6f5acc71cc1acb53f680c677d77:

  riscv: fix oops caused by irqsoff latency tracer (2022-02-24 20:30:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-rc7

for you to fetch changes up to 74583f1b92cb3bbba1a3741cea237545c56f506c:

  riscv: dts: k210: fix broken IRQs on hart1 (2022-03-03 20:04:21 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.17-rc7

* Fixes for a handful of KASAN-related crashes.
* A fix to avoid a crash during boot for SPARSEMEM && !SPARSEMEM_VMEMMAP
  configurations.
* A fix to stop reporting some incorrect errors under DEBUG_VIRTUAL.
* A fix for the K210's device tree to properly populate the interrupt
  map, so hart1 will get interrupts again.

----------------------------------------------------------------
Alexandre Ghiti (6):
      riscv: Fix is_linear_mapping with recent move of KASAN region
      riscv: Fix config KASAN && SPARSEMEM && !SPARSE_VMEMMAP
      riscv: Fix DEBUG_VIRTUAL false warnings
      riscv: Fix config KASAN && DEBUG_VIRTUAL
      riscv: Move high_memory initialization to setup_bootmem
      riscv: Fix kasan pud population

Niklas Cassel (1):
      riscv: dts: k210: fix broken IRQs on hart1

 arch/riscv/boot/dts/canaan/k210.dtsi | 3 ++-
 arch/riscv/include/asm/page.h        | 2 +-
 arch/riscv/include/asm/pgtable.h     | 1 +
 arch/riscv/mm/Makefile               | 3 +++
 arch/riscv/mm/init.c                 | 2 +-
 arch/riscv/mm/kasan_init.c           | 8 +++++---
 arch/riscv/mm/physaddr.c             | 4 +---
 7 files changed, 14 insertions(+), 9 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
