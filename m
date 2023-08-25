Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D173C6787B
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 18:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlkhFUo9gKqqBffB4dgHSvTMQyjyKsy00L8qN6gJNzA=; b=CVsWpIGR/ZgyFU
	wtyRJyzBDn9tYL6Lv/tjJJO8ElrsRHrHFiCeihLYkzjZtfoIHtpVy83DWAwYp4e3/YeNQxirs/WX4
	kW8u+oe0/5S7D7DTe9HgKL1uyxt5y9poQwyxM9goNvCoanbwRErMi4VnuqvXmiLNQEvxDjsuw6bTZ
	yUxtM01T3Rz/7y6ehGwQDOdiNz+SzZJYpvtiEcraOFYV3oVWn6cJGPzxAzL0Njef4cdr6aCaqGCFn
	0YDRkra+T8pzWjGK6ClES23tMl+o5dS/1RrjklOwrOSKXvZPnDDmd57X4tc+rUk4qzlSrRKzc6URk
	5OqQ3zHMXhPX5Y9YKySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbQF-005r6q-2j;
	Fri, 25 Aug 2023 18:20:39 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbQB-005r59-2v
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 18:20:37 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-56c250ff3d3so1641703a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 11:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692987633; x=1693592433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYd1wVFPRI7NiM/Sx4/tad/ZtbY6g9sye8P5AXqu+fc=;
        b=E4mC5YAXMMgmUHgfRiWFcSZjAFYw1waD0EqZCNwtYhRSRtgJoFZVlCS3JG3wV7FXjd
         sXVU7RTKIYiV68OaJT+pNyPhtCG1CpcRdXA82AG5ofhhqR/vSGm3tvd1mpbR6M1weagG
         NwWQJu1Josu1pkUS1L/DPphW0b+C0Nzy+d45c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987633; x=1693592433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYd1wVFPRI7NiM/Sx4/tad/ZtbY6g9sye8P5AXqu+fc=;
        b=Qp8r3pJxx/HFj1V/Wr0AQg2BIoQWBrLLIsmU/ROoFRCyHBIA5jMBfp07iFpFv7PR4N
         FhPDZAHzvjz3uVCtvRt/w1CnAFZOIAlPbtd+CU5Zdm9XCSzhvxCzZgtRWYaFUhxylM1H
         tLcvUWFMVvoBXMtKLtc1HwRlJYxq8bMAucuF4eUjtkX3VNYjlT7/IH+V8jszqsmiVklF
         B5gVvjcJt+SpvwePS3Xh2LK0uqoZdrG2M7lHTlGyNYRbr6MzZrmgIZRT8JT7jMKee12N
         cNf1R5KtvJJfO6YYFrFhWU9h5eijzopUCVWLVs5w6KUVbjBEZEnfBCEb8ZvrCGpzAqWg
         IM3g==
X-Gm-Message-State: AOJu0YwMJsczQnMtaWXWVF7sELY8O9Yp3V++ISZxccbjVIoTLfdnXE6b
	PcPDznLJ9CRKiPge6R4ZzozpHA==
X-Google-Smtp-Source: AGHT+IF6DSGG+sLTemEr6zFswCsdJsrOmZC3VrMrE6v1fI8J4N4rJsVzak2qfPMHQ2MCnkGlwtuaPA==
X-Received: by 2002:a17:90a:c08d:b0:267:f8f4:73ab with SMTP id o13-20020a17090ac08d00b00267f8f473abmr28444155pjs.16.1692987633516;
        Fri, 25 Aug 2023 11:20:33 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090a628c00b0026b3f76a063sm1910536pjj.44.2023.08.25.11.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 11:20:32 -0700 (PDT)
Date: Fri, 25 Aug 2023 11:20:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Message-ID: <202308251119.B93C95A3A7@keescook>
References: <20230824223606.never.762-kees@kernel.org>
 <21193a52-0425-f5ae-90f0-10e4c578ae90@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21193a52-0425-f5ae-90f0-10e4c578ae90@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_112035_939439_E8EDADFF 
X-CRM114-Status: GOOD (  21.09  )
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

On Thu, Aug 24, 2023 at 05:04:02PM -0700, Randy Dunlap wrote:
> Hi Kees,
> 
> On 8/24/23 15:36, Kees Cook wrote:
> > Doing a "make help" would show only hard-coded Kconfig targets and
> > depended on the archhelp target to include ".config" targets. There was
> > nothing showing global kernel/configs/ targets. Solve this by walking
> > the wildcard list and include them in the output, using the first comment
> > line as the help text.
> > 
> > Update all Kconfig fragments to include help text and adjust archhelp
> > targets to avoid redundancy.
> > 
> > Adds the following section to "help" target output:
> > 
> > Configuration fragment targets (for enabling various Kconfig items):
> >   debug.config         - Debugging for CI systems and finding regressions
> >   kvm_guest.config     - Bootable as a KVM guest
> >   nopm.config          - Disable Power Management
> >   rust.config          - Enable Rust
> >   tiny-base.config     - Minimal options for tiny systems
> >   tiny.config          - Smallest possible kernel image
> >   x86_debug.config     - Debugging options for tip tree testing
> >   xen.config           - Bootable as a Xen guest
> >   tiny.config          - x86-specific options for a small kernel image
> >   xen.config           - x86-specific options for a Xen virtualization guest
> 
> ISTM that you are missing the "why" part of this change in the commit
> description.

I want to see what fragments are available without needing to know the
source tree layout for their locations. :)

> "make tinyconfig" is the real target here.  The other (tiny.) files are just
> implementation details.
> We can't put all implementation details into help messages and it's not
> difficult to find that the (tiny.) config files are merged to make the
> final .config file.

Yeah, this seems true for much of the ppc stuff to, as pointed out by
mpe. I'll go answer there...

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
