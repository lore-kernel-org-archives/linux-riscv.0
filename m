Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85A7E88D9F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9tvKhJ5VT0xv33rLYdZPOeQAbI9cqyt4uBDtVbBiS4=; b=no0Wr+2eXGKaLB
	v0Ek/kTvw2MuPCb6eyjfae/XwmrS4zZTb2x/XQiHdnIxf0ITih6AnObsnebojAoYuW9QhAL9JpHQ9
	Ml+RCewfrJOPimbZca1qrcfW1PSClHre4go5kGwMzbLnkFKS9loRBEuNiCe1BMMPlRhAiYXiQX8/L
	VH+uUIUdDkyIci1eIKwb8NzH0o2U7sbabC6EnPN0btwCWup84KJhc9FXDhUT3mYIWFXOUtCVd0LjN
	+zZquR6CK4eoTI5MTWhtUcWx/aci5SQdvfiKqzEE2Ku0pEmFGfl/IBVMKfwdJe0OJigQjvu1DPLFV
	37k80p+FuNFT/BRMVO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92lg-00000003YIv-3Ljg;
	Sat, 04 Apr 2026 15:18:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92lf-00000003YIp-2Avt
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 15:18:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A5CC60008;
	Sat,  4 Apr 2026 15:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3592C19421;
	Sat,  4 Apr 2026 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775315914;
	bh=sfics3gcx6ewjjKwTOJ2rCkuCBEKr9GefJzlW0cJEQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m34AcMyJ0jEtOTzP9OesH/iBIpXGqfXSA/nU28tl7SZvejC4IJTQxodPPy85sJM2K
	 5mkufD9/tjy81w+oPkSd19B+bTst5z/HuMblhTpsU3HNe5O2ri3d2o835npA7iv56V
	 LlRqy4KUcuxhunxaV2kB1FHvfKPiV1BX2NM4Rtf1BHCT3rnjASMxIzEr6fP8ZdDblS
	 XQC0XA8lgBY3QpLBZFRYox5yW4xbf54uaK80waqlB3gSRw40junHAm3YaYqMaP2NIF
	 OqF1ULpuGhSgV/zZZZYLwcDk8I02zgVjvqMZbit3kwoD6ixOx+Kby/t/G66xN5Yxo1
	 YNZ7GdOdttt+Q==
Date: Sat, 4 Apr 2026 17:18:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>, linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v7.1
Message-ID: <20260404-humongous-mayfly-of-fortitude-5f087f@quoll>
References: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM>
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

On Thu, Apr 02, 2026 at 10:39:51AM +0800, Chen Wang wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> BTW: I'm still waiting for my key to be added into the pgpkeys.git and
> hoping this will not block my PR.
> 
> Thanks,
> 
> Chen
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v7.1
> 
> for you to fetch changes up to 7b159ed9c81cf7e0d0b75666e6548ceface2e1b5:
> 
>   riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
> number for DMA controller (2026-02-26 06:12:22 +0800)
> 
> ----------------------------------------------------------------
> RISC-V Devicetrees for v7.1
> 
> Sophgo:
> 
> For CV18xx serials:
> Just a minor patch to replace the compatible for
> dma-controller to allow setting DMA channel number.
> New bindings and driver part change are picked by
> DMA subsytem and this patch handles the left dts
> part change.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> 
> ----------------------------------------------------------------
> Inochi Amaoto (1):
>       riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
> number for DMA controller

Commit has messed DCO chain. I suggest using b4 to handle patches.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
