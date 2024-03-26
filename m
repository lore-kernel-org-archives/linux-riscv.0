Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD88C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJzaBGVWNGVg5uQAWU4Am09jdyl1+h1T9OKjQRvAicM=; b=RkInZU5qkuvDOM
	h+tlxCKweQe2RgRfOaFMoUKvDSjCLnH6kZnxNhIb30tbxv1hd+9LTPyvzN+PkcH2vSvnj+QxZ4ar2
	IoF14e5W89SkhZcS5JyevwB0iRIhObbQJ159ACSkosVLt6bHFijgI5UlH2k9lnTMJXiScjJJyNjEk
	j10jkbtuiyJUKFe/UR2ieAw805CqzhdMrVImThcUlnaKptNh09nC4sixVgwDRGbcqm1UC+BztNt+n
	kf3vTx1tXXkQ/HorzXWC0fgjkCSMUJb95cWnMIbUQx5LzwxgWWs/zduWSLAfeJTS7V+HrjnNuC6cW
	kYh4Aey7DeLI1lJBTV0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9SP-00000005Pge-0aqc;
	Tue, 26 Mar 2024 16:15:25 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9SL-00000005Pel-07RH
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 16:15:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5f034b4dcecso3035413a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711469718; x=1712074518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NwEvwMyXDex0JX3rRhVE/vA0sINsepXr/+05Cuki61c=;
        b=ZmOW702n/jd1gC2ZRTXKMM7UXcgE7vx81jKox/V+KNX1Ngg70cGRzcZzbNxI4enOGt
         IjOCXgM7eHVlNIs4zDI1AgmTCVT8r3yA6/VnL2z3RLfSS/dCaq29HHbwtEa4a2eNQ1qo
         I39c7AHvJWOuBz0QPMv1aLgf4bV5LW3mRfCGe/UamBhrK/zrxkTx217dbVmogiCyA2oK
         1xA9+OoIHq1s3uh2zC3d2y4k53VmEOF8JUocBo6xU/GfY7GR1cbzs2R+Z4ms21xtwvmV
         KtUIHg9GzsDobi63aAnAzdPYHLFO5ahvNNE6VebOiUXcbwwoVzXHMicVNhl/2VXHoXFe
         5GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711469718; x=1712074518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwEvwMyXDex0JX3rRhVE/vA0sINsepXr/+05Cuki61c=;
        b=qokI6Vvqla7Z0G2SIiSP1sdGnvrvvlgpliPQwbjvjRJeDe4KeO0VMQ113leZMvtuA9
         OmoD6rlvShxyNWFC/4AYSYFBUCt3CaIE495FDJbZp4WPoU4gGU9iFIz8tNfifQqgLUP7
         hfRuSGPNLrHW8BP6gWm9DtPjNMJyNdfHwSWou4q9IH3MCLPb6GnXSpq6y3E/C7jxEWkP
         LjS75fmj42J0H19faJDKiLMu1yFS/ZOoE5r20kqeVuJBAuSQL1tCO6dpxjO31MQOHdKV
         yRCMLHk+7I1pb8DHxHgRG8F5qD4PtAVzEhyYsQYAe6TuDraFs+UDWorl0Km3cyeV/obH
         xXiw==
X-Forwarded-Encrypted: i=1; AJvYcCVo0aAKpNstY5BQJcwzSMChk2VR3AtVePDb3o7vzrKkkWuPqrDJLjipAG+oClXjQIccumnOIB6KqTKPfBWGSy3v6sfMGncnFjTgqCktE5lU
X-Gm-Message-State: AOJu0YypUQ5q25oQsrEzTsTBLHfn83sLXYna0zAl8kzQvSrBN6L2oUPZ
	NXe0vRRLaylZ5OMY7WkP+7S8spm7W0T+58uPaKNX0Gn68WerYpN8ge7KP0FKzBkI3Q==
X-Google-Smtp-Source: AGHT+IEkibn+nUd92RiN0uy5s0uPI4JYPnqu175YVKXXwbIe74xTGn2WxRgDtfptUVEKhMO9c0jF7w==
X-Received: by 2002:a05:6a20:ce4b:b0:1a3:bdd2:a9a0 with SMTP id id11-20020a056a20ce4b00b001a3bdd2a9a0mr2678228pzb.20.1711469718235;
        Tue, 26 Mar 2024 09:15:18 -0700 (PDT)
Received: from debian-BULLSEYE-live-builder-AMD64 ([192.184.165.229])
        by smtp.gmail.com with ESMTPSA id y14-20020a056a00180e00b006e68b422850sm6120298pfa.81.2024.03.26.09.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:15:17 -0700 (PDT)
