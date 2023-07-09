Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59D0EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gER9oLEzeAUXnLpbzU2517hkV1byGfH8bTWQ3+03D9Q=; b=f5JHvz3tRLXVMq
	0LZfRTrhMCG+hmyiTmuTFEe4GIov+X68cHEcS9+yjKS4AWeAsJ4DrTYRptnJvjgv+oqD8FYaFrFIY
	14tR9M0cpv5A5M2viylsQe3bRUGluxqKVzEVMQyRBwduzKOFWe1sMr7BwNezBadz9jrfMn2LylQda
	NzIZuDZW93m79MirMvhZlJxNftH86Yd6ZZfmgh/iGPeh+Crvc7+WNLN3H1b8MfOqjWEcgv1dxb+s8
	R/r0PH/AQ+PEwwf9iRtt7OvqgAkbVR+21iN8vB600I4z3pKUSD6FVLvPVkTgDGCdifYGk4LDlU7xB
	c49Re5CpswFnmhQwSJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIScw-0091dp-0J;
	Sun, 09 Jul 2023 11:30:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qISct-0091d5-1d
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 11:30:52 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko.stuebner@vrull.eu>)
	id 1qIScn-00020u-EA; Sun, 09 Jul 2023 13:30:45 +0200
From: Heiko Stuebner <heiko.stuebner@vrull.eu>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Atish Patra <atishp@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, Jiatai He <jiatai2021@iscas.ac.cn>,
 Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Date: Sun, 09 Jul 2023 13:30:43 +0200
Message-ID: <7542713.EvYhyI6sBW@phil>
In-Reply-To: <20230628131442.3022772-2-sameo@rivosinc.com>
References: <20230628131442.3022772-1-sameo@rivosinc.com>
 <20230628131442.3022772-2-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_043051_549120_3F0A08F5 
X-CRM114-Status: UNSURE (   9.69  )
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

Am Mittwoch, 28. Juni 2023, 15:14:33 CEST schrieb Samuel Ortiz:
> From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
> 
> Parse Zb/Zk related string from DT and output them to cpuinfo.
> 
> It is worth noting that the Scalar Crypto extension defines "zk" as a
> shorthand for the Zkn, Zkr and Zkt extensions. Since the Zkn one also
> implies the Zbkb, Zbkc and Zbkx extensions, simply passing the valid
> "zk" extension name through a DT will enable all of the  Zbkb, Zbkc,
> Zbkx, Zkn, Zkr and Zkt extensions.
> 
> Also, since there currently is no mechanism to merge all enabled
> extensions, the generated cpuinfo output could be relatively large.
> For example, setting the "riscv,isa" DT property to "rv64imafdc_zk_zks"
> will generate the following cpuinfo output:
> "rv64imafdc_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr_zksed_zksh_zkt".
> 
> Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
