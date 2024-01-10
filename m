Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729E6C4707C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x4/0HTI5AafNOlNNQkK4TvY+33hX0/RGWwGlYfiED6I=; b=GdfsSnqJGD8rnt
	i7uWo9VSdVXZ99qidG/92FwioDpNNVfV1PmX4goMb4UaacHcOFYzai23Sq0Kfmjfw4G4xhxa4+khd
	/dBej1sOd9VAwvY8FtFl54jHOJLA1QVSPu1+cDs04suFSD1DHp3D2hZcgvu7bmzNBWPq+NHe3IaD6
	uMYOTMMlC/39sfpbzX7+iDtSI4jdnUXssUWccvsCD8ZXyW3Td9Zv45onDLlicxcq5/IVQPZ4pRBI5
	UCcKLOwS8dih9nET9jepgobvsWy/tS7uto7gcmwSs33PLjHe4d+hN8yn5UyPsMol6l9I9ehIWYiOu
	CR1b4B4ZwyNCqejT/BSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNa01-00CR8j-0I;
	Wed, 10 Jan 2024 14:56:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZzy-00CR5v-18
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 14:56:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a28da6285c1so753487966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 06:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704898561; x=1705503361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT2eSHWPMa0CfkUYcyephB76FUQGzAdMqHMJhGcnqGg=;
        b=AVLf8iy2yU9OctQrdVIoLiRa6ya1S9gswyFsYa35BCVqpdIEumVt9uh0wIrRYO1yLj
         g8lp4tyJUzniEwWk+w13qKAPgfsSCVDce9mo8duIPxVQFmve8RHeBgpHhUCGA3D0Rhgn
         kfe6ja2AiqWmvQeIDT6CM388oGLqSWzNuCN5Z4BWIIN+VlZFYrl/wSOjgdmT0xSF/sA2
         JARy8ynGZO8A/i0C5T9gzY5COAWu8sJjLrrbKIz4gCr+nkROcGd8IcCluYqDVofI2LRj
         5Ltf03kLPxhIY+JHB/6CihAVtFayPU86ATeXbH4XfUpOCORu0lIQE4T7X6wxNIo3bhWH
         bjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898561; x=1705503361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT2eSHWPMa0CfkUYcyephB76FUQGzAdMqHMJhGcnqGg=;
        b=sS7s4yVMIwUJRj0CHogFGtDZdKnPUpe1yEH74Qy8g2oMIXxx0uc2kFB4fqhNnPRP/i
         iy4l0BlGDRuTSGDsc9AoTjiwzWjcpXSjhiBlQnQGku8+6zgqsrP3TIydMfTc5QGGzTYv
         DWgUhoz7LTSQNbkV6YHitQfeJx4nRsPc2uSymu6qXU72RgE91irioitSpLuUxL7fZoWu
         C2SSSnYP2gtWqP+YSnR19gSEPSJx9E2Pbw4VXihFqNAYzHXoEPIu6zuf/pJ3oswLY9m1
         Yxo8WV02xjsPWcATJ3dw8uyEpVSwRBW/HUPsaZvPZPR5opsM3KJLSpQFVpOngQevYpJJ
         u9iQ==
X-Gm-Message-State: AOJu0Yx5FFBEMLHw20/7mGFRlOUsgyLW/CJ5ZiKlBMSciXiMP1vr2coy
	p9uinnTkc7FDjoG/cNEgceY=
X-Google-Smtp-Source: AGHT+IHrjyyhLlNqwU8/0GdBQslEryV7QKCfwc4yBbC9sDbUDW7k3PCxt9OHW7khy/4PiPOl6+oPtQ==
X-Received: by 2002:a17:907:9307:b0:a2a:dc24:849 with SMTP id bu7-20020a170907930700b00a2adc240849mr226303ejc.43.1704898561190;
        Wed, 10 Jan 2024 06:56:01 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.29.12])
        by smtp.gmail.com with ESMTPSA id bm3-20020a170906c04300b00a2a4efe7d3dsm2161032ejb.79.2024.01.10.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:56:00 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	corbet@lwn.net
Cc: mmaas@google.com,
	hboehm@google.com,
	striker@us.ibm.com,
	charlie@rivosinc.com,
	rehn@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v3 0/4] membarrier: riscv: Core serializing command
Date: Wed, 10 Jan 2024 15:55:29 +0100
Message-Id: <20240110145533.60234-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_065606_390118_3C58DBD4 
X-CRM114-Status: UNSURE (   8.87  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Changes since v2 ([1]):
  - amaned inline comments
  - drop ARCH_HAS_MEMBARRIER, create membarrrier.rst

Changes since v1 ([2]):
  - add smp_mb() in switch_mm()
  - introduce ARCH_HAS_MEMBARRIER, amend documentation

Changes since RFC ([3]):
  - introduce prepare_sync_core_cmd()
  - fix nosmp builds

[1] https://lore.kernel.org/lkml/20231211094414.8078-1-parri.andrea@gmail.com/
[2] https://lore.kernel.org/lkml/20231127103235.28442-1-parri.andrea@gmail.com/
[3] https://lore.kernel.org/lkml/20230803040111.5101-1-parri.andrea@gmail.com/

Andrea Parri (4):
  membarrier: riscv: Add full memory barrier in switch_mm()
  membarrier: Create Documentation/scheduler/membarrier.rst
  locking: Introduce prepare_sync_core_cmd()
  membarrier: riscv: Provide core serializing command

 .../membarrier-sync-core/arch-support.txt     | 18 ++++++-
 Documentation/scheduler/index.rst             |  1 +
 Documentation/scheduler/membarrier.rst        | 37 ++++++++++++++
 MAINTAINERS                                   |  4 +-
 arch/riscv/Kconfig                            |  4 ++
 arch/riscv/include/asm/membarrier.h           | 50 +++++++++++++++++++
 arch/riscv/include/asm/sync_core.h            | 29 +++++++++++
 arch/riscv/mm/context.c                       |  2 +
 include/linux/sync_core.h                     | 16 +++++-
 init/Kconfig                                  |  3 ++
 kernel/sched/core.c                           | 16 ++++--
 kernel/sched/membarrier.c                     | 13 +++--
 12 files changed, 183 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/scheduler/membarrier.rst
 create mode 100644 arch/riscv/include/asm/membarrier.h
 create mode 100644 arch/riscv/include/asm/sync_core.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
