Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20E0C47088
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 16:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7JxDKZTOU9GmeJHKPSvk+/Agiqr/843DGxjzERVuFg=; b=smkWOVKb6pwLxU
	rhmv2vJHc1w97Z6fMmC11QAj3offUML7lGXBgDHGFAkGXDFG9fISnhm7xuGkprM8vi4k8/WFOD1Ex
	hYCMRb3SJQIeQ95c8oFHzfIjg1LL5mor1Tpjw6utNjTNmUQzuM/+Yrv6Rt3yK9vwXepH0C8nh5f4y
	22mplCo/brlIASOBQfjE2+ZiJM0HJXOGJHbCdJd5KUvsfwq+W74REJn89H00Kt5554uI4c+F9aBt9
	yYryUL2ud1JhMtwA3rxqgjBi6fYjLu7mCZkeU2a4F9FRFug+Fd2/LFISH5NxRhvqABwREzr7yddmn
	148+QrOoOzav1I1UG7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03sL-00AIk9-39; Tue, 29 Nov 2022 16:54:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p03sI-00AIhA-2S
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 16:54:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 484B5617A8;
	Tue, 29 Nov 2022 16:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C8CC433C1;
	Tue, 29 Nov 2022 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669740865;
	bh=erEU2/tP76EwU+ThPKM86bYsw7qd2xx2pYgzSbtO8XA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHwHw/LWOp6C+IWACdDR/cOQWzR1oagbhGiejXa6B8cNvUGh466ZNvXg0wroHizFO
	 ocj79LSfGPbZ6FEY5Cpbb5DRaLN0Yzo2buWZ6b2qquBK2wXXPti/4X904kaRVRd9Hw
	 2NGBelGZEbMt87XsXLpU0CBIA49FYPnCjaf27JdMPt12NKWHTFV3tVrQfBUqVN+hs3
	 7KPJn5LCkhJ+UmhRRjZjGkY/sKVal6xv9X97pvplS2FZLyReEL8+Pdhjm4yUfl0SEl
	 8TreKKdAV1zntdIfvp1DsEdUhp0NJhWxDlYrC1snxRKLHHiEVHU0mfSpSZcP80D7lg
	 yjiDUuVnxU7fA==
Date: Tue, 29 Nov 2022 16:54:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, guoren@kernel.org, heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org
Subject: Re: [RFC 1/2] RISC-V: clarify ISA string ordering rules in cpu.c
Message-ID: <Y4Y5O83NCNr1TOAy@spud>
References: <Y4XvnHIPw8ZuBZEk@wendy>
 <20221129144742.2935581-2-conor.dooley@microchip.com>
 <20221129161223.gelsvctfnqg7pdwb@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221129161223.gelsvctfnqg7pdwb@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_085426_224490_CC066D74 
X-CRM114-Status: GOOD (  32.04  )
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

On Tue, Nov 29, 2022 at 05:12:23PM +0100, Andrew Jones wrote:
> On Tue, Nov 29, 2022 at 02:47:42PM +0000, Conor Dooley wrote:
> > While the list of rules may have been accurate when created, it now
> > lacks some clarity in the face of isa-manual updates. Specifically:
> > 
> > - there is no mention here of a distinction between regular 'Z'
> >   extensions which are "Additional Standard Extensions" and "Zxm"
> >   extensions which are "Standard Machine-Level Extensions"
> > 
> > - there is also no explicit mention of where either should be sorted in
> >   the list
> > 
> > - underscores are only required between two *multi-letter* extensions but
> >   the list of rules implies that this is required between a multi-letter
> >   extension and any other extension. IOW "rv64imafdzicsr_zifencei" is a
> >   valid string
> > 
> > Attempt to clean up the list of rules, by adding information on the
> > above & sprinkling in some white space for readability.
> > 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 852ecccd8920..5e42c92a8456 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -120,20 +120,32 @@ device_initcall(riscv_cpuinfo_init);
> >  		.uprop = #UPROP,				\
> >  		.isa_ext_id = EXTID,				\
> >  	}
> > +
> >  /*
> >   * Here are the ordering rules of extension naming defined by RISC-V
> >   * specification :
> > - * 1. All extensions should be separated from other multi-letter extensions
> > - *    by an underscore.
> > + *
> > + * 1. All multi-letter extensions should be separated from other multi-letter
> > + *    extensions by an underscore.
> > + *
> >   * 2. The first letter following the 'Z' conventionally indicates the most
> >   *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> > - *    If multiple 'Z' extensions are named, they should be ordered first
> > - *    by category, then alphabetically within a category.
> > + *    'Z' extensions should be sorted after single-letter extensions and before
> > + *    any higher-privileged extensions.
> > + *    If multiple 'Z' extensions are named, they should be ordered first by
> > + *    category, then alphabetically within a category.
> > + *
> >   * 3. Standard supervisor-level extensions (starts with 'S') should be
> >   *    listed after standard unprivileged extensions.  If multiple
> >   *    supervisor-level extensions are listed, they should be ordered
> >   *    alphabetically.
> > - * 4. Non-standard extensions (starts with 'X') must be listed after all
> > + *
> > + * 4  Standard machine-level extensions (starts with 'Zxm') should be
> > + *    listed after any lower-privileged, standard extensions.  If multiple
> > + *    machine-level extensions are listed, they should be ordered
> > + *    alphabetically.
> > + *
> > + * 5. Non-standard extensions (starts with 'X') must be listed after all
> >   *    standard extensions. They must be separated from other multi-letter
> >   *    extensions by an underscore.
> >   */
> > -- 
> > 2.38.1
> >
> 
> Alternatively, we could change the comment to just point out the spec
> chapter and provide an example, e.g.

IDK, maybe add the reference & the example but keep the summary?

> /*
>  * The canonical order of ISA extension names in the ISA string is defined in
>  * chapter 27 of the unprivileged spec. An example string following the
>  * order is
>  *
>  *   rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
>  *
>  * Notice how Z-extensions are first sorted by category using the canonical
>  * order of the first letter following the Z. Extension groups are in the
>  * order specified in chapter 27. Extensions within each group are sorted
>  * alphabetically.
>  */
> 
> 
> Thanks,
> drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
