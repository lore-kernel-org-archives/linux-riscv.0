Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828A4C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 06:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdKXiCKqMR7M2NqC0nu9zglyhA6rAwiRdqtcWFFfQRY=; b=LZYw+r08M97MXD
	muPW9XZ3WmsQ3zbDnf+my2wB1lXvhng+339AVrzQkKwSBnqG7lNQSgll2GtrjqZreaPmJh3dUe0+h
	faVqecF8USgnTarEsVtiAx6bj12RUljq8SPHd5DPz2pw55BikK4dCkq1E6Jo33cRnSGD+/McjYAB0
	1n/fV0H7vvZxlMmoL1yZ0bFYWUc4JKdfcpYppVzZmqyK8d20fNaTNi2f4dRrokloded27CkCLavaB
	sPk2+Pr1hw/7d3BB8Iy6RfbrGTYt21vP705sM7ZEcpq1VrnGtVWG89sK1BRj7rYaXyB48a7Vysq79
	GClKDp5CrZGnfv1I7jPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRdL-0000000FsgY-0Ssq;
	Tue, 30 Jun 2026 06:07:47 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRdI-0000000Fsg6-0uVN
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 06:07:45 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-139aff562e1so6018908c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 23:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782799663; x=1783404463; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tuwqmf7tbULdN/WriFM1zqIzaDGWLfMn0r/anrEXbCI=;
        b=XTBHaUg7oM9HAd43tR40jl9p/oKaP/ILG7i0x8E7tHElBQkaWhvQXfjO4t0ZZRVGMw
         W66asc/Q9HVtQ+hmCV3gz9DNrAA/BLBgRIei0iaA3xWEAsK4nnKWcz6m+Xqe3QiTQkLx
         Gb7FeIKdfKJ2dsvf+0Ls+Eq5/uHscJUPWf4KvEQJKlU7ll1NyimhesYKHZPpWD2/aOEB
         ViJs9zRZ3iPUra1UZ5ppCeM7Oaj4mfS/34ua3Yv842N14aMo6Wvw/xmfZYd44uysK6yz
         +aRFq2oDRcHN81XP0kOwteJWgI1gwVJIqDWv7PlYOTsRLrq5aUK66083htMSzV+9jCev
         +8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782799663; x=1783404463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuwqmf7tbULdN/WriFM1zqIzaDGWLfMn0r/anrEXbCI=;
        b=CK4nw/XnwlNrcECtHMx/sy+3fdMd2cDux+SVw+KXWSSoRBzJl7qA9XAjXeKZV2+Yq1
         Be/jxwxkm3RXerdDP64TBYM3frrDsfhABjikHe+nvYg9K/xmFZtrp107h4A0A2CJIInn
         6gE/gkfgSHvmijb22YRMlxWD1OP3dyCaVvs2EY9WJhLYN6KRNH7Y+ehlsokNZSH5G3cL
         g7UpxmsDL5Fu0OsDQ/j+iIwCBVwXWuWDKSR7k8VVByntF5I2rpBXBRsJWVOcj4WF99lD
         5DukUGr7oJfO9VOlih7qAfbhYpfiC1zrf1K8Gy2vsGwQynYYjVJDRUlqBgSOV7i642Hf
         i7AA==
X-Forwarded-Encrypted: i=1; AFNElJ8SbTpgu2sPh1HUoxmB8hCf0k8JDmLbyJ4xbcufcjBZXbcMK32Wa0bb9UDt5vzr8Tsrxgjk34HmHkIsqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YydF2i9gXMis+kOCxjfZ1+9YddYw3vw4oYSvpJOypznGi4KMy+k
	ohKk41uAV/mZvwjTpOAtprlZ/3aAPamQFZtZwxdV7WKim3BuDsQGfzJmmoRVOMrr
X-Gm-Gg: AfdE7clKPSspOno0pFFkpcCFUflzAj1oULZcUjXwmdTyOTcN6vg1LhB4dcClpWNHiH9
	1u7S90VW/mpAw1vdHtJ0lZ5x3Tf/djOMwlVIbRZjhjYUEEOxYqF0MDSv9z0BDW0dyZ1W92p7ATu
	JpK3vydH/PPmghJNpKr/gTDvBGR9SQuZK8Ru9pjtx9uO4f3fv664bMQCPrdNMwayPW4YWXiaUkg
	f+0w9VhQVYVeD03PZkMQh/6AEEjBIamABh932HnHF9fpHN0pZUo/u69351U9j4kiQcnlLCkC3Vo
	WSmXlcHKUMyQ5f1IbIyv5vMKutegfGpdgbGsJpqWyF47Xf4wENPB8QOX0lrVo479udAjg0P6PqA
	Bu+b9TayUUyz0RE6TQMjgEjaqQwNPz5X/WN3wlSbfQg/Zzm/9grodOcG14cee5z+ToB38vpDCU4
	j2jNfc7PQaB/9eRCXYOgziviQYvLoq64fp
X-Received: by 2002:a05:7022:fe01:b0:139:ed5c:7699 with SMTP id a92af1059eb24-13b2a1d2518mr1236392c88.50.1782799662878;
        Mon, 29 Jun 2026 23:07:42 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2aba794csm3691329c88.10.2026.06.29.23.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:07:42 -0700 (PDT)
Date: Mon, 29 Jun 2026 23:07:40 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add "g" as an instruction alias
Message-ID: <akNdLCfr2yiFrVqb@blinky>
References: <20260626-g_ext-v1-1-a9aa7ab9d109@gmail.com>
 <20260627-spud-qualifier-9a0041fb655e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260627-spud-qualifier-9a0041fb655e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_230744_262380_F45A983C 
