Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D039CA5FEC
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3OUs7R2zOnGMAOhK/2yiI5SvD6/JDmesFYE1xKO2EY=; b=yMLE1aUlE7sTi7
	TA+v5b/tp4+P6V+YWjn6QmRAhoW8LTTGa0xiXw5oGr0kWlLB+SSUCQYDm6rCiswu0LP/AMEMgBM/1
	+NOTfOxg4g/lT5OIUG1XkA5IJymR8w583V8MR9C1oKH4uKa0d6mD+V3VfKpCe3FGVhwllaPOBUru0
	Hm6CDSSbXWz5W45HxHxfWtdaB9OoNqrDumW/WkSLXXTGEbh1gsce07Vf6/2M+1Fk7Im6AF/dmo+3o
	iMowfm6rawAycQotJaqQkabB/oc58g0Zx5j/DcIQ9K3huVXN5aRmT2D4PRqqJKPvVkvMlJbDW6JPS
	bZkOVbE7uofpgAxtlpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1cK-0000000DgjW-49dJ;
	Sat, 03 Oct 2026 15:25:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1cC-0000000DgfT-33vI;
	Sat, 03 Oct 2026 15:25:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3E0E44843;
	Sat,  3 Oct 2026 15:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8F71F0089C;
	Sat,  3 Oct 2026 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041130;
	bh=q643Wt6fe0ntTTDTKOYlrl8Wj5XitvlnnZ6YOFvEOnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cDCh1URWwts0elrdZ20jLCn18/umO4ONLw1oxNhmmHlvCzhYp0Pm/trdDFICN1PPD
	 UcefMWA7kmVyHMwYWG+lFZdswmpHbkDmSdw4dXNEXosj7Lpbzf9Za1ajBgcLCRw/8v
	 WSD5BoLsDVWB+qGTEXu2Bg44C1J4YQUfoVPVitITBx9VWCVVfPNHfbnzzCxex1rV+u
	 MyzBF2kRhy9OgYo75V/sQyrKrG5DJmCNwCV17dPSbhYAHZGf63dbU0oC8rAiqMXtYa
	 KW7eugMboXNw4X7gLeqK9pKigM1Tf+oEIqODYsLK4++kHMy/0x09+whxbqIzRXQYYk
	 bR0+NNfswjUIw==
From: Vinod Koul <vkoul@kernel.org>
To: Bruno Banelli <bbanelli@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Yixun Lan <dlan@kernel.org>, 
 Ze Huang <huang.ze@linux.dev>, Alex Elder <elder@riscstar.com>, 
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260825065007.69353-1-bbanelli@gmail.com>
References: <20260825065007.69353-1-bbanelli@gmail.com>
Subject: Re: [PATCH v2 0/2] phy: spacemit: fix and enable the K1 USB 2.0
 PHY
Message-Id: <179104112791.223537.13672084423793291489.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 17:25:27 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
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


On Tue, 25 Aug 2026 08:50:05 +0200, Bruno Banelli wrote:
> v1 was a single patch adding "default ARCH_SPACEMIT" to
> PHY_SPACEMIT_K1_USB2.  Automated review pointed out two pre-existing
> Kconfig problems in the same entry, and that change makes them easier
> to hit: enabling the symbol by default means configurations that would
> previously have left it off will now build the driver.
> 
> So fix the dependencies first, then enable it by default.
> 
> [...]

Applied, thanks!

[1/2] phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
      commit: 882af55e42a4cd5bd61db0244c0b78941884518a
[2/2] phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT
      commit: 392101240b22256105da3b5af6348d1889c63112

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
