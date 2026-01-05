Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DFDC79FB7
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 18:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtPsDiSg4qyiusnlAodr3m4nHoCPek2SUaOmTJQmVAM=; b=dIxEfey2HJBhXa
	dUIa+cvhkC2wg2VYYp5Iug/s48S+dbDyZHPdVDt9uSvuPCbydh8DWbm+YfP8WiOXHWu4ZDVPJnjAT
	TaC6CRAdjzAw+Cnm7C5EeU9wROFdZfP98ut9Gy8mGXtclWiFVyreB9iDZRLVFYaz9SH+ZZP9xIhYf
	zXLIbpGlMUL1KOlhKDQQrV0p/lRtBbAWxMcxDYjYB+vn/gf72FX9a0tzjThcfTwRN3bCGT8FCoO8S
	Tnb393wDClnk5WdOO1aqQ1y541NKJom4IvuYi0tRJtGfdI8GfeOqQ0nkp8AGZ229xvTU4ljb2Jtk1
	wjxxzoPPo0H9/REitLVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpZC-0000000Bw7B-1MHE;
	Mon, 05 Jan 2026 18:44:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpZ9-0000000Bw72-35qJ
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 18:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A643D6013A;
	Mon,  5 Jan 2026 18:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBC3C116D0;
	Mon,  5 Jan 2026 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767638670;
	bh=5q0yLfH4dcbPw7DocaLNS+0Kq+WDRXRsT1mvD3Ph4Hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMIOXGxwX3AOhzzmSSRX9a3a+MWD252fOjDPaC9ic3Liew1wJxwk2OCiFnk13s9ft
	 PZkodJl5v6KADVat8AVc4aoE0fSUpTyAqztktWUIlHqDf7Qiu2tyS0Gki5CmiQLoZM
	 UEMc4Vj0hqp3X2ZQqVp1mWwAiSN6ooo+a/PPz5ChrAGOST7+ZqTy7FtmPIe0P3wWB9
	 SOTyduXV2du/2921kmIkEJ/PxHuvCJ9Ybc4vtG4IvQ3Eo0vnbayIU6G1lv894TbXbB
	 C/CCL7EiS5NuwbLBNAMRvEp03C9qA5LR7bnGWLgTtBfDoUh/JfwSfjIP1iPo55D7bt
	 HDMRNlXzswXGQ==
Date: Mon, 5 Jan 2026 12:44:29 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: guodong@riscstar.com, devicetree@vger.kernel.org, krzk+dt@kernel.org,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, conor+dt@kernel.org,
	pjw@kernel.org, troy.mitchell@linux.spacemit.com,
	p.zabel@pengutronix.de, linux-i2c@vger.kernel.org,
	troymitchell988@gmail.com, dlan@gentoo.org,
	linux-kernel@vger.kernel.org, andi.shyti@kernel.org, alex@ghiti.fr
Subject: Re: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Message-ID: <176763866898.3087767.8456165135860930088.robh@kernel.org>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230150653.42097-1-jyc0019@gmail.com>
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


On Tue, 30 Dec 2025 23:06:51 +0800, Encrow Thorne wrote:
> The I2C controller requires a reset to ensure it starts from a clean state.
> 
> Add the 'resets' property to support this hardware requirement.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
