Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06327E77190
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIAOqcQyxpsKTIH4VOpLdhoMCdHNOz2a6sXZBvC9TPc=; b=FlBmOhnpLKpS3R
	5t9QCm+3bIguwkD+8hihRF4A4n5xiLmEKTUimwpzo6m2VaOgPSiFp9GJLWpzjv0xciGvuuerVUuYi
	0fprVGtRJ60cmegKp/2PKvaxu16M7lgz8Xs7FCaC0g65VdhOG2ZGGgZRZjjcLNurULFsErylra2ZE
	6bPINZRCs2IXlQB7oRoXzPy/5mzGORGOi9lhsGka6d9Ad9HNLNQQlsqlbNDsD9Yk7+dapA69pVySj
	XedLlywd9dUaMDa+GKpogam3FUA0v8KA8TxonbooAqLbE+BT9/iuo6cNA5H/pF6fSLmGiI7CBWoTj
	wgA58WoCq0ELutTPzczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfON-00000005NyH-172z;
	Fri, 20 Dec 2024 15:58:19 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfOF-00000005NqU-3Mv6
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 15:58:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Jd/m4zbR6LWW3A8qCa5nNBThBWahVG9In5EIy65DcuU=; b=4FXHGp+u6J5rXVByg4DE/AT7IG
	QAbGkteE4+15qLVvGCBvdfaKyXUaxrl5O8kn0odjRbZ3UrwakdyBwyNT2X5j5YJU5SPDIJ+DZtH9c
	+CzieyX+PJV5f26457HvKO1CIbYC82dp49XVb4O48EVrotXClcjCgSLHOlCHHoB1GNB2Yd/G0hXSm
	wVnXmI3d2K8VKtfBDgaAMl89bB904S0Oa7O5GR5AU8I2OX9UZboAwepQC913Yr5ppkK8W9cNCDYc7
	t2zZRcY/moQRlKHyADXdqnCstfK3dk2+q+YODY264LROfMAcFNO+KRVVgPmwc7UtxywGDr3Q9x4GN
	bTnZxteA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1tOfO9-00ADAI-Tk; Fri, 20 Dec 2024 15:58:05 +0000
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1tOfO9-00000008LSb-2lpf;
	Fri, 20 Dec 2024 15:58:05 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: felix.chong@codethink.co.uk,
	lawrence.hunter@codethink.co.uk,
	roan.richmond@codethink.co.uk,
	linux-riscv@lists.infradead.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [RFC 02/15] add __RISCVEB__ to byteorder.h
Date: Fri, 20 Dec 2024 15:57:48 +0000
Message-Id: <20241220155801.1988785-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
References: <20241220155801.1988785-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_075811_842156_FE1409E8 
X-CRM114-Status: UNSURE (   6.70  )
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
 arch/riscv/include/uapi/asm/byteorder.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/byteorder.h b/arch/riscv/include/uapi/asm/byteorder.h
index f671e16bf6af..61da07ed6b32 100644
--- a/arch/riscv/include/uapi/asm/byteorder.h
+++ b/arch/riscv/include/uapi/asm/byteorder.h
@@ -7,6 +7,10 @@
 #ifndef _UAPI_ASM_RISCV_BYTEORDER_H
 #define _UAPI_ASM_RISCV_BYTEORDER_H
 
+#ifdef __RISCVEB__
+#include <linux/byteorder/big_endian.h>
+#else
 #include <linux/byteorder/little_endian.h>
+#endif
 
 #endif /* _UAPI_ASM_RISCV_BYTEORDER_H */
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
