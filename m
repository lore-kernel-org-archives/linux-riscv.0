Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B524C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 15:59:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BBDA218EA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 15:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GDItk6IN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BBDA218EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4pJOwQH85yIQTD37HH0KMlvkvtiZoUL1h7sz8xLbXaY=; b=GDI
	tk6IN/z6iRCvxVEdjdn1h+DyOLWal2AI1aIAUh0cMmz0pgkV7HzBFPczhEYo5fBDldw8952yM3C+g
	VAv/CRSnba1vcBjvFvjhSXvktWEWOuV3RqDqclXAzGtrdDpx+Ukh+JqvhiHfLJsazLdY5ve6JCq98
	3lJ63Ke8MfWxI4DcONogyugEBJayDLD+tz/xlfpY1/skORbiHQ22mALD1NjaYqhGzScnh6l+tts+n
	pDHmOIBBIcpbXEZI1kyD2rRdOLlN656NICDuMVVdrefgFrZB6fvEY4Aj3z/Xbe5ZtlvLvf3RItsno
	P8brjdJt5vstf/Xct8R4S3UcJ8IDKlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guJQZ-0002DC-2a; Thu, 14 Feb 2019 15:59:55 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guJQU-0002AB-7J
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 15:59:53 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1EFgZrj016685
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 10:59:49 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qnaq9v36b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 10:59:48 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-riscv@lists.infradead.org> from <rppt@linux.ibm.com>;
 Thu, 14 Feb 2019 15:59:46 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 14 Feb 2019 15:59:41 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1EFxeFs24379450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 14 Feb 2019 15:59:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A434FAE063;
 Thu, 14 Feb 2019 15:59:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2C0CAE058;
 Thu, 14 Feb 2019 15:59:38 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.84])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 14 Feb 2019 15:59:38 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation);
 Thu, 14 Feb 2019 17:59:38 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/4] provide a generic free_initmem implementation
Date: Thu, 14 Feb 2019 17:59:33 +0200
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19021415-0028-0000-0000-0000034898F4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19021415-0029-0000-0000-00002406C565
Message-Id: <1550159977-8949-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=790 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_075950_374040_7F152FFC 
X-CRM114-Status: GOOD (  15.69  )
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

Hi,

Many architectures implement free_initmem() in exactly the same or very
similar way: they wrap the call to free_initmem_default() with sometimes
different 'poison' parameter.

These patches switch those architectures to use a generic implementation
that does free_initmem_default(POISON_FREE_INITMEM).

This was inspired by Christoph's patches for free_initrd_mem [1] and I
shamelessly copied changlog entries from his patches :)

[1] https://lore.kernel.org/lkml/20190213174621.29297-1-hch@lst.de/

Mike Rapoport (4):
  init: provide a generic free_initmem implementation
  hexagon: switch over to generic free_initmem()
  init: free_initmem: poison freed init memory
  riscv: switch over to generic free_initmem()

 arch/alpha/mm/init.c      |  6 ------
 arch/arc/mm/init.c        |  8 --------
 arch/c6x/mm/init.c        |  5 -----
 arch/h8300/mm/init.c      |  6 ------
 arch/hexagon/mm/init.c    | 10 ----------
 arch/microblaze/mm/init.c |  5 -----
 arch/nds32/mm/init.c      |  5 -----
 arch/nios2/mm/init.c      |  5 -----
 arch/openrisc/mm/init.c   |  5 -----
 arch/riscv/mm/init.c      |  5 -----
 arch/sh/mm/init.c         |  5 -----
 arch/sparc/mm/init_32.c   |  5 -----
 arch/unicore32/mm/init.c  |  5 -----
 arch/xtensa/mm/init.c     |  5 -----
 init/main.c               |  5 +++++
 15 files changed, 5 insertions(+), 80 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
