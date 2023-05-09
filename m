Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D90C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 02:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOLbHJ3QuLSghxFou/DfE3mM55hrcTyQRvFlmOMrK+E=; b=g71FW8UqeEBNot
	6BSfaYrm/tFBXESaMnPbmE8co4xYpxR5sq/sH2OqOfWkIVT+gOeySG/wu9NBEJpnheNgwvqCnP1IW
	qJ2hfzqg0a3GanAVEPN8E8tqTRC8dvK5+dUcGtbakL94jNgS3w2Zlf2N4lbKktsrAMn22Ik5c7EN1
	C9+UQMaDXKz6tBBCqzTn03kKlUJMkBpc6lgkHFr/em66qo5f/ZsYp3eo+/ewIcSJpU9kCEPLivwOJ
	K7ayUSzncQwa560OuQ7sX6EW3ONisa23SDUzBu337II/tE0oSQfuGsk2NTy3UeZXOMnAMoBsgl+x6
	QSLss0//CJ89b6UrhHgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwCvZ-0025rQ-0l;
	Tue, 09 May 2023 02:18:09 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwCvU-0025pr-05
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 02:18:07 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pwCvA-006hX7-Oq; Tue, 09 May 2023 10:17:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 09 May 2023 10:17:45 +0800
Date: Tue, 9 May 2023 10:17:45 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	"David S . Miller" <davem@davemloft.net>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH V5 03/21] crypto: hisilicon/qm: Fix to enable build with
 RISC-V clang
Message-ID: <ZFmtSReX9/WR5CkK@gondor.apana.org.au>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
 <20230508115237.216337-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508115237.216337-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_191804_081432_04BC3F14 
X-CRM114-Status: GOOD (  18.13  )
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

On Mon, May 08, 2023 at 05:22:19PM +0530, Sunil V L wrote:
> With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
> allmodconfig build. However, build fails with clang and below
> error is seen.
> 
> drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint '+Q' in asm
>                        "+Q" (*((char __iomem *)fun_base))
>                        ^
> This is expected error with clang due to the way it is designed.
> 
> To fix this issue, move arm64 assembly code under #if.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/999
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> [sunilvl@ventanamicro.com: Moved tmp0 and tmp1 into the #if]
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/crypto/hisilicon/qm.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
> index ad0c042b5e66..2eaeaac2e246 100644
> --- a/drivers/crypto/hisilicon/qm.c
> +++ b/drivers/crypto/hisilicon/qm.c
> @@ -610,13 +610,9 @@ EXPORT_SYMBOL_GPL(hisi_qm_wait_mb_ready);
>  static void qm_mb_write(struct hisi_qm *qm, const void *src)
>  {
>  	void __iomem *fun_base = qm->io_base + QM_MB_CMD_SEND_BASE;
> -	unsigned long tmp0 = 0, tmp1 = 0;
>  
> -	if (!IS_ENABLED(CONFIG_ARM64)) {
> -		memcpy_toio(fun_base, src, 16);
> -		dma_wmb();
> -		return;
> -	}

Please leave this bit as it stands.

> +#if IS_ENABLED(CONFIG_ARM64)
> +	unsigned long tmp0 = 0, tmp1 = 0;
>  
>  	asm volatile("ldp %0, %1, %3\n"
>  		     "stp %0, %1, %2\n"
> @@ -626,6 +622,11 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
>  		       "+Q" (*((char __iomem *)fun_base))
>  		     : "Q" (*((char *)src))
>  		     : "memory");

And simply add the ifdef around the assembly.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
