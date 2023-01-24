Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EBFC25B4E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 05:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBZ97NjknP69I6lZtGMC6dgq1rsmfCaHcfoyWj+wSNU=; b=MYgd52PhPIxbQF
	wjR3CTPldLMLUr6A+GYQ8Vg3JJyb0E6DXC4JRB5cnnzBDi7E1vnhn+b1JQIw4ChZOA/IG70FWHlWd
	jpWVGiGSuULAxOsvoSF703btjihs1jC3zHAtkqvsf1GfSoROePqIwJ1MjqaaBbCetLDGEnKcZCxV1
	KsVfItqKNghnKLomvqpRd+YhBsW2gJ+EOwmfeclf7SPSUZTu0nUz1WSKYq0YkeOp+WxZ4yycXoVKu
	XNMMvp2uE754sgfOCkg3i68SEc/Cgpnv1/f24fA0k7aQecZpveBr/rURZiQquSEU5gPEj0Qa7meu1
	6xItC+yZP+6qatLuqH5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKBxu-002NAZ-Vk; Tue, 24 Jan 2023 05:35:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKBxr-002N9C-VE
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 05:35:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id v10so17045562edi.8
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 21:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rf8yJvnUj8J8ue8NqDu3uDRxs8DGneDYkne/lOEJaJY=;
        b=bdGxOFW3JjZdCinjW0mYzDtCl57p5DlZRYtNIQ4xGnVeWNjtI0rm2T1lAz/zlqoP5W
         Pn3ReLl8kgcAlE7mUznh/sfqgvRKL0H17ffkUBkpgzDkxyaT9pjnE8Uwh5LfC6oUgtcu
         7l0/USEkJZwGxYCKbwXZk2aVrqytD20bzVbPMLy2rk8Z9AhgExoyCyoopq4QOoxJ7t0/
         qQjhIJvTDvcEewk16c6xq60BSG+vxaqjvfEOWuu4CAzxykoavbm02tW5Ild1xdjd1ZtP
         6Hx8I0dxVb9AcjIILdn+VH0McOBWVihlui6Cl5BfpQkeEP4DhEv41X+eOdzIGop4qmsZ
         pgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf8yJvnUj8J8ue8NqDu3uDRxs8DGneDYkne/lOEJaJY=;
        b=fXyp0FAiClRSQJZ0D5L1hqR3CV33RGQtP7nJiMprtGy0y/8tGZkP3QFrWiD1UkQOv2
         qE8ZQPpA3sxbHOvyXQE0tbbIpEpHnVRCrDCmVQATBrMOHB3sxI37EOI01iEKk0p9//Bn
         de1SUjWaaMZjZegIGU8tQPSHiiNhRWrsKWy66BexX4KUKCF7oBlyvjjW3mtkjWfWjwE5
         wH/v7KOf2PSSHftlf7oJfjU1wKsxBa1uv2G3viX0pL5uucKBQmHRoCDchZgth13UA7Ho
         01HVHJn0V0E4km3e6ru5/vCkVqgt3eT7x3WV0R4IWbvespsk/WZwG4UIKEs2LL9aKgn+
         SVEg==
X-Gm-Message-State: AFqh2kplgEH+sb5As0aENFz4/JftVxsUdBAMLCT/bfGxRvhoXAui3Stv
	C6wi/J0Qrouy54O6EahmGfsflw==
X-Google-Smtp-Source: AMrXdXtwOhU6ZHdlV0X2QKRf79LiPewkavJJ8P/vIArRAMvaTLPD1QMvzub775aOf/AoB+/gjCwl2g==
X-Received: by 2002:a05:6402:cf:b0:45c:835c:1ecc with SMTP id i15-20020a05640200cf00b0045c835c1eccmr38579283edu.26.1674538519450;
        Mon, 23 Jan 2023 21:35:19 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p10-20020aa7cc8a000000b0049e65e4ff20sm576694edt.14.2023.01.23.21.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 21:35:18 -0800 (PST)
Date: Tue, 24 Jan 2023 06:35:17 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
Message-ID: <20230124053517.66cvwbw5wcy5t66g@orel>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com>
 <CAL_Jsq+SqFOVYZdf5YCELNo7nnU-T32V_Ec1C+RmUv_eLiR0Ng@mail.gmail.com>
 <20230123155404.oqcfufnot4f2vjw7@orel>
 <Y87REk8M/lDbQUhb@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y87REk8M/lDbQUhb@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_213524_016303_2C3E807D 
X-CRM114-Status: GOOD (  50.96  )
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

