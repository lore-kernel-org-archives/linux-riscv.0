Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE88B606A319
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s3+dYe9u;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bcy7gJmT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hHbkbu0F4vvQI7m7FSTbfXn4AFcHvbKBaEB+wFh8qg4=; b=s3+dYe9uz+4VIQ
	GPPtPgh3vLmmogrLF7RP1Fd2q9LrNfBIPis7dJzPYI4p4PjxI4ALSSKBwD4vsI/425bbvcaZ/fPut
	7pWJKPveK5fpygG5pCWiKmzjBV80shXTzGvyTgmUK+8uIg0O2aDsBLzjZ0jrcBkxX1dW976KccbYW
	XZ66Xm8A7RdFTBsQeSZewIkmXA6hwvyUyuc3ggnmuo1MtTa6hjVPwg9F9MVkgeJI45iekqx90rFYM
	+N74t9Yc/PxpoWhmXakBBjwNYGKSOu5BCVm/1ZXMbCVVnvZaiMcCJFR3CugTgtzTFOvZMM0oUwKMM
	8x3QlX8Hq85SG1Olcnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWGE-0000000BtPd-2Gwh;
	Wed, 21 Oct 2026 13:21:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWGB-0000000BtOa-12sT
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 13:21:41 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8a058f74a54so293582b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792588898; x=1793193698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0hyuR29EsatIH4jXUcnLqsaQxGY69D2I/F2suEOs6k=;
        b=bcy7gJmTHrnQM55vE3/HGIm+UPq9sUQt/+yZ5PGNDA3bQFNNTqSk1YZH7lqrA6vhaD
         YL0CeA8A3XcFfXoMJkiypOpHCC+CTSeupv/kbFO3jpw7yK+ClShF6Dhvh2DwUvMve+X1
         VvRbgFcYpo2K0SvTQXox0sqdy2uUX/wp1jyur6Pt4hetawPTK39wc+BVHfzGu3pksIc8
         4janEyLZBLiEiXsdYh0cT+5tB4PLhtfkt01JgRuV2LV2qS/7T3M16PDSHJQB7oZdRuhW
         F5AvYvIL23jlGgQfkG4JI6jd2+J+MpdXvAKc1nq+PIvjEfJSBmnfsGGwZyRSuTd/+KMd
         LZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792588898; x=1793193698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0hyuR29EsatIH4jXUcnLqsaQxGY69D2I/F2suEOs6k=;
        b=qvjuv4BVUmm7wkFKNpcl8zG6F05Ybr6QgH/X0+RjreW2Gx3DoYR7+Hz3nZjKBt1w85
         9lpWoPvOIIDPL0igbJ7pzlksW6T4uULi/RpiVmCMQE6vehiQem4PZWcXaLM35eVPdJmG
         cA0GFtcmvQaUk1t6H4XFHf858qKWE2kkMSaXGoUDfKPpcBv/hpCjSfP4Og0SRFaEPmcc
         h1TOI432ZRc3yJofnQB5M77y66VbPZ5q01ihkwW8BXC67nEta7ir3qSQqXeduKABKfyv
         enLfRq/e6tWvW9OPqWjKiAImKRP+J3+3xli5MjqEjYQtQ5VVi9kH01KPyfp5jlrDYJbt
         iYpA==
X-Forwarded-Encrypted: i=1; AKwUvByNH3cwVnzlK+XG8DPz+UMdAmCaQcfHu9H17Dyfx0ASlEg0V+p8TxKDsxnUlAqJ8sxZq5VQIhCBqc5meA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJsu+usrl1LwjowUYUl0jJBKFBJQG3MbE4UiwnAGV9dgpwyPsQD
	50LI22pbIbEg+43nzPCkF1U9pWrDOK8ELwWgMPXBgcSB1A1sZGmhg7bV
