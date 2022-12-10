Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC27C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 23:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dB7VH688VzXyKvPfHAErowbEGChcGlE4LaJ1EISy2Gg=; b=e4XhiEdzXnBZC1
	CMmqu2HduE0ePHcO1zVSvv+C46ChRCGwR05VE1CpCsgB1+c9Br6HJEQru8WU0jgVoX5cs2A0BVzeB
	GytwIB2bzYSKJqDh0cwFoC73Wam6V5jMRGQJsq0+tdSMNV+tWk03ITUVEy2X8oNyu7ZFU5AlDWIVh
	MvFxN/wyJkl/tKx+l8+RQ29GzZy7x19rWsaJVl4vRQEwxknb5ROw5M3DPibB3s5JROnOEdt6TKdG/
	kAi9SRYGzOMFerWjZYFtvte68Xpedoe43pZ4wDPE+s9irPNUHPJbNArrP0Icn5z/6ebRFqtTbC/6w
	J+CjH2fmQT2Hu9Xtp3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p49Go-008wER-Io; Sat, 10 Dec 2022 23:28:38 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p49Gl-008wCe-Bb
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 23:28:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n20so19689230ejh.0
        for <linux-riscv@lists.infradead.org>; Sat, 10 Dec 2022 15:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=trpeZv72095wwUqKwP4o7T8LU1lKq/4pmNvWWyWBASw=;
        b=Ep+kQ+nDG49XGD7JGEEnhqt4zm2Qz3jKjV8l3yqE6YtOL3oqig+uiqWIDWDm916GUN
         63EWFt2IdJt3u9brq3OVAhDNbsPoLIipVDSnLCTmKU0GYyBnHRIj3//n4+E/0VFgg25b
         aeBQhIfADyZXijYCyH3DP0JEGAQ2g4Cb8CxUi/jOYLLvv9AxJyegb3OCz8PGm52P27Wo
         pN42eGP2nI6qxguGHvFxqPG8RuhtrQ8cI1yl+z1uZ0NeLgFQSdRh/ynEMRmSJ6SpzPP9
         Vjmo9jyELYoX6/0XZBcbbLKi+t3UOKr/iSkQQiCydw9WgSizIhohBDAdz+JQNRRLyHOk
         wW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trpeZv72095wwUqKwP4o7T8LU1lKq/4pmNvWWyWBASw=;
        b=4/wS7olDkvUyRkv+fi0wTql3l4WiPigrL5Ef2dmG6CSU0OHWTvnjUXLJgGgvVqS/kV
         +434XGDXN1JBiEUyjEgfuC7SGGsObPi0C0S8O32GtCt3bmiWQsJCU3WdUzKIvlNmUurM
         7LnkR57oPH7IkaSlSlYYHpAEol/dX2KDe3tz3N3EhqIlMoNVitWvrApR48+1urUTjXHE
         lF5tDD7ADeZumQJGQ2Y3KVUX0NRXx/bP6rwgdSd9fuCpKdC8Axx92eZ2sQnRnLB9VVHd
         VyGzHqdR+VHpkGUAcHYJwUfrElUIOFTXGwWWd3Ry2TNPWVVAMh1OzsZmBebUSvkU14dK
         6B7w==
X-Gm-Message-State: ANoB5pmWk7HnzeYJRUiTfxGwU+h3TpvxYDH5xMaOx+2vShNdxPftIahc
	xoCF02pVPQMHWQ0051gsq5PNkmGNWVMIHl4oDTs=
X-Google-Smtp-Source: AA0mqf4w15xtjIO2VQBU+bhJJQL+pxsYHI+2A6Gd35YM++EIqHsuhqZcs1FLWJ9FEqnygXHwXskz/Fv2F68gqIod4EE=
X-Received: by 2002:a17:906:2793:b0:7c1:174f:d69 with SMTP id
 j19-20020a170906279300b007c1174f0d69mr8029097ejc.447.1670714913325; Sat, 10
 Dec 2022 15:28:33 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-6-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-6-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 10 Dec 2022 23:28:07 +0000
Message-ID: <CA+V-a8smo1rTMJxa7zHQsRwG_Zo+4YBDB8ZJzMSBUWQy+7=-7g@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] RISC-V: add auipc elements to parse_asm header
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_152835_431591_244C7A9C 
X-CRM114-Status: UNSURE (   9.75  )
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
> Instruction parsing should not be done in individual code, but instead
> supported by central
>
> Right now kgdb and kprobes parse instructions and at least kprobes (and
> the upcoming auipc+jalr alternative fixer-function) need the auipc
> instruction.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 3 +++
>  1 file changed, 3 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
