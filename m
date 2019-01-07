Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22166C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5A5F2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYuik/7/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="z9XzDcy1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5A5F2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=O7AiEY/GcAgw/dOH6Mo8V04SbnlykIvcTiBz+ToY5Q4=; b=bYu
	ik/7/1pBbMYj7iKXCYCJdwUuHeWeUza3WuoPbI7liIrxxqg34hfzRR2I5hju4NcsUFcGin2O8EhN6
	WuL0P/iY04YhzJOQrlfPoLlnKECuXzS4+vS0iqh778MU2GGFa/3oVGWV5eU3RiPFPF+jjkLJQdohN
	G39AGmrBy0GBjES5VCBJwYUL0lNlXJSFwr+GE76E1+I3fMe0SkDJlX8VreMrT7LyEW/fx52eIIu1e
	T5gyS6j78LTUiNx/8tY1F1zKPrv87c6h+vLZRxfLjtHc/9Z1DOwqT/Ddz2xGHFAbTGtzqk5eClGzO
	mbf3gBq7lP8OGI9WuIK6JwiGw5O23Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXUf-000544-V4; Mon, 07 Jan 2019 16:11:13 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXUb-00053K-QO
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 16:11:12 +0000
Received: by mail-pl1-x641.google.com with SMTP id gn14so344868plb.10
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 08:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=r+bbCVvJkcdWrVFRIVDVXamcKKSHxagP8W8Jb1FDxYQ=;
 b=z9XzDcy1of7BfEH5zq2Cyro9679+pORefM33EwJ3aDSKyRGyQVC4wwnZhQqrR/wLJ2
 Dkh3o3WhR0+c6bIz8qG8vJxFPl6fabgFbSLjADfnBaya0dQXFM/50nnB3IrBWaUm1UiN
 QCSm8JKj4IZNxQTjdr0AER3VKQxTByh9N6pJ3E1gs7qhK3zlXlTpkln5gd0mLF7EeBVI
 GHIaObfwAplHtBf7G1oR+op4X5rGcOmDl90N/2Btt0qzyD7zNXdCuLltw/LRp4lN3EbM
 r05NglnIfPDp1rZ9JGDfQ3f5GXz2TyCEh+HAOdUh86CO3zUdiotNx1J5w74eWR/9focA
 Vv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=r+bbCVvJkcdWrVFRIVDVXamcKKSHxagP8W8Jb1FDxYQ=;
 b=JyEmLjbgfevbKQ8yt29r+9K74c7pol9Whfglb3EnBteIw/ohBHahB4Xc594gAvvwT3
 2aBh/kYwT5gtWSTO/QYOZzkHFmP1qVOzhdlbHiFUdrefz59GDHg+iB6zVqz1/E1PQbNk
 c1MkgCll48lLvmlaGkVa3iGAJdZt+BEPmjjuUVN5gsLAwOhQDo4cgCE7M00/uFbpM6dQ
 Hwnmka/xunrPrgYn/Myt0gEPO6ClRyilIfUWi+4KZDnZZjsv2uI2e5LHwdhKvBmftLc+
 0BFQaBOS2axsehQLi4c/dAuKUoWOvN6vejQ9pYTfB6vIaYPxK2oCVlWJ/fnZZPfve8EH
 +jLw==
X-Gm-Message-State: AJcUukc6/pBtld/m0EysfzV/8234Whtt6Id6Ijjxg9FBAyVBWsp4OJ+d
 513gC8p5njyJJ2VsCiSz/DVz+g==
X-Google-Smtp-Source: ALg8bN6kZXlXrShgikTMcu6Ca2qumG5QUiMtCF1XpdgJuv2DfBtPdXF3GgEhpXT3zdrD1G11ulwXfg==
X-Received: by 2002:a17:902:280b:: with SMTP id
 e11mr62036116plb.269.1546877468236; 
 Mon, 07 Jan 2019 08:11:08 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.214])
 by smtp.gmail.com with ESMTPSA id a10sm93243512pfi.138.2019.01.07.08.11.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 08:11:07 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 0/5] Fixmap support and MM cleanups
Date: Mon,  7 Jan 2019 21:40:42 +0530
Message-Id: <20190107161047.10516-1-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_081109_990899_06F8B749 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset does:
1. Moves MM related code from kernel/setup.c to mm/init.c
2. Implements compile-time fixed mappings

Using fixed mappings available, we can now get earlyprints
even without SBI calls. For example, we can use kernel
parameter "earlycon=uart8250,mmio,0x10000000" to get early
prints on QEMU virt machine without using SBI calls.

The patchset is tested on QEMU virt machine. It is based on
Linux-5.0-rc1 and can be found at riscv_fixmap_v1 branch of:
https://github.com/avpatel/linux.git.

Anup Patel (5):
  RISC-V: Move free_initrd_mem() to kernel/setup.c
  RISC-V: Setup init_mm before parse_early_param()
  RISC-V: Move setup_bootmem() to mm/init.c
  RISC-V: Move setup_vm() to mm/init.c
  RISC-V: Implement compile-time fixed mappings

 arch/riscv/Kconfig               |   3 +
 arch/riscv/include/asm/fixmap.h  |  52 +++++++++++++
 arch/riscv/include/asm/pgtable.h |   1 +
 arch/riscv/kernel/setup.c        | 106 +++-----------------------
 arch/riscv/mm/init.c             | 123 ++++++++++++++++++++++++++++++-
 5 files changed, 186 insertions(+), 99 deletions(-)
 create mode 100644 arch/riscv/include/asm/fixmap.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
