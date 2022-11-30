Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E344C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 11:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9asYQZN1nnzzgeYalBUsXBlqUZwTKvxAch/D67vpSb0=; b=xaoxHUYSPbt8jk
	ClD/cgSsKb2/nMMmKDgCB+JoZv6GaIoQd8rZUvHHO1Bfyu6jIRw7EfYMJsH0H44/DbAvOtb6Db6UL
	nJXziBCcFdm4IBaDRcEg864E0cCNlPhA0aeu8r6LdEvi3guJOqVdbebBG9oVQPBROyORnGw53bZ86
	Vis4PnUTZqIZKvl/g2F/QKdXBNe06B20XYD+U8aiAv0QEVrCACygKdLDMo9xopq09jb+gcg+fJnEh
	jqs9TkVGRKOyDHojrflHcf8ZiNMs9w3e46CXFiYwhS0/Mgx019QP8/Mp50jP8x+WYTYRPwN41OSEm
	XHwLERktd4iITaTTolrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LFu-00Fo5T-S0; Wed, 30 Nov 2022 11:27:58 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0LFn-00FnzF-7X
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 11:27:52 +0000
Received: by mail-ej1-x636.google.com with SMTP id fy37so40501224ejc.11
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 03:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U5KBQ3Z+4x6ln3C2lBlqgjHkWXs25a9COtm4hp4w3WY=;
        b=jeYyYFIgyK2ruFr6JE3tTe6iU2LchkZocNMktt7Dygmi6BiNUc07WTrdZbOE3MsiI2
         ep5Zy/oIaPEDu5zJHBBiDVSYrBDBkBaqlwYB2akzGLBX5LC1sOG0/8Q51aSPDKRVM3P1
         fMN7vUKS2NhthOOBF9IyNW0Uerp/7bLeYuX4EaWTWhBb7JnF/ALXsBC4oMEXirvJ6XPK
         oWywH7FBNQ15olXb/jFZZiiS1RdLFJUrnw0fLGuqiIYsC5exRjmxVs50ePQ/IJYsAcEM
         LX9BUmGCvEU4Ou6Ha4qf5koc63XBIwT+Wgs5M2D6+yMB28GULXq0kGAN3vcDVg1mO1Z4
         v3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5KBQ3Z+4x6ln3C2lBlqgjHkWXs25a9COtm4hp4w3WY=;
        b=GV7kEJDdZtCX9FvNL1enhf29CdOklW1tyjXAGTR44H8zjdsnz2vrDbEQH+55F+6gRP
         PPaqnbgiZlM5cZ6p38XAVa/yUGUiBv8xWcAIqSDQeEyvKGydhxLmtc0UORZhT1Bh2cty
         hwz0jSX25Tih8Wd1EKY2Zb+J3q6nZ+VoZj0v/q1dYNAoVc7p0GDpijpwiNTTf8bBRUDM
         yywuOctj4AGaWhtrUJwxtgHQUEg/bpB1cBggwhnc7bThlGQORMOnJUcGj4RhSHrm1mrB
         ZUjxSRegT1DRQRJM4glpJbr5fINZIBZdpw5xGhJccwY9SHttDnB0ofQjyIzM+Xos/ro9
         Zazg==
X-Gm-Message-State: ANoB5pkxs7DfDh8pHE/YjhkR77eiLoxcV0QnBZRbJgMxp2hEiBb+Cyqw
	Pw/9l7O97uDiGoYVUrDZR0cokg==
X-Google-Smtp-Source: AA0mqf6dewyc0DdpyRKNXfXEhV3/Z0+y26UTMrqjUldu1nSiZkqi967p5c0zfpfBuq2dKCNM6dmLZA==
X-Received: by 2002:a17:907:3907:b0:7ae:37a8:9b5c with SMTP id so7-20020a170907390700b007ae37a89b5cmr35548096ejc.241.1669807666812;
        Wed, 30 Nov 2022 03:27:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id g2-20020a170906198200b007bd1ef2cccasm547639ejd.48.2022.11.30.03.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:27:46 -0800 (PST)
