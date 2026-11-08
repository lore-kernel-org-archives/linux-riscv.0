Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA923606A31A
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 01:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W5NBqLED;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mfhB6Xdl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EH+cLD5YtElCQcwxviOzrsus+1TLP//AnLwsBP+gj4c=; b=W5NBqLEDaEnvCkSH6MUFZfXRNL
	/xReXA0HFa1E38uK+f3nhf9/j/u7B+kFawghfL0h1KazGGLjOHyRQfBbesojZUmlpfXeIDAV4yNST
	t6a4p9PP/9uy8AoRs34i9UtCS7uXpTBPvMvpskVW9pn1czRq1sLG9u2qLUKIIR41a6wxA9vuAGqOF
	tUoWH6VGEB/6BHtI599IHv50TOrfxZA3gEd43aUQVo6ixJAiTO60riTuM3vBgjjB6fwOY2pZpMet/
	QBkZgWvLI5PdeypOomsmZfyqpnKVQQfO9IJoRN2R2MTucAfiodvOZkvAlReXsu09jXoAl8SjxAgIC
	5DWcOhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPs66-0000000FaRZ-0b9j;
	Sun, 08 Nov 2026 01:53:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPs64-0000000FaRR-3IOF
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 01:53:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82FE061162;
	Sun,  8 Nov 2026 01:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3235D1F0089F;
	Sun,  8 Nov 2026 01:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794102807;
	bh=L3kNfTHDsVf9KI4iLV5+errp8iQcElHw9opDfJV0Pbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mfhB6XdlFviNwYOeznCTsC31506dSVZ1Skek6eUF/AgXBD2G+bEb2vROsn3NLmxd+
	 bSOLxLQzvLrFMCw3L3JfPhPi1NzCHagAIoOMG8c0gPwQraSgcWm+Yu50vzwzqyOgeH
	 rZFV8cvR0tdGRxXGTszzf/jmgRza0+1AmPWJTbvLw1ohLg9TFE4mZNPUuhzizKlYIK
	 19yyWEB1JfmQNy1gQ4uIoBC2UJDe62XmwHE0zdBMzSrkR7kcD2M3gYyEsWbQpMX3Rw
	 jSvQ2VIv5JDsK9PaaQ9Hvg9P0V1IusMLffd7ESGILPy8Sc/tKOBpigc4HIfGAzzdba
	 ab4RCUf4h0jyg==
Date: Sun, 8 Nov 2026 09:33:16 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, conor@kernel.org,
	wangruikang@iscas.ac.cn, ganboing@gmail.com, alex@ghiti.fr,
	cleger@meta.com, geshijian@picoheart.com, niehaitao@picoheart.com,
	cuiyunhui@bytedance.com, gaohan@iscas.ac.cn
Subject: Re: [PATCH v6 5/5] riscv: errata: picoheart: Add workaround for
 AMOCASQ errata
Message-ID: <au_RXLzPSdarFI-c@xhacker>
References: <20261104075706.73657-1-yang.yicong@picoheart.com>
 <20261104075706.73657-6-yang.yicong@picoheart.com>
 <au8oyDjRJuSL9mj_@xhacker>
 <dd751ace-72a0-48c1-bcd2-7a131300a6f1@picoheart.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd751ace-72a0-48c1-bcd2-7a131300a6f1@picoheart.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 11:10:59PM +0800, Yicong Yang wrote:
