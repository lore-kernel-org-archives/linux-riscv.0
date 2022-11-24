Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ADEC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 21:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6t2kxvX4o96ljGRQnQNT0yq7vQEz2R71up9B8XN8Zw=; b=wVqvgrdVv4oQ7G
	7yl7S9LjHb5SDL7IETZ33dfSNST4yucL2uGK1nsRBb6blFIirZ16+zcHjlUQcql2nhkZA3x66/Mt/
	cShn8ZmjQIDENu/Tze4fnRBwf4el6hViP7CQrpavqXMyHaQpnvOhU55xk3CHjqn0QXucUGxdfoSyi
	OkANytBcy9TZEpfuuWcpnuvS9U2sYdgGdv/yZYZxNhqPzl9mhkxZMPYsocJRNSG0b8tectsWQQf+9
	9bXNnISPJ2P4OwwnQBSZZlR6Z9428JixQjnyvt5iR8ryfMN/Ykf1wZuAYNioY5iVtipBFE3OYxuH/
	/MB/So0TWxK7pDb7nJsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyJrz-00BbQE-NC; Thu, 24 Nov 2022 21:34:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyJrw-00BbPT-UH
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 21:34:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61444B828D7;
	Thu, 24 Nov 2022 21:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD20CC433C1;
	Thu, 24 Nov 2022 21:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669325690;
	bh=G7tq99AoCNw2Xyp3xJA4Kg8jdEf+0S2KwzmYMu05gZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1i92Ptk1p413+xx6gb1nSmnsGxUb5Xkqkp95JWpTQ9eg2pXbiOjU0XSXYIXL/MFL
	 01fvTBXkG5FiiW6jfAoKUuh7SrtGfcllYKQbX883f8ZpxgYw1R3djENPzwV9nA2hc7
	 2TE/mdLfC79dz4ROChtLoAqiV2pNt1YdmgY1cvNoAt9LKhg300t2OuGu4tufIzSDi8
	 uWmKuYlWndEQN13vqxr+jlL4t21d9sRYkSbny/xZ6LqGO7jA5p6AOtfQQvGXgJyyAP
	 MkEV7JuLXhsvIEk1fytfkIi+QioU2tyjhqxlrs/jVX8SyPLv+fl0sazHR+E60L50K+
	 g3SdkzCUNYv+A==
Date: Thu, 24 Nov 2022 21:34:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 7/7] soc: renesas: Add L2 cache management for RZ/Five
 SoC
Message-ID: <Y3/jc1g8uEHdyqwp@spud>
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y3/ivrvx4A+OImtW@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3/ivrvx4A+OImtW@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_133453_142125_4B8FA359 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, Nov 24, 2022 at 09:31:42PM +0000, Conor Dooley wrote:
> On Thu, Nov 24, 2022 at 05:22:07PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> > +	ax45mp_priv->ucctl_ok = ax45mp_cpu_cache_controlable();

> That function name is a typo, should be called ax45mp_cpu_cache_cache_controllable().


And so is my suggestion! s/cache_cache/cache/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
