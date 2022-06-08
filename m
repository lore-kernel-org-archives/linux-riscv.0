Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FA1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 02:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mp+0304tGmX8twxac7X1+Q3aBE3ax4HUdcbo4nxMfNg=; b=mhzenSQ4GmfUIy
	vmhWA9vJAJmPmHc7SVrYzTcoNhw68jgES7xfW0s0feQRkHTDXT7LzWSzAuP+wqegsq87sgfcNMwmr
	kLu5VtEgDLDcmi6/MNHSy3KXI9WbBF02MBI6D8jljPwQQ7QSK1tDDeFaNvzc4wNg2MmfU1pPb6G0k
	NPzxJoDTThIp8yqIwYSTH1giP4DBruaHR0oWeP3SbCjpRBYwVrmw+eTUx/m5zKdPKaQ+F0therKx6
	DuhQiRdJwW86m0bGXRe1FyetrJAAA1/I1mFjD5LkfW5FmSunIjupWogcu95SEzX49O1TFcNIwueY7
	1ZHOtWYtjgZRmw+/Wtrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nylR8-00AOMW-NC; Wed, 08 Jun 2022 02:28:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nylR6-00AOM7-BF
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 02:28:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3EB6B8256D
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jun 2022 02:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621D0C34115
	for <linux-riscv@lists.infradead.org>; Wed,  8 Jun 2022 02:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654655321;
	bh=FrteEuZTwseBpaOH5Z0G0HTM9+1Of+/l5CBo2sRiR5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y+dDRfYUdyvv3sl1DfVOEShaUuGxX8ZHPT3lROQDoKQZFCaoqqMtZzTCv2BcIXl49
	 DaXBg8/1m4552ddyycjiGtwcdiLYmBrfog4XhfYspS6r3wnEKQn/qg4NkRvnlzDWOV
	 bvVrCQczBm7lgkQjo6HfT7gCcsWo0zQdHNon3CD4LeXx+PHqaL1NEX7/K+y2lmujGB
	 wyLIj0hVgvkHi+slSFFg0Wor82LTfFDoCpwmfT42nEDbXUxOTxA8sjxTqGLin8vZ0N
	 M0UFjFzhq6atSlI6VBqduGpw1wcHFn4dOhWNbcUEqGmzze9V72bpPjuy/agE2hw1ws
	 GodXajwXfdoJA==
Received: by mail-vs1-f44.google.com with SMTP id d39so18201253vsv.7
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jun 2022 19:28:41 -0700 (PDT)
X-Gm-Message-State: AOAM530vjNK8bNodZ38Fe6ByeRdP/DzmnLet6MiAmYisuPxLlCVq0qn8
	soEPZ6RFGsWdQWOpHSdt8nEpbiiu7Fu5m/WfDc4=
X-Google-Smtp-Source: ABdhPJwLnvXf7DWVcfNLpW3GLoBUN9fMmsH11OmVM3fqAzjKjQUvBzbGNFbhbe5DV3Bbqcd3aVAxVQPSekYGu7L2vQE=
X-Received: by 2002:a05:6102:3562:b0:34b:9e99:1bfa with SMTP id
 bh2-20020a056102356200b0034b9e991bfamr10191231vsb.51.1654655320384; Tue, 07
 Jun 2022 19:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220607143059.1054074-1-heiko@sntech.de>
In-Reply-To: <20220607143059.1054074-1-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 8 Jun 2022 10:28:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTMFPf63_PGUrCLZt3xT3MDG=DZ8dwE8530f5N57yAq=w@mail.gmail.com>
Message-ID: <CAJF2gTTMFPf63_PGUrCLZt3xT3MDG=DZ8dwE8530f5N57yAq=w@mail.gmail.com>
Subject: Re: [PATCH 0/2] riscv: Add macro for multiple nop instructions
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_192844_570469_EFFA4B8A 
X-CRM114-Status: GOOD (  16.28  )
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

Just a safe good coding convention point.

Reviewed-by: Guo Ren <guoren@kernel.org>

On Tue, Jun 7, 2022 at 10:31 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Some cases need multiple nop instructions and arm64 already has a
> nice helper for not needing to write all of them out but instead
> use a helper to add n nops.
>
> So add a similar thing to riscv and convert the T-Head PMA
> alternative to use it.
>
>
> Heiko Stuebner (2):
>   riscv: introduce nops and __nops macros for NOP sequences
>   riscv: convert the t-head pbmt errata to use the __nops macro
>
>  arch/riscv/include/asm/asm.h         | 15 +++++++++++++++
>  arch/riscv/include/asm/barrier.h     |  2 ++
>  arch/riscv/include/asm/errata_list.h |  8 +-------
>  3 files changed, 18 insertions(+), 7 deletions(-)
>
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
