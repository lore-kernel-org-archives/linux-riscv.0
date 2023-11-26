Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAF5C07D5A
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 15:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o9GFz35dM1Y+58qfCEffO5ZVExw5n4hAZzouQ8uoZnE=; b=DKuPFlICUBlWF7
	joHi9olLG1q9a1etfx4VN8ylO7iIZXC+5wRCf47ASg+1VWXhWTcWIOw+UzNBTaBk5kT488/hUKsYn
	EacXxOAWiFmPn1LFrhosAsAAPh7MC3JAoimX1obzMZvPIDULUzFISy+37yRFfYC09xEB/DiKba6Xj
	EtNYiIhHa4zj4jt9uZVBzqVTc8DUQta0qdqFBsPj5y7DtVi+XB9bGUtSzzO2ohWmLIBb+0YXobPSR
	rDWEpnSVtYlSAW+LpSV951Em5bsl/nObGHB9qU2aaJ2Ye8OCxSvr/kATSH63A7LFhx7yC+qEF/uHu
	rsMKHnZ4/AOuEP0Joe+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Gts-00CEm7-0J;
	Sun, 26 Nov 2023 15:18:24 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Gtg-00CEdF-0H
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 15:18:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D88F5CE0E4A;
	Sun, 26 Nov 2023 15:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45156C433C7;
	Sun, 26 Nov 2023 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701011884;
	bh=cG0xmrQqzxNCm05ACdLm/5/wezI54OJYvdcq4wahVlc=;
	h=From:To:Cc:Subject:Date:From;
	b=kSkP8/+6o6D6pMMWo7R5finvJU7XC84qa0YeX3ftxsSvBq60BfDAOxfxmVJwITASc
	 UTgQapkKZ9T0/AkgotOqXj15PswtR+hxYJ7blYv4hoo3muPWO9ZvxNC+FCFHSg8SyQ
	 1l4+moHZbwj7WTUORxad6zCw2Lqms3BbNJLduWq5cJ2J+LDFI9SDeLPvKtYlTwEggy
	 Q+KNABR2uSwv+7K2mAnkWt8YV06mbejx2dk7fBVDnjHSAyYW1I8o0B4UCnKPsFzfqu
	 XOKB4MC5bRaP+tUkjwp5NV4axgRCL/M+Bu1d0GdBYUQjqMNu0D5Csgr7QAhv0Ri1DZ
	 S0dqiHCr0OCTA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: remove unneeded #include <asm-generic/export.h>
Date: Mon, 27 Nov 2023 00:17:38 +0900
Message-Id: <20231126151739.1557369-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_071815_010092_8B704664 
X-CRM114-Status: UNSURE (   7.14  )
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

There is no EXPORT_SYMBOL() line there, hence
"#include <asm-generic/export.h>" is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/kernel/mcount-dyn.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 58dd96a2a153..952233aa273a 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -8,7 +8,6 @@
 #include <asm/unistd.h>
 #include <asm/thread_info.h>
 #include <asm/asm-offsets.h>
-#include <asm-generic/export.h>
 #include <asm/ftrace.h>
 
 	.text
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
