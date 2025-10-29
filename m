Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39D9CCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/70961qbWzsMMlLjNtbbfRKy7RSJyZBwbEMQLH7xaY=; b=m2YM8BorX+sPOg
	sodZxUz+IkW+JdxWhjaof0EGkLGIf5c8lEfC+ApnBD+io0t98P9wEnu1PCL4PYLNU/puZnnwBaeAH
	+7ORuvdkEHRdSL9BX5ZoOXDNXtRMn9qeO3aP0B+uMcAfZte4DGttBH0oE3BHkmwjsDFY9Teu7kkkV
	lghsE6vruj4lLGE+Rz7726wXgtkuWplZLUpdeM9RcsRzJIBvybWTZb/u6hXvdbt9bfYyEm2MlMP1Q
	V0Z0gFU6jCe+ZwVZKkWI76t/409lZK511crEK21OHeY5UsCYKjocgYAXp0vdtEDqGXbf1BqdfsbEd
	BULahg8k8NXkk6Kqsp4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5hD-00000001F9p-3LLf;
	Wed, 29 Oct 2025 12:54:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5hD-00000001F9Q-084f
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 12:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AB5962143;
	Wed, 29 Oct 2025 12:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC22C4CEF7;
	Wed, 29 Oct 2025 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761742473;
	bh=ERdenaaSnCayj1jM0xEoP/ksydq7NeKvn4duQyaIA68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CG+TiDH9vGrRy+dyYgFaDqCLfCHqvH7YbbEpGB4Wyf1sfqV7Z72xZvLHkffLd2uin
	 yRkW4y9wr6dcsSz2IXD+UhbcdQYbVmigc/lSyttE636E4xmsd81+TFdGtLgy18uNMq
	 3P040ruFcjLA6waCPh/yOKM0ZKFgs/Bz5LteAXdIri9sarOU/pJVjqCNnCQS+8Qt7F
	 8i3EaA0SU9esvTY3db6xHPuFGt4bS6T4/3N5Gg0ueJt6mQHvGgDUopWLmYvl8uwNRs
	 Jcmg7njFZziQ00suGgN+EUSg84LwN3EMwaMfaDhoDK2ItrTLVNCkCbwJ58CoQogmoh
	 v4h1uUFM1gJjw==
Date: Wed, 29 Oct 2025 12:54:25 +0000
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v3 3/5] reset: th1520: Prepare for supporting multiple
 controllers
Message-ID: <aQIOgbUf2IHoWCf2@gen8>
References: <20251014131032.49616-1-ziyao@disroot.org>
 <20251014131032.49616-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014131032.49616-4-ziyao@disroot.org>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 14, 2025 at 01:10:30PM +0000, Yao Zi wrote:
> TH1520 SoC is divided into several subsystems, shipping distinct reset
> controllers with similar control logic. Let's make reset signal mapping
> a data structure specific to one compatible to prepare for introduction
> of more reset controllers in the future.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/reset/reset-th1520.c | 42 +++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
> index 14d964a9c6b6..2b65a95ed021 100644
> --- a/drivers/reset/reset-th1520.c
> +++ b/drivers/reset/reset-th1520.c
[snip]
> @@ -138,22 +147,31 @@ static int th1520_reset_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->map))
>  		return PTR_ERR(priv->map);
>  
> -	/* Initialize GPU resets to asserted state */
> -	ret = regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
> -				 TH1520_GPU_RST_CFG_MASK, 0);
> -	if (ret)
> -		return ret;
> +	if (of_device_is_compatible(dev->of_node, "thead,th1520-reset")) {

Is there a reason that there is a now a conditional check for the
compatible here?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
