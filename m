Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70086C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 18:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iZb6rUd04gZ4BrQIjTqdjWDjbQaJOtC1vodFsV2YS+c=; b=XWb6milB5stvGg
	G47TNbFMfeIohEjy3PC7RLI0wG81k7sfuReL1Mge6x+Hj2ArGTKpjXvHMG2WIf6TNw+Ukep7+eO76
	2ATF7PQ853rE33zEdVdshHtfMaXtOkNx27tQy1Jrzb7pTq8Qv2PbBwjUqDErampba7K/x5UaEOhp6
	AnSYYk7g3raC+u24/icxOmWNqyJRR2DzzmBTN7dOSDeXzOwM2u/5cG+TjYszmxpii2fawc+g80oQW
	752bk0bvoCfTqgyGbJuooS1f5BvQvA7wie/bSjiiASfI9ED3FlZ1UMTNdHF9MaK0ux4X+Yy/EN30F
	c3nq9fEJoN+++YP/8HDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICvb-002EPX-S4; Wed, 18 Jan 2023 18:12:51 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pICml-002Abf-UM
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 18:03:46 +0000
Received: by mail-ed1-x52d.google.com with SMTP id v30so50741409edb.9
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 10:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mt3lIyqb2wMeegte8ckfmpp3o/7AuifUIjGN/TwewQs=;
        b=K1PcxLnLyU/RZxQrf4xRLKagJtNrx9cywReWUVf8X5Ok+Z0cy/vlyKzLXiw59gAUQS
         rSAkMxUzf9G7SVdNpM51z+rlHnyXHoVrgKXU73KNi2ZNwvGjxr1ptue9o/V9E2RafItm
         0J7q7PFsvO9NIc09hSClXICHdQ0LBr2r2KopHPlnay9GIYErGKen5bFV6+yFFnBObSDp
         qxaLEQH1DQNesc4BUwoiUlr/6DmHnMA8oW3jgrAT1QMUIobR1V3vMeMYzhd0F/rwlNJH
         UXISAVSY0tUf9Hqyw5Hh1ueVwtEPnKIf+ot6irtF7lmrj8OKYIjK6cSB1y13V1vtAWpF
         bKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt3lIyqb2wMeegte8ckfmpp3o/7AuifUIjGN/TwewQs=;
        b=QRGxAsFpLoeEQYMWdhNSbI0nmEo0ZgvGK/3AGrkcZS3Rxv5PWNKmSU1M5xg8GGwaiK
         uCaO62Qa7FV5WEZXgkT/s/nUP5Pte08nQmE1VPYZXrSzeVBAluDwWYICR1bsZKYQQJI7
         HmWO36H2+5g9Oa532IAviwxOSPO90eRBrnGDDFWZRVnIeoBQu8pVAjngVnb84xOgXPwv
         q4enRzk5twkduwUhbfhRVzm/xNGdtYx+2dRtwLA00Hhu+t3Zyh/YM5PAfCrT+uLIY4xb
         X11VDbhRDIWO5UeaWWHUHlebaCVjSOkZYOMYyYisrSOTvpw5vBc50j+56PY6Gi/LdLLv
         tRiA==
X-Gm-Message-State: AFqh2ko+2r/hS9Ura/iWBp3FNA4bC1Zz+pBihjygOcxe6VXbIxGBXvkW
	o4h3DXSwPu6RbQB2Dr2LpUT4A9ItxVs/vylp
X-Google-Smtp-Source: AMrXdXseijl7DMaZSqMmRGx0CVsHS4QHDv8r9EwgsAlVq04Hr4SUJTV2Dm6zbVqS3XQbabvQs9Y0Tw==
X-Received: by 2002:a05:6402:428b:b0:49d:fd6f:78a6 with SMTP id g11-20020a056402428b00b0049dfd6f78a6mr9021706edc.24.1674065019969;
        Wed, 18 Jan 2023 10:03:39 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y11-20020aa7c24b000000b004954c90c94bsm14591296edo.6.2023.01.18.10.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 10:03:39 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Ley Foon Tan ' <leyfoon.tan@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Sia Jee Heng ' <jeeheng.sia@starfivetech.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <apatel@ventanamicro.com>
Subject: [RFC v2 PATCH 0/1] riscv: Introduce system suspend support
Date: Wed, 18 Jan 2023 19:03:37 +0100
Message-Id: <20230118180338.6484-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_100344_055991_4A641734 
X-CRM114-Status: GOOD (  10.60  )
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

Booting with an OpenSBI including the RFC series[1] implementing the
draft proposal for SBI system suspend[2] we can add system support to
Linux. This support implements "suspend-to-RAM", which means when a
kernel is built with CONFIG_SUSPEND 'echo mem > /sys/power/state' will
initiate a suspension.

This has only been tested on QEMU using the OpenSBI system suspend
test. The test just waits 5 seconds and then resumes. To truly use
system suspend a platform must have a low-level firmware implementation
and provide at least one wake-up event, such as from a wakeup-capable
RTC alarm, to resume.

[1] https://github.com/jones-drew/opensbi/commits/susp-v1
    Posting: http://lists.infradead.org/pipermail/opensbi/2023-January/004260.html
[2] https://github.com/jones-drew/riscv-sbi-doc/commit/d9e43e9a938fc3eb510e023c3f352462876f7785
    Posting: https://lists.riscv.org/g/tech-prs/message/75

This patch is also available at
https://github.com/jones-drew/linux/commits/riscv/sbi-susp-rfc

Note, this is a v2 of an RFC because I'm leaving the patch in RFC
state until the spec is approved.

RFC-v2:
  - RISCV_SBI dependency [Conor]
  - Rename SBI_EXT_SUSP_SUSPEND to SBI_EXT_SUSP_SYSTEM_SUSPEND and
    SBI_SUSP_SLEEP_TYPE_SUSPEND to SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM [Ley Foon]

Andrew Jones (1):
  riscv: sbi: Introduce system suspend support

 arch/riscv/Kconfig           |  5 ++++-
 arch/riscv/include/asm/sbi.h |  9 ++++++++
 arch/riscv/kernel/suspend.c  | 43 ++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)

-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
