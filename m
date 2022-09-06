Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BF0ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 07:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NwD7YHAYyggXxR4R111VXAp+dC4XtG8jlXutgQGu6KA=; b=saF4ClFT+P/lrx
	RlKIA3Sez4tG6wXNG8vX4yeFLq905Zw6zrHOFK9DpKQis9h5XXbmFLSe6St/gn009RuUUkKUc4gik
	hhwuzeA98I59P/BzRBGM4lQHb9mcgUKlrOyYNhUribcWpvZoLkxEaQCiigjMBlyYOpnDeizMgPcCo
	BhLL4LeZSkIFI5GLp94rRDfLXBsQcFil4W2cUirDv4D2SFpVDIXpgajCs43XVrnbJpWKZxVJuMors
	N1PdXRjjSdx15DmzHtlTi+UgQARJLxnMr5l9udn6hM2utK4z/I3opYxFnRfe51PRMdwkuLayzEZcN
	ntKuUVM8Hbxq7ow7gn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTP4-00Axfe-Aw; Tue, 06 Sep 2022 07:53:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVTP1-00AxeK-VY
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 07:53:49 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oVTOy-0004p8-Td; Tue, 06 Sep 2022 09:53:44 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Nathan Chancellor <nathan@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 1/2] RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
Date: Tue, 06 Sep 2022 09:53:44 +0200
Message-ID: <2585421.BzM5BlMlMQ@diego>
In-Reply-To: <20220906074509.928865-2-ajones@ventanamicro.com>
References: <20220906074509.928865-1-ajones@ventanamicro.com> <20220906074509.928865-2-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_005348_083070_3BFEAB32 
X-CRM114-Status: UNSURE (   8.80  )
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

Am Dienstag, 6. September 2022, 09:45:08 CEST schrieb Andrew Jones:
> From: Anup Patel <apatel@ventanamicro.com>
> 
> The riscv_cbom_block_size parsing from DT belongs to cacheflush.c which
> is home for all cache maintenance related stuff so let us move the
> riscv_init_cbom_blocksize() and riscv_cbom_block_size to cacheflush.c.
> 
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

carried over from the original patch:

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
