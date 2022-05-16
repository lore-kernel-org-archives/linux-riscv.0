Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3168C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 May 2022 06:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovCb+yJGsRxTbgFAcddtHnrCFZ+TOjYgV9aNawHTVF8=; b=ocWKfK2mHZFg1N
	wapeBoTNFCA/yqL6eoXmsBLzSbbUFZLP06V74Qgl6Z9lJt1mPLrprgY4Pf0ozEcxWMdEsOQVQUfqn
	mpGsNouEaUN/iFujxm1mKZFCeXx74y8cCw1bmB5qIVtbGwAGQyRFjDB3fsZD4WJjsvr8mqOwYl+Ly
	24cAPmT6P/w1vjnOcry1991cVWdd1pZhKVEsr7YoXtOlehwvA3qIMg53XOOlsyVFuzd8vS8zWJiD3
	/bc34CV/3KBffgEASGjS7osYtTOdEOr9WMGb44D0i590SeDh3TsbOYJKA0J4/21yGO6oeJlNmRuSC
	TaPNj5dUn5Dg4BRiVwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqU1G-0069Xr-QT; Mon, 16 May 2022 06:15:50 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqU1D-0069XO-CP
 for linux-riscv@lists.infradead.org; Mon, 16 May 2022 06:15:48 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1FF2768B05; Mon, 16 May 2022 08:15:42 +0200 (CEST)
Date: Mon, 16 May 2022 08:15:41 +0200
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
 philipp.tomsich@vrull.eu
Subject: Re: [PATCH 11/12] riscv: don't use global static vars to store
 alternative data
Message-ID: <20220516061541.GA12877@lst.de>
References: <20220511192921.2223629-1-heiko@sntech.de>
 <20220511192921.2223629-12-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511192921.2223629-12-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_231547_610146_B516F6C5 
X-CRM114-Status: GOOD (  20.99  )
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

On Wed, May 11, 2022 at 09:29:20PM +0200, Heiko Stuebner wrote:
> Right now the code uses a global struct to store vendor-ids
> and another global variable to store the vendor-patch-function.
> 
> There exist specific cases where we'll need to patch the kernel
> at an even earlier stage, where trying to write to a static
> variable might actually result in hangs.
> 
> Also collecting the vendor-information consists of 3 sbi-ecalls
> (or csr-reads) which is pretty negligible in the context of
> booting a kernel.
> 
> So rework the code to not rely on static variables and instead
> collect the vendor-information when a round of alternatives is
> to be applied.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> ---
>  arch/riscv/kernel/alternative.c | 51 ++++++++++++++++-----------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index e6c9de9f9ba6..27f722ae452b 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -16,41 +16,35 @@
>  #include <asm/sbi.h>
>  #include <asm/csr.h>
>  
> -static struct cpu_manufacturer_info_t {
> +struct cpu_manufacturer_info_t {
>  	unsigned long vendor_id;
>  	unsigned long arch_id;
>  	unsigned long imp_id;
> -} cpu_mfr_info;
> +	void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
> +				  unsigned long archid, unsigned long impid,
> +				  unsigned int stage);

Please drop the confusing vendor_ prefix for the function pointer
while you're at it.  The vendor id is just one of three inputs for
the patching.

Otherwise this looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
