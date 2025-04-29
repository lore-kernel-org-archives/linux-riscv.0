Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6356BC3ABA9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 20:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M874si4WGGtZMPNQMcoIfE3cQtkQE/IaSeoTn39y6NE=; b=0vpov17zahB/Ql
	iRE7S6Pb6UvJco7umiUTD1w7Z+hbS2f5ef5RxgRJpA8bRuvmnt896c5BZwUoy4xbkxtmTozJug44J
	pfs8UJVgmRuMyAAwf4zV3qbcniWMtS8Yz4H2WEIFtffPeRuA7mVAyZcuMYf5dBhnVlgFdSAVsHZ09
	Ly2320Xt0A+VxwckAF9kmi9JQSYJBSp2BTvCKfBfAkfwjn0WmKN/9jTlj8EOBciuWCMm7f7UE39RO
	3jc9ue6Xo4v62Y9j8MzwhIYiA/eFKzHTHsa9rvjptwnEJiU30Hblf2xlbEUOAjz2T47BicbQ7dkt1
	jydE/OLiSH6nK91zzGqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9s13-0000000Ao0s-2mYG;
	Tue, 29 Apr 2025 20:57:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9rtF-0000000An7v-1wkh
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 20:49:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 408364A9A8;
	Tue, 29 Apr 2025 20:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 358ACC4CEEA;
	Tue, 29 Apr 2025 20:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745959756;
	bh=ptTQiYQiUBpqi5BLqP8hyOPwFhTGOu4vZpnI6PDLdBs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OrhdEdqEAxCDMWJLTEDqp3ErrJlbvGWWQOO/ZStLLVK5GCM3LbBJ16nOCXCPob9dn
	 ypLkVxKcaBoKS5gBcXPbA9qZkCrQ/vHKRxf5CzpNGJIcckj8Z4qu0eHuXytxlc3knh
	 MRAWJJKtVfJVmeZqZ8cQYToxXsbyjb35XWgx3SYA3Y7Bc7SsJCUV648Ny/MoF39nH8
	 pJhbo6niOVSfKAKzzzewfpeqQIs2It9x7jB2CtjNzbh6ePyGH2Oqkd5hC0CB85DcFd
	 yLcSN0xeTbro68O/ctjfMbg/m5BfHT13x8QIEJ+TKy8TbrJJ6D+Ab4Tn8OFSqfvsIw
	 Q6bUkl0IGFD6Q==
Message-ID: <deb072638716e9978bd6381352cc721b@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250415004612-GYB29591@gentoo>
References: <20250412074423.38517-2-heylenay@4d2.org> <20250415004612-GYB29591@gentoo>
Subject: Re: [PATCH v7 0/6] Add clock controller support for SpacemiT K1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
To: Haylen Chu <heylenay@4d2.org>, Yixun Lan <dlan@gentoo.org>
Date: Tue, 29 Apr 2025 13:49:14 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_134917_520026_D1F0BEB9 
X-CRM114-Status: UNSURE (   9.67  )
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

Quoting Yixun Lan (2025-04-14 17:46:12)
> Hi Haylen Chu:
>    I'm quite happy with this version, as all the issues are solved,
> Thanks for working on this. I will give my RY and start to queue them.
> 
> Hi Stephen Boyd,
>   My plan to send a PR for inclusion to the clk tree in the 6.16
> merge window. But, let me know if there is still problem I overlooked.

You should send the code now. The merge window is when subsystem
maintainers like me send code to Linus, not when SoC maintainers send
code to subsystem maintainers. Typically folks wait until around -rc5 or
-rc6 to send it for the next merge window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
