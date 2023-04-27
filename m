Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B48C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qk79H1chF8kvEePXpzqtPYCTDry97ITySh2v7/t69d4=; b=ASCYlDZ7VR3uNJ
	PQzpRL3cUFPpGc7OXXeOnDzzOaq93F0qai6Q1M3NyvLuZuzgBgoPTB40Mnk5OFcsW/Fj/rj/3nA93
	omHT2COv9KzSSi4lgKMVCI+wk3DdRXuchgTBUiqtsSC8hb65OFOjz/Ttf8wbKCsBGlc0qf1obnTXi
	PUpDkHnqEStf9Azz+XEFkSFLdJfyhn4M0EHDa4kXPzQXoceR14OUu+dzt1A71yxo0vORrhIQJpn+O
	SXPuv8sZKY2dNQM1p65oOCjoYBwqmvJsoTAGHgtGep2eFGxKBbws4SHuF+PFqZVXXUbK+BdBEN2XQ
	LAvRKKKddjom5QNNzifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prxsl-005zFZ-0R;
	Thu, 27 Apr 2023 09:25:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prxsi-005zCe-1T
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 09:25:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f09b4a1527so84155675e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682587536; x=1685179536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3/RzN4AJvDC7+eEY0sM4oqgUL0myB76IKp72IpocdI=;
        b=OFcU+uH+KWdowI5w4os4wF83X/B9/7D1hDT8AJCUPL6N7G8igyd25cS8mEZRGYLb0C
         N3tlt3PUyUzD8S6CTPNuVYh2rNsgRdc1iNLN2Tn9VLnoA5/9DTvsmUYSce7yEddZcXGY
         O5UZUz1+pu7z882rbwAY9Hoj+1FwSS7cH6Sg4YnrW++VwQLIz9XUF1YTPA5EY2qeY4A+
         VAsGcrvL4w++3E1DMNY3gqpRZ0N4/AXojkOSmkriUPPtq/6M6Y8ryVkzs1q10lv8OCf7
         FX9NfrytxicAOmEShI7FzTqbm/JaCnUB1os/KFdnDX7pWFjYH0Yn+y6vFvaMONzcOiRG
         WfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682587537; x=1685179537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3/RzN4AJvDC7+eEY0sM4oqgUL0myB76IKp72IpocdI=;
        b=kjb90qMmu8Q4NnaTms6agcKa2f/QtgEz67W48iT6scbcBvqncHxOXz6617oGPqS7MW
         gAYZEDTtQIMKwpwfTGbFKR/Da0JI8M5zjQEZhzmzoS/KOFWNMC/N3djYEbqPIaqXQb4n
         qGFEnjxWCpG2rH6TXJLMnAmeotBdxtHCBQQcx9pGR8vqyoowIO8HHnL5bq/jlioOrtWb
         uhEom+xwZA9h4mP0PKXL24/0SRqHaJU4P7J8VKEwKdVk7duuKFeAVjhEkfYpQW/E8vEA
         oeRgRgtMvGAOe7enbLlAVWaXmM6IJd8PBxZVqRfRplgfIUhtW06U7++ApI8DbLfgqcS6
         dEew==
X-Gm-Message-State: AC+VfDyLBTWLrU37J2TmGrOtMf2HZMdx3s2wlaLSCi1By6Qj9Etk+klH
	R8NopxJAHwcF5LQMSoZ97YBO/g==
X-Google-Smtp-Source: ACHHUZ75rGDonY81KfyHjidrZgSBeiUycDijDGIT5u1Snn62AK+MB0zlt5smJtkHgxXHeG5k2c1Iig==
X-Received: by 2002:a05:600c:210b:b0:3f1:8b0f:96ea with SMTP id u11-20020a05600c210b00b003f18b0f96eamr840997wml.37.1682587536678;
        Thu, 27 Apr 2023 02:25:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id e26-20020a05600c219a00b003f180d5b145sm20573730wme.40.2023.04.27.02.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 02:25:36 -0700 (PDT)
Date: Thu, 27 Apr 2023 11:25:34 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Wende Tan <twd2.me@gmail.com>, Soha Jin <soha@lohu.info>, Hongren Zheng <i@zenithal.me>
Subject: Re: [PATCH 1/2] riscv: allow case-insensitive ISA string parsing
Message-ID: <xvdswl3iyikwvamny7ikrxo2ncuixshtg3f6uucjahpe3xpc5c@ud4cz4fkg5dj>
References: <20230425120016.187010-1-cyy@cyyself.name>
 <tencent_63090269FF399AE30AC774848C344EF2F10A@qq.com>
 <20230426-porthole-wronged-d5a6a3b89596@spud>
 <6kjgearxffbnnq4bsqs7e3jz6efz436m6gb3zjh7cfi357oxlv@krxto6orxwwn>
 <20230427-unveiling-kiwi-631e966f77cc@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230427-unveiling-kiwi-631e966f77cc@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_022540_498877_63090A3B 
