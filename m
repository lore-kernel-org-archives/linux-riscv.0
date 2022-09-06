Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96039C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwNZwqWdRPORnOtmUJTlWo1AeDsZ3LTXaitGs9ybRcE=; b=TrE3pgFD5ZImYc
	jKeSJuHeyasHEumO024q9huhs3vaHyfKffH858BE8GEStrTz0MzjEbCj6BTMFuIC92hOav0VTJGyQ
	PWE6SXOghZe9ohHJ3zeA4UCLVa9u0IlxAZaCSD/zS5diSVzUILl8wA7BR9bFRLruTNL7WwzoQPPhm
	d+735gdLUZ1Vlyw/PskCIfBstb5P34ui4iGAuXvawADcHxj+xI/aW/FSyinDpJfsIB8MJ7HxLynSi
	ZfsuMG9R9KJ+xmxX/D1RClsVxBlZEIYoSM+D4xRIdBWG8k2qiDqGzPuP5AHkzJMb1qZ8hUn+Pppla
	LcJEi3Bqyq3ICB3lYiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU1r-00BIH2-1o; Tue, 06 Sep 2022 08:33:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU1g-00BIEM-Jc
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 08:33:47 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oVU1d-0004zd-C0; Tue, 06 Sep 2022 10:33:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Nathan Chancellor <nathan@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] RISC-V: Clean up the Zicbom block size probing
Date: Tue, 06 Sep 2022 10:33:40 +0200
Message-ID: <3863172.zE8UqtGg2D@diego>
In-Reply-To: <20220906074509.928865-3-ajones@ventanamicro.com>
References: <20220906074509.928865-1-ajones@ventanamicro.com> <20220906074509.928865-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013346_045886_AECEA828 
X-CRM114-Status: GOOD (  14.61  )
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

Am Dienstag, 6. September 2022, 09:45:09 CEST schrieb Andrew Jones:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This fixes two issues: I truncated the warning's hart ID when porting to
> the 64-bit hart ID code, and the original code's warning handling could
> fire on an uninitialized hart ID.
> 
> The biggest change here is that riscv_cbom_block_size is no longer
> initialized, as IMO the default isn't sane: there's nothing in the ISA
> that mandates any specific cache block size, so falling back to one will
> just silently produce the wrong answer on some systems.  This also
> changes the probing order so the cache block size is known before
> enabling Zicbom support.
> 
> Fixes: 3aefb2ee5bdd ("riscv: implement Zicbom-based CMO instructions + the t-head variant")
> Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zicbom extension")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> [Rebased on Anup's move patch and applied Conor Dooley's and Heiko
>  Stuebner's changes.]
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Retested on Qemu (Zicbom) and D1 (T-Head errata)
Tested-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