X-CRM114-Status: GOOD (  42.73  )
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

On Sat, Jun 27, 2026 at 02:58:14PM +0100, Conor Dooley wrote:
> On Fri, Jun 26, 2026 at 11:24:46PM -0700, Charlie Jenkins wrote:
> > "G" is an official alias for "IMAFDZicsr_Zifencei" [1]. Many common
> 
> What does [1] reference?
> 
> > tools like LLVM, GCC, OpenSBI, QEMU support this alias so make Linux
> > follow the status quo and allow users to pass it in the isa string. In
> > the ISA string, "G" is expected to written lowercase as "g" like the
> > other extensions. Since "g" is a simple alias, follow what OpenSBI does
> > and expose "imafd_zicsr_zifencei" instead of "g".
> 
> What does OpenSBI do? Does it covert "g" in Kconfig etc into imafd... in
> a devicetree?

Actually, I didn't test properly. OpenSBI doesn't crash and it does
parse "g" from the devicetree but it pulls from misa to print what
extensions are supported in the boot log.

> Do you mean that your intention is for a dts with "g" in it to only show
> the constituent parts in /proc/cpuinfo etc?

Yeah that's what I meant, I'll remove the opensbi wording. 

> 
> > 
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > ---
> > This can be tested with a device tree that passes in "g" to the isa
> > string like:
> > 
> > riscv,isa-extensions = "gc";
> 
> Are you sure this is what you tried? It should not work.
> The code dealing with this works on exact matches, so it should end up
> comparing "gc" with "g" and "c", detecting neither.
> Needs to be ... = "g", "c";

Yeah... I did test "g", "c";

> 
> Also, you need to document this in the dt binding, along with the exact
> meaning. Probably do what b has done and mandate filling in the
> constituent parts, retrofitting something that permits the removal of
> other extensions will create devicetrees that do not play nicely with
> other OSes.

Okay sounds good.

> 
> > or
> > 
> > riscv,isa = "rv64gc";
> 
> And I think this definitely does not work properly, cos you only
> modified the riscv,isa-extensions part of
> riscv_early_of_processor_hartid(). I'm not convinced that this is worth
> permitting at all though, riscv,isa should probably not get any
> behavioural changes at this point. It's deprecated after all.
> Sure ACPI uses the same format and parser etc, but that's obviously not
> affected by what we do in riscv_early_of_processor_hartid()!

I should have done a better job reviewing myself. Yes you are right.
Since ACPI still uses "riscv,isa" I'm hesitant to say that we shouldn't
support it. This has always been a pain that we don't have a good
extension story for acpi. My preference would be to support it in
riscv,isa at least for ACPI. Maybe it's fine to not allow it for
non-ACPI by rejecting it in riscv_early_of_processor_hartid().

- Charlie

> 
> > 
> > Example test case using qemu:
> > 	1. Run QEMU with the additional arg "-machine dumpdtb=qemu.dtb"
> > 	2. Decompile the dts "dtc -O dts -I dtb qemu.dtb -o qemu.dts"
> > 	3. Set riscv,isa-extensions to "gc"
> > 	4. Compile the dtb "dtc -O dtb -I dts qemu.dts -o qemu.dtb"
> > 	5. Boot qemu with "-dtc qemu.dtb"
> > 	6. Look at /proc/cpuinfo
> > ---
> >  arch/riscv/kernel/cpu.c        |  7 ++++---
> >  arch/riscv/kernel/cpufeature.c | 11 +++++++++++
> >  2 files changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index 3dbc8cc557dd..0a2df97a1fd6 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -81,9 +81,10 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
> >  	if (!of_property_present(node, "riscv,isa-extensions"))
> >  		return -ENODEV;
> >  
> > -	if (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> > -	    of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> > -	    of_property_match_string(node, "riscv,isa-extensions", "a") < 0) {
> > +	if (of_property_match_string(node, "riscv,isa-extensions", "g") < 0 &&
> > +	    (of_property_match_string(node, "riscv,isa-extensions", "i") < 0 ||
> > +	     of_property_match_string(node, "riscv,isa-extensions", "m") < 0 ||
> > +	     of_property_match_string(node, "riscv,isa-extensions", "a") < 0)) {
> >  		pr_warn("CPU with hartid=%lu does not support ima", *hart);
> >  		return -ENODEV;
> >  	}
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index f46aa5602d74..f78cbf5ade1e 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -322,6 +322,16 @@ static const unsigned int riscv_a_exts[] = {
> >  	RISCV_ISA_EXT_ZALRSC,
> >  };
> >  
> > +static const unsigned int riscv_g_bundled_exts[] = {
> > +	RISCV_ISA_EXT_i,
> > +	RISCV_ISA_EXT_m,
> > +	RISCV_ISA_EXT_a,
> > +	RISCV_ISA_EXT_f,
> > +	RISCV_ISA_EXT_d,
> > +	RISCV_ISA_EXT_ZICSR,
> > +	RISCV_ISA_EXT_ZIFENCEI
> > +};
> > +
> >  #define RISCV_ISA_EXT_ZKN	\
> >  	RISCV_ISA_EXT_ZBKB,	\
> >  	RISCV_ISA_EXT_ZBKC,	\
> > @@ -495,6 +505,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_a, riscv_a_exts),
> >  	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
> >  	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
> > +	__RISCV_ISA_EXT_BUNDLE(g, riscv_g_bundled_exts),
> >  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
> >  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> >  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
> > 
> > ---
> > base-commit: 5a66900afbd6b2a063eebad35294038a654de2b0
> > change-id: 20260626-g_ext-0ca7d6223ff8
> > 
> > Best regards,
> > --  
> > - Charlie
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
