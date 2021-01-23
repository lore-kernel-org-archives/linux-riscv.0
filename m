Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D78C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 11:01:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8122523437
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 11:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8122523437
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QFCDQjCyqqL8QPTRPlg7EkBC6KoX2CWCVa6vVWBEnrI=; b=BRBUe9iSJzA9eNGYkc5xy7ozJ
	7vDmpqUxNBFFjYdLXsxLpY0QwPVLvGQoM/ZtZxQ5PI2MFEqk5f4/RgCJos8GapY7NJUHz/RDqpJ8p
	j4xjlSZgE7Kl7M/8JzghbA/+TF99SLETD8+cGmzIjP/Ii4DFy9BM+33ecs41LgAFGnK7d7pfX3Twe
	+6FVa8FRoNfQdTfgMDgTMRs8N3yWtxlFhthX3Yrl5nrup8t+92HJUxNnOwthnepRJs9gIEELExHWn
	C/wtNpQWAPmogd+J9uVSSQ9cLacNSMis7LvpOsRQtvfcrFBV+8XEZ97PyJDbLN5A8ohA4C1lq0MO1
	wWeRkXmCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3GfG-0004qr-8r; Sat, 23 Jan 2021 11:01:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3GfB-0004pf-PM; Sat, 23 Jan 2021 11:01:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C54F233FC;
 Sat, 23 Jan 2021 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611399663;
 bh=HKE6o3YvB1B4tteaWRG6KFCwQvpwQVukHCQUNVVJeeY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HKYTq7yJigGOEK8nATV4Dx0NmxniF8qJvpM8DaATKPfSpcwbXynIkCA3n3qe4gShc
 P58WaSyJhlAC3agVkClm43lT0PT5xZ4J7SJtjlWxMDPo7Z7TJ5vikccGijHyX6Qk3T
 csEAYzaE2dNiGaDYQSUa2ZRjDbWeimlY9AxOUezkEDzB+tFxoT4KWyZ3/mHJ42y/5p
 pqq7kjj0H57u727QxLS0KIbNm35ZWU+0trHV9uXECzkWMwPCcm0Vf+ufzHv9e+UsoG
 s6KF8VZU223mQTNtDCDxNRjB/Glv/5nT7EoghwQyPT8tKfrFHn5E34OlgLb+jD+RQt
 FTlyibQtHA2wA==
Date: Sat, 23 Jan 2021 13:00:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v15 03/11] riscv/Kconfig: make direct map manipulation
 options depend on MMU
Message-ID: <20210123110041.GE6332@kernel.org>
References: <20210120180612.1058-4-rppt@kernel.org>
 <mhng-5cbc9b30-ac9a-4748-bf12-8f0de4c89f79@palmerdabbelt-glaptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-5cbc9b30-ac9a-4748-bf12-8f0de4c89f79@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_060105_949318_BBA67A4E 
X-CRM114-Status: GOOD (  19.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, david@redhat.com, peterz@infradead.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, hpa@zytor.com, cl@linux.com, shuah@kernel.org,
 tglx@linutronix.de, elena.reshetova@intel.com, linux-arch@vger.kernel.org,
 tycho@tycho.ws, lkp@intel.com, linux-nvdimm@lists.01.org, will@kernel.org,
 x86@kernel.org, willy@infradead.org, rppt@linux.ibm.com, mingo@redhat.com,
 mtk.manpages@gmail.com, Arnd Bergmann <arnd@arndb.de>, jejb@linux.ibm.com,
 bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, kirill@shutemov.name,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 shakeelb@google.com, akpm@linux-foundation.org, rick.p.edgecombe@intel.com,
 guro@fb.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jan 22, 2021 at 08:12:30PM -0800, Palmer Dabbelt wrote:
> On Wed, 20 Jan 2021 10:06:04 PST (-0800), rppt@kernel.org wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > ARCH_HAS_SET_DIRECT_MAP and ARCH_HAS_SET_MEMORY configuration options have
> > no meaning when CONFIG_MMU is disabled and there is no point to enable them
> > for the nommu case.
> > 
> > Add an explicit dependency on MMU for these options.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > ---
> >  arch/riscv/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index d82303dcc6b6..d35ce19ab1fa 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -25,8 +25,8 @@ config RISCV
> >  	select ARCH_HAS_KCOV
> >  	select ARCH_HAS_MMIOWB
> >  	select ARCH_HAS_PTE_SPECIAL
> > -	select ARCH_HAS_SET_DIRECT_MAP
> > -	select ARCH_HAS_SET_MEMORY
> > +	select ARCH_HAS_SET_DIRECT_MAP if MMU
> > +	select ARCH_HAS_SET_MEMORY if MMU
> >  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
> >  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
> >  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
> 
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> LMK if you want this to go in via the RISC-V tree, otherwise I'm going to
> assume it's going in along with the rest of these.  FWIW I see these in other
> architectures without the MMU guard.

Except arm, they all always have MMU=y and arm selects only
ARCH_HAS_SET_MEMORY and has empty stubs for those when MMU=n.

Indeed I might have been over zealous adding ARCH_HAS_SET_MEMORY dependency
on MMU, as riscv also has these stubs, but I thought that making this
explicit is a nice thing.
 
> Thanks!

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
