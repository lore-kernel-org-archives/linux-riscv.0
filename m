Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C97CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdCKvZsXjpm9uMU/ANH4j+95gDDzrDVUnHh1VOT7ylw=; b=vkBojP6xtLwrnt
	acXlU80Pyfza7LM5thF4gYBfORksdhhP/VoFcfJu64VN+xNQQuGl5VNjDU7UAYIgUrfVdo/1TUVar
	9EMqyOlO0wHiE0xvbReDjVGvXSrIpdljvhYlLrRniUUEkGTll+Et2NgQbE6drvx5i1BfcTZZhttRE
	w+yrYbwT/cDkjURaiCLRsrE5AmkvgsgDWWMk63voOENuyVI7xgGVU4mEMLuA1VIJiCR/ghRhYneXM
	ceRWNf3KUJY7R8kIe2N+TQYb9QP6W82QwRIft+Ryv/43moUmhLPL8jPh5makq02t6WEfgjnGP9X+W
	gEYRxLpq73Purqp0ji3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1t7n-00H1W5-0x; Mon, 27 Dec 2021 16:45:27 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6P-00H0Sy-9K
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:05 +0000
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRDkF8f038587; 
 Mon, 27 Dec 2021 16:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/hchrCNOUGL0KjCXJFz151XEtGX0vrgBMBuMc1hFth0=;
 b=Yaz8HUj/AHvHvpPHCXgKnIORXiWMzvVJeUe72vK2aCgEKCpu65wm1maQjWNPPbc52QtP
 aX8jqMKLbzojMAEEKWegg9IfMkugBy50YkWZVZ3FKRmhWQ3E3OR9oOwwsg/Kh7MRrXrM
 ZcV/LLzh5v7l6DGQgfNBIMNnC3xK3zh/jnXVJfNSlGwuEkGiXHn0tAAT4mQIkusWfKs1
 WUAYkibif9CpASfPwlISTtHZHNdNFHCM8T+R8dUaretXECYF+WnCtmZB3v/fUMGM/JFD
 h6EnJ0AawTVurotFbY0IqSHRm1f655GWYhoiJSOdk2clkPhd1aukB2pLmDRLqN0NlzXK OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7dqdv916-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:43 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGhgsZ014351;
 Mon, 27 Dec 2021 16:43:42 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7dqdv90n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:42 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGc6PB005244;
 Mon, 27 Dec 2021 16:43:40 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3d5tjjbhke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRGhbPc44826904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 700E5A4066;
 Mon, 27 Dec 2021 16:43:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E75A3A405C;
 Mon, 27 Dec 2021 16:43:36 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:36 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [RFC 13/32] hwmon: Kconfig: add HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:42:58 +0100
Message-Id: <20211227164317.4146918-14-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Og05-Aa6Tix89qkG8pECrpDGcs7lvPjB
X-Proofpoint-ORIG-GUID: 5FeheTftJwqXsrAo31O_i8KOyYQrnG3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=891
 mlxscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_084401_420292_E94AC076 
X-CRM114-Status: GOOD (  15.30  )
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
those drivers using them.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/hwmon/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 09397562c396..c1a2d8ac96fd 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -547,6 +547,7 @@ config SENSORS_SPARX5
 
 config SENSORS_F71805F
 	tristate "Fintek F71805F/FG, F71806F/FG and F71872F/FG"
+	depends on HAS_IOPORT
 	depends on !PPC
 	help
 	  If you say yes here you get support for hardware monitoring
@@ -558,6 +559,7 @@ config SENSORS_F71805F
 
 config SENSORS_F71882FG
 	tristate "Fintek F71882FG and compatibles"
+	depends on HAS_IOPORT
 	depends on !PPC
 	help
 	  If you say yes here you get support for hardware monitoring
@@ -761,6 +763,7 @@ config SENSORS_CORETEMP
 
 config SENSORS_IT87
 	tristate "ITE IT87xx and compatibles"
