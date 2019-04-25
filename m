Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DCDC10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:55:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99612214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 05:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IKmLgkjy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lNlQ6QVa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99612214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=b8cnYWPa7TZbzRudhqLEeiwG2cQwMWPRUeFY3vtP7xU=; b=IKm
	Lgkjy3KQBeHH3Hd27LjJznDtfX9WJEKbIcJ7RDwytUDAwFl9584jjF8MbvfM/093e67A8CJu0z+lO
	YdmVMcAdfHRFK12BdBXLVEavPDZTAWmW+DbeHVN3KjYMQAzREKpZQwAMkxYrwSzT+zez2lRrzqznN
	EjMzg8t/QNi/str2XJawIhl0IqNiDjse887cLuzdBHN5gnkTJziYUeIto37srp2nurgBdFCHAZfYp
	m2VSXaYnjFtDqPocUq1JvsPB7pyy9i+hdQhEBoJVbmSkiJoeZMu2dSl435f4C5fSpLRkmX9+JS4YR
	N2cX9iTWWojbwnTlNJewWSgI/xFKYaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJXLt-0007ft-J1; Thu, 25 Apr 2019 05:55:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJXLq-0007fG-2A
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 05:55:19 +0000
Received: by mail-pg1-x541.google.com with SMTP id y3so10587963pgk.12
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 22:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Pd8JWArOp7QBWH4Bz/BLcKRsri2NYRWh9cFvMPJbnHM=;
 b=lNlQ6QVaAEpyYH2CPaJ6RUlfaSfjAwgodzgq+pAVNfA0tbkP5hZ7C3t1c1eJyooyOj
 Ee1wD/thz31u6JB/1/GCbRpL07j18kHBOYFnZPosuNjxKCda1/1tSdlfsX33g0Pm9aq4
 yTVscZ07fTY9rt9wJ8Tp2KCWcPDOOS8/uiefc3/6g+8AvErpO4YMl0dUCsA0gmvG5ztc
 8fQb/xmEF30hSgCENaGKTZV+DnGvmbygm9FMA2OWM2rn3UuPwruCSmSjFqsC2VprR33c
 M3cnJT220ekvzOiVRxvpBXPSp77aNV3O1NgbZ9BXAftFP8ENiOci1oGZWsK9Hnm+pxhq
 xPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Pd8JWArOp7QBWH4Bz/BLcKRsri2NYRWh9cFvMPJbnHM=;
 b=ACdsO3CxbDWXqEvW5VgzkTy4w/CY0xTYdmFrw5RJWG0isVzRzXC+/AX90vYE67VnAc
 UP14qeiy++u24SQCcNE6jL4P67hdViJ6aD07es3Y9SLMw7Ed8Xifb7ryyc3K5Dnspi8g
 N24Nppl/I5VjFdizuk+5T1uwPQMfyBdKxwdf3S+NPaI2G+LFnHApw69m0ubj+lao8UMf
 V70SED/wHB1LHmGRk6f1tAr5lIUl8TBaVUQE1fnm0U2qzldJVXyBc6nIsSCu165k432r
 8IaWJMZ6mKzwXP8UYvmm3U+2Rdx/BHCjmm4wRQY0+N1qjYtWkOBMUCBRHp9FvMl010pV
 Px0w==
X-Gm-Message-State: APjAAAWuCwvIGKDJgXGwdgH3VdENyp9ySnrcvZ6ryT4HeUSwd555Rodp
 +XutnnL2DFzLN5iz2j7AulAsMmczMuA=
X-Google-Smtp-Source: APXvYqzEyeNbWc8N7QcxEBLojkHQZOeGrYW8IOEn/1nRGuk/+U1H5bQn33IW4Xd/qK0vfFh8AJ5nHA==
X-Received: by 2002:a65:484a:: with SMTP id i10mr35166470pgs.408.1556171716673; 
 Wed, 24 Apr 2019 22:55:16 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id m16sm46332170pfi.29.2019.04.24.22.55.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Apr 2019 22:55:15 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 palmer@sifive.com
Subject: [PATCH 0/2] L2 cache controller support for SiFive FU540
Date: Thu, 25 Apr 2019 11:24:54 +0530
Message-Id: <1556171696-7741-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_225518_162844_BE66AD3F 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: mark.rutland@arm.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds an L2 cache controller driver with DT documentation
for SiFive FU540-C000.

These two patches were initially part of the patch series:
'L2 cache controller and EDAC support for SiFive SoCs'
https://lkml.org/lkml/2019/4/15/320
In order to merge L2 cache controller driver without any dependency on EDAC,
the L2 cache controller patches are re-posted seperately in this series.

The patchset is based on Linux 5.1-rc2 and tested on HiFive Unleashed
board with additional board related patches needed for testing can be
found at dev/yashs/L2_cache_controller branch of:
https://github.com/yashshah7/riscv-linux.git

Yash Shah (2):
  RISC-V: Add DT documentation for SiFive L2 Cache Controller
  RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive
    SoCs

 .../devicetree/bindings/riscv/sifive-l2-cache.txt  |  53 +++++
 arch/riscv/mm/Makefile                             |   1 +
 arch/riscv/mm/sifive_l2_cache.c                    | 224 +++++++++++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
 create mode 100644 arch/riscv/mm/sifive_l2_cache.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
