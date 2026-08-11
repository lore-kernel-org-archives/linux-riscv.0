Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD8C5B569
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=810Kr44F+9r6X1aaiU0k1isEzgkN8hyy9Yn9bJgIDeM=; b=vzNZFZsjUx3Tsk
	xwdIKv6LvzWC8GzBzOgCuvBLOIxk4fVu8NTZuOtf9OWBI/dD1W5evx0uvXKhTsP5t7zb0hTElwXLr
	mWzCq5gxFWh97qLtelLrhmkJsBWJcH6FGUBWVSr+RZa1yxEiiPhXrDaI9wjiPHK5cGDLdm4hZ77NC
	+Pk0gr0EAST5EU8ZkECyItuzoPfIiwDU52XtQM89BYVTZPv3ML6vgxWTReYx+RgSHK/aNFTYEqUbU
	js6atfYDpqPJEMzR8n22hyeK9F6aWNwV+sZ4FIW8dGmkLNZZK1HFiQMEd4h2F1SIjTV3BhK1mQL6e
	7ZnhTt6nJp7Cgm1oWiqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgGN-0000000DRqk-0H6s;
	Tue, 11 Aug 2026 06:47:03 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgGI-0000000DRpo-3l4S;
	Tue, 11 Aug 2026 06:47:01 +0000
X-UUID: 6ac332b2955011f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a73af0d5-b5ef-4b25-adfa-b9cacb7e3291,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:fa7966228d4a12c53e14123b7712b27c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|865|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6ac332b2955011f1aa26b74ffac11d73-20260811
X-User: liuxixin@kylinos.cn
Received: from [127.0.1.1] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuxixin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 249032367; Tue, 11 Aug 2026 14:46:44 +0800
From: Xixin Liu <liuxixin@kylinos.cn>
To: linux-riscv@lists.infradead.org
Cc: atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, mark.rutland@arm.com, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, liuxixin@kylinos.cn
Subject: [PATCH v2 0/1] perf: RISC-V: check cpu_hw_evt before dereference in overflow IRQ
Date: Tue, 11 Aug 2026 11:51:00 +0800
Message-ID: <cover.v2.1786420235.git.liuxixin@kylinos.cn>
In-Reply-To: <prp0001riscv.1786064390.git.liuxixin@kylinos.cn>
References: <prp0001riscv.1786064390.git.liuxixin@kylinos.cn>
MIME-Version: 1.0
X-Mailer: patches/scripts/send-local.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_234659_585467_A8E1DD91 
X-CRM114-Status: UNSURE (   6.06  )
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

Thanks for the review, Paul.

v2 adds Fixes for the snapshot commit that introduced the early load,
and Assisted-by for DeepSeek v3 help. Code change is unchanged from v1.

Thanks,
Xixin Liu

---

Xixin Liu (1):
  perf: RISC-V: check cpu_hw_evt before dereference in overflow IRQ

 drivers/perf/riscv_pmu_sbi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
