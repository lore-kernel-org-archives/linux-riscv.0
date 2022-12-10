Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291C7C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lE2/WQ56tk41pemIrxuR6K45Ti6aRrS9GIIaQiJvKN0=; b=TGlz1IlWVFUX/h
	Bz8XJcn9RhFK+1Vy+ifcu89FdnN2gLU1LpPEjoXHlp6LgDZacWQ1MiBF0UUVoyvBU4Qzy4ZJtZw07
	+v9DdZIqX001IwbTyxarBHnNYzBMubX9Gpq/ZLwAunpqgMQ4x8QlIo/7AptP+2GOt7g05CJWENSNO
	Gt1DVXLeZpOfTZkeIXr6KBBciLYBB6sWJDS1Qgbs/+eoExL4OXS2oBQ/x067xUeeaQZK5AHgCN5ox
	U+7XUSZnVr5mFvIYm9u+cStS45UthMfPCSYYPVty0h4H1Mh5M0TdEAv57vbia81BBFFtmUJZdjFO5
	6J2WdxE2Wck0Tc9G70SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3z4j-00HOV3-VO; Sat, 10 Dec 2022 12:35:30 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3z4g-00HOO8-H1
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 12:35:28 +0000
Received: by mail-ej1-x636.google.com with SMTP id ud5so17536636ejc.4
        for <linux-riscv@lists.infradead.org>; Sat, 10 Dec 2022 04:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Arv/5H9xHKw9Jk2pzzMmldJxjNqQa7ZDzPhkeHWolXM=;
        b=hF14IVYm8etREzbZPNeENZ/1ftcUfiiFgnr/LNnvj1S9hPP1zdszUA1jXV52DdTes5
         hXwx1WaNYXjBT27e8cez2YQo/8zcCevqz5YMM34XAJpdhggf79PS1JjEqifZHmWjrKXD
         5yufUJTY2aN+yPorzqf1wiOkZncbWSRWKem16Glwt2QlwxTeKB+VTYG+6HSiTh6cMbwP
         Ax2l4Nn5VAv2QS94uegd1O+L1J9TCBAa4sEKUjh427xJjgvuFT37JD1KbPz1yWYofgN/
         OXS4G5pEZPloM8v9FACppic9eT3PhvjFXFKjyogFfYmaOJjSDUABbrwMOFHAexi0SjRo
         BDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Arv/5H9xHKw9Jk2pzzMmldJxjNqQa7ZDzPhkeHWolXM=;
        b=m/wuGUlZt1cnr49mKnXayMPlvWFDesMatL8XHGI3V1VIc/MUsYFrSyDyPLfMI7lzRd
         +BTrOxo2Cul0wA9nw+90XjdUTvMwWyNb54B+JRxI7rDkVmfVzMu6GSy/cQQaNhlM2FDW
         feRz7OQS/v0So+DyBYFXC6j5XpC8H3PA8cw5CUGwizTXWEO5F6XPtMKKMVcAgUulcETU
         qfYjzphtIA82ZYStPj9M2CL8Mf6c11BgIegtetMWnTbBIzFhSXsyIIqt08K5LlD/fFhH
         QVID6bk9YH0qSyTMwBnTlpt8nE9p6+wU4vmmQTh3Q+sHD6edKs4F18VnibBFYPVXIEmW
         I+aA==
X-Gm-Message-State: ANoB5pm5Bb8P7vsr6Dky/krMCzLsT0u/DVoNL3z0unocDOKKBH6mIdmO
	/eUkkU8biUcHsKvDlMhv96atkYR0nx1gRqWEMJ4=
X-Google-Smtp-Source: AA0mqf7j95AiRo34cJfK9V89hqqCRHS0aq3C9yTxUQql2wLtqCy2xd9PgfAF9cjukQYuvqF8p2WvzipP1k30dFTjZHk=
X-Received: by 2002:a17:906:5156:b0:7c0:efb6:8744 with SMTP id
 jr22-20020a170906515600b007c0efb68744mr15692479ejc.267.1670675721952; Sat, 10
 Dec 2022 04:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-2-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-2-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 10 Dec 2022 12:34:55 +0000
Message-ID: <CA+V-a8vK6rAJPjZO_SevDxymdtwgJAJGi2=3hvNSRWtyvxXAYA@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] RISC-V: fix funct4 definition for c.jalr in parse_asm.h
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_043526_597656_B0CDB950 
X-CRM114-Status: GOOD (  11.24  )
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

Hi Heiko,

Thank you for the patch.

On Wed, Dec 7, 2022 at 6:08 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> The opcode definition for c.jalr is
>     c.jalr c_rs1_n0  1..0=2 15..13=4 12=1 6..2=0
>
> This means funct4 consisting of bit [15:12] is 1001b, so the value is 0x9.
>
I was struggling to find the details for this, finally found it here
https://msyksphinz-self.github.io/riscv-isadoc/html/rvc.html#c-jalr

> Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
