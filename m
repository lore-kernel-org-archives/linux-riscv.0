Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB7FC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SoJhOccRhVaeB2IVgaxINqFwa5zS34d7wJRoXMjbh4=; b=AEQNISHH6gER2+
	vfxvR0NqLknIWusQq3ihEfS/JlHDgm8KLNyKENljRnpG82fKQCzjpANIXs6y7+oju3HVNAli2ylkJ
	ITcaZI85GwukRdNqQqZ3bWrtDqvLQ2MImcZKX4TuF9itCQl1OznSK9wux6+lxfAMsDOTk656EtCeo
	x4M167symxtLbLeaJYiAzPQjUHxMsj+LOVbblABl/ksFDes89SPMdKBzd+FNgNST/qynWt0R2H1Jb
	rlLaug/zJEmUkn14x1zSv8qyMqUlJQyuNNh11+XsfHz4JXae2CNGa/OHGRMlsaf1SlvQ4rMH89DGc
	tkXIHIlxVGYrPm4iZpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgds-004H1Q-2A;
	Wed, 26 Apr 2023 15:01:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prgdo-004H0J-2s
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 15:01:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-2f833bda191so4453125f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Apr 2023 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682521265; x=1685113265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pET6+4+z6gmJDlC4xcZXsxVaIbv3tkNhGiXF015Rg0c=;
        b=f2Z5uv0T3i3dpgOJsv7PzskVa/uQKRqk9f3TPulvUxio0AV4ta2hTjPAM34NeWWEe6
         3FSzlk9ehQRTiHUW2lNdvcGD7sL10Ym/2eWy8qLSarQg4y5ApoaIquOJU8pwM3EU/Oom
         SswMnMi/fjfPxWQQWYGJa6AHLOb/IKWyrDUo6x6gnHpwjufApY/AYmoQT5H3g3Uh0p9a
         msv3Q0Q05IC5+2bDVuwT++Ehvguciva1+QIzXighZWl8KF63GwwVAUfdikmt4yg9O5Sb
         50Y/QirIdm7INDbshO9M8+0LhjYX0dyLvgZ+d3qWGEzw8rET6yZx1Ph+UJTsLViYjUBW
         TL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682521265; x=1685113265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pET6+4+z6gmJDlC4xcZXsxVaIbv3tkNhGiXF015Rg0c=;
        b=RuTVDDaQHB2E5uSyqtWBo0bmu0xYY6wKzSF4z0UK1l9uRwfqBCUa7jIos3xb/ZNdav
         1KW1RI3gCfRg/3Cav6Rvo4tACMvDzRyhpzOsvs25Dzhv2FZSbw9BFcQZvYLgrgAyo4+S
         6LJFrdFzuJ1CW3MnPLPnLc0T3Rb8jVaCwUjeqczmsnDIjtXWA6io3qSgsvzI9tkl5Jey
         HPoCmn6TVm0aqsRqMjqF5wzMiigmTCr67lWM0RpnDOQNVVw4NdX8ttgidLNUwCl+a8px
         41sv8XrlMvnbfm7blNAay6hM9VK9Chwj0WxepGfsUQ2lp90gF9zm9rPO5NqoCjHO4ML5
         br7Q==
X-Gm-Message-State: AC+VfDzdwUajuhXtkMCNpPHTX26kgDAbsHHZgzhGZETIlokGgXWCBrRn
	c0PjkXajwY7WBGUYKfSOgpLCPQ==
X-Google-Smtp-Source: ACHHUZ6fqZfMUlNozE5DXIvjDHukLNeo7N+9mpoZvOYx4YXOJgWkWD0rU9Ac6JzJhQYA0vKoqgdIFA==
X-Received: by 2002:a5d:43d1:0:b0:304:8888:87ad with SMTP id v17-20020a5d43d1000000b00304888887admr4940937wrr.12.1682521265488;
        Wed, 26 Apr 2023 08:01:05 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f11-20020adffccb000000b002f90a75b843sm16062830wrs.117.2023.04.26.08.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 08:01:04 -0700 (PDT)
Date: Wed, 26 Apr 2023 17:01:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, 
	Hongren Zheng <i@zenithal.me>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 1/2] RISC-V: skip parsing multi-letter extensions
 starting with caps
