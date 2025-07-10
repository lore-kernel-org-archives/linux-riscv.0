Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF85C83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 10:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BMo66J323ruRcKzXx+RLf2/seZ5qVggO52G9WNA/Msk=; b=NGu2mLN11xPqzd
	tierrlQweqW9CwP+ebm0rTaehndNBOXPVAPjhV6ZfKwaN5qQxZ7Ms3V9+5t9OaJAvBFRiYpoFCGzf
	nNBYypNe8UrMXlptXZKEJfAL1i1Nk5x1I+nQ2IW+7oF9W+lKd8AB5KveyTzepORr/XoSWegj2B0jC
	1Cb5KpM+kBCcPeSNblG+S8KwULehNVrUJVZyxkg+ZM0QojM9rTZPDUpHP9MP4OOyGOjjDj1Ng2sBB
	pI4wvgM2egSH3bBidylsDGfe1QqturjdAX2mdPpwcWEZemTgSo3/3HoBkjXmnSudkVDYXCEcWWaGI
	gDtm72iJVGujtttYSskg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZonx-0000000BWYK-0tVQ;
	Thu, 10 Jul 2025 10:47:05 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnTX-0000000BKRR-2Do3
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 09:21:57 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2E8FF20A48;
	Thu, 10 Jul 2025 11:21:51 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LPJcxE4Y_BvH; Thu, 10 Jul 2025 11:21:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752139310; bh=uBESpV6VYmtMf5c0jfO84+kgeOgfAvmMmBPnGttkCe8=;
	h=From:To:Cc:Subject:Date;
	b=cjcv1tv623srhANAPtOsUskYP/Y7EolbRFoS7GkiKFnEgzTCR+WIpuHeei/xmQMUK
	 5/GP4XWiuCt/7cF7xasp8Lr2QM+9+gWhKmwOE6ZH5T/P92A541JMSkk+ThNb6LDCZs
	 Q8bac9sasMULCQnalWf8u7ZMhBWT7kLqBCptYp5WJudHxSwjr3viuHh4uuwTwQyBcZ
	 m92m382TfUt5CBnsPJi99jaFzfXtmhdokC7qLXMZpXpxibnE7ghrUTjPq9mbCeifXW
	 C9D+TwvY//m63g56GEig6Tya0LnqNORknzdR8HKVvm0qnPShK5ntxKUIJP/DUFxB6C
	 6xw13hUBYeeUA==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 0/2] Fix orphan clocks in clk-th1520-ap driver
Date: Thu, 10 Jul 2025 09:21:33 +0000
Message-ID: <20250710092135.61049-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022155_973562_D8BD9624 
X-CRM114-Status: UNSURE (   7.67  )
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

clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
booting the kernel with mainline U-Boot,

        $ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
        [
          "c910",
          "osc_12m"
        ]

where the correct parents should be c910-i0 for c910, and osc_24m for
osc_12m.

Note that the c910's case cannot be reproduced with vendor U-Boot,
which always reparents c910 to its second parent, cpu-pll1. Another way
to confirm the bug is to examine
/sys/kernel/debug/clk/c910/clk_possible_parents, which obviously doesn't
match c910's definition.

This series corrects the parent description of these two clocks to
eliminate the orphans.

Changed from v1
- Split the two fixes into separate patches
- Add a static qualifier for the new definition of osc_12m
- Link to v1: https://lore.kernel.org/all/20250705052028.24611-1-ziyao@disroot.org/

Thanks for your time and review.

Yao Zi (2):
  clk: thead: th1520-ap: Correctly refer the parent of osc_12m
  clk: thead: th1520-ap: Correctly refer the parent of c910-i0

 drivers/clk/thead/clk-th1520-ap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
