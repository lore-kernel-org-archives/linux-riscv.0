Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0F3C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 04:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OisMX6xo2YPI/BIvTj65DQyQS42JVAeFVlPeVp4jd7A=; b=OfssSqKkx/aoQK
	3dbpMxDME1AMN/wPorY+wczVQ/qSm/ShdZPtosVzUME1vUK5AGxSxGnpamuSi2+9Z9oTgJp6nRn5R
	i24jkw6iUT6/1j20Mqu3t7a4+RMZKt8HFIunb+BBt38UN8uQ7oAIhkdK38/U32OQQiOEvlYeCu9aD
	bhk1x7HyxzsuGZC2b/ZZXe8r6TXhM9MgrRwyJXUelRotfXfIQmlSbtvcvFLXKt7+UdmR0B8HX9eOy
	lpd+P/xqDM7YzCDwpvmQd+RH9CJaQWp6gFlpqowJSmkZFjINDNhc7NrfWi5pt173eg1JvifDxKwEO
	dWcbQa058C5OH3qb6pGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE0xc-0000Fx-7r; Wed, 20 Jul 2022 04:05:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE0xZ-0000F3-Ga
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 04:05:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 947CF611D5
	for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 04:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DF3C341CF
	for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 04:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658289912;
	bh=CzFHa1T2nBUH30PXVGgIPY9OIkGOqT8aynKW1aD7qLc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HI87q3/M4gCZ9jBIvGGhF1Cc19IjYDyq2bfCREVi51oKn1oN7vub71W6kyRIn8jS7
	 xg+tQODt+cRX12s+n9iPyLZW9RcSQTRzWVAay9Ub8FacYMElthv4PZTT0n7nldy00i
	 ARi/NMnHONmHPBqa9fWH8pAIh+5cZNmVETSrk+OYtR0J3+IeLI34kFkyTlpW2arb5s
	 D+/8dzJ8D9s2OISmaUBgrGVoksdsZ0SdJ1Z9L+u53/euGdCyZf2GuSlQosIK5V607r
	 83PO5h4XN0zTcVsFu7Q/TSexSWPzApMRwFsSg3eEJsOwAOBsj+W7ErviLWI/YTGaQP
	 HSaNglD7b2RBQ==
Received: by mail-lf1-f48.google.com with SMTP id e28so28162534lfj.4
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 21:05:12 -0700 (PDT)
X-Gm-Message-State: AJIora/ZfvgZsMemJrz3f8XZTdFGpAteV5VFNRQu0L/gLZ9P3YsV+FLx
	1GkFeVDBv6D+mVG2RCRzKm347KKWoIpOUYBDrJQ=
X-Google-Smtp-Source: AGRyM1uLXnx3xaLP+f7GMaqugMVNJKZubvmvNn+ehrZ8uHGY/mZSRSbOBGmfq7suVUtc1uF41pvQvBjUHj6+nKWIsdc=
X-Received: by 2002:a05:6512:1394:b0:489:6a91:272a with SMTP id
 p20-20020a056512139400b004896a91272amr18121223lfa.424.1658289910426; Tue, 19
 Jul 2022 21:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220709014929.14221-1-rdunlap@infradead.org>
In-Reply-To: <20220709014929.14221-1-rdunlap@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Jul 2022 12:04:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR27PLRoZGdy_D1YvgCdWdKFo_QVNymML5794mzZ7Ub9Q@mail.gmail.com>
Message-ID: <CAJF2gTR27PLRoZGdy_D1YvgCdWdKFo_QVNymML5794mzZ7Ub9Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix RISCV_ISA_SVPBMT kconfig dependency warning
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Liu Shaohua <liush@allwinnertech.com>, Heiko Stuebner <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_210517_597828_68389109 
X-CRM114-Status: GOOD (  15.40  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Sat, Jul 9, 2022 at 9:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> RISCV_ISA_SVPBMT selects RISCV_ALTERNATIVE which depends on !XIP_KERNEL.
> Therefore RISCV_ISA_SVPBMT should also depend on !XIP_KERNEL so
> quieten this kconfig warning:
>
> WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
>   Depends on [n]: !XIP_KERNEL [=y]
>   Selected by [y]:
>   - RISCV_ISA_SVPBMT [=y] && 64BIT [=y] && MMU [=y]
>
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wei Fu <wefu@redhat.com>
> Cc: Liu Shaohua <liush@allwinnertech.com>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -362,6 +362,7 @@ config RISCV_ISA_C
>  config RISCV_ISA_SVPBMT
>         bool "SVPBMT extension support"
>         depends on 64BIT && MMU
> +       depends on !XIP_KERNEL
>         select RISCV_ALTERNATIVE
>         default y
>         help



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
