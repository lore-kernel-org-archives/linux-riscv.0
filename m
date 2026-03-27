Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBBB10A3D96
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 02:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jn6zoZEy7KK7YOEVA2Wntzlq+6G68ew9iimrs9+GvgI=; b=yiATNoHPFYsGVl
	gCRbOMv3bIHpvttY33jE9pylZJepyls/ULj0LJMaj6ew7aW/JE3pqc5XP8J9MTYfySFoRiWTjV0Dm
	+27J73i6mfN41HWL0gKxTgP36d1Gb2LoQkpJA2VMAbNOwWl29sgqVkWxD9DLzpJomZ/pcGVqHntDa
	8ZFwtZDYsOTiTY63EMKojVHQQi7e7/R4a7Gw5N7xg/jYHRi28sJuvX4L4jrsC9PtLrE8aZMVrny/P
	2c47P9kNyMzaK8x/poN4d52D23CTKSjzRB8jMJWcWJP5lDjxsXWM7gPjgL+QeQu+5yHGt6Qu6V29h
	ws29B87TTwtIdGH4yLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wey-00000006WiY-3p36;
	Fri, 27 Mar 2026 02:10:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wex-00000006Wi4-3PZJ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 02:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B395660054;
	Fri, 27 Mar 2026 02:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1880AC116C6;
	Fri, 27 Mar 2026 02:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774577450;
	bh=g3K/wWR4NJgBsH5J5owDkOKJHzgOmJR8mhDzRqhQRlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+0AvfXJQ6wsU8AVVMeQihLkNJKViufO0RgrxoYG9/YJ9cNylayM4J9E9vLJlp/7G
	 z7Dp1Hf0aRXHTw9OUsCuOj6maWFRK1ooNJC87LbMLXtGs8l6RBz9LmkowKM/DYLlkg
	 rpmn/B7Yo9iZRmD58V75xiXGHDtGBFHPbTNXlmiAnBQMh0tHLPPYs0IiI/uNtXShz0
	 eF5r8DnDH2Es2lcn0JnD62AtIhkJC0w3WQOEkCRwqmV3tricHfPIkD/Y7alpAiN8Qe
	 k0UTFhmv/WYGeEKo32kxCRu0C5thztFX1pyri5h/4pNRtA6ycsDqCHMw+Fys649jDT
	 Uw5aAcRuelX8A==
Date: Fri, 27 Mar 2026 10:10:48 +0800
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 0/6] riscv: dts: spacemit: enable more devices on
 Milk-V Jupiter
Message-ID: <20260327021048-GKA881551@kernel.org>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
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

Hi Aurelien,

On 19:35 Thu 26 Mar     , Aurelien Jarno wrote:
> This patchset improves support of the Milk-V Jupiter board by enabling
> more devices. Most notably the NOR flash (useful for upgrading the
> bootloader), the USB 3 ports and the PCIe ports.
> 
> It was inspired by the Banana Pi F3 device tree file. It is based
> against the k1/dt-for-next branch and does not have any other
> dependency.
> 
> 
> Changes between version 1 and version 2:
>  - Collect Reviewed-by:
>  - Remove bootph-pre-ram property from SPI NOR flash
>  - Mention that the fast read opcodes is marked as supported in the SPI NOR flash datasheet
>  - Fix typo in the description of patch 6
> 
> Version 1 of this series is available here:
>   https://lore.kernel.org/lkml/20260322203356.2206927-1-aurelien@aurel32.net
> 
> 
> Aurelien Jarno (6):
>   riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
>   riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
>   riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
>   riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
>   riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
>   riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

For the series

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
