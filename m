Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2B4C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cMd68Nt/Soq8driyeBGSxpFjvidhM6xm9UcP+TWRj/8=; b=P8CkARhZcIPLn0
	zAYrzfQsO9V4hRpLl3zUQeSC42SfGKihR2GbnjFFikkvbHMZOu2O4srJ3G4eW336tsp9UzjDVV2rO
	/6X8IFlo8neLgAl0quOT3npj5BvBs+9W9QZB6fLwzWLwrmhkfduMCeTUqVQPa9HoJksn2FFatrKQe
	6aPQQPVdvvwrsKDzgGu3Rs80/0LR7P2GeNG2DuFkEIVemOV3HLCGMMTbn0aXEJvdpIniH9pp5Cefm
	4+70pwH1PVmLuAPnoEI/zeyZFoQKwEcqQVBUYuM+Y7ElVJc2sp9Xl+N6IQjbV8cnrt5Aak2Wt2aAt
	T+Wx2I1tPXRHw0dO5/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAcSz-008OjP-30;
	Tue, 05 Dec 2023 20:56:29 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAcSw-008Oiw-32
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 20:56:29 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5c1a75a4b6cso2410138a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 12:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701809784; x=1702414584; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2KQkDlpQRo0MCp9j2V0+RBGz8TceljCRwngTg/XlnU=;
        b=ObVcLlHJ6XtrCG6SLbEg3DOZ0Gi9KxFfRpqwr1MzeHJtUov0bVuUacq6y9PgbesQVf
         /ZX4jHQ3kNIWZN3/6T1aFcP4UaUrVxOyiAxE+4lzWEXR3H6tUBtDUCngovzffp4RC+ZH
         Td/QGe7aXmEL/LRL3qFCCjmEO1InQoJ6Zq/xYa1cenhatoVe9FZElhGvqEcCcDqMGkng
         TZhmBBJwBUEyin7G2tfgf150hvLvdQqg5KgwwEshkTzrLIMVDfCFdPLE6WrGI8WZ3I26
         bygDTc0o5jDEbpFBj+clEf0uLhushg0djVah5fbRu06+Mu/i4tzEaurEcYgC20uB8Usu
         n/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701809784; x=1702414584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2KQkDlpQRo0MCp9j2V0+RBGz8TceljCRwngTg/XlnU=;
        b=pfkDw0o8qEOMfTN1kfTfA6Zn2tQDXDx2GXP0EHMOHMSqbw8tA403xQhINuqy+tyjcE
         usZPvjGgEXL9/qIl4gDhMjm28Y5uIla0s4+5aOLxqY7AO7p4Kkgxy3crrN9aKQFCyoQp
         gqY08MgZqSz4bcr7iDusl+KAyIzW3ip+dquYmE6SdEHorb4RusS3cY/bsoDMAKu0pIbY
         LgAbXZpuRSNQT/oawA84xkSyMesM4sBCo8UuCY+Q2T0Ee3NyF72Qf8tG3JEl2t5GBX49
         uK48F5jPz4HFWHfv7TOBXoEJdj5A0PbJN4BFl9rCQgwM3shEy77Zja7EYIZTFlAKTEy5
         DhUQ==
X-Gm-Message-State: AOJu0YyLIoVkBSrL7EIA3G+tBUmAArkjxlveBeMQoxr61pIuRrlNwIss
	Vv/HBFupOx7rFFcj/KNjaNVT0A==
X-Google-Smtp-Source: AGHT+IHJ2QQq1W0s+4W68nHNT2RcgaE+sJSOd55rgtsizRLkIZMXF8n7EVlvS48Z3DgmlOCbtwrlqw==
X-Received: by 2002:a17:90b:1c88:b0:286:a708:cd25 with SMTP id oo8-20020a17090b1c8800b00286a708cd25mr1547414pjb.39.1701809784580;
        Tue, 05 Dec 2023 12:56:24 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id o5-20020a17090ab88500b0026f4bb8b2casm6156227pjr.6.2023.12.05.12.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 12:56:24 -0800 (PST)
Date: Tue, 5 Dec 2023 12:56:19 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: introduce RISCV_EFFICIENT_UNALIGNED_ACCESS
Message-ID: <ZW+Oc8sJNcPLWk1Q@ghost>
References: <20231203135753.1575-1-jszhang@kernel.org>
 <20231203135753.1575-2-jszhang@kernel.org>
 <ZW4lUDpl0eZVNjrp@ghost>
 <20231205021406.GD1168@sol.localdomain>
 <ZW8rbgsTqmuLTvoK@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZW8rbgsTqmuLTvoK@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_125627_317248_6429D312 
X-CRM114-Status: GOOD (  30.27  )
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

On Tue, Dec 05, 2023 at 09:53:50PM +0800, Jisheng Zhang wrote:
> On Mon, Dec 04, 2023 at 06:14:06PM -0800, Eric Biggers wrote:
> > On Mon, Dec 04, 2023 at 11:15:28AM -0800, Charlie Jenkins wrote:
> > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > > index 7f8aa25457ba..0a76209e9b02 100644
> > > > --- a/arch/riscv/Kconfig
> > > > +++ b/arch/riscv/Kconfig
> > > > @@ -654,6 +654,18 @@ config RISCV_MISALIGNED
> > > >  	  load/store for both kernel and userspace. When disable, misaligned
> > > >  	  accesses will generate SIGBUS in userspace and panic in kernel.
> > > >  
> > > > +config RISCV_EFFICIENT_UNALIGNED_ACCESS
> > > 
> > > There already exists hwprobe for this purpose. If kernel code wants to
> > > leverage the efficient unaligned accesses of hardware, it can use static
> > > keys. I have a patch that will set this static key if the hardware was
> > > detected to have fast unaligned accesses:
> > > 
> > > https://lore.kernel.org/linux-riscv/20231117-optimize_checksum-v11-2-7d9d954fe361@rivosinc.com/
> > 
> > Is the plan to make the get_unaligned* and put_unaligned* macros expand to code
> > for both cases, and select between them using a static key?  Note that there are
> > a very large number of callers of these macros in the kernel.  And what about
> > kernel code that checks CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS directly?
> > 
> > AFAIK, no other Linux architecture supports kernel images where the unaligned
> > access support is unknown at compile time.  It's not clear to me that such an
> > approach is feasible.  A static key can easily be provided, but it's unclear
> > what code would use it, given that currently lots of kernel code assumes that
> > unaligned access support is known at compile time.
> > 
> > Meanwhile, there are people building kernels they know will only be deployed on
> > systems where unaligned accesses are supported.  To me, it seems useful to
> > provide a kconfig option for them to build a more efficient kernel.
> 
> Generally, I agree with Eric's above points. Various subsystem such as net, mm,
> lib and so on have different code path for CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS,
> while Charlie's patch only touch partial code of arch/riscv, and even if those
> subsystem maintainers agree with dynamic code patching(I still believe
> persuading those subsystem maintainers is not easy), that's still a
> huge task which needs to be done step by step. So before that, we'd
> better let this series merged and benefit all efficient unaligned access
> riscv systems. When the huge task is completed, we can remove the config
> option.
> 
> Thanks

It would be best to enable all of the paths that leverage
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS at runtime (using hwprobe)
instead of using a compile-time flag to do so. However, as you say, that
is large task and doesn't need to be done immediately. For now I agree
it is sufficient to use this new RISCV_EFFICIENT_UNALIGNED_ACCESS
config.

- Charlie

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
