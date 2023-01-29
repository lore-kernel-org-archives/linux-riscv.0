Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6166BC05027
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jan 2023 23:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eNRF3laZv6O6INT1U1dL7JFWXR+EqZhtJYW+/Jea28k=; b=HFb/vQu+kLhk9o
	n/RY7YGv4Yy26ICyeB9HUPWqxQaGNiZbvw0ugY6OJ6RTRiWP9WiXS5rbmQzMP7aNb0alzA+WNlTjf
	4+A0Vd1SFIXimi9ytIYUtvrDO2PXrdcxmv9qlRHldvWnZr6xHLwqj25qzUcjyKCmuPmm6yzqJj2sM
	wyry1yuV8PZ37KrPCn9CVmdAY/2Qc3ITDtyCh3hYIFUT4u/QDUhhboRa5vk4zj6m0pWVNIXkJBfXQ
	CWrZo6ab5GDqOaLo2d3rbhswlwwOPBASgYpkM1ZJ9C1ChLK49wRiYlL5ApaytZNcYGryq+uh2dQ9Q
	AineuNsW9qecXYm8sSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMHYX-0023uK-68; Sun, 29 Jan 2023 23:57:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMHYO-0023tw-9d
	for linux-riscv@lists.infradead.org; Sun, 29 Jan 2023 23:57:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4EB460E76;
	Sun, 29 Jan 2023 23:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BC4C433EF;
	Sun, 29 Jan 2023 23:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675036662;
	bh=3M9RArcAY8Mxrx+FHI+PUewWDlb3iuK8seiKci0ECWM=;
	h=From:To:Cc:Subject:Date:From;
	b=qm9FRuxQ6sxYlf1KDnfQEGQOGs2WgOGusRMvN2n5z6LRAgy4OtJpbGS52ldJIWaXS
	 WgCOzME0mhJrUlIDFiZeZrJyo+mafekXCF5rfuX0J8K6IxB1tlHZEtuJQ+z5/gLQqV
	 Koy5HXYl3AI0rbgXqqRw5YmJHT9w1brG9mytpvWRL+k9dZDfj8iG4KYZiI9lKDad2e
	 tPgcQ/LdwjJ1FX0kNV9bn4j6H/O7MH3PV+9WC32+Ks9AoVcqV/ZMzCbvkDspSBdJgx
	 PgpEYhP1tcHGnM4aUBpou1LL1HX1m1R5Le7zNgmw7UEgciLKsVXTFNCFRg11fmees/
	 db14HMtt2dTww==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	corbet@lwn.net,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] Documentation: riscv: fix insufficient list item indent
Date: Sun, 29 Jan 2023 23:57:01 +0000
Message-Id: <20230129235701.2393241-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=conor.dooley@microchip.com; h=from:subject; bh=/JT1iPSOFYOqM725NwkI9fejoWCY457nSjP9BGE5Es0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnX2Y9/VPyWIZ75b2Z0tGDTXA/7G9/3zJeaf+7EeRvVPpH2 3rUaHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZgIXyvDf+eH4jrzZu387hKqZbZrRZ rzx0Mrnv53VHzzfDv/TFfPoMsM//P5IndMucvSuH1nVvqiF/8/6zbN/Oq1semG/olVm6b+3cYGAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_155744_420576_94B619B6 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Conor Dooley <conor.dooley@microchip.com>

When adding the ISA string ordering rules, I didn't sufficiently indent
one of the list items.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA string ordering in /proc/cpuinfo")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/riscv/uabi.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
index 2ebec4c52230..8960fac42c40 100644
--- a/Documentation/riscv/uabi.rst
+++ b/Documentation/riscv/uabi.rst
@@ -21,10 +21,10 @@ so for our purposes the following rules apply:
    single-letter extensions and before any higher-privileged extensions.
 
 #. For additional standard extensions, the first letter following the 'Z'
-  conventionally indicates the most closely related alphabetical
-  extension category. If multiple 'Z' extensions are named, they will be ordered
-  first by category, in canonical order, as listed above, then alphabetically
-  within a category.
+   conventionally indicates the most closely related alphabetical
+   extension category. If multiple 'Z' extensions are named, they will be
+   ordered first by category, in canonical order, as listed above, then
+   alphabetically within a category.
 
 #. Standard supervisor-level extensions (starting with 'S') will be listed
    after standard unprivileged extensions.  If multiple supervisor-level
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
