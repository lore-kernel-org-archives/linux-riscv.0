Return-Path: <SRS0=fXqm=NY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DC6C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 17:20:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23BB7223DD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 13 Nov 2018 17:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nckk77VX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QompLoRk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23BB7223DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:Subject:
	Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GNz3KTZbqHk+F9XpsobOFmNlR1HrwubEi2AZj0edwi4=; b=Nckk77VXjEF/y9
	IjrS09IbvcvtGzSq4vTAbBrS84W1oPo7PM1eAr1mSq/C/YoIWRcoKhw7+Fim5vrJZ0v95ZdNkVJht
	Z3cHFiSbeqLAfYiSV+oDv4UuSAFVhFKdbMepTFFDBMG6iokGQsOxVw1PTkkyJNsj7i0Zn0yUXWVR9
	9XO4ZTDKRAcuOphoFJ6cIdd2LlvCXXUh8nank6GjBxcPOEwl8rNFE9JjFOzqd/fWwolOVR3PwjVss
	98aSHF43kT9+NY3Cso+9o06m7tTmfTlCELV8Br5/uUkFR/00CBGdqeiGKp6NCRsVsye9Z4txB/J6/
	cvIqEnyOmcz7VXQlwHJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gMcMv-0001K2-81; Tue, 13 Nov 2018 17:20:53 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gMcMs-0001JS-JD
 for linux-riscv@lists.infradead.org; Tue, 13 Nov 2018 17:20:52 +0000
Received: by mail-pg1-x542.google.com with SMTP id f8-v6so5987400pgq.5
 for <linux-riscv@lists.infradead.org>; Tue, 13 Nov 2018 09:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:from:to:message-id;
 bh=u/XePtUsRUUDJQjtgzZMzPn6KEZuMMtP7D29RTEGn8s=;
 b=QompLoRkwJ9/fnQ27aoQZxGWkoU+9XbelLRcHlyNWVqq8NQNnm3E2vE3OvlCC1tG+Y
 M19AyuP/ZLbEszvXDxOQRRE29qXN1RIMLFA2rpixjAcSW7NNnB9z9VTp2rwKCtM6jyuM
 t32UhUbQ8HNryWBH22N/YkhgbQMkY5/ENQzc2IPxeh8xqLDkDy0r8yPpdKBxr4DujMYB
 mwnjnWubDDG8K/DMh+AdEAH5tnK8qxGCQk8uGvZ35llNdpQMQRFJQmzJbKcKkS98T2Tb
 hFF7bDzj0AI6hWn4tiYNTkch1P2PXJe18iFj76hAsooWCKC4BjwsVhdztixcgqRkYmCh
 X6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:from:to:message-id;
 bh=u/XePtUsRUUDJQjtgzZMzPn6KEZuMMtP7D29RTEGn8s=;
 b=dC2yp6XsV8zrZUBLyf5kqfJATZ6C1iHaaJH8qwPfV4vzg6VfFEaZ/Ewy4fF6mHkLJZ
 euEODkVWA6bjYEQsuYcZfdeyZbylzZ+JllALBHCWWxkIxup3R13jubbmDAJ5hmvRr2Gp
 9vkWkuzgIHCrj/KYD75ZHC7ypaO5sLz5rNfrcn2ZCf7Oe3bkZW9ne8YPRkeXdJrk1Wau
 BTvePogv73VyyS2MT3dfTasQjAExUmP51QHvzm9Xob8mZnNT/h9ys5fsOtaDnywAZxX0
 H9+HX9Eux3F2amNBBbyo2FFTRxrMLd7bdA/7S1sAqJg3AktyhsM2WW3Dkw2soRQxqXq0
 6kJA==
X-Gm-Message-State: AGRZ1gLxUr+DpJ6uaHY6845s1Pl8QY0d0jjfP0r7bFDfpUputdbZLWjU
 rv60QvmFwdaFGlzbWzzHsn9bpZ2mmo9GcA==
X-Google-Smtp-Source: AJdET5crePwuX3iWAcG6Sk5Iwc/G42BBcG1N6h9rWiyc9OekrzSMXg9zmHXm3iGYiEebUcjgBWLFGQ==
X-Received: by 2002:a62:5fc5:: with SMTP id
 t188-v6mr6017356pfb.84.1542129639257; 
 Tue, 13 Nov 2018 09:20:39 -0800 (PST)
Received: from localhost ([64.114.255.97])
 by smtp.gmail.com with ESMTPSA id x123-v6sm28284916pfb.124.2018.11.13.09.20.38
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Nov 2018 09:20:38 -0800 (PST)
Date: Tue, 13 Nov 2018 09:20:38 -0800 (PST)
X-Google-Original-Date: Tue, 13 Nov 2018 09:20:29 PST (-0800)
Subject: [PULL RFC] RISC-V Patches for 4.20-rc2
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
Message-ID: <mhng-2b0cf1d3-ff52-41e3-a683-5875c687984e@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181113_092050_641488_78EB4A32 
X-CRM114-Status: GOOD (  11.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181113172038.4rDko9s4n11bLuKWfU4rW5cPlLx7aHkloNgoiobL7II@z>

The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.20-rc2

for you to fetch changes up to ef3a61406618291c46da168ff91acaa28d85944c:

  RISC-V: Silence some module warnings on 32-bit (2018-11-12 18:12:24 -0800)

----------------------------------------------------------------
RISC-V Patches for 4.20-rc2

This pull request contains a for unrelated patches that fix various
issues in the RISC-V port:

* A patch that enables printk timestamps in the RISC-V defconfig.
* A whitespace fix to "struct pt_regs".
* A patch that adds a "vdso_install" target for RISC-V.
* A pair of build fixes: one to fix a typo in our makefile, and one to
  clean up some warnings.

There will probably be more patches from us for 4.20, but I don't have
anything that's ready to go right now so I'm going to hold off a bit.
Right now the only concrete thing I know I want to make sure gets sorted
out is our 32-bit stat interface, which I don't want sitting in limbo
for another cycle as we have to get RV32I glibc sone.

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: defconfig: Enable printk timestamps

David Abdurachmanov (2):
      riscv: fix spacing in struct pt_regs
      riscv: add missing vdso_install target

Olof Johansson (2):
      RISC-V: lib: Fix build error for 64-bit
      RISC-V: Silence some module warnings on 32-bit

 arch/riscv/Makefile             |  4 ++++
 arch/riscv/configs/defconfig    |  1 +
 arch/riscv/include/asm/ptrace.h |  4 ++--
 arch/riscv/kernel/module.c      | 12 ++++++------
 arch/riscv/lib/Makefile         |  2 +-
 5 files changed, 14 insertions(+), 9 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
