Return-Path: <SRS0=3V4y=M6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8106C4338F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 07:15:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C34E610C7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 07:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C34E610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cdjrlc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+lPC/2u1NusMoc9HrALY7zLEyJeZlJKYr6s7nVXp6Qc=; b=nJPxx/oCyxwND1
	rHKyZJbaxMmybdByHcwXEWvVouMCqoNgkLlVDepsrijxN1qhR/0qC4dzhSELezwkt+rAnttXLrDTS
	Mwl+L5qVr1LmZnJartEmBgoczK5l+wXt0lGZa8WlJUdkTkkkjz4V3polEX2zt6fR71CImZIso2kFR
	xTvu/T5u6voceO99YQVR+wZy0aDip5MqnBCGpQzzp8deRBe+e+qju8UNiEfsoLL9rdKjIqZ3UIssL
	qvJd4g9hLkOoX2h0Yz64IeKiQuVX2kNxk9Njxocm9OuRY4X65QfsDCGOpSaZaRmEKx/mxuHNV4oaV
	F4cVIv3+m6JAe/JM0Aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCGYG-00EHgz-4c; Sat, 07 Aug 2021 07:15:24 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCGYC-00EHZI-AH
 for linux-riscv@lists.infradead.org; Sat, 07 Aug 2021 07:15:22 +0000
X-QQ-mid: bizesmtp52t1628320494tmzgl5f6
Received: from localhost.localdomain (unknown [125.69.42.194])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 07 Aug 2021 15:14:53 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: u/EYRCx6Pxjri7s2wBnB7ABwvtbuvfr2rIlKrAa4rLfhbND3DW/1Jf8lBOXDX
 mxO+WqZOOcKwkM7uCu7Gl4Nmdzb3/WMSSFG3XwYbvB+E+hd3QYqiAf1HhSf4n4AX/irRbMs
 aUiEba4Y442vKOJv9Uprz1CpwTgjDh7Hvd8HDWOzO/CB8JC/SU/b3j7S6yMC2xsA1mKNMdd
 eVun3gmV2XxHWjG6GbPzKqocyV+ydDSqxrvwBOTfDN1EoWRKM22UlRgykpFJODO9K5Feulo
 4kH/jhBPfLYOmbKimLhm5g4RrKhoCU+AQIJVPYnXIejMPn
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, atish.patra@wdc.com,
 anup.patel@wdc.com, wangkefeng.wang@huawei.com, mick@ics.forth.gr,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] riscv: use strscpy to replace strlcpy
Date: Sat,  7 Aug 2021 15:14:27 +0800
Message-Id: <20210807071427.59613-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_001520_698880_A2A78B13 
X-CRM114-Status: GOOD (  11.76  )
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

The strlcpy should not be used because it doesn't limit the source
length. As linus says, it's a completely useless function if you
can't implicitly trust the source string - but that is almost always
why people think they should use it! All in all the BSD function
will lead some potential bugs.

But the strscpy doesn't require reading memory from the src string
beyond the specified "count" bytes, and since the return value is
easier to error-check than strlcpy()'s. In addition, the implementation
is robust to the string changing out from underneath it, unlike the
current strlcpy() implementation.

Thus, We prefer using strscpy instead of strlcpy.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 18bd0e4bc36c..2dc62ebc0001 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -255,7 +255,7 @@ static void __init parse_dtb(void)
 
 	pr_err("No DTB passed to the kernel\n");
 #ifdef CONFIG_CMDLINE_FORCE
-	strlcpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
 #endif
 }
-- 
2.32.0




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
