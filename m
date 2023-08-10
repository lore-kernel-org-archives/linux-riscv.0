Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C02CC001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4AQMJwAbfHMgkn+U9qegbX8dKm9s8fitIR/csTOpwI=; b=4qNdYQSkSI9xO2
	s213Y5SSKtv22/Rcs+29wLoTo4dDLkCEtAIqEPA6O4e7hgvXSVSO7meBxNK3liijlL/MLg4w1Zqig
	KGlYJ5UdO0oktNQH78gxIrl/g9037LgFK+Qnu37AkgOun1NeOmAjLRX3J0d/Ls5r0V4irCzUyERgv
	Df96r74qjzfsH0q6rWSdimLKhp8QZzQCYdjflxAEsdPNgchLTBlHILT8gnDxp+QGZdb41WePTOI5Y
	FJhsGEd1iTQJgNJSNMdEuF3HMQSQ8ewsbrS/nzzBUAKFmxoMBWEGt08aXjDcG5sP1ja2QXqHzVQRm
	Bv0GtyRk0Vk4fI7isrhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU30j-0078HS-0P;
	Thu, 10 Aug 2023 10:35:21 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU30g-0078Fd-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 10:35:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-686fc0d3c92so535327b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691663716; x=1692268516;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjP8JdWZNc/EsPOyQ5jCeiy7seg0BMeumVWKROy6HSY=;
        b=LtcqDBsrBhATsEraV26AspboHdQG99Nujv0wI1FTfui4LPSbkPBesxVNIKr42W6rJN
         PYHE3j5kNYEXdcUvBf0E2qm3C7Y5c4HJlYrMx1kItUteGqyePAyIpR2EHTGnBRXiws6s
         Xag0YQs19MqtNmBXjVJ9qBF8PTm9jcwCn+BPA/j3QfDiSIjU1XBr5cmw0hzf/wQi/N4p
         iRKqe8ZS2gAX7EFJmnHckRZ5Wmdk93daWb8mkbydJyt8qbF6/43qoJARKlnrW7uyIupe
         fma6pSk3GlWOQFKtnfhasV2YFVwWXTnU39sQNjw1pmqmZLKBWH0npNKy3+xXOza6sArn
         seaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691663716; x=1692268516;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjP8JdWZNc/EsPOyQ5jCeiy7seg0BMeumVWKROy6HSY=;
        b=D/BaHa+FJQ7UAZhLsEXwpHVkYmYCGw1mxb3WPPFt6Kjg7ZMxES88sMl+pcI/7cp1Ow
         /rBzjXrWhrNOx0+J+AOHgdR2lff92dtF0l1PcGDWJCyeUbb+5mnje0xGeGdd/LACi4y4
         dS+QSNE66Ngg9XVq9BPWx9+M/vYdQBMj0sIk9v4Vp87MYkXp9y7F04PRw0G1CAz1uSw6
         c5TOgbM7TcJ7dUqvz9c5lWFQH21P3cVe5rVcYFFriO2Gvegpco7+k9+wTqFiLhpslh41
         BTKb05Y/rkuQhUAJ9uLueQ7SPnH5P4sk+KaiYqJdShuQUnBOdl4yS3Jlrfar0VecXlO9
         9kQw==
X-Gm-Message-State: AOJu0YzLrnJax9aYYzHpAvWPb+HzG4Rbyj3417paM8UNWcKcTpMINtCe
	4Cslmx9nPNc5xBFhK6Kww/7KKQ==
X-Google-Smtp-Source: AGHT+IEOhlADr1IOej3h7Jr0IhA9XclJXdHCIdmBUXXhXy9WL8xs+mqkohfqGeY7xTvOqXddWX83WA==
X-Received: by 2002:a05:6a00:23c2:b0:671:4b06:4ea7 with SMTP id g2-20020a056a0023c200b006714b064ea7mr2278413pfc.15.1691663716348;
        Thu, 10 Aug 2023 03:35:16 -0700 (PDT)
Received: from hsinchu26 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id j15-20020aa78d0f000000b00687dde8ae5dsm1183568pfe.154.2023.08.10.03.35.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Aug 2023 03:35:15 -0700 (PDT)
Date: Thu, 10 Aug 2023 10:35:11 +0000
From: Andy Chiu <andy.chiu@sifive.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Savin <greg.savin@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	linux-riscv@lists.infradead.org, gdb-patches@sourceware.org,
	Andrew Burgess <andrew.burgess@embecosm.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via
 ptrace() in RISC-V Linux native
Message-ID: <20230810103510.GA2509@hsinchu26>
References: <20230803230110.904724-1-greg.savin@sifive.com>
 <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk>
 <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com>
 <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_033518_495945_AED6F53F 
X-CRM114-Status: GOOD (  34.66  )
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

On Thu, Aug 10, 2023 at 12:09:17AM +0100, Maciej W. Rozycki wrote:
> On Wed, 9 Aug 2023, Greg Savin wrote:
> 
> > The SIGILL guard is being used as a wrapper around determination of the
> > VLENB CSR, which is not part of the ptrace() payload for vector registers,
> > at least as it exists at head-of-tree Linux kernel.   GDB or gdbserver
> > needs to know VLENB in order to construct the architectural feature
> > metadata that reports an accurate width for the vector registers.  If not
> > for the VLENB determination specifically, and the lack of this information
> > via ptrace(), then there would be no motivation for executing a vector
> > instruction directly.  It's a workaround, basically.  I guess I could
> > inquire in Linux kernel land regarding whether the NT_RISCV_VECTOR ptrace()
> > payload could be enhanced to provide VLENB.
> 
>  I think the kernel interface needs to be clarified first, before we can 
> proceed with the tools side.
> 
>  I can see the vector state is carried in a REGSET_V regset, which in turn 
> corresponds to an NT_RISCV_VECTOR core file note.  I can see that besides 
> the vector data registers only the VSTART, VL, VTYPE, and VCSR vector CSRs
> are provided in that regset, and that vector data registers are assigned 
> a contiguous space of (32 * RISCV_MAX_VLENB) bytes rather than individual 
> slots.
> 
>  So how are we supposed to determine the width of the vector registers 
> recorded in a core file?  I'd say the RISC-V/Linux kernel regset API is 
> incomplete.

Does it make sense to you if we encapsulate this with a hwprobe syscall?
e.g provide a hwprobe entry to get system's VLENB. We will have to
increase and rearrange the buffer for NT_RISCV_VECTOR if we want to use
ptrace as the entry point for this purpose. I am not very sure if it'd be
too late to do though.

> 
>  A complete API has to provide `ptrace' and core file access to all the 
> relevant registers (vector registers in this case) that can be accessed by 
> machine instructions by the debuggee.  That includes read-only registers, 
> writes to which via `ptrace' will of course be ignored.  If a register is 
> a shadow only and can be reconstructed from another, canonical register 
> (e.g. VXRM vs VCSR) then the shadow register can (and best be) omitted of 
> course.  Additional artificial OS registers may also have to be provided 
> that reflect the relevant privileged state made available to the debuggee 
> at run time by OS calls such as prctl(2); this for example might be a mode 
> setting which affects the hardware interpretation of a register set that 
> debug tools may need to take into account or the person debugging may want 
> to check or modify (e.g. REGSET_FP_MODE in the MIPS/Linux port).
> 
>  I've added the authors of the Linux kernel code and the RISC-V/Linux 
> mailing list to the list of recipients.  Am I missing anything here?
> 
>   Maciej

Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