Date: Tue, 26 Mar 2024 09:15:14 -0700
From: Calvin Owens <jcalvinowens@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Message-ID: <ZgL0ks5gikCG7NBN@debian-BULLSEYE-live-builder-AMD64>
References: <20240323232908.13261-1-jarkko@kernel.org>
 <20240325115632.04e37297491cadfbbf382767@kernel.org>
 <ZgLfsvbCZj2S6fRE@FVFF77S0Q05N.cambridge.arm.com>
 <20240327002403.62649aee45508b7a16caedba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327002403.62649aee45508b7a16caedba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_091521_102625_84361D35 
X-CRM114-Status: GOOD (  35.28  )
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

On Wednesday 03/27 at 00:24 +0900, Masami Hiramatsu wrote:
> On Tue, 26 Mar 2024 14:46:10 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > Hi Masami,
> > 
> > On Mon, Mar 25, 2024 at 11:56:32AM +0900, Masami Hiramatsu wrote:
> > > Hi Jarkko,
> > > 
> > > On Sun, 24 Mar 2024 01:29:08 +0200
> > > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > 
> > > > Tracing with kprobes while running a monolithic kernel is currently
> > > > impossible due the kernel module allocator dependency.
> > > > 
> > > > Address the issue by allowing architectures to implement module_alloc()
> > > > and module_memfree() independent of the module subsystem. An arch tree
> > > > can signal this by setting HAVE_KPROBES_ALLOC in its Kconfig file.
> > > > 
> > > > Realize the feature on RISC-V by separating allocator to module_alloc.c
> > > > and implementing module_memfree().
> > > 
> > > Even though, this involves changes in arch-independent part. So it should
> > > be solved by generic way. Did you checked Calvin's thread?
> > > 
> > > https://lore.kernel.org/all/cover.1709676663.git.jcalvinowens@gmail.com/
> > > 
> > > I think, we'd better to introduce `alloc_execmem()`,
> > > CONFIG_HAVE_ALLOC_EXECMEM and CONFIG_ALLOC_EXECMEM at first
> > > 
> > >   config HAVE_ALLOC_EXECMEM
> > > 	bool
> > > 
> > >   config ALLOC_EXECMEM
> > > 	bool "Executable trampline memory allocation"
> > > 	depends on MODULES || HAVE_ALLOC_EXECMEM
> > > 
> > > And define fallback macro to module_alloc() like this.
> > > 
> > > #ifndef CONFIG_HAVE_ALLOC_EXECMEM
> > > #define alloc_execmem(size, gfp)	module_alloc(size)
> > > #endif
> > 
> > Please can we *not* do this? I think this is abstracting at the wrong level (as
> > I mentioned on the prior execmem proposals).
> > 
> > Different exectuable allocations can have different requirements. For example,
> > on arm64 modules need to be within 2G of the kernel image, but the kprobes XOL
> > areas can be anywhere in the kernel VA space.
> > 
> > Forcing those behind the same interface makes things *harder* for architectures
> > and/or makes the common code more complicated (if that ends up having to track
> > all those different requirements). From my PoV it'd be much better to have
> > separate kprobes_alloc_*() functions for kprobes which an architecture can then
> > choose to implement using a common library if it wants to.
> > 
> > I took a look at doing that using the core ifdeffery fixups from Jarkko's v6,
> > and it looks pretty clean to me (and works in testing on arm64):
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=kprobes/without-modules
> > 
> > Could we please start with that approach, with kprobe-specific alloc/free code
> > provided by the architecture?

Heh, I also noticed that dead !RWX branch in arm64 patch_map(), I was
about to send a patch to remove it.

> OK, as far as I can read the code, this method also works and neat! 
> (and minimum intrusion). I actually found that exposing CONFIG_ALLOC_EXECMEM
> to user does not help, it should be an internal change. So hiding this change
> from user is better choice. Then there is no reason to introduce the new
> alloc_execmem, but just expand kprobe_alloc_insn_page() is reasonable.

I'm happy with this, it solves the first half of my problem. But I want
eBPF to work in the !MODULES case too.

I think Mark's approach can work for bpf as well, without needing to
touch module_alloc() at all? So I might be able to drop that first patch
entirely.

https://lore.kernel.org/all/a6b162aed1e6fea7f565ef9dd0204d6f2284bcce.1709676663.git.jcalvinowens@gmail.com/

Thanks,
Calvin

> Mark, can you send this series here, so that others can review/test it?
> 
> Thank you!
> 
> 
> > 
> > Thanks,
> > Mark.
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
