Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E2BC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 17:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aoc3oAkOYQ9rSRG3QXxZlDZHMUnTOGZBsYErqVtWV4U=; b=kTh/BU3D8tGGdx
	bR9iV9CABvssmq3RtgnHYkXrQLVx2ugzCe4VcdnZP9Qy0Sgt+ARtB6wkdy6hyDkHK6hqQSBCePU7n
	TjfObKP+2dDgDqaDjyvplPPjM9Uc0yK20e9Rt0BEqwW8W6yzwFhoGxR/RS7ieAUtkONvkYW2HtURg
	bcJRAlI8dOhj5ONMxsLoE4ALxn7ghaCHm28rz4dHQiiQFkBQ5XyxD7eonRa15sb8AEZdccB4Cx+rA
	GDY1/ApI4YYu9Zf9+hbAySE7vE+/BUFEsKmvg1Y+0+i26gtEzv4/Gle2dW7ep8wlmMzjdCecyIc3h
	trLQSnAg75Zl9KhwboDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUd-003aiB-Bv; Mon, 11 Jul 2022 17:46:47 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAxUa-003ag2-Ox
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 17:46:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id o15so5449479pjh.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 10:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5XRxNayKB2/09n5GhBRk+xuJegv1gyBvkxUNQ9XgvpY=;
        b=Um2h0NdAmGJuqfwpNMaLuKxtCxE3/DL4xL8FJYr+MOXXhJ7du189crJIxCiHrlM+Wm
         eQV09crg+elDydbcZT/pi3KPVBt6t0i9hJb5YBoIqF4LpeODdhfV3c8/3KnvE65yCRj6
         ErppussGk//ZNRx1joA+NViPAS0cyntB80mEqPNj7h0QVanQkzBmOsWhYLaYoWKeGFAA
         05JDK5RGaJ/5s0xlLDMx/BSV+0bBqHCmk8T1fSSAoa/BB53hMYWnIG/srN9eIkCp2kgD
         HoCsbmFtX/BXptfwIKqA+uPlcng/8hU52EUdRzHegUM3ZdJfPwjppCCWH4KDnHqid7c1
         UDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5XRxNayKB2/09n5GhBRk+xuJegv1gyBvkxUNQ9XgvpY=;
        b=g1OaUGoNaA1Y6O/QbNOzzqA2PjHT1f1xQri4kJWgSIusgHxdzC6OuovtHHx9a9UoDi
         rvYvuUf6WyvBk5xZ3Xprp/IyxTAahL4r+kPjJ6oQICDyFx56TO/0aIuq67JhEsBFtcIL
         tqWtuNFwDiphdncwsiDT3ll9s1si582YrhLmOGjMpnJgNZg1GrBIxS3k5sDszvdQn7Ne
         FWiweX6y3vGnbsYLwPeWSQzi1VCY//imAp9cQHBdYUu2IA1hwzawm9bLwFMWUscco0vY
         IbArU4duQdU78l9bJRdjMUUHOY/Mb3Y48474iWuL8RQzKVzigsQyDpS30Goxz+8kC2px
         /MUQ==
X-Gm-Message-State: AJIora8CEqBm99m2I69yEsKvYMWIkyKhDEyel6zm8V4F5aXXRP14OVEK
	9lzef+/Y2/oQEnMzec/+LC/HPA==
X-Google-Smtp-Source: AGRyM1t/+6ncVipFqtlOlC5IFcREal5eiWVWO7r5Vv0m9tT727BpocTVseKaczC0lJyhnZV4gAqn2A==
X-Received: by 2002:a17:902:f64f:b0:16c:23c2:e2dd with SMTP id m15-20020a170902f64f00b0016c23c2e2ddmr19339072plg.3.1657561602710;
        Mon, 11 Jul 2022 10:46:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b0016be9fa6807sm3236866pll.284.2022.07.11.10.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 10:46:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v3  0/5] Miscallenous improvement & fixes for the PMU driver
Date: Mon, 11 Jul 2022 10:46:27 -0700
Message-Id: <20220711174632.4186047-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_104645_047880_9E0C3AEF 
X-CRM114-Status: UNSURE (   6.85  )
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

This series fixes issues PMU driver code.
PATCH 1 & 3 are fixes for rv32 while PATCH 2 fixes a redundant
user page update issue during counter start.

PATCH 4 & 5 improves the SBI PMU definition.

Changes from v2->v3:
1. Added two more patches that fixes few typos and enable support
for perf support in KVM.

Changes from v1->v2:
1. Add proper compile time rv32 checks.

Atish Patra (5):
RISC-V: Fix counter restart during overflow for RV32
RISC-V: Update user page mapping only once during start
RISC-V: Fix SBI PMU calls for RV32
RISC-V: Move counter info definition to sbi header file
RISC-V: Improve SBI definitions

arch/riscv/include/asm/sbi.h | 32 ++++++++++++++++++++++++++++++--
drivers/perf/riscv_pmu.c     |  1 -
drivers/perf/riscv_pmu_sbi.c | 30 ++++++++++++++++--------------
3 files changed, 46 insertions(+), 17 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
