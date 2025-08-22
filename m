Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CAACA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DFZPs9g7fnLKW/jXfNvXfeml58gAbIa+nPkhuM5PFY=; b=HflBUtdTobLDeO
	jjaquBGjku84IDO6HAXlqAmwmRCRJlctIxcq5Kz5ZDysXZ+b6Nsgpxfr2R9bmZKPMSwSf2YbAtrs9
	cCl/CRAuYwK7lKgK7KQwQiLAbWfcqSeHEfmip80LcDAf4AgawwPZis8DcRBTWRTTjRu8wdi66fxTv
	dRyLDRuhQXEQ9xb9ubliMIHRoMfreclPbgYKFiTSrvIqeJGl9h//tAvsfXUKSxMqXJ7zMf/x1QQsb
	UcWesII+1v1hoGSgQbmf6No5NYi2pnn0Yxgs+dcz5IYYTDb3WJWvGDW65ZVe1e9waZo9fVG7BDj/s
	YcmhraGSNirFAf+qKcIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvU-00000004Bza-21Ey;
	Sat, 23 Aug 2025 06:40:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0h-00000003CZS-1Ppm
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+7y9wZuu4iM0u68DHbIbqTfnCoFbxjLPun0sJVjkZLc=; b=OjLr1sSjPtMZWQ58LFPhZaSHpt
	1tqMwpM5HR4zKPurGvvxcCTJpUoWriFxNDPWQlSmValbQBVQ5WZlBXoySA3Ap+au+3ibYVpPRDuV8
	6nZQQl1Q3p9p4c5D3Nzgsc5XsQW5liZ2keSa2EO6F/qHdmKS6aV1BA6VRSz5VA4OjQuUvlFwmUYBe
	KbrCP2IAp+rgKSgNDhSjYAxb/sYYuHXvyaLFNktesAgBtmufDuc83QBDIoHeWV+r/6v7HBFHP6u8K
	FDBrKn5Pn/fS0rIDkyayGRjapLOl0Bc8FaoTN6j84WLyXGbxr580v89lS66Rl+Obq523W2jNEyRmL
	Pv1qh0Xw==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011s4-02Fh
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+7y9wZuu4iM0u68DHbIbqTfnCoFbxjLPun0sJVjkZLc=; b=bU2a3OPvkx57MV17ln2D30SyC9
	f5QASzMl4MfFeqMdqbUWcQj1KtIclrh4kOGTb/nhXS1ix9o8aclFfl+RPGbwgENTymRAW+nNdy+aK
	JC2hlyr0XTli86OlXEmTHsxdPCRkTD1oTaHmJiHo6ywVq/yk1guOSezQO+9sxJn9ROL/QH/cO3QX4
	OTu609lXVyWiAzr16rAaakUCm/8ycgUNzGnHFJ3XGUI+Tdg9OsSvyEw5Q4/tE99RoJq/tecaOhnbU
	9+edjX1xqoswi8bxP0BZS+vb1NcAq7QftekANaVkrOB5rk5fN1c3mD8E8MAF7JBRL8wzRXTak2CUm
	ohatbhiQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0T-0015ck-Tb; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPG-2HNF;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 06/18] kconfig: remove CONFIG_COMAPT for big-endian
Date: Fri, 22 Aug 2025 17:52:36 +0100
Message-Id: <20250822165248.289802-7-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_210756_7B0211F5 
X-CRM114-Status: GOOD (  10.95  )
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

This code does not currently build with big-endian so disable it for now.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ca5cd4cf6e15..74e01d4de86b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1119,7 +1119,7 @@ config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
 	default 64BIT
-	depends on 64BIT && MMU
+	depends on 64BIT && MMU && !CPU_BIG_ENDIAN
 	help
 	  This option enables support for a 32-bit U-mode running under a 64-bit
 	  kernel at S-mode. riscv32-specific components such as system calls,
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
