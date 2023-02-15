Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EEDDC636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 21:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCmXFG7atX8AmLBGB6C64lbKVsP/3tTckPgE7fegreM=; b=jZQSsUMt3T7qAB
	iETQi2lQb31S/a+qreRevTwgtW5EFGSpqZQZgMjZIoFBfnKhHSx16cniuoLTpghSUx91g9cDzR0XO
	VQKSxSQY4PF3iHJoW5ALEe39bzgHflcWinsRM1rBksPRl4lWJJnkJON1DHepc9bYZw9d4wAbnmk0Y
	ThNH8+I+dZMmsX2gILEA4QwGwsVErCsG6UQ4o1cpY5fNDGtrJklOdpHKaK2WVqxLk1Dav0+iyVqxw
	WcfpNcs+wpyM7LovjCCGQtOhS6Fj+VhykjNbc1MEMJtZH44yb2qc7KknsEI1ZiB68PRrzNUD2iC85
	Ja3ZPFgrjv/U7Ptyv6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOtN-007L9y-Uq; Wed, 15 Feb 2023 21:00:42 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOjn-007Flo-UH
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 20:50:49 +0000
Received: by mail-lf1-x12d.google.com with SMTP id x40so183656lfu.12
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 12:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9J4+2O+6dPLiKhatW215i+nXvajg3X2gqM/YT6Nj4eM=;
        b=qkg3aTo7kPqfzHtYOWxpxv7swca6ZxC//5ANvFMLCd7/fDSMS+9NvRo/7juQnDyhGK
         y2V9ULlE8A5/AZa/1z+T/EZrEUeTy43C9SL5MRGS/DJ5hbK7CXgfPy8QpmUKXRz5O3zx
         1LR/FCPiBy9/29NAsHqIYjwDoYzO1YZUMpyvuy0VmaVvBCyMgcDRbqI3BDx+Q1sVSKuv
         wLNYgVOzr7eWzBCZ35QlZGB6BQPaMvPEnfahNdec/zv3RwQk8yn0WQnZfCgt2lvrKnFj
         u6pvMdn67CBd1GnEUaGeR5dfkcAE0+MGAkNf2Plz6iDOaeKzbax2t4B7TVK/16vtmS4D
         dRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9J4+2O+6dPLiKhatW215i+nXvajg3X2gqM/YT6Nj4eM=;
        b=ANzJeEI5ACTpchDzLn2Gi6UkUbRh971ZLaVbxzTw3usebu1sE3ROeuT7u9h0Y4Z3rd
         dK9+MC5GsZUD/uGVazIaAq4/fSLaFnNASHuugeW0gnO33L8eV68dN/5yKbI2ISROLM1c
         I6vF3dubyF/xGRHgpcOWT3fN4+YDfxY44Vl4qutXkbQzhxEbogPlaGoXdtKnTR0u9wk0
         oYCa1KJg2p9V7jimi/6dWiZ5TseWfZLrZ8WoJ034Oo0w1RtWX8Yud54oZiDdGTJxLl4F
         0LBFrCjBFpd+6rTCYGzfG2uxHeUGRpqjsZuppRV6wwigRsmkVtdqialDqD42UYjJF4ML
         whtA==
X-Gm-Message-State: AO0yUKUsW56mc75l3+YM70PRAf/iv4mf4k7XkynVACc0SnnG5xxoVGD8
	io48+PA2yzqXXmU8tiv0XZ3lajGzLgy0jY4lYbyixQ==
X-Google-Smtp-Source: AK7set+YuOicYHlGgbYbe1IaylJwpRt8UMMp+PnI0BL61bAqsiAV0ZewTgN+WPYQh3nPf0eiV/TydYDXrsOnW/2YBhY=
X-Received: by 2002:a05:6512:3d18:b0:4db:1e7d:5d42 with SMTP id
 d24-20020a0565123d1800b004db1e7d5d42mr2074364lfv.0.1676494243853; Wed, 15 Feb
 2023 12:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-5-evan@rivosinc.com>
 <Y+v8eNlcG+jbB2oy@spud>
In-Reply-To: <Y+v8eNlcG+jbB2oy@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 15 Feb 2023 12:50:07 -0800
Message-ID: <CALs-Hsu1K4taqMhZs0PyYsT6t-skSbW4QJWVP5csx3qecfz-3Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: Add RISC-V misaligned access performance
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com, heiko@sntech.de, 
	slewis@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_125048_015766_ABF2A78E 
X-CRM114-Status: GOOD (  17.25  )
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

On Tue, Feb 14, 2023 at 1:26 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Feb 06, 2023 at 12:14:53PM -0800, Evan Green wrote:
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > This key allows device trees to specify the performance of misaligned
> > accesses to main memory regions from each CPU in the system.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > ---
> >
> > (no changes since v1)
> >
> >  Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > index c6720764e765..2c09bd6f2927 100644
> > --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> > @@ -85,6 +85,21 @@ properties:
> >      $ref: "/schemas/types.yaml#/definitions/string"
> >      pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
> >
> > +  riscv,misaligned-access-performance:
> > +    description:
> > +      Identifies the performance of misaligned memory accesses to main memory
> > +      regions.  There are three flavors of unaligned access performance: "emulated"
>
> Is the performance: emulated the source of the dt_binding_check issues?
> And the fix is as simple as:
> -    description:
> +    description: |
> ?

Yep, I can pass cleanly with that change. Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
