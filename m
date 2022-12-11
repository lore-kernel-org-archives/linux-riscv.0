Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C39C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Dec 2022 17:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLW0Mlleiz/34gG/9N6Yc0oBgRmOnaW9GmdFjdHyGEM=; b=pEWUErZ72QLfKH
	W6fcyUQGKYPONBN9MTPJ471Y1V+2z/aQtu642T3s7i8QEVNlZQUq0MmjBL0sLfhdlQrkB47vBQ9Q3
	ZA8u4bRSlDMVvziZ+e8qn+/MaCGNXDR0rmLwzlZL/Z38WW5j952dUBGVyp8C9G1oWw7WO9eKn/4eE
	Tgog7rEmgcnwDY3P+EDeFAAbAl9rBwe5GlBThM0ilgOutj8CUlcMylEXGrVzNGgII0ogCSITrK3DX
	jpoLtejlI6FVsbY1oQUj5dJd2loaL99CZKiSIQ05LdrSPCE4ZRC2RNbXP6Pf1XTS98hxKmPry8X/T
	ljPBrxqaSwhZEMqzIJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QDU-002g19-Pv; Sun, 11 Dec 2022 17:34:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4QDR-002fyP-Uy
	for linux-riscv@lists.infradead.org; Sun, 11 Dec 2022 17:34:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gh17so22686427ejb.6
        for <linux-riscv@lists.infradead.org>; Sun, 11 Dec 2022 09:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r5hEgManve1nqwV3e0HoZ3m/Ahsjv+rxhTwQ4tYH1U4=;
        b=SqWlKAuCk7g4ttgFPZv4pBTkQCGeDBEKM4g/LrqWFfEavwV/R2za709CuWgroiRvt4
         3OAE/VSG/pmPsqlbhhB0oeqQ/O/85vaME2L0Cgmjlcsey74otRjIuKrzqfn6ehv30Xj4
         rHfVx1Paux7f7Qq9TKgT3fquh8BpzRHQHeRV5PesyrgqEF0l5CSjj8M3txu8cR0danxN
         MoD0pr+NJBmt8f/GWMtnVwUb8xrYxSHVLsgKkzgwu5fxdx+DokAOS8chJ/dUNa8r8Hs5
         lUpv13Hkxv7zR13Yp7xPzGILbfwUwHZ2s+ZiiQ4rI38own1/9p/P8gP/pze6OMaIlRPc
         5faA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5hEgManve1nqwV3e0HoZ3m/Ahsjv+rxhTwQ4tYH1U4=;
        b=qiN9lxDVYZOpYsP/uI32mpuNIt/OF1mcIEHsF+o0aQ51QZtD6YnbvjY8FLn9IU0CjS
         sYAkk2UsfWLELw6GwfZeGOfa16RDIw1Kv/OLJeok0oPhXBUpK1KzUTblRAtjOV2RvZRf
         whnluBqIXPle0oSn9yBv/XvuY3Smjn+Q6yhlpfn6mLI//Oa3D5T29fnAQgoPFxJXkIfP
         /mAtLELyJrAQHzkLmv7fGTTf6YqQJadJyi1qPE1ILMK3IFg/38aGtQySYEzbWiwDHirH
         1+FZgi8FjZj7rkVYyIzuxlva1sjHVe3W6sYfTIde74ffm21/HJBb75n2tYLbLAj50TUC
         0Jrg==
X-Gm-Message-State: ANoB5plz50GzpqZCal0FCvT0KrsobWylJufoYgUt0/EYHui1syg6nN8O
	tnWByn6uVD0E3vDIfHRF7IZv8Y0qGuIU1n3iPmCP8MJB919pzQ==
X-Google-Smtp-Source: AA0mqf7y0oxQ7aQRERuT3NR58EuaJ+Ck5tDy5AyDpCWcCaMrW6IzzltnZlqB18vIHOarlj5lVtO9rs8RD51qPiSq5xs=
X-Received: by 2002:a17:906:5156:b0:7c0:efb6:8744 with SMTP id
 jr22-20020a170906515600b007c0efb68744mr16038671ejc.267.1670780056020; Sun, 11
 Dec 2022 09:34:16 -0800 (PST)
MIME-Version: 1.0
References: <20221207180821.2479987-1-heiko@sntech.de> <20221207180821.2479987-8-heiko@sntech.de>
In-Reply-To: <20221207180821.2479987-8-heiko@sntech.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 11 Dec 2022 17:33:49 +0000
Message-ID: <CA+V-a8uqNc9jzATk_EMTEgkaTp9C7f+-Ra9FStZ3mjUDsv4uZQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] RISC-V: rename parse_asm.h to insn.h
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_093418_021185_94E3A056 
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
> The current parse_asm header should become a more centralized place
> for everything concerning parsing and constructing instructions.
>
> We already have a header insn-def.h similar to aarch64, so rename
> parse_asm.h to insn.h (again similar to aarch64) to show that it's
> meant for more than simple instruction parsing.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/{parse_asm.h => insn.h} | 0
>  arch/riscv/kernel/kgdb.c                       | 2 +-
>  arch/riscv/kernel/probes/simulate-insn.h       | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/riscv/include/asm/{parse_asm.h => insn.h} (100%)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
