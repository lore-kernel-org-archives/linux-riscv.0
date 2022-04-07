Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE05EC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Apr 2022 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F3OyUE2W3CjPfDHgZ07J02M8Z5m8xkw1BUAHzsE+KCM=; b=mufiteM7319LSd
	mvrj/L8SfareTPSqN6pRcdymJ5j3McMWkloX88Z5UteekvgxvxxlH889kUj/f7lbvz2FlTJNDwjVi
	l2f4Jw8gWBJ130JgeT/SdwXZ2UfIRAhp4gR6z4EV1SNfPHsFOp4wK7mWLhTSjqgnmJpSzPPs7saPs
	tHkzCVaV0pPDLOxU3ZsgdJgY63tDdtb8Ljn9WdJtZ/zeEdwCaOqvvmGutqend7Zdpoyvuedns6dZm
	6qQev+Z0wGtupQ3stboV48KOnYROIX+FglomERgUJRgZb268fIGxnc3NubEEpQ0TkAQAVz29sy4CA
	is+98s5+07B+lZOwOzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncMen-00A0MY-BR; Thu, 07 Apr 2022 07:34:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncMeT-00A0Dk-K0; Thu, 07 Apr 2022 07:33:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF3D4B826B6;
 Thu,  7 Apr 2022 07:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6A0C385A0;
 Thu,  7 Apr 2022 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649316834;
 bh=xjLgB5PrZaAqNXMKyws1eRXeGpUexWFgvPvaoYecqs8=;
 h=From:To:Cc:Subject:Date:From;
 b=Au9/wc6+Ragli+eLY5wZFETAnYQtG3/nG8XNYR0WnZUpS6F/4SopgPC/jX2Pdougd
 MHudk7DtRxUlxt9gc22aQ1zHgxtBOhgMVQBrLzHoS0k7U4Px5QJs5qdKLeL6+i45qo
 qjymLcfdNYI85/BrfR5HkGznCURUJsOMtGpWtqHfQRhSwc0MBHKWpgaGEGbgb+hGrb
 yqI5mr+xxx51Ihclz1RgBvkyKahgCXIT8iRWuRQSCB24ftNLKDRlw0gfpejeMOBDbU
 JDB3DShnCZg5CEB1KGZd4S22VeJ+X53KEQTaz3t0iejjnwVI8WxFPrwHW+KGf6+0jG
 CM/vqrwLZjZGA==
From: guoren@kernel.org
To: guoren@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 0/4] arch: patch_text: Fixup last cpu should be master
Date: Thu,  7 Apr 2022 15:33:19 +0800
Message-Id: <20220407073323.743224-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_003357_841511_205064A7 
X-CRM114-Status: GOOD (  11.93  )
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

From: Guo Ren <guoren@linux.alibaba.com>

These patch_text implementations are using stop_machine_cpuslocked
infrastructure with atomic cpu_count. The original idea: When the
master CPU patch_text, the others should wait for it. But current
implementation is using the first CPU as master, which couldn't
guarantee the remaining CPUs are waiting. This patch changes the
last CPU as the master to solve the potential risk.

Changes in v4:
 - Add "Fixes:" for stable fixup
 - Add cover letter for the patch series

Changes in v3:
 - Separate the patch for different arch.

Changes in v2:
 - Fixup num_online_cpus() - 1 is not last cpu

Guo Ren (4):
  arm64: patch_text: Fixup last cpu should be master
  riscv: patch_text: Fixup last cpu should be master
  xtensa: patch_text: Fixup last cpu should be master
  csky: patch_text: Fixup last cpu should be master

 arch/arm64/kernel/patching.c      | 4 ++--
 arch/csky/kernel/probes/kprobes.c | 2 +-
 arch/riscv/kernel/patch.c         | 2 +-
 arch/xtensa/kernel/jump_label.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
