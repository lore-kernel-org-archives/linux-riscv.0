Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28727CD4F49
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 03:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=irZ2hGgGzaogqcRhLrNRiRx3zgIzT28xbshE0DLX0kw=; b=ct/eBTmeYpO0xt
	Phjh3p9nALw9tXya5Zc3o1dETw+2Qn7i5Ggr0VyJ1hDLyfjdbJxZp3VuMB9Z8WuqB1fPe6rDm1Iww
	8oGYK4jg8MKknOP74n/2C1xtUTidjQ/Hq58dnoscF3poH+q3tkcmk1i5uVJBQFb4pVEPXwkhnHsv4
	hv0Qdf8xONMkJ7X1aFIhvcYY8ngEWdtwoJnn55tI6k1h+EcEuon+s8Kigida5d3NQZqgrU7/Xs1WI
	1ARH6hx4w//t9IeZxRzZA53aEVW7uqeHp9PlMOArQ/MvojT9tKqH7ws7x172x/3jwp6QG1irsdFKi
	loF7Ps88fvLLsed58Azg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkYW-0000000BTyN-2xGA;
	Fri, 14 Nov 2025 03:33:00 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkYU-0000000BTxb-17kT
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 03:32:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-297ef378069so14541605ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 19:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763091176; x=1763695976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w0EvqPeJi6T9EhMrf7hciYw+vw65L+NWEWIHdZpt+kU=;
        b=Ypx0oobhCgalh0S6qVL7ZGD0Fr1+VFENEpv8l6DK76fF7VH8VxMi+s130PLfXOJ5HS
         wMUYywtlx5Jse4hePLF6zZ1a5sOeM/glkjjMMisR/yltS6qKKwlq3NwwDGgz2lFjBYOn
         KOIGxdgIs90eyrA+WNGSvWMzcTsDoWG8sMACKu2UNnxj5uFQU1DMMk3DnUpnsizxqkhk
         PpJ6Jhzog8dN7EDsZ4GQ9+yGnnvi9v6+sVW6rml4epsFzB4LLPMK3X51+ddhpQJVY2AX
         KEF4S343Nfbgo/RRCLtKKuTRWlBJmdNMZwHsSGZsXQozYD++DixbfuDqeMM+aFNStcAN
         PYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091176; x=1763695976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0EvqPeJi6T9EhMrf7hciYw+vw65L+NWEWIHdZpt+kU=;
        b=aYketIVxFJE2aOlcT1RraRegJqm3h3WXHp1g4992Xx4QUAYf2F4JLfg+sNRKh00qYn
         nWpq5aMYkKKD88off3K4EVkbzpyAugudyV7kqo5CCWl2VXhHpyIlK4tc7g20Gy/+al29
         IjD43gDo9ApKx63z5xjx6FHoWl5OgZBob9Yb3B16hLuFKwW5ZsBSBmpitEmacHpzSa8d
         tHMgUq2VDdwYdz9Q83oUR0SfhSFXs9jD6hercD/ciwBSANOz2tDD3J/0IA1f5ulChhB+
         lWoWUFZaEAagVsPyJbJHZu5CFgvkNxoq3yElXbM1VhJZcTE5s1yAGRF4F4j9z+n5m+9b
         nzRg==
X-Forwarded-Encrypted: i=1; AJvYcCUzmKFVkQCMm3RbLyUQR6Wq/NnUbKBHfQzdHZJdVLO5nXm0XIotYRIiM2N0OTGyMBlERyMQj/i/tHWxhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykDjUdhJfRx9QVNATUL48PUkl+VRakDalTn2gxS3cZ5dz+0swA
	i4ZNAaKOfy49s+TkKGbevNfxRnBXfkpkLC1y96sOlyydQ0wiwSYhuFD3NO6Vcv+FJIs=
X-Gm-Gg: ASbGncvQhcGVFQ0XEnNwT4vPXYtlC1mpGfN8gS42BJA9yBJ7N83F7+XhpxHDXHwlv2f
	pkJvlNnpTIjqkRF89uVDby6RiJPEENIg1j5gyW5AMIslDbCQGCY8G9igE2HujimmJ0TY2sD6cd3
	FyJsyi8mMZ7M9n/PBm3a/VgjEvltCVrbSxualpl7Ry5ilDVepsgS/4q+rT2nZ0qmEjUT0T6v/k1
	OpABwBVOBIXaEb6Ek8AUpJ2jeDb6i5x27gnXQfvKx+iRMSwxjCoPuDgP9xUFDkGUPYfdnlVpr76
	WgJzChZCrWziwk81LX7LZI5DjTRjfQYTMuLmxkXOYSybQsHXgLrzTjaQzb/NLVK5Th67pj7geWt
	9j2EVWyI2/6iHGNKpFa0+uGXBAaPdmtgmmPkqoVuYwoix9PCc0xMgoAL6CVdoCXOPg3KmpO/yHM
	mFQDdOLmRIT7eqXVFet64oqaHer+DAbg==
X-Google-Smtp-Source: AGHT+IFgJTRQ7xhSR++kStNbtiooekBhUGzXh05nMzsKi6A8JpRQnDiAWjcWk8uPZ/4vspiiDNwAUw==
X-Received: by 2002:a17:902:f687:b0:295:59ef:df96 with SMTP id d9443c01a7336-2986a6ceb2dmr16755445ad.13.1763091176214;
        Thu, 13 Nov 2025 19:32:56 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0bf0sm40334405ad.71.2025.11.13.19.32.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 13 Nov 2025 19:32:55 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Fri, 14 Nov 2025 11:32:41 +0800
Message-Id: <20251114033243.76509-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_193258_483973_ADB06852 
X-CRM114-Status: UNSURE (   9.90  )
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

After discussion [1],[2], hardlockup_perf cannot be completely replaced by
the hardlockup_buddy approach, so this patch is still being submitted.

v1->v2:
The contents of arch/arm64/watchdog_hld.c are directly consolidated into
kernel/watchdog_perf.c.


v2->v3:
Add CONFIG_WATCHDOG_PERF_ADJUST_PERIOD to enclose the period update logic,
select it by default on arm64 and riscv, without affecting other arches
like x86 and PPC.

v3->v4:
Place the line "select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && CPU_FREQ"
in the Kconfig files for arm64 and riscv in one line, with no line breaks.

v4->v5:
Remove __weak from hw_nmi_get_sample_period()

v5->v6:
Removed the dependency on CPU_FREQ for WATCHDOG_PERF_ADJUST_PERIOD in Kconfig, which fixes the
issue reported at: https://lore.kernel.org/oe-kbuild-all/202510240701.eB6r97V3-lkp@intel.com/

Link: https://lore.kernel.org/all/CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@gmail.com/ [2]

Yunhui Cui (2):
  watchdog: move arm64 watchdog_hld into common code
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/Kconfig               |  1 +
 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 arch/riscv/Kconfig               |  3 +
 drivers/perf/arm_pmu.c           | 10 +++-
 drivers/perf/riscv_pmu_sbi.c     | 10 ++++
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
 lib/Kconfig.debug                |  8 +++
 9 files changed, 114 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
