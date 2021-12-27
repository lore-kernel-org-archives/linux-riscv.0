Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C929C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlaJBpzNoLW7+oqXa9kgtzDLu5P1MvZDboGGQ7mUNiE=; b=v9UvCUs4I/rTh8
	RT9MiTl7A8kDqnz+PTsVAmvMzIdLtNqLf3Lw/bA/Qq6fzHhQhqGH11DLVSot2mFkgkzSLbK5Vr3H/
	6JU5N+le7qDQhDBH8yUJpInYkxPEu4k2/3sT9NyvfTZFfk8NztpBwYXIt6xrirUzywj80irJ6pTPX
	sRbv7ONTlHcB9jNpg+5V8NecaHpDt1dF/eMNYdw1EGknbnOgrD43yevBUnJy4FTe6uAVOiEcNCY21
	WuA9Uw2p/3uADxm9sLKcOE3p/+RzuP+9f/hq6R/k4u1DOGnWjQIltrOZgooPKsnZdX4HzNIwwamj+
	PJ7j19Kc8imnwj0SfE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1t8e-00H20p-Ib; Mon, 27 Dec 2021 16:46:20 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6S-00H0W4-II
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:07 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGfnbh017509; 
 Mon, 27 Dec 2021 16:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m3Op9QzYPMOkofkODaQRSokfesAlghmkehCWQBGqDME=;
 b=gpbBN6K2GBP6meNrYLkpZeDSrrLYRKsKXreCPadHTGlRBrKAGw4KgabMO8ZywbWoYnaI
 8U5saRo8MO0fJNSwjlKNwZFTjNsquerHku185wkH67Hna+JahNrejIj37pyxTGmr0uuU
 cFxhR9k8Zn9tN8b4JNXTdTAxGAvA3ZGJ9/QVC3xNLkzQxKATIfymz4hf3umgXLe2dvq6
 9RmlT/tJbTZcIGvm1t4pbxacwHiNAybfTgb48Wdxuf12HwxO780wtUCIzRs9GS6B+g8L
 Oa4TBciUq0p5xaTik4hCaufEITNCLhtvNaZRV0hsARNxtGKVLAc5cE3NRPuIdGf1FdmR fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7h7u80yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:54 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGh5bv019588;
 Mon, 27 Dec 2021 16:43:53 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7h7u80y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:53 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGhXrJ028675;
 Mon, 27 Dec 2021 16:43:51 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3d5tx92sqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1BRGhn1d44761362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:49 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 069ECA4054;
 Mon, 27 Dec 2021 16:43:49 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 656AEA405B;
 Mon, 27 Dec 2021 16:43:48 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:48 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC 26/32] drm: handle HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:43:11 +0100
Message-Id: <20211227164317.4146918-27-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N2VXl7MRHeRQ5xh6qznq6AxiCgwDJpoV
X-Proofpoint-ORIG-GUID: AkOqeJPoNSqCOFDVxmJ284P-MLPjAL2R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=646
 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_084404_805433_D37B4F5E 
X-CRM114-Status: GOOD (  19.92  )
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
those drivers using them. There is also a direct and hard coded use in
cirrus.c which according to the comment is only necessary during resume.
Let's just skip this as for example s390 which doesn't have I/O port
support also doesen't support suspend/resume.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/gpu/drm/qxl/Kconfig   | 1 +
 drivers/gpu/drm/tiny/Kconfig  | 1 +
 drivers/gpu/drm/tiny/cirrus.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
index ca3f51c2a8fe..d0e0d440c8d9 100644
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@ -2,6 +2,7 @@
 config DRM_QXL
 	tristate "QXL virtual GPU"
 	depends on DRM && PCI && MMU
+	depends on HAS_IOPORT
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 1ceb93fbdc50..81749943af13 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -13,6 +13,7 @@ config DRM_ARCPGU
 config DRM_BOCHS
 	tristate "DRM Support for bochs dispi vga interface (qemu stdvga)"
 	depends on DRM && PCI && MMU
+	depends on HAS_IOPORT
 	select DRM_KMS_HELPER
 	select DRM_VRAM_HELPER
 	select DRM_TTM
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 4611ec408506..c9b6e9779d18 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -306,8 +306,10 @@ static int cirrus_mode_set(struct cirrus_device *cirrus,
 
 	cirrus_set_start_address(cirrus, 0);
 
+#ifdef CONFIG_HAS_IOPORT
 	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
 	outb(0x20, 0x3c0);
+#endif
 
 	drm_dev_exit(idx);
 	return 0;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
