Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8310C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yj8Mz4xkxgKh4YkIdggFNRC158SvAwfeqIGfMXPuhcE=; b=5Ax12qFHlTdhxv
	SjMpl5rJBiNruOKUfXI2Nz5M67axYBhg9nURSnyfzr3iNTd4qnSZjEbXsDeXBIACYWUoRGYKt3d5N
	X2GxcMRG35XlgAzz2G/DfPoia8Wu08e02vptXto3CLqJSJ48kJNaqWC73cZsgBAKCyMvP3v3pxlDI
	EyUSY10IIEJU3hFefw5syzLZsLnYWtLVz+Jt1wKavtSTmDiQ7tBrcxh4nFUUCHf6yE+JtCv8ApkIt
	mE8z1CYE59AjaxBI88bxmYp90x50pU27F52m15/GLMb7r8bAxP8gd0lS4dPhEifU2TbrUA1f4TvkW
	E/+ZItx9kruCyGG9LtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1t6j-00H0ib-QT; Mon, 27 Dec 2021 16:44:21 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6N-00H0Qn-OK
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:01 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRDki73013674; 
 Mon, 27 Dec 2021 16:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hIBFcxjmtzohDZ/kmY6VFfuiyb5BHDC2Fbc38OZUi4w=;
 b=G8P9SCJ2mqw9j31zqEc3b0xvjScuM6/UNcxqneFFwh5XeCxUQbJyY9MOuFUCNtU17EYj
 W7NgHVl7T6qQdeedA4BSrswnqH1PgUAYb0lPYzY6jgTTmcDz23QSDH834b5hlKZYXcHB
 BgX4owatBWc5mW2FExw7tJHA9TJIuDXctKehGiHsJ1MkF0w5nwaVU7SwRGCg1zbjKGbX
 ozhgHK8oBmicXPFSXA1VyxdbFQ5nIV8kiDRYRZkQy51/7utb9DNWmr193nLfPydBoiDH
 w3qna/3e8tTJfv0uJGHRz4jRusoEjyF4LXU3s7q8iikNE14TQK8KPgXbexXpLU2vI8ZZ IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d7dqem13v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:33 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRFueJR029166;
 Mon, 27 Dec 2021 16:43:32 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d7dqem13c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:32 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGgHMq010430;
 Mon, 27 Dec 2021 16:43:31 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3d5tjjau6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:30 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BRGhStO30802366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6515AA4064;
 Mon, 27 Dec 2021 16:43:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D05A2A4054;
 Mon, 27 Dec 2021 16:43:27 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:27 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 03/32] ACPI: Kconfig: add HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:42:48 +0100
Message-Id: <20211227164317.4146918-4-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CQK38XptqBK4i58UASdrK9AI5CnuPHMk
X-Proofpoint-ORIG-GUID: 5bsj_d8tbA9EhcRyHrgYKVbpN-_VsNQK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 spamscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_084359_927990_C85B702F 
X-CRM114-Status: GOOD (  15.80  )
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
not being declared. As ACPI always uses I/O port access we depend on
HAS_IOPORT unconditionally.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/acpi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index cdbdf68bd98f..b57f15817ede 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -9,6 +9,7 @@ config ARCH_SUPPORTS_ACPI
 menuconfig ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support"
 	depends on ARCH_SUPPORTS_ACPI
+	depends on HAS_IOPORT
 	select PNP
 	select NLS
 	default y if X86
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
