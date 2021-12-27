Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41E7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5xQFqhuzUWokhwcVJr/grHbV1fGg8xqpfydggcAW60=; b=jTPxviXVyjf8Hw
	ra6x6ccP7JFi/f3R6FHMV86ZM6VXbgsQtslMXMP8Gw9mBokl7dZdSme5sPfmhWSSfIGA97Tboi+hZ
	lbrpwwzfz8ZfnM15ei4b4955TCkb0ycdsdjrYvP7lWZLZDSD9jnGgkHo3VycpTtXI7UM4MzT/ngVh
	k5OZstKVSlnCjFKI7vpUrls8nBM5/xTV+Adh01kQVi1QnZpejPIATlt3qcFx5QzurFSBcdFdPJTjh
	kR0Z/bI9YHbEzt8XBJcLMW5VSDEQKdMJ7P0eRRT2fa5466Y+h+mFFd8c6sDZtYQdLHf3hJGZIMOGx
	01ddpPsd3qNlH8lPJkAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tBd-00H3Lp-KK; Mon, 27 Dec 2021 16:49:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6f-00H0g6-Ne
 for linux-riscv@bombadil.infradead.org; Mon, 27 Dec 2021 16:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Pvtf+6bGtw1lT1XKK96EsrHI6tn2htfQybVbOkeijcI=; b=njDHFG6bfQSf/b8pSKFcZrCaMu
 mCY7bSfALYNCokbod2jg57IY8z4f39udAvtxeA2KzZvV9XcUBesEh0/5tDoCgWcaMsMgjHOdP43p2
 /0csx7ou3UE/qQDUi0S1Jz1hZNfcWjYiJmJPqSc+7rC3lZqYZd5+Mrqjvzdp/2WYs6yCWs3SJXps6
 RDrSfLiDL4ub32ec7uCOtv16c47/ptL0rkc6oDdxhE3ye/23EpROO76bOgOAn5whokq7cMIbJhMBr
 kRwI11j6a76E5Tm2wf3+a7jyxADCAz6thZ2Fu9tkaAcf9fboxl8srMqrkjRrR1IEbZE9O6hMUdTcN
 wDdtb5Ww==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6b-003qqO-AO
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:16 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BREBsQO013190; 
 Mon, 27 Dec 2021 16:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Pvtf+6bGtw1lT1XKK96EsrHI6tn2htfQybVbOkeijcI=;
 b=FWqqq+2pMQz5sGZ9BpCBenbMsG/ylJZIr+DKbLQBpQ5B3nthCTg6kegYizBOwCI+6d3B
 purrpfZL0hxte9ENk5CTZLg4033BMH5ea/+HoVFsHzn2zQJA1DvkXli697bYvA12IcZ5
 xpdF2YVNk3l41C+heUW70ciKYQUKl1IGajUBJU0u+z8nM19+sDT16FAOVVD94KOizjV3
 fVLrSNtcPk4ClHOCCt86VGxD79fsIGvkBzcCOHRJu4lN96bnvJ16ZetRvjEG2An8v3iq
 XcUwgTwnq90RmWJyERHwMIZK3Ab8kHZEgPknGXt/bAz/f2HWWYHpTyCef9KF7l9LDqVW eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7f1narbv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:51 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGGYPU031705;
 Mon, 27 Dec 2021 16:43:50 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7f1narb7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:50 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGgkpN003026;
 Mon, 27 Dec 2021 16:43:48 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3d5tx9bf52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRGhjor40108482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CE3EA4054;
 Mon, 27 Dec 2021 16:43:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA3ECA405B;
 Mon, 27 Dec 2021 16:43:44 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:44 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: [RFC 22/32] video: handle HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:43:07 +0100
Message-Id: <20211227164317.4146918-23-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dajHH7ysqYXG6zAJZbpZ-TuOsR9X149-
X-Proofpoint-ORIG-GUID: whmQ-It2gXfjGHUjD3wLCqsb2tIPDbiw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_164413_776120_07B18730 
X-CRM114-Status: GOOD (  17.78  )
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

In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
not being declared. We thus need to add HAS_IOPORT as dependency for
those drivers using them and guard inline code in headers.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/video/fbdev/Kconfig | 1 +
 include/video/vga.h         | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index a3446d44c118..d95f638f4deb 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -436,6 +436,7 @@ config FB_FM2
 config FB_ARC
 	tristate "Arc Monochrome LCD board support"
 	depends on FB && (X86 || COMPILE_TEST)
+	depends on HAS_IOPORT
 	select FB_SYS_FILLRECT
 	select FB_SYS_COPYAREA
 	select FB_SYS_IMAGEBLIT
diff --git a/include/video/vga.h b/include/video/vga.h
index d334e64c1c19..53cb52c0fddb 100644
--- a/include/video/vga.h
+++ b/include/video/vga.h
@@ -201,18 +201,26 @@ extern int restore_vga(struct vgastate *state);
  
 static inline unsigned char vga_io_r (unsigned short port)
 {
+#ifdef CONFIG_HAS_IOPORT
 	return inb_p(port);
+#else
+	return 0xff;
+#endif
 }
 
 static inline void vga_io_w (unsigned short port, unsigned char val)
 {
+#ifdef CONFIG_HAS_IOPORT
 	outb_p(val, port);
+#endif
 }
 
 static inline void vga_io_w_fast (unsigned short port, unsigned char reg,
 				  unsigned char val)
 {
+#ifdef CONFIG_HAS_IOPORT
 	outw(VGA_OUT16VAL (val, reg), port);
+#endif
 }
 
 static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned short port)
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
