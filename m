Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18436C10F0C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBEA920684
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SOKiosQS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBEA920684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WiNomByVT1kUZ/UfDK50IM2sssHSKO1eIxvjoU87rlU=; b=SOKiosQSB+0QIFR+HcChOb99C8
	1aKvTWg2sYbZK0y8Cf6MhTReoUVlY0Ymj4EuA22VXXtWr4fbSFhSQSyt2uFL6zK7AReSPaIwZ6/Yu
	S9oFyqEkJ+bM1Kwf0IJFJcHiRFXKmOxqbgDnkzvxxr6vC5XJFTpG5qkzH/Fhfz3xEFfqN5JHEN6b2
	ZQU5eITAWw2RWjdnySCCX46xrxo5vbA9xQNZUjqJaYHfvZSW2j/J7CB8mtZVmWRwKZLCgVMdPmyC0
	iQsGXIbDM+Zs9c3B5f93AcfdKICnldwqLkjpwisPlvnpjhjbahLH+tcdgj0/7wxl/z6UKxyD3Sl1/
	8UCjrdmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2EsF-0005mD-3k; Fri, 08 Mar 2019 12:45:15 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Es4-0004fX-Or
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 12:45:11 +0000
Received: from orion.localdomain ([95.117.97.241]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MofPt-1giqIb492v-00p1Rj; Fri, 08 Mar 2019 13:44:57 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] scripts: checkpatch.pl: don't complain that
 debian/rules is executable
Date: Fri,  8 Mar 2019 13:44:23 +0100
Message-Id: <1552049064-32044-5-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:/aNiaUTcsj0E0j3M1ztgDLgje82UwrMzNDIplcsHJI2w0y1jPex
 lBc1jxG1uC7xJgvWhw4rouzoilkV7yqW/9Tq8XIPAMjWXnnOJKjBV6MGmCp3I2QraIInXUh
 4vxqwof7CSAWbwBwOipTJcnCKF8H/9aNOKVGUMsPcCPVGXGnGv50lmzXM9jlE8CvnejGkWL
 srQtQvyCr1NK64OdOIjIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iufGRRxJwrM=:VSD9inoEcc4w9+KSPmEqd8
 /TJ/kCl1rzv9d3REDWg5lmPecDKuK2Esy2ZFB8RfTGWhJ4i17n1RlqFsMSWwso8enWm0j7X6T
 FQJPb+Huhi021jTIdj9m7pM6XnCE28N534PAupd7Sb1B49K2vYlMSiIsOhBmjyA9uyuBOtmsC
 35tdCKppY+ZotBpj0IGEcwSS6CnD0+hMGBfgrd/ymeQaC7WEs/gSxYnJBHtfAHbcN+ctwpU/f
 m+YwhvlZEKR3iRybAKem8jao0LCtTHq+S5u4Mz1bfs9EECP9d5C7hlEGg34aI+txtrpLyxnzw
 ObxOtnyDJC1hFMDG/4k35mOa5PDeNl2j2lF28++FenM6cYNaPaYVk7H6dT2206Jg6dDQNQavF
 OGXys13EmSrpAf//kBhHaI962ksvsjS0G9zFkiZ1idtZXA5KhlxYGiDgochicAVeItl1/QtRu
 2OgdzAegfq9yb9RW5EmLlfmbpOP4LCN4lKcF77wdiHTv0Eiwbr21gULtYQhHZ+KhQn/L0TWOZ
 7Kv9behPo1vEareB/8MnUwYibjPlsT9HBuCC1qU8uxJAGv+aKJA39KyZSERJX7+PSCygGtCL7
 iRLz+GxL307pBF2Be1r7PdiV+xpUieX8YshQHXeMXFwmKoPxyeE5rh4XnSqcDU7b+klBS0J+t
 G1qg53Y5N+8dfJRizYf/If5irxMICIwh1eb2OIcBkf44rmPNfOKw9x0zTB8+fe2ZC+Jk4j+Sb
 G9dNYVoNwg8VB1DGrnx534zbkzf1ZT2edA9CoA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_044505_144849_A255BB9F 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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
Cc: michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
 yamada.masahiro@socionext.com, apw@canonical.com, joe@perches.com,
 linux-riscv@lists.infradead.org, info@metux.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

checkpatch.pl complains when adding executable "debian/rules",
obviously a false alarm. Therefore add an exception for that.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 scripts/checkpatch.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b737ca9..7bcc70a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2576,6 +2576,7 @@ sub process {
 		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
 			my $permhere = $here . "FILE: $realfile\n";
 			if ($realfile !~ m@scripts/@ &&
+			    $realfile !~ "debian/rules" &&
 			    $realfile !~ /\.(py|pl|awk|sh)$/) {
 				ERROR("EXECUTE_PERMISSIONS",
 				      "do not set execute permissions for source files\n" . $permhere);
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
