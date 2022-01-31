Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A34FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uv+LPAOUHx/orulpMMTRQoKSBnjlkU+8ftiLPiaP3Lo=; b=wNxN+h++WY7JhD
	6kIDFvsE/t/m4R2TlSu/+LJjGcWzOPNXDxF9kjVgvWAa3wur99ZTj6OO7CKSQ5Nx0xmMAgoY+zoAK
	5HfIlMQeHf9yUfFd6UlK/KFxxMQ+w6x11A0J2pWbc3BfrQaGwjTowgIhRpZlQXkHQ/bq5Q1HHwDkb
	6QzUL50LihjJMoZ7CJL/AW6xrHRpa9yiFtZktkoFuUUcifuLhVkd9368Fb//wVclQMLfqit4QAvCh
	VdO5HinycK3usipEHH9wieiYcT6eScXbAueokC1LY30ACSB2gzlZihQDNcXI+vyAnPZ5nw8iHkrRp
	z71xEzDR5dI0XOWnA2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbOv-00AL8c-NE; Mon, 31 Jan 2022 18:27:41 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbOt-00AL7n-QA
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:27:41 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 s6-20020a0568301e0600b0059ea5472c98so13802679otr.11
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lK9HI/kqkRjUJVN/KDGUc8YUdnUJMrUkHZrERJHnf+g=;
 b=W8FKpKtzRvZH5gMtZhs9iIt59SzSkJsmfP3crTbAutMw5vzj0zU+YZNTG3BU16KdlZ
 G5qVtQKQe48huZBnn4iMLaknUbAIFqysXcnCUBkhjK4BaHMdcT1jFa5QYUcoJzEvCiSV
 TQK8iFA+IPnh2ANJRDiJRWIJ3v7h38htvZLeodwkYCLOzYXMW5ItjESK6DrVadPgEBoL
 +/3hi0AvgPis6EDrjPSRPiqsKjhvtfxDXRBQOVqs2/SqZfmXJOQ3GD5sHFtKX3v2yrlF
 URbp52XXzJe8yOB9KMKlyPpK+HWHepSo1LttT4HARNoxU8MuG8Qr6r3lEBb/7wXFV9cJ
 pGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=lK9HI/kqkRjUJVN/KDGUc8YUdnUJMrUkHZrERJHnf+g=;
 b=hBVnpoFIeKdIXa1mNoNNUxLj44Gnai/aWYwgydPPWjXjYpj/dQYlrGPX34ylIk221l
 +kChtC3qqj4F7mS3huf3AA9QohzLFhy8iRXBzkqBhIg5xJxH0ulZvRKo1MDKoL6yYMYV
 bc2e1VPOeq7MaeHpoW3+ripjJWBptls/lxsVBSLkR223hFoi0xexu653ffFBYZe0/3GZ
 ndjNRqu7WcIW40tCAt2Bnjz1ITCioHgcBabuGPoTuckxMeZdVG17gi2lPOXBOp2zA7DI
 KFG0bagGYQD1GRrvpSLHpYbbwDT09zYDx100lORq2rblAXOV49NYND0N6QxsEOM02Esz
 ntaA==
X-Gm-Message-State: AOAM533WFCPlBEnZq9kHeUSzLCGqZLGcmXaGeizO9sENQCmWNl8hkC0i
 O339/K9GvVq46nrqz7yE3V1SQOSeNZ5QbA==
X-Google-Smtp-Source: ABdhPJyX2cZIYrb8zsfJu0kTdNdvTTTibkTAgJpG/7isbGwNuD8rJ6Iwvngg7+UAdkh3RSQUIKtp0A==
X-Received: by 2002:a9d:12b2:: with SMTP id g47mr12795393otg.19.1643653659130; 
 Mon, 31 Jan 2022 10:27:39 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id a26sm16041676oiy.26.2022.01.31.10.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:27:38 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] Module relocation fixes and asm/insn.h header
Date: Mon, 31 Jan 2022 19:27:13 +0100
Message-Id: <20220131182720.236065-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102739_873856_89830182 
X-CRM114-Status: GOOD (  11.02  )
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

Apologies! I messed up v1. Please consider this patch set only.

The first patch removes a bunch of code from the asm/module.h which is
included in almost all drivers through linux/module.h. Next are two
patches to fix unaligned access when doing module relocations and do
proper range checks for auipc+jalr offsets.

I'm a little less confident about the following patches, so consider
this more of an RFC for those. The idea is to consolidate the RISC-V
instruction generation and manipulation similar to arm64's asm/insn.h
header.

/Emil

Emil Renner Berthing (7):
  riscv: Remove unneeded definitions from asm/module.h
  riscv: Avoid unaligned access when relocating modules
  riscv: Fix auipc+jalr relocation range checks
  riscv: Add asm/insn.h header
  riscv: Use asm/insn.h for module relocations
  riscv: Use asm/insn.h to generate plt entries
  riscv: Use asm/insn.h for jump labels

 arch/riscv/include/asm/insn.h       | 121 ++++++++++++++
 arch/riscv/include/asm/module.h     |  87 ----------
 arch/riscv/kernel/jump_label.c      |  12 +-
 arch/riscv/kernel/module-sections.c |  71 +++++++++
 arch/riscv/kernel/module.c          | 237 +++++++++++++---------------
 5 files changed, 306 insertions(+), 222 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn.h

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
