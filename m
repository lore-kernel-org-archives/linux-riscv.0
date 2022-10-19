Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70093C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0b8t1ILi26ZprqvFIWoy02q48v8hKaQhc0wSucCS5k=; b=CYzNP4obb0TyUi
	OsGGIgpHaXlKfObA1/ckvoxh4XWljs7tqsyGXSNFXKr4NVxDgIkHmN05cTHb1wNhWUE7yaATw8/IQ
	kBb56MvxSySnxmDgiK0elfpxaEdWfmbwkRK5tCxm4vyBho85+HGLzCc5Cs9WpCSK2W0tocDwIQ5ax
	Hpkloabm+OBAehiQ/5gSR5hAg/MQiBmV1XhrzS+nPLgpl3EB4UmkhPe07SdKOPS9AFCXhVm+kzZYx
	4vLUqwlhJwJYSsT8mkGzGWVgNDx87IyLMr9GDfmb28gIEB67T7biVfy5FzQFB2VlX+CsljDfvu2SZ
	BpSUOcW6Xo+gRukjEGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9XZ-002MwG-R3; Wed, 19 Oct 2022 13:55:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9XW-002Mqb-Hi
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 13:55:23 +0000
Received: from p508fdae2.dip0.t-ipconnect.de ([80.143.218.226] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ol9XL-00069g-MB; Wed, 19 Oct 2022 15:55:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, kernel test robot <lkp@intel.com>, Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/4] RISC-V: Fix compilation without RISCV_ISA_ZICBOM
Date: Wed, 19 Oct 2022 15:55:10 +0200
Message-ID: <2257562.ElGaqSPkdT@phil>
In-Reply-To: <20221019131128.237026-2-apatel@ventanamicro.com>
References: <20221019131128.237026-1-apatel@ventanamicro.com> <20221019131128.237026-2-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_065522_626337_C3B02C84 
X-CRM114-Status: GOOD (  12.10  )
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

Am Mittwoch, 19. Oktober 2022, 15:11:25 CEST schrieb Anup Patel:
> From: Andrew Jones <ajones@ventanamicro.com>
> 
> riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> be available and riscv_init_cbom_blocksize() should always be
> invoked, even when compiling without RISCV_ISA_ZICBOM enabled. This
> is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> instructions in the kernel" not "pretend there isn't zicbom, even
> when there is". When zicbom is available, whether the kernel enables
> its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
> Ensure we can build KVM and that the block size is initialized even
> when compiling without RISCV_ISA_ZICBOM.
> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

[on qemu+zicbom and t-head d1]
Tested-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
