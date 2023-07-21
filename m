Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC76DC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 05:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Te22V0VS6Tau0n0S3mU9UeHradvTCvTKxDxD4UQ9VF0=; b=Xwhuc8RS25pks9
	aLbNjNsL1C3iLnJxe51mkZMP1AwpSKFev9DlSs55jb+8Ybvfy/hJN3WOYpSQEuATX0UJ7KajL10FQ
	O9T1GXpIpQAgWzSqltVrZeyPDsakn40t+29d0teXu0NRlQACKocjjaZzbODmhamg5mEOiLSfBerqC
	V3b1hp10GvYK5Z4qIcSKrj5vN7r6o0cvcn7KO/2MniiL9PaxPBKPqt8BaxC1lc8RGAs87b5TQqqXL
	CphaAg6Wk6b8+KlZaWr3ms/Hcwc+m//XUsEelJ+/DWO9nymXQeOl5tSpc5EJQzH8HOE2DgFnPOpuy
	4aNHZXkJmsK1A7JPA0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMizy-00CxaX-1R;
	Fri, 21 Jul 2023 05:48:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMizv-00CxZx-2T
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 05:48:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01CFC61141;
	Fri, 21 Jul 2023 05:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D86CC433C8;
	Fri, 21 Jul 2023 05:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689918494;
	bh=ahkbJ+oFoqBo9wkehSm+Ve4k00bHUAb6i7Wno4IX6Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LOZhr7pfzyu3qz3dL57XPyWiK6pGctPlMOpLvIjeU99BEqoj84ejDo8SeZbGpmzmY
	 g+sn0SuRHWCf2yKoF1VLYxFRFGBeegFJMq71mrfu/pwq02Y0fJqWZ5d2YwcoKwx73g
	 qMXj2iy2JFGYSLyf6IG3vxhXIaRsbBSPDGvN3Iv9Nu0t+/EeuAJTrQF0P4yoYhd6bk
	 xBQzvwBwn/aSymiDVnzMhxaEa5OF5v/CPUvd6yRGeCKtOXetPfcwZlpUWold+EszSe
	 g5Egt94NgK97Upf9lc6SR1XewlxKGbBiHS+EEz+T7KCBCG2cNqzvx2mYtvABy4vJAO
	 kdgfU25pLczMA==
Date: Thu, 20 Jul 2023 22:48:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 04/12] RISC-V: add vector crypto extension detection
Message-ID: <20230721054812.GE847@sol.localdomain>
References: <20230711153743.1970625-1-heiko@sntech.de>
 <20230711153743.1970625-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230711153743.1970625-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_224815_856951_56FAC489 
X-CRM114-Status: GOOD (  18.36  )
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

On Tue, Jul 11, 2023 at 05:37:35PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Add detection for some extensions of the vector-crypto specification:
> - Zvkb: Vector Bit-manipulation used in Cryptography
> - Zvkg: Vector GCM/GMAC
> - Zvknha and Zvknhb: NIST Algorithm Suite
> - Zvkns: AES-128, AES-256 Single Round Suite
> - Zvksed: ShangMi Algorithm Suite
> - Zvksh: ShangMi Algorithm Suite
> 
> As their use is very specific and will likely be limited to special places
> we expect current code to just pre-encode those instructions, so right now
> we don't introduce toolchain requirements.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/hwcap.h |  9 ++++++
>  arch/riscv/kernel/cpu.c        |  8 ++++++
>  arch/riscv/kernel/cpufeature.c | 50 ++++++++++++++++++++++++++++++++++
>  3 files changed, 67 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b80ca6e77088..0f5172fa87b0 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -64,6 +64,15 @@
>  #define RISCV_ISA_EXT_ZKSED		51
>  #define RISCV_ISA_EXT_ZKSH		52
>  #define RISCV_ISA_EXT_ZKT		53
> +#define RISCV_ISA_EXT_ZVBB		54
> +#define RISCV_ISA_EXT_ZVBC		55
> +#define RISCV_ISA_EXT_ZVKG		56
> +#define RISCV_ISA_EXT_ZVKNED		57
> +#define RISCV_ISA_EXT_ZVKNHA		58
> +#define RISCV_ISA_EXT_ZVKNHB		59
> +#define RISCV_ISA_EXT_ZVKSED		60
> +#define RISCV_ISA_EXT_ZVKSH		61
> +#define RISCV_ISA_EXT_ZVKT		62

It would be helpful if each RISCV_ISA_EXT_* definition had a comment that spells
out what it stands for, similar to what arch/x86/include/asm/cpufeatures.h does.
I know they can all be looked up, and they're sort of mnemonic, but it would be
helpful.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
