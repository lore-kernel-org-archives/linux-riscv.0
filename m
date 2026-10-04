Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682A8CA5FCE
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 04:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4QLa5HZjrj/Y1WOwz4kPHYqEEz5WbOgi3CIlzQgGp0=; b=Wt74WBgYwVDHuN
	vsFuWoN4H0sTHscRFzN4ZlpMFipXayhU7t4dlVTL8P0W7LAWG1OGbT3wI0Uz1eJInbu/ds9XDnXIO
	CXWfvzyUZT1bqrw6ZYvmrv0Hkp6pC5n2hneugXHe4e5vz+MqkjsLPEBgS3L6IyJYCwSzOcpnP/mDP
	x2My223llAcyyGP3eE9VXJTLJgZi6ctKUQlPrTzkCPZ9zmIzyuTmcJwM5NzcKu7LFNh0ACGAVuTXc
	95gDEGUNJDnm8eQ/xKpbFdwBpgqx12oQPx1pHUEA3RDCkJ9J+gjeziHfD7ouT/GKVqjXS9qefNFzH
	6MXqXl7C+cphYQ4xOWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDDSq-0000000EJxU-25ek;
	Sun, 04 Oct 2026 04:04:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDDSo-0000000EJxO-2Bfs
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 04:04:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43C0F60052;
	Sun,  4 Oct 2026 04:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B82B1F0089B;
	Sun,  4 Oct 2026 04:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791086676;
	bh=LFMGNCzQ6VDQ7rTQPtQ7KAL/3enkAsag5RFuwBCEoII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RT0yjuoWgHPCd8TZP7Q7kZXtHH2WmCfPmya7GyowxxUa+BV7z+oAvEU8x1b5Axx+k
	 nM3s7vBcKZJx8gAWVWO+Ls4wXuqOMKvRaOfo6SaKhZCnQxg04eVMIEatLGAmd9BX0R
	 MHGZeu/3Hs7jga97RCmcHPu9Tx1Feg5zMZybT29RXGqERpngy/vARB3xdscR4oogH+
	 EfcPOMW94Qxv8BaxBUnFjC3XSDyIn0tTaFk3KwFSHu0hkfo/I+ue70aAtxN/8yzfEB
	 +VHweB38loOHRBHSjzDUY1kPNW69wVDbBbrW6/mgIJaRQPrV04DRxmftxkMbm4DOQh
	 2OXxsdfcTcabA==
Date: Sun, 4 Oct 2026 11:44:38 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: fix RVG_SYSTEM_CSR_MASK width mask
Message-ID: <asHLphURjbEyu6j_@xhacker>
References: <20260911194233.3379532-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260911194233.3379532-1-aurelien@aurel32.net>
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

On Fri, Sep 11, 2026 at 09:42:33PM +0200, Aurelien Jarno wrote:
> RVG_SYSTEM_CSR_MASK should be 12 bits [31:20], shifted down by 20 bits.
> Replace GENMASK(12, 0) by GENMASK(11, 0).
> 
> Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/insn.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index c3005573e8c9..ad348d8b8857 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -142,7 +142,7 @@
>  #define RVG_OPCODE_JAL		0x6f
>  #define RVG_OPCODE_SYSTEM	0x73
>  #define RVG_SYSTEM_CSR_OFF	20
> -#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
> +#define RVG_SYSTEM_CSR_MASK	GENMASK(11, 0)
>  
>  /* parts of opcode for RVF, RVD and RVQ */
>  #define RVFDQ_FL_FS_WIDTH_OFF	12
> -- 
> 2.53.0
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
