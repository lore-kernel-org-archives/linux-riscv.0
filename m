Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A2CC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Dec 2022 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guvl1IJHYnLuB3MoP+MwjEXSzh8lSpS8GBZgxGxpJFo=; b=wP6K9qkWD0hDiq
	ngh/0YWt25z9Mw7Dw3WDxa6GPXqZdwDdUp8ysVAkMAKS9UYldHWTwpgefSWSFGAt3MUEG9GIRGWWN
	kmouC/0ZXjyMonmEbN74m1LIHlAf2XXVYJHyiQI33nmKsO2k4I9EiRMK0nOA/pktmy0e1dws/62AC
	+8iCGEAFMyWFEWMo00x3DgMdgja9i8vQVyK/H3XR+9nQi5oBOX4SfM0MKs345xCwega4pFSIM4IPk
	DLVOh5rkB9BABMVIjcGGW1/X2UzwECqYUVmbRiLDduPpSSE6718M9JTtVFPfiIkL4iWuth32ErTu8
	g0UKOiAVTcFCdXxV4uuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QCP-002fNz-QG; Sun, 11 Dec 2022 17:33:13 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QCL-002fKd-NH
	for linux-riscv@lists.infradead.org; Sun, 11 Dec 2022 17:33:12 +0000
Received: by mail-ej1-x635.google.com with SMTP id gh17so22682298ejb.6
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 09:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=phh9Ymx6zEUI1lCpV3p9G/RK6ZdaDxOAaURubd7iyY8=;
        b=kxyKrBtVmqFCaP3UgxbveZft8uOKSeM2b6maFLtPvnp38oKUkNubenCivkrfHVQzsN
         rz43uC+vxwDDU+m6PraqsE4d53HGMFvYQPUGJI5FA8TWpZV2vVzRrQSKHI9KU/0zWTuH
         BVxSAVfCnvwK+SP96qU4FPuwyqcfzaDBtRgH8+dJugKrkQEinZzgCDY53XrCZzsLXO2N
         cpZrSC0RljKtQrqfpTBtut+EVsd7vas0iBwbJOsyNafByKC0iw/X7L8j9UIuNlkxe5Wd
         LCXDXsmMa6z0YaL2D3JsVNdd//1ck1PK0EVj3aTO1WUDyNR01aFvmr8NEZW/jG8dqJWN
         3LLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phh9Ymx6zEUI1lCpV3p9G/RK6ZdaDxOAaURubd7iyY8=;
        b=kGcDqNazO3xpC3oyD8D2dj9k17euAkaL/ipUlA/SZcnGI18iLCHzwx2YwTA7J9TNX3
         UOSh/O/4ClVw4HCAKappJZHOUdnnOfjhlpPcc2rLhM0WfFB/GXolmwDuVVUTv7u0f3q5
         27hftr/2wBn56iOJbZ6B4aPaV/0osQMup4ZuCFRV0iJZT/QmORK2kqBNAJ8DnLv8/S8q
         6BBNT4KAjmtXIYwNQEIuFAQz1+xt8Hj8CNsT7EkYIUjwid4Xdl/zAAwZRtj7GRsP6LNq
         g9CTM+11uPh/aG1I1qiJB4kiAxs62bcRcRIACw+E7oOoMjMBj870vliR8DUgX04sLPrJ
         GGcw==
X-Gm-Message-State: ANoB5plISkSwWI0QFE4IPSe+YHqTbn97gOZOP6IJQNZYgHwQxEd5ZOlI
	O4B1sqdHn3XJrub75Rqieh3wFFJ0VMVaexF9i7w=
X-Google-Smtp-Source: AA0mqf5IN59A1bISgwB9idtCmZrCe8jCXy9hk6ziDtRdMpRVT8GW2/5RkSdJlaqZyOG3nksj0VsbhuvpAzN7tFqZtZQ=
X-Received: by 2002:a17:906:9615:b0:7c0:f459:a0e4 with SMTP id
 s21-20020a170906961500b007c0f459a0e4mr14337419ejx.155.1670779987097; Sun, 11
 Dec 2022 09:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-7-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-7-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 11 Dec 2022 17:32:40 +0000
Message-ID: <CA+V-a8vE-bmK_y1duMNfzSBFBr6ejF1GGLnW98Hh6q6JcouMqw@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] RISC-V: Move riscv_insn_is_* macros into a
 common header
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_093309_808494_416EE1D8 
X-CRM114-Status: GOOD (  11.98  )
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
> Right now the riscv kernel has (at least) two independent sets
> of functions to check if an encoded instruction is of a specific
> type. One in kgdb and one kprobes simulate-insn code.
>
> More parts of the kernel will probably need this in the future,
> so instead of allowing this duplication to go on further,
> move macros that do the function declaration in a common header,
> similar to at least aarch64.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h       | 42 ++++++++++++++++----
>  arch/riscv/kernel/kgdb.c                 | 49 ++++++++----------------
>  arch/riscv/kernel/probes/simulate-insn.h | 26 +++----------
>  3 files changed, 55 insertions(+), 62 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
