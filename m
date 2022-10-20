Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A806FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Oct 2022 03:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8Ux2UdEdyigE6REe4koOJLEBjS49bGeHMkAyCuvnY4=; b=xl1CB6uLinzRIh
	2B8cXXgUCAOj0SeZVHrOcVs5gpWV+fjtH/LU3+EQxbaxzw8gZp1hMdd1ox969YzVKf6OcFt8ZguCG
	zQzRj0nShMA6cCXqzVHk4eaThmL9S4VVd7tQq4+bqnAhHzHDzd9X7kv3l7WrPK754nURy5HyY321y
	FEkN2xvY1xzQOWeaYch5lPvJHaxDNahGgsaJmfKkB43+b0Ot6JVq6cfcvQdKdBTcfzgaNvIe3+XFl
	l39DvsJY8/aIiaosQIdjcnFooKEHRApP8JTNxt7Tyl7YiVPYqNfiNCU7KhkT3xohC2bP23bssXfpt
	txsCOvXYjO/VYysfaUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olLqZ-009fhH-Rp; Thu, 20 Oct 2022 03:03:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olLqG-009esb-2s; Thu, 20 Oct 2022 03:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IxFEEYvnd43ImBsROoffP6LIiVTY+6cXD//Bw+TdLxU=; b=lTqo4gO4S6DHGRr0Cr55KSaQmb
	YMHpT6UBXKPksObeDWeoW57/2iXwu0c+6TLR597dXPPZJow+SwC6Gvf4G0DrUgjvBF8bIqGzextwN
	WG1iIumYxyTZLFw06wzyRNJpF+aUMGlT1R6dg/yYxm9TrDw9CA0x078jFGJTnHJmk3JxTAD/rcqsA
	rGDLMEeveYnboC3tA8B39TYJjP1UuG/ssguysYuICjQ98ZLaum/eFZHMU+6zPQbabe+RBowKtEXUm
	uK5SZzi8nTLKV4DukNrlBrnc7RHHGoPwe5JzaI90JKaEA8dKBi8apfRQMXVLn+N3/MOf6lhm4ZuHH
	SWGeKUiw==;
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olKhn-004usc-2y; Thu, 20 Oct 2022 01:50:46 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0VScs1OH_1666230635;
Received: from localhost.localdomain(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VScs1OH_1666230635)
          by smtp.aliyun-inc.com;
          Thu, 20 Oct 2022 09:50:35 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: crash-utility@redhat.com,
	mick@ics.forth.gr,
	heinrich.schuchardt@canonical.com,
	guoren@kernel.org,
	k-hagio-ab@nec.com,
	yixun.lan@gmail.com,
	lijiang@redhat.com
Cc: linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org,
	hschauhan@nulltrace.org,
	lifang_xia@linux.alibaba.com,
	Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [Crash-utility][PATCH V4 9/9] RISCV64: Add the implementation of symbol verify
Date: Thu, 20 Oct 2022 09:50:14 +0800
Message-Id: <20221020015014.46085-10-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221020015014.46085-1-xianting.tian@linux.alibaba.com>
References: <20221020015014.46085-1-xianting.tian@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_025043_578156_5D561C91 
X-CRM114-Status: UNSURE (   7.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Verify the symbol to accept or reject a symbol from the kernel namelist.

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 riscv64.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/riscv64.c b/riscv64.c
index c8693e8..94eca90 100644
--- a/riscv64.c
+++ b/riscv64.c
@@ -165,10 +165,23 @@ riscv64_cmd_mach(void)
 	riscv64_display_machine_stats();
 }
 
+/*
+ * Accept or reject a symbol from the kernel namelist.
+ */
 static int
 riscv64_verify_symbol(const char *name, ulong value, char type)
 {
-	/* TODO: */
+	if (CRASHDEBUG(8) && name && strlen(name))
+		fprintf(fp, "%08lx %s\n", value, name);
+
+	if (!(machdep->flags & KSYMS_START)) {
+		if (STREQ(name, "_text") || STREQ(name, "_stext"))
+			machdep->flags |= KSYMS_START;
+
+		return (name && strlen(name) && !STRNEQ(name, "__func__.") &&
+			!STRNEQ(name, "__crc_"));
+	}
+
 	return TRUE;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
