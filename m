Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE49EB8FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 04:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JmVtwyZRxXA+vMAM0ejjHpXj0ehbQbyr216l3fj48X8=; b=njaPw4EiNT2i4Z
	HhzdN+OPEjg9ffBqYH9uEvdmVp0b3mDOfuWBIfPs43ItyvJleyuFDh8f4xIMMGxdE61oC+NupJF+M
	QSdmDINUg3keyx2/Vu79DepB2frYQ4eYaj7quL7O3YJAo4LcO6z444DrfvGM/BYT6wIaTHi4zsIWn
	9q5ehXk+ndLOwRFgF3tkPGqPjkuX1LmnL2bqEUUFmciWtnPj3VAUXTNTUkfZTJU/XfaCkuXYNR0jQ
	dtya3oBxrNzIE3nvpf7qUa0tvpq8dnni9o4WxVj9aK64PMrv91BUma747saV5ClDwngXdayJygHAc
	T9Nb8XYsvtoKYWOcWN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRm-007FbF-1y;
	Wed, 06 Sep 2023 04:47:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdkRi-007FYk-0A
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 04:47:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c06f6f98c0so25676695ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 21:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1693975631; x=1694580431; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UkNf5DdEUVVxDR8Go3EaSMZ4c9q9d7OU7fzHFUYTbIk=;
        b=Jn6yxbGPUfFrAJgNIPNmeANED104OjaRZUDYw29FkUhv56S3wlVCO90C18gKmmsp97
         /jdITREH68V9MFnLkoV2B7gEv91yEDxGwAdkBCtIpe4Trhi51jV+F9cxNlmouyL5Ik7M
         8TDawP9h9AE5LWdvBjMLH0b9IsLYQWRqHE7jOeqph8wVU8W50zH6bcOnbUZZSN0OnEmn
         VT5TPObR/gy78czOJbgYe+Ulxp7GlzBiNJmPemhDce8mDc7JqDkaidBgKsZMNQ1Zp256
         YX1KpkFfl8OBRJ+9KhG+VgbTi4HSnYzZ4vMDiupPWGzN3Ed9Ex/485g8xl3uKwg8WKat
         cUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693975631; x=1694580431;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkNf5DdEUVVxDR8Go3EaSMZ4c9q9d7OU7fzHFUYTbIk=;
        b=Qmbkug9tm7zvPB0Lu2jy1nrAtgdi9Dwk/xpKNCp+d8gYEA6v76LXc5svf6dmdkO64Y
         lWfV4E+q5oC+24GMyX8KSGVYhFWuJMEkTSh3srcpyH8Kz4fpLd2svwnHfpnTCjJnHSDC
         p4hGCRvSw7IlInpJwl4Q77h66h/DaFDHOA0pGCmiw+jTvrdjfhjysGanAFYWCFmGycXI
         MCRRYem/2fuUpu3KOA6YIvtl0ML8xi8qTavQRbAGkxJjaFf8/LsfCgbVTtq/7hufh4HP
         /siRVsFZEIAExHl8bTB4czJmkZeiR2AtEQ63cUGKm+JQYGF1BQQcES5+QsAgfk8W+kvU
         xgpg==
X-Gm-Message-State: AOJu0YwYwUH5z4kN8Pv1Z+nlxjuvMlA6RMwZ851/8OQ4YVesA/BYGw3j
	eHBivfiOOs8z6LpaDOF4KjV8vw==
X-Google-Smtp-Source: AGHT+IHhZFPSvGInMuLV9uwyB9cb85sco3sDZCIbQ1PubHTivGtMzOq6C5Q3wrQz1LDEvAi+2/NQBA==
X-Received: by 2002:a17:902:ced0:b0:1bf:423:957b with SMTP id d16-20020a170902ced000b001bf0423957bmr18742552plg.26.1693975631109;
        Tue, 05 Sep 2023 21:47:11 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001bc56c1a384sm10087313plt.277.2023.09.05.21.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 21:47:10 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/5] riscv: Add fine-tuned checksum functions
Date: Tue, 05 Sep 2023 21:46:49 -0700
Message-Id: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADkE+GQC/23NQQ6CMBCF4auQWVvTDqDVlfcwxEAZ7cTQkhYbl
 XB3K3Hp8n/JfDNDpMAU4VjMEChxZO9y4KYAY1t3I8F9bkCJpdSyEn6ceOA3XYwlc4+PQfSdqmr
 UujWoIN+Nga78XM1zk9tynHx4rS+S+q4/DXd/tKSEFIdyX0vVZRbbU+DkIzuzNX6AZlmWD72WV
 8q1AAAA
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_214718_313653_7F47E064 
X-CRM114-Status: GOOD (  13.95  )
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

Each architecture generally implements fine-tuned checksum functions to
leverage the instruction set. This patch adds the main checksum
functions that are used in networking.

Vector support is included in this patch to start a discussion on that,
it can probably be optimized more. The vector patches still need some
work as they rely on GCC vector intrinsics types which cannot work in
the kernel since it requires C vector support rather than just assembler
support. I have tested the vector patches as standalone algorithms in QEMU.

This patch takes heavy use of the Zbb extension using alternatives
patching.

To test this patch, enable the configs for KUNIT, then CHECKSUM_KUNIT
and RISCV_CHECKSUM_KUNIT.

I have attempted to make these functions as optimal as possible, but I
have not ran anything on actual riscv hardware. My performance testing
has been limited to inspecting the assembly, running the algorithms on
x86 hardware, and running in QEMU.

ip_fast_csum is a relatively small function so even though it is
possible to read 64 bits at a time on compatible hardware, the
bottleneck becomes the clean up and setup code so loading 32 bits at a
time is actually faster.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- After more benchmarking, rework functions to improve performance.
- Remove tests that overlapped with the already existing checksum
  tests and make tests more extensive.
- Use alternatives to activate code with Zbb and vector extensions
- Link to v1: https://lore.kernel.org/r/20230826-optimize_checksum-v1-0-937501b4522a@rivosinc.com

---
Charlie Jenkins (5):
      riscv: Checksum header
      riscv: Add checksum library
      riscv: Vector checksum header
      riscv: Vector checksum library
      riscv: Test checksum functions

 arch/riscv/Kconfig.debug              |   1 +
 arch/riscv/include/asm/checksum.h     | 194 ++++++++++++++++++++
 arch/riscv/lib/Kconfig.debug          |  31 ++++
 arch/riscv/lib/Makefile               |   3 +
 arch/riscv/lib/csum.c                 | 333 ++++++++++++++++++++++++++++++++++
 arch/riscv/lib/riscv_checksum_kunit.c | 330 +++++++++++++++++++++++++++++++++
 6 files changed, 892 insertions(+)
---
base-commit: 65d6e954e37872fd9afb5ef3fc0481bb3c2f20f4
change-id: 20230804-optimize_checksum-db145288ac21
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
