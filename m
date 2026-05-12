Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C51CD4F24
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 17:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GPIH8sR/QZ01cIuWwVtp30oGWG4itY9kSGqVJ2LWFEU=; b=ylFw++nj1F5Pzw
	EHOj0E3avdPFzmZk91sFLlBXoquW+9G9lTUIKPjyEPT+01ID3hljmerXQrFk/LHHUhXMBUvJuBLvI
	lSlz2BWc4W5PZhE3oW/FVQu8LYmpiXGzeYmSASfMZdSGZdZ9ItfWvqP79jh3lZDgoq8lBfD84D7FQ
	LBlI0bmzYONQlR7sKW5eGXJorbs5+X7Spy4KmKWqR1a0so7sfmyb1Rd4Q09h6LBIka5U3/EAAvZLD
	gtrttM/zPgvJk8z9ppP7yYQvO07zPewqClhCf5fzIwaFc8eIu4WrGt8q6LoFRNTpKrqQ1kAvHnDy8
	4pOlxAb9rT04p6kID3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqnh-0000000HXDa-31Eu;
	Tue, 12 May 2026 17:21:46 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqnf-0000000HXCd-07fP
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 17:21:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778606499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=doneI6Hkw8dD1ksg+soHfqrbwclZazg2GtaFjvBGONM=;
	b=Dd6ufYOCuspCUmri+/cve9fBn1NyY2KEefrsegIAKkb0bH+3fLnMj31AHPNQx1zyCA/yIe
	oZzJSQVs5IbrV+mLTvFheBawhGotH1bvEfsWDTDeB5RiaSWhgrKxo+lW2J/0zxrRHxKr10
	jHVDgy+nh7OT9ewwb/vL/CCU02hCabM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	Pu Lehui <pulehui@huawei.com>,
	Klara Modin <klarasmodin@gmail.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: propagate insert_resource result from add_resource
Date: Tue, 12 May 2026 19:20:35 +0200
Message-ID: <20260512172034.328405-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=thorsten.blum@linux.dev; h=from:subject; bh=DdMFF69dc0rPkx1YMplMpB+mcdSl27Da8CxlhC3ayAc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnMiUlzzmR9Dp1z8tKLlaqCjfOi1BjFTdJknPV7Sq7Yq gjLHzvSUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABO595qR4WXRhcgZlwMrz8Ul bVt+e1HO94J3byu+fmI/zbP14/mzqwoZ/sftKZopc1Kg/oCfyknrHc33tz+62fh0scDW56YMhjv DrrIAAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_102143_222363_8A3E8EF0 
X-CRM114-Status: GOOD (  10.14  )
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

Currently, add_resource() returns 1 on success, even though its callers
only check for negative values. Instead, propagate the insert_resource()
result from add_resource() to align with standard kernel return-value
conventions (0 on success, negative errno on failure).

Use %pR to print the full resource range while at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Use %pR to print the full resource range as suggested by Ben Dooks
- v1: https://lore.kernel.org/lkml/20260512124628.300360-3-thorsten.blum@linux.dev/
---
 arch/riscv/kernel/setup.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c89cc272440b..52d1d2b8f338 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -71,16 +71,13 @@ static struct resource *standard_resources;
 static int __init add_resource(struct resource *parent,
 				struct resource *res)
 {
-	int ret = 0;
+	int ret;
 
 	ret = insert_resource(parent, res);
-	if (ret < 0) {
-		pr_err("Failed to add a %s resource at %llx\n",
-			res->name, (unsigned long long) res->start);
-		return ret;
-	}
+	if (ret < 0)
+		pr_err("Failed to add resource %s %pR\n", res->name, res);
 
-	return 1;
+	return ret;
 }
 
 static int __init add_kernel_resources(void)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
