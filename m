Return-Path: <SRS0=m7Kf=UR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA1AC31E5D
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2019 06:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C48214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2019 06:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pW/tXspO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C48214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r1bZazaBTuyAYtI05jxvRvRdV1CFr/RhzH8lJsEBx4E=; b=pW/tXspOZoihgz
	1kxB+k5L4qEb0EEFUwaksaz32SucxGGY//u/9bfx0LBk3YYXJI5V3t/OAkbK2wT8o83lq3EkYFFFJ
	oxZ9h7VMPDx06jcIapVlzEkMNXl7Fuph0rBHXu0x945W3H1PnTyV5u2aRmnbZJFHKTaNpsBgZF+qZ
	+N2BJ9wW1imzEDd7uev+miU8Ix1r1jf/4nUjYOuDM3ZxzzUwau658KmQ9XPmxMMgTFkqQaRmBAA1u
	EUlmAaXXWS3K8KQXh8sXRHpapXyGEMSANr3/5GvK2U2V0ohj/cp34z733BONEaj3hBiQaXKQvIWEx
	fvxLpbh1T6lXtqqwYHkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd7NS-0008Eh-I5; Tue, 18 Jun 2019 06:13:54 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd7NQ-0008DC-JE
 for linux-riscv@lists.infradead.org; Tue, 18 Jun 2019 06:13:53 +0000
Received: by mail-io1-f65.google.com with SMTP id k20so27016499ios.10
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 23:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=hOy3xilB7B1uMvabDCiSHNx/z8iRfTrPW/yFF7m7nz0=;
 b=pHSFEjtEiOIu9ouerbBwgd4KqsIINIY4v1NLnI1MqcvpTKUl2zk6Nquc8wNtFw/eWg
 j1XPu5AOk3B5vNXAxk/k5If/qWJcCsSTMu9i/6bvBTgDOsrbEYbi2J14M15EuNIoWF9l
 Fx3JPs+Zr4kxtX+VEznAbk5QNcS7KWm80Lb7mzsjNClmXYX3sA9/icfFnLMVYlPn/osY
 y/SayDc2LXduxJ3qXir4GhBA+NXh4wi+v+jHcbWO8GJiaaPlerfQnGC8IW6c92O7nLZt
 OrOdvz0xI10tbL8kDO6VZuydPsI+Sd9jfbPLrAylnrbAu8VqlebKdFIe1uJ2qgClJ45w
 GEZg==
X-Gm-Message-State: APjAAAXKs4H1aon4rNCi1/4gDwjUsEsAqugt+PBGiWutcqIc27ANAjON
 sQGB0hiCpKLCbpz7dQ8VX0h818uGA7DeOw==
X-Google-Smtp-Source: APXvYqy3j7XalhIiKZBNO0ZjMRUb7OiF2i6RCCHzXJIxCySVhpzJ3yT7j1dlOwdiYpaUPyrK7crAIQ==
X-Received: by 2002:a05:6638:38a:: with SMTP id
 y10mr861293jap.104.1560838431297; 
 Mon, 17 Jun 2019 23:13:51 -0700 (PDT)
Received: from localhost (210-61-29-234.HINET-IP.hinet.net. [210.61.29.234])
 by smtp.gmail.com with ESMTPSA id h18sm11626649iob.80.2019.06.17.23.13.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 23:13:50 -0700 (PDT)
Subject: [PATCH] RISC-V: Take a third shot at describing sfence.vma
Date: Mon, 17 Jun 2019 23:12:16 -0700
Message-Id: <20190618061216.7303-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_231352_626917_3ACF82AD 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is the third iteration of this comment.  I've had the diff floating
around for a while since someone pointed out that the original version
didn't make any sense, but I forgot who pointed this out.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/tlbflush.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 54fee0cadb1e..8fda8974d8c7 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -19,8 +19,9 @@
 #include <asm/smp.h>
 
 /*
- * Flush entire local TLB.  'sfence.vma' implicitly fences with the instruction
- * cache as well, so a 'fence.i' is not necessary.
+ * Flush entire local TLB.  'sfence.vma' enforces that all subsequent memory
+ * accesses, both from the instruction and data streams, respect all previously
+ * installed mappings.  Thus we do not need a fence.i here.
  */
 static inline void local_flush_tlb_all(void)
 {
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
