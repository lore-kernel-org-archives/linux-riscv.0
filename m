Return-Path: <SRS0=yFtJ=KH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8B2C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 18:04:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4396143C
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 18:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E4396143C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pFTVZgt9HSZFAq89wxjNf0JC/6uKaO8kE3AW/FAQ4g0=; b=X80mdQVpksMduhdI2O2OHDgDn
	LI7fpL02rp+I69pOHsmhO7Z9AhYXjnqJV347Rf50lNhv28Dsdqu6xCEA13f4QJvRw8g8Qli8T5TdH
	kr2PdA04T4N/Z2kMM/6UGzDoNlbu0JCEgo8tQuspzeJslaurAPRU/I4TDRq+fNjwCVX/cdUeRlRSk
	0kCQn7XydDMCgWSkQfT0nNFnlYDp+3vMPpIAof9oImwxZhprjydHlEqvViH2/u8kfaNdZzOuytPOt
	KLqUm4kIPI6MbniwANCXpPtUJbQ3d6o3R8gSNGgRGGCXBIG8+3ecZR4aVe4v7IswhpXuBOkXp52nP
	q71dZuxPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgtDD-003WLE-29; Wed, 12 May 2021 18:03:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgtBw-003Vlr-38
 for linux-riscv@desiato.infradead.org; Wed, 12 May 2021 18:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JRfScDZX8Dtkxuod/0h29YGhmktvvLlXyd2gzXtQWfg=; b=wE8dQskNuatBblpJaKr09mQGSa
 M3sUjuZbE7U060s5SbrAdEvT7VTcrN9dwPdHijwEivuGTU5QSKJ0CjUeUH8CP0teG3Vqp3grU4KJX
 B0k8yAZVRaDgDLCEp8QkRfDBYUEfkJS4vEadgafk2JvF2UIu2sZdBOeGc425Nijn3EO0kItlcLNs5
 mkeNU6AHo7xD1PilZI8cJ2I/Uh64JWb9uk+HhiAHWJB6dsVJRp0OqiQt8hsA9z7YGlWV27QMhWP4B
 Bl5m2mSS4dX0MeOkFFrxWL5PUcK73K6Yy/Beq41u5iZoAOGYIVxpALhz0BD+/NH1C7t4Z7Un9LmvI
 yF6N7L9A==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgtBt-00Afqu-4o
 for linux-riscv@lists.infradead.org; Wed, 12 May 2021 18:02:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9213461438;
 Wed, 12 May 2021 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620842556;
 bh=m2noJKqKeW0U5wmwK56a/Dvf7G3056Cma/3oi2F6q9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RrZ4fS3FND9cWPwbTIqP6yRXoci/DtCu2UdgcGmbpZFEQQFE5JDq6uIWWEDbxK6Ot
 7QjW3HeO853HufTKmswoO2FACbrSzQYDg3WT+Bc1+u7hXO62flwqiK662misO9/XOZ
 wc0VbGGNM1lFap+UM43cyDAP/aeId+h9oKHlmT/OO3riOeXDTn8C0yscTlT1ZqmK8L
 oQSrb7Aqv7ACjXLB5HOrnaLiwTrH10c7ucW7KJpzScJq8QUU7M4WQuzmUcCJ5xefC8
 6bQiMHMZz1eDgzVhIa9DsUL3G84QXv2Iy6pb3YSPVIFUmP5M5sq4hD+48HM7ukcYFT
 ZoNlNU+Tk8tmQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Fangrui Song <maskray@google.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Subject: [PATCH AUTOSEL 5.11 18/35] scripts/recordmcount.pl: Fix RISC-V regex
 for clang
Date: Wed, 12 May 2021 14:01:48 -0400
Message-Id: <20210512180206.664536-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180206.664536-1-sashal@kernel.org>
References: <20210512180206.664536-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_110237_240804_6F2ADC88 
X-CRM114-Status: UNSURE (   8.07  )
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

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 2f095504f4b9cf75856d6a9cf90299cf75aa46c5 ]

Clang can generate R_RISCV_CALL_PLT relocations to _mcount:

$ llvm-objdump -dr build/riscv/init/main.o | rg mcount
                000000000000000e:  R_RISCV_CALL_PLT     _mcount
                000000000000004e:  R_RISCV_CALL_PLT     _mcount

After this, the __start_mcount_loc section is properly generated and
function tracing still works.

Link: https://github.com/ClangBuiltLinux/linux/issues/1331
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Fangrui Song <maskray@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
