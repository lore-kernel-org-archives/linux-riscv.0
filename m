Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA10C56201
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 10:06:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694FE2065C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 10:06:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3HMvSwO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="PeekuDgz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694FE2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iews4m/vXSIqqkrhG9iaPa7cWeSAQe21FZQymVbjsek=; b=n3HMvSwOSedTdvwm4hsUJQn4J
	LMx/juTx/k+vS98k9FAGRpif02amIkwVzJqzx0DwyzZyrIOWtAElnhs//2qkI6cypy145twFMcNJ1
	VwSP2z+13zR6wJoaxL6GoyE7oKCDc5nuVJYgtF5p7Xnt7CfSm3mTufIrP22q6o1tvcL4rVICrXfcs
	4c5qmrRP0dJhLna/LyehaPS2NilAd3iHikmA4WEP3/4mXYrPqcy2LMIsfKCyIFIONgautnQBaCqiP
	qE3M+PtaL5B+IkXATvHgq2ElUBGlrs+ApmEQg3HFJxBQ+BK7sLGRyKb1mbAjMSCcg4tfigDBJsqCj
	Stj5xG5ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcn1J-0001O2-Vw; Wed, 11 Nov 2020 10:06:30 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcn1G-0001M8-M3
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 10:06:27 +0000
Received: by mail-pl1-x641.google.com with SMTP id t18so741935plo.0
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 02:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZNKLbQTe0EJyIiECa6jG2QS24SEV6zzCe3D1RGbycgk=;
 b=PeekuDgz0P2oQrbgHf0FCJsHiFPz2BZ5Cv0EpubvZV33MfWN9TBmNIoMvevKzpAKwl
 7LJeN/GGuGZ1R8SpAyvdx9PV6YbcoggRDY0x4w9xPXzQGeKz4WnDAw06gmxneyOgmKhA
 /lAFxcltub4Uf/tXXaz4ZpsXGpLrCoyGmwQFdiISsmB4SgURGnWWwnYgNloUH1NuXD4I
 fVbamNCDjQnkK9gW1s3b1+yDDha0yEI92ND4/KzlrlG4VVgfF5U6OOfUgRj2uq9OGYl7
 8ZzoZiJQdd8CKeidNnJUbHDKXKybBKhey4LHDnjRvLwKZchOpPaIBJl5Llx+6ySZtwDi
 Ww/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZNKLbQTe0EJyIiECa6jG2QS24SEV6zzCe3D1RGbycgk=;
 b=SWpgmTh3mw2jAC1m2kFTI+MTPWGdATCrm7BeHr8h1itmKaar496vqFFosmLa8W2Zu2
 3bmEUpTRpqbU4csrwJ08+o6g6iRy05FrUbCY5OC8mbGdKFImjlzq2l5DHewQtc1u+dAk
 g29Rbuq3HsOXZCahBqdf6RGGr5aG9Abqb7HPiLUKt3eObcwpyfFcQvuC2IuG058oFlS/
 HiOUBFTlM+LpAXVTzSft+WUtuve9Ygg2eFcEM+KW76DIU0YPap437NMquK5i5Z3/+e91
 NbDca+1mYv10N1y1lZkWfCQV684IsbDonNEbVWeaqua6Cz2NgJV91CSqh4lTrW/1I/fB
 4NHA==
X-Gm-Message-State: AOAM531SY0ngV//lj1q8qfNb19tAN6GloaUG8Oe2G9K2D7ZgjhIgLIzj
 CfyzHRvEm76GevoBY2v6m0YSRA==
X-Google-Smtp-Source: ABdhPJyXKkTB6t7sDQgeqfdIEFT0KtFRUawfjJ4kwO8HBmsgEDtvRVY0BcyIF6ftITFc/IHnSOKd3Q==
X-Received: by 2002:a17:902:d3d4:b029:d7:e936:7651 with SMTP id
 w20-20020a170902d3d4b02900d7e9367651mr10846937plb.57.1605089185026; 
 Wed, 11 Nov 2020 02:06:25 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id u22sm1872801pgf.24.2020.11.11.02.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 02:06:24 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 4/4] clk: sifive: Fix the wrong bit field shift
Date: Wed, 11 Nov 2020 18:06:08 +0800
Message-Id: <20201111100608.108842-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201111100608.108842-1-zong.li@sifive.com>
References: <20201111100608.108842-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_050626_820934_FD67C5E9 
X-CRM114-Status: GOOD (  10.51  )
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
index 802fc8fb9c09..da7be9103d4d 100644
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
-#define RCI_GEMGXLPLLCFG1_CKE_SHIFT	24
+#define RCI_GEMGXLPLLCFG1_CKE_SHIFT	31
 #define PRCI_GEMGXLPLLCFG1_CKE_MASK	(0x1 << PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
 
 /* CORECLKSEL */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
