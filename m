Return-Path: <SRS0=d4BA=4Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55B2C10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2020 09:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BACEE2087F
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2020 09:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sFeLL2vO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZ3cuu0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BACEE2087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0XP57eCeD96urC5Sd1jDuxkN6QGOnWt9kxFK0THATU=; b=sFeLL2vOdpsi9w
	nRMEr9lTfDmmVfbols4PVspnq0QYvZ0dvzbZ690pQLAl9xAAZeqLBJ8v50aCtz/xk/ysXJQ92rw0R
	9njEPbziCC4mTe0rKdTo+5ThlOwePDdLOXjlPyKwhPcf7Ps4YDWeusb8wskvJ1yXMgV25vrjZW0lF
	ugStJ1oQ6FG3+YGy5K77hpgTSsuCdtxMAZwJqPbDm0rhUia0CMIeUbZssYen7bbzEcBVylvS0D3WW
	TsWiJOUJSGYCxAFAJ/p7hU1vl3V98s01d9C6eOFwDerSh6nhVmoH2sAe+iO0Ej8ksUprow24H7xv/
	UahdxHXXlbX+JfSKZt0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAscq-0002Wv-MY; Sun, 08 Mar 2020 09:53:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAsck-0002C5-Ff
 for linux-riscv@lists.infradead.org; Sun, 08 Mar 2020 09:53:31 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDB6B20828;
 Sun,  8 Mar 2020 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583661210;
 bh=5bpP4wMCQfaX+IKe4Ot/2AMhW1qZtJCQhDHd5qDbi0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DZ3cuu0ct5yXdL2CfQe9Xou1gpghhwYdyQxzpU69tPebqcnlA6BwdgX/Q7dopJX6P
 p80MIGbibANWcaQod6FczX+BWexkzJOY8AZN6yaySIsljcvkMF50NuUUaAJmdTpswt
 HvvmBYjYFuOr8dXNrJ8XTUhrpnCKtTXRIn970HJo=
From: guoren@kernel.org
To: paul.walmsley@sifive.com, palmer@dabbelt.com, Anup.Patel@wdc.com,
 greentime.hu@sifive.com
Subject: [RFC PATCH V3 04/11] riscv: Add CSR defines related to VECTOR
 extension
Date: Sun,  8 Mar 2020 17:49:47 +0800
Message-Id: <20200308094954.13258-5-guoren@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200308094954.13258-1-guoren@kernel.org>
References: <20200308094954.13258-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200308_015330_572882_AC2CECD7 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 arnd@arndb.de, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org, Dave Martin <Dave.Martin@arm.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Follow the spec to define the regs' bits and regs' number.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/include/asm/csr.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 435b65532e29..49b93b638680 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -24,6 +24,12 @@
 #define SR_FS_CLEAN	_AC(0x00004000, UL)
 #define SR_FS_DIRTY	_AC(0x00006000, UL)
 
+#define SR_VS           _AC(0x01800000, UL) /* Vector Status */
+#define SR_VS_OFF       _AC(0x00000000, UL)
+#define SR_VS_INITIAL   _AC(0x00800000, UL)
+#define SR_VS_CLEAN     _AC(0x01000000, UL)
+#define SR_VS_DIRTY     _AC(0x01800000, UL)
+
 #define SR_XS		_AC(0x00018000, UL) /* Extension Status */
 #define SR_XS_OFF	_AC(0x00000000, UL)
 #define SR_XS_INITIAL	_AC(0x00008000, UL)
@@ -31,9 +37,9 @@
 #define SR_XS_DIRTY	_AC(0x00018000, UL)
 
 #ifndef CONFIG_64BIT
-#define SR_SD		_AC(0x80000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x80000000, UL) /* FS/VS/XS dirty */
 #else
-#define SR_SD		_AC(0x8000000000000000, UL) /* FS/XS dirty */
+#define SR_SD		_AC(0x8000000000000000, UL) /* FS/VS/XS dirty */
 #endif
 
 /* SATP flags */
@@ -102,6 +108,13 @@
 #define CSR_MIP			0x344
 #define CSR_MHARTID		0xf14
 
+#define CSR_VSTART		0x8
+#define CSR_VXSAT		0x9
+#define CSR_VXRM		0xa
+#define CSR_VL			0xc20
+#define CSR_VTYPE		0xc21
+#define CSR_VLENB		0xc22
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
-- 
2.17.0


