Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20624C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vry4y1+QE0wTqp5TLWgzHXxjnqUpYbXtbh0zWH6L1PA=; b=bwbxeTasbKcjpt
	bImBOadRFNQdvHKpft/BWXS5swOatNuVyEWEswz9sTRJqk/8JmA3yMyk7RteT0vdpjOLtgWuaHSmG
	8h4W/NbEM76ovdQvBOpBzL50DQN5Rz6gaAbaCvT8wvCZ2QSMW3XKgd4Ia9lM8gy2joUOpoHxbCFIH
	VnFF8dDs+iev9J7dQHgnBsnyzhNmsZQSb6S4UQZ82dIvCDw47m+78U8ZYxwmku3C9MELpeBpcepvV
	8TwpiUovhzsoxucgruEGARuBsEDIhZOHofCaQSnBB0a3YrPjEbtGPesKVvYvpoaYctiIqTr9STIea
	dlV1KYe5aX1xmwo/UcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGNu-00000007T63-2JYg;
	Fri, 07 Aug 2026 08:56:58 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGNr-00000007T58-2v7F;
	Fri, 07 Aug 2026 08:56:57 +0000
X-UUID: ebb01f68923d11f1aa26b74ffac11d73-20260807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:4eeddb90-fa73-474a-986e-260bf26ea54f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:234afb9af18c4a6d3f3da314451f87e8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ebb01f68923d11f1aa26b74ffac11d73-20260807
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 186140113; Fri, 07 Aug 2026 16:56:47 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-riscv@lists.infradead.org
Cc: atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v1 0/2] perf: RISC-V: fix SBI PMU masks for RV32
Date: Fri, 07 Aug 2026 16:50:00 +0800
Message-ID: <cover.1786092600.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_015656_028288_FBB0249A 
X-CRM114-Status: UNSURE (   6.42  )
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

Hi,

This series fixes two RV32 mask-width issues in the SBI PMU driver:

  1) Overflow status / restart tracking is u64 but used BIT(), which is
     an unsigned long shift and breaks for indices >= 32 on RV32
  2) The available-counter mask was a single unsigned long while
     iteration uses RISCV_MAX_COUNTERS (64), so RV32 can read past the
     object; store it as a DECLARE_BITMAP

Patches are independent. Please review.

Thanks,
Xixin Liu

---

Xixin Liu (2):
  perf: RISC-V: use BIT_ULL for u64 overflow masks
  perf: RISC-V: store available counter mask as bitmap

 drivers/perf/riscv_pmu_legacy.c |  5 +++--
 drivers/perf/riscv_pmu_sbi.c    | 35 ++++++++++++++++++++++------------
 include/linux/perf/riscv_pmu.h  |  2 +-
 3 files changed, 27 insertions(+), 15 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
