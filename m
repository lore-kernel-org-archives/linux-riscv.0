Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BBDC77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 19:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v3qWom9AViEgbfw2oLhNoEMAdAStD+rhwf1jpX+BwWI=; b=oM7iJzRTz4A9Wf
	0pca1tBv+725vBKzBY290MoNWHyyy8ot2p55qb048xuWO8XLVh/AkPjyqv2ubvKCKy+gnn20lJaOF
	25gnNSzYFW0bAoNl4ohq2tyj2N09pKVwlHJuJm4AtMWg3124mU5KILspU+jviumdtDsGFQxVa0wWu
	0IV52Pgur3wNsFMOt/OJRBeDNAYKoJydne3zWbcUop8v8CVu0qdN6ZbclFjnIX5omyAfGC/U+dEgx
	9jCtGGBR/odgLU51rnbL5QOss34iOnCgOdIISpaAc1pD2RdwEkonJ5XPhmTHuHz0vGReqWIvdSZmY
	xJql5jbYXIVhKQEkPQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psTQE-00Bb7q-03;
	Fri, 28 Apr 2023 19:06:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psTQA-00Bb6v-1r
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 19:06:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1a682eee3baso2621275ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682708776; x=1685300776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7CXCSpVGMZwlJc9agpmg1mVXv2Z1n756Do/clETpg4=;
        b=3iKbY/L1kcMW/nkDKn0zG/qygIat+lYQ9xCBRzlv/+txh7nL7tH9Kk7taPffuRVV0t
         Jg4XHTdUa23X4HjhOhoDWS9JoXK6Y70R4hRtNgkbNECSUUnNHsVkK8XLYTQAjBtCYwut
         P6uCtNz3A+ExkBT7fUdhCrExZuOCgzc7Rt9/QqFpD91I847M0DImYjpwun4/lOASRn0G
         MuhLMWTc26o3cxHS0PwEFNBmUkTLgh6M2ZCGQLO4KObMAswrNg/YO9APCcL1uKw6kGbo
         2HvZUzv/lxYSYGqaLjveBvBY+V6GHdlhsWVuc29UPAIXfYNfUI6pxq8f2ShOmlEefqWe
         oF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682708776; x=1685300776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7CXCSpVGMZwlJc9agpmg1mVXv2Z1n756Do/clETpg4=;
        b=KtzyXIo0R2/TLbin/54QRuVAal6WfLKZ5LecBs8GDcOvoQjm20e2wzGKJ2R4I08VWg
         NzRkVdj7JgGZsxomoxpf8NAu44iwDNeD+Q94WYF9+0ZFUoNOt2YlfoKjZChz9rE/JsIu
         gN60DsVMrH907e7tu9cvi0GPTBLFXy3wa3PyXqoIY0rwF0ek0IHKnXhNAHng7PoSFNk2
         XQRHhqF1GbOJPCUJygUG+plLODhNRrHXLUKGCVJICAVOF/gkLo2rKcFbgiBKHdVqUnPJ
         5qiXF4LKOZ7FxiPzSwU2zGNdnMXEFNCQ0gSIuyjWaJ9FPRbn0eAYUfzaBez+OHUHGXA5
         oehA==
X-Gm-Message-State: AC+VfDw73bQhFPOt9/oIW1Am+kdG/PlH0GT95A95Y4quZk3cfZo9onrZ
	XyP3UcbE7E+I/KUPBSUUwzmxng==
X-Google-Smtp-Source: ACHHUZ5bl9aZkrVmX8UgFEMi974XV7W/i2zRAEerPhd7l6PlWqjxEN/CCQPy3oDNjJBzAorqJcEz4w==
X-Received: by 2002:a17:903:11c7:b0:1a9:7e26:d72 with SMTP id q7-20020a17090311c700b001a97e260d72mr6763944plh.9.1682708776298;
        Fri, 28 Apr 2023 12:06:16 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902d70f00b001a6c58e95d7sm13580733ply.269.2023.04.28.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 12:06:15 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH 0/3] RISC-V: Export Zba, Zbb to usermode via hwprobe
Date: Fri, 28 Apr 2023 12:06:05 -0700
Message-Id: <20230428190609.3239486-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_120618_834998_B0006E20 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, Andrew Bresticker <abrestic@rivosinc.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Dao Lu <daolu@rivosinc.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


This change detects the presence of Zba and Zbb extensions and exports
them per-hart to userspace via the hwprobe mechanism. Glibc can then use
these in setting up hwcaps-based library search paths.

There's a little bit of extra housekeeping here: the first change adds
Zba to the set of extensions the kernel recognizes, and the second
change starts tracking ISA features per-hart (in addition to the ANDed
mask of features across all harts which the kernel uses to make
decisions). Now that we track the ISA information per-hart, we could
even fix up /proc/cpuinfo to accurately report extension per-hart,
though I've left that out of this series for now.


Evan Green (3):
  RISC-V: Add Zba extension probing
  RISC-V: Track ISA extensions per hart
  RISC-V: hwprobe: Expose Zba and Zbb

 Documentation/riscv/hwprobe.rst       |  7 +++++
 arch/riscv/include/asm/cpufeature.h   | 10 +++++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
 arch/riscv/kernel/cpu.c               |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 ++++++++----
 arch/riscv/kernel/sys_riscv.c         | 43 ++++++++++++++++++++++-----
 7 files changed, 70 insertions(+), 13 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
