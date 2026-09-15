Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F7EC88E72
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 01:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU8WT+pLwPu4QF3SMAjzH96MIT/w9pVByxiqSHUq55c=; b=4rgdJtFBfdeE6M
	G/ZHxZ8ozpuF3Eox+EuRHYCOHqjuTVVIBP0nIojjXl7GbfkFL0x5Shc86/25G3e4IEEWzpuQl3AZx
	sHGXQoFx8dW686LKHPk1M612JZqYLrPO1lSqzfL//vVRBjO9WEZqcX7ROR9OpJ9JNsAqbfyGgMWFj
	aOy3sxCW5fiT6DHrfkK/dFvikZoESFgMbLiIU39AdPmERrAv1vGxxhfX60KdhKuQJUkR1TwIoUQgt
	MyYPLetz75f/xxv32AP3Y+6mHyP1DxCmoeDns3v7wAjRYvG1hsAeuSt3tD5nO/RuGgRDQkGtMHeHg
	XsJ5vPxCwJuWuRb7NfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HZN-00000004w0g-2DkB;
	Tue, 15 Sep 2026 01:02:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HZM-00000004w0Y-0Q8s
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 01:02:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 862D9404C5;
	Tue, 15 Sep 2026 01:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DC761F000FF;
	Tue, 15 Sep 2026 01:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789434163;
	bh=6m2Vn4oZUUn29f+mAvG/SuewpQoePvWx0aBZ7BrrDh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZiSxcM2XpscYGx5F1oqvPR8ScoSZMyzPtT9JPlN7MN+l5nxGiXgH4c9PA/XUon1RI
	 +LWC9u7VH2wHvzY0TtJDeCq04o/u1mpSRF5ACE6Q3DUqssKQBBsaBIU/McO4T50r/b
	 HwDi8XUBGt6f3NAdHTA+Fakl1Hgtn7HqhfGO5O0Rjt8yGN3mY4os7AvKGg77sPsXpq
	 qApjuIxNJ/ZZOWCiUkA6HW9CMuwoU19LsO1xVInYaCUG+ryGfnTG+mps0UrIdoqzcD
	 zitfaB+NUsfq8JtP5IKi9gEfqy9ZRIQ8YfyWSX7tr8eMi+DlHc+zgH74hI8xtEO4CS
	 4vZaUbe0olfkw==
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
Date: Tue, 15 Sep 2026 01:02:38 +0000
Message-ID: <178943401819.3674983.18276114310523066796.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
References: <20260906-spacemit-add-reviewer-v1-1-b2ebba238ec5@linux.spacemit.com>
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


On Sun, 06 Sep 2026 21:29:08 +0800, Troy Mitchell wrote:
> Add myself as a reviewer to help review patches for SpacemiT RISC-V SoC
> support.

Applied, thanks!

[1/1] MAINTAINERS: Add Troy Mitchell as a SpacemiT SoC reviewer
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=3215a35fac45165506e86de212306c5d0e73eaf9

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
