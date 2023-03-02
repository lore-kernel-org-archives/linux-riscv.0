Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C61C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 17:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=49XUoXLU/DFM0ZqOF7uayGvU0rUetpCim5u0/u1cjtU=; b=Wigo2SDfRQu9kM
	E32mUpUH5/GSfyrSXUVsCcQJO6NfzArUgASK6ZZWNBcsDQMTad99BYAJWU4p6AQDPtWOxwzHEC84B
	6JLyMWwm4+zHsYkUPCKdGgA0AA3iayv/g/t6+8/WliQk7s8EYWoO56+e8y8seAvTK2BmreU9lcv4Z
	aYJLOhgBnC8aGGVAnQer1VzNg++eDOWdmMGg8C3L3Yf95S/jCReK+g110wOPa98QO7ALbu3NBEw31
	HZAfZt4TKEBRKoNwyuNsp0eMp/1/ZK4VujNn8yNUVA8HNxgJq1S9s8Nq0AY0EOFnGRxakA2P76oSI
	ubW1iVs4rUlUz2G+kX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXmwq-002zcd-AU; Thu, 02 Mar 2023 17:42:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXmwn-002zcH-Mb
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 17:42:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 100BC61607;
	Thu,  2 Mar 2023 17:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212BBC433EF;
	Thu,  2 Mar 2023 17:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677778948;
	bh=W6UdRqGjsOFqPGtz2aG7byZOq4AlM9omvEY+syM5I3w=;
	h=From:To:Cc:Subject:Date:From;
	b=NgHVp2nu2rqk3qcNthiN7TalT3qRAtgJcocYFGhvLiqiC4onlovhco3QCgHCpv+LT
	 lggXV97pNcDpnofNTy3tZN4GmUnOFz7DGdZsNFOH98lwDBoQSEJAHgJil2UOhWxSy6
	 dxCAF8HvdEgAD9cLg2NhkcWX2oe6ZqVkp6Ke9FPiTW+t7L2IYzi/x4s4lhz57QY8S2
	 tkcwoycVk0DrBXvj9C2h/D4gXIJ4jrijXfe+xUUiJbvoWcYajSqdoHetG0Pkp1SrZ8
	 p2Mp/EySVZJFTmWC9lAZSqF+yywVfh19T3oEBWElC+1mxT66XXXJd4ThQvsTCwcgOO
	 nxg/unn6UJnuA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com,
	Chris Hofstaedtler <zeha@debian.org>
Subject: [PATCH] RISC-V: fix taking the text_mutex twice during sifive errata patching
Date: Thu,  2 Mar 2023 17:41:55 +0000
Message-Id: <20230302174154.970746-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=conor.dooley@microchip.com; h=from:subject; bh=zlJrMgXv+u44HV7AnYQW58Fn+XV3hgOJqQf2AlgitY0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkM90/J7XG+ZhXkGs3lcyWLZYqmwD0B+90rtquWGc5ar z895PvZjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEwkzZThv0O9y7G2lyc4mF1N LWyW1rfsZRI9JccQfmzBEQsWs0Me+owMJ+ZrRArdzBC3nlfkVFyXE1Hev8PtStZh/pKv7MyFxtt YAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_094229_819728_4D3C7D9C 
X-CRM114-Status: GOOD (  11.83  )
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

Chris pointed out that some bonehead, *cough* me *cough*, added two
mutex_locks() to the SiFive errata patching. The second was meant to
have been a mutex_unlock().

Reported-by: Chris Hofstaedtler <zeha@debian.org>
Fixes: 9493e6f3ce02 ("RISC-V: take text_mutex during alternative patching")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Palmer, you want to take this one for PR#2, or is it too late?
---
 arch/riscv/errata/sifive/errata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index da55cb247e89..31d2ebea4286 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -111,7 +111,7 @@ void __init_or_module sifive_errata_patch_func(struct alt_entry *begin,
 			mutex_lock(&text_mutex);
 			patch_text_nosync(ALT_OLD_PTR(alt), ALT_ALT_PTR(alt),
 					  alt->alt_len);
-			mutex_lock(&text_mutex);
+			mutex_unlock(&text_mutex);
 			cpu_apply_errata |= tmp;
 		}
 	}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
