Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071C9C54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 11:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r8TxxWcOSm9MLZYP0gcgS3H5TZheixapSeB4kk37jz4=; b=Pm8Db2VfveDiHq
	0vpq7vjFmGpI6RbdDXGIHWCdL0IL1dF+6+ALrTBvvoaQdSIcJJ7O3Tmz/L3M8146LMVSlYGtUK3jY
	nvur5AQIaS83nHVFFCevpVXWikNMIOXTNOh3yTI+sVyomLuZxJS3aLCoF6BHcc19gkbM1iLj0q8dA
	oSe4w4wbAbm2jue32NyvKf7H9F8rsmUVU8h/piy49kj+7q4u3n2IaFwgl489CifBkCsPS24ezDx/r
	LwVnjgbe3UgGvzfqxl9ZuNygncgvhae+ArU2D+UjIbfKQZO57OkMrw3xLeR3J++WxiHJP83TgAVdB
	1q1eHl715klaZ8efGMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGyi-00000002s9t-1FMM;
	Thu, 21 Mar 2024 11:53:00 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGyf-00000002s7m-1Avm
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 11:52:58 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1def89f0cfdso15280755ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2024 04:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711021972; x=1711626772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORDHkq7bWM8q1WLPA6OOcY5g2RNgfZTgZe5052mQRBw=;
        b=aLNihAMcDdXhEDNlCkjbD7MwkQvqlgZ4pFG5VNEjhdB7wOx2U+RCuVZCd8qESs95WD
         vzOxEDT+edDva2FM1KqQw4XsOJDTbr4b5jCJr2Hz9eK+j5SgFR+xLNdeA7iyiYTi0dKd
         nkTC7OnzuLo1vyAqo7zPa3uLj4lXsuDW4SuSpMum17A1aqSzvQNBXt2j30cLXIBwKIgd
         tTtuIVQtqHYrdQYl3wA8+Qkpkv0/0FOKBneCeh6c3IKkIRW70XTerARUZaRun/BBeiMm
         XCsOeGNJ/i8CNDMXZryWnX2nBtWGZWk6Jg1MLyiiMJkhbvN+0dNVvPCgkp8ZD1Z95W42
         tJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711021972; x=1711626772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ORDHkq7bWM8q1WLPA6OOcY5g2RNgfZTgZe5052mQRBw=;
        b=XGJwnkPAuK1lDTbuDISCYAx6/hJPeeasggKKtEr6jS6KbF+ZJr+jHarum51k3z4BgU
         OsnXpGNQ7iEjUK5DPuELR4SaqBsWQuEr9vHFB8kEP4YSLal2Pitg4L6xXcjYrjvf6yLi
         nN/KX94MdEEQ3op9IxOQGTTlWieImZwDlvTFCEwOlhUSOZStyLagHshRN7otauOi0Opx
         joxw/CBNp2iozPpe99NCDObSyVy1GMoz6+z4x0u24lARJvH6fJVXPALLRkDJTox/X8RW
         q0M4dVfmeOkqjfqbnN2fL9WTPpMRM3GuHUy+o75Cg+zAtXst1n8BH17uevWnZ8wMXO0g
         qb+Q==
X-Gm-Message-State: AOJu0YyAc2EKqPAaoUnJrfOnd3qrOutz9zmoDclaPbEZj7erkGSDYHId
	jkHTdZQldyGnId4NQAswb7b5w6GlHjLaTlJIrvO5fZkrEAscnx5uZu9oUsj9Jxx5LO152VRWp2z
	It9RCiIe5hRnq2LYG0rlJ57IQtfwcl6aZXlECLkkbFofkiOyx91cxk1CZ2yT4fjuDgNo23DEJmN
	9Ktj5DV0OU3rlHfu+wMH6vdHrVa0DTlWcFMWxnqIdGysx7KHstyd/a+Ao=
X-Google-Smtp-Source: AGHT+IGo2PPyzEO7WR+Xw6NOVl+nTuCgIKPA8jQiGSaYNEvuY0ugvThvoXAfhKzK3ipy8w30gU9wiw==
X-Received: by 2002:a17:903:2343:b0:1dd:88b6:ce0d with SMTP id c3-20020a170903234300b001dd88b6ce0dmr4288234plh.25.1711021972245;
        Thu, 21 Mar 2024 04:52:52 -0700 (PDT)
Received: from localhost (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id kt7-20020a170903088700b001dd0d090954sm15668222plb.269.2024.03.21.04.52.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 04:52:51 -0700 (PDT)
From: woodrow.shen@sifive.com
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: selftests: cbo: Use exported __cpu_to_le32() with uapi header
Date: Thu, 21 Mar 2024 19:52:50 +0800
Message-Id: <20240321115250.801731-1-woodrow.shen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_045257_363689_54A518EA 
X-CRM114-Status: GOOD (  10.46  )
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

From: Hsieh-Tseng Shen <woodrow.shen@sifive.com>

cpu_to_le32 is not defined in uapi headers, and it could cause an error
of impossible constraint in 'asm' during compilation. However,
the reason is due to undefined reference to cpu_to_le32.
__cpu_to_le32() defined from byteorder.h should be used instead.

Signed-off-by: Hsieh-Tseng Shen <woodrow.shen@sifive.com>
---
 tools/testing/selftests/riscv/hwprobe/cbo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
index c537d52fafc5..b2dd18b3e360 100644
--- a/tools/testing/selftests/riscv/hwprobe/cbo.c
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -15,11 +15,12 @@
 #include <linux/compiler.h>
 #include <linux/kernel.h>
 #include <asm/ucontext.h>
+#include <asm/byteorder.h>
 
 #include "hwprobe.h"
 #include "../../kselftest.h"
 
-#define MK_CBO(fn) cpu_to_le32((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
+#define MK_CBO(fn) __cpu_to_le32((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
 
 static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
