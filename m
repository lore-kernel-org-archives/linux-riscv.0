Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9D6E7AD40
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwOC7iHejQqalHv698y+XDGx9QoB0pWCn8exKswulG0=; b=DduZ7IU3CytBZW
	mvI2yEX1yqkVhII01ZrFjsl0G1HrvQfZ8pcwDb4KL+O3Jk1jsKmrjISEAeiMfdG8ssR7ctWJmFc04
	72iw5qcD9WuvD9wL9qH7HqUfJv9oqvsLpNMzCqOV49fiTMa/9Gp2O9Me9Oq6EHAmjd2k2oI9IrCMz
	rdNVWlGrORR3B17XeJ3DXkc8qUTDclx6kAxQ35glakWrBKXiXMA1p+6NJ/AeJPo10CXl/2kvCgBii
	p3dQmMreeB8A8gWidMGy5wuJj4MzqOrU2tiu1OJKBK3pQa+Os26F1jDUCPbPHGJHZFvyArLEitz+M
	b8q0rlCDyGbuX01md17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYg4r-00000000BsJ-3xgE;
	Thu, 25 Dec 2025 07:48:05 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYg4o-00000000Brv-2hTn
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 07:48:04 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 8A9A3341093;
	Thu, 25 Dec 2025 07:47:58 +0000 (UTC)
Date: Thu, 25 Dec 2025 15:47:44 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] reset: spacemit: fix auxiliary device id
Message-ID: <20251225074744-GYA2000703@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
 <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_234802_773874_B8B1E719 
X-CRM114-Status: GOOD (  13.26  )
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

Hi All,

On 09:11 Sat 20 Dec     , Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module,
> the auxiliary device id need to be adjusted, otherwise reset driver
> will fail to probe.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  drivers/reset/reset-spacemit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> index e1272aff28f7..0bfd90567011 100644
> --- a/drivers/reset/reset-spacemit.c
> +++ b/drivers/reset/reset-spacemit.c
> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>  
>  #define K1_AUX_DEV_ID(_unit) \
>  	{ \
> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.name = "spacemit_ccu." #_unit "-reset", \
To distinguish support from K3 SoC, the k1 namespace still need to be
kept, I will update this in next version

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
