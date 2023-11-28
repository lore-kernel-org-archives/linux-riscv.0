Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD06BC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Nov 2023 03:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbTgDUsdHz06E7YpZ3KrSqGTQIjcpAFL6lU7j5911pM=; b=o5QqoJ5KYvZDfJ
	LDk/q1Ldtj3GHRsVdZl6CQ3SGrxxpuw1CF/KgCIr8bgDvh2uG1c64rGoY1u9viIkX3e64cfm3bsGg
	VsTFi4b2ZTn04uwMYCF9sEK3HRyhqh2dD1nPTJE/wTCsmsqhTtVj6WFe8XU7mKhgxL1PQ2f5bmR29
	LLQyShTeBrpoG3FVS2nt/gcacx2dzDn+IL9vKCueI3SH7k5yKKKEnFrBzd5Yrj7g/Q9mTK8KFq5xj
	2tkkjvCdBi6dp+USPo9r8uchHJf0xSJlyh8o77ZJ/jk0+I26vsLJBZGWW8V2PIBzzIZsUQzw1Q2cG
	GXMBPm2gPR8LMqcYVXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7p2L-003zJo-1d;
	Tue, 28 Nov 2023 03:45:25 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7p2I-003zJV-0t
	for linux-riscv@lists.infradead.org;
	Tue, 28 Nov 2023 03:45:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39CC8CE1300;
	Tue, 28 Nov 2023 03:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3E6C433C8;
	Tue, 28 Nov 2023 03:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701143119;
	bh=mAazPanOHbBf1EpbjCncZ4WNSuavZPxp41OW/CwwxRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtlLnnuUM2YaMmNqX508S+C7Qp+iKil8+8sWjiu/9VMk7LiQipfCRUzaBwJYhgplP
	 dZxLctoALIyGJzS7OpEHbiEIklOIiiU9dxVxgoE+t5kv5YSKsSsPg2mOl7GCh5gnXj
	 Q0O+zyuy0QM9VvFLnrJlDP4FHgDOq++v/yWGy3tEGRZcz52gGfFhwOhpxaOlGEvvWw
	 6e6k78IR+guspkCWWf9/iIYFOiCSFAai5hVGBbbRFAtypsZSnj2WK5e2+TDBY1FkwB
	 5rzKXkYdsaUfYofS5b66O8u4yyzmq5Iy2vK7aMkamVMVXq3SG2VL9gJ53d+TgcsSuy
	 8tEgq1ZtFO2cw==
Date: Mon, 27 Nov 2023 19:45:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, ardb@kernel.org, heiko@sntech.de,
	phoebe.chen@sifive.com, hongrong.hsu@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 01/13] RISC-V: add helper function to read the vector
 VLEN
Message-ID: <20231128034517.GE1463@sol.localdomain>
References: <20231127070703.1697-1-jerry.shih@sifive.com>
 <20231127070703.1697-2-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231127070703.1697-2-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_194522_499918_48B2A8AF 
X-CRM114-Status: GOOD (  13.12  )
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

On Mon, Nov 27, 2023 at 03:06:51PM +0800, Jerry Shih wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> VLEN describes the length of each vector register and some instructions
> need specific minimal VLENs to work correctly.
> 
> The vector code already includes a variable riscv_v_vsize that contains
> the value of "32 vector registers with vlenb length" that gets filled
> during boot. vlenb is the value contained in the CSR_VLENB register and
> the value represents "VLEN / 8".
> 
> So add riscv_vector_vlen() to return the actual VLEN value for in-kernel
> users when they need to check the available VLEN.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
> ---
>  arch/riscv/include/asm/vector.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
