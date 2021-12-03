Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064DAC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lYjMdLXwMHhb0xqAVJXTSeDX0j10MY0GhyxtZ09sDTk=; b=v4YKWM0fY8wpa8
	Cs/UiJURG/RFuV2Ww0STaybAQpz09sQDTnrI5VqRGlMbWAGlSw3DQi8hv7OJRvT4CEMQ/Sjj2SeX+
	WdAooksUxuVnlIJnqIy3VkfpBwkbdFYbt/xmXpny2ePa4yVK49pgfLxHIHTb8gxMPMBwOe3L4Foys
	r7HMwh0NSgjMkbZRZ8XzeA9jLO5MO9yGqD4Icf1OE50E4xFDlWQxiSevgkUi/K07XKijyxrDSdq9o
	CIlBXUtz2SJydiq1lpWiQzXk6oXVL7Ok2ti36Kdu7TmWYUqA7TsKCMiAq5oHBxiT1rw3xqBjNeSCk
	6n/Vg/MVLutCfVg6gXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0qA-00EKWS-AB; Fri, 03 Dec 2021 05:10:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0q8-00EKVb-CO
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 05:10:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DEF69B825B7;
 Fri,  3 Dec 2021 05:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB5FC53FC7;
 Fri,  3 Dec 2021 05:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508229;
 bh=jLlTWUTQ9GYidPvwONo4OapaRUlzHVk8UiPiCkgeH7w=;
 h=From:To:Cc:Subject:Date:From;
 b=iVeLqwb14QL9XacqB6MxMmaCmEBZWFdCfeO2VivuEZthVhgZnl7CfwaJW4t72D6EU
 MpKil8OMJ2feo5iFxATHzPsqdu5KzROu0ic9p3PiToMkNm+OlPDS8sDQHhsnNbYLqJ
 VjsQrzoOVjK6fM38lY97huPNXf8ujoP+R0qMxekfIWW2T01HVfDKmGW/RcTnKee7eY
 3q+VFCCQ/loUT8V18ByRswqb4sXSygGsBDG+DZ3JsQECORX2q87d7PGfFgDC9JWY5c
 uDV4KunmN3hDnDbYFWbCcV/ZxJR2iipNsTlrm/Z6/NgcVZun0wClh9K8bIxvlcha2e
 DTpCq99mTCGyQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] riscv: mm: init clean up #ifdefs
Date: Fri,  3 Dec 2021 13:03:12 +0800
Message-Id: <20211203050317.2102-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211032_610995_054A50B2 
X-CRM114-Status: UNSURE (   8.70  )
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

To support NOMMU, XIP, the arch/riscv/mm/init.c becomes much complex
due to lots of #ifdefs, this not only impacts the code readability,
compile coverage, but may also bring bug. For example, I believe one
recently fixed bug[1] is caused by this issue when merging.

This series tries to clean up unnecessary #ifdefs as much as possible.
Further cleanups may need to refactor the XIP code as Alexandre's patch
does.

[1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/010607.html

Jisheng Zhang (5):
  riscv: mm: init: remove unnecessary "#ifdef CONFIG_CRASH_DUMP"
  riscv: mm: init: try IS_ENABLED(CONFIG_64BIT) instead of #ifdef
  riscv: mm: init: remove _pt_ops and use pt_ops directly
  riscv: mm: init: try IS_ENABLED(CONFIG_XIP_KERNEL) instead of #ifdef
  riscv: mm: init: try best to remove #ifdef CONFIG_XIP_KERNEL usage

 arch/riscv/mm/init.c | 71 +++++++++++++++++---------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
