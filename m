Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE87EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n4QbAjCgHX3HMU/LwahE1PcoW9pOZ+KX4kh+GfCXfy8=; b=3ASKsk28sI6RK+
	G6AGwqD0Oi6MGmA54Xc8rOgdB4FgG5cDw1Ld66raXycfHWa08tv0SU7nFgOhw1UFQf1AZCyQ7iQ8s
	SWnOateGwYYz+y8/Qx5QI/Hh40UEUoxMvOv1HjlY2xt+TgacMmX5tdafiMkTqnyaO+M6LswNF7m0P
	orqI0aMJqUj6puDu5GYFKqwsDSwAIYNDicG8WASjG0ELAAgBYFCQ4V0AJgzKwhylsdYebkWfJWLot
	wKNp8l5+QTB72SJNrFbITCyVoofatIZWr0h78E8Hf2xPj8hKArCn2hsTI3gL6NnEEYhC3J5MUALZz
	e7t0ZlsbFyyGT/jVg8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeBr-000I64-2E;
	Mon, 14 Aug 2023 20:29:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVeBo-000I5S-0D
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 20:29:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso48240305e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 13:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692044960; x=1692649760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=skSB4WHU3agMjJpOp9u1pm8XMUrKGCqe8s5rHJ83mN4=;
        b=Or6W+MyYdzgWVg0EXjQdL0ZcBCjMAqFuhX5sDn+BcGD8aboekDkvSvOwOk+luDHptx
         6s7wmrrsNTu004AuQlBu4xn4HYDHjXxOQ6r6fcuqX3t9FxsRJe2M3fET8GBY1zkaTD2c
         R+ZZERmnklkYXD6A5t/hmH48wMelboOh0bhiJ6IbuvnT5LHKE2D05rg4xBAkmLYavlh1
         2Or/np0KX1OwetUabXZLodsVJr5Qupqn0oMRwd3N/x1V46GeeWm0aALa+CFl6hwbH1f5
         qXkDVdEb4+SwMvGbwA2xEO5ULKrSAmee0tNCPbtCXvzmURBXJqcxFb2kzw43JKG62/Cs
         YG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044960; x=1692649760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skSB4WHU3agMjJpOp9u1pm8XMUrKGCqe8s5rHJ83mN4=;
        b=HlwGML7zB9SZCRYTkZPVi6z2Ls56E1r6lWxep6Bw2sdM4ZdYuFMLm8PRckecP/eWCu
         ogTUvN0Nom6KjEzBoKdfsmqyrkRFS+hMG/kxDwHOfgiUGfj19lz/lcQp7jVMIc5x+jec
         6+CtdrJz9vqpecUwG5oKhoSt7bDJGbjD2iM/4tGpTNTOG54lDzOI+8ApuY3WhjPTNHNg
         xjt6BMjWn+1jr5/GAuKkFBEVsCL4PYC/+wHezhRmbUlKrjT1FlTsYc0UOoJPw/yZdAw3
         CF+7wLoNjzsJj1fclBEIuFaxpLnjuqXN8Ck/QFboyy/vl1876aoUYG2P6Uc+e5Drf6g0
         Gmcw==
X-Gm-Message-State: AOJu0YzIlh52XkL/Y3rkoEuCFvUukFJ7EkVPlRAq/d4qQ+RBDWnptIkG
	N2y5CsW9FiuRiKFY/p/1tcg=
X-Google-Smtp-Source: AGHT+IGJy9RL4HpNQk9B8SeZ2pp6kejrgfM+jYh9YwXWRnBdq3gVXv7Z1R3XJ8gvGk1+6UcVr/rYWw==
X-Received: by 2002:a1c:4c0e:0:b0:3fc:3f31:4233 with SMTP id z14-20020a1c4c0e000000b003fc3f314233mr8605181wmf.38.1692044960131;
        Mon, 14 Aug 2023 13:29:20 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:20e9:baea:a4f7:d880])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c024800b003fd2d33ea53sm15181223wmj.14.2023.08.14.13.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 13:29:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [(subset) PATCH v2 0/3] riscv: dma-mapping: unify support for cache flushes
Date: Mon, 14 Aug 2023 21:28:18 +0100
Message-Id: <20230814202821.78120-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_132924_101331_0464D9F9 
X-CRM114-Status: UNSURE (   8.24  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch series is a subset from Arnd's original series [0]. Ive just
picked up the bits required for RISC-V unification of cache flushing.
Remaining patches from the series [0] will be taken care by Arnd soon.

Cheers,
Prabhakar

v1->v2
* Dropped others archs
* Included RB and ACKs
* Fixed checkpatch issues

V1:
[0] https://patchwork.kernel.org/project/linux-riscv/cover/20230327121317.4081816-1-arnd@kernel.org/

Arnd Bergmann (3):
  riscv: dma-mapping: only invalidate after DMA, not flush
  riscv: dma-mapping: skip invalidation before bidirectional DMA
  riscv: dma-mapping: replace custom code with generic implementation

 arch/riscv/mm/dma-noncoherent.c |  50 +++++++-------
 include/linux/dma-sync.h        | 113 ++++++++++++++++++++++++++++++++
 2 files changed, 136 insertions(+), 27 deletions(-)
 create mode 100644 include/linux/dma-sync.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
