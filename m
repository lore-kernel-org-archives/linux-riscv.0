Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237C4CA1015
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 11:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAr8Ld02fhYCP4uoWxN8qhrTZ6C9oOcZYU4a6PUIWxQ=; b=3C9R8mb1X3UxeI
	fK+pGvUXJ6EcJWFAEjI9mzlyxAwIji/KIdPjpv2Bi9s7PUO4F0mCNXql/aJXFBAs2XgKIuoBCFv+u
	/Xk6NgROfvBS92v2dI/eFV1ikW/eZ2tPDTIydzP+/5vFrMurqPGxWs3EQJepwhPFOoiUVrLh14JO3
	25bzEyloD+pPSQ7J2soJeqFTCjp6v42yRGrdqLDIyMSqwIaulKAwW0//mzNDYdF7RMynuCSUiCljw
	efu2XrDyh9N7qe2DdfXrHEA+w/3+UPLhrcHcZhtgJD9OMFSLilbqdN7+Bfa+Ayq9Ot/smOvqO1/pQ
	38/tbJTouvY+RWcztujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlSF-00000006CIl-1zya;
	Wed, 03 Sep 2025 11:15:07 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkah-0000000659T-3hpP
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 10:19:49 +0000
Received: from [192.168.2.54] (unknown [216.234.200.243])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 85E50B22027F;
	Wed,  3 Sep 2025 12:19:44 +0200 (CEST)
Message-ID: <067174f5-32ea-45df-9a48-96222850e813@freeshell.de>
Date: Wed, 3 Sep 2025 03:19:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: jh7110-common: drop no-mmc
 and power-on-delay-ms from mmc interfaces
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250903101346.861076-1-e@freeshell.de>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250903101346.861076-1-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_031948_076949_A9409AC9 
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


On 9/3/25 03:13, E Shattow wrote:
> Drop no-mmc and power-on-delay-ms properties.
> 
> The committer cannot be reached for comment and per discussion [1] and
> testing there is not any observable problem that is being solved by
> having these properties for the VisionFive 2 or similar variant boards
> through the jh7110-common.dtsi include.
> 
> E Shattow (2):
>   riscv: dts: starfive: jh7110-common: drop no-mmc property from mmc1
>   riscv: dts: starfive: jh7110-common: drop mmc post-power-on-delay-ms
> 
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
> 
> 
> base-commit: f66eb149b87677da3171a0ed51c77c3599ad55d6

P.S. missed the URL for reference [1] in this cover letter. It is:

1:
https://lore.kernel.org/lkml/NT0PR01MB1312E0D9EE9F158A57B77700E63D2@NT0PR01MB1312.CHNPR01.prod.partner.outlook.cn/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
