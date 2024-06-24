Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF906C30653
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 18:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52fxl9O/QKT0z3Se6YV7+BFg+27uOhRTrIrwQvNHJ+Q=; b=ebC0vmH1dh2j01
	O77kok93IvZyN6wZrj9wyNzmpE8sFWeNpWLrSEWe9guS37hyzFFbcDBRjioeAyaDkxOu1/IAWiSOh
	pMkSY96kFHj6Z92i/UU+KQziK4IOQraZEeKNEqBWXHBzvr+oNvj62gMs5M++Aji1HT0Y2U3YtVo3w
	Wb99Ha9LybUNSHH1w3iRSPFBDg0vb5sQlqeGlJLJ+5gPPFqlxV4cdIaIimodpGWUvnFS7MRae2D7F
	N4Oj4Xt8RYu69hHLmF0BikqlH0Kqvc+qQxCRW0cImDjbip6t0PvQflEC3s/3JRC8bgCuh1f0ELmaa
	OsVxh81iRETYVTI94u+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLoog-00000000KPu-2Lfy;
	Mon, 24 Jun 2024 18:53:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLooc-00000000KOY-2R4i
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 18:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D159610D5;
	Mon, 24 Jun 2024 18:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D914C4AF09;
	Mon, 24 Jun 2024 18:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719255200;
	bh=U72EtpzbiKzdfZYMZqZ6j+rqYebEL67up9pZVkZeQk0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FD81BvqyDxLnI+QMw8K7UgCl8zk+gDT9s53JPO30trVFzpSzBqsL9hlbS5j16TCLO
	 uytKpn3jyxu4bq7olou7jE/b2omJkbSMRSgymBTyVO4s6tJPNTkOY7pumlRxha/+aY
	 GKCuDRC589DCAKtEAhc7UFwscsavFdnLzTy6OkKSuPLYQgG/Iq2V37JDIser9Aaj4I
	 fXRzTVfmmMMZUtrcVu0Bfmaq8r11D3bdPKFGfxMccrmkS9KE2lz/kqWU7v+4O6Ou++
	 J5zsWIlu7hp+eP6lYmUYWW76NxWtWWFSXeoex6eD6aCtwoDPOLfZjEzJ4nlf3lemKh
	 uRQ2w6VlP/ljQ==
From: SeongJae Park <sj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: SeongJae Park <sj@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/7] Docs/process/index: Remove riscv/patch-acceptance from 'Other material' section
Date: Mon, 24 Jun 2024 11:53:07 -0700
Message-Id: <20240624185312.94537-3-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240624185312.94537-1-sj@kernel.org>
References: <20240624185312.94537-1-sj@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_115322_710126_DD0836F1 
X-CRM114-Status: UNSURE (   8.36  )
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

'patch-acceptance' on 'Other material' section of 'process/index', which
is for unsorted documents, is actually well organized under
'arch/riscv/' directory, and linked on the index document of the
directory.  Remove it from the 'Other material' section.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/process/index.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index f66f9cbd0300..08b4eb1e9118 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -115,7 +115,6 @@ lack of a better place.
 
    magic-number
    clang-format
-   ../arch/riscv/patch-acceptance
 
 .. only::  subproject and html
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
