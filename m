Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F60C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 22:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gxvgdm+H4VAKe6G0pf+/G57/C5pzeve2Z7Ai8abDK6A=; b=2R+H2jUEgYtshj
	vpP1A3MaNygE9CIc6Ffj3S7LoJHf5dqPNfBAXYlCJ98u47npV0eUcw6cIJkdMyF55Xv/Ehbc456dW
	SbyyJgDQ3u/hUuR0mPOnfCZ3qUamgilVL5bKMowdDi6DJSgrMFd7oqNqxZUOVrBP5D527p6qUsWJq
	eq90dhhvOfCCk4gHukX9z2ztKh4VCDha3DhX16QQYll3awZvifa3z1sQWn4FSTDFe2GIzVad5HRZG
	O/sSQ+J4c6KEvtPaBXcW/oZdc818h04sCtDF3Imj52+61LxZ7YD77PoNX2hi6joun0reg8+E29yY5
	G7D+rHl0yEtF04Q2JEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ZP2-00000004Mfx-3Pyc;
	Mon, 29 Apr 2024 22:23:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ZOz-00000004Mc7-19aA
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 22:23:15 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ee12766586so3780561b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 15:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714429373; x=1715034173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=inf0s5yVmthP6npdhxNJMPqdoBPbadtRMotml3Pg8rs=;
        b=QbkMAsGtHudF7efWIzNk3izIz6iLn+jT8sa0/HG8LqQ15dfNq3T73BQUKnuLOF3J2D
         kMIfd10/+ojrJpHTn+ImL9brHwaSii1xT3jKLwTpseo7PMu9MpCHrui7LPU6wcX6WwJG
         0c6Ev+uhGwCeMgql2RM9qw6/ABBO/WNlvloDCuRpPvGI8w9gBsVlRwPw7/D3ldbzQ0Zm
         7rBv+fkNQAuPTj45yIf8CXCfaDCmoMfaBFCt+fOVnhy7i458hZ2TLG1tcNN43XF4VJtY
         1jDQT/FLbFeCdq04+vsD9+2nXCSfYJcrlhWdQfHN733SDYSUDc/tRx6N4/NyvAVqMnww
         yFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714429373; x=1715034173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inf0s5yVmthP6npdhxNJMPqdoBPbadtRMotml3Pg8rs=;
        b=sKsBDuIxfw8zzR1uQckl6rMawxinRUraYE8xzMN32gqs+4ddxZeUFoHpHHYzHtT/Qd
         JJ3ngwQugl6SXTq/RfAm4O7CGWLT+D3IM96Ov2lPxemgzAcdiZrwzf3faq0r9AkDnwJV
         lt5cWTnaq8iHkd75W0ODVqwyXVsu1d0QbhNJJBLZxmpi7oXKmgzAjG/zaxgVvmJnoRnK
         dhQ7TxY1JetCu1rMvt6/TpuANnmD/oaUB2S1qNilNUvKw0Qq7iEOZ+qDiLvexCYjWvBW
         YnKzheTrwir+EkuTERK1tTUyS550uC+Q7ae9Xua3YlfRTYFW/2zyips1qZWTU64+AwsS
         t3Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXrHosemMrdIqpJMfxkc3RRkZyWFq1i5edr8Lpx9DAZJGgD7LNRMfxd2IbKyJJxp+o9pPvCmjLOkkLF9iwWzJLyBetk3XZ0Ta83DTCY0up6
X-Gm-Message-State: AOJu0Yy4mx7brzj+vRNghSCw+Te6w9NLsrx1RvgSQP1z05VSlM/8rQmI
	cFJu73t5ZGANOLHfH0USCuv58Pyp8ND9WaAxj4CU8NENM4QTMVeMKIer4FHl6xk=
X-Google-Smtp-Source: AGHT+IE50wiagQrblCMq5oU4MAdq+2X/FpoYODpwDG67URQDoEzfVMBuHk4sK2NMmD4RRCX06Avayw==
X-Received: by 2002:a05:6a20:f392:b0:1ad:6874:497d with SMTP id qr18-20020a056a20f39200b001ad6874497dmr1431554pzb.17.1714429373376;
        Mon, 29 Apr 2024 15:22:53 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:a4ca:d475:325f:33c1])
        by smtp.gmail.com with ESMTPSA id x26-20020a056a000bda00b006e6c16179dbsm19815696pfu.24.2024.04.29.15.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 15:22:52 -0700 (PDT)
Date: Mon, 29 Apr 2024 15:22:50 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <ZjAduvtEZAjwoG+v@ghost>
References: <20240426-cpufeature_fixes-v2-0-7377442b1327@rivosinc.com>
 <20240426-cpufeature_fixes-v2-1-7377442b1327@rivosinc.com>
 <20240429-f6438977f19e44966d0dd879@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429-f6438977f19e44966d0dd879@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_152313_349392_E0446216 
X-CRM114-Status: GOOD (  36.42  )
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

