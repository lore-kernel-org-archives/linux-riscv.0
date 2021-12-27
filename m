Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8CAC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMMAtwlT0FOgsRchq7rz5JRfN8tX88MMzePRmuKbe5I=; b=QaNFiO6DeHZkff
	6ndDF4NMeUoXe6q5KCpR0in4XRPE/F6tveBEV8hJ86rX0tkVob6BALrBqpGIfP+qRz7ybNpVRej5i
	FcjJr9ryfDmYmbEq4lIobnJM7q/wzq8ESnUVD2k9hG3CenhPSqupkA2Iz9LAN7+1vGDKnXYyPOG9a
	pcmZdW7mzuzkJSuoTC/iv1Az8TCL3aJ5pTmaE45EecAa9jBrF0sBwMvEQrTl13EC/UVlPJEBnSU9v
	Lrvcp3iw5WAadJeww2jdGLRneuE2/bhYVKY0HEijPsoPGggOsplxei2GJ62G+DkmlVF79qDrqzozd
	5tp59aE4qRyQqfl3Bcpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1t6n-00H0ls-3b; Mon, 27 Dec 2021 16:44:25 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1t6O-00H0RT-Iq
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:44:03 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BRFfTZq022176; 
 Mon, 27 Dec 2021 16:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OumYKR7x/kmTh36tJozCiGImOdb1vuza0DrcnTPvHyg=;
 b=q+/mpF4HPR2QyEgfOtmhEF/tjUffbfsnVsaBlJSN2r/9k0MECkNYnF9zl3C6Oo5avyOk
 kz25DPa3x4ZvrKwJfQDAxkqYqilBFa8LcRwC/MF2+KCGYjuzAjXvTbebZg12gTKhCa5i
 ctSG5uKRJM7NeD+Ie67ZmlzGcQqMct1Xko4vH/w2udxo/Jf7UKBaWj1NN8+hI5eTeX2N
 yEfqXL6Bt0NM/IJ4aupdOCN5ApX+9uPd94hMV8O2Bwp01gjzYS1UfoTrqAoJ3jgyuMi+
 rt0YKRieYwW05lz46QAbeZACIzwwkad49mHMdseVnSLNiURtwRzqWa73TgRLVeTCwaLn bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gbns17q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:40 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRGWLke018109;
 Mon, 27 Dec 2021 16:43:39 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7gbns16y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:39 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRGbh7T001767;
 Mon, 27 Dec 2021 16:43:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 3d5tx9as2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 16:43:36 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRGhYHi44499210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 16:43:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 280A0A4064;
 Mon, 27 Dec 2021 16:43:34 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95B97A405C;
 Mon, 27 Dec 2021 16:43:33 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 16:43:33 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [RFC 09/32] sound: Kconfig: add HAS_IOPORT dependencies
Date: Mon, 27 Dec 2021 17:42:54 +0100
Message-Id: <20211227164317.4146918-10-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211227164317.4146918-1-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FloekVg-uv6CMDPoIQG0AcxlgTivbRcT
X-Proofpoint-GUID: p_95kSAAQrDh_g4HDZ0LOAh4gDCshcjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_08,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_084400_652425_D3F152E7 
X-CRM114-Status: GOOD (  15.74  )
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
 sound/drivers/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/drivers/Kconfig b/sound/drivers/Kconfig
index ca4cdf666f82..4b5ba916d93e 100644
--- a/sound/drivers/Kconfig
+++ b/sound/drivers/Kconfig
@@ -128,6 +128,7 @@ config SND_VIRMIDI
 
 config SND_MTPAV
 	tristate "MOTU MidiTimePiece AV multiport MIDI"
+	depends on HAS_IOPORT
 	select SND_RAWMIDI
 	help
 	  To use a MOTU MidiTimePiece AV multiport MIDI adapter
@@ -152,6 +153,7 @@ config SND_MTS64
 
 config SND_SERIAL_U16550
 	tristate "UART16550 serial MIDI driver"
+	depends on HAS_IOPORT
 	select SND_RAWMIDI
 	help
 	  To include support for MIDI serial port interfaces, say Y here
@@ -167,6 +169,7 @@ config SND_SERIAL_U16550
 
 config SND_MPU401
 	tristate "Generic MPU-401 UART driver"
+	depends on HAS_IOPORT
 	select SND_MPU401_UART
 	help
 	  Say Y here to include support for MIDI ports compatible with
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
