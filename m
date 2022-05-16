Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8849EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eqzhV19L+x51Z/TqEG6XOsA/Jh1TeguCf5tnyHF79c=; b=uSewrScjfu8Xgq
	PwUjmGfsQH8VYNX8YEt7nqbwYJhXkT8gxc264IbCgWBJ2K5toDtp3XIHSMdjKH7+2kUahhbtOtxrV
	De6lbjCAxzshDdTp7mvI0l0G4t38zdiW7v4mxLpWtes1qmULxRJJ87sZxxslOAtKFOlnVW7y5YIoC
	oKO1Xc3NMX/HQyYdet15hqCen3xroOz13Lqscl59xw3Sw5rMa3SslJYEA+wRBYz7MnHPF60MVRL9O
	KPF63atYG3naAy2Bnxt6LPhReljnVh0rIouUYFGTQiJqqF4Ohic053ndAwPgYnrNeeP3mzQvZBWu6
	M2v2EAPGxfzsqTBPPB7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqTwf-0068tZ-PW; Mon, 16 May 2022 06:11:05 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqTwc-0068sv-PN
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 06:11:04 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9219A68B05; Mon, 16 May 2022 08:10:57 +0200 (CEST)
Date: Mon, 16 May 2022 08:10:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu, Wei Wu <lazyparser@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>, Bill Huffman <huffman@cadence.com>
Subject: Re: [PATCH 09/12] riscv: add RISC-V Svpbmt extension support
Message-ID: <20220516061057.GL12339@lst.de>
References: <20220511192921.2223629-1-heiko@sntech.de>
 <20220511192921.2223629-10-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511192921.2223629-10-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_231103_011128_2D8696D2 
X-CRM114-Status: GOOD (  12.90  )
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

> +config RISCV_ISA_SVPBMT
> +	bool "SVPBMT extension support"

I don't think this prompt is very useful as it doesn't describe
what it does.  But do we even want people to disable it as it is
really essentially for a fully functioning kernel and a pity that
it took RISC-V so long to get there?

> +	depends on 64BIT && MMU
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the SVPBMT extension

overly long line here.

> index 5f1046e82d9f..dbfcd9b72bd8 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -14,6 +14,9 @@
>  #define	ERRATA_SIFIVE_NUMBER 2
>  #endif
>  
> +#define	CPUFEATURE_SVPBMT 0
> +#define	CPUFEATURE_NUMBER 1

is errata_list.h really the right place for architectural features?

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
