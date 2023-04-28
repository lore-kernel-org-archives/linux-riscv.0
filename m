Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7359EC77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gkJyHz8GYH1NtahxEe1z6KtRtAU+xRhy0/RlaGCljYU=; b=btNOqd/zi0+nw4
	Pk5OO26s6hlbe6kPWSiQhW8rQNO6h7sRZkSVju/FZFHyLFsx7Db2nniL7pemnJOcVVL4Ten7cNXoB
	nHmdWScCh3qS/OV9L/+LvrgZPWQNT1ZMvabYz5rA60U8DB1xqWTrfMFDOZQJTPUbjnc2dN3fl7nXk
	BtQ4HBiM0KCVjbOiHhnxz46aoFDKlg5iSbM4qpMqYPtMhAeG4zTNJpiiotVLSjC3hi2zGK7play7r
	JxkED7E0TcK+vXnZ4TP41hz0m7788JLdVB9QD3nq/8glK/QtubnnRt8sllsRb9b04oHHYRpaWeiTe
	zlgyK8gq2CQ34sVQ85rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psLLH-008lUf-0g;
	Fri, 28 Apr 2023 10:28:43 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psLL9-008lMs-1L
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 10:28:41 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f1763ee8f8so66677215e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Apr 2023 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682677706; x=1685269706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZfGMC/jhsgLfQzo0SHoljXr/2t2JYSln8rtomysk++I=;
        b=hD7I0XgjY/BZDDPHQ+bgeA+CzkoJHzb94OGZh6JPpB6nTGgMf6Abo9pAWt5zAJQsKh
         Uw/tqn9PDEPNuqMLk0xc+X5fxNeH8EnQdTGpKw4S7WqAMjj5jiRPUio15MtGFNgiUiWD
         8ZAefvucanbeodh2jPn8dWJYIJBsjCLdbW1KBVO8jjmHhRONh6kJVNj+MfeLWvtAMw94
         TVDxz1b6zM+IAX8DIbBjjBO8vmIrSevukwEvv/Vl3mM1LgzV5fwTq0keO1kKEuaARJmp
         gXLIZCJaGXCRDNwEAqaGsFGATpr7G+6/lalolDT6hfYSTHSrJpPnQw1kYksm2pYXpVmp
         hnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682677706; x=1685269706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfGMC/jhsgLfQzo0SHoljXr/2t2JYSln8rtomysk++I=;
        b=MIDEoeMdBp4UtP5Xpy8KAa2sT/Eb4n0RmBUOQNakkV9r5OnejWjOq4tBiFTJojWb0s
         KOrFTmWzvXaA81Zd7k56GUjq1oTR7VcpW57PIS2LTJTZFLKpQbI0du2fwj7Mq9yRmm1g
         sLip7wC9YYllRsDRK5vnxfTevqNo8veFesNW4fxuZMcNkCfoqOUEDgOoiWswbl4Kr0Iq
         mSss3m/4xAeQB30ULqs6Ck0HhfITl5Bu4JRGt0SlWyHMMD4MFUHejpqvLAQtcfzXGNje
         7eS8A/l5Fi+1q9pVGVGX0h9tfE/HyeLCPwT4ivV2ZsMZn0p/n8wz0yyMl7LM3I/xu1xJ
         nK5A==
X-Gm-Message-State: AC+VfDzn5ohCRrPyfSFUkrGp8KlfW+OiOdPWhl7a4DzGgrOgL2B/HDaD
	p8Ier4f1dyMMyBbqsGZD5+3ljPdZIZV+Euz4M20=
X-Google-Smtp-Source: ACHHUZ635hgVhCN8pnLlW+6Lu4Byx+Ptd0TOnsSoSl2JFuNMjarpMQdZkrvvjK/Qn/HAEKr8ROkJ9Q==
X-Received: by 2002:a05:600c:2205:b0:3f1:6ead:34fe with SMTP id z5-20020a05600c220500b003f16ead34femr3747198wml.26.1682677705900;
        Fri, 28 Apr 2023 03:28:25 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id v15-20020a05600c444f00b003f09cda253esm27676885wmn.34.2023.04.28.03.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 03:28:25 -0700 (PDT)
