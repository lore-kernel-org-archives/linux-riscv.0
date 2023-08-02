Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3501EC001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 21:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ4qqqMpUEYAZ6oC5nGkyM5Z10o0V236zIik3EBQR6E=; b=aeVXWC/bE6MO6k
	LtjgNH0jvAdnKaDtPXUl9zL5ew6Mu1AgbFNhR4lIgtFwpkn7sHgXFcQPVZVyhhWZM9XfrJ02s1nA5
	iqyF38O3i9PQ24kC/hnUqpcdQxvkXNsdoKCJSYLif0HdbYhiCjohXRu+E/vLBgc2uRoykiVZxE8Bp
	qcF5mOw2zIszkvsYLC9lqN8dYP157rC+uBvkp99KZ5znyI6DasAYdxpan2LTzMgGxYFYSJnHk3JLg
	inUR6cLLFgwU3HFpejhyNvJljasf/OFaYDJOrWRvq2m0eZlZaGFtoglUOxHzSBHFdZhnSj4dVtqU0
	mnQODgSnA9+rqHswGDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRJl9-005y6C-1q;
	Wed, 02 Aug 2023 21:51:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRJl6-005y5F-1V
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 21:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691013113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WPlGYk9DpKaFa+HTTbJErYVJ3cCFtjdP9KNGf5Y9bG4=;
	b=RqZ97bHSSghDu+VYEt8CYCKqN5PwJPMK74twspl+bR9rfo3G4ATNl1P2YC9XzpVQWYgABt
	s2Kd8K/YIiV/juziaQ+ZEbloooEy+4fSL0fROpbekVCfxVZPRyC/SWqondFYNfTMyYWFFd
	i8F4Ig9e40zBqyw1X/iJv4jNo80HCHc=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-nJb0-y7KNF-oBdXlVq_umw-1; Wed, 02 Aug 2023 17:51:52 -0400
X-MC-Unique: nJb0-y7KNF-oBdXlVq_umw-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1bb6519da1dso257499fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 14:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691013111; x=1691617911;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPlGYk9DpKaFa+HTTbJErYVJ3cCFtjdP9KNGf5Y9bG4=;
        b=J27C8orQFEekMngM4U5uEOOeDxVU7WrukJ0xPBkElOxXJ6ItsdTD1zuyMM31ZFkjyP
         hKWexgudj2lE8eE5HzD8GmzMf/fWq5x8oUQDBD189IH6xxYPB/0ECADqYCBX7T2e8lhY
         pjvmOIfNWMsfOTdsdovW4M7aO3Nr0fEzXCGc3OFyIS5A6/lwNLXLT6Wl7Iu5kfmQyiME
         yevT+eyAMu6BVaHGnMVR6Gq3GbMW5yeLunBZxO2Fv1aEi/kmTyb1fOEntRzR4ysNljaw
         HWYAdsFlLyfB3OFxqRpY3nS3fFSmEoGmUsid/qHbZTSRbIA2yl07WLJpurNE6g9QcH4j
         sTQw==
X-Gm-Message-State: ABy/qLa3qDsLMMNi0pNsXA95p+QrDZpZMgxqDHGPIvIiA0//Km9cyBJE
	sKA4UhSDGHcm7PYMKYWiAIVRl5ienMM/W/OW/GMRUklxI5K687RLR4RRprnNFVgnpe88NpwgRHP
	+E/4Gf/xUZRvz5ZqAZvSjZYuRQUQoEXVm4fdX
X-Received: by 2002:a05:6870:e2d3:b0:1b0:653a:af92 with SMTP id w19-20020a056870e2d300b001b0653aaf92mr17824515oad.8.1691013111445;
        Wed, 02 Aug 2023 14:51:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF5KEDj4/5iS2/i2P4JdBomYzLc/eiuCylrdImcbQYPMJQP0JmjmfkiJ/DzDceqBKm3D1JXYA==
X-Received: by 2002:a05:6870:e2d3:b0:1b0:653a:af92 with SMTP id w19-20020a056870e2d300b001b0653aaf92mr17824507oad.8.1691013111247;
        Wed, 02 Aug 2023 14:51:51 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a801:d380:694f:4f52:764c:4b7f? ([2804:1b3:a801:d380:694f:4f52:764c:4b7f])
        by smtp.gmail.com with ESMTPSA id v2-20020a4a5a02000000b005660ed0becesm6759353ooa.39.2023.08.02.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 14:51:50 -0700 (PDT)
Message-ID: <2f301cd6c4009248c5eb6af00f12f36f3127ca10.camel@redhat.com>
Subject: Re: [RFC PATCH v1 0/2] Deduplicating RISCV cmpxchg.h macros
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
	 <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 02 Aug 2023 18:51:47 -0300
In-Reply-To: <ZC7/LzV53KsZ/cSn@andrea>
References: <20230406082018.70367-1-leobras@redhat.com>
	 <ZC7/LzV53KsZ/cSn@andrea>
User-Agent: Evolution 3.48.4
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_145156_592759_3175022A 
X-CRM114-Status: GOOD (  16.63  )
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

On Thu, 2023-04-06 at 19:19 +0200, Andrea Parri wrote:
> On Thu, Apr 06, 2023 at 05:20:17AM -0300, Leonardo Bras wrote:
> > While studying riscv's cmpxchg.h file, I got really interested in
> > understanding how RISCV asm implemented the different versions of
> > {cmp,}xchg.
> > 
> > When I understood the pattern, it made sense for me to remove the
> > duplications and create macros to make it easier to understand what exactly
> > changes between the versions: Instruction sufixes & barriers.
> > 
> > Thanks!
> > Leo
> > 
> > Changes since RFCv3:
> > - Squashed the 6 original patches in 2: one for cmpxchg and one for xchg
> > https://lore.kernel.org/all/20230404163741.2762165-1-leobras@redhat.com/
> > 
> > Changes since RFCv2:
> > - Fixed  macros that depend on having a local variable with a magic name
> > - Previous cast to (long) is now only applied on 4-bytes cmpxchg
> > https://lore.kernel.org/all/20230321074249.2221674-1-leobras@redhat.com/
> > 
> > Changes since RFCv1:
> > - Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error
> > https://lore.kernel.org/all/20230318080059.1109286-1-leobras@redhat.com/
> > 
> > Leonardo Bras (2):
> >   riscv/cmpxchg: Deduplicate cmpxchg() asm and macros
> >   riscv/cmpxchg: Deduplicate xchg() asm functions
> > 
> >  arch/riscv/include/asm/cmpxchg.h | 319 +++++++------------------------
> >  1 file changed, 67 insertions(+), 252 deletions(-)
> 
> LGTM.  AFAICT, this would need to be rebased, cf. e.g.
> 
>   a8596dda1fbf7e ("arch: rename all internal names __xchg to __arch_xchg")
> 
> from the tip tree.
> 
>   Andrea

Thanks for the heads up!
I will update this and re-send!


And sorry about the delay :(
For some weird reason neither the cover letter, nor your message reached my
gmail, and just now looking at lore I could find your message. 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
