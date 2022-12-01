Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85FEC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJpBCR/ClIzgKmLbG6vF8jodewsoWFr0Tr99R+wG2Ao=; b=FJIDns0jahz7RZ
	CfxZ6tcO0KP29RZIqKtz7o9k3Z4l7mOMXGQQ5Jq8pUomdaYfPPym9CRPArNsi2adQZ+ElMs9ozsp3
	PjNkiH4kM8A3ln9PRWK6WStihdwmCfYwR7NGAtIb52xdksL+WJOogZ3SN+9YtQ5yzj6U5ECGD54eW
	7TFCPLukD3CP/tIyBd56qmObUy+5jZx2G2jQmRhPViBNJnkjTeWL2HOTjctYYU20V9y+HVRKrCDCD
	jlQntVAvJWepEwivuPvEXAh1elulK/CBMhZ8hKzq5EkMQXoYb3k6TWiyCcdRR4jlJAd/b1j7d4ti0
	nCN3s8MoTEWOMdfcaydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nIp-008xWy-OD; Thu, 01 Dec 2022 17:24:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nIO-008xRq-AM
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:24:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 953FBB81FB3;
	Thu,  1 Dec 2022 17:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4B9C433C1;
	Thu,  1 Dec 2022 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669915461;
	bh=sBdC6gMYppArxc6aQxoo5WlFY+C7bzKXN4gd/SwCitc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ohNcuF4Z1/FWx48Nfr8g7i9mwrISOG+etxaVwpYLRxoN7+HZJwJG0J2xiWMEt071b
	 VIcvLDk9fuIlofQTlheSZGfUi9CgfkwylPVcDXMi9GHY/JWTsngLy6LT7f1q87FHep
	 3DfCtfInvX8ybxOHl3xjPAJjXk8uNW9wdiWZ9fj0Jsu5KenvmmE+kw30NxB87PkrJt
	 wQ6GdYCvm9BJ5dnGalqydKoRdAGwzsVoHB3ReUJD6y66yX+ZXJSeUIh062hISwFaA5
	 9H9E3aueURDYGezDC24R2glUryW/gtO/zOj7OFnRgR0/bdk2CxM9N4M/m5/ONMpq2C
	 3wS+/jeWSnvRg==
Date: Thu, 1 Dec 2022 17:24:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: Apply a static assert to riscv_isa_ext_id
Message-ID: <Y4jjQcDlRPZkNuHU@spud>
References: <20221201113750.18021-1-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201113750.18021-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_092424_537962_791147B5 
X-CRM114-Status: GOOD (  20.73  )
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

On Thu, Dec 01, 2022 at 12:37:50PM +0100, Andrew Jones wrote:
> Add a static assert to ensure a RISCV_ISA_EXT_* enum is never
> created with a value >= RISCV_ISA_EXT_MAX. We can do this by
> putting RISCV_ISA_EXT_ID_MAX to more work. Before it was
> redundant with RISCV_ISA_EXT_MAX and hence only used to
> document the limit. Now it grows with the enum and is used to
> check the limit.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b22525290073..86328e3acb02 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,8 +59,9 @@ enum riscv_isa_ext_id {
>  	RISCV_ISA_EXT_ZIHINTPAUSE,
>  	RISCV_ISA_EXT_SSTC,
>  	RISCV_ISA_EXT_SVINVAL,
> -	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> +	RISCV_ISA_EXT_ID_MAX
>  };
> +static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);

FWIW checkpatch complains about the lack of a blank line prior to the
static_assert, but dunno how much anyone cares about that. Lack of a
blank line here makes the purpose more obvious to me /shrug

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

>  
>  /*
>   * This enum represents the logical ID for each RISC-V ISA extension static
> -- 
> 2.38.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
