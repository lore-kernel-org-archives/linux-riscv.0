Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAA6C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2ClgPWo/c2llg0+LSBVnPDlqIQdaDbYHnRk2n8ikEI=; b=2dBKBvjCmjdl94
	596e7UykOQ3zaciwAWG5dq6NfwCbr7GcPrqV6bM6lw3aAocs8E6eOkrlZ1yDcUWusi1bb66caURmP
	OKouB0+v9w8i+00XLH4elUf8nHRsCuxxg3ZqCLUoeIKUI/K8zsKAqT0Mx9F4HndlXU4QWK1ZgMYrw
	hrQJGK3oDXqL98mOYFHO8mG8so1yR2QMz4Pv3gaE9HtsI+tpbwGp4a74uQI6y7wagxI81yIRX3JvY
	QyUcJC6HTg4fiijm2suEMJD7AKBH/TemryRWO3f6W+z3ema7Rhp0b2C5yVcrIpjAk0+Wnk0JBAaZf
	Fg0GGFqljHayCBcSb+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tCH-00H3fD-OS; Mon, 27 Dec 2021 16:50:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6h-00H0hS-C3
 for linux-riscv@bombadil.infradead.org; Mon, 27 Dec 2021 16:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=1B/ikMdI9recSsvoWnx6ERZvPWBYY70quL3TrfuTclM=; b=JKQYeXvEHZqvQCK7jBWpWPQv6C
 EJejeTVfsId2a7ULUEUwJAW5Fr3fX1m2ch47avStKYLmaw70TiZSQddo/YhBr7XmHkzx3ekKMBrZd
 YaF7TobhM5TrpSK5aKREFYcdWquMNYD5jy1ONxIqgSLWNSOy6yRLbKtHKU+UxnPferL38Op6kYDgk
 Cp/1rh6PzO92JMIJBxDyTsiY6P3kTaVEJzr7MoFcAFk8F7ssNTFYq/whz9rPwShIl17zLCeXh82ZY
 pD0AM02FnNG4iXM/JJcWB1UPSqRWwQm+6qivMKI5TvahJCRdAnRMP8XpIeSRHojJnV7/lzfhueZjB
 0u9Z7WGQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6c-003qqS-Em
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:18 +0000
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGfpFj012078; 
 Mon, 27 Dec 2021 16:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1B/ikMdI9recSsvoWnx6ERZvPWBYY70quL3TrfuTclM=;
 b=Dn4HFKNTxFnBi2Mkawz0QpRXF2hsg6OKigNteERQ7fabzCJKR6o5RpE10jYPUkNloRWa
 UhqUX16ropuMsJbIjcMK7plb882bp++OIv5ENGv9Efacimt0tXwN3TlNj2iUtwcSx5wQ
 9KAe8U1qVHf0pQNfdM1uq0QAjtYcMr2qvTcXSHSRflXccefRWaCs20G+B67tFmAVXMtD
 gbmu9KGWD15DQ7K4xVut0e5Q0RoLnOE+q9oSA6ba2kOGt9rXzkZg7gQ5Xk5hVNmiNCFu
 Pku8WMHnq4OaMQ0ZANVfS4E7JLqJQZv6ST+WnkBP8rBRiyVSrOKLFJaAZ687zH5Y0hi2 Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d7h7ug11p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:54 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGgenW013937;
 Mon, 27 Dec 2021 16:43:54 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d7h7ug11b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:54 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGhKhr019783;
 Mon, 27 Dec 2021 16:43:52 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3d5tx92t5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BRGhnh044761368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA880A405F;
 Mon, 27 Dec 2021 16:43:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D663A405B;
 Mon, 27 Dec 2021 16:43:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:49 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: [RFC 27/32] PCI/sysfs: make I/O resource depend on HAS_IOPORT
Date: Mon, 27 Dec 2021 17:43:12 +0100
Message-Id: <20211227164317.4146918-28-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ujuf9iMmvq98x9JQzuWVzyWWjxlWNq53
X-Proofpoint-ORIG-GUID: MUt-MUcYieEPSQclck_HrIpCkLiBQ8ug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_164415_427732_0CD3AC79 
X-CRM114-Status: GOOD (  16.83  )
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

Exporting I/O resources only makes sense if legacy I/O spaces are
supported so conditionally add them only if HAS_IOPORT is set.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/pci/pci-sysfs.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index cfe2f85af09e..a59a85593972 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -1099,6 +1099,7 @@ static int pci_mmap_resource_wc(struct file *filp, struct kobject *kobj,
 	return pci_mmap_resource(kobj, attr, vma, 1);
 }
 
+#ifdef CONFIG_HAS_IOPORT
 static ssize_t pci_resource_io(struct file *filp, struct kobject *kobj,
 			       struct bin_attribute *attr, char *buf,
 			       loff_t off, size_t count, bool write)
@@ -1157,6 +1158,21 @@ static ssize_t pci_write_resource_io(struct file *filp, struct kobject *kobj,
 
 	return pci_resource_io(filp, kobj, attr, buf, off, count, true);
 }
+#else
+static ssize_t pci_read_resource_io(struct file *filp, struct kobject *kobj,
+				    struct bin_attribute *attr, char *buf,
+				    loff_t off, size_t count)
+{
+	return -ENXIO;
+}
+
+static ssize_t pci_write_resource_io(struct file *filp, struct kobject *kobj,
+				     struct bin_attribute *attr, char *buf,
+				     loff_t off, size_t count)
+{
+	return -ENXIO;
+}
+#endif
 
 /**
  * pci_remove_resource_files - cleanup resource files
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
