Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D0C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 06:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEdaET7pegtz49W1g6O+yiQWdyoW6wDReHr+k7B7CzA=; b=3X0NL6t6nkSPrr
	uvo//okvyfDmn8PLwOhnD7eSMxbRcbhRS+WOcuhROmQwU8f8iydwnqTjAZeZK+a/wPKWS0wyUrQNC
	oa71Lcv9llYeNqe/z0Nrle6BI4Sq0ZZYCBn2qkQs9A0H9lSr4WcxhG67Z4dTmRQeZQqnI9diMrU6F
	9lFrUsVe+aJ65nSh+e0qB3gY3P7/DeNjxbLW9Q+OafO1Y6lbm37YgE2O59jBP6wmRKzki579rh4h+
	3qtFmT1WsH3hdUSjJolWYuRtPOBhnfG+BpcSihpp7NOveRnIQJRffxr8VXASYSjbSBCCQG/ur3CjP
	bCSVa7l/c2MsUyzpZRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxMOO-004pad-Am; Tue, 22 Nov 2022 06:04:24 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxMOL-004pZU-KB; Tue, 22 Nov 2022 06:04:21 +0000
Date: Mon, 21 Nov 2022 22:04:21 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v1 3/7] RISC-V: kbuild: convert all use of SOC_FOO to
 ARCH_FOO
Message-ID: <Y3xmZd9wqj7wGcCy@infradead.org>
References: <20221121221414.109965-1-conor@kernel.org>
 <20221121221414.109965-4-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121221414.109965-4-conor@kernel.org>
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

On Mon, Nov 21, 2022 at 10:14:11PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Convert all non user visible use of SOC_FOO symbols to their ARCH_FOO
> variants. The canaan DTs are an outlier in that they're gated at the
> directory and the file level. Drop the directory level gating while we
> are swapping the symbol names over.


I still very much disagree with this.  ARCH_FOO for something that
is not a Linux architecture is a really really bad idea.  We need to
fix arm and not convert riscv, which got this right.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
