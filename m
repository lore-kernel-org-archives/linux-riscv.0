Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F3DC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 16:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ra+a20/N6O4We2osj/6Mky/eXI20DjMetCqosw42KgA=; b=LWsdnptTaMKDGo
	oWuThMlHOwnFkaXdxfvkPxPJtG5Am67izY8+gndgpQjD0+w0G3ZYpJU/9XN+o8P8BDYGLMT18b74R
	E6FezgQTrxlb/T2wE2yTxfEYQRAR4RdhOJwxF9O7EhavrZLK7UdhNHOm36CRhKgTUrokMYv0YYeaJ
	iIyCBC8bJDakrDeFBG9Evwuz0DqJO+TNKxZFCGtEq4s85CVJ6Ula41TznCbtF71wLcrn+/UuKMCvM
	8Y/9Nuh+ti0mKgFWgKmHtAfjw5eCwA53Eig05xb2YmQAL8AIDy6JvvjPXlgL3DBJ6B+fyc6XqyImb
	QwgPBfvK/8wUkUjhX3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7HCM-000000023Um-2uKH;
	Wed, 15 May 2024 16:09:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7HCJ-000000023UG-37qH
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 16:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EA7E6144D;
	Wed, 15 May 2024 16:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4678DC116B1;
	Wed, 15 May 2024 16:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715789382;
	bh=NSbjQo0KGQxr91tG/X2mH7UIPoBhdYx/7f7fa50z/kA=;
	h=From:To:Cc:Subject:Date:From;
	b=O6ELehAijm+yZ52B4QPZdDxq6OJ1qBWOnKCsfs0rnFJsB+aktwwNS9zwCXCcLSUjt
	 dF08DEJ+uO3T2ImhEM1SdHWYsvo62MDApyZXvlNMCeCq2ShAKO21yIoHHzV1YFXXNY
	 SOhsBSNFeK2USB41XC6wdQ+OZr8S6odNAs/WsQzqSrAlRBwYSt+xStRI5XdUJnkoIw
	 l/PJqGKL+dN0jpBh/bVsy0GWdErZTqFVvcf9G2O7E1xy173WE7LRYUfHvKWw2RG27M
	 hTo+mbLz0eLR5DUTJM83YDWLziddWvk05+AE1BnauzSLoVVFjXx8NTR65Z64jXa8OX
	 4iWzLxDWWy8Vw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: fix Andes errata build issues
Date: Wed, 15 May 2024 17:09:34 +0100
Message-ID: <20240515-comic-sketch-3b40e6676f55@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=CAhQk586zjWNLJWwZpilXc2NDKe1f0YCLS1pl9hBeaw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGku9+yC/srPWRVw96D6jISSR8y8xiVZibH1gX/fTL/8I +nzk16GjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk4WZGhkZlmbp3VqsvTP/6 Lv7KQct2/sTPPWsCA0oOT5jbaf6tO4uRoVtwzfSOpX+/KVw5dIIn4M2xlc163a/Xb7m/2tl8++U JaowA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_090943_850912_E1324F05 
X-CRM114-Status: UNSURE (   9.23  )
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

Commit e47c37c24024 ("riscv: Introduce vendor variants of extension
helpers") added includes for the new vendor_extensions.h header in
the T-Head and SiFive errata handling code but didn't do so for Andes,
resulting in allmodconfig build issues when commit 589e2fc85850
("riscv: Convert xandespmu to use the vendor extension framework")
added a user of a macro defined there.

Fixes: 589e2fc85850 ("riscv: Convert xandespmu to use the vendor extension framework")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2: Fixup commit references in the commit message

CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Charlie Jenkins <charlie@rivosinc.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/errata/andes/errata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/errata/andes/errata.c b/arch/riscv/errata/andes/errata.c
index a5d96a7a4682..fc1a34faa5f3 100644
--- a/arch/riscv/errata/andes/errata.c
+++ b/arch/riscv/errata/andes/errata.c
@@ -17,6 +17,7 @@
 #include <asm/processor.h>
 #include <asm/sbi.h>
 #include <asm/vendorid_list.h>
+#include <asm/vendor_extensions.h>
 
 #define ANDES_AX45MP_MARCHID		0x8000000000008a45UL
 #define ANDES_AX45MP_MIMPID		0x500UL
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
