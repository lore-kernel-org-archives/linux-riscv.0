Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ABEC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 09:49:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3861423B7D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 09:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3861423B7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WyxgudMpNNuw7KopipeTuqUHWX4OLx5VBDyQBlXY3o0=; b=HRaDNbHYFDOkgrQF0kEBjkuR+
	gSZBT8kN0fvogqmnPCZfPFshrygg2Mrp8GKGMM54kLtzTqmXcoF0txhoYYcJxUnBqYDefGddGSXMQ
	aLluv725f+LBVQxHicN9pu1DlFUjL/82r/mEigGCveISuuE1NEgv0O/uiGc0h5MouB5+yWDBRQx4n
	0IGew6iJxR8zEPUbD6h8walKTiJ8erGwF7HtIDhbvjV2X/0iKRME9YP4NtnV4SvaQw1T+9UXpgWzn
	WRqxoh0v39c/o51pBqkInpyCiT3JVX8OaYDckI5/eV2OlGHg+ut8bXeIGDYr8DFkQR3Gc5EdSy928
	QxuAPBfhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmw6O-0005t9-Qu; Wed, 09 Dec 2020 09:49:40 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmw6M-0005rz-Sj
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 09:49:39 +0000
Received: by mail-pl1-x641.google.com with SMTP id t18so663725plo.0
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 01:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PrCTAg81K8KnVj0cwCcOSdceG5jg9Rol6nxvrFRqC7s=;
 b=aqQDQl6MRjWwoP2yw4T8/K3BRlu3VlimxLymxRpw6oZ2TIBzSNeg6cCnFH7tWWJMdg
 0asBiYxpTxfD/nW01e/qQlpBO25LWiWIA6VbQ5iCmTk75sT85lwAOWo4Y+Zk59CUPxz9
 bRhTHfv3Ed+m1BOFXV6Paijjxg2HJtWMz7aaGOtyt4yQ9e+zWwqFacDq2tcWlktp2Y/6
 9OE5FEu1uN3nTV5X7m0+jrLNs+NOCpk2SfimO0JSlk0KM6VD3s2LBTHzGanhCAu8LlDQ
 qnSSWoe6ogW0CCw0pUGaMPenl6ZnVAOhEZIyMMJ/Axb9MlUi8DWqGfrgPSctp7pInxzk
 fAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PrCTAg81K8KnVj0cwCcOSdceG5jg9Rol6nxvrFRqC7s=;
 b=e/GGqIRe3+d+BSwI2cbL9/ekuKEsHV0mVkPy9nuLMy/1y3JhydYpuWXrTyxkNtUvp5
 qdRQwhlLvwVSFTlQ3d3SXmWU4LdALTuLtaKHQ4vzaWqfXva6qHnWKOVHzkASWvgjq2H7
 PqbbctNKxea0lrspdpR/l0FgLVN9se0PDlsA4yGDOSsLcNJYmWwE3gMy3nTSsMn7dRAZ
 ChzM4lvpAqpw1dULK+5VKTLnrQ+PoQ44f2gy186Im+8DebC4ApVtTnrcn5Uvno0jj9H6
 U85HnkvL4f9ZvyC9FM4j3lk+D46o7KTxiQG55wF1JgO5YMvkSVJ4/nS7LMXWKXXaVrKV
 SDqA==
X-Gm-Message-State: AOAM530JpcUN7ZCpJ7DqdAgGMa2fWbcO+GHwN5ppMtpLKUId5gjoPCML
 5gM2gyJER07cXDcAugAwiX4L5A==
X-Google-Smtp-Source: ABdhPJyrwB5UR6zn1ToVfsm2FNS047MMOHPkD6Jq+cWszUtiT4M68q2Zgdzn5wo1XzVbdMyoKARRvw==
X-Received: by 2002:a17:90b:b0d:: with SMTP id
 bf13mr1471187pjb.194.1607507377289; 
 Wed, 09 Dec 2020 01:49:37 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 129sm1890354pfw.86.2020.12.09.01.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:49:36 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v7 4/5] clk: sifive: Fix the wrong bit field shift
Date: Wed,  9 Dec 2020 17:49:15 +0800
Message-Id: <20201209094916.17383-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201209094916.17383-1-zong.li@sifive.com>
References: <20201209094916.17383-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_044939_014333_C37693A6 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The clk enable bit should be 31 instead of 24.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reported-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---
 drivers/clk/sifive/sifive-prci.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index 7e509dfb72d1..88493f3b9edf 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -59,7 +59,7 @@
 
 /* DDRPLLCFG1 */
 #define PRCI_DDRPLLCFG1_OFFSET		0x10
-#define PRCI_DDRPLLCFG1_CKE_SHIFT	24
+#define PRCI_DDRPLLCFG1_CKE_SHIFT	31
 #define PRCI_DDRPLLCFG1_CKE_MASK	(0x1 << PRCI_DDRPLLCFG1_CKE_SHIFT)
 
 /* GEMGXLPLLCFG0 */
@@ -81,7 +81,7 @@
 
 /* GEMGXLPLLCFG1 */
 #define PRCI_GEMGXLPLLCFG1_OFFSET	0x20
-#define PRCI_GEMGXLPLLCFG1_CKE_SHIFT	24
+#define PRCI_GEMGXLPLLCFG1_CKE_SHIFT	31
 #define PRCI_GEMGXLPLLCFG1_CKE_MASK	(0x1 << PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
 
 /* CORECLKSEL */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
