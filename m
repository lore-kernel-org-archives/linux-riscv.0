Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA05C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9F3W/fb5BvLwnTVkzzVMbrwLOlIhHPS86snTUq0alRg=; b=gEiB/j8X6bA8UX
	4lFbI3hR9s7kx/EYUgI/2M0b8jMlk+gl+g/z0qoLFjU2YrqeMbnMK8/NjRvev9xIuBGahUYKbByOZ
	AIC4mV7lPknKmM/m6jcsyhh6msLxOpS1EXgHh0H4i7gNe60CPErwhyZeM1w8vPKneH2L4CFsa7TI8
	xvotRizWiNPyEY0nyi7N0UPmLc3pnGy/A32L/pPKxn+39gG5URL6jcil8R2ASa7NYKArQTUMzyZyT
	lmnx8w/ppJtDV+8cpxn9dSnPs9NUjx/MrPLEpK4e1ahEgxZCO7y5X8P+QAo4enaufkY+pgINYhQh+
	WL4NoMPFM6SfCPgQVV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRAd-0011hg-0w;
	Mon, 15 May 2023 05:54:55 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyRAY-0011g6-0x
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:54:53 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1pyRAL-0092DT-4p; Mon, 15 May 2023 13:54:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 15 May 2023 13:54:37 +0800
Date: Mon, 15 May 2023 13:54:37 +0800
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
Subject: Re: [PATCH V6 03/21] crypto: hisilicon/qm: Fix to enable build with
 RISC-V clang
Message-ID: <ZGHJHcECXV0EptuT@gondor.apana.org.au>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
 <20230515054928.2079268-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515054928.2079268-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225450_331944_CE325EB5 
X-CRM114-Status: GOOD (  10.90  )
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

On Mon, May 15, 2023 at 11:19:10AM +0530, Sunil V L wrote:
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
>  drivers/crypto/hisilicon/qm.c | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