+	depends on HAS_IOPORT
 	depends on !PPC
 	select HWMON_VID
 	help
@@ -1387,6 +1390,7 @@ config SENSORS_LM95245
 
 config SENSORS_PC87360
 	tristate "National Semiconductor PC87360 family"
+	depends on HAS_IOPORT
 	depends on !PPC
 	select HWMON_VID
 	help
@@ -1401,6 +1405,7 @@ config SENSORS_PC87360
 
 config SENSORS_PC87427
 	tristate "National Semiconductor PC87427"
+	depends on HAS_IOPORT
 	depends on !PPC
 	help
 	  If you say yes here you get access to the hardware monitoring
@@ -1432,6 +1437,7 @@ config SENSORS_NTC_THERMISTOR
 
 config SENSORS_NCT6683
 	tristate "Nuvoton NCT6683D"
+	depends on HAS_IOPORT
 	depends on !PPC
 	help
 	  If you say yes here you get support for the hardware monitoring
@@ -1442,6 +1448,7 @@ config SENSORS_NCT6683
 
 config SENSORS_NCT6775
 	tristate "Nuvoton NCT6775F and compatibles"
+	depends on HAS_IOPORT
 	depends on !PPC
 	depends on ACPI_WMI || ACPI_WMI=n
 	select HWMON_VID
@@ -1664,6 +1671,7 @@ config SENSORS_SIS5595
 
 config SENSORS_DME1737
 	tristate "SMSC DME1737, SCH311x and compatibles"
+	depends on HAS_IOPORT
 	depends on I2C && !PPC
 	select HWMON_VID
 	help
@@ -1707,6 +1715,7 @@ config SENSORS_EMC6W201
 
 config SENSORS_SMSC47M1
 	tristate "SMSC LPC47M10x and compatibles"
+	depends on HAS_IOPORT
 	depends on !PPC
 	help
 	  If you say yes here you get support for the integrated fan
@@ -1741,6 +1750,7 @@ config SENSORS_SMSC47M192
 
 config SENSORS_SMSC47B397
 	tristate "SMSC LPC47B397-NC"
+	depends on HAS_IOPORT
 	depends on !PPC
 	help
 	  If you say yes here you get support for the SMSC LPC47B397-NC
@@ -1754,6 +1764,7 @@ config SENSORS_SCH56XX_COMMON
 
 config SENSORS_SCH5627
 	tristate "SMSC SCH5627"
+	depends on HAS_IOPORT
 	depends on !PPC && WATCHDOG
 	select SENSORS_SCH56XX_COMMON
 	select WATCHDOG_CORE
@@ -1767,6 +1778,7 @@ config SENSORS_SCH5627
 
 config SENSORS_SCH5636
 	tristate "SMSC SCH5636"
+	depends on HAS_IOPORT
 	depends on !PPC && WATCHDOG
 	select SENSORS_SCH56XX_COMMON
 	select WATCHDOG_CORE
@@ -1995,6 +2007,7 @@ config SENSORS_VIA686A
 
 config SENSORS_VT1211
 	tristate "VIA VT1211"
+	depends on HAS_IOPORT
 	depends on !PPC
 	select HWMON_VID
 	help
@@ -2114,6 +2127,7 @@ config SENSORS_W83L786NG
 
 config SENSORS_W83627HF
 	tristate "Winbond W83627HF, W83627THF, W83637HF, W83687THF, W83697HF"
+	depends on HAS_IOPORT
 	depends on !PPC
 	select HWMON_VID
 	help
@@ -2126,6 +2140,7 @@ config SENSORS_W83627HF
 
 config SENSORS_W83627EHF
 	tristate "Winbond W83627EHF/EHG/DHG/UHG, W83667HG"
+	depends on HAS_IOPORT
 	depends on !PPC
 	select HWMON_VID
 	help
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
