Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A247DCCF9EE
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 22:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCO1B/ZOg3YVp5DgRNMHDwEThWSNIXtVAOtcjW/Xat4=; b=HClkKgt8mEHdDS
	oASeTwC9BJmLHgtgs3DJIKzCpi3+L86ezqs+OzQAcfaTK02rETzI0Z8ZSZThAWjkVB90c9Yw7znPg
	G7BqVNyvTC/9bcdsI/OLVKDS98uKBYFM4gLPi/KmkdG6CdI09M4tqfjKW/wGN7B/gSCJiw+vv0Rz8
	RsOn920THM/rIX+eZX2oiR90QKISQAWXXPe/LuY/WKtcYKxmp9bZWmhZyQ5mAx8GSMjAK/hkPnxCo
	/2UtF04VTrPN4BxlEzJwSL+NtGCaDThjbPZZGYhhp1CpCmhP9NsHkLsTCed6mW45nwFzsY9Nkyjic
	I9+XpwQBV318Wp4OOGjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEEjs-000000038IB-3Com;
	Wed, 29 Oct 2025 22:33:56 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEEjp-000000038Gp-0wcr
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 22:33:54 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 42DF2340EFA;
	Wed, 29 Oct 2025 22:33:47 +0000 (UTC)
Date: Thu, 30 Oct 2025 06:33:37 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: fix comment typo
Message-ID: <20251029223337-GYA1549833@gentoo.org>
References: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251029-b4-fix-ccu-mix-typo-v1-1-caddb3580e64@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_153353_293988_34E553D5 
X-CRM114-Status: GOOD (  16.40  )
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

Hi Encrow,

On 00:05 Wed 29 Oct     , Encrow Thorne wrote:
> ccumix.h was copied from ccudiv.h and the comment after #endif was not
> updated.
> 
> This patch fixes the incorrect comment to match the filename.

Just describe in imperative mode, see
(since this is trivial, I could amend it before apply the patch,
so no need to resend)
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> 
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  drivers/clk/spacemit/ccu_mix.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 54d40cd39b27..c406508e3504 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -220,4 +220,4 @@ extern const struct clk_ops spacemit_ccu_div_gate_ops;
>  extern const struct clk_ops spacemit_ccu_mux_gate_ops;
>  extern const struct clk_ops spacemit_ccu_mux_div_ops;
>  extern const struct clk_ops spacemit_ccu_mux_div_gate_ops;
> -#endif /* _CCU_DIV_H_ */
> +#endif /* _CCU_MIX_H_ */
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251028-b4-fix-ccu-mix-typo-038c19fe30c4
> 
> Best regards,
> -- 
> Encrow Thorne <jyc0019@gmail.com>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
