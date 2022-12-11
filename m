Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B139FC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Dec 2022 17:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqrpPcFkLn7cc/6hUvr5spmP7BUlrPeeNhuS4OMjc0s=; b=TqH09LonDxVIiL
	OSXrLQAoLljL8uer9XAq8Q3oAEO7isMjxhIyjLnDuuvX41Dg8YBbz5HXXPsKmp/Goa+zGzvv/PFvO
	ckC111Iv8TbWJMzvRvL19x2sh/KpoYxeXHeF8KBX5IW519e7zH7y+WdYynCgqQV/+z/3FkSPj4I87
	TXfGScUsWpLMho4+hveyQerKPj4D4/PrWWUxGWJsMrm7t3yCYmoHytY7XT6PuAXTPA7z2yPjPzStL
	w+uwsybjai3ossZNsNe0TZ/cK3mXdcQr67dqPooVy/GdH4lbndbGujjXCItmCp6mndD/pl67slWlk
	misk+PvDkc09P9geq9KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QEY-002gXC-Ro; Sun, 11 Dec 2022 17:35:26 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QEM-002gTt-LV
	for linux-riscv@lists.infradead.org; Sun, 11 Dec 2022 17:35:15 +0000
Received: by mail-ej1-x634.google.com with SMTP id b2so22664532eja.7
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 09:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xl//Nc14cVSxMPd9RA+3veYxqpV+oaB6loMUaYetDtY=;
        b=BhJQwwBqjA8J9lZkg2zFjRaLYp1MUdS1fhvPHOYd5CDqHgp0wut4UN/BEVSh8lcOyX
         JtW2ZxRYan2eoabo/ZDwUhyIfVxGLSO8NLHd/EkcuY8RjH1WWUxeUTgQdiPAIJcR+bHj
         Kac9AVfAdhflTS1+gYZfpjMv3UjMYXCLtJAcZyb2ctMePuYBrwtQlnyfz9xOOilhxwHG
         42AH2HyikXBem4JLEaCAeRnBPEPYdsWI5JfTKsUhQrcd+wntkL2BWlhVpJuefAYh+yDT
         ZYI0bi0q99i0Bn/Q8UJ9QdTayZVTxqY3jOPfuMw8zN20NktqrYxeI63+Bup7PBWv8c1u
         o5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xl//Nc14cVSxMPd9RA+3veYxqpV+oaB6loMUaYetDtY=;
        b=C35WhpEL9rnJntk+sxKTqYEA30OWcSiTydfXkKISdt3aOaswCaqarxv1W9DyBvNiX2
         NvIOjtcyFbs0r/zK/TN8uBcnXk/eRlNSz2HhFS1b6bdcFdSf3XXvYO1wThRcwqHAVOCg
         Zc+vULDZJC/931J2xwGH+x1IUJ/CJzBh7FqfRbeoVGd7J1HZYDkPUvnoOl36KcjU5qay
         Ea/xHWFoMqxp0/1CHBjSbSbVv2UBz81tiOII+Fi7iTD+yCdwxByIOGGXCql5theyup7T
         cmBnQLA3QCYJyfsD8UhDBoqMUnlHyYjkMxve2tvkM1FnIwjVmRgHw4NUGTevuH1Gx08j
         6JCw==
X-Gm-Message-State: ANoB5pkSSA76LyCtuhLKUmL7hKXZjGt649aOubRBqGR5P9FPPm1HLwP6
	B4Pc6zaLrOnzA5p6pF8QId8vV/Ub0iJco4vYXx4=
X-Google-Smtp-Source: AA0mqf7ic9zk3EGV5lvmgJlPRDFWaTYJOnY8tvXNjgbWUw77qlqb72i5aAM6vfQFYuOP94p7t8UlKeHn7XOKNKvMekI=
X-Received: by 2002:a17:906:2793:b0:7c1:174f:d69 with SMTP id
 j19-20020a170906279300b007c1174f0d69mr8242280ejc.447.1670780112811; Sun, 11
 Dec 2022 09:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-9-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-9-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 11 Dec 2022 17:34:46 +0000
Message-ID: <CA+V-a8s632e6N04=qrZzt6au10ZtuFDaFZANVNisy81N_Y2u9w@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] RISC-V: kprobes: use central defined funct3 constants
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_093514_850376_85547794 
X-CRM114-Status: UNSURE (   8.03  )
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

On Wed, Dec 7, 2022 at 6:08 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> Don't redefine values that are already available in the central header
> asm/insn.h . Use the values from there instead.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/probes/simulate-insn.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