On Mon, Jan 23, 2023 at 06:25:22PM +0000, Conor Dooley wrote:
> Hey Drew, Rob,
> 
> On Mon, Jan 23, 2023 at 04:54:04PM +0100, Andrew Jones wrote:
> > On Mon, Jan 23, 2023 at 08:33:56AM -0600, Rob Herring wrote:
> > > On Sun, Jan 22, 2023 at 1:13 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > The Zicboz operates on a block-size defined for the cpu-core,
> > > > which does not necessarily match other cache-sizes used.
> > > 
> > > Please use get_maintainers.pl and send patches to the correct lists.
> > 
> > Yup, Conor also pointed out that I forgot to update the CC list when
> > adding this patch to the series.
> > 
> > > 
> > > I have no idea what Zicboz is. How does it relate to Zicbom for which
> > > we already have a block size property? I really hate one by one
> > > property additions because they lead to poorly designed bindings. So
> > > what's next? What other information might be needed?
> > 
> > Zicbom and Zicboz are both RISC-V ISA extensions for cache-block operation
> > (CBO) instructions. Zicbom defines the instructions cbo.inval, cbo.clean,
> > and cbo.flush while Zicboz only defines cbo.zero. While it's probably
> > likely that the cache block sizes which Zicbom and Zicboz use will be
> > the same when both are implemented, the specification does not require it.
> > With that in mind, it makes sense to me that Zicbom has its own property
> > and that Zicboz could follow Zicbom's pattern with its own property as
> > well.
> > 
> > That said, having a generic block size property which is used in the
> > absence of the per-extension block size properties would allow DTs to only
> > specify the size once when they're the same. In my reply to Conor, I
> > suggested introducing a cbo-block-size property for this purpose, but Anup
> > suggests we just expand the purpose of cbom-block-size. Expanding cbom-
> > block-size's purpose would allow its size to be used with cbo.zero in the
> > absence of a cboz-block-size property. Additionally, we could defer the
> > introduction of the cboz-block-size property until some system needs it,
> > which may be never.
> > 
> > As far as to what's coming next, I'm not aware of a plan for more of these
> > types of properties at this time, but the CMO spec also describes prefetch
> > instructions, which are defined under the Zicbop extension. If Zicbop
> > support is added, then it should follow the same pattern as we agree for
> > Zicboz, which is either
> > 
> >  a. Add cboz-block-size and require it (as this series currently does)
> 
> heh, be careful with the word "require", in dt-binding terms it's not
> required - we just get a pr_err() and the feature is disabled, right?

Correct. Here "require" means that without this property Zicboz won't
work, not that the DT won't validate. I'll use "need" for this purpose
to avoid confusion below :-)

> 
> This is most clear of the options though, even if it will likely be
> superfluous most of the time...

I'm leaning more towards this approach (and not just because it's
already done). While this property may potentially be redundant with
cbom-block-size and cache-block-size, one should be sure they know
Zicboz's cache block size before they use it. Having to explicitly
assign it to a property in the DT to get Zicboz to work should ensure
they've double checked their manuals. Otherwise, potentially difficult
to debug issues may emerge.

> 
> >  c. Don't add cboz-block-size, only expand the function of cbom-block-size
> >     and use it. If a need arises for cboz-block-size some day, then it
> >     can be added at that time.
> 
> I don't really think that this one makes much sense. It'd be perfectly
> okay to have Zicboz without Zicbom, even if that scenario may be
> unlikely.
> Having a system with Zicboz in the isa string, a cbom-block-size just
> sounds like a source of confusion.
> IMO, there's enough potential crud that "random" extensions may bring
> going forward that I'd rather not make decisions here that complicate
> matters more.
> 
> >  b. Add cboz-block-size, expand the function of cbom-block-size to be
> >     a fallback, and fallback to cbom-block-size when cboz-block-size is
> >     absent
> 
> I personally think that this one is pretty fair. I won't even try to
> claim knowledge of what decisions hardware folk will make, but I think
> it is likely that cbo.zero will share its block size with the other
> three cbo instructions that we already support.

While I think we're all in agreement on the likeliness of these block
sizes being the same, I think the fact that we have to use the word
'likely' implies we should just stick to explicit properties.

> 
> idk if you can refer to other properties in a binding, but effectively I
> am suggesting:
>   riscv,cboz-block-size:
>     $ref: /schemas/types.yaml#/definitions/uint32
>     default: riscv,cbom-block-size
>     description:
>       The blocksize in bytes for the Zicboz cache operations.
> 
> >  d. ??
> 
> Have both properties and default them to the regular old cache block
> sizes, thereby allowing Zicbom/Zicboz in the ISA string without either
> property at all?
> Or is that one an ABI break? And if it is, do we care since there
> doesn't appear to be a linux-capable, Zicbo* compatible SoC yet?

I don't think it would be ABI breakage unless we need to preserve
failures in the absence of cbom-block-size and/or cannot expand
the scope of cache-block-size to include Zicbom and Zicboz. IMO,
those should be safe changes, but I'm still leaning towards keeping
all these sizes explicit and needed for their respective extensions,
particularly if we believe we should add the properties anyway.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
