Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CD7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8a7dmC5boniXxM2Mhtdp2avjCsCXC84AyON9p/T7cw=; b=31XTXAd0cybFUi
	wXX4R0SGljcpWs/uLDyLirXG+M22uFHEw6BgAPZgS/PLWmGlnL53oP4mbveDE8EQ6G0+ixGFRDFkN
	08K5vRmjk68MlVthZeCPMiANZFkh4o9UPb62/GKrhXtaWA7V6sJNJ41BPzxdK9ZTttjWnDuaHDsND
	v26kJXNlCLVNuG7zST1vRiha+kz6xBCuNuYnanso4cYGiKitfIiGtxug9oUoxdEU6SPlUvxkwubsg
	VZp+7Su+uVbqGzk7oC5Mvldh9oBJ5ApoyqIt4+cRE2oCvbLtYvi08taNdFy9s0JWcB1Hy/z8bEE18
	/5QpOk9ipFXU0Bcu4FyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tBM-00H3EA-Vr; Mon, 27 Dec 2021 16:49:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6f-00H0fG-0L
 for linux-riscv@bombadil.infradead.org; Mon, 27 Dec 2021 16:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rVA/opujcDurk3T7BUVOWmBKZAmV4zilWfIilRnO+MA=; b=lSrIASMcNb1umsflNm/Z6S8KTE
 Kl718M2t4wu9GYQ7Lt/t0k0jPrPp8siP1ZXqtkKAHsnYZcDsj4th14SUIkbbjA/ef7jc4vbegdR8f
 NYzHl/kFVtEW+XpfHNZVNoCp0zw5SS+OoXNZ8ri7E/M9+rbn4hMOo7O6M0fdvxcj8q2FAh3KhuZLe
 AUpJscwa+W+b2Cbul+bN/0zCWse/W0aieZ3TuSoZeYZ8xtQ0opuUTOV+g1JaA4YPkIo5akhBXibDc
 fHkG2M18dQR6ZccDR1/WqOdEnh9zrNo6VEkOEyfee6pylxWOgBUVdKSdBgQjSh+6FvwxiGkcILZ8I
 g+/w8bIQ==;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6b-003qqP-Bk
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:15 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGCORT003213; 
 Mon, 27 Dec 2021 16:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rVA/opujcDurk3T7BUVOWmBKZAmV4zilWfIilRnO+MA=;
 b=FrM8XWC3BtAu/mNOm38ZFBM4D4F6/vcbKnxwsl+zjE8HVJuilRziHeaE9FelFK6H02RY
 upByhv481Q5PVBgfR4ygy2/YhmSH5usiZXai6yWyft77C4ZCdmf2YycybKKj4oWD7Laf
 NNkf0vSPYdjdAXIcc8NisbCBDI4f1SZhA1qDNH26cswScS812uUYXJ1xQfyGL9fIVc3A
 s3oc5lJxvfmIP2Qcjq8Sat1Xa9lekDDrO+voVGwsO1uVb+RpWP0nu2J6Lrnagrlb3q7p
 SZGdtjZihsvsb2nzmH6v+hIKNCJJdOHWRNEmywKf73bhwqjDvjoGHKT3Q9GLi6KbF/r8 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gswgfg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGVGZS014787;
 Mon, 27 Dec 2021 16:43:50 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gswgffu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:50 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGbgD4001684;
 Mon, 27 Dec 2021 16:43:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3d5tx9as3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRGhkjL41615672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4598EA4060;
 Mon, 27 Dec 2021 16:43:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B30DDA405B;
 Mon, 27 Dec 2021 16:43:45 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:45 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC 23/32] rtc: Kconfig: add HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:43:08 +0100
Message-Id: <20211227164317.4146918-24-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _nRzpFR8XZugFnDlJYuZthkPV3pNLzx6
X-Proofpoint-GUID: YYAqwpTGAprwqTg35VINxMMyHGeBa-PB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 mlxlogscore=856 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1011 phishscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_164413_683342_EFCA296F 
X-CRM114-Status: GOOD (  18.53  )
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
 drivers/rtc/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 058e56a10ab8..fde2bdb7090d 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -951,6 +951,7 @@ comment "Platform RTC drivers"
 config RTC_DRV_CMOS
 	tristate "PC-style 'CMOS'"
 	depends on X86 || ARM || PPC || MIPS || SPARC64
+	depends on HAS_IOPORT
 	default y if X86
 	select RTC_MC146818_LIB
 	help
@@ -971,6 +972,7 @@ config RTC_DRV_CMOS
 config RTC_DRV_ALPHA
 	bool "Alpha PC-style CMOS"
 	depends on ALPHA
+	depends on HAS_IOPORT
 	select RTC_MC146818_LIB
 	default y
 	help
@@ -1188,7 +1190,7 @@ config RTC_DRV_MSM6242
 
 config RTC_DRV_BQ4802
 	tristate "TI BQ4802"
-	depends on HAS_IOMEM
+	depends on HAS_IOMEM && HAS_IOPORT
 	help
 	  If you say Y here you will get support for the TI
 	  BQ4802 RTC chip.
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
