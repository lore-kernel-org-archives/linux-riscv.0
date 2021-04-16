Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1A1C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 17:08:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF566109F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 17:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF566109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFFBesqgT0JJ9oAf51lPWS73N5J24CxsusZbP5Fw6/M=; b=LNBySMg2iYOnOrHoMyxsFPuZkC
	TtDmJBBCUlDNJxvx/sku0GcM3D534TonzS0bhWiU8VHBxw0Hhn1oa1iSGHoidWWse2dj9ZR2KniT2
	vmpw43NeivOXjplZEeaCMBi4rCfvIg+x0ltPozI7BM6VH+vbD2/P1C1tEp4+4m+m09GKEA2SMo//r
	iwahwmPyxsDxR4ydn+AVZtvbeSRBagMVp3PfYr0123uzRP2Ls/Kz2IykMk7gNXMt/d2Ar4KpXGXZB
	ibDn+bsZBI/u4nQlKOqynGunz9YM+U6aYY0HvO+Qyv4f/LTXaK3YjNrZTGajJDTaabLQvAaFqr8fq
	N8Sr+n/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRwu-002tu2-0v; Fri, 16 Apr 2021 17:08:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRwr-002ttu-52
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 17:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Cc:To:Date:Message-Id:References:
 In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=/Z5HVSOOYOaUaY3pQ0TQ0mO1kL5WkR2kTMMUck+bUjw=; b=PulXojxLbMYRu5kxXTyyl8V6k2
 Bc9tReOY+qyNR7ktT2o+HDIh29XDWGyUuRDmB5EsB+0tqwJDTgbYi4M6qcTBrtYpnsCInXjemCYWa
 Eu4C2Klkwt5QmM4wudv/lAvnEk8kTxszYxVcNHnODhz+aEKtx5584K/U9FcxZoUch04W7BsAfd8NU
 3XoFq/J1LwXmR0DcdYm52hCxyFRss5vRMp1PKBgbc5cRD6FHv0MEjM/bbSFKXfDu3L6/y8WV1Szsu
 A0kPjsOnUGHoP+BMQKEFsCE+jBUAWkCwbKS6wChw6jIGXO7OQSBASISzbY7l4s+gBuIthQ3t10gEE
 WMVfLjSQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRwo-009a6T-HS
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 17:08:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1FC516109F;
 Fri, 16 Apr 2021 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618592882;
 bh=yU2yD2hb7AoULWvQr+2/jUs6bcPJdw2gUXHVD9sbjvw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=YVCGKHLA2/tbN0G2GguCtD/RWJXVBr66zHIbMYAlBiSjdkBfh99KnL+jUFWJmrNGF
 Bd5n+cTmEvX3ACNnqUY2tnEPE1+MSKXDkdQTXYDYjZ2hXL+RLmoexyvHsVCXL/8m2s
 rI+REJqBp8anBSzTdcU8EkJuNYSzdmgQv5RIOVFn1V+XfB8f7KcrsAuHpKmrOXJIgO
 Gout30y0tH0QcPdCX6qO9FRmqnPuVWuhRri3aY5fX0XrRHSkB20D2CZ/dTx2tqXInM
 U1KmW+rANlowGiwdO90LCjNRlGXN1WJQc2E54RvFa8pgR4k7OqXO+GktY0R5wwK3Vd
 PDjGm6U/1lfqA==
Subject: Re: [GIT PULL] RISC-V Fixes for 5.12-rc8 (or 5.12)
From: pr-tracker-bot@kernel.org
In-Reply-To: <mhng-769b7cf7-7dfb-455a-9bb3-99f5cd952dbe@palmerdabbelt-glaptop>
References: <mhng-769b7cf7-7dfb-455a-9bb3-99f5cd952dbe@palmerdabbelt-glaptop>
X-PR-Tracked-List-Id: <linux-riscv.lists.infradead.org>
X-PR-Tracked-Message-Id: <mhng-769b7cf7-7dfb-455a-9bb3-99f5cd952dbe@palmerdabbelt-glaptop>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 tags/riscv-for-linus-5.12-rc8
X-PR-Tracked-Commit-Id: 7ae11635ec90072083503c6b6485cdffe46203b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 151501160401e2dc669ea7dac2c599b53f220c33
Message-Id: <161859288198.9941.13644971507967591628.pr-tracker-bot@kernel.org>
Date: Fri, 16 Apr 2021 17:08:01 +0000
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_100802_619491_66DCABDD 
X-CRM114-Status: UNSURE (   2.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 16 Apr 2021 09:57:52 -0700 (PDT):

> git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.12-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/151501160401e2dc669ea7dac2c599b53f220c33

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
