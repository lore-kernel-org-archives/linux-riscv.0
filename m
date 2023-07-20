Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C5FEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oBBK43FNfp5ZPTz5vz5qcz5Fw+5JyVPSWmuAZhvY9n0=; b=yAgCZaK+YsSD5p
	sZ/E0friH9J+qv6nH/CJLj+eY4ixVEFLukLiFOkp71J5L8foSVOf9a0/b+2z3flhEHGPEI6WxsiP3
	Mk1Jk3kdsv1WF6ko+iP4SnLC236H6tJCyV2prwkpyWQcxJRqWpTZXehI1LF/wnss54xk4gefjJGdR
	9kq0hbunxCHqmEExd4TipeWWrSJPWiuvDTS2Xp8w261YH9YXo6s3y6dXzPfcxtmkEb44VBEMCtHe+
	chGvFA9yHhVLo6vGg7+lTY1HpeUapnOzCn5INgtuvK5XkTWo2KF0/yivgfRJGQZFJPupdGnO9EooF
	Qff2dd/JDaSJ54L3Jw2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVuW-00BaOf-2B;
	Thu, 20 Jul 2023 15:49:48 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMVuS-00BaNo-3D
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 15:49:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso6609815e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689868183; x=1690472983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzMa4g2hoWRnrtKiEBOwGs4jBTqhlAFiRuirBCpPB08=;
        b=Jd6GQ803X2qJY8axDRFBnNQApeLwHULaUnzznruB4ISc7Fu0Rc28DXZX7pfTWRBV9v
         BHP4I8llCRIOLAPbaK5lJe7tOkGUr6pGXgkmxdHVy79dwtdv97xuMNkaFAMQDFjC13ja
         A95+7C2qvajV++G0dvGk3dJptW9Tt/QLrh8dTRdGXlPwcTzUyOmTEsz0sQ02CLdprFrr
         nhOPxCtJ9qvrEz2Duwl3v4hihMVc64FG7mogJWqG5mNxljYradPkpUqUbyswtdNFwPv+
         sYK5hlIjrUgIAInka6tK1kb3UaX5QaJj264CMF2qMxTiQBrl62HUWKwAMl5AYGOh8f2d
         sFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689868183; x=1690472983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzMa4g2hoWRnrtKiEBOwGs4jBTqhlAFiRuirBCpPB08=;
        b=Ds6Dpi8zVOqjeSODak3vLv21WLAy+WsWcDrVQkuI9JsTzRCQl4CefI+1L6go48BG8V
         3pe7IviAzrxNmFLXxBt7bFMz2V43jN8FUCvzyg1Cf2u2i9BkyhbydPB+vG+AXGaXK2Zg
         jd2QV2U0Qzu7K2Hq8cie2aWQVmkA6r1Xt/hByzTW85bMT8gkPhacXR9hzuTV+L8pIdDS
         /3TnN1fIAI/t5GHJBkK6KSUzOH+vKjwm6xTqDCnofGVlVBH6U1jCBMJR3P+feXlWrQM1
         dA6/RhpHKs1OUO001BaCHwmhRtjP9vt1mq6+iEDf5FkzBzCkKaOslSBQaMQDrWod1T6T
         P90Q==
X-Gm-Message-State: ABy/qLZrD5GKlPrbh23Yri1Mk0WKxS43ewCaoTUWbk4ZytKQWzYYIIf5
	Qw3oYU+51XnP/xIZ90gGOx8=
X-Google-Smtp-Source: APBJJlEXFXP6wrCikC4tAfcmBjYqQ5J/lPdj73vtjUWmypWzwMsjtoD8LH8ctgHtCZ9xlQfKtlW2vw==
X-Received: by 2002:a05:600c:2290:b0:3f6:d90:3db with SMTP id 16-20020a05600c229000b003f60d9003dbmr4850758wmf.3.1689868182527;
        Thu, 20 Jul 2023 08:49:42 -0700 (PDT)
Received: from ip-172-31-22-112.eu-west-1.compute.internal (ec2-34-244-51-157.eu-west-1.compute.amazonaws.com. [34.244.51.157])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c00c600b003fbdd9c72aasm1471021wmm.21.2023.07.20.08.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 08:49:42 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	pulehui@huawei.com,
	conor.dooley@microchip.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	song@kernel.org,
	yhs@fb.com,
	kpsingh@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next 0/2] bpf, riscv: use BPF prog pack allocator in BPF JIT
