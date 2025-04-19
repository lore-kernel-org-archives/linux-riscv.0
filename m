Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB9AC369BD
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Apr 2025 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGHwJKUBCaApdUHwsvFTdrvC9jb0ZKA5/2kaOv0r+As=; b=h7IKWc9B26WKDU
	bIjHWZadssEQBGuLnEB4HXkKpDhtpVknzKZNUIt1HmhJZ+32Z/UW+KxjMrkXFrr/Fpr/nZ3XXKtz4
	+SZ58qgKJKg8+5A619wdxdxvN4bQDf30KRLYCaYCsOVOcrVoEnBK86SxzfwKeEYqZWBDDYlsCaBan
	qJzTnIoj8cvQgKmrjba7JHeWzGYb4/UV78A3fNgDYv2+li3d8klzrb6rfaHFfKM7qCr8eyJMGoN5e
	xXwLp2LSUcYdC77Np6Ux9F/1LOwlM83rgpKMIOtvAcZ7ROsDpemqgUH0PDJnMNjRbxb6xD334aBN9
	252M6KjzvjWWwWNSzswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64jA-000000016Tg-1bds;
	Sat, 19 Apr 2025 09:43:12 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64j6-000000016T2-2auV
	for linux-riscv@lists.infradead.org;
	Sat, 19 Apr 2025 09:43:10 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 509B812FB42D;
	Sat, 19 Apr 2025 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1745055784; bh=TOBj/1ChDvQnz19HxGfDD7N1HbsUAezNiKIuArHitj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNiPjR1WKT0/qO+GEwYV3ti6DJ49pPMOi+jbfO3N4GODOi6p9j7inA8FOc4vLpH0j
	 dASyRqNb9Ps//zuysI/icCS/35r1suh21OW8Dyvi8U21b3KGu1skl21hqr4nujNhPS
	 fK9kkNKbisx1GGZYD8p4g7ufqTrBNPrBtKILL4eq7aALULnaYuBWd+BO0x+S2h2jez
	 rtx7zRUEblW9Qo3MFEJWNC343Bx4N7zSpd+K5ngRlq4ZRV2f8iuKnD6hmFl25XlTwZ
	 PpufaHD2LZCRWQ+IeSezOZCOTVJxXre1ccd4tqIENSw4w+pgSMXBeWSOltGEziruhb
	 b5TXUlIq0VYXQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FlYzok8K45B; Sat, 19 Apr 2025 02:42:58 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 45D7A12FB42F;
	Sat, 19 Apr 2025 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1745055778; bh=TOBj/1ChDvQnz19HxGfDD7N1HbsUAezNiKIuArHitj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wr5TvnpUG18QOtD4HGV0Oi94la5waO52Jiofd6Nl/C7t150TDDWF6P9nogJSy4wwj
	 QO0Vc3/weoQtsh5XMDhY4DECXbfbUA+1utkqvvQDj/xIjvytH7eVGMIA5ULw8bHZ9D
	 5O36SRf6xhB+L2cBZmyEscMyH4QVLxuQyD/fmiUYr+x5l8Hy26AE9rq7c93CKU902Q
	 5MjNu38Nw76QU2Wffp/kIgzp6yDLwAbpEE0RVOrkOiq3D1AViAx2VqFwkPKhZJtY7y
	 KxSnacvzI3AEoySjQZZYh/o50y+d5G/kQ1Wksix/r4ixg2HdLakYBjozgfRqCVuCGv
	 R9ImEj7ciEC8A==
Date: Sat, 19 Apr 2025 09:42:49 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: dts: spacemit: Add clocks to pinctrl and UART
Message-ID: <aANwGZCIpMcd47IB@ketchup>
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_024308_970142_FD23ECE4 
X-CRM114-Status: GOOD (  14.41  )
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

On Sat, Apr 19, 2025 at 11:32:29AM +0800, Yixun Lan wrote:
> Populate clock property for pinctrl and UART controller.
> 
> The pinctrl's clock dt-binding patch is still waiting to be merged[1].
> 
> The UART's dt-binding and driver code has already been accepted[2],
> so we now are only sending the DT part patch.
> 
> These two patches are abased on SpacemiT SoC tree's for-next branch[3]
> 
> Link: https://lore.kernel.org/r/20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/log/?h=tty-next [2]
> Link: https://github.com/spacemit-com/linux/tree/for-next [3]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Generally this looks good to me, but I realized that splitting the
commit that introduces clock controllers and the one that correctly
fills clock properties for various peripherals may cause bisectable
issues, i.e. the UART won't function with only the clock controller
introduced and no clk_ignore_unused specified on commandline.

If this isn't really a problem, for the whole series,

Reviewed-by: Haylen Chu <heylenay@4d2.org>

> ---
> Yixun Lan (2):
>       riscv: dts: spacemit: Acquire clocks for pinctrl
>       riscv: dts: spacemit: Acquire clocks for UART
> 
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 39 +++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> ---
> base-commit: 279d51ad9f6dc0c667f6f141a669b2c921277d1a
> change-id: 20250419-05-dts-clock-026bfca75e5b
> 
> Best regards,
> -- 
> Yixun Lan
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
