Return-Path: <SRS0=xQFv=QZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2062CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 18:42:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E699321736
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Feb 2019 18:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YTvo/aDl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E699321736
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=30yqpK2CrtoUzT6cCOWJ8IAv9Xfa6DgyfTdLWexxNas=; b=YTvo/aDl71sv7GHY6fgkfbCyU4
	AwLnIErsz50fwXKKTp8fra4LsCljV6sfYPDgem3ucfIanVN3Cb6acDpossc0Qry4XZ2NvPeiFA4Fc
	X9IaH1f040R8u8PEu+/RDUigWX7R7AYamz3wJRZxX9Bwtu32l9ttP+xjzQ1bVxHT6e2FFEuLB0XDM
	UKleVmsYYNsWeAMNZg5wvi+uP7XcVo96ooyODPXiCPcpfAXv7+FaoWwYp8GQ3LLgWiWN4+JDrgJRc
	zZklSK+5cZlCGK2vMbGBAV5Mt8Bwhf4Ep+4BCEslQl35f6WfrZLOC9NawzJi6ZqWiuPd8mDkdDomu
	ezHHlTGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gvnrl-0002Uc-DG; Mon, 18 Feb 2019 18:42:09 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gvnri-0002TB-Tb
 for linux-riscv@lists.infradead.org; Mon, 18 Feb 2019 18:42:08 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1IIcphR077193
 for <linux-riscv@lists.infradead.org>; Mon, 18 Feb 2019 13:42:06 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2qr08jnymu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Mon, 18 Feb 2019 13:42:06 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Mon, 18 Feb 2019 18:42:04 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 18 Feb 2019 18:42:00 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1IIfxAR26935366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 18 Feb 2019 18:41:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2179E11C050;
 Mon, 18 Feb 2019 18:41:59 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84BBC11C04C;
 Mon, 18 Feb 2019 18:41:56 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.207.239])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 18 Feb 2019 18:41:56 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation);
 Mon, 18 Feb 2019 20:41:53 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 4/4] riscv: switch over to generic free_initmem()
Date: Mon, 18 Feb 2019 20:41:25 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550515285-17446-1-git-send-email-rppt@linux.ibm.com>
References: <1550515285-17446-1-git-send-email-rppt@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19021818-0012-0000-0000-000002F72E7B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021818-0013-0000-0000-0000212EB8B6
Message-Id: <1550515285-17446-5-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-18_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=762 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902180138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190218_104207_070886_9E870B24 
X-CRM114-Status: GOOD (  19.12  )
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
Cc: linux-arch@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Richard Kuo <rkuo@codeaurora.org>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The riscv version of free_initmem() differs from the generic one only in
that it sets the freed memory to zero.

Make ricsv use the generic version and poison the freed memory.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/mm/init.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 658ebf6..2af0010 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -60,11 +60,6 @@ void __init mem_init(void)
 	mem_init_print_info(NULL);
 }
 
-void free_initmem(void)
-{
-	free_initmem_default(0);
-}
-
 #ifdef CONFIG_BLK_DEV_INITRD
 void free_initrd_mem(unsigned long start, unsigned long end)
 {
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
