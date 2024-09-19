Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330F6CE8D4C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Sep 2024 06:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=izYC1Brn5sF4lzXhLu7XzX92yVhXMI0jhF18Yf0MltQ=; b=Ml5HA0xXBceGgB
	7zqpNoNZmO3UjPY0kkCbzQHZhS0UhXlj+RV1UjvqOsN1ZcdnXD57XjLp+hh1sMS4APfAvC9jSTE/I
	2zjjIRGpxBe+glOImRuSbsvZZiYHZrmSXYv+1Ynmv37ze3awHDjDfCYq8wZSpDMnKRJXoWYcDzH9Q
	uWbEj6dxofJ0iPS/u++Fj9gN/uf/cqhogeFGIIqTr6MN2Xryzr2Q5QRmjSCjnCbjLyjcf/0//nTsu
	/049CshtUNRgKtDP0IAA34Kx47vHStG2wJmdGzltDkEqKDvEsq2NCLY3YH42bRYw8B7Nj8hYfwXZ3
	u9FxFN+t+SLovVmhTefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srAS1-00000009XsP-3gvO;
	Thu, 19 Sep 2024 06:15:37 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srARz-00000009XrX-0QBs
	for linux-riscv@lists.infradead.org;
	Thu, 19 Sep 2024 06:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oBYpkWszY7tggqf79E5F5PPG229HgY/r22zB1ZJnXhg=; b=auQZD6cUqKd5EA5acWo6rsIj9d
	A9kH19tYjJxdrNdRdzdz5dNI595piQHgeNnTxEiBlwqtZJ74uasCETar/Qh5Wg8+ZGchiBO49Sjq0
	x0Jtg++D/hqyCUQNJDBeh58i9kJR6F/QBUnj7MfTvYHtTKUJ0PXUiZR56sVLAO0v1/UPVr8xMXRKh
	98fhjTF9q2beJcRmuKJi68pXYhk5Jvp6wZM6e/FClCoIZQ4Uw4/SManec1N41Bhvgt0/0uG89ik9O
	QH3li1zIpbSRmfA0kmofMfDeYQdel4ugKEBmGucaG1K6uw/KZu3XYNkZM8hAuk1PG8S2rzxP8FdWX
	IJRGjHQQ==;
Received: from 81-223-238-147.static.upcbusiness.at ([81.223.238.147] helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1srARq-000GL2-9T; Thu, 19 Sep 2024 07:15:26 +0100
Received: from ben by rainbowdash with local (Exim 4.98)
	(envelope-from <ben@rainbowdash>)
	id 1srARp-000000016gP-20OG;
	Thu, 19 Sep 2024 07:15:25 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	charlie@rivosinc.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: make riscv_isa_vendor_ext_andes[] static
Date: Thu, 19 Sep 2024 07:15:24 +0100
Message-Id: <20240919061524.264007-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_231535_241563_1745961D 
X-CRM114-Status: GOOD (  11.21  )
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

The riscv_isa_vendor_ext_andes array is not exported out of the
file it is in, so make it static to fix the following sparse
warning:

arch/riscv/kernel/vendor_extensions/andes.c:11:33: warning: symbol 'riscv_isa_vendor_ext_andes' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/kernel/vendor_extensions/andes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vendor_extensions/andes.c b/arch/riscv/kernel/vendor_extensions/andes.c
index ec688c88456a..51f302b6d503 100644
--- a/arch/riscv/kernel/vendor_extensions/andes.c
+++ b/arch/riscv/kernel/vendor_extensions/andes.c
@@ -8,7 +8,7 @@
 #include <linux/types.h>
 
 /* All Andes vendor extensions supported in Linux */
-const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
+static const struct riscv_isa_ext_data riscv_isa_vendor_ext_andes[] = {
 	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_VENDOR_EXT_XANDESPMU),
 };
 
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
