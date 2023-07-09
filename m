Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6635FEB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 14:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkk502oJESutCSV8x7vJmify/+iPVUDUPBQOS0rvnnw=; b=0PjU0U8gdi6039
	OrGZ8XuZT02lA+QG4ETE7+ELPEuU8y6XQ7ZRUkQF6MjZGgTLGkGQSU1tg95k9lJO2GN6oOGRpLllr
	RVZuyl/2YG2986wrhD0SIbOy1mvFDCOSgii5+wt5Ch4kgq87f95waiQt4XsiErhZNhUUMdrwIsEiT
	VXjXs5GzNiVXAn1osm+2ST1StgTWemuDUAPVjCl65EbvcshvInTnpWtSYXozWdOYnQm3M2x5+qr/7
	9Hr0k8L2ngtN9YVovLKBOGdc7Qf7L0z6et0Crwtk/Rui2MBqDEkVpCG9JiUsLNpwdKFKBxv55DVpT
	jjVuCSc5ZSro/nvv2XkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIV5n-009Ddb-28;
	Sun, 09 Jul 2023 14:08:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIV5l-009DcA-10
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 14:08:50 +0000
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qIV5j-0002d9-Cr; Sun, 09 Jul 2023 16:08:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: "Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Atish Patra <atishp@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Evan Green <evan@rivosinc.com>, devicetree@vger.kernel.org,
 Jiatai He <jiatai2021@iscas.ac.cn>, Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v3 1/4] RISC-V: Add Bitmanip/Scalar Crypto parsing from DT
Date: Sun, 09 Jul 2023 16:08:46 +0200
Message-ID: <112597086.nniJfEyVGO@phil>
In-Reply-To: <20230709115549.2666557-2-sameo@rivosinc.com>
References: <20230709115549.2666557-1-sameo@rivosinc.com>
 <20230709115549.2666557-2-sameo@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_070849_345495_0E487606 
X-CRM114-Status: GOOD (  10.52  )
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

Am Sonntag, 9. Juli 2023, 13:55:43 CEST schrieb Samuel Ortiz:
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
> Reviewed-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Samuel Ortiz <sameo@rivosinc.com>
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>

Signed-off-by lines should be the other way around (Hongren Zhen first,
then yours), otherwise

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
