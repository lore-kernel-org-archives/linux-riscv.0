Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A578C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jan 2022 08:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9LfUkPLZysjPnlURwkq55UQZKMTsRuabFLheeUlDqI4=; b=WBdBt7sfpnHngh
	67TttaVfjl56gyjrI8UC5xfbL2/FyPb50dV0tBrl0wIljkPje+4d9iJJ1WgtZtkoEf8D/oD6BbGLj
	vjx5larXqyvwgx9pCDdIBPQAVqI2SoQ4p4FF36GGVmV0KZ5TDDLCvSRyf/NshD2vTLF5lzBqLwAbz
	NKpoUijSov2rYm0WvyBmWivFv+FBRZDk4I0WCSZoKXb/n/dGfUau5DuYW6vsEGehiwbZNokerrRDU
	w38EoEmskSnXWq22avrwjscshY+23lxZzOmV9zVtnicUb2WWfxuURx/cQ55fxkoxc5ZvQabaWYjjg
	E3PzUqzpZCVA+EDxXpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Yyp-001WEO-BU; Wed, 12 Jan 2022 08:27:39 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Yyn-001WE0-76
 for linux-riscv@lists.infradead.org; Wed, 12 Jan 2022 08:27:38 +0000
Received: by mail-qv1-xf34.google.com with SMTP id fo11so2146077qvb.4
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jan 2022 00:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h01bjARNb7y7qwRAWKIHAQxTQlqFFpWv+tbnghhAPks=;
 b=XL5p1cRjWWRnif4ZWMp10WAKVQdktJ99CU8VrSpzsX/FUAArUV/A1MuAIXUG84F3vT
 8zJKLliDpSc0y/ozvXau1+VEV1va7sA+WRQfWgs6skTruDynejqBAPwmbNiovWE5+hiw
 0MEfgVzD4cOyNkFjmZbp7fXxatgGzEj1cQUXMO2V00zDlT3Vl6warlaIE5EoJ4y1MKZj
 pWdnqUwIDzlaOi8knlQ3Lt+WnD+zpot79koOHu7gv8yX/Y2KEJ0oRXxEDVdTvmGtLioF
 vP0HS3naVii9fve0BC8YSPrQOIawksy85ADaSn/rnoiGi7DIN2Yk2gbD4QctN9blL71E
 w6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h01bjARNb7y7qwRAWKIHAQxTQlqFFpWv+tbnghhAPks=;
 b=IBVCOLs1868L7SOv6qZIcwP7cjgsCLi+SAAtXEveRWnziC2rcQwzisC5piSIHrly5K
 Kvqn0mCIyqnddwzz7BYN7l2HL8kPiLe2B9J7bbCk/I1RIiutH1WKKjnXU8bhF9Mq/1Kk
 ltOFAf4lBVXSu5kcMso/O/5pHyOQVHQp7LvmRa55x8PYOmTjHB96kv9cX0pzfQcEkC1q
 33Sht1Ptc914Z+WK2mh/dZHsYNptjUkuOSbjcLHGW5cBlnmvQbSF9s78ESqkHgF12Rn/
 AZR6oQVzQfrUHrWkaRPO+KpJs0GsbBnoQyjReMNu49qHHvzamVGwuiPxO8qLwFaC2P4D
 3saA==
X-Gm-Message-State: AOAM533mp9aU9DwL6yvBnvZa0L5dR7lfMl4pg2dbBeQmE9WOX22KzxrR
 Ut/lxVmDb4W9itXv+seku4I=
X-Google-Smtp-Source: ABdhPJx9HqhPLSYFpsALofcmkf50IwgYwMGyWYj6KUBpbyFlCzbmmO1ZzDD3XoR+d2IVbZ8VIEcuHQ==
X-Received: by 2002:a05:6214:d0f:: with SMTP id
 15mr7204173qvh.18.1641976056188; 
 Wed, 12 Jan 2022 00:27:36 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id r3sm3174416qtc.84.2022.01.12.00.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 00:27:35 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: oleg@redhat.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 CGEL ZTE <cgel.zte@gmail.com>
Subject: [PATCH] arch/riscv/kernel: remove redundant err variable
Date: Wed, 12 Jan 2022 08:27:29 +0000
Message-Id: <20220112082729.667743-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_002737_288183_11C4DBAF 
X-CRM114-Status: UNSURE (   8.81  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from user_regset_copyin() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 9c0511119bad..a89243730153 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -42,12 +42,10 @@ static int riscv_gpr_set(struct task_struct *target,
 			 unsigned int pos, unsigned int count,
 			 const void *kbuf, const void __user *ubuf)
 {
-	int ret;
 	struct pt_regs *regs;
 
 	regs = task_pt_regs(target);
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, regs, 0, -1);
-	return ret;
+	return user_regset_copyin(&pos, &count, &kbuf, &ubuf, regs, 0, -1);
 }
 
 #ifdef CONFIG_FPU
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
