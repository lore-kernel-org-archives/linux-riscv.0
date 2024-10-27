Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A5CD1358A
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 23:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhgEdUq25UPJ3qjitoqrmi0gg22D/stTfVq/HCLM9MA=; b=fk5NeV75cTWqa1
	mnKAlBZhouWWnBmoflso5ArC5iyAYKrDBAMj6yRfN8437mKTfEuX97tdCiE04/tZf5RWPvNCHjeGJ
	k7i3wQejIsjYu+X/QhzkFOkPvUlLsnC1ix56RobxXE1n+0a7qBB0JPX10tDkP0VzjZfxZq2SDw5ti
	KhAdkMJc1PtF1bySlG5mcMkWWjSQvekwnoyFYglf9zub/8YAlqJ7/IxfeoPEWg7NwRzzPKbLZuefR
	zpisi9MqkNKRS8Yho6iT1oLyOWgolL0DMZnVTPUXm8/NJ9tuECX4jG0GpIW/pvxydKzcxBJsDmO9p
	FewjsO9/r6gUUt10B+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Cja-000000094Xq-2AP5;
	Sun, 27 Oct 2024 23:31:46 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5CjX-000000094XO-15rH
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 23:31:44 +0000
Date: Mon, 28 Oct 2024 07:31:39 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
Message-ID: <20241027233139-GYA86372@gentoo>
References: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_163143_351999_EBC574A9 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: Meng Zhang <zhangmeng.kevin@spacemit.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, soc@kernel.org, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

HI
On 07:04 Mon 28 Oct     , Yixun Lan wrote:
> Add myself as maintainer of SpacemiT's SoC tree, which
> suggested by Conor [1].
> 
> Link: https://lore.kernel.org/all/20241018234615-GYA2124001@gentoo/ [1]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This will setup proper maintainer info about Spacemit's kernel tree,
> which should help to take soc and device tree patches, and send the
> pull request up to Arnd's soc tree.
> 
> I asked Kevin to host the kernel tree under SpacemiT's account
> on github, which should help people to get access more easily,
> and promote the tree a little bit.
> 
> I could take this patch through this spacemit's soc tree if no objection,
> of cource, after got ACK.
> ---
> Changes in v2:
> - drop RISC-V exclude dts
> - add mailinglist info
> - Link to v1: https://lore.kernel.org/r/20241023-00-k1-maintainer-v1-1-c06b791cc2ee@gentoo.org
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9659a5a7fb3347d649855992a559e3526d18443..88fe4ca801537eff7eb5001406a611ef80632b5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19814,6 +19814,15 @@ F:	arch/riscv/boot/dts/thead/
>  F:	drivers/clk/thead/clk-th1520-ap.c
>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>  
> +RISC-V SPACEMIT SoC Support
> +M:	Yixun Lan <dlan@gentoo.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +T:	git https://github.com/spacemit-com/linux
> +F:	arch/riscv/boot/dts/spacemit/
> +N:	spacemit
> +K:	spacemit
> +
strictly, I should put these before THEAD section, to keep it sorted
I will fix this while applying the patch if no other comments received..

>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
>  M:	Jack Wang <jinpu.wang@ionos.com>
> 
> ---
> base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
> change-id: 20241023-00-k1-maintainer-46eb3f31e6f2
> 
> Best regards,
> -- 
> Yixun Lan <dlan@gentoo.org>

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
