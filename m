Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D8DC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 07:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHhGZ3H5GWawwTzKNHTvcaYpzl5o5RvmHsNUcDjokMY=; b=ewZc2OnkTDm8TA
	rXMk1by/vQlsH6uJtcjvdjAUlBFPEFwq6hniE+lBjsRslADitD1BobT80n5Ey3wLwZhuQoza54Cem
	eDFbYa70tTCSoh7eY6zNdv25KDH/Ob0eQqWqCKILYDd8xA5cWcSvOw/lieVz6qIkGyQc2w+YqsMdd
	LIIRiX8Pp/Pxiydnsj6kavZG49k5xYx3Cjzlk6oD8qaE4l1bqgIYuOQCUcqtMi3wCEsAIIolVFPK/
	5qg6qZrGwdJky4U8pbXCmaPxOgXweIlR3LaKsQkB9mZWG0MjEFIXLcc7MgDA/XnwjtdjS/eKc9v1i
	kAy2fBxs3CoZV89BB7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTSw-00EE5W-Cs; Fri, 25 Nov 2022 07:49:42 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyTSt-00EE2T-OZ
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 07:49:41 +0000
Received: by mail-ed1-x529.google.com with SMTP id z63so5309564ede.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 23:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pxXWpp6Ba+0+cy6kemnlOL8iJBO6oeAGebdcNl90rq8=;
        b=AfVdRI6SMjU6cAgADMlddq2dMEX7nSgGt8uBFWn8jAhfYDgltY9pN2Lc//jK9GZMdQ
         F6oJV3JdgJG+Tnb+n18ZMBLyTEsscnhh+qfpXI/gNm7rspdSi2HB9hAf8jrSuSjtVrSj
         glIp0GxMq8ho/25jP40O59jqOjJ68eQ17prga7YDkxUH38ztakhhYxm9ulU74KfpwnvT
         oJVYuGjhIl84WQw0UkGh+1wg1+M/4Du5wxIP1lS919gC0jNuhFmw3gPSw2bStopz+ZSu
         Xf9RIjKfh0AQJOPo//n2n9ihxbbByuUpo1iqWCML2gwedraVvSCXjfbOB6BqFotKEg7V
         z+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxXWpp6Ba+0+cy6kemnlOL8iJBO6oeAGebdcNl90rq8=;
        b=h54+HI15ytVVnUl6J95dnl8tjqlm0eG77ykc47nBVTVn5djD/+9Vsta7NlML0wInC1
         Emp9r7KvytzplgXLXO2YU4UwhEbDz5o4O1CBAHU5I13kgdwxXpSIOCGF7YDX6ege/jXt
         1qsmMav2nLhg0YB+pYw3e7Gii+lNgCAg6KCatyMkLBdr6igrtDzKR5teZ7TMoNN7Qt1p
         xYQtj9Dmz6v1knA13qgSMZrM5tpyIVfU2wLmbd/EsR7UvoLTBPD83lJ190M+XVvD9nkI
         vGjyUyX1eYuM5ZgVLSr+aZTqgA6iSxmDBWVx89dQ1vswWz23VJovMKQREI1VLV2G4UAh
         E78w==
X-Gm-Message-State: ANoB5pm/Bi7NxSBKsozmggX2OCxa74V4Eqw1NvDO5KrP0C8bGmXH1rYN
	oyFDTBoGpf/aaRtZDGzkCxS0Uw==
X-Google-Smtp-Source: AA0mqf5V+5r/Zi3AcAjDjkOWjb1cCnYypCb2n9V/YMJIX6n/fuTi2G03zCTfD/Hk2WQA4OPA0/3Gog==
X-Received: by 2002:aa7:c754:0:b0:469:1ddf:9251 with SMTP id c20-20020aa7c754000000b004691ddf9251mr29057724eds.110.1669362576344;
        Thu, 24 Nov 2022 23:49:36 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id pk3-20020a170906d7a300b0078d38cda2b1sm1261517ejb.202.2022.11.24.23.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 23:49:35 -0800 (PST)
Date: Fri, 25 Nov 2022 08:49:33 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
Message-ID: <20221125074933.2xuyaeuk5kmi5miw@kamzik>
References: <20221110164924.529386-1-heiko@sntech.de>
 <14728581.RDIVbhacDa@diego>
 <Y3/xGhkbf6qEr+5r@spud>
 <3259590.VLH7GnMWUR@phil>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3259590.VLH7GnMWUR@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_234939_839622_49184DA9 
X-CRM114-Status: GOOD (  21.50  )
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

On Fri, Nov 25, 2022 at 12:51:54AM +0100, Heiko Stuebner wrote:
> Am Donnerstag, 24. November 2022, 23:32:58 CET schrieb Conor Dooley:
> > On Thu, Nov 24, 2022 at 11:23:08PM +0100, Heiko St=FCbner wrote:
...
> > > > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > > > index bf9dd6764bad..66ff36a57e20 100644
> > > > > --- a/arch/riscv/kernel/cpu.c
> > > > > +++ b/arch/riscv/kernel/cpu.c
> > > > > @@ -166,6 +166,7 @@ static struct riscv_isa_ext_data isa_ext_arr[=
] =3D {
> > > > >  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> > > > >  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> > > > >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > > > > +	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> > > > >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > > > >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > > > >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> > > > =

> > > > This one I do know that Palmer wants canonically ordered.
> > =

> > btw, idk if you noticed but I appear to have picked canonical ordering
> > as today's thing to get confused about a lot.
> > =

> > You put zbb after the S extentions - does that meant it is *not* an
> > "Additional Standard Extension" but rather a regular Z one?
> =

> This confuses me completely now :-) .
>

Can we instead post a patch to the spec that changes the order to
alphabetical? The only other option I see is to develop a tool which sorts
extensions and every RISC-V developer keeps it in their back pocket. A
kernel specific tool to check each list we want to keep sorted would be
nice too.

My preference would be to change the spec to alphabetical order, though,
because the spec isn't explicit[*] enough to write a tool that can handle
all cases. We'll end up needing to have conversations like this one to
write the tool and eventually the tool will be what everyone looks to,
rather than the spec...

[*] The spec uses words like 'can', 'should', and 'conventional'.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
