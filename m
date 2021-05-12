Return-Path: <SRS0=yFtJ=KH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6954C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 18:19:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526B7613BD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 18:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 526B7613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4AT+Dq/BGZpvGehqiTk505Jul2JQm7ezD2u/6tJd1I=; b=UOUAdXDDH7IKoNaOD2IToD5in
	RrXEaVsm80azcFkrikwZugttFOPeGIlqpHNCw0xtS172UA5+DzAiFb+uZw66tR6CHl9+dQluhEDPr
	SkDoajSu0VLmXTnPdPK5nmvEaoGknwYAdNcunA1rJJSeaprq7ReEr8ZMtCQYbhmqj50+v4sQc74MF
	ah64NIC0T5aF6I2ULK6vzBQIyOR2MhP+/oon/9tP5u7sjaGa+pqKx5dDowUaae47/HBEGhtr0AdQ5
	auOeLwIo14fLOq5B9AdhXP5I8my2b3xibo41HVSFLek4LpsYy7N9HGTAQawaB1ayPemHZdBCI0Grf
	ODEMbvPkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgtSD-003bFP-LR; Wed, 12 May 2021 18:19:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgtEN-003WtY-Er
 for linux-riscv@desiato.infradead.org; Wed, 12 May 2021 18:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=spYGmTTmBf9035Ffm+wCSeMh9V1vLUjJWunfi3cE00o=; b=VRLlpKJGJwnhc3BobC/26hfegn
 g4l2Gt6UhWwZsS0hUXxLVcmqg5hZzbdUx2U8DoA1zYsHGntBDyuNuenGKnH1xC3wzmAHp8F2FxhZH
 m9VfXccTCvEOfF3ag8psvUaM7CK57eSi2E0+MKLpGO1YT+LKg6AYralYcK0idg5nf20J9ncHw1pbD
 g7+EoDXIZn9ivEJuOQpAW/Zc60WWGblVcu7pwlKo6pfQ6b49UmsnftZ7H4t9ZjHF3XPPhhI4xK2YZ
 BwryhtP3qFmmvE7DsUBXbpHBdrUYdO/7sufM/7y2fl8J3s3hp7cdP0eWqFmNu8CkrrJDQ2SgnDXFE
 2hqBAHPA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgtEK-00AgGV-Lj
 for linux-riscv@lists.infradead.org; Wed, 12 May 2021 18:05:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 397B0617C9;
 Wed, 12 May 2021 18:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620842708;
 bh=F081hX51q3B59BsP4AgcpqNgyGuQHHp7Xn2UbzpjCuE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ipYDArbLrS8vaKWgMxYlHlqTF8CJcbxK6+mmDv05TIirjh+e7GSAKVFtYAh4vBI8x
 PUD0C2vcnuqSrdyhmlt/PKmH7fB3PSvCS1dlxNA6yfwTtvYcf/pZEVi+PfqkX1/dqg
 qiouffryyANhJMcFFq0Qj6W5AfVw2y6vj7juXXktJcs+zww4mFrNmP9JE/IGNK0EhF
 Rb2axLYXFi1z4V7CjcFz9uz2fcqg9+yIBtg4JYOlbEkAVVKLp5FkJkSXFqOtGR0QqK
 7Fx6+qqJ6szMyjQtHjWAJEyF7k9kvVuf4doclnDFN26j6i++k6EwLAN9y6d9gK2UFA
 EtcvJwOz932VQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Fangrui Song <maskray@google.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Subject: [PATCH AUTOSEL 4.19 10/18] scripts/recordmcount.pl: Fix RISC-V regex
 for clang
Date: Wed, 12 May 2021 14:04:41 -0400
Message-Id: <20210512180450.665586-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180450.665586-1-sashal@kernel.org>
References: <20210512180450.665586-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_110508_768831_2520CD2B 
X-CRM114-Status: UNSURE (   7.98  )
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
index 9a8fe8ea6b03..bc12e12e4b3a 100755
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
