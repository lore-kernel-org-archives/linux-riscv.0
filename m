Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D0C32771
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 21:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4as901PBUBiUnkb8l3EPBnpCziHsTjdIh+jECMQKTdw=; b=b7VXwNgv7duamz
	24Q9h1WDMLpEINvZSV8gQLQc9Ekxi4bu8ozFLlmjzsmU4YwOSUWErg/6Q9iWArIj43qxT69qQQuuP
	V0EB1ELkcYsMSitsvEVfRt6EilL2F32/7twYEfFkzOGc+/mok2LTRYA9igzJm6uSW/o3ww/Qi5Dyx
	4QUbWZ0BmBJ+V+wNIv22CdZR1DTHVomH0ZNWqiNSEqCOPgwFpy+pyB8w0RTr4IzOi9tYeXvUjIn+c
	utnc6rOu+sxuNIwUl/loY3fVK5AJ9pM1DcKlYbt5rrZeDDxAxXrL0NZ/fDGR567XShnW9VEGNZEz5
	Sf6JnyU5XE10S2nc+tEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwrG-000ZeM-Ej; Thu, 15 Sep 2022 21:57:18 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYwrD-000ZMt-1u
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 21:57:16 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 130so29759620ybw.8
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cPaq5546jvH8aSMw37Z0a/MsJlDcjDxx//GnCdJb6rc=;
        b=owIFgWeXa2WIc57acLhZaC+Nruso8LkLfXri92gyDu0I5Okpy5HFyVBaU1sakAHAU1
         tXZ842zF7oNOBoTH8LHv5GD89MTcRvtbNeuxw5LzpNPqoB5t07TgC6y1mo3EizgMKfoI
         x2anyGPZOymMW6CnLibb0F24j+++2v/rIbSep5ip5v3gTYyIIMzFWskedc9D/THLD+U2
         ptZ+GkkdQla6MJgRxt90V1uQ92yunnIwZPuwsDXZzbfVUbLH6ckedR5jKDIKf0Z8ql/O
         8+ywDI7BgKrHZXYGOjj9TJwmVXhJSuOcOcvY0OpY5ncIXghOVAK7+cm5nYwedEJ+uHfp
         q9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cPaq5546jvH8aSMw37Z0a/MsJlDcjDxx//GnCdJb6rc=;
        b=S7aH5bH0Vfk97AiKnUDz/DDNkTc0LNAHLBItJlb6TVk6/aK60AwnxRPlEflzYuG+Jw
         gntH+9TkdO+9meRaupK74s8eoD4UTcvs2tds1bv+/LBzgNjDW5ppA4uY51pHZQXMj9j3
         E2HYntrh4jDKp4j1v6lGZSf2ifSfC/FGRrUKqZDwUs5e/NT23SJaDOK0IY2VAVtLVgnk
         aDf5kGchG5lJ7Q7NTFJDXfKTYB2QoukiWKOLHwT5ooNGH+lRbwxs48O8ufBxDyGBB6Ak
         MokIIb41pC2bwt0p8nqMgonOiocU5ub4lLQABMh+viD/8V2WsRrYBSmOfeA716ooGACP
         r99A==
X-Gm-Message-State: ACrzQf2nCxfiyqBpeJwU4/hqunphTLLa1VZiB5V75xEbKJSidvH3bCnh
	cY2lJcwLprkqNGrbDo0b0NjRGygDpaf3/7EwvUM=
X-Google-Smtp-Source: AMsMyM4CJb/auFvW3u8hqAtr+nMrB3OgfxFI1GmkaXoEovGm0BaVYp/lJB8GvxqgOnaB2wVGQo/dLc68ih6DLvysGRU=
X-Received: by 2002:a25:808d:0:b0:6a8:f9e8:eba0 with SMTP id
 n13-20020a25808d000000b006a8f9e8eba0mr1783881ybk.279.1663279031516; Thu, 15
 Sep 2022 14:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220915181558.354737-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220915181558.354737-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <10896a74-5875-a083-846f-eed5f457ba1b@microchip.com>
In-Reply-To: <10896a74-5875-a083-846f-eed5f457ba1b@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Sep 2022 22:56:43 +0100
Message-ID: <CA+V-a8u8NdzaOmnQocAi_tthE=J_-LabG49StxH3gyV2QJwirQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: soc: renesas: Move renesas.yaml
 from arm to soc
To: Conor.Dooley@microchip.com
Cc: geert+renesas@glider.be, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, heiko@sntech.de, 
	atishp@rivosinc.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_145715_136360_9ADB895D 
X-CRM114-Status: GOOD (  20.21  )
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

Hi Conor,

Thank you for the review.

On Thu, Sep 15, 2022 at 10:13 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/09/2022 19:15, Prabhakar wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > renesas.yaml lists out all the Renesas SoC's and the platforms/EVK's which
> > is either ARM32/ARM64. It would rather make sense if we move renesas.yaml
> > to the soc/renesas folder instead. This is in preparation for adding a new
> > SoC (RZ/Five) from Renesas which is based on RISC-V.
> >
> > While at it drop the old entry for renesas.yaml from MAINTAINERS file and
> > there is no need to update the new file path of renesas.yaml as we already
> > have an entry for Documentation/devicetree/bindings/soc/renesas/ folder.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3:
> > * New patch along with this series previously posted as a standalone
> > patch [0].
> >
> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220815111708.22302-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > ---
> >  .../devicetree/bindings/{arm => soc/renesas}/renesas.yaml        | 0
> >  MAINTAINERS                                                      | 1 -
> >  2 files changed, 1 deletion(-)
> >  rename Documentation/devicetree/bindings/{arm => soc/renesas}/renesas.yaml (100%)
>
> Got one error from the rename:
> /stuff/linux/Documentation/devicetree/bindings/soc/renesas/renesas.yaml: $id: relative path/filename doesn't match actual path or filename
>         expected: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
>
Argh, how did I miss that!

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
