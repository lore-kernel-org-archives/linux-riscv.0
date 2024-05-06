Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D6CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 May 2024 02:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KnGyBLZvQDfzv+rruuf3DH8kJqdTGsEDhqLFaY9OAkw=; b=NGjpeI/6//9Dkw
	mBomOtCEvyC2b/28GrWIwYxvemMvFjHVuhr+K3wAg5mJdDwE84/sEDHUprAvSE+nSoAa29RDCLK7/
	N9TUfpoSeMFZuC0kugTCq4aar5pJH0M5C9tiEhblsvB0l/1TYdY+uDWB8PYEteMK7x+NaAHz7NjoR
	nrW3xlrT63k/d/C64quKw7nNqWJWKGNgfzfHVVC/TVfIM28u8XDJY8uiwVc0gT+Kl34qc8y5NHri4
	BDdxklZYN6U7xNUH+VD9PAw7Kuj7dhs26ACnSvPNEmf0+DrMX0aufvKIBSPl6JsqLm7l+kBfIli1q
	9fOWBsv5/aO1QO03sPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3o0a-00000005nPS-43YW;
	Mon, 06 May 2024 02:23:16 +0000
Received: from m15.mail.163.com ([45.254.50.219])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3o0X-00000005nOb-0ZeX
	for linux-riscv@lists.infradead.org;
	Mon, 06 May 2024 02:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LQ3sc
	wYLoPMei8ryb8phE+FJFjgEcy7bl0P/q0SziYw=; b=OCzXqYV0c5cwhTSnRg4eQ
	/PKEM4OKdSLpoUz8+Wl/WBNx5WhqN9Fa20CIXPVv2L7AU2cu1fRyAaTcOSc9Pn3m
	9GjCw9xthoDG/O3L/Eion9Duw6YNyRngdgAYp/xAAcGSa4YZGcBt46bt3FLdbXQo
	tt/FWM+kG925ZIm/f7nsj0=
Received: from yangzhang2020.localdomain (unknown [60.27.227.220])
	by gzga-smtp-mta-g0-0 (Coremail) with SMTP id _____wDnl6fyPjhmWCzYDQ--.44974S2;
	Mon, 06 May 2024 10:22:42 +0800 (CST)
From: "yang.zhang" <gaoshanliukou@163.com>
To: alexghiti@rivosinc.com
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"yang.zhang" <yang.zhang@hexintek.com>
Subject: [PATCH V2] riscv: set trap vector earlier
Date: Mon,  6 May 2024 10:22:39 +0800
Message-Id: <20240506022239.6817-1-gaoshanliukou@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDnl6fyPjhmWCzYDQ--.44974S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry8XrW8ur48JF4UGr47CFg_yoWDJrc_GF
	Z7JrWUWry8Ca1SqF9Fq3yfWw1jvw1Y9FWF934SvrWUuw4vgFWjq3WYg345trZ5GFyIgw4k
	J3saqFZrtr12qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnXAw7UUUUU==
X-Originating-IP: [60.27.227.220]
X-CM-SenderInfo: pjdr2x5dqox3xnrxqiywtou0bp/1tbiJxnW8mXAlp9hTwAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_192313_809309_179C3FD8 
X-CRM114-Status: UNSURE (   6.87  )
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

From: "yang.zhang" <yang.zhang@hexintek.com>

If trap earlier, trap vector doesn't yet set properly, current
value maybe set by previous firmwire, typically it's the _start of kernel,
it's confused and difficult to debuge, so set it earlier.
---
v1 -> v2:
As Alex commented, remove the patch for supporting hugesize kernek image
Add the omissive logic of set trap vector earlier

Signed-off-by: yang.zhang <yang.zhang@hexintek.com>
---
 arch/riscv/kernel/head.S | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4236a69c35cb..03dc440e643e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -300,6 +300,9 @@ SYM_CODE_START(_start_kernel)
 #else
 	mv a0, a1
 #endif /* CONFIG_BUILTIN_DTB */
+	/* Set trap vector to spin forever to help debug */
+	la a3, .Lsecondary_park
+	csrw CSR_TVEC, a3
 	call setup_vm
 #ifdef CONFIG_MMU
 	la a0, early_pg_dir
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
