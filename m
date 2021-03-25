Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5475EC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 22:38:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02AC7619B4
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 22:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02AC7619B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pY7Ej7LFtYg6ltFzmUtqJCnicZlESNTbdvN6GFVhEfg=; b=n2eWuUY8GTg3WTwExx9q3q4lr
	dRXLWSgA8TGun1oH0oOKWkncSo8F7EmQgvzz4tKGov32zUGqJa61lY5gKLXMAP8RyPGVG+aSc7GVB
	3YXBQCf+jyDqEImSK5fQbAcviBhiKm7+yN1RkHo8vkpfU1/HpGnNR39BtzXYVq7++JvTM2KkrW9oC
	mVDa5ScOaEq3swzfr1xJwAuD8D+S/bXstNniQGbN5EW1/fsRt4gd3velvDqSavkDDB9Ekqk1e0S0F
	Rw2zyAR/2wSSymzuvrb9J16U8qaw6YbZO00fcqOY3BWJ2FaUHR+jp32pqIiNg7oTmzkqgHKcVSPqR
	5sMpqskbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPYcc-002IJt-Tx; Thu, 25 Mar 2021 22:38:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPYcW-002IIy-MA
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 22:38:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED2CA61A38;
 Thu, 25 Mar 2021 22:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616711907;
 bh=73VsQ5V66Z2i7UXDiahsIQeBPPsxjN8due9MczLEMgA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dRF7V82Cjx0UE7OpHE9CYFwTxnGorcqrArlaxwiXw09aA7xjV84Mh7qKkbMlVA55G
 zVeSjr8BjzfGh0UVaOFX+nLpdD91EeWEW2+85FV4GjRn6YM0ckCbk/4Hpq7iQXS83r
 w0zNmMm3rW4SDn5QMH6X3jJRJbK8vmTBISf4iKs4g1HlxdM9Pg+NZziOuinvQ5fxb6
 gIFK1bSKKv2xGuzWzoj5OrcisVPSbd7BDVEfw6C2sIBnYbOFIwucs1Zg+pHwQpFpgA
 /2c5XgMc/8Y1Y3ZQubBkMKMBs4BZAkaXq56HAkSRmxbJzjh6o7cfeimQ4MUs3B2h+1
 34GnFcvzYGQ1A==
From: Nathan Chancellor <nathan@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Nathan Chancellor <nathan@kernel.org>,
 stable@vger.kernel.org
Subject: [PATCH 1/3] scripts/recordmcount.pl: Fix RISC-V regex for clang
Date: Thu, 25 Mar 2021 15:38:05 -0700
Message-Id: <20210325223807.2423265-2-nathan@kernel.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325223807.2423265-1-nathan@kernel.org>
References: <20210325223807.2423265-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_223828_933685_090E851A 
X-CRM114-Status: UNSURE (   8.77  )
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

Clang can generate R_RISCV_CALL_PLT relocations to _mcount:

$ llvm-objdump -dr build/riscv/init/main.o | rg mcount
                000000000000000e:  R_RISCV_CALL_PLT     _mcount
                000000000000004e:  R_RISCV_CALL_PLT     _mcount

After this, the __start_mcount_loc section is properly generated and
function tracing still works.

Cc: stable@vger.kernel.org
Link: https://github.com/ClangBuiltLinux/linux/issues/1331
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/recordmcount.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index 867860ea57da..a36df04cfa09 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -392,7 +392,7 @@ if ($arch eq "x86_64") {
     $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s_mcount\$";
 } elsif ($arch eq "riscv") {
     $function_regex = "^([0-9a-fA-F]+)\\s+<([^.0-9][0-9a-zA-Z_\\.]+)>:";
-    $mcount_regex = "^\\s*([0-9a-fA-F]+):\\sR_RISCV_CALL\\s_mcount\$";
+    $mcount_regex = "^\\s*([0-9a-fA-F]+):\\sR_RISCV_CALL(_PLT)?\\s_mcount\$";
     $type = ".quad";
     $alignment = 2;
 } elsif ($arch eq "nds32") {
-- 
2.31.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
