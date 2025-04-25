Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16371C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 00:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWuRynqWavdwOJ0PZQrCrmVIekzEVjFiW6N7nYwH6tY=; b=XDK1GZymn6BadI
	/XtlWudE7sX7e3FfWkLHdqzXBw/ah5c70kVHEPKdb+i7pLl5E/KV7t0gkmIiqjbDZGAJZK3glBP+y
	Pa1nfaRS357rSJN/QC9TTvkA0R0cpWJq064op/skZSpsbR531LK6h6t+fXc4p0pQMfY31L527+VBd
	CO2TEPg4ApaVS2x/HaIB91jcBiCShmXyG2OBQNDryiYImEmpkKj82wWOtDLffREywHGhlaLJpSNWn
	qYmiYuP4lKIBsWVDPk7k+73BuS+MTT7ohGmmkoHT/ZeJ3PxuPx8YuqdC1Yuus3sxK36jMIe+kmpA6
	0Oo/vd+N4xCo0dCDQTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86YO-0000000FaRJ-4AUZ;
	Fri, 25 Apr 2025 00:04:28 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86YN-0000000FaQ0-12Ai
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 00:04:28 +0000
Received: from localhost (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6E804340C43;
	Fri, 25 Apr 2025 00:04:17 +0000 (UTC)
Date: Fri, 25 Apr 2025 00:04:06 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v9 1/3] riscv: defconfig: spacemit: enable gpio support
 for K1 SoC
Message-ID: <20250425000406-GYA49092@gentoo>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
 <20250424-03-k1-gpio-v9-1-eaece8cc5a86@gentoo.org>
 <20250424-untried-refueling-50c5902d63c9@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424-untried-refueling-50c5902d63c9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_170427_312889_8D8DC944 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alex Elder <elder@riscstar.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Conor,

On 16:22 Thu 24 Apr     , Conor Dooley wrote:
> On Thu, Apr 24, 2025 at 05:40:49PM +0800, Yixun Lan wrote:
> > Enable GPIO support, in order to activate follow-up GPIO LED,
> > and ethernet reset pin.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> Do you want me to grab this patch, or do you have a defconfig branch to
> put it on?
> 
Yes, I'd appreciate if you willing to pick it, to avoid potential conflicts?
(I currently do not maintain defconfig branch)

BTW, we might have few more in this cycle, e.g. - clock, reset

Thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
