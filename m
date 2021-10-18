Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2CEC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 05:24:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7AA360E54
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 05:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7AA360E54
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=smail.nju.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eRAdgVAr0sXrSAHqKlUCS0tfVQaIL+2i9AIF5JRVUgo=; b=Z9dAqleKEPvBvA
	QpyGI1cezCzHf2/H7Nnn7e/LS2K7JESh4z3F2dMqsems/0xPDyFu0mgMs9kYgHdzU7O9ALKKm7obK
	+ZYxLr4QDuBXbHbJ5we5SwShPOwwEn4dBi+myPkfVTUYkGbu6dH1EdcAjM5gzUY8/1eUPWChx+Onv
	i+z9tGXLD3DVqFdy7swjTWxtm9X68+aZvM/BHYEsH3ROT5PCvGSHSWwaE1rT4xKrvBbwSw/Oe+pt1
	n/KmDK5kmv10uhCpGKaZy6mFnca7FN1X55micTMqZByumHjQyeoTY+we6Jc55wpOxMXyuZIPbbKkk
	+6nMf4DtqAN6uHIaSjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcL8V-00ECPl-6x; Mon, 18 Oct 2021 05:24:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcL8T-00ECP6-C0
 for linux-riscv@bombadil.infradead.org; Mon, 18 Oct 2021 05:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=KAm6Yl0g3VjxG+2yXnB0axsvYkKbqrDCY6iWIJ65noE=; b=IhCAM3B8pLPUWsilScOi1BwCLb
 bCRwkDckcxqcLeZq7cCg+BL6PVXOBVv+8I+6W3OzeknKciIA65JK7yuEspw8sf3709LsjQddpz6Mq
 JDBaMZxEntkk+7DGCKgUwsLGc+oQ+HvC/9fwRjpaxCud1g8bP/NleRbD9favZNCL0yBeP42y4P/xl
 7S8iHkHAYAPI2ZhbruckGnnZCrwNV/H8NUU5MxG6CCJfpOZ5RgB/5KO0lfqiEEcFwanl8D9Z5wQ1q
 Ca4Xmer/hS0L2Grn4KJbyx0POQeJi+cbQjLzyeNOV1vLJfKnFP/3dYqqFDNXihTsS4D636VRMftG5
 2IH+kW2w==;
Received: from smtpbg703.qq.com ([203.205.195.89] helo=smtpproxy21.qq.com)
 by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcL7g-00Aia5-TS
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 05:23:59 +0000
X-QQ-mid: bizesmtp33t1634534565twpnz1q1
Received: from pcl66.. (unknown [218.17.115.194])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 18 Oct 2021 13:22:39 +0800 (CST)
X-QQ-SSF: 01400000002000F0O000000B0000000
X-QQ-FEAT: sAyD0HLl0PAPF9h2XXao3xBCuwKIX1GvyL9/k10otrZOpvTx2dLnas1dTvxks
 AcbIRiF+Nwn4z4tU9GRsmFEbA0VyRqZzJZYXHPGLhvclumq0XNEDIxCZmNJV2yelYObLymb
 zzHmmpuZRU9okNwO4uUy1ZCpH3Y5lBAYjoNkRcUy8ZGeW4PhhnZHn33NZfiGVRT44Rnamj2
 +wLyV0mHD5AylhTMIKMAPoh/OwKUgD6pVHJ1lvf1z71Bhyul0Qk2I248psCInFC+SMQtP2v
 8y086yFfAQ5mKLdzl341uNliAZrSzTM0KxC2a8loHFu9v5RVbYHPeMsDWm3swdaAU7kck8v
 iEjizGLo4fK0ruS9mOKcrXmRG2DrKwTCqdDkba+
X-QQ-GoodBg: 1
From: Chen Lu <181250012@smail.nju.edu.cn>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 vitaly.wool@konsulko.com, anup@brainfault.org, seanga2@gmail.com,
 wangkefeng.wang@huawei.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, yuzihao@ict.ac.cn,
 Chen Lu <181250012@smail.nju.edu.cn>
Subject: [PATCH] riscv: fix misalgned trap vector base address
Date: Mon, 18 Oct 2021 13:22:38 +0800
Message-Id: <20211018052238.522905-1-181250012@smail.nju.edu.cn>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:smail.nju.edu.cn:qybgforeign:qybgforeign5
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_062355_928473_4E10458E 
X-CRM114-Status: UNSURE (   7.80  )
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

* The trap vector marked by label .Lsecondary_park should align on a
  4-byte boundary. If not, CSR_TVEC may be set to an incorrect address.
* This bug is introduced at commit e011995e826f8 ("RISC-V: Move relocate
  and few other functions out of __init").
* This bug is exposed with an educational emualtor.

Signed-off-by: Chen Lu <181250012@smail.nju.edu.cn>
---
 arch/riscv/kernel/head.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fce5184b22c3..52c5ff9804c5 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -193,6 +193,7 @@ setup_trap_vector:
 	csrw CSR_SCRATCH, zero
 	ret
 
+.align 2
 .Lsecondary_park:
 	/* We lack SMP support or have too many harts, so park this hart */
 	wfi
-- 
2.30.2




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
