Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25802C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 12:35:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C51B42242A
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 12:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C51B42242A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+00KZ/9in66rHZZwxoSit5Yp7RCYyiTbVUoli2eoBxQ=; b=yU3ARzIO77Smqrr2/b1kBVeDyC
	Lczzj3avFy+M9Kg8F76c2SNIoPyInjx0Ee/jf4lOUJ3ALn99bIkaCwlBGhBA02zPdA6sYE9v65Eno
	TFSLGVbsiLRuBRAnvGGoij6eAkT5i1q9MmZChXOFjMX5/uRt7dh9muoJTQQ/WkB7wLAXxTTrqX/P+
	wwMDpvttQ2NEs+qMc7mfrGRsPyyXmk9BOkHCPzboPtSY7lMFGBWOubI/h2V9vehK0HV9Yy6ltpul7
	kiSnLWDzHLubONina6jCCsIKXQB5XbSzn0/GnzaHvFHrZxJCL5wzixwMeMWOqKF/lGmH53BQwGOY1
	b0J/Ge6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kywPX-0002kW-T1; Mon, 11 Jan 2021 12:35:03 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kywPU-0002gY-NH
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 12:35:02 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DDtRb2Wrwz7Slp;
 Mon, 11 Jan 2021 20:33:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 11 Jan 2021 20:34:37 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 <linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH RESEND 0/3] riscv: improve the stacktrace report
Date: Mon, 11 Jan 2021 20:40:11 +0800
Message-ID: <20210111124014.182957-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_073502_229959_A5C11A95 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen Huang <chenhuang5@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Make show_regs() to dump the stack to improve riscv crash report,
and also fix the wrong value when stack unwind if FRAME_POINTER
enabled.

Chen Huang (1):
  riscv/stacktrace: Fix stack output without ra on the stack top

Kefeng Wang (2):
  riscv: Add dump stack in show_regs
  riscv: Improve __show_regs

 arch/riscv/include/asm/bug.h        |  1 +
 arch/riscv/include/asm/stacktrace.h |  2 ++
 arch/riscv/kernel/process.c         | 16 ++++++++++++++--
 arch/riscv/kernel/stacktrace.c      | 22 +++++++++++++++++-----
 arch/riscv/kernel/traps.c           |  3 ++-
 5 files changed, 36 insertions(+), 8 deletions(-)

-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
