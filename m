Return-Path: <SRS0=yFtJ=KH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C9EC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 18:15:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FB90611BE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 18:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FB90611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eYopxkuO6bpSMuoM0/TDLgMoW5+3TZyKNVT7VhkUZuE=; b=KURdCul40n0l1IAbxrjA+fHuV
	MpBRL/efNgbaYoGhUR4OozMFvnmPu7L7WoK6dUtPlLWk8GJyX/HSDKN9PO3tMpGt8IDCHsDdFH7of
	/iDhGlMl7NF2oALvt8E3EAR/5SdV7cGzdyBKE9+3I7QS+TM/YMZPkuW4G0Aellk6XRzHUv5G+NjEw
	Nc0VtkjwkgPQfBYcdnr/K0fSbT5OKnZiGiX0cT4EFXRtucUYxeX0PWYhU6Z4tUuwvZv4jWGT2UNIf
	aCYRZ+Q+k28NgeoHw73YXuDogN61UGKTio70hGYzL24Cf3U8PQ6br12kmgeFG40PE7pP0iS1z0Fv+
	HD03Bvvhg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgtOK-003Zxx-Hn; Wed, 12 May 2021 18:15:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgtDl-003Wcs-0D
 for linux-riscv@desiato.infradead.org; Wed, 12 May 2021 18:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BLIJUT6/SIA22fzxvCOoHTZ80FPxPC8vxYV5lXVlQek=; b=Y/yhKkd2/uyfn0fyJrm7Y8EnVq
 WPtYZbiqcSv0TnpnkHOOWNnog4ZCxMolmsVbxIGbtDKRdupLGeBTtA3BD5Y3871aCj8AgcMEz4IC/
 7LPsxYIpUa4X0BmJ1SAxyCGAYfBloJ9dJyi7JwJlsOiFha8ygsRm+IOBW/PMauvOTv14gMpm+iP6a
 5gLCGf6lQ07mJk5ygdIyGc7A8iArh4qagr6xTZpiX6czKZ+SnsK8WFGG6Nz44qwFAumZxwBiM6n8+
 ler4DlJoJQGDO/DAGgroQWmAiIjqXCxousR06dplPidQmSVdoL0LThdh4beluz7aOJsyLxUd0YnVW
 6T1/Khug==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgtDi-00AgAX-BA
 for linux-riscv@lists.infradead.org; Wed, 12 May 2021 18:04:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28C106157F;
 Wed, 12 May 2021 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620842670;
 bh=VDysD30fRwug+xHWx7FdQENfFyUXpotZ39qTSFeyguk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d5nP07AaFq2GSfzsiG7FhPMs5CFlzA0bnLo31OfzvE5VfCeYSU+XfQ0QhVqr25K/u
 fXlyF8tiN+vuZn53xxW9FJghAZQGWLmNY1k0reFfV9g/KoYYsBtgZar8QO6Fmfjry3
 ha2/jiqLPWSSwJ7eweSv7qMQvlMwde0z4AYVqwzezPp+f4DvOQPnMvfkdXegsnulKU
 Og72hem5Pu9BzfIDvRIb4jbcdBp9DgRQ6CiY8XVFudo5eL8AgBXsS/kPQitof8t8rs
 io+6sTXm6qDpdiDmBdzgFvTNwbmplXnAUK7gimukUtSau288BRMS4fdeSDsqL9VsXc
 TlAOvn+Yb+Hug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Fangrui Song <maskray@google.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Subject: [PATCH AUTOSEL 5.4 12/23] scripts/recordmcount.pl: Fix RISC-V regex
 for clang
Date: Wed, 12 May 2021 14:03:56 -0400
Message-Id: <20210512180408.665338-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180408.665338-1-sashal@kernel.org>
References: <20210512180408.665338-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_110430_424544_BCAA84FB 
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
index 0bafed857e17..857d5b70b1a9 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -395,7 +395,7 @@ if ($arch eq "x86_64") {
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
