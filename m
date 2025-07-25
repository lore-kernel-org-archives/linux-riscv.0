Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152EEC87FCA
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 23:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MB2XAOYbE/3lllGL4eChq+LdGqPp81l5mxi9UpYi8E8=; b=uJKJLnsEEwjIqo
	88s5y8TupwR0w3diEp+hHSncv9P4pKtBZU2opJqVnsBMfXk4MnYgVqCiT/FACL9HH/gyfPJEq+vrC
	v+OBEiNbdWXML8B/F7Y6xrrYVFST89pnCFxL1ctjQGKqEiAHJoMZ8Xin9F6BjdDEfmIRdPlQK39m1
	4MrRvke/f7uG3OOqm73hWdxRg0AMseeFPadqhIHEI/pEX4D8Kmr3ieORu+Bb79oe/tl9f16UZtKcR
	LF+pJwKPSov/ysK7iNZ6WM+ml3gYHpDCMmuBwYLdZ3WRE64H7CI/Xz/Mw2seJan0lESzrxy3Aaups
	oOMqUvETuzFD3DKmcGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufReL-0000000AqWS-45k9;
	Fri, 25 Jul 2025 23:16:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRbq-0000000Aq4E-1EOM
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 23:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0802D44658;
	Fri, 25 Jul 2025 23:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C281FC4CEE7;
	Fri, 25 Jul 2025 23:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485229;
	bh=05M8ulyHYJtjgB5a3mkfnq2IXUnP0UHQyHaCLEi3P+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1TTlpMhxsTkfiWNsXSXIsAlQ2LaMwbz0d0OP35IbvKH88v4CFLxRis05Zc4X2KVa
	 BPq2Q8rtU1iaMWz8fFtQsYRqV0MoaE3HaHvCRrFnOteTtQkN+eT0o3U99yTq+nodRp
	 dCc00z6T3/uw0JxmYKidhHtJij0SzUd4M28MHlL7JlBkJ9xOL25hurQ8pjjm6Y81VO
	 nJFptqVBfmioqkTki5OvWCe65VBxtETW2Jn2GZ8ThdZcyW7ltxYCbVmAZ9dhJQKYs7
	 1rxustsyztBUezz9uMv+mo48OsLDXuDEAkc6zLrpQQ5lPJC5WzNFeoM2LY7dfwYMS6
	 7Jbd2m2w7fNJw==
Date: Fri, 25 Jul 2025 18:13:49 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v1 3/4] dt-bindings: riscv: starfive: add
 milkv,marscm-lite
Message-ID: <175348522862.2010612.3490734950499726337.robh@kernel.org>
References: <20250724094912.253723-1-e@freeshell.de>
 <20250724094912.253723-4-e@freeshell.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724094912.253723-4-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_161350_350127_C75FECC2 
X-CRM114-Status: UNSURE (   7.34  )
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


On Thu, 24 Jul 2025 02:48:46 -0700, E Shattow wrote:
> Add "milkv,marscm-lite" as a StarFive JH7110 SoC-based system-on-module.
> 
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
