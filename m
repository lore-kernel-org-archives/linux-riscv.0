Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBF7C87FCA
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bvqff1mysstLQzexGXiL4d7WBs+i7qlEyNnD2dfBOWA=; b=ZmY91OzS4NMfSv
	HGZ+5JzJqOqGpTqFe+eBGtFS4+iN99Fl5xsJfVcwNPoGEv+AP4VB+88rKEUZ80KgozAmCvIIyzLov
	V7jjfGexB+9zdP5V+awe7BJpeglZub63aA4L7Q6Dn92KbrSv2ROzrkofAL76ft1olNiAbyxYKKwC/
	8f85yNfVq03zwNtPT0yy5qtC2RNG0FkrcLWOA+qy11dRWHxCg6nP0LoGe6NbaaE2PGWmKtt8Yiqfu
	KxWOpcI/yUWdMFUE7jWKM0Gx/kGI+KRmqcGvNvzWHneSNfViLB8Kf2KL7FpWB8jFSQwIvv1YWD/oC
	6EqafOJSprzCeqBQHjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uibu1-00000008sCb-0h6M;
	Sun, 03 Aug 2025 16:49:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uibu0-00000008sCV-1lpS
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 16:49:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43688601D6;
	Sun,  3 Aug 2025 16:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696C9C4CEEB;
	Sun,  3 Aug 2025 16:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754239778;
	bh=ukGOvHSLxM6DOts4OpuXE4dv5VI5mr9YJi8g6MkF0F8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+k8/WMG4E+UOPnYVLvs4p9NCXzqsIT4GD3eHe3wEFBCjFJPfeUkxeFgUwSUEm+mO
	 KDlqeqVOfMSzaY4cTvPQ79TG8Ya5yHUFAwiZUp+SIRijb+oJEAokS9ca70iX3CXfeb
	 qyXuPP67Mo5zAOB4AgdtByEw9E2AfVVzEHzGryH0JAcW8K/xdPwAnJvGEq3M1hI8HW
	 cgyaP5eMt2RToJRQ6CSmvdviwj2A/Cs1KFqhxC/lkCRzui7dyNS68Z8OdhLrr0Sar8
	 TFr/xrsCD+3rbZpYuLATYAUuGa365gkJCy/F+wQ+hX9AmSOuuw4A5aaEywp/mVVqET
	 zvHnOH7tsztwg==
Date: Sun, 3 Aug 2025 11:49:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org, Haylen Chu <heylenay@4d2.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH RESEND v3 1/2] dt-bindings: clock: spacemit:
 CLK_SSPA_I2S_BCLK for SSPA
Message-ID: <175423977710.518524.17027664815968438984.robh@kernel.org>
References: <20250731-k1-clk-i2s-v3-0-2f655ddb0c6f@linux.spacemit.com>
 <20250731-k1-clk-i2s-v3-1-2f655ddb0c6f@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250731-k1-clk-i2s-v3-1-2f655ddb0c6f@linux.spacemit.com>
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


On Thu, 31 Jul 2025 22:14:06 +0800, Troy Mitchell wrote:
> In order to use the virtual clock SSPAx_I2S_BCLK in the device tree and
> register it in the driver, this patch introduces the macro definition.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  include/dt-bindings/clock/spacemit,k1-syscon.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
