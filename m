Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9354BC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Dec 2022 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVsXZVJrQefmRSF13GEILRXCtjueJQAeLt1lI0GMWoc=; b=sVNqUzWyNzULut
	DFsTPJpVtIHfO8zBS5XvEGjACKWH1fI9a8aKbGyzk6YvHRkl0vgyOoXffvhReK3zJN3Z6Agrqf5pf
	ws0nHy6MEt+0eGf5BFJOC6Sg6ORBWPgPTMfCEhuZY2FjyXKJsM83AqcLnlfy8I0u068bZhL3PpBeZ
	67mlrNBX1Yj/4wmLo6gNwT4AFKSg7YlYtHRWwgod05+5oyFipi+6w7gbCpRO7PFNa6IHv3a0R2ao3
	gsEvRrxCOP0rLMfGDxAPy1spnQc64qRDS/IcNN1hL4WsoJNaQPTsIxZwTU42CgY3FCxjxvq4iuHDU
	aAuyFWZYdXZkBlhokUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4TGd-0047uA-4E; Sun, 11 Dec 2022 20:49:47 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4TGa-0047ri-R1
	for linux-riscv@lists.infradead.org; Sun, 11 Dec 2022 20:49:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id v8so10342707edi.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 12:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rsOcasjq0TedT73oEODBerNIx3k+Kwa0TZEOIisr6w8=;
        b=dcrOXRbuziG2eP3kRTkuexeaLn59wogpHNYuw/EiDsC6X9RT50GeV5EzgllcejLi1s
         rox1rwSJPjIT+s2SZMR7cpTEKbf6X4Ib5B2WMZfapQ08pnMttMDeBIBB9WC2WL2jn8VA
         n2+O8OL1d9S8LM1DptX1/iwcHxLjyDtP9T6Kvkf4zowfiSZDXpiwBF5FQljX0CkBhsxP
         J7zg/9RGOlpcY/dlQy6xZtiA0V0T2vG4dXaFB6njwUe5eOsAEr5w5g5wpF90+IG9Jnfq
         TVDSB1Z5ZyKRxJ1NR99GtKPuyWvml7ejn4xNvWQhRNQdjNa1mYExO3EkOhSmPL175O9c
         DcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsOcasjq0TedT73oEODBerNIx3k+Kwa0TZEOIisr6w8=;
        b=Av7SA3WX/b4PNcBK26BZOFBKLqmKTp7TGZXrmpt1cwUJ4e43SjbUj8vDXV98Qe/XVh
         nFiAje4EGDOACj2jwCLjioOp4sSu9K2U3dqVFXQm5hqM1PTb3O6TgWBJ8DWsc64Vcmv6
         QbpzS/cSnquJHAgGAzaUOIY3VCSnAQrIblDlWeVqaB/38MB6aMRocciq0fAzSA5/1qZZ
         juyKmnIjoAZqO5k1Ymt688/8V7i2p0w3+nGTnukPUeaZioLrV8p2E7vT87eu8amHbL16
         m5/43cQPPbBq7BF8F1RzobS3zTGaoMWvM8bIbCYSOZI+aT1YmEy203rF8L94xDeO8BB+
         PL0Q==
X-Gm-Message-State: ANoB5pn5WNy7ztiysLlbGH8DICr1WtIQKWwljDg8y23ZamuIbPmmMoyc
	zHN3Kb24/Ga/O5RSwVi+qPRvVB1kW8txquqUfB4=
X-Google-Smtp-Source: AA0mqf5b8hOPZ4ndelfPqkUhsvUMQBDonNN6Uv9wTOuxmLeqdBJVlzt8xCzveZa3u83sBLaO2hWWKz2oySNP6Gj5kdg=
X-Received: by 2002:a50:ed10:0:b0:46c:226e:6ec8 with SMTP id
 j16-20020a50ed10000000b0046c226e6ec8mr24470892eds.319.1670791782548; Sun, 11
 Dec 2022 12:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-13-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-13-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 11 Dec 2022 20:49:16 +0000
Message-ID: <CA+V-a8va36vFWnzvB2hTY7GSyjQ-9xk4Xs7wtibo-OD72=-5rw@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched alternatives
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_124944_892608_F47E9D75 
X-CRM114-Status: UNSURE (   9.56  )
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
> Alternatives live in a different section, so addresses used by call
> functions will point to wrong locations after the patch got applied.
>
> Similar to arm64, adjust the location to consider that offset.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/alternative.h |  3 ++
>  arch/riscv/kernel/alternative.c      | 56 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c       |  5 ++-
>  3 files changed, 63 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
