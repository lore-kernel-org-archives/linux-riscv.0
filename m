Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F4BC44501
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jul 2026 02:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLlPY8oUnxu62CbyY1uScwo1ozI6dpeAxVs4PfX4UuU=; b=t0sqOE/SK0/zWE
	+CZdpaKMMmVyMcVubdTNxbVZFo8/csTp8wJGaNSACUDZg1zQfu5xqJg/d7dgl/Coj7+4CpB+iruEJ
	hxx2moZqC1oeDuG3Zl43aDx95xXRTYJIJqCzo8PBJCcmdJnj5DfEge7u6ITLzg1CC3jDG5Hq3NgF4
	9T3lEMpz3NzuoJ/DY24+c50GaKpGSrQdxkM0UjDvIcxT9tEQpPtduujRzYk/3Fe0ZceQx0Z0l9mvf
	UQOAAeOZWfogyU/CVXLjlCLY6RyoFVPy5PfQ3kU/Tn9KKmZ5rT7g+ZVdoAGH2Ugepnv7GfodwEpmC
	YOXPpsuNL0j/cikUZEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNaJ-000000068tY-1MWE;
	Sat, 11 Jul 2026 02:36:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiNaH-000000068tK-2M6y
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jul 2026 02:36:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D0C760051;
	Sat, 11 Jul 2026 02:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771B61F000E9;
	Sat, 11 Jul 2026 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783737411;
	bh=JvGQgD/zL+fNY2gX0aPOTLx88oeXax1vm26FJzg3PNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HRH/SuAr0s9ktamFAFNn0iIuDA5FkvUvLKxP9eLKw43mSTVOyTHVopp5CJ5F4oUof
	 f9RaQ622WSnCBsfrCxYPx6V80zVfYgFDuXAOPPsv+1lR0kLDymLGrl97Kfzu1hsbZm
	 p3LZrz0qNcCCHlOHYUgqH1zMdSZGoLWPDoEYN5ssNMqy7i9cU63E/ORNC9EHyJjCmj
	 Zuw7MvmvtB9UFadeCdLFR9eb/fumQ+d+bRk1oXHmt/SaW5d/iliG6NYxjYXZSW84oY
	 ZAYhcdpzRwM0zOOo5KBFAVXKjy7go2zD9s0H5VRLn9sMlkbJl54uNWVWCUNREwLcOK
	 yOq0PyHcbrbbA==
Date: Sat, 11 Jul 2026 02:36:48 +0000
From: Yixun Lan <dlan@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	wefu@redhat.com, Aurelien Jarno <aurelien@aurel32.net>,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH v3] riscv: dts: spacemit: k3: Add QSPI support for
 Pico-ITX board
Message-ID: <20260711023648-GKC106000@kernel.org>
References: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260711-k3-pico-itx-qspi-v3-v3-1-d6b37fc86c39@gmail.com>
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

Hi Zhengyu,

On 09:38 Sat 11 Jul     , Zhengyu He wrote:
> Enable QSPI with proper pinmux on the Pico-ITX board, and describe the
> NOR flash wired to it.
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
> Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
> ---
Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
