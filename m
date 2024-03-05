Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39656C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aEYsa1+rJCnqNTuvc4NeuOSFFIcwtzMDNoZsBEXy7U=; b=VMCuMFtBRHJG9S
	bL360Ono5N6F3Jye5R2qbORrDHRlqhc8x7j5MmC8irwIU75BJc9pbcI69AhXPYmlWxHRpjKVNsRSx
	SzEFudhSCyN0gxLLeUhqzZIEbfeVC6S9Hi2gOx6dGFqKOcKdd1HIlDf79m/ftEaZM/jXFMxjIU/ty
	lBHvv3Cz1RsB65VZnT54G9Iyefv9vnri8x5UnHaLSfOpljDj/7py7//sK7SGwym8+b4bLx2L0bi6h
	NwPa/jK0yY0pwT3RfpM3VAjmGdTCtxrK1RTqKRarQSWTCjpLivhS2MCCiMsjW9V8+ev4jB96YUM7d
	K3VaXmZcBS2KyksoCj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTZA-0000000DUjb-2SHC;
	Tue, 05 Mar 2024 12:06:40 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhTZ8-0000000DUiL-04AZ
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 12:06:39 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 425C5kAv023873;
	Tue, 5 Mar 2024 20:05:46 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 5 Mar 2024
 20:05:43 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
        <namhyung@kernel.org>, <mark.rutland@arm.com>,
        <alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
        <irogers@google.com>, <adrian.hunter@intel.com>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <linux-perf-users@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <dylan@andestech.com>, <tim609@andestech.com>,
        Ben Zong-You Xie
	<ben717@andestech.com>
Subject: [PATCH 2/2] perf riscv: Fix the warning due to the incompatible type
Date: Tue, 5 Mar 2024 20:05:01 +0800
Message-ID: <20240305120501.1785084-3-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240305120501.1785084-1-ben717@andestech.com>
References: <20240305120501.1785084-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 425C5kAv023873
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_040638_311370_0512FA91 
X-CRM114-Status: UNSURE (   8.90  )
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

In the 32-bit platform, the second argument of getline is expectd to be
'size_t *'(aka 'unsigned int *'), but line_sz is of type 
'unsigned long *'. Therefore, declare line_sz as size_t.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 tools/perf/arch/riscv/util/header.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/arch/riscv/util/header.c b/tools/perf/arch/riscv/util/header.c
index 4a41856938a8..1b29030021ee 100644
--- a/tools/perf/arch/riscv/util/header.c
+++ b/tools/perf/arch/riscv/util/header.c
@@ -41,7 +41,7 @@ static char *_get_cpuid(void)
 	char *mimpid = NULL;
 	char *cpuid = NULL;
 	int read;
-	unsigned long line_sz;
+	size_t line_sz;
 	FILE *cpuinfo;
 
 	cpuinfo = fopen(CPUINFO, "r");
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
