Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D27BC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:55:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 634F0204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uQHRCwAb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vZEHEoRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 634F0204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=wMF8hiJ8IKyZ5HWbTDuTYS9uWjeAOcVTntAW/BUMhZc=; b=uQH
	RCwAbjrFVoRpocBTHJpvrFfwHxSO1Pl/AiT4T3vdgtD2LxRvA2a21swPkw2aVJr0QwDrNpDPLrOAy
	8C0yID0cnq6k/PH71CS3h+s++AZd5bmVAtLBQN34niPKshfcO02Fe6HhX6/sFrk/Z2MZWUsMEWhpx
	Mrw8cqxA5IHQo64Ka8MVhIwcGQoC8jNLG5aCBQAudL8ihmHRF0YNpSBR8gfs5xewnq3So0w1yIl2B
	PNV58xgJHU5ejGvfSnq+q/RQsqxKQnO2KYjjSSK5YJdj2qDvcFGi9HDZhlHPWrgVsABp6cuiE3ust
	VOnIAxg6f1AoZ4BN5aWR9rSBubERFzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g55HE-0004Y6-Fi; Wed, 26 Sep 2018 08:34:32 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g55GE-0004ON-Cd
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 08:33:31 +0000
Received: by mail-pf1-x444.google.com with SMTP id l9-v6so13087683pff.9
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MO7664pAV2ldFdH0JaoDq4/TZtmoHdXkovT5pjpOKjc=;
 b=vZEHEoRSKUi1UeC73MMcyVmTtLY2W292HV02GtVgQAASQNs1+o2bkZudMwaHin9MnW
 8ZklOoVg6UtAWb+XAOLwwvjjTRzMtOYQF4urGSoUAp7q2KnCql9e5/snUXIZpSunrCNG
 VWQuIeuy0X+AkHwadhb4h0iflcCt9xXo+obMmQzDStpUC46kBwtorfewm7f6SammPzJV
 jpn/WoaT0rXVF8HWQi3H7UJFXevXyRWexdoor2yORbMYJ9EIq1PQch7yPp7SG0qoAsoI
 jVDfCCao34e1XS6o2+SY7NDegr/eP5+WvjsxrZooOj43p8xmIeGJ7ZIjLCxARzCnwUse
 ukOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MO7664pAV2ldFdH0JaoDq4/TZtmoHdXkovT5pjpOKjc=;
 b=lJsdY0OKU8VdzRNfs3sOzS8XK+b31dN/pk3axr7H4AnrgP+LCbvQ0kW7iyoZmLtNDC
 kc1Fn9x3n5MqiwEy4p5IDHgcJ7ERcFqyunMs1iayumBod4I9sq8bVQ0nZS/kSPfrNHh+
 M2muunjzZMrS1Edp8gVz+syTrQAIOHLiTZdtFkQtpemDRopdLfBZLwZ0kJNXVy1zv/jM
 ikxR7NOy6Jzb1JKmQLAGkGdnWW+jK+EEGdc4qSVncwqH/EHTH17F0FJUwjK4RjBsxw+p
 nLwuY7Pqqr7FJ4PYh+rfC13SQ+ehIMFFBWo0vP9gE1knCMA3mVX3Y2yY3IWvYSkldS0t
 NDMg==
X-Gm-Message-State: ABuFfogNS1mgn+UXAZdk9zw+d3zuCpyBHaL49RLkUJGWxez2FA3di6Dx
 BJgjDHyhtAf/iZWsKTO3Iqs=
X-Google-Smtp-Source: ACcGV62AR77HEmfg4s+9K/8CJNgkytT17zzBtIAhMg1iGsXiVuBPoxhogxOCl+wzGnPuYoOCztQ8sQ==
X-Received: by 2002:a63:d645:: with SMTP id
 d5-v6mr4628381pgj.450.1537950777504; 
 Wed, 26 Sep 2018 01:32:57 -0700 (PDT)
Received: from app09.andestech.com ([118.163.51.199])
 by smtp.gmail.com with ESMTPSA id f15-v6sm5530764pgv.66.2018.09.26.01.32.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Sep 2018 01:32:57 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2 0/5] Fix some bugs on RV32 build fail and issue
Date: Wed, 26 Sep 2018 16:31:09 +0800
Message-Id: <cover.1537949825.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_013330_454599_AAEE9D22 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: zong@andestech.com, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, hch@infradead.org, vincentc@andestech.com,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926083109.Ci3UJDR6AcPHpy5-D7I1rMxKtQCAKovblXaKuU3H154@z>

This patches contain the modificaion as follows:
1. Fix up the building fail on RV32.
2. Add umoddi3 and udivmoddi4 functions for RV32.
3. Fix ioremap problem on RV32.

Changes in v2:
 - Retain the copyright notices from libgcc in umoddi3.c and udivmoddi4.c.

Vincent Chen (1):
  RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap

Zong Li (4):
  RISC-V: Build tishift only on 64-bit
  RISC-V: Use swiotlb on RV64 only
  lib: Add umoddi3 and udivmoddi4 of GCC library routines
  RISC-V: Select GENERIC_LIB_UMODDI3 on RV32

 arch/riscv/Kconfig        |   1 +
 arch/riscv/kernel/setup.c |   3 +
 arch/riscv/lib/Makefile   |   3 +-
 arch/riscv/mm/ioremap.c   |   2 +-
 lib/Kconfig               |   3 +
 lib/Makefile              |   1 +
 lib/udivmoddi4.c          | 309 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/umoddi3.c             |  34 +++++
 8 files changed, 354 insertions(+), 2 deletions(-)
 create mode 100644 lib/udivmoddi4.c
 create mode 100644 lib/umoddi3.c

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
