Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCDFC433C1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 22:38:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 377D9619DC
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 22:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 377D9619DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JmhMKouqGU3KgrhakVaPQcUM/Lkq4ufMYJSuBCRjPdg=; b=YJbq4Zex+XC6QWG1L9b1rrTku
	Mnpu8dvEuc9o3si2hbt74BexOW3rv0Xo4QPFVxzguZlBFqhJqOon6rFr2iKgyxfti5Q+CVlBi87FO
	tZLpxnQACnTCpWusFbpW1cwd/RPzuzCwG/ECuprvW6Qqg7yv7M/ommpWgtZfUM9JFf1YqQ5v7eANA
	7DPIOh9oBhJSWDgaqFNar/ja1G8pOCJLY+eMbo3QQTvtRJsfE9qXtuFvbu8AwCqi96VdC8PlugqT1
	TyL+SJ2via4/FtDZAcejS4pvzoHwEBIeA2U15anJVXTap2vZl5xHUexQMvLwuumiR8r+k9RTRFAqp
	e9lcqOuow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPYch-002ILC-9Z; Thu, 25 Mar 2021 22:38:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPYcc-002IJm-4h
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 22:38:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F90961A38;
 Thu, 25 Mar 2021 22:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616711913;
 bh=4GybQa7x965w/lvJpnsuebjZBuJAklLkJS0kqW10SlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AQI76ZNAc2kYisTlQkA41/g1kQ67/tVaO15bbvMmK88fkN0onr1G+Ko7wyP6xc0I+
 6rClyDTLwT4L5Z4Rhr2wrCcJUDP5BbVPFEK+ph5So7pksluRk4ySFgHiPvBfQjB1ol
 fMx3ZURFNR+HIl/jIaOGQIs38ZwQ8OupO3shL4zZnuWCRuvp/ts5HpaTXBtgee94rg
 QCkviWbbq4M2Y+gIWqb7JnakATMHN3G2ybTG1/Eh3IEkR0pHwO6SkKZBoK0/VNqPwf
 7sIWLJf0PAdRi+PTAgkl2koj6ruDAp9NEzK+ZkPLSjaTBEgBRScQJLQKpiZvHKitpR
 oxI3MhBoZE8MA==
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Nathan Chancellor <nathan@kernel.org>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH 3/3] riscv: Select HAVE_DYNAMIC_FTRACE when
 -fpatchable-function-entry is available
Date: Thu, 25 Mar 2021 15:38:07 -0700
Message-Id: <20210325223807.2423265-4-nathan@kernel.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325223807.2423265-1-nathan@kernel.org>
References: <20210325223807.2423265-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_223835_028300_B0E99B59 
X-CRM114-Status: UNSURE (   9.91  )
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

clang prior to 13.0.0 does not support -fpatchable-function-entry for
RISC-V.

clang: error: unsupported option '-fpatchable-function-entry=8' for target 'riscv64-unknown-linux-gnu'

To avoid this error, only select HAVE_DYNAMIC_FTRACE when this option is
not available.

Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
Link: https://github.com/ClangBuiltLinux/linux/issues/1268
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 87d7b52f278f..ba1d07640b66 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -227,7 +227,7 @@ config ARCH_RV64I
 	bool "RV64I"
 	select 64BIT
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
-	select HAVE_DYNAMIC_FTRACE if MMU
+	select HAVE_DYNAMIC_FTRACE if MMU && $(cc-option,-fpatchable-function-entry=8)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_GRAPH_TRACER
-- 
2.31.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
