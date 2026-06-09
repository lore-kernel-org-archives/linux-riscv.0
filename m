Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033CECD8CA8
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etTTt2qFosu3QV4vi3qsJOwqzyGnIN+sUSVSvDwf/38=; b=B5T3GkxEPIz1zm
	7WxqCsuFmlLHRAx6PUq0dAcob5FTolZxBn1g/82Hpb0EJsxFC6R1E2NIWT4GbAG+KdMttI+4xv/Tb
	rU04zeOSnCk576l2dAa/lZ7tn41m36hmPXcxWxZwapHPUsbE1k3qXIcWdQX4Omt8W2cq9vbfmE6VV
	dksBrUMPowu3x2VdhCsiUaz+9CqTgZQjU+3pWSG37WaVG3fCrWndwcDFHd20bfvMSkXeBTwNmrTPd
	vgyieLp3qzAUTYeHm1ZjKUXQ5K9ErQX2ps02jKRhRGiagLCr2MNEga+aS64EVdowXV7IdvEo3HpRd
	Nf530Kun7v5krZLp4/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuuh-00000005SxE-0bXk;
	Tue, 09 Jun 2026 11:46:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWuuf-00000005Sx7-1ob4
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 11:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A449A4156D;
	Tue,  9 Jun 2026 11:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B77E1F00893;
	Tue,  9 Jun 2026 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781005592;
	bh=VlXt+ZybZsncmnBJW1Bj+bdrQxweMBWKapap64spOHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U/ZwcKmwj6er9JEd1XP1dPWNkQqOrp1JehNoKh9PeyThlOmnYXM/ipNLFObu8tNxW
	 +ZMvLumVFQMPYC8OnYGeRpF2UORVB85Sd9IS8kRLh+uWStah6cX77ZmJyKjU1qouBz
	 Bobt+DO/W+eiRHniiFEF83SCKY5kGbd2pEf5QTxleT2zDoDEk+q7XYaTP3lRUcGSb5
	 e6AbpSa3vwmvqUkkQMSIHcJCbVHwDjDwZHhu9fY2bKf9NAkIOgonn0hoi0/joczgWr
	 fdSPqjrdtZ3ytEp8Qk0fGg+y2Qsm3W43j3q07Ma19J0GO5jfjabY3vvsZHkYWUMeTP
	 yWYPEAlfvAnpQ==
Date: Tue, 9 Jun 2026 13:46:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, Joel Stanley <joel@jms.id.au>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Nicholas Piggin <npiggin@oss.tenstorrent.com>, 
	Michael Neuling <mikey@neuling.org>, Michael Ellerman <mpe@kernel.org>, 
	Andy Gross <agross@kernel.org>, Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
	Paul Walmsley <pjw@kernel.org>, Drew Fustini <dfustini@oss.tenstorrent.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [GIT PULL] RISC-V Tenstorrent devicetree changes for v7.2
Message-ID: <20260609-wise-fragrant-sturgeon-4e5eda@quoll>
References: <ah4Qfro/wUyhByF8@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ah4Qfro/wUyhByF8@x1>
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

On Mon, Jun 01, 2026 at 04:06:38PM -0700, Drew Fustini wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-dt-for-v7.2
> 
> for you to fetch changes up to 33583baeb1ba7d328e6a9775d889036900b74cdb:
> 
>   dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU (2026-05-23 17:14:35 -0700)
> 

Thanks, applied

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
