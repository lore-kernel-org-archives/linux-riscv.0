Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652BBC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hu1H+/O5yHVA1T4poil7KDb4rTbc0OKf4RLKbBzP7mk=; b=GKrh4NJ1x7ZDCI
	jyMQD78siygYOERiw4Op7A7rRTgFIE5fKP4ns91FpvzH2IOZeAzYrSI1uAEQ/SC6dPAm8Br6SfDmh
	gsMS2Y7cvmqJreaxw14ZZ/icphwIfQpLBtFehhvS3mONCXUAi0sleVXNHaAkDrsuOTZqquxiPflBG
	5bU3RbCGyoS0qlKAm+144kX+amWUrEOpX9LCtbhLz6dTlcSAjTQWsJKyv4Jun1GvCCRmvUCEvGX75
	rs1ht8X1/IXkBDWSxah1/CqrFdy9AYt0zJVwcO7vhTbwaHEBH523W1Y1axAvGPgiGHRG/gV2nfJsm
	dXP7HYKCutF55GlY0Pig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tB2-00H35O-Gq; Mon, 27 Dec 2021 16:48:49 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6a-00H0bk-Fh
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:17 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRG73AR007043; 
 Mon, 27 Dec 2021 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=4Jnk05RgASwVHmw9tYbdNZNUcH5ZrQXFxo2Y0FOFXUk=;
 b=S5CJavFjj97sO446NiElAzLm1KEonJNQnAuwrDGnhNhDDFmmN2gTCqCn3S4A7ySbGgQ7
 zknKXH0Urt0LvPQvr+Dd8HxjXU3lkj/oZVbZP5yuqXlHgpJ6FOsl+rU+GjpvcLAB5fGL
 cJ9dVi4m9o4oX29/eK2bxB2E9E6+iDfMaUzNpBSlSk90GYA0wMSbQeiYQgIzUf/zEUOt
 dHbFE34w2fzqVKQs2riLKCYAeZ4L/juQpci2ZwSdjFom08ge23sV37b8OgZoFrEitade
 GAmUbRK7dxmGgL/VnxeHJY52yASfZB7Ez+Ho78XceU0WiqI8Bf76m+IFGBQUzfti6VMN eA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7fwqh884-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:59 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGhwrA031854;
 Mon, 27 Dec 2021 16:43:58 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7fwqh87p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:58 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGgtcR003120;
 Mon, 27 Dec 2021 16:43:56 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3d5tx9bf5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:56 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRGhsOZ43319656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:54 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40782A4060;
 Mon, 27 Dec 2021 16:43:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C22E2A4054;
 Mon, 27 Dec 2021 16:43:53 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:53 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: [RFC 32/32] asm-generic/io.h: drop inb() etc for HAS_IOPORT=n
Date: Mon, 27 Dec 2021 17:43:17 +0100
Message-Id: <20211227164317.4146918-33-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z-__i_BTuFSa6HSmecGdOYJZi9pH0hp7
X-Proofpoint-ORIG-GUID: K3NMce_ojCI3PBBmGLnsdW2pBtHawboP
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_084412_745985_A3A81539 
X-CRM114-Status: GOOD (  17.67  )
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

With all subsystems and drivers either declaring their dependence on
HAS_IOPORT or ifdeffing I/O port specific code sections we can finally
make inb()/outb() and friends compile-time dependent on HAS_IOPORT as
suggested by Linus in the linked mail. The main benefit of this is that
on platforms such as s390 which have no meaningful way of implementing
inb()/outb() their use without the proper HAS_IOPORT dependency will
result in easy to catch and fix compile-time errors instead of compiling
code that can never work.

Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 include/asm-generic/io.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index 7ce93aaf69f8..b2572b2eab07 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -448,6 +448,7 @@ static inline void writesq(volatile void __iomem *addr, const void *buffer,
 #define IO_SPACE_LIMIT 0xffff
 #endif
 
+#ifdef CONFIG_HAS_IOPORT
 /*
  * {in,out}{b,w,l}() access little endian I/O. {in,out}{b,w,l}_p() can be
  * implemented on hardware that needs an additional delay for I/O accesses to
@@ -522,9 +523,12 @@ static inline void _outl(u32 value, unsigned long addr)
 	__io_paw();
 }
 #endif
+#endif /* CONFIG_HAS_IOPORT */
 
 #include <linux/logic_pio.h>
 
+#ifdef CONFIG_HAS_IOPORT
+
 #ifndef inb
 #define inb _inb
 #endif
@@ -703,6 +707,7 @@ static inline void outsl_p(unsigned long addr, const void *buffer,
 	outsl(addr, buffer, count);
 }
 #endif
+#endif /* CONFIG_HAS_IOPORT */
 
 #ifndef CONFIG_GENERIC_IOMAP
 #ifndef ioread8
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
