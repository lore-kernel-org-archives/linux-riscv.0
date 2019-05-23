Return-Path: <SRS0=tx4i=TX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C212FC282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 20:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97EBC2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 May 2019 20:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="slDLu/8m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AKnEDntf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97EBC2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wMRiPmTD8penN1blzW1iXp59M9J2lYoz6oGACVdNzBs=; b=slDLu/8mqPFELYXlwgiCENVnGg
	RNOZuh+O4EgiCO6uTSf3GSO5oi0fYWgk0Ceu3Lt6MRO2rlBrNV57jq/a9epXzyl57P4iyym9G5tag
	e9WkJ2Q2yig/pdODlEwkRr2kJWqPX2Vfzx0CGVeVjP2HoPjLt7yfa7jZPx48acpj+Qeiy09VzKOe8
	H64BZFYbnH66iDNet7RVyokmNrh6WS5Ma9+yLRujZP/nnbpugUdJoEUAcNPReNyxFc00VrvwQIHQG
	i+1dohyg5vNssdc8PG5Snz1fn+E6VWRlWpMB6q2GWXCALDETy1Ja2Au4g+NSt3KDjHdix3oqhIgYM
	pbjj14yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTu74-0006Bj-MZ; Thu, 23 May 2019 20:14:54 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTu71-00068I-9E
 for linux-riscv@lists.infradead.org; Thu, 23 May 2019 20:14:52 +0000
Received: by mail-pl1-x644.google.com with SMTP id w7so3186390plz.1
 for <linux-riscv@lists.infradead.org>; Thu, 23 May 2019 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5G1ZPvgTrdgyW2PxGOXC6vH5P8E8ivAkNJzVwGirtqo=;
 b=AKnEDntflvnhyaBSvVK099GiNRlWgGmribqV0Gw/VdWTjwxzjpNafTbPuqKigoe2V5
 FttiilstLFzz13VHtqQ9Ow5qJWcSTmkZod1V/o67Oz7JpP4zndSuIOsjZEnzgLgC45Dg
 1OBKSki/z8keLPmKvajpOynSqHY7geZI+K/YsdtLyEKBdPCcZVy7j/HKpK1eqApnmVRU
 B6d9wKjRuRWn4waIsXQHcEJCqUAi1LCpXsW0bGQxXG81fDN09MqYT2dprU1jScxQcw8k
 jZAoSGnyRTN6nFsLblRD2D74d6EvdPLSc5r6ch8s3TeUUG7GD2LjrY8535TP8yf89ZX9
 Yk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5G1ZPvgTrdgyW2PxGOXC6vH5P8E8ivAkNJzVwGirtqo=;
 b=mzmUQS2WMMeorfCH/WDIugxGlhkJamyk5S5UUEQ8lLtbfh+lFEENaefACdov9Bb6Rc
 MF1SZC3M1odMcLrn8dOyu09rLBkXqkxKloPOFr5ojT7dyE87dtjarVo0/Qlv2qEwNRun
 Rfc1fNGuOrbDUKdaie7xxeDO2E3BFcL0eDJh8lgZy8I4BByi5hSWlTzB2eZnwqgwLZwZ
 tKIxdRsR604ChGU/aYL191yPO+uAcVjAzH2F8dheGPiYJjAHPe4WLnNbTWAqE3ESTHzT
 V0W/hVgley18/ymG/LZpZ2n/BwgDwyw8xHgEAT4dbhNalz44ZdzzP2DYC9MJgWw4u0te
 s94A==
X-Gm-Message-State: APjAAAXRQ5aOROCXcKRKD64hPqL/Zvf98RzNIMEpvjPioZBMa33tVp5v
 Jfq1/x3XlxxS8+2C+HsaVLfihw==
X-Google-Smtp-Source: APXvYqyocPUBK+x86to4bFHTsugKXVdIxgBB30akfZUKLbQ4YlaRtHksF4iUavWEP335zXjgDmppXQ==
X-Received: by 2002:a17:902:59c3:: with SMTP id
 d3mr29255894plj.273.1558642490753; 
 Thu, 23 May 2019 13:14:50 -0700 (PDT)
Received: from nuc7.sifive.com ([12.206.222.2])
 by smtp.gmail.com with ESMTPSA id i12sm180839pgb.61.2019.05.23.13.14.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 23 May 2019 13:14:50 -0700 (PDT)
From: Alan Mikhak <alan.mikhak@sifive.com>
X-Google-Original-From: Alan Mikhak < alan.mikhak@sifive.com >
To: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 lorenzo.pieralisi@arm.com, linux-riscv@lists.infradead.org,
 palmer@sifive.com, paul.walmsley@sifive.com
Subject: [PATCH 2/2] tools: PCI: Fix compiler warning in pcitest
Date: Thu, 23 May 2019 13:14:24 -0700
Message-Id: <1558642464-9946-3-git-send-email-alan.mikhak@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558642464-9946-1-git-send-email-alan.mikhak@sifive.com>
References: <1558642464-9946-1-git-send-email-alan.mikhak@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_131451_331253_A7503D38 
X-CRM114-Status: GOOD (  11.18  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alan Mikhak <alan.mikhak@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Alan Mikhak <alan.mikhak@sifive.com>

Fixes: fbca0b284bd0 ("tools: PCI: Add 'h' in optstring of getopt()")

Fix the following compiler warning in pcitest:

pcitest.c: In function main:
pcitest.c:214:4: warning: too many arguments for
format [-Wformat-extra-args]
    "usage: %s [options]\n"

Signed-off-by: Alan Mikhak <alan.mikhak@sifive.com>
Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 tools/pci/pcitest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/pci/pcitest.c b/tools/pci/pcitest.c
index 6dce894667f6..6f1303104d84 100644
--- a/tools/pci/pcitest.c
+++ b/tools/pci/pcitest.c
@@ -223,7 +223,7 @@ int main(int argc, char **argv)
 			"\t-r			Read buffer test\n"
 			"\t-w			Write buffer test\n"
 			"\t-c			Copy buffer test\n"
-			"\t-s <size>		Size of buffer {default: 100KB}\n",
+			"\t-s <size>		Size of buffer {default: 100KB}\n"
 			"\t-h			Print this help message\n",
 			argv[0]);
 		return -EINVAL;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
