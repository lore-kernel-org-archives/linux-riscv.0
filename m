Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2169BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6dsg5BxdP2F35a8CR0YVK8WGsUH71MC91NsGTOr2gc=; b=ePD2LCaroUvmfo
	EqZZGUesKy2piNTY6CehoB7N8d0G621E34fmBRCYk9CtEK/Yy30G9UyWKbGvYtxxxAC64oisqDlxJ
	+HMeHaD/jZzGITo4yJp0UeE7VU+/l+67yRbZmp2QT8LHMg9Y3xW6eoNZbjUyp74tchYBfeGuvkFlO
	hx5YTeydPqKdwYtkkCAsSSxUYptyNxl5i5ci0JVSrdwR+p/Z09CIciVAZI5evvxUb+aUi0G8VwvDY
	gBZulMBFamP1bwzbCWmgSPORTyJmIw9IJGEmexDKg6Im3gOd6snWGG2fDYViLhvbGdI19pmwsxiL0
	JuN+0FO9eTIZkEvpiYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tD1-00H3yo-PV; Mon, 27 Dec 2021 16:50:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t7I-00H198-3Y
 for linux-riscv@bombadil.infradead.org; Mon, 27 Dec 2021 16:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=72gq8KqtPufaLlGJy3p5Ui8DPnidqN8imumjA88XMwg=; b=Yo2B0JiWiktzX7cYcrNBgW6I5W
 eg7jhBWRBRGKcCbpwzvRz7eZbTf9bduOVTFKZvizBl8vnmQaBn3vNkVPHZmetbI6rt0fDlZbHTwsS
 p41kLJUJSibb30oMWL8ZxErtjAXhm1rdZMGpAgLUo5WRzJEMBQt5HLWtWUL+J3T2YE0uYEAtj6DTU
 pocoxxA30tQOszr1RVjO+0wYF4VBq0Yk8nj/IFjomqLtaoK0a++8ckgalc2cOUBI6qOMaGz6LBdK6
 Yi8Kef3eySrAW8p2yX3kM3rmqyPJyQSeZJMNw4VLvs/lSsBy5NRCf+BXyttfRY1/3ZrcnPpLyFaq+
 2rFc2QPw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6b-003qqN-BA
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:54 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BREBfR0012485; 
 Mon, 27 Dec 2021 16:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=72gq8KqtPufaLlGJy3p5Ui8DPnidqN8imumjA88XMwg=;
 b=rzXtc12Ni+vG+qNqNjxlDfpPdH3s6LFEFCkSKYdTwCCGXuWofXdf1le+tmzliq8g3tfl
 ADyuMa/wnyeCUe4lCHlLV4d8MUgYPXP81uoA+q8Rwug350UVa/3gZTPaHwaDEQWw3Xye
 gBql1a57ahluf+BgRBvpEfPFss/MDsEmHBbBFt/gMvS4b++3avT/57fg8ifvAs9Z/c/l
 HkKipfGuoZlP9cmB6L/xmdGfplLgGpyLa5/f5L8/cNRX8/hjI2WPqxdJmXI99bwNEfwz
 qNKQ91YbxB61T77aA7Vv+EC40qH4bFmX+079IjuQxXbacaKw80sXqu4U0Iy5tuB8FrA1 Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7f1nar8n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:37 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGha5q012722;
 Mon, 27 Dec 2021 16:43:36 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7f1nar7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:36 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGbgCx001684;
 Mon, 27 Dec 2021 16:43:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3d5tx9as2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRGhVpX31064372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C828A4054;
 Mon, 27 Dec 2021 16:43:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 095FBA4066;
 Mon, 27 Dec 2021 16:43:31 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:30 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, William Hubbs <w.d.hubbs@gmail.com>,
 Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, speakup@linux-speakup.org
Subject: [RFC 06/32] speakup: Kconfig: add HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:42:51 +0100
Message-Id: <20211227164317.4146918-7-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TvS-qMbCiX1L0hwUDx_FvbF-GszlXFZJ
X-Proofpoint-ORIG-GUID: rBoBzUI_D22ceTGazxZUcmgEczWjlo5z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_164413_811242_A0052CBB 
X-CRM114-Status: GOOD (  14.98  )
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
not being declared. SPEAKUP_SERIALIO thus needs to depend on HAS_IOPORT.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/accessibility/speakup/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accessibility/speakup/Kconfig b/drivers/accessibility/speakup/Kconfig
index 07ecbbde0384..e84fb617acc4 100644
--- a/drivers/accessibility/speakup/Kconfig
+++ b/drivers/accessibility/speakup/Kconfig
@@ -46,6 +46,7 @@ if SPEAKUP
 config SPEAKUP_SERIALIO
 	def_bool y
 	depends on ISA || COMPILE_TEST
+	depends on HAS_IOPORT
 
 config SPEAKUP_SYNTH_ACNTSA
 	tristate "Accent SA synthesizer support"
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
