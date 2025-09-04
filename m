Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54A8CA1012
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nT7v/tXPGRu2tczS3dHQFTbtMzfuSbXg2IoM5TOkuxw=; b=ItBrEKlfBwmCp4
	iDtzrlXmiXxq66DGmA4AVQV+OvE2C1IHX7HuOE382oq+QJFfVhfTEbvEDFUN17m0VVTztJuXJW3DB
	9VkSYCma4eZC05oCtdq3XkSbZlxA8SzeDeA1BwxK1SWuhCnW+ioP4cbj/8vUtjzwgCQTfObhLQnPJ
	zTLTrzdGhaIQAE+H9uxDJznwBx7EaX7TEx5Wu/LOMM5HClyNEcca4MdUsK77dTRyMZMBnJFvhT03+
	OadfmjBjaHb1Jcxawgjv9aXQ5KUG0sEYxC/F/m0yudBjHMG7aDBLPY0WRNNJirn2C/XpIaFISJcSj
	FcPZ+FtQDqJpKvli7tOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2O-0000000G0ex-41Dp;
	Fri, 05 Sep 2025 02:18:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFrU-0000000Dyln-0VuU
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 19:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F3BB437D5;
	Thu,  4 Sep 2025 19:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDDAC4CEF0;
	Thu,  4 Sep 2025 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757014990;
	bh=EgcCdoVY7H5eM6LGqMKfnYcO9qd48zOeMmaW+lVEsGg=;
	h=From:To:Cc:Subject:Date:From;
	b=uh9I5D1/y3ZWigmWW9560supzi1UOyRXNSm1X89sHlCZl5KMwv8OxE6PBoO72sETK
	 kroJAjNJlBGBSdQA+v8seSr2c2/tobbmMDkfpSUAoji2TGwj1ZjhvahdrktehBRkVX
	 CM5s0Xj1m4LLPJxQINokkKAOrRNdpH8rcYbegAEShzRHB7ywRNmxxqWYe5qVYFqmNR
	 AXrGkuW7xH5Nrb36EYKCVgW967Oz57l1KddFcMvDnbBtYBkch2y3J9GuFtsp183RYu
	 tNid5Dhj5iIQAlQYItkXSSJFnaM7EFkXGJVeOyA/fpYJwYfgNaAgO5jgO51ulqL9Bw
	 JHZYofIRqdH1Q==
From: Drew Fustini <fustini@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Drew Fustini <fustini@kernel.org>
Subject: [PATCH] MAINTAINERS: Add RISC-V T-HEAD SoC patchwork
Date: Thu,  4 Sep 2025 12:42:48 -0700
Message-Id: <20250904194247.82655-1-fustini@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_124312_177585_BE5CBB80 
X-CRM114-Status: UNSURE (   7.07  )
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

Add patchwork entry for RISC-V T-HEAD SoC support.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6dcfbd11efef..9e0c149682f4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21745,6 +21745,7 @@ M:	Guo Ren <guoren@kernel.org>
 M:	Fu Wei <wefu@redhat.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+Q:	https://patchwork.kernel.org/project/riscv-thead/list/
 T:	git https://github.com/pdp7/linux.git
 F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
 F:	Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
