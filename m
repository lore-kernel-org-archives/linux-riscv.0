Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1976DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DIt33wKRGLfmLs2I97vIXqsXLCy7sQmIDkw+T+uZr4=; b=hIkxfk0wKvDkr5
	GMgVQWD8+CkEp1ykjYHY3tDMYfhGahv7V0WHgs5fWij8Z1L5ZF3eQriL/14OzhkzAIL9PzfK1NsSX
	vzNlh8MpqJGGKeY2T6BgzKlAQ+JFo5IYu11kQac6QXC6kNor2kGSBAchk6TUwD2KSiPxgnl7gOqJS
	QEIkGFIWBbJBByvmVeWIpq8DugRsB1ca8hXvWZIDazl9t2T87+ZNx1x68ZZsw/djpj1BcW2sDx3Pp
	1GLQj0YQQ3KxwDYMLIYwadW6isbHHR7bl/bDarwNJZY5dmL2lhBossi7Zk/DPIwGJvhJhRBpqeSbw
	F2uZPs+BrPtuE7akyIKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6vcT-000CpZ-B4; Thu, 30 Jun 2022 14:58:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6vcR-000CoZ-BX
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 14:58:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66D0162345
	for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 14:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4E5C341D5
	for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 14:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656601088;
	bh=UKnKVLsmwgsb6zWei4tbU3rznGJ4jcY7mTRLx0EKTYw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IJr8aXX+dS7I/19l275qbg2v1v2/pgmNqwdTAu9WXRr3I0HfNoHdNH/TrJeo8vs5q
	 YW4cqeu/t+8YUo/Pvksha/Z7OF71ogTt+nmFfpFmsUFmSpGAOMwjJBtWiwuzZdbFOu
	 IJqbxOk/x6kmqruhs58YfntZp/jIaUkcIkOjOjHsbb7bGsXUUWb1SjLW7GgXUfD+4t
	 ILW5O0+3qqtNEd/PTyFCIvXCE00tGnd3yMFTxbNJ9R/f7ZDgMDm4HYQBcbZZRQ/eKE
	 1Uh/AZb2046PqAlmPAsk4bbF+a0jelkNUz25fNTuHF2xxbgRXd0bVo86bB4sBV9bsI
	 S3TVhbfSTMlbg==
Received: by mail-vs1-f42.google.com with SMTP id j6so18561594vsi.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 07:58:08 -0700 (PDT)
X-Gm-Message-State: AJIora9cqtCbzsYI+119/vwlglrGTRcB1Diou/ku6BwiFEYSH9Xk4Hf8
	gPFkSdhkJrigtDgwUtgp68HYKa7BPwBmrmx6rQ==
X-Google-Smtp-Source: AGRyM1vNW2S6jnhHGtcMai38gl4vIeEdPFLFP61mSQwHnmBOcUGSMJCIWPBh/erjMpjEg4+79PX0q0Lho1NHKMjWI4U=
X-Received: by 2002:a67:1787:0:b0:354:6490:437f with SMTP id
 129-20020a671787000000b003546490437fmr8749302vsx.26.1656601087622; Thu, 30
 Jun 2022 07:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220629215944.397952-1-heiko@sntech.de> <20220629215944.397952-2-heiko@sntech.de>
In-Reply-To: <20220629215944.397952-2-heiko@sntech.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 30 Jun 2022 08:57:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJEPL1Jc8k5W4P8hgGzOXxgfqNKNqYuc0nLkCnV274TxA@mail.gmail.com>
Message-ID: <CAL_JsqJEPL1Jc8k5W4P8hgGzOXxgfqNKNqYuc0nLkCnV274TxA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] of: also handle dma-noncoherent in of_dma_is_coherent()
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wefu@redhat.com, Guo Ren <guoren@kernel.org>, 
	cmuellner@linux.com, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>, Samuel Holland <samuel@sholland.org>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	Drew Fustini <drew@beagleboard.org>, Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_075811_441437_6AC72D94 
X-CRM114-Status: GOOD (  15.61  )
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

On Wed, Jun 29, 2022 at 4:00 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> of_dma_is_coherent() currently expects the architecture to be
> non-coherent and some devices being coherent getting marked
> as such with the dma-coherent devicetree property.
>
> For PowerPC CONFIG_OF_DMA_DEFAULT_COHERENT was added which currently
> makes of_dma_is_coherent() always return true but doesn't handle
> the case of the architecture being coherent but some devices not.
>
> So modify the function to also check for dma-noncoherent and
> set a suitable default return value. If CONFIG_OF_DMA_DEFAULT_COHERENT
> is set the value starts with true and finding dma-noncoherent will
> set it to false and without CONFIG_OF_DMA_DEFAULT_COHERENT, the
> behaviour is reversed.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/of/address.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
