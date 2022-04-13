Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C87C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Apr 2022 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pybgsbe4XKbtL31SRC2pYRYrWfsRW2msMOS+nxp25jY=; b=3qiZrH70A0iAPQ
	0TNv5uyGq9tCCZAy8iz3yNdfoHZeibKqAasGS2AfXix9epqeXf4CTUsdkLD8cY9O+4Jatmu0zjQxp
	8o3pYOo6994XJufS8rA2Y1mwCXEqvdsq6ludjObc4B1ePWo6BFbUVmdF+QzZBKfbzOEqPDO7BHWYl
	MeqXmh5ukt2vOeM+3lo8TGHmYHiaYkPCbIBGCySVLBChTjxind1yDA4g/+7Ws63Qo1PuMcXw8v7Ch
	kDIAl1kcti2Q99wEFcnsyaut5ZO5qpMmpRFmw1qdJxHyNQGeRJJMUaGR8yleWQiONd2mlPQj0L4LX
	C9jfv8ICdqJaHn2TcN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neVl4-00Gs5Z-S3; Wed, 13 Apr 2022 05:41:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neVl0-00Gs3i-OH
 for linux-riscv@lists.infradead.org; Wed, 13 Apr 2022 05:41:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 47CB0CE20C7
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 05:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8E2C385AD
 for <linux-riscv@lists.infradead.org>; Wed, 13 Apr 2022 05:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649828490;
 bh=6fyXgGmnncP9RnqtMEVqhcHnnTV4ib2I9cy9gPtxqnU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UP8035ibOxc8zEcw0pPcAIIY+p1XKSIkPB4Y336Y0Dz0pFAikXra/CRVL2hha5Qbn
 AFSrPEZOT4kxqEcpkKwBH1tQ7WnJ8eADILuwh4QBtUNPDyk/+Kx3ok+ijop4kf8Ibp
 uJA19ExlQLMFwt/oYsQoo2G4QW2CtpYpmScKu/CIXyKjEOkWRyRc+2BC5f13i8FfBZ
 WN7OYLgBi1Kch2JJ8OIbE0Ax+LXB8XBb5ZG3nCWHKmhHx+JvtHKrD4vKIzexsKet7D
 DtgLXCr2AUY1aJsk3nlAIcI3mZgu4HCzw5vyk7z1RyJQky+XiqOoTohhrudI0V0adE
 SEBrlkUGlTV6g==
Received: by mail-vs1-f44.google.com with SMTP id e11so607843vso.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Apr 2022 22:41:30 -0700 (PDT)
X-Gm-Message-State: AOAM530adLCjXq6eVarV8h+9SWjsF/EkMMuTzcc+bXLwV+NCpkEc2ty0
 pRQsS4DJnvngk1PmK+ERo5wzVtQ4H5BNdNF46nE=
X-Google-Smtp-Source: ABdhPJzpwykgp0eknHlnFcTmKfeIedOUwl0K6MIZjruWMpZxjRLZgyIMm3a18FZ2AyDQBAOoFJrUtGGyWiQ3aXs8A/8=
X-Received: by 2002:a05:6102:1241:b0:325:6bfb:ab75 with SMTP id
 p1-20020a056102124100b003256bfbab75mr13574254vsg.2.1649828489116; Tue, 12 Apr
 2022 22:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220413030307.133807-1-heiko@sntech.de>
 <20220413030307.133807-11-heiko@sntech.de>
In-Reply-To: <20220413030307.133807-11-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 13 Apr 2022 13:41:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQOEQ3ukNT8+3uL_wM82xobLedJHrNk4DGTRzB3d_Ui8g@mail.gmail.com>
Message-ID: <CAJF2gTQOEQ3ukNT8+3uL_wM82xobLedJHrNk4DGTRzB3d_Ui8g@mail.gmail.com>
Subject: Re: [PATCH v9 10/12] riscv: remove FIXMAP_PAGE_IO and fall back to
 its default value
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 liush <liush@allwinnertech.com>, Atish Patra <atishp@atishpatra.org>, 
 Anup Patel <anup@brainfault.org>, Drew Fustini <drew@beagleboard.org>, 
 Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, 
 Richard Trauben <rtrauben@gmail.com>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_224135_169778_D3E5FB0C 
X-CRM114-Status: GOOD (  17.99  )
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

On Wed, Apr 13, 2022 at 11:05 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> If not defined in the arch, FIXMAP_PAGE_IO defaults to PAGE_KERNEL_IO,
> which we defined when adding the svpbmt implementation.
>
> So drop the FIXMAP_PAGE_IO riscv define.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/include/asm/fixmap.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> index 3cfece8b6568..5c3e7b97fcc6 100644
> --- a/arch/riscv/include/asm/fixmap.h
> +++ b/arch/riscv/include/asm/fixmap.h
> @@ -45,8 +45,6 @@ enum fixed_addresses {
>         __end_of_fixed_addresses
>  };
>
> -#define FIXMAP_PAGE_IO         PAGE_KERNEL
> -
>  #define __early_set_fixmap     __set_fixmap
>
>  #define __late_set_fixmap      __set_fixmap
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
