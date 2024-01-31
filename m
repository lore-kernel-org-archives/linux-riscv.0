Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8FFC47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 14:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QC9gZg4O+irfS20HcCTYOT5uKYccYxGA7ZoLS/D3vcQ=; b=BFOps/Mp/WciDe
	6XnJznvYqAOAFeMAVE8ONEsd+qM2aXPB7Wy6/s99u3cdW1NAlYmiaxD5O+xlVcFD9xG6yUj7GemsN
	L0lHoMDNMDkkdhqL/zAyLZWHD8loufbfnx3Cx73GPdRfVkVlVV4/YbUj8HrrJkzrGMLWGkSS2ZZmW
	Y9ceHZh6nqy/2pIOG6BX2EtHVloK4vC//W/79xZfZPY9iTJXXEH0QLgQ0Z2ZfCcn7nso1s276hywN
	nRSMy9lzOmf444AO0gWuVl3mwijQBcmNMkX8B91KihES4VdVvAVJxi5uGotcLHPhtfufmZiE5nMUo
	R1+WzfUd3aSmZA8JNpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBum-00000004064-1MYX;
	Wed, 31 Jan 2024 14:50:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVBuj-00000004044-2LYZ
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 14:50:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33ae3be1c37so627283f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 06:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706712607; x=1707317407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K1YLIh2nVQJJCIilz81iyZeLDwXJ42HsJIqsijT+HGw=;
        b=lPqr55uS4ah9sK3C+/if9HYy7/m+NjYMf4G2RBUq8E7CTyqGJfzcfWsX307Kq+UOTr
         I4qKTI+uzo1zv5i18Vr9SYo5Nuyly85Z13KJYlKJMgH0ka0M6iSFXW9qV2PbBUqOk0Jy
         iOvLPGk9BzeRqRQ4KdqS2/Evtgc458RBDTCU46QAOM58CIeNKEIREnbduEKtP9T2DWVI
         oP4FS89IWwzJOPwdY2rsy+CwB+Qf+lS4Bu7evhy0vKOfZeCqxCZj/43u1TGovPyWNLOj
         4XUoWx7NUDu37lsM/EYgic9rV93rltUIoBk/lD+RSivnQcuLVxg+nCQSN75jyX9h9qKc
         RVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706712607; x=1707317407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1YLIh2nVQJJCIilz81iyZeLDwXJ42HsJIqsijT+HGw=;
        b=fXR9ERXV7opujh/50h3tLJrle2L2lRCs6YfEWQKKGpTPlUwk3+qfjwEaGHOo8SPurb
         gV69L/hwyFBUfFEQ6pLRQjcoE6NnvSaxoApTYc4Acjmi5T1wu0JeLFkyynwNjMnhnGsH
         mvK0yPL5zj8Iwd8KQubIZMy0Pw9SpZ/AzSi4HuhMA5p1BxrlQ/06IyUCJ4f9xHu+4FDl
         ggGEZIrp9FXhdOJ95e569jA6Ewi/jdlC1iYmwVCnAsScOPwDGWxhl0NHyvwwgmxaorG3
         rl3a5geddQG7lhiwk8ddi78uuUU4dLS/bVPGkHSuxUChsV4gb1Bsk6CXgqHbe6LO4wNr
         aimw==
X-Gm-Message-State: AOJu0Yw/YiFtNPSVzkfv4qlCFL4qALgX+XoMEjMKjAT3ssiW7IJp1dBq
	X6SwDZQhzV6Kqu//edxIlEHjuqyQvqNEuFyrTTgtIgZo0asDiJKH
X-Google-Smtp-Source: AGHT+IF1ghLuZMInvOU4hSpQjCeevup4f1d0A02ll5lGsKhvvzHZpWEf5ue0F6K1TZzPHtX6RtGLrQ==
X-Received: by 2002:adf:e8c2:0:b0:33a:f277:8f6 with SMTP id k2-20020adfe8c2000000b0033af27708f6mr4479255wrn.14.1706712606529;
        Wed, 31 Jan 2024 06:50:06 -0800 (PST)
Received: from andrea.wind3.hub ([31.189.8.91])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4046000000b0033b0d049c71sm419265wrp.54.2024.01.31.06.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 06:50:01 -0800 (PST)
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
	rdunlap@infradead.org,
	sorear@fastmail.com,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>
Subject: [PATCH v4 0/4] membarrier: riscv: Core serializing command
Date: Wed, 31 Jan 2024 15:49:32 +0100
Message-Id: <20240131144936.29190-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_065009_641160_887B8EF4 
X-CRM114-Status: UNSURE (   8.29  )
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

Changes since v3 ([1]):
  - amend documentation

Changes since v2 ([2]):
  - amend inline comments
  - drop ARCH_HAS_MEMBARRIER, create membarrrier.rst

Changes since v1 ([3]):
  - add smp_mb() in switch_mm()
  - introduce ARCH_HAS_MEMBARRIER, amend documentation

Changes since RFC ([4]):
  - introduce prepare_sync_core_cmd()
  - fix nosmp builds

[1] https://lore.kernel.org/lkml/20240110145533.60234-1-parri.andrea@gmail.com/
[2] https://lore.kernel.org/lkml/20231211094414.8078-1-parri.andrea@gmail.com/
[3] https://lore.kernel.org/lkml/20231127103235.28442-1-parri.andrea@gmail.com/
[4] https://lore.kernel.org/lkml/20230803040111.5101-1-parri.andrea@gmail.com/

Andrea Parri (4):
  membarrier: riscv: Add full memory barrier in switch_mm()
  membarrier: Create Documentation/scheduler/membarrier.rst
  locking: Introduce prepare_sync_core_cmd()
  membarrier: riscv: Provide core serializing command

 .../membarrier-sync-core/arch-support.txt     | 18 ++++++-
 Documentation/scheduler/index.rst             |  1 +
 Documentation/scheduler/membarrier.rst        | 39 +++++++++++++++
 MAINTAINERS                                   |  4 +-
 arch/riscv/Kconfig                            |  4 ++
 arch/riscv/include/asm/membarrier.h           | 50 +++++++++++++++++++
 arch/riscv/include/asm/sync_core.h            | 29 +++++++++++
 arch/riscv/mm/context.c                       |  2 +
 include/linux/sync_core.h                     | 16 +++++-
 init/Kconfig                                  |  3 ++
 kernel/sched/core.c                           | 16 ++++--
 kernel/sched/membarrier.c                     | 13 +++--
 12 files changed, 185 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/scheduler/membarrier.rst
 create mode 100644 arch/riscv/include/asm/membarrier.h
 create mode 100644 arch/riscv/include/asm/sync_core.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