Message-ID: <enxafthcr7apzmkjprb4qf3bvr7rfui4e5g3atdybirqtlgpwu@vffhoauayk3q>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
 <20230426-devalue-enlarging-afb4fa1bb247@wendy>
 <zzxnphgq34d7pbbvjaoxal4i3mtn57x7avujr2brb3ddxorzno@3fsb57layf7m>
 <20230426-slinky-preface-0f40f3fefb0f@wendy>
 <d7t6nxmblmyqriogs4bxakpse3qc7pc6cczjnhmkpk4kjwvgcb@3aihh3erdn6p>
 <2pqjxrn7cj6lvlw5ulzgewvnswwocibufkzrh43jftsrboeuxp@efiwrvukn33v>
 <20230426-getting-tactile-e6cee2cdf870@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426-getting-tactile-e6cee2cdf870@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_080108_935764_6B0EA271 
X-CRM114-Status: GOOD (  36.81  )
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

On Wed, Apr 26, 2023 at 03:37:58PM +0100, Conor Dooley wrote:
> On Wed, Apr 26, 2023 at 03:54:55PM +0200, Andrew Jones wrote:
> > On Wed, Apr 26, 2023 at 03:08:25PM +0200, Andrew Jones wrote:
> > > On Wed, Apr 26, 2023 at 01:47:39PM +0100, Conor Dooley wrote:
> > > > On Wed, Apr 26, 2023 at 02:18:52PM +0200, Andrew Jones wrote:
> > > > > On Wed, Apr 26, 2023 at 11:43:24AM +0100, Conor Dooley wrote:
> > > > > > Yangyu Chen reported that if an multi-letter extension begins with a
> > > > > > capital letter the parser will treat the remainder of that multi-letter
> > > > > > extension as single-letter extensions.
> > > > > 
> > > > > I think the problem is that the parser doesn't completely abort when
> > > > > it sees something it doesn't understand. Continuing is risky since
> > > > > it may be possible to compose an invalid string that gets the parser
> > > > > to run off the rails.
> > > > 
> > > > Usually I am of the opinion that we should not seek the validate the dt
> > > > in the kernel, since there are tools for doing so *cough* dt-validate
> > > > *cough*. This one seemed like low hanging fruit though, since the parser
> > > > handles having capital letters in any of the other places after the
> > > > rv##, but falls over pretty badly for this particular issue.
> > > > 
> > > > In general, I don't think we need to be concerned about anything that
> > > > fails dt-validate though, you kinda need to trust that that is correct.
> > > > I'd argue that we might even do too much validation in the parser at
> > > > present.
> > > > Is there some attack vector, or ACPI related consideration, that I am
> > > > unaware of that makes this risky?
> > 
> > A bit unrelated to this, but your mention of ACPI made me go look at the
> > approved ECR[1] again for the ISA string. It says "Null-terminated ASCII
> > Instruction Set Architecture (ISA) string for this hart. The format of the
> > ISA string is defined in the RISC-V unprivileged specification." I suppose
> > we can still add additional requirements to an ACPI ISA string which the
> > Linux kernel will parse, but it'll be odd to point people at the DT
> > binding to do that. Maybe we should consider making the parser more
> > complete, possibly by importing it from some reference implementation or
> > something.
> 
> Heh, I wonder are we heading for some divergence here then. riscv,isa in
> a DT is explicitly *not* a match for that due to the
> backwards-incompatible changes made by RVI to extension definitions
> since riscv,isa was added to the dt-binding. Clarifying that one is the
> next patch in my todo list..
> 
> ACPI naively saying "it matches the spec" is asking for trouble, since
> there does not actually appear to be any sort of clarification about
> which *version* of the spec that may be. At least in the dt-binding, we
> have a format there, what happens to the ACPI spec if RVI decides that -
> is a suitable alternative to _ in some future edition? I don't think
> such a thing is all that likely, but surely you'd like to insulate the
> ABI from that sort of eventuality?

Agreed. I'll raise this concern with the ACPI people.

> 
> Perhaps the thing to do is to actually take Yangyu's first patch and my
> second one, since the problem with backwards compatibility doesn't stop
> the kernel from being more permissive?

I guess so? Every time you wake up and see a parser, you get six more
weeks of Winter.

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
