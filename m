Return-Path: <SRS0=HcYa=DW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889F0C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2020 03:32:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D460222241
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2020 03:32:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gLC/Bwvv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dhXzwO7T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D460222241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Baau2ddatJF+vsRhCi5Ft1b7HpeE5IpHui6t+tylwZg=; b=gLC/Bwvv03BIp4rlD80y15Z6KF
	FH3a0myBevkmtXDud4tuCFWu0X63/mo02gfzI2/nO8BoHahXNRUZlwOTQxmgeuBemkUBFdqgU6/iP
	izlgYYNsGqwKKYy/3w2F7skV2cnn9r9JjdGnuS9NW3eh529f1LJUzfGXEnOMdy2Q80MU2+d4ghJMG
	oZfh6Aly+m3Yz6VBVdbBfURDvk9G7JZS2T8LU5Q4HM11jsuKtU4UyY07sJ8nbURT2+23w1U4M/Whs
	G4qIqGeRgjHK0ICOzb74luJHmt8HA82YxF8R2bQYFy6f+FeMScmb4L0G+73EaPxQb/pr7LQEI25CQ
	b+ccNdrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSu0A-0006Z7-Q4; Thu, 15 Oct 2020 03:32:26 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSu07-0006YR-LZ
 for linux-riscv@lists.infradead.org; Thu, 15 Oct 2020 03:32:24 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09F3GB0V047021; Wed, 14 Oct 2020 23:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=15VWw2AFltuDYg7bBruxmDbCNOmBFDkYMaDZKmmBOWA=;
 b=dhXzwO7TWiVIMpsKAnG58tJy86QLDzHgsMccLdBCbMKy4M+20ppwswjAkWnInxvm/3O2
 KKoYlbPysyevd2rI1nfakgo02kaTHtPnz/xgU6LwW3ocw+HfTjYXg++QNuef04WPRURy
 ZHjo9hROuYaiSq1csd1h/W17QJQkRwNv5b/0T9VCymwERn2JQtPPM5ofxuDgJ3XR/qmc
 wGve+St8AXBF1l8tOjXqV8M4T6xxoA/erK1iUj8a7RwXTpV5wBZYWdRAjMN/3KpE9DCj
 7ixVqpmBzPhrYE978kRq7rzGieXdye3+BTi7k7UourOnDreM7r7Mxl+PkQFF1gul4cMQ TQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 346ecdg8jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 23:32:18 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09F3R28h013455;
 Thu, 15 Oct 2020 03:32:18 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3434k9ehrx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 03:32:17 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09F3WHP520971914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Oct 2020 03:32:17 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E110124054;
 Thu, 15 Oct 2020 03:32:17 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44E5E124053;
 Thu, 15 Oct 2020 03:32:15 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.63.66])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 15 Oct 2020 03:32:14 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: [PATCH] mm/debug_vm_pgtable: Avoid kernel crash with riscv
Date: Thu, 15 Oct 2020 09:02:06 +0530
Message-Id: <20201015033206.140550-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_01:2020-10-14,
 2020-10-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxlogscore=917 malwarescore=0 mlxscore=0 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010150022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_233223_777601_9178CC4A 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, akpm@linux-foundation.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

It was observed that the usage of RANDOM_ORVALUE with a valid pte cause
kernel crash on riscv. Comment out the usage of random value on riscv

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index c36530c69e33..98b101a8fd2a 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -548,7 +548,9 @@ static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
 	pte_t pte = pfn_pte(pfn, prot);
 
 	pr_debug("Validating PTE clear\n");
+#ifndef CONFIG_RISCV
 	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
+#endif
 	set_pte_at(mm, vaddr, ptep, pte);
 	barrier();
 	pte_clear(mm, vaddr, ptep);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