Date: Wed, 30 Nov 2022 12:27:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: Re: [PATCH v2 3/4] riscv: alternatives: Drop the underscores from
 the assembly macro names
Message-ID: <20221130112744.mqteregnxf24w7tb@kamzik>
References: <20221129150053.50464-1-ajones@ventanamicro.com>
 <20221129150053.50464-4-ajones@ventanamicro.com>
 <4168918.X9hSmTKtgW@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4168918.X9hSmTKtgW@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_032751_302500_88F51CC6 
X-CRM114-Status: GOOD (  22.32  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 30, 2022 at 11:06:27AM +0100, Heiko St=FCbner wrote:
> Am Dienstag, 29. November 2022, 16:00:52 CET schrieb Andrew Jones:
> > The underscores aren't needed because there isn't anything already
> > named without them and the _CFG extension. This is a bit of a cleanup
> > by itself, but the real motivation is for a coming patch which would
> > otherwise need to add two more underscores to these macro names,
> > i.e. ____ALTERNATIVE_CFG, and that'd be gross.
> > =

> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> =

> Hmm, I would assume the "_" are there to mark those as
> "internal / don't use". So with removing the underscores
> you loose that marking.

Yeah, that's usually the case, but here we also have ALT_ENTRY and
ALT_NEW_CONTENT macros which are also internal, but don't have
leading-underscore names.

> =

> It works though, so
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

Thanks,
drew

> =

> But I'll leave the judgement on its viability to others.
> =

> Heiko
> =

> > ---
> >  arch/riscv/include/asm/alternative-macros.h | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> > =

> > diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/i=
nclude/asm/alternative-macros.h
> > index 7cc2b587c5c4..9ea95331a280 100644
> > --- a/arch/riscv/include/asm/alternative-macros.h
> > +++ b/arch/riscv/include/asm/alternative-macros.h
> > @@ -33,7 +33,7 @@
> >  	.endif
> >  .endm
> >  =

> > -.macro __ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
> > +.macro ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, enable
> >  886 :
> >  	.option push
> >  	.option norvc
> > @@ -45,11 +45,11 @@
> >  .endm
> >  =

> >  #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)=
 \
> > -	__ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONF=
IG_k)
> > +	ALTERNATIVE_CFG old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG=
_k)
> >  =

> > -.macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, e=
nable_1, \
> > -				  new_c_2, vendor_id_2, errata_id_2, enable_2
> > -	__ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enab=
le_1
> > +.macro ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, ena=
ble_1,	\
> > +				new_c_2, vendor_id_2, errata_id_2, enable_2
> > +	ALTERNATIVE_CFG \old_c, \new_c_1, \vendor_id_1, \errata_id_1, \enable=
_1
> >  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
> >  .endm
> >  =

> > @@ -57,9 +57,9 @@
> >  					CONFIG_k_1,			\
> >  				  new_c_2, vendor_id_2, errata_id_2,	\
> >  					CONFIG_k_2)			\
> > -	__ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
> > +	ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1,	\
> >  					IS_ENABLED(CONFIG_k_1),		\
> > -				   new_c_2, vendor_id_2, errata_id_2,	\
> > +				 new_c_2, vendor_id_2, errata_id_2,	\
> >  					IS_ENABLED(CONFIG_k_2)
> >  =

> >  #else /* !__ASSEMBLY__ */
> > @@ -126,15 +126,15 @@
> >  #else /* CONFIG_RISCV_ALTERNATIVE */
> >  #ifdef __ASSEMBLY__
> >  =

> > -.macro __ALTERNATIVE_CFG old_c
> > +.macro ALTERNATIVE_CFG old_c
> >  	\old_c
> >  .endm
> >  =

> >  #define _ALTERNATIVE_CFG(old_c, ...)	\
> > -	__ALTERNATIVE_CFG old_c
> > +	ALTERNATIVE_CFG old_c
> >  =

> >  #define _ALTERNATIVE_CFG_2(old_c, ...)	\
> > -	__ALTERNATIVE_CFG old_c
> > +	ALTERNATIVE_CFG old_c
> >  =

> >  #else /* !__ASSEMBLY__ */
> >  =

> > =

> =

> =

> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