X-Gm-Gg: AYBFou3Fkqxcm1ev36byznL7y9DZu9TPDLtrczvjf98F+LsqtJ551u65aKWpO8mMenc
	XRrwh2BOc527ckKAMat9g1Fj7Md5fyD4nbrYfX03nfcKdBUy7Kmszx+cKX12JzrSPdPnsqNUSAw
	8Jdc1bfsODNoIF2nudbJfL3dD7mbloGfO48m55vhbbjjXf3tJf1OVOvFLno0x3FDlJOS52Ftebs
	+PAuTMdqefGyP72+CAWRzsIE1Z7JeVKE7ucOyBpQWo99elZ/5YMXCModgZA4hvgO6n/87O9bhSr
	VdmKPYisbYrn9P+XOzARILH5VBCgtv/ucUh83bVOkpWXqj/cWYq3oHv5yC9iWi1+e8w6btJzoT3
	U9tgWAxXXc4i/9pSNTzcAAqu/QCXE6FEdgLq7d1j34xqkokEFNAhUMYef5oiIu4JpidcdOtVeDi
	MSmSqOreNAfvT7LI0op7Z2fyulYs8A9ZiNAPE6YNe5AwWi2vcPd3Nsa0iq/mzUmo7IPbUX4AH8l
	AFitKbKzk91rok4rq+mZbh0MY7MuEoCzXjp0A+c1juOHkZ8MXvGftSVo/VbbUDws/fkXKa9pDGB
	/TaP5qSQ40hUSxlA9vzIaZbMkZKGXkWqe/zhrV4PxuFwSN7kg2DmEdY4if6yJFGTOtLFMIbNUKm
	kHY9q8dq4YeEXPXf1ruSPZpCO7AS7n2qTzDQ=
X-Received: by 2002:a05:6a00:4504:b0:89c:6b2e:8413 with SMTP id d2e1a72fcca58-8a089d35b1bmr1709553b3a.40.1792588898285;
        Wed, 21 Oct 2026 06:21:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895ff8dbsm881861b3a.52.2026.10.21.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:21:37 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <docular.xu@gmail.com>,
	Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] reset: spacemit: Fix the RCPU2 PWM reset registers
Date: Wed, 21 Oct 2026 21:21:30 +0800
Message-ID: <20261021132130.3026998-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_062139_425171_9F1E6111 
X-CRM114-Status: GOOD (  13.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Every entry in k1_rcpu2_resets[] uses RCPU2_PWM9_CLK_RST, so asserting
or deasserting the reset of any RCPU2 PWM from 0 to 8 acts on PWM9
instead. Each PWM has its own register, RCPU2_PWMn_CLK_RST at offset
4 * n, as k1-syscon.h already defines.

On a Milk-V Jupiter running the vendor kernel, which uses RCPU2 PWM2
for the fan, the RCPU2 registers read:

  0x00: 0x4  0x04: 0x4  0x08: 0x1  0x0c: 0x4  ...  0x24: 0x4

Only PWM2's register has its reset deasserted, which matches one
register per PWM.

Use the matching register for each reset. No in-tree device tree uses
the RCPU2 PWMs yet, so this has no effect on current boards, but it
would break the first one that does.

Build-tested only (riscv defconfig, W=1); the fix could not be tested
at runtime, as mainline has no RCPU2 PWM node to exercise it.

Fixes: c479d7cf06c3 ("reset: spacemit: add support for SpacemiT CCU resets")
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v2:
- Drop the Assisted-by tag (Philipp)
- Collect Reviewed-by tags from Yixun, Troy and Philipp

I used Claude to help find the bug and read the vendor driver. I
checked the register dump on the board and the patch myself.

v1: https://lore.kernel.org/all/20261017140805.3278709-1-alan.tseng.cs@gmail.com/

 drivers/reset/spacemit/reset-spacemit-k1.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index 8f3b5329ea..dbd783c138 100644
--- a/drivers/reset/spacemit/reset-spacemit-k1.c
+++ b/drivers/reset/spacemit/reset-spacemit-k1.c
@@ -154,15 +154,15 @@ static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
 };
 
 static const struct ccu_reset_data k1_rcpu2_resets[] = {
-	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
-	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM0_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM1_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM2_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM3_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM4_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM5_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM6_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM7_CLK_RST, BIT(2), BIT(0)),
+	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM8_CLK_RST, BIT(2), BIT(0)),
 	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
