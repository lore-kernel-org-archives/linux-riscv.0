Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F00FFA374B
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r5ux7MmdrCEJT7Jf5Qj+39iwtMB9xsnUuz8psCXM/wc=; b=RwOF3URwleWTV1
	Hwt4Kdvte2e0BdWnBs/QqMuBO0evXmtbJccFN3EhSvpk74oH9VwHxFSXUIRlLupTbZnygncIp+ZVf
	HO5c8JGon7kSg3tBaMDoJV4OaGS6t3O4rCla5sXpmZ3knXk+J3whdbkl1FasNEJ3pCT3hkS/TkOD3
	qNRJr8fKgwRAchyBhEBoxRxGHfMaTRvWqA+UhgGzqws1V+cB+GFxcWzj3/431+MduEIZ8b5rnCzhN
	EUkqyWNtzKCtrpuGHkgtUJfuY4+M6nKpod+07JdweGrZv6yLrQ9QaJXNktljSQpDMguOsGFKiiaj9
	L1iOf7YSuraHfj536G9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgc9-00000008OX0-015e;
	Fri, 02 Jan 2026 14:58:53 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbgc6-00000008OWR-28tf
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jan 2026 14:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=OV01wve0EB7hlDog0UIx2pJcygkePvLbSTiy31DcX3E=; b=HalY41Iyeu8XAd
	NMxj40TaqAxNP/uksiGYrMPM3nSS3NzHe+qchHEUNU1BGc4vxmaU+L8OI9ulZGLTJywHGaNRphBxd
	JnpZJVOTrgLySJkmwrgRo1v5fdLHWN5uee7WuGTP4zBXBDzX5FALpkXUhDGyPRxm3bf8oRYdeFe96
	cHtM2ruksW298C1V64Rn67F1JWLm2zbjIpi82Bk3Dl4KOHVpXEkp7R4AuEj4LjRfECRUN85XGTEJf
	tsjCtOH2zT+qjhCX+1kByvTerImzWmcPR9ehJC5WYMvDDMsM/1KfK/5T+LG8zS3QXQTAbL6mdsuBn
	oXNqCuZadVZfn0pZceqQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1vbgbx-003odt-A4; Fri, 02 Jan 2026 14:58:41 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1vbgbx-00000002l8v-0EvY;
	Fri, 02 Jan 2026 14:58:41 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com,
	pjw@kernel.org,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: cpu_ops_sbi: smp_processor_id() returns int, not unsigned int
Date: Fri,  2 Jan 2026 14:58:39 +0000
Message-Id: <20260102145839.657864-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_065850_630081_2E96A99A 
X-CRM114-Status: UNSURE (   9.95  )
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

The print in sbi_cpu_stop() assumes smp_processor_id() returns an
unsigned int, when it is actually an int. Fix the format string to
avoid mismatch type warnings in rht pr_crit().

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index 87d655944803..00aff669f5f2 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -85,7 +85,7 @@ static void sbi_cpu_stop(void)
 	int ret;
 
 	ret = sbi_hsm_hart_stop();
-	pr_crit("Unable to stop the cpu %u (%d)\n", smp_processor_id(), ret);
+	pr_crit("Unable to stop the cpu %d (%d)\n", smp_processor_id(), ret);
 }
 
 static int sbi_cpu_is_stopped(unsigned int cpuid)
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
