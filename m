Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3386CEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 10:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJ8/YilPF9UuLoegJFbLOVPn7cDR2NB/JpTwQZDUxjg=; b=MOuJoDeib2Fuap
	Z1U+WQ4Pq2DEGbs8VuK6s2WmO5Y34V/WQHSjmp0+2Y+40MkMv8F3XkoK3CnpA6L+f7go3VTRaG7If
	hmkmU8fARB9vhaYgDY8Z4T58k00eLJy1JTVJ4PqdkLdX5FyAA0ywsjsmOm8J60BMt7cq17KF1nYVJ
	5y4aoYd7lrXoAvgdr8w5B9vlWi9IEwY8Ylha1Qd2EoEUUYLymbutq9befo0iM7M9cwsHMc+VKzIdB
	+YZGddrwghl1j6kB9jIOferg04MCoNv5Flu+I43KrFkR8dVSS3o4KCmDiUvdn8ihQRO/WQkXSD+Ad
	IeMR7Y0+cHsQ7g8nU7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6nV-0005FG-0C;
	Fri, 16 Jun 2023 10:35:17 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA6nS-0005EB-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 10:35:16 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qA6n9-003mBe-Da; Fri, 16 Jun 2023 18:34:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 16 Jun 2023 18:34:55 +0800
Date: Fri, 16 Jun 2023 18:34:55 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	davem@davemloft.net, conor.dooley@microchip.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 4/4] RISC-V: crypto: add accelerated GCM GHASH
 implementation
Message-ID: <ZIw6z7MNJ8Nq1q+k@gondor.apana.org.au>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
 <20230612210442.1805962-5-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230612210442.1805962-5-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_033514_542256_53E96E74 
X-CRM114-Status: UNSURE (   5.86  )
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

On Mon, Jun 12, 2023 at 11:04:42PM +0200, Heiko Stuebner wrote:
>
> +struct riscv64_ghash_ctx {
> +	void (*ghash_func)(u64 Xi[2], const u128 Htable[16],
> +			   const u8 *inp, size_t len);
> +
> +	/* key used by vector asm */
> +	u128 htable[16];
> +	/* key used by software fallback */
> +	be128 key;

Where is the fallback?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
