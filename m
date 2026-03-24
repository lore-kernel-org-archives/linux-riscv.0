Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92530F532E6
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 06:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79I9gqT5KIFkNh4xJEzvie5aVsf/9/hPv+mO5p+EBZs=; b=13xa3bV0UxP6tL
	Id2VeuC6Dm6936uo6EBe0S/iIKkezrLcF0R57DrGaLgIoeXxlIgRI4ps3yE5/0KHa8EHeOUcLDaJn
	c+34u+HuMmBkssYTEmN9rYj9iXasL+88p746gLsNa29kuN5SPzAIv2g9igwdDpA+It82Ayx86I9y1
	IwUoFNpiXwKfFBp89m85EyWPv7EE9DwvJYlQ1KAgosAQVj0iOZHuHzNDsJf4EWYGh50t8Jj1KANNr
	Zkr7eoc78xQiOmx/fr21pjgbmWdev/OPKP9azAfntkjhRQcW0vwHN0ZYjoLGbWDsI4fSQp8li5SET
	RRamWB2FxXKit7H2tw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vWY-00000000pdt-2FTk;
	Tue, 24 Mar 2026 06:45:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vWT-00000000paq-2FhK
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 06:45:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF5D040247;
	Tue, 24 Mar 2026 06:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90481C2BC9E;
	Tue, 24 Mar 2026 06:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774334752;
	bh=nQSem+Qa3va54hpcGSLu2gvFmVM0Xt6MgljRrmslJ3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=roYKMvggSyOEL70JurnNN864sl1cuSmTR0YBbOycah9QlYqV/hyQ8V+fKmyz4piNf
	 ZdgqPH7QiFEfb9gHxjrVQrW+LObU8EfzzhwWo40Zz+Vy6IBlSo/zufAU5oacRn2sa2
	 py+3XAk3RGnJCQ38e8FQnXWJB7+6We/cfISCuHdTJNIWbv2zSlyo8EcrpCdae1Ae5f
	 lVkoD6CHqSadWO0gEEM4Yuh2a2VrbKnU2P1tMecx7YzAxAA/FshCeqIF40AKKcSJjb
	 OpyuV2409Gf6Wd80oHRQycQRQaBwi3lUT9DQJBuP/jGIoS1ARBNc8VXZUMISSG3qlW
	 3Pqu5TW5R6Y0A==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Haylen Chu <heylenay@4d2.org>,
	Shuwei Wu <shuwei.wu@mailbox.org>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()
Date: Tue, 24 Mar 2026 06:45:38 +0000
Message-ID: <177433463997.242902.739790871603648740.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
References: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_234553_616074_BE6C4159 
X-CRM114-Status: UNSURE (   4.50  )
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


On Thu, 05 Mar 2026 20:46:08 +0800, Shuwei Wu wrote:
> Fix inverted condition that skips frequency change trigger,
> causing kernel panics during cpufreq scaling.
> 
> 

Applied, thanks! Will send to clk maintainer as v7.0 fix

[1/1] clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()
      https://github.com/spacemit-com/linux/commit/54e97360b44bed6b4399dd3be3d65f392df940fa

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
