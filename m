Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E05CA9EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 13:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69CFE21906
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 13:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SdGK518V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gh+uQ97D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69CFE21906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=W8TLn3g9gWLQkzcN6l00cuJQllC+IddQSYbfzdXlUtE=; b=SdG
	K518VrAvpcNbsrUhD2dXQlHOOK2mEjG9DuHcjgNRm/uzZd1PRd+4cCeKtrrGHmIS8CUYRZZWDQenw
	ddpZoi+Fpq4W4y4G1OEsf6Iga10Le2wqcLZRyTzd27L9oBAppoKWI2YLb2HkVw+I4CaovsnjLNERe
	yq2wc2zmv21m37Vpp/qbk0mpM5n84i/++CCeHnotGYvEPV6m9MealboXvdaR5QV2rF/gNAPmK7niC
	qKbWJk931gq5NLr8qVOXHhh1AoqHtaQbsh0NQSnkRtf+YcLZjdKAAm/A4tnbAqgqFtDse2+iAu/TJ
	877xQDJrE/nAcvQP/eD3QVHGUCB2CyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNclL-0008Gi-FJ; Thu, 24 Oct 2019 13:02:47 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNclH-0008Ev-RO
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 13:02:45 +0000
Received: by mail-pg1-x544.google.com with SMTP id 23so14225179pgk.3
 for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2019 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/b8upsYxAHV50/pkYFWToTEqmLmbge4Vw0LfKFTH7Xc=;
 b=gh+uQ97D7GUTUYtFAtlwK+hH5zRunx9fI4Ek+HyI0OlT8NFkPuO1fgvlRsmfy8w/wt
 RxCgPw6PfrEShBToO7EkCCka343tZcykL31Hh9dzBidAgrEyz/hOhWSgCWzSuzKRPKab
 oFdqDliGvQbfLzX7nSn7Beem/4PFjw9KTMFUG+2xbPf2mmWJzRVAubf+YseM0uzUyipP
 9gcGdMAQNAwH9/2ZpDOzPwJ4vrHfkB2PPYeV2db/DF9yXmXxrqq6R9eteN3CXMwEuoVc
 6pul558jRX4p3IvblZzFZXzG2b9/fQ6q7fuTSoa+/7QUZFS+1BLGFNKNhmqavTVQyzna
 8FIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/b8upsYxAHV50/pkYFWToTEqmLmbge4Vw0LfKFTH7Xc=;
 b=AU2CX+e1IUfLvdsIeLIKDftHC1cE4uZb7R9w+eKxHNQthikt6dv880zpcIfXE6TVRy
 GMx169otbQLmx+tYNgCCioiS5/k7fKPt3L/UjgUycfMO/sR+MtgVJJTiju8jK9IMU5SI
 KGo/+pXpDYY896IjnYe8OhpdSz9S4wvoJNwLMTYMmwKNGCDFFwdw0hPeV3jucbgke+F7
 UupYVvYzLL8imdZt5UTzC3wP82yPsSnFWAL/C4BYjueU2VjyLtWVuFoC144y0kTfv1Z+
 uPjLefjHYDP+gNEWT4vdlYa5xsTEoXkAXZmJ3gytaO7QTK52hp2lS3OMS1rEHazLwq/Y
 hvPw==
X-Gm-Message-State: APjAAAWXPqLE/edGHGdxVLUPtXOXTV5gOn7oNswQ+VxYEpmC/V/ZH6Ea
 h0aSJNjU94BptYAq09Ne3XWugzIFUNrE4Q==
X-Google-Smtp-Source: APXvYqyTc7x7OPqtZa9Jfa8hnggbtw9Uaf08mi1nImO078RVxE7CDqjXQA5ApLB14/lp4ichMdgA1g==
X-Received: by 2002:a63:4553:: with SMTP id u19mr16191277pgk.436.1571922162455; 
 Thu, 24 Oct 2019 06:02:42 -0700 (PDT)
Received: from gamma07.internal.sifive.com ([64.62.193.194])
 by smtp.gmail.com with ESMTPSA id z4sm2308775pjt.17.2019.10.24.06.02.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 24 Oct 2019 06:02:41 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 paul.walmsley@sifive.com, palmer@sifive.com, steven.price@arm.com
Subject: [RFC PATCH 0/1] RISC-V page table dumper
Date: Thu, 24 Oct 2019 06:02:17 -0700
Message-Id: <cover.1571920862.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_060243_946208_1FE6B3A9 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch contains the support for dumping the page tables, and it's implemented on top of the generic page table dumper patch set. The generic page table dumper patch set is submmited to version 12, it looks good and only a little bit different from previous version. I'll post the formal patch after it be merged.

The patch set of gerneric page table dumper.
https://lore.kernel.org/lkml/20191018101248.33727-1-steven.price@arm.com/


Zong Li (1):
  riscv: Add support to dump the kernel page tables

 arch/riscv/Kconfig               |   1 +
 arch/riscv/include/asm/pgtable.h |  10 ++
 arch/riscv/include/asm/ptdump.h  |  19 +++
 arch/riscv/mm/Makefile           |   1 +
 arch/riscv/mm/ptdump.c           | 309 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 340 insertions(+)
 create mode 100644 arch/riscv/include/asm/ptdump.h
 create mode 100644 arch/riscv/mm/ptdump.c

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
