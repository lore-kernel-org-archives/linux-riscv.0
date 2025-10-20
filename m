Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE383CCD199
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfmvFs63fp0uIjNjrj6Fh20id008hzbTWmByP+V0nM0=; b=BTjslY0cquQqIZ
	/3BYj96V3A5n9e89kFaDvW5QnRy3OVpmVZU0vZWaZpZxYzfcmy7I6a2qhvQcL0NDlC+MCDU9gg4oJ
	VwDq0dbTEGPsuIHkAZwZJWit21LhfjhKhTYrvOIObfZi2CQOP0xCedqwJFQUPfPDP55OHw39wYqmT
	BmTbAFFpwQAYoLRj6ybwifR1IPZW1KSEUJc5M7bt0yTRw2C4SacpL/BfBlED+f1nRfK2qRsweJTUw
	sihuZjb0tqFwwoP6Lg5zPVEBHD55jfy6qmki7JVCIMEYBQUy2/xvgGfQLQgLUkmK7r19G2WwAgs7c
	4N0QM3Kgs6Lrls6oHstg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmCP-0000000CaW2-1wau;
	Mon, 20 Oct 2025 09:29:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmCN-0000000CaVL-2kMr
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 09:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E023761D15;
	Mon, 20 Oct 2025 09:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F17C4CEF9;
	Mon, 20 Oct 2025 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760952528;
	bh=zUL6wY6nUkFC7RGRQqooEtBqgzEkwxUZ3UEDi7LPXlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRhRdzVcMB61IB7i+p7RSXbRZlUCKKayYcJwSONs+XbN4XoXG/ee4IREKqIoxdShg
	 eLEgFxXzkCoOcTA6DT+0ugxnjH45NcB+U8AP+ouCyjqJqZZD4jrTGEhnt5jyqi2OIy
	 lKmOwMNQwNSx5o9FmVIGJZ02lJfEMBln6Mk32N+Pu6LP3LgcmI2V1Ltcb6g4Pke+8Y
	 dd9v0HkBiblXFkoSJox3HGDrdP8I/r915gxMOmFg63dIIHmfNV0mRW0RPeQqgwEhtq
	 iJ2Cr3nwYFY/zxgFhPYfsFFxuR9o3kgDJyf26j0jPBPSJ/28pWyN33VqkctenYdaTB
	 +1NazHpe3VGKg==
Date: Mon, 20 Oct 2025 11:28:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>
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

Hi Troy,

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

merged to i2c/i2c-host.

Thanks Yixun for your reviews here.

Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
