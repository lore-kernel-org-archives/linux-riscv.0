Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16026CD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 04:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=As8ihHlZ4E/Z6tcH5y8/jGUECFKULVLs4icgZScY3Jc=; b=pwyq+38SIKw/sY
	I6tICDFg5SJ1Q2dztO5B/IUbDMWRdG61JXCn4f/w7eA2cDlzy2KkqG6E8fOauvD0DFs/+1a8jp1Bp
	BqeA+XJUmv9UEwma+NERhpTg4zq6XAk+jj1ocUE/8E+V3cPUNdV7TKNbwOEXAHnJLCfq8prbHpNdi
	H+foN6JvYFReECqWHzu3Qcq2M25W73PNMO6mD/O7n7ucaZnGvOJlMaizBsvQIx5rUETBWZubrbpJV
	bfGPAe+xNOdLBjaY3+L3uo9H3LSpEvpkHSs85dMSBCF8nTTQowHJ5fzAIoAKLvJ3oEL0RvSaTFOgh
	CmUPCQEn3bnty0vH7oBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIau-0000000CIYU-0ss9;
	Mon, 11 May 2026 04:50:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMIas-0000000CIYJ-28tL
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 04:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CE31600C3;
	Mon, 11 May 2026 04:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EA0C2BCB0;
	Mon, 11 May 2026 04:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778475013;
	bh=GnoZ5DrKFM2dwnC3dtM4eqBnszt3yJf8/fmsVTycPc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r9pbg98yWfAANY7vagM2dyoIedkjt3ZJqdb7g+oG4E6IvDYFsOZR2lxIZpz7ELFpU
	 hGur6lEl01QV8lKAusduQumqUY5iM/uhxZrF+dLMxt2N0yVtVhhzbVvBuxz3RnHYDe
	 y+EwknnyrrN6ZeI2AAXfRN9WsWkMqFhKXzZ55+QH9OFhsJMvLnZfkoAeie9Cxl6cSj
	 XL1M/Lmuu2AGw1BB52wOSDDuJDceO0iI7QX+9gF2JovvVD/gZRKt6kYd/fEQSV+I+j
	 7d+jgfVqWiNr94mbE/fIQNdjU3ro/1yZW3YyZtHZeNKH8wZWj1fX/GhtMN/VFP1Oib
	 9QXwpaw+iHnHg==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alex Elder <elder@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dts: riscv: spacemit: correct 32k clock frequency
Date: Mon, 11 May 2026 04:50:04 +0000
Message-ID: <177847498895.951618.10632308286447634075.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428-06-k3-clk-osc32k-v1-1-e2378da7cb9b@kernel.org>
References: <20260428-06-k3-clk-osc32k-v1-1-e2378da7cb9b@kernel.org>
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


On Tue, 28 Apr 2026 10:57:29 +0000, Yixun Lan wrote:
> The 32k oscillator's clock frequency is actually 32768Hz, so correct it.

Applied, thanks!

[1/1] dts: riscv: spacemit: correct 32k clock frequency
      https://github.com/spacemit-com/linux/commit/3c350f6284d8ea5e7a9648241b2e9604f2262d42

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
