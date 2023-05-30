Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D5EC77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 16:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=18U7IE/WQKPha1jc7MigNLU+ggialhStHUsdrXGbBio=; b=F3NXNTS6mwxLtzjm7o6vnz+LuB
	XepNfTkiiiOUctWu2Rq10r41V2Nq1ZGqJhAFxmtzec1jLJ99bEIX6+jB/oGXEJTikt9npPhoRF7Ep
	/jhGfPyu2AtkYNoQPDMcw1irwOjKV0DWcFl/RYL7f0o3m5hoWes/a8G3WgSZ+UBkoh0PODrBDYjaH
	HN+Zpv2Nb08U3/0MMXW+tC8fZZ+1p6uHuJwR1LIj1TLiYZVNg6MoYsdoVywaMyPw37HqLv6/DtPoZ
	+G2NT7WuZlbqrfsK1zkX3q7fJg/5IAMeBYvvQWVP/YoHXmrRGYkFbRf5DrHG2F6BhO/JyQLwm71nJ
	RkUDOawg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q42eG-00EfdS-1H;
	Tue, 30 May 2023 16:56:40 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q42eE-00Efbr-0c
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 16:56:39 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5340957a1f1so2608342a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685465796; x=1688057796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUIF7qczhJfL0tzqN+Wk4Y8s0fyjf+/encaeJ8i8zo8=;
        b=RbEfFAAf2kcBOjvt74s5UVZKgWrUGFDUy+sd7fobbo+fCQD0px8ov63e8OeZXSJ8fh
         HG4hHegtTrDVP700YjLnXteCxE6guE54Vbd8zH/t2rCli4QSiy5tmFSofJYIZgEMn1zj
         Qsp4LrQqCDZwVqc25d9x6Ot8kXQSMfXIZ9gqaurkMyf4wf+UYa4w1aAbMwazKXlrtuiS
         Kk616ydOwBRsdeEiUal2WEabr5ltpvlk9LlkPPxhELMLDRXHyhZJZ3Til0KRYe81otj+
         tS/p/kiytx6/XARdF4p/h7eKZckIQCkqvbC4w6UMN19z2FxazUFpiFD2Hr1ZsYeU6F4t
         XCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465796; x=1688057796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUIF7qczhJfL0tzqN+Wk4Y8s0fyjf+/encaeJ8i8zo8=;
        b=cucTLwbt5Zh+egYtk+VqmRDuadybVnCcVyJAVoZJxbTOyalcWR5+t1irYxqsDkIjet
         tQxpw6+k2JyvyTJsN2Zu9nnfLX5yOIa1fFc+hd/Q3+NQeW+tjskm6xfFjQWq5km/i6cK
         +oROiDfeLtJMl6M6TR1qkhT12v69rpVUWP09ep51vYStZTzJS8J02T1l2In5mMDf5SQn
         UxXPsBGROenTzdagBJlAjDE5RCXUxUtR7tAco/RBFpqRyzs58cJNGpIxWVD5KXV+FdGV
         NXecsdZogIfHv8tXAVi+G72tFvksNCGBF2vudzmMtzVLDTKgJMSOyhAmB288SIOQwxuO
         2WLA==
X-Gm-Message-State: AC+VfDyM7Oz2DY2iRVBvTkg/m/Kl6tdhtfE0C5O+X1Abo+liFbd1cF0u
	w5NKsGNrcfN35jvMfOoSh6xBeTtdMPg=
X-Google-Smtp-Source: ACHHUZ6elIb9Xawt5kHr4iARsASD1eAmXyJrU7yMOnucjGsQDVEv6w8ENbA+wCa+rqHlmqnxd6WixqOcZs8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:512:0:b0:52c:9e55:61ee with SMTP id
 18-20020a630512000000b0052c9e5561eemr545525pgf.3.1685465795799; Tue, 30 May
 2023 09:56:35 -0700 (PDT)
Date: Tue, 30 May 2023 09:56:34 -0700
In-Reply-To: <87wn0pizbl.ffs@tglx>
Mime-Version: 1.0
References: <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx> <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name>
 <87wn0pizbl.ffs@tglx>
Message-ID: <ZHYqwsCURnrFdsVm@google.com>
Subject: Re: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, Tom Lendacky <thomas.lendacky@amd.com>, 
	LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Brian Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, 
	Usama Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org, 
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	linux-csky@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-mips@vger.kernel.org, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	linux-parisc@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Sabin Rapan <sabrapan@amazon.com>, 
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_095638_228859_CD0BF0E8 
X-CRM114-Status: GOOD (  19.62  )
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

On Tue, May 30, 2023, Thomas Gleixner wrote:
> On Tue, May 30 2023 at 15:29, Kirill A. Shutemov wrote:
> > On Tue, May 30, 2023 at 02:09:17PM +0200, Thomas Gleixner wrote:
> >> The decision to allow parallel bringup of secondary CPUs checks
> >> CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
> >> parallel bootup because accessing the local APIC is intercepted and raises
> >> a #VC or #VE, which cannot be handled at that point.
> >> 
> >> The check works correctly, but only for AMD encrypted guests. TDX does not
> >> set that flag.
> >> 
> >> Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
> >> definitely works for both AMD and Intel.
> >
> > It boots fine with TDX, but I think it is wrong. cc_get_vendor() will
> > report CC_VENDOR_AMD even on bare metal if SME is enabled. I don't think
> > we want it.
> 
> Right. Did not think about that.
> 
> But the same way is CC_ATTR_GUEST_MEM_ENCRYPT overbroad for AMD. Only
> SEV-ES traps RDMSR if I'm understandig that maze correctly.

Ya, regular SEV doesn't encrypt register state.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
