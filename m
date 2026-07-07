Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FB4C44500
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 06:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+LUxFcZF5e9YMVYpQY+Jus8VCyuYuHznqKdSMo6KJg=; b=sldU3lUg8FjuZS
	MZyh0y9k8pm3xvktKjE/ruXozZ2w/9QB/CBRYM8uuo9MM0+vF8U9Od5uJ0JtwJqekQ5GCHtRmcHWX
	m+MX9OcBtuU1BrIUsheHc1SSB3TI8OMss6L2CIfnzaxNYL0PO7sQ9Fi/P/tzrY3ADSJYaijDbBJKt
	CKzN3plEjg8l7otLnHMobIEjfRkzv5S33nPCG6L6Xil8fU8LRQOTWCCfCWnPFKAPYBzwj00t41Vpn
	ISNvs0Vc2Y2ppG9olLFKEwTo3zPAK7ZAetYpXVy2CTYG85rl/FnMXVTYXvPpAiP+xI5Vac1KHfU/K
	6XimLk+RBgdbtndKlT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgz88-0000000EC6w-3dYj;
	Tue, 07 Jul 2026 06:18:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgz88-0000000EC6n-0feH
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 06:18:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97C1D43D4D;
	Tue,  7 Jul 2026 06:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746B31F000E9;
	Tue,  7 Jul 2026 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783405083;
	bh=5yHbzKzGNqiUCBIQAfXyOuu/Ap/WwSqdBvZYe/QZ19o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=os1AnOLTHq6Jt7FndhS5zenrQc8ZDHoss2lgmiMee3GQLoa1k10cyFdgt8AAcmWxt
	 JZKnRTWSxOf+I2+mcCGYmnvpUNDvIRMHfvGk1L4M/Xo9g7bBwCzT6+84SMBDXwnO7B
	 o7fR5Hc2jQdusYtrvTgauhFoxBO8ui5P+32RsPYrnx8nczhjk1640vn7wEoUrIxV/5
	 82PoLs4O5XQ3+5z4IU3YD8/o1Ieq8T+n3vRCDeGK+bXqzLGLokGrstcO0bCrCLEGOk
	 X0Z/OjA870aXM1HZh3gnfHKaSpZP9NTK4pc8r/DiK/cXWL11PkRQN0L0XnisGYqQk2
	 CHe9zWxB+NvVQ==
Date: Tue, 7 Jul 2026 06:18:00 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 0/5] riscv: dts: spacemit: serial/i2c/ethernet
 improvements for the K3 Pico-ITX board
Message-ID: <20260707061800-GKE35811@kernel.org>
References: <20260623204431.498700-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260623204431.498700-1-aurelien@aurel32.net>
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

hi Aurelien,

On 22:43 Tue 23 Jun     , Aurelien Jarno wrote:
> This patch series tries to improve the K3 Pico-ITX board DTS by configuring the
> default baud rate for the serial port, enabling the 24c02 eeprom on i2c2,
> adding aliases for i2c2 and i2c8 ports, and enabling power saving features on
> the RTL8211F PHY.
> 
> Changes in v2:
> - Collect Reviewed-by tag
> - Fix issues reported by Sashiko AI in patch 2
> - Link to v1: https://lore.kernel.org/linux-riscv/20260620062238.3199108-1-aurelien@aurel32.net
> 
for the series, looks good, so
Reviewed-by: Yixun Lan <dlan@kernel.org>

> 
> Aurelien Jarno (5):
>   riscv: dts: spacemit: set console baud rate on K3 Pico-ITX board
>   riscv: dts: spacemit: enable the i2c2 adapter on K3 Pico-ITX board
>   riscv: dts: spacemit: add 24c02 eeprom on K3 Pico-ITX board
>   riscv: dts: spacemit: add i2c aliases on K3 Pico-ITX board
>   riscv: dts: spacemit: improve RTL8211F PHY configuration on K3
>     Pico-ITX board
> 
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 42 +++++++++++++++++++-
>  arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 11 +++++
>  2 files changed, 52 insertions(+), 1 deletion(-)
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
