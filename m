Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E3ED2505E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 09:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmFjIHKiistAhczW+hHj2Bx36S+Ek/tGGXpS6xVzsxU=; b=xg+qhKVMITb5ok
	J5RxCnX/75jCFX3EeaxXfg8ZddA9W9DMHQlLI4gaX4i1/gR1ht4G2TJz1uiBRLNRnvDuJo+AF5BgK
	nqVU4/kS5VjCFrNTotDkio1o7ftEZsv2m7RYAqxGmYTXmNRiwUDy9ShbmUMioN9BuJsdnYPPUqGZs
	KlSMes9qxb57iMvZGSv6sPdn6BiRdLQ/hU8BCNakFajv1fqSJ0Dl/Eg6lsNzE+OBq7pcKW7ctiaBw
	DfQRjw1xSFdGCvMTdC8Qxc0Bp33md77Y2YApX92SmUmy0Bl5carxxM1cKT4esVNzEadqYJo9CtByC
	UD9+YcXo4e2s0lRul6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfECN-000000055Lu-3bTV;
	Mon, 12 Jan 2026 09:26:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfECL-000000055LF-1H0I
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 09:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8B32042B03;
	Mon, 12 Jan 2026 09:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7924C116D0;
	Mon, 12 Jan 2026 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768210012;
	bh=jBazrOCw38rW6h1m2e0Cft5KuiYhVaHYsHaQV1DL5NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NW1IWrUkmt3jwikhdyS4KdHgsvj+TX8VCgpkBOBQfmXyGcdnaCtoYboAiesaeHkc7
	 K4HycwM1hbCub5IcVC/TSiNK7FROs9mBiqrfANzJY9SYWFeaAD0r30x/Y53/8UVNH0
	 4/ek5l2zIcTIOdjjKKAsZgnow2S7V7nxeXIMXRJ02Pdti29MP3+ITuShMXNADJwnqv
	 POQTH/uO1MT9PIvMyN49sUxq/gCDkA5J3IjDHOfpBpCZ/BHFe/IgNLJMpeA7ilOv0g
	 kauja+EtmHhnITd1Z8Bvr71W63h/U25o8mhhn3ecztSDfdfmiRKz7Hg2nDMWgsNdJf
	 yi2MgVySehwBw==
Date: Mon, 12 Jan 2026 10:26:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guodong Xu <guodong@riscstar.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: spacemit: k3: fix drive-strength
 doc
Message-ID: <20260112-sloppy-careful-lobster-ca42cd@quoll>
References: <20260110-k3-pinctrl-io-doc-fix-v1-1-7872fe6efb80@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260110-k3-pinctrl-io-doc-fix-v1-1-7872fe6efb80@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_012653_356949_99252723 
X-CRM114-Status: UNSURE (   6.64  )
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

On Sat, Jan 10, 2026 at 08:20:59PM +0800, Yixun Lan wrote:
> Fix a typo in the documentation, it should be the 3.3V drive strength table.

This needs wrapping.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