Date: Thu, 20 Jul 2023 15:49:39 +0000
Message-Id: <20230720154941.1504-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_084945_040083_E370BF7A 
X-CRM114-Status: GOOD (  14.13  )
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

BPF programs currently consume a page each on RISCV. For systems with many BPF
programs, this adds significant pressure to instruction TLB. High iTLB pressure
usually causes slow down for the whole system.

Song Liu introduced the BPF prog pack allocator[1] to mitigate the above issue.
It packs multiple BPF programs into a single huge page. It is currently only
enabled for the x86_64 BPF JIT.

I enabled this allocator on the ARM64 BPF JIT[2]. It is being reviewed now.

This patch series enables the BPF prog pack allocator for the RISCV BPF JIT.
This series needs a patch[3] from the ARM64 series to work.

======================================================
Performance Analysis of prog pack allocator on RISCV64
======================================================

Test setup:
===========

Host machine: Debian GNU/Linux 11 (bullseye)
Qemu Version: QEMU emulator version 8.0.3 (Debian 1:8.0.3+dfsg-1)
u-boot-qemu Version: 2023.07+dfsg-1
opensbi Version: 1.3-1

To test the performance of the BPF prog pack allocator on RV, a stresser
tool[4] linked below was built. This tool loads 8 BPF programs on the system and
triggers 5 of them in an infinite loop by doing system calls.

The runner script starts 20 instances of the above which loads 8*20=160 BPF
programs on the system, 5*20=100 of which are being constantly triggered.
The script is passed a command which would be run in the above environment.

The script was run with following perf command:
./run.sh "perf stat -a \
        -e iTLB-load-misses \
        -e dTLB-load-misses  \
        -e dTLB-store-misses \
        -e instructions \
        --timeout 60000"

The output of the above command is discussed below before and after enabling the
BPF prog pack allocator.

The tests were run on qemu-system-riscv64 with 8 cpus, 16G memory. The rootfs
was created using Bjorn's riscv-cross-builder[5] docker container linked below.

Results
=======

Before enabling prog pack allocator:
------------------------------------

Performance counter stats for 'system wide':

           4939048      iTLB-load-misses
           5468689      dTLB-load-misses
            465234      dTLB-store-misses
     1441082097998      instructions

      60.045791200 seconds time elapsed

After enabling prog pack allocator:
-----------------------------------

Performance counter stats for 'system wide':

           3430035      iTLB-load-misses
           5008745      dTLB-load-misses
            409944      dTLB-store-misses
     1441535637988      instructions

      60.046296600 seconds time elapsed

Improvements in metrics
=======================

It was expected that the iTLB-load-misses would decrease as now a single huge
page is used to keep all the BPF programs compared to a single page for each
program earlier.

--------------------------------------------
The improvement in iTLB-load-misses: -30.5 %
--------------------------------------------

I repeated this expriment more than 100 times in different setups and the
improvement was always greater than 30%.

This patch series is boot tested on the Starfive VisionFive 2 board[6].
The performance analysis was not done on the board because it doesn't
expose iTLB-load-misses, etc. The stresser program was run on the board to test
the loading and unloading of BPF programs

[1] https://lore.kernel.org/bpf/20220204185742.271030-1-song@kernel.org/
[2] https://lore.kernel.org/all/20230626085811.3192402-1-puranjay12@gmail.com/
[3] https://lore.kernel.org/all/20230626085811.3192402-2-puranjay12@gmail.com/
[4] https://github.com/puranjaymohan/BPF-Allocator-Bench
[5] https://github.com/bjoto/riscv-cross-builder
[6] https://www.starfivetech.com/en/site/boards

Puranjay Mohan (2):
  riscv: Extend patch_text_nosync() for multiple pages
  bpf, riscv: use prog pack allocator in the BPF JIT

 arch/riscv/kernel/patch.c       |  29 ++++++--
 arch/riscv/net/bpf_jit.h        |   3 +
 arch/riscv/net/bpf_jit_comp64.c |  56 ++++++++++++---
 arch/riscv/net/bpf_jit_core.c   | 117 +++++++++++++++++++++++++++-----
 4 files changed, 174 insertions(+), 31 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
