Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E31ECA1005
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/Imaay0Kg4rq40BxsHCPDw6chr8EUSwCQhsOjVYThg=; b=Zbo2WXR5D5fWET
	xkgH3AqWHTkU8Ql1UN30ssOKNahJpyc4i0Him520bTTZZNExMJm+RMnd9GkHFKzKbgPw2YuqruLMw
	Vsfjy0HqVV5dvGxJ9fLaUkAiCZ5jnSyeuS49v3CF0X4FNQUPsaFhkjQ4oJNzfLKH/b9XW9EQzqmjP
	YT8CUdU6EBaPl//UVdVNTxP0Lik8vXPI4N8YK+MvZI1EHDmlx6mQ8VrXVCPLgAsprw0TsMJixe9Co
	lMm0kdB2AJUaT8dzrPG3WfeYZlvrNs2IMrF1Sr9SKO+LS1B3CLhOYHXFL1zbEgBTj9EA+67tKpLY+
	SvopFlXTWrjhfyN5YDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRFZ-000000006gg-2wcq;
	Tue, 02 Sep 2025 13:40:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNeS-0000000GTxv-0WNO
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 09:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3F854081D;
	Tue,  2 Sep 2025 09:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BF3C4CEED;
	Tue,  2 Sep 2025 09:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806607;
	bh=qbKcoCnyI7prTmn2e4S8kHQTAUMV3OUtBdKQxOT3nYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k8ruingwTTYBUbt3by1J5OOjSTZhVyaU4tHBF1Gae/gFogtsNgm7byLyGgEC0Cf3+
	 YFEk2g1u5b1Dq8k9IDTnIqxFfK5CCIjI/VrzYo1fecM1TBbIzymPyFhXA0SEU89zLm
	 /8GUNmG4+Nb49r54jESMtZOVpEd51ohtY7QOymGGw8lCV1cg7gvV9msFEWIewr5v1A
	 B6tuadsViNb8LilGhWGieHQZxpGQbmXCeBwsCoZCu0xrI6GuQdNPMABZwguJ9FpJlT
	 J5Gq+NoaS0ySwrx7Gz7VIyBrwhPtbY1pjEhGl8TsAXw3zKRHcBgKKVNCiJ4stXYU9L
	 Itdw4kkU2+hIA==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz, 
 Guodong Xu <guodong@riscstar.com>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
Subject: Re: (subset) [PATCH v5 0/8] dmaengine: mmp_pdma: Add SpacemiT K1
 SoC support with 64-bit addressing
Message-Id: <175680660058.246694.5045747556533020350.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 15:20:00 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_025008_196879_D490BDA4 
X-CRM114-Status: UNSURE (   8.64  )
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


On Fri, 22 Aug 2025 11:06:26 +0800, Guodong Xu wrote:
> This patchset adds support for SpacemiT K1 PDMA controller to the existing
> mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
> but extends it with 64-bit addressing capabilities through LPAE (Long
> Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
> DSADRH and DTADRH).
> 
> In v5, two smatch warnings reported by kernel test bot and Dan Carpenter were
> fixed.
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
      commit: 39ce725e621b256188550492b4b53fb02bfc872e
[2/8] dmaengine: mmp_pdma: Add clock support
      commit: e73a9a13c99c5a55abfdb8c273651509be1eb5bb
[3/8] dmaengine: mmp_pdma: Add reset controller support
      commit: fc72462bc6107b8babda05cad5bf8f7daf8bec20
[4/8] dmaengine: mmp_pdma: Add operations structure for controller abstraction
      commit: 35e40bf761fcb24b1355d6a8d48b5b10683fe1a3
[5/8] dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
      commit: 5cfe585d8624f7482505183dd0e4c534b061e822

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