On Mon, Apr 29, 2024 at 11:33:50AM +0200, Andrew Jones wrote:
> On Fri, Apr 26, 2024 at 02:58:54PM GMT, Charlie Jenkins wrote:
> > The riscv_cpuinfo struct that contains mvendorid and marchid is not
> > populated until all harts are booted which happens after the DT parsing.
> > Use the vendorid/archid values from the DT if available or assume all
> > harts have the same values as the boot hart as a fallback.
> > 
> > Fixes: d82f32202e0d ("RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs")
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/include/asm/sbi.h   |  2 ++
> >  arch/riscv/kernel/cpu.c        | 40 ++++++++++++++++++++++++++++++++++++----
> >  arch/riscv/kernel/cpufeature.c | 11 +++++++++--
> >  3 files changed, 47 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 6e68f8dff76b..0fab508a65b3 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -370,6 +370,8 @@ static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1
> >  static inline void sbi_init(void) {}
> >  #endif /* CONFIG_RISCV_SBI */
> >  
> > +unsigned long riscv_get_mvendorid(void);
> > +unsigned long riscv_get_marchid(void);
> >  unsigned long riscv_cached_mvendorid(unsigned int cpu_id);
> >  unsigned long riscv_cached_marchid(unsigned int cpu_id);
> >  unsigned long riscv_cached_mimpid(unsigned int cpu_id);
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index d11d6320fb0d..c1f3655238fd 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -139,6 +139,34 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
> >  	return -1;
> >  }
> >  
> > +unsigned long __init riscv_get_marchid(void)
> > +{
> > +	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> > +
> > +#if IS_ENABLED(CONFIG_RISCV_SBI)
> > +	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> > +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> > +	ci->marchid = csr_read(CSR_MARCHID);
> > +#else
> > +	ci->marchid = 0;
> > +#endif
> > +	return ci->marchid;
> > +}
> > +
> > +unsigned long __init riscv_get_mvendorid(void)
> > +{
> > +	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> > +
> > +#if IS_ENABLED(CONFIG_RISCV_SBI)
> > +	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> > +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> > +	ci->mvendorid = csr_read(CSR_MVENDORID);
> > +#else
> > +	ci->mvendorid = 0;
> > +#endif
> > +	return ci->mvendorid;
> > +}
> > +
> >  DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> >  
> >  unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
> > @@ -170,12 +198,16 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
> >  	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> >  
> >  #if IS_ENABLED(CONFIG_RISCV_SBI)
> > -	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> > -	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> > +	if (!ci->mvendorid)
> > +		ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> > +	if (!ci->marchid)
> > +		ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> >  	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> >  #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> > -	ci->mvendorid = csr_read(CSR_MVENDORID);
> > -	ci->marchid = csr_read(CSR_MARCHID);
> > +	if (!ci->mvendorid)
> > +		ci->mvendorid = csr_read(CSR_MVENDORID);
> > +	if (!ci->marchid)
> > +		ci->marchid = csr_read(CSR_MARCHID);
> >  	ci->mimpid = csr_read(CSR_MIMPID);
> >  #else
> >  	ci->mvendorid = 0;
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3ed2359eae35..500a9bd70f51 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -490,6 +490,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> >  	struct acpi_table_header *rhct;
> >  	acpi_status status;
> >  	unsigned int cpu;
> > +	u64 boot_vendorid;
> > +	u64 boot_archid;
> >  
> >  	if (!acpi_disabled) {
> >  		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > @@ -497,6 +499,9 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> >  			return;
> >  	}
> >  
> > +	boot_vendorid = riscv_get_mvendorid();
> > +	boot_archid = riscv_get_marchid();
> > +
> >  	for_each_possible_cpu(cpu) {
> >  		struct riscv_isainfo *isainfo = &hart_isa[cpu];
> >  		unsigned long this_hwcap = 0;
> > @@ -543,9 +548,11 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
> >  		 * version of the vector specification put "v" into their DTs.
> >  		 * CPU cores with the ratified spec will contain non-zero
> >  		 * marchid.
> > +		 *
> > +		 * Assume that if the boot hart is T-Head, then all harts in the
> > +		 * SoC are also T-Head and have the same archid.
> 
> The movement of the comment is only half of my suggestion. The other
> suggestion is to remove the 'Assume' because we don't have to assume
> anything. We can simply state that if the boot hart is T-HEAD, then we
> don't want to enable V on any hart. (We don't need to assume the other
> hart IDs are the same, because we don't care what they are. They're
> not going to get V, no matter what.)

In the case that you mentioned, that the boot hart incorrectly reports
xtheadvector as V but a different hart has "true" V, V will be disabled
and all is well.

This comment was more out of paranoia for the inverse case though. It is
possible that the boot hart has a correctly reported V, but a different
hart actually has xtheadvector. Since we only probed the boot hart, we
don't know that though, and try to execute standard V instructions on
the secondary hart and run into illegal exceptions.

I can change the wording to:

"Disable vector if the boot hart has a T-Head mvendorid and an marchid
of 0."

I hope some vendor doesn't make an SoC like the problem case ;).

- Charlie

> 
> Thanks,
> drew
> 
> >  		 */
> > -		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
> > -		    riscv_cached_marchid(cpu) == 0x0) {
> > +		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
> >  			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
> >  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
> >  		}
> > 
> > -- 
> > 2.44.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