> On 11/7/26 9:34 PM, Jisheng Zhang wrote:
> > On Wed, Nov 04, 2026 at 03:57:06PM +0800, Yicong Yang wrote:
> >> Some Picoheart CPUs implement Zacas extension but lack support
> >> for AMOCASQ PMA attribute. Thus makes the CASQ instruction de
> >> facto unavailable. Since currently no ways to retrieve the PMA
> >> information and the riscv kernel will declare cmpxchg128 support
> >> if platform declare support of Zacas, the use of cmpxchg128 will
> >> lead to PMA violation and crash the kernel. Add the errata
> >> workaround to disable the use of cmpxchg128 on the affected CPUs.
> >>
> >> Tested-by: Han Gao <gaohan@iscas.ac.cn>
> >> Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
> >> ---
> >>  arch/riscv/Kconfig.errata                    | 12 ++++++++++
> >>  arch/riscv/errata/picoheart/errata.c         | 25 +++++++++++++++++++-
> >>  arch/riscv/include/asm/cmpxchg.h             | 18 +++++++++++++-
> >>  arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
> >>  4 files changed, 55 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> >> index c75dec4b0ba7..4e6516ba3a42 100644
> >> --- a/arch/riscv/Kconfig.errata
> >> +++ b/arch/riscv/Kconfig.errata
> >> @@ -202,4 +202,16 @@ config ERRATA_PICOHEART_CBO_CLEAN
> >>  
> >>  	   If you don't know what to do here, say "Y".
> >>  
> >> +config ERRATA_PICOHEART_AMOCASQ
> >> +	bool "Apply Picoheart AMOCASQ errata"
> >> +	depends on ERRATA_PICOHEART && RISCV_ISA_ZACAS
> >> +	default y
> >> +	help
> >> +	  Some Picoheart CPUs implement the Zacas extension but lack support
> >> +	  for AMOCASQ PMA attribute. Thus makes the CASQ instruction de facto
> >> +	  unavailable. Enable this errata workaround to disable the use of
> >> +	  CASQ in the kernel (cmpxchg128).
> >> +
> >> +	  If you don't know what to do here, say "Y".
> >> +
> >>  endmenu # "CPU errata selection"
> >> diff --git a/arch/riscv/errata/picoheart/errata.c b/arch/riscv/errata/picoheart/errata.c
> >> index c945ae694396..a658f38cf4de 100644
> >> --- a/arch/riscv/errata/picoheart/errata.c
> >> +++ b/arch/riscv/errata/picoheart/errata.c
> >> @@ -174,11 +174,34 @@ static void picoheart_errata_probe_cbo_clean(unsigned int stage,
> >>  	static_branch_enable(&has_picoheart_cbo_clean_errata);
> >>  }
> >>  
> >> +static bool picoheart_errata_probe_amocasq(unsigned int stage,
> >> +					   unsigned long archid,
> >> +					   unsigned long impid)
> >> +{
> >> +	if (!IS_ENABLED(CONFIG_ERRATA_PICOHEART_AMOCASQ))
> >> +		return false;
> >> +
> >> +	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) ||
> >> +	    !riscv_isa_extension_available(NULL, ZACAS))
> >> +		return false;
> >> +
> >> +	if (archid != 0x804a555049544552 || impid != 0x100)
> >> +		return false;
> >> +
> >> +	return true;
> >> +}
> >> +
> >>  static u32 picoheart_errata_probe(unsigned int stage, unsigned long archid,
> >>  				  unsigned long impid)
> >>  {
> >> +	u32 cpu_req_errata = 0;
> >> +
> >>  	picoheart_errata_probe_cbo_clean(stage, archid, impid);
> >> -	return 0;
> >> +
> >> +	if (picoheart_errata_probe_amocasq(stage, archid, impid))
> >> +		cpu_req_errata |= BIT(ERRATA_PICOHEART_AMOCASQ);
> >> +
> >> +	return cpu_req_errata;
> >>  }
> >>  
> >>  void picoheart_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
> >> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> >> index 662e160b0522..0488b9314c13 100644
> >> --- a/arch/riscv/include/asm/cmpxchg.h
> >> +++ b/arch/riscv/include/asm/cmpxchg.h
> >> @@ -329,7 +329,23 @@
> >>  
> >>  #if defined(CONFIG_64BIT) && defined(CONFIG_RISCV_ISA_ZACAS) && defined(CONFIG_TOOLCHAIN_HAS_ZACAS)
> >>  
> >> -#define system_has_cmpxchg128()        riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)
> >> +#define system_has_cmpxchg128 system_has_cmpxchg128
> >> +static __always_inline bool system_has_cmpxchg128(void)
> >> +{
> >> +	/* The vendor erratum overrides the standard Zacas alternative. */
> >> +	asm goto(ALTERNATIVE_2(
> >> +			"nop",
> >> +			"j %l[l_yes]",
> >> +			STANDARD_EXT, RISCV_ISA_EXT_ZACAS, 1,
> >> +			"nop",
> >> +			PICOHEART_VENDOR_ID, ERRATA_PICOHEART_AMOCASQ,
> >> +			CONFIG_ERRATA_PICOHEART_AMOCASQ)
> >> +		: : : : l_yes);
> > 
> > This makes the generic code ugly, adds some maintain effort.
> > why not discarding "zacas" in the dts? It's much simpler
> 
> it'll prevent the usage of other more widely used CAS instructions
> in both user and kernel space. we'd like to retain the performance
> benefit of CAS over LR/SC for primitives such as cmpxchg() on our
> server as well.

If the Zacas can't be safely exposed on this platform, the ISA extension
should be disabled, rather than adding vendor specific exceptions to
generic cap detecion which adds unnecessary complexity and maintenance
burden to generic code. It also sets an undesirable precedent for
handling similar errata in the future. Imagine if various vendors don't
implement various extensions correctly, then the riscv arch code will
be full of this kind of specific exceptions here and there, which make
thes fragmentation in RISC-V land situation worse.

> 
> since kernel already provides system_has_cmpxchg128() as a
> separate capability check, disabling 128-bit CAS here lets us
> limit the workaround to cmpxhg128 only and could be a reasonable

The workaround only affects kernel's cap check, but doesn't prevent
userspace from executing the affected instruction if userspace uses
hwprobe etc. to dynamically detect the underlying hw supported
extensions. Therefore, this workaround does not fully address the
errata and could leave userspace exposed to the same issue.

Disabling the affected extension at the platform level is a more
consistent approach.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
