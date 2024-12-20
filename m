Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0DAE7718B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UZF2GudvLA5dF+mckvUkU3O9EoZFKpRBrUoaKJpEVU=; b=o7Lo6/C/fzP4/y
	KjbsOPG/jJLv7CGZvSoD/9kwPOG4Wgr3zt2SBNWvMNHhkAJ3g7dPcd6/i10Ml8AxpiuuoNE1FW9zq
	gh4ONIULxSiOlOQnrA6mdo10y2sIfAL8z6SX/hMLDAEsdhWoZJ8jeoZJ3XVYDicDVHr5qA3z/P9g0
	iH8YidSsvt7f2vtkwYCiOo/3H5AouK42O9Nv2I55zOZe7FUj3ocmzBFZJqQKFrg57adRWYRStR0Ii
	ROaRrBd1BHNNF/Pizv7zs5lzQcraOxuyBZLdYljsq6Cj1z2BDALdKs1H8rrxwYcovo+sU3EDk8YBl
	FJcWrmzFWsqExl5qH+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOL-00000005NxR-3Tvc;
	Fri, 20 Dec 2024 15:58:17 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005Nqi-26fZ
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qWYxWU1HG+Hd8irDJvgmQxnrG8DlxvlIVhSBwRExfPc=; b=KQT/wfVqdRmsV+dCgC0ObagiVu
	M5Mn2u5iHkxP8BFyz8GenL+Vkx9xZ2FM0sNef/lC4JjWqWSdDk72zkoGIDTndc++iCcmGvoJTSR3u
	GD64zULWdNBTxdcEjerxykJ7OWDq2W+9OgrxrvTPCxpBBn1ozpqZvZRhYIN3p5cidLAUQPCaDcxYS
	iKEExWaYZS6tbs8A4668Qp68CMd5GFG6shxHXDrOU/1pQHNaRTgJrhE+Ude/JhsRJUxJb7qzchBo7
	cGS+/nG/IOG4iG1CXQ1lzAX4Hf7Xsdqmkqq/iph4xD8zIafkMDORC4+tOkFAHzR1DoMG6JyHd8flO
	S7o+cwFg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfOA-006axm-4C; Fri, 20 Dec 2024 15:58:06 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LSr-37Ks;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 06/15] intiial header work
Date: Fri, 20 Dec 2024 15:57:52 +0000
Message-Id: <20241220155801.1988785-7-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_596518_224B69EB 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

---
 arch/riscv/include/asm/image.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/image.h b/arch/riscv/include/asm/image.h
index e0b319af3681..21ffe80aa397 100644
--- a/arch/riscv/include/asm/image.h
+++ b/arch/riscv/include/asm/image.h
@@ -13,7 +13,8 @@
 #define RISCV_IMAGE_FLAG_BE		1
 
 #ifdef CONFIG_CPU_BIG_ENDIAN
-#error conversion of header fields to LE not yet implemented
+//#error conversion of header fields to LE not yet implemented
+#define __HEAD_FLAG_BE		RISCV_IMAGE_FLAG_BE
 #else
 #define __HEAD_FLAG_BE		RISCV_IMAGE_FLAG_LE
 #endif
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
