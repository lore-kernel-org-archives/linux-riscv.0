Return-Path: <SRS0=2eJe=ON=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6BFC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 10:45:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09DF320851
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  4 Dec 2018 10:45:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A8LTgAUl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="HXaQnP5Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09DF320851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=brhsakbEnrqZX9Vc9/pj6GfX/Rw0K3ccUt8yhZKeDbk=; b=A8L
	TgAUlA03kc3IJmgHYFb5kvBI/FAuG6d0skaUHJirhHtE3uU2F2NIlVZXFAV2/GefHBKROXItQFd4j
	aVcgWLcYVMIRBn83UQLJ3mUDtQtPChEaaxYcItQP9oPAON6Oy3MsZMlwUSYhCocStms+m26LNnJpH
	BNgC0pzCNKvjJ157i0+/73iKpyYH1JrmQyTEiEi5f2aPU9BmqPORwzdCTQGzWeL7/UcSfNaIoKm1f
	0TuwWAm3WLTFnKxTiENOUFT9lZxDvPZv63tLtOS2Jlzo+cxla7nVzL1OMaaTfyt/NNDp09aMQ5OK0
	sMreaue9XHl+wxhdg+GwAkjq6HoxyXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gU8D7-0004M6-HN; Tue, 04 Dec 2018 10:45:49 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU8D5-0004L3-CY
 for linux-riscv@lists.infradead.org; Tue, 04 Dec 2018 10:45:48 +0000
Received: by mail-pf1-x442.google.com with SMTP id c123so8029835pfb.0
 for <linux-riscv@lists.infradead.org>; Tue, 04 Dec 2018 02:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=lw9dv8XtfZcbn7EFOqB9w5nPQid5fHNBwj4EA4pjoCI=;
 b=HXaQnP5Qh3ow5wxkyC0HHl3isat0FQe6KyrGS3hp5h2rVEVJYqBMVZb+eW71IbAi5t
 sGsmiY+SZ3Ds+vahPolmRRuw1RgLLVJ9f7IaxGwwLbw7QvgFrm52CKZ68AXDrgwHQeA4
 WGM4uQ/U4qzoVi9AlR3ZTqvMkzP0Rca9D+nlgMtsc0/KVoLqkOcV4mVOuTJwsLzEuMZa
 aQRojEOx/lDmz9oz1qTULL9pJ04bRKMrNZfLWyFztfm/YZWvvTPZb3Ax0GCYG4O4/Jve
 tSgZmn5lDrwo8kYjH5fHbjtWM3drGHsigDFr271ZbnyYmMFAs9J+afBa77sLe41bPB9d
 TqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lw9dv8XtfZcbn7EFOqB9w5nPQid5fHNBwj4EA4pjoCI=;
 b=LhSVyxklJ+5E0/rag+iD7SUmLAg2dKlNHBwUeJsdeR0yz5HvS83gPyBV+YkAtL2fmk
 TuqRydDIXoiuaqposHeJZin9GhQG93NPhrSnSr0A5kklvveGpMNL9v5LuciOS4YgzIjS
 45E8nDMf7uSwgQV+Nq91aGiBisfGmVJF7DTCcx0IfsbvtMj4YWud8rRqTeNAo71cSW7m
 9LbU7dBlbew9Y/z2HC65yQUA7tGylz8qSApNiAZb35vwPVbPmcgTSYaRVWbYNy8egI+9
 8+wpiV1weqQNa3qE3GZZFj2929ISxoeClny1kcBC2dFS0Et3uvn7AMYRM413rI/Po5ZO
 dZRg==
X-Gm-Message-State: AA+aEWZ9wA0rnx3WOohwXe+/NW3gCkjBxKQEN9RtgLh/i+1GIBTpS05y
 7YlQ4i8ya4wiwQyEx9uiTqmAQA==
X-Google-Smtp-Source: AFSGD/VWLw+81cALEKeJeVhuXT2s0lnov+7mGExOsyEKWPIIzXzan6QNeE3rORL7IIxprQguLCNdig==
X-Received: by 2002:a62:cf84:: with SMTP id b126mr19345510pfg.98.1543920336142; 
 Tue, 04 Dec 2018 02:45:36 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([106.51.23.39])
 by smtp.googlemail.com with ESMTPSA id s37sm19034734pgm.19.2018.12.04.02.45.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Dec 2018 02:45:35 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 0/2] Provide sched_clock for riscv_timer
Date: Tue,  4 Dec 2018 15:59:50 +0530
Message-Id: <20181204102952.21297-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_024547_429526_C3DAC89E 
X-CRM114-Status: UNSURE (   9.39  )
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

This patchset extends riscv_timer to provide sched_clock using generic
sched_clock framework.

The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc5
and can be found at riscv_sched_clock_v2 branch of:
https://github.com/avpatel/linux.git

Changes since v1:
 - Added patch to select GENERIC_SCHED_CLOCK for RISC-V
 - Kconfig RISCV_TIMER depends on GENERIC_SCHED_CLOCK

Anup Patel (2):
  RISC-V: Select GENERIC_SCHED_CLOCK for clocksource drivers
  clocksource: riscv_timer: Provide sched_clock

 arch/riscv/Kconfig                | 1 +
 drivers/clocksource/Kconfig       | 2 +-
 drivers/clocksource/riscv_timer.c | 9 +++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
