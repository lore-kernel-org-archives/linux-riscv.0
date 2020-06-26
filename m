Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F0FC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 17:42:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21EAE207D8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 17:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLT42XU0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="GOIg3hTt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21EAE207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HEJQ/1cgW1HrmdSulkkzH0vS6opNmhSUuIwlZ3Hfalo=; b=CLT42XU004pMadp6vRKOtrWuh4
	TZluW+nwxfWshausp+uxOvl2LAo/qVEbp7Lrql7S5CQzNRX02/GujYrCfNMGyVVSRXiINaufJX28l
	5vGJOxpGXasOFgynnh+EprmmC9JDYeom18/gBmtKuk1QoqubaginrN9ni+G3RjrrEkQeoApgpOtGw
	pTXWTt7zkGcvPQbNBA1qL/ht/Zn8KvqaBVgjmK1gucYqZlbQBGjyslA7wQTP/iF1Acqt5/vyeL6oK
	xBYW8RjRSTcd47XlcfmF7QqoiGQ2o1yRcM8uuX0Mi0WYgcfKqzB1QTbYIOEctHgy25qTGHmW9merN
	qo7ze7sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1josN4-0003kQ-Jn; Fri, 26 Jun 2020 17:42:39 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1josL2-0002dK-NF
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 17:40:34 +0000
Received: by mail-pj1-x1044.google.com with SMTP id u8so4982053pje.4
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=H5jNivKQc7Xy0+HbQegQizEbfkQBMIXMrjdDpo4xU28=;
 b=GOIg3hTtF5n+/he2cnf+Si31ylL8KVCeA64/aUZ6v0nVuzFHU7VxvWfuME1q7hbXes
 jwAnViQgZGQGyeXdPrjqHCxEBE52t+t4+eb9jhlN54o6viW1V7tltGamKof/8gSplttW
 VR0gPLMJeERAw0m7MABEBxVP6PcEealGaVAhl1JX2KZzFBoDCOA6vpiSIn0A0lnmjTEw
 0ORekmNdIp0NCVgTj9jdMcxVzXNHvLJEMzOkBfbq01VnX9M6IuEZD2LlEr7N6YzGpWTJ
 W06rMk2loOaAUAfJGYPXJN09XXwoOuHGSG8cNaGCsc7OaPDQNHHyDS6G6ziOufjs6raw
 EpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=H5jNivKQc7Xy0+HbQegQizEbfkQBMIXMrjdDpo4xU28=;
 b=VBhEFVTrIIjv3vwn7csTPK5a9ZOZiIQ18gUP/5OJ2z15lFZdnN/mnhBDnSkCcQZkEQ
 wuUXWC2LlALRN9OQphEwMmDUxQvGpZM4mhnHrNTNR6TU9JQQqFpvXBY6B6eB8xs+S613
 lImQMYiy1NEK02GStckiATmTNZ2JWZqE2PNkxfd8rdcviIcevekBuvy1GGmyaUROLhYk
 wU90wQA0f0gTkBnoAIQPD6JM1hPutfXeAQRrb5O1o3AcAGXkWKt5huxdpY15cFXcpCu5
 kiFq9jRT6UIzrdieQzqPnyX1ya8MVK9c4TXyHOKbVHFtVv7G++IkCLozNFAAv1dbcE9M
 iLzg==
X-Gm-Message-State: AOAM531BGjqZ2puy8dxHzVJSu7b5OKGSEPombaSyO8aaEckhDJElABev
 hxyjbsc4UE/r4nKlboxya3rupJSsqr1MLg==
X-Google-Smtp-Source: ABdhPJz19HMzR8QqhtQZxsKkdkG9LZ33lZPze8mK0ZqD92jHMiM1A6M2Ll2rpo23iGlWfetFLHsbIQ==
X-Received: by 2002:a17:90a:1b87:: with SMTP id
 w7mr4600230pjc.177.1593193229446; 
 Fri, 26 Jun 2020 10:40:29 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n3sm21773706pgq.30.2020.06.26.10.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 10:40:28 -0700 (PDT)
Date: Fri, 26 Jun 2020 10:40:28 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Jun 2020 10:40:26 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.8-rc3
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-f93a0d3b-0f13-4426-8f7a-77c153f1098b@palmerdabbelt-glaptop1>
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.8-rc3

for you to fetch changes up to e05d57dcb8c71492268ff46ba9bfe9a9cfb1f95d:

  riscv: Fixup __vdso_gettimeofday broke dynamic ftrace (2020-06-25 15:38:39 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.8-rc3

This contains a handful of fixes I'd like to target for rc3.  Most of them fix
issues with the conversion of our vDSO to C.  There is also one fix to the
SiFive PRCI driver that I picked up as it's causing boot issues on the
hardware.

* A fix to allow kernels with dynamic ftrace to use the vDSO.
* Some build fixes for the C vDSO functions.
* A fix to the PRCI driver's memory allocation, which was the cause of some
  boot panics with FREELIST_RANDOM.

----------------------------------------------------------------
Guo Ren (1):
      riscv: Fixup __vdso_gettimeofday broke dynamic ftrace

Vincent Chen (3):
      riscv: Add -fPIC option to CFLAGS_vgettimeofday.o
      clk: sifive: allocate sufficient memory for struct __prci_data
      riscv: Add extern declarations for vDSO time-related functions

 arch/riscv/kernel/vdso/Makefile        | 5 ++++-
 arch/riscv/kernel/vdso/vgettimeofday.c | 6 ++++++
 drivers/clk/sifive/fu540-prci.c        | 5 ++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
