Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20F4D1CDA1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 05:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jo7nISePkZjn25zr1jJaI/tWj4FgWbq2w7yO2pip2pQ=; b=djQWgWulrSh4Xp
	4ZXv/cw0YDc58unaQYzk+p+WVs47oJqg10GkR/g5ieVeBFWyhv5YbolUp89gri+aU11aNr2B2qT1Y
	NHaJ1mCpt1SlTeBhuBrGq3aVI3jb/IYOQNcxN4Dwdvk6Y5Yb4mY8FBj7i/mWBOTp20bQiKtIHD3cQ
	FsT+MSJkuLl1hxfFuyoyzr1QAa+kj/qLd0HVKmHA+eUjq7AgfSuV9KbuariaqFE396EGnNLWzLMBT
	77CtUnjKWn+R5+nILDiU1rxSi9Va1e/PtN6WaPOefk3Jn2AJJ+730Mla0ePAGF33SBG7q3rBrjXx0
	9IoZCl80ZLsQx8iW3AOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t37cv-00000009geb-2WOY;
	Tue, 22 Oct 2024 05:40:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t37Vy-00000009fEq-3sIV
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 05:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C12705C5C84;
	Tue, 22 Oct 2024 05:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC07C4CEE3;
	Tue, 22 Oct 2024 05:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575186;
	bh=OGjE7z8270kFkT+BFh0bk+lfdoL/wYa3CaIpToQVdTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=h5nAFpJNlsgYm9SGunxtrpuV2DjqNgHLFUlFAkQX0Ar1xW3UTsMN8drXXsDfwLeU3
	 eixPm9wwRVzZptDxLKnoCl4lqJK+bG5DHrwwvKgAI3qqkx7/I+oQyR/iU3KGX3RfFn
	 aOl2k0s5K6EKKH3i0zC5xMsURhDqUSfsu1q4wNhffxLi4UqoJc6U+ul3C47y00srl0
	 P4qqzgIxY9u900ZST87lLHkVgxfE7fIr90VhyKUZ8+eIeW+eTBRj42vgfsmrDYYksO
	 uDIzG0KDYG6vatzTOcw6BvTfFBGDhvBT7npEgj+Qgzyra84yfatqG/rDBQZkz+lk+X
	 4oh6ut5OpX5gg==
From: Vinod Koul <vkoul@kernel.org>
To: Linux4Microchip@microchip.com, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 pierre-henry.moussay@microchip.com
Cc: linux-riscv@lists.infradead.org
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
Subject: Re: (subset) [linux][PATCH v2 00/20] Add support for Microchip
 PIC64GX Curiosity Kit
Message-Id: <172957518401.489113.6623824391719205197.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:03:04 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_223307_047263_1C6E0488 
X-CRM114-Status: UNSURE (   5.15  )
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


On Mon, 30 Sep 2024 10:54:29 +0100, pierre-henry.moussay@microchip.com wrote:
> Changes since v1:
> - Limit sdhci to HS (High Speed, 50MHz at 3.3V) mode max
> - Fix I2C dt-bindings, remove microchip,mpfs-i2c fallback
> - remove duplicated pic64gx-clock.h
> - Update Microchip dts Makefile
> - Update PIC64GX dts and dtsi (fix model, sort node)
> - Remove microchip,pic64gx-clock.h present in previous patchset
> - Reword commits messages
> 
> [...]

Applied, thanks!

[09/20] dt-bindings: dma: sifive pdma: Add PIC64GX to compatibles
        commit: 7655ec4d0de0a822364ecdeec239a2562fa9d96f

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
