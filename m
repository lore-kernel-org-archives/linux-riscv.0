Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41063C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=955vWfWFUEhSja0ms1NhZVkP5zqZnT0Zl9d3mJG5hiY=; b=fUAb5MGq3PuLvy
	KLvqsspuNQAzW0eo2boHoWhBY2+toa/1zeBfoEyGTRB/LGbq5r5h4Pypy3ES85BSHiXZrWpVvOkjE
	WLzY3uSN9Fyr1RIoJASdUReBLaSyn+zSO/NmJH1UPM3A8xuvnY22srcJWK8U8OSZE8Tg5NGcZmJLj
	Po2SE6t4ATGQsxWhPDwJV1fRpYPDsez/ZPznbP9FPRMyibxO8GniVcOUh9eN78X1U2+lh9DTwcAFZ
	mxx5pUlN15QQZZK+Ce2kW5nQ6E164K9KEPZaDiEK9o39nnBS5RjMeV1izk63MZgrEfPGrNu0YpNhh
	FdKv6GLohBUheaeIIcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tCb-00H3mH-6V; Mon, 27 Dec 2021 16:50:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t7I-00H196-29
 for linux-riscv@bombadil.infradead.org; Mon, 27 Dec 2021 16:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5NH0YwGVVHNVIPsuFRBaQqhN3tlC1Fj3WhI3b5TKrcU=; b=lNI+dKwRgGPR4Ao9JLREQgR+ez
 iPAxLJbrNCCu0thjWfWyktmUqAj/eXr3eEs4GdmagnawkR5GlKOCrllhSJJxHcpu//Ry3e0ILU58y
 K+1so8rGuaFsK11S1sHX8qC+q8ECssh7EirY/Nvr/XLv7HFsyMRixFUEdPCotZ6KWVOaEGEv8/wPj
 HC78cgoEzhMJcA4p7YRCKfAD4+Za34kEsvqG/sVPJ9oUhKBSEODrzs6RafSOgdbll6g3zpK5zP5Go
 EQtfBbUDork9LbcpecEQeK9KpbOQk1FYofMnvHuRDaAQQ9HYu2W720UynxSkS6UzcxxUW+zTq3s+K
 7eCNsh1w==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6c-003qqQ-EA
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:54 +0000
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGBt8H022450; 
 Mon, 27 Dec 2021 16:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5NH0YwGVVHNVIPsuFRBaQqhN3tlC1Fj3WhI3b5TKrcU=;
 b=tKFyZM00B7xQJ7vbidH479r+0ayDWgvoyjo7N3WR6shzcRygAySm7BQJWppCjIJdDTn4
 OaXH5ASsLnluYioxy4GQcmsrD3yQ8JzB4XGa9H4XzykQMIfn3JSVhsjUh733pPFlvDJM
 l6Gbpc4kRpk4ZGiENYeZMIbS7JZbyA+NDMs4bPUzf+b9cXm5prGAe5dAaQXVcY13e9+L
 ljp1cP4Bleh/ijHAHJ3mJoIY7u7zGr2YdIEuKSICl8aeCsv/FBLzyQIsvqGMokMc7O1v
 wOs/8AafvoTKBpFej3XtUQjwuPqMJuEIPu3CnkwmXR0eeiPWYWsfzyqajDIBqqBRjW7G pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gsv8fha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:48 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGM49w032709;
 Mon, 27 Dec 2021 16:43:47 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gsv8fgj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:47 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGgIac010438;
 Mon, 27 Dec 2021 16:43:44 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3d5tjjau7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:44 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BRGhgqL47579446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19A61A4062;
 Mon, 27 Dec 2021 16:43:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92813A405C;
 Mon, 27 Dec 2021 16:43:41 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:41 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: [RFC 18/32] pcmcia: Kconfig: add HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:43:03 +0100
Message-Id: <20211227164317.4146918-19-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YENPMttJiheGgyy9PKhXEvPLbJAlKWFl
X-Proofpoint-ORIG-GUID: y5iWcK5qO27rhVAnPQYG71T4ORhxu2Qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 mlxlogscore=870 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_164414_940996_41E3124E 
X-CRM114-Status: GOOD (  17.96  )
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
not being declared. PCMCIA devices are either LEGACY_PCI devices
which implies HAS_IOPORT or require HAS_IOPORT.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/pcmcia/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pcmcia/Kconfig b/drivers/pcmcia/Kconfig
index d13b8d1a780a..3d05bdf1f9cb 100644
--- a/drivers/pcmcia/Kconfig
+++ b/drivers/pcmcia/Kconfig
@@ -5,7 +5,7 @@
 
 menuconfig PCCARD
 	tristate "PCCard (PCMCIA/CardBus) support"
-	depends on !UML
+	depends on LEGACY_PCI || HAS_IOPORT
 	help
 	  Say Y here if you want to attach PCMCIA- or PC-cards to your Linux
 	  computer.  These are credit-card size devices such as network cards,
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
