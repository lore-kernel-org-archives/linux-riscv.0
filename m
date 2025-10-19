Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558DDCCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 22:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mhWkQiBTcPiM9z0KV4zNpGMi/0RaBbGgM7i2t2lJIto=; b=vKG9KInDUHQWVk
	DcuQbsqUxn7EhL7KSpbh9EccTXsrXk/4+xyA3AUG2PLnrmaOUd9t6XNzuKB4VtB1LLJNEAtdQLubN
	HQE6F5gLm7RkZHsrSBY4rbWdzD1q+gqSvFqmj2NB6T4u1JT2xU1EOKVflkv1mN/IJSEH85TSDgIby
	V7xQbyrfguqWnVHpMjyncgKB0/E+eUWa5K/18UhmhKonp4Prd0ngd81j2js5vQw5sN390PX+Ul7p3
	RN4zbWBdS0NgQtGNpS2tZgFSYwNvvgjedOIPOOdi6W7awk0zSSjbNMR9/SOmFmT8f5oRnPVkHkQKn
	jiSQ3fgda43huxOc/FiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAbxW-0000000BVVy-0MgH;
	Sun, 19 Oct 2025 22:33:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAbxU-0000000BVVX-3Cmj
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 22:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DEF6560191;
	Sun, 19 Oct 2025 22:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA576C4CEE7;
	Sun, 19 Oct 2025 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760913165;
	bh=BQvePnqZSh98d/7LmjdaVdS2t1hzyGD0Ie/pACHXIZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TeTfX/QVp4813TURkaORgH0w0Mt/jxYnmKmat7JPgTP9D/p5gL//oBlTOLx2SN1tS
	 88kkgMd+2IEBeTxOlv7vqurFge7z7XFp58eu6DWXsUZ4HZrzPkeEgy7zEe4XooWsJL
	 GGiHxKDLnE/a3n12ITkcR7slrQiM7wvKk8C4xAbmwaclm0lgsdyaLx1dTfMSVfdIc6
	 ITIarAniHwSEKlxBq3wAQnbN10L6loHSP4nLDk7x4B9riGMhLq07JTR/JBM7R7TGBk
	 Bf3GGWuhQecxTFqeOixOHB97mAOwZfb3kAcqijc2njhwgyfksERI9vGVSFGj2+ovTn
	 2kMKrWhYhJe9A==
Date: Mon, 20 Oct 2025 00:32:40 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <b6lafouoz6f6al5ki4oh7jj6gfpejwyh62sdrh7lia37sadd4u@rle3aw6grsiw>
References: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
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

Hi,

On Fri, Oct 17, 2025 at 03:27:39PM +0800, Troy Mitchell wrote:
> The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> master mode operations is determined by the ILCR (I2C Load Count Register).
> Previously, the driver relied on the hardware's reset default
> values for this register.
> 
> The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> frequencies lower than intended. For example, with the default
> 31.5 MHz input clock, these default settings result in an SCL
> frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> and approximately 338 kHz (fast mode) when targeting 400 kHz.
> These frequencies are below the 100 kHz/400 kHz nominal speeds.
> 
> This patch integrates the SCL frequency management into
> the Common Clock Framework (CCF). Specifically, the ILCR register,
> which acts as a frequency divider for the SCL clock, is now registered
> as a managed clock (scl_clk) within the CCF.
> 
> This patch also cleans up unnecessary whitespace
> in the included header files.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

looks OK to me. Yixun, any comment here? Do you mind giving it an
ack?

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
