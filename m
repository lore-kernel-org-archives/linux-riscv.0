Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF2EFB5173
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 23:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lc6Wdy1MmG1nrKZCLKE6A8Xr4Dew7GfNMJP9X46PQFg=; b=xmkXGtY5uiL2Kv
	SZLhrsBXId9x9Z+6ryoDj75RJcqjUiob0ocG+QpBKHEapq1KGW76jwaTXd1gDOGxDNRpwbmSepub6
	u+f2kk6K8RJRM5B0f2CUwYAiBiP3IokOi+9AQeqAd8ss1b1Xi7/H/dVi2h4vvcohtzqpc1jTijznI
	RAvlfehy8f4JnKf4gvPZt2gaiy2zZr+XoBLaemYaMgn0x0lwTMesL+EW+OPzU2RO12jeQZMN5LLsa
	NNw5nAkXoPTssaCv14HRTevtsMy1lBH1+GSuoqbqTksjjgN/BMPAVrYgPg9DvQxoEJCtVCiNbk6He
	+K1nXNzTwpGGyfVfm/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tHf-00000005bsg-3vHl;
	Mon, 06 Apr 2026 23:23:07 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tHe-00000005bsT-1EQZ;
	Mon, 06 Apr 2026 23:23:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] riscv: Docs: fix unmatched quote warning
Date: Mon,  6 Apr 2026 16:23:04 -0700
Message-ID: <20260406232304.1892528-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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

'make htmldocs' complains about ``prctrl` -- so add a second '`' to
avoid the warning.

Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-string without end-string. [docutils]

Fixes: 08ee1559052b ("prctl: cfi: change the branch landing pad prctl()s to be more descriptive")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/arch/riscv/zicfilp.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260406.orig/Documentation/arch/riscv/zicfilp.rst
+++ linux-next-20260406/Documentation/arch/riscv/zicfilp.rst
@@ -78,7 +78,7 @@ the program.
 
 Per-task indirect branch tracking state can be monitored and
 controlled via the :c:macro:`PR_GET_CFI` and :c:macro:`PR_SET_CFI`
-``prctl()` arguments (respectively), by supplying
+``prctl()`` arguments (respectively), by supplying
 :c:macro:`PR_CFI_BRANCH_LANDING_PADS` as the second argument.  These
 are architecture-agnostic, and will return -EINVAL if the underlying
 functionality is not supported.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
