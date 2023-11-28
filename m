Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE29C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 03:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wQ4VVOX0Hw8qi+U1nlNumfxqzQqlp7UiuJWpvTpnLM=; b=nVltn2sGp6cyud
	zmvT5qRnXBzOAgq5QE/4EzGNZghBsLkFkkAiB3GW9ZUShNbE109SBiWBwfPDS4KvjK9Sf9mfkugxp
	Za7XTN4K7xozA93AKXP9mgtz3WBzAtqOygMlof2URE2RZXzFXYsRwrhSl8JjkrIMK7c67N9ynSXr/
	Z/ncir/DwYViMfFeVTdoTbmn41qzRv616knY1hM/elNS2Y5NhgweVFoJu+WVjxhc/PuhumM2gF7aC
	ZRKOv3/ZK6o9qhWahSeA8Qxm21+I1XP5G73cahDznzfn0SQxBwycq/z1gwrWX3SoCC70LWvmnoWNW
	7y5/3pj921JeEb8hsnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7p2d-003zLE-1W;
	Tue, 28 Nov 2023 03:45:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7p2Z-003zKh-25
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 03:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0BCF60FF3;
	Tue, 28 Nov 2023 03:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C698C433C9;
	Tue, 28 Nov 2023 03:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701143138;
	bh=iUs8sHkTZHvgV4m7oQH03SHaVTmkC/+rsFHLswC0zcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Di770KJ8dOeJ74EzzegGRUa6qD1qCkdQpa96FR991b6MkcaeMI55ukBVgNIgJ74/8
	 AQYXl5jzn5x2Y7wEbRqSNQwktyHdtBurg1xytwHOCEvFd2nJPkcoRkB3bJNhZ2KAm7
	 gGu9PRlg3UcAmhz+OP9lY/BwvObgK5u83B6ggG4wvjEPmgcMiX9N6d50LSR9jjT6zv
	 tL29MNSFkF29D9n/P3hBLvEu98Lb5cEA4aAwZeIgCkR1SkVdr5cBYvfT71b6Z+RImA
	 hEz53xmbZz+Lrkoz4vP7FOTH5K9iBLEC+sJlBoRMo97u24ZDrJYBo2iQTJq+GKNWl3
	 vdncApXSdj61g==
Date: Mon, 27 Nov 2023 19:45:36 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 02/13] RISC-V: hook new crypto subdir into build-system
Message-ID: <20231128034536.GF1463@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-3-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-3-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_194539_778252_6AAC3471 
X-CRM114-Status: GOOD (  10.24  )
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

On Mon, Nov 27, 2023 at 03:06:52PM +0800, Jerry Shih wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Create a crypto subdirectory for added accelerated cryptography routines
> and hook it into the riscv Kbuild and the main crypto Kconfig.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
> ---
>  arch/riscv/Kbuild          | 1 +
>  arch/riscv/crypto/Kconfig  | 5 +++++
>  arch/riscv/crypto/Makefile | 4 ++++
>  crypto/Kconfig             | 3 +++
>  4 files changed, 13 insertions(+)
>  create mode 100644 arch/riscv/crypto/Kconfig
>  create mode 100644 arch/riscv/crypto/Makefile

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