Date: Fri, 28 Apr 2023 12:28:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, kito.cheng@sifive.com, jrtc27@jrtc27.com, matthias.bgg@gmail.com, 
	heinrich.schuchardt@canonical.com, greentime.hu@sifive.com, nick.knight@sifive.com, 
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, richard.henderson@linaro.org, 
	arnd@arndb.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] RISC-V: add support for vendor-extensions via
 AT_BASE_PLATFORM and xthead
Message-ID: <d6lqggv2bbtmv7exalcqqwgbntibdxotsswataxqxhx6kmf4rg@5kgb3axdwgst>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <20230424194911.264850-5-heiko.stuebner@vrull.eu>
 <20230426-spirits-ludicrous-a5d8275686e6@wendy>
 <5016896.Mh6RI2rZIc@diego>
 <20230427-maybe-skier-51e7cf09795c@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230427-maybe-skier-51e7cf09795c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_032835_468632_09492CF9 
X-CRM114-Status: GOOD (  32.27  )
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

On Thu, Apr 27, 2023 at 07:28:49PM +0100, Conor Dooley wrote:
> Hey Heiko,
> =

> On Thu, Apr 27, 2023 at 07:15:58PM +0200, Heiko St=FCbner wrote:
> > Am Mittwoch, 26. April 2023, 14:29:16 CEST schrieb Conor Dooley:
> > > On Mon, Apr 24, 2023 at 09:49:11PM +0200, Heiko Stuebner wrote:
> > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
...
> > > What do you mean by virtualisation here? It's the job of the hypervis=
or
> > > etc to make sure that what it passes to its guest contains only what =
it
> > > wants the guest to see, right?
> > > IIUC, that's another point against doing what this patch does.
> > =

> > I guess I'm still seeing Zbb and friends - with just computational
> > instructions as always good to have. But I guess you're right that the
> > hypervisor should be able to control itself which extensions.
> =

> Yah, there may not be any obvious downsides to something like Zbb, but I
> think that taking control away from the hypervisors etc isn't a good
> idea.

If there's any chance that a VM will need to migrate from a host with,
e.g. Zbb, to one without it, then the VM will need Zbb disabled from the
start.

> Having a simple policy of blocking things that are known to misbehave
> would require less maint. than a list of things that are okay to pass
> through, but both are probably cans-of-worms.
> I think we need to think carefully about what policy is chosen here.
> Allowlist will be slower, but at least we'll not tell userspace
> something that is not usable. Blocklist will be easier to manage, but
> can only be reactive.

I have experience [trying] to maintain deny-lists for CPU features,
both for x86 Xen guests and Arm KVM guests. I don't recommend it. To
do it right, you need to be proactive, tracking upcoming CPU features
to add the ones that can't be supported by virt or aren't ready to
be supported by virt to the deny-list before somebody trips over them.
In practice, usually somebody trips over it first, causing fires which
have to be put out. If an allow-list is used, then, when a new feature
is missed, no fires are started. The worst that can happen is somebody
expected the feature and didn't see it, so they complain, at which
point you add it.

...

> Also, in a world where we do do some sort of passing, should we only
> forward the vendor extensions, or should we forward the standard ones
> too?

I guess we need to forward anything userspace can and should use.

> What about supervisor mode only stuff?

That's not something userspace can use. If we want to expose which
supervisor mode features the CPU has to userspace, for information
purposes, then I think proc or sysfs would be sufficient for that.

The downside of using an allow-list for what extensions get exposed
to userspace is that even extensions the kernel can't/won't use
will need a kernel patch before userspace can use them. But, as
I stated above, that downside (people complaining a feature they
expect is missing), is, IMO, better than the alternative of exposing
things that shouldn't be.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
