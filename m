Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EDDD58B0C
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Mar 2026 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwNGwaauHL5WT7F+hqgtWLYdsoC6fvR2Z4t1rr+7yXs=; b=LNAk2o6E31kunR
	ugH0tzgJJmMbiPFasWLzhnA+HYbeuInUoxB6MEAkD2h1JpVgrWNMKALLefnJHoTZ6SNYbdTgfehnk
	MtN6pgslv9LkT+YQQ51/osAQj2A28nVh/p4Amxr1jkga3tt8aTGzAANUxAxDfQPe8SzXlzddrQ6r9
	cxWKBST5cY7zCrLnFuo2dFefLuw+HMAJOrUiVwTDkFbOaKYI6YhJGuv9dA7CJ9FPSGvR+ow/knTVU
	OpChUyMwNc8kbUetRKGeKKQPu2t18XNpjgLbJiSk8Fk9S2aA+KUgkm1I3QX/YfgtuVIb2XXV892eG
	XuyuHVwHF+r77DNVQFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1hEY-00000002UqV-01Ob;
	Sun, 15 Mar 2026 08:54:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1hEW-00000002UqP-213P
	for linux-riscv@lists.infradead.org;
	Sun, 15 Mar 2026 08:54:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3934A60018;
	Sun, 15 Mar 2026 08:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602DAC4CEF7;
	Sun, 15 Mar 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773564838;
	bh=m1VKwca+Qai2oamEOxJQFznJO8zSAU7WZ7lAcZjYyfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0Ej9BY6M1dQmilvRz8Owg1JeWPIjTIAlpcdfULClEMxBVvirPLVil2DPYD+2G7Pf
	 IMTiLzGXjw9CatYHPtsi/KRonhONUC0LdSLmZfclpX2crUQE4nr1uDymC98J4WpC/6
	 3mYxem3mFJRC+FuB8eU8TsDaRaqi8zF4TWRmBugwfIv5D4dDgYXNwiSdJozP5pzcIl
	 UYWMzJpafTgzi0hpeWGkvN7DMFlrYJ4rEcB2rkOhTOoyvCPC3UmwPBXOttqF3mAGPF
	 fiLxczL7+qwIbtZ3AseClYiyxWdx4Dh0Zku/sklpHKRlugNkDm5gflOfEfqQVxvQg9
	 EpCRwhjF9x+Ng==
Date: Sun, 15 Mar 2026 09:53:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Junzhong Pan <junzhong.pan@spacemit.com>, Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260315-crystal-ambrosial-hamster-4b970c@quoll>
References: <20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org>
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

On Sat, Mar 14, 2026 at 08:27:25AM +0000, Yixun Lan wrote:
> Instead of grouping several different reset lines into one composite
> reset, decouple them to individual ones which make it more aligned
> with underlying hardware. And for DWC USB driver, it will match well
> with the number of the reset property in the DT bindings.
> 
> The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> Also three reset lines each for UCIE and RCPU block.
> 
> As an agreement with maintainer, the reset IDs has been rearranged as
> contiguous number and pushed as a fix for the driver, and reason is that
> there isn't any consumer of reset driver so far, so should not cause
> any ABI breakage. Also, the changes of DT binding header file and reset
> driver are merged together as one single commit to avoid git-bisect
> breakage.
> 
> Fixes: 938ce3b16582 ("reset: spacemit: Add SpacemiT K3 reset driver)

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Fixes: 216e0a5e98e5 ("dt-bindings: soc: spacemit: Add K3 reset support and IDs")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Previously, the reset of The USB and PCIe was submited as a composite
> reset, try to decouple them in this series.
> 
> The motivation behind is that it will will make the result more aligned
> with the hardware which describe them as different reset lines, and also
> match with the K3 dwc3 DT binding which request different reset, 
> K1 and K3 SoC share same topology of the reset line design.
> 
> See the reset part info in binding doc
> Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
> 
> In V2, I've visited through whole reset driver and decouple more resets,
> which include the block - UCIE and RPCU. Also add an explanation of why
> rearrange the reset IDs as contiguous number.
> ---
> Changes in v2:
> - squash the two patches to avoid git-biset breakage

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