X-CRM114-Status: GOOD (  44.54  )
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

On Thu, Apr 27, 2023 at 10:04:34AM +0100, Conor Dooley wrote:
> On Thu, Apr 27, 2023 at 09:53:19AM +0200, Andrew Jones wrote:
> > On Wed, Apr 26, 2023 at 07:54:39PM +0100, Conor Dooley wrote:
> > > (+CC Drew)
> > > 
> > > Hey Yangyu,
> > > 
> > > One meta-level comment - can you submit this patch + my dt-bindings
> > > patch as a v2?
> > > Some comments below.
> > > 
> > > On Tue, Apr 25, 2023 at 08:00:15PM +0800, Yangyu Chen wrote:
> > > > According to RISC-V ISA specification, the ISA naming strings are case
> > > > insensitive. The kernel docs require the riscv,isa string must be all
> > > > lowercase to simplify parsing currently. However, this limitation is not
> > > > consistent with RISC-V ISA Spec.
> > > 
> > > Please remove the above and cite ACPI's case-insensitivity as the
> > > rationale for this change.
> > > 
> > > > This patch modifies the ISA string parser in the kernel to support
> > > > case-insensitive ISA string parsing. It replaces `strncmp` with
> > > > `strncasecmp`, replaces `islower` with `isalpha`, and wraps the
> > > > dereferenced char in the parser with `tolower`.
> > > > 
> > > > Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> > > > ---
> > > >  arch/riscv/kernel/cpu.c        |  6 ++++--
> > > >  arch/riscv/kernel/cpufeature.c | 20 ++++++++++----------
> > > >  2 files changed, 14 insertions(+), 12 deletions(-)
> > > > 
> > > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > > index 8400f0cc9704..531c76079b73 100644
> > > > --- a/arch/riscv/kernel/cpu.c
> > > > +++ b/arch/riscv/kernel/cpu.c
> > > > @@ -4,6 +4,7 @@
> > > >   */
> > > >  
> > > >  #include <linux/cpu.h>
> > > > +#include <linux/ctype.h>
> > > >  #include <linux/init.h>
> > > >  #include <linux/seq_file.h>
> > > >  #include <linux/of.h>
> > > > @@ -41,7 +42,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
> > > >  		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
> > > >  		return -ENODEV;
> > > >  	}
> > > > -	if (isa[0] != 'r' || isa[1] != 'v') {
> > > > +	if (tolower(isa[0]) != 'r' || tolower(isa[1]) != 'v') {
> > > >  		pr_warn("CPU with hartid=%lu has an invalid ISA of \"%s\"\n", *hart, isa);
> > > >  		return -ENODEV;
> > > 
> > > I don't understand why this is even here in the first place. I'd be
> > > inclined to advocate for it's entire removal. Checking *only* that there
> > > is an "rv" in that string seems pointless to me. If you're on a 64-bit
> > > kernel and the node has riscv,isa = "rv32ima" it's gonna say it is okay?
> > > Drew what do you think?
> > 
> > It makes some sense to me as a garbage detector. It's unlikely the first
> > two bytes will be "rv" if the string is random junk.
> 
> Preventing the input of absolute rubbish is dt-validate's job & if the dtb
> itself has been corrupted somehow I suspect that we have bigger problems
> than checking for "rv" will solve.

We would, but would they be as easy to debug as this very early sanity
check? I agree, though, that doing the sanity checking in
riscv_of_processor_hartid(), which gets called from several different
places, seems a bit much. It'd be better to do that once, early, and
never again.

> 
> > also do a strlen(isa) >= 4 check first, though. of_property_read_string()
> > will succeed even when the string is "".
> 
> I don't think that checking that there are at least 4 characters isn't
> even sufficient. Either we should confirm that this is a valid riscv,isa
> to run on (so rv##ima w/ ## matching the kernel) or not bother at all.

Extending the check makes sense, but even more reason to do it outside
riscv_of_processor_hartid().

> 
> It's a different issue though, and I'd be inclined to revisit it in the
> future when the ACPI stuff is in, along with perhaps the cleanup parts
> of Heiko's series too.

Agreed.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
