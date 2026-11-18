Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E47606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 11:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iPtQTKbU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qb9quO/l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nNXV51uJJ38OpGdwQ9vya690VWPgUL+gdIJbKhr7StM=; b=iPtQTKbUmz5KLjxju8PqLh+wxU
	TJdF/mDqJAMfBEyW4q/UNxexwf64H+58EoUoMSmmifoVFySmAd7zrtbwJTFu2T3zz5CkETgB5c4v2
	cwOO5ugEMXywNsXm9Pnp4PRyd3PU66L5BlXepy3JFbC4GeYuDtSXyYSnnM/FeR488GvAftqmsvZuo
	PJtzynlOK/rt08c3nZ4toq7mi+kSaLFWPT6MgghL+RUai05ze5fhcFj+F+x66roMat1Oe0sC0FNXl
	KJB+4uxPr3pLYlYFrJbWQSwTvD8W72nQG4RwI0Mv7m1pDA3qbaelIYbYYF2vzEoWrEiI7uNsdwHT6
	OPXB9rPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdrV-00000008i5j-3jYJ;
	Wed, 18 Nov 2026 11:30:01 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdrT-00000008i4j-0o9B
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 11:30:00 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so659783a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 03:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001398; x=1795606198; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CKJXXPGigrKiCn6BqmrO398ZNmnv1y4ivGMlHte/o0E=;
        b=qb9quO/lwAwrKXBouZX2izU01rayifcGl/3GQ26lBj+aurJEzfcg00wBAUD1xRu87b
         MIb/rN4OtSGl98AtF7CV1l7JWat+rEY17lYzdyWBdvcvg8IXCVY5qEnYCwMhaimq0buD
         p3XvAWavSXZzDWkjZyNdx2FYwavCQqDuws8JOOXStHrWmKm1Skc2CX7FM3oXX5u2XGuy
         Cns4uRz1AQ2iuPhqSzd1X4KYS2Zk1jV2ArRv1OufNzO3bWe5AlP7tkA16qeRC2QlJTjg
         VpHOT9hfo9nHvkk/jD7XmbH1dUkjoW2t1uw6BhNkp33NTl9Ykg7ukElsNFsMBAamDiJk
         5CHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001398; x=1795606198;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKJXXPGigrKiCn6BqmrO398ZNmnv1y4ivGMlHte/o0E=;
        b=zoVFrAJEdyF055l5KbtvIKaal5kYzt+eQLBakfvZV9fFD0odpKK+W+RdtrgqbfNv9B
         9mWX00+0CXxqkzvNvAlvc4w3QvHqMEF6eG7toTILoDJZRVgEplVhJp+a7mDHWXE1lUdE
         jM+QaKVEP99KfsQV9lgoncgjCvdgUwW97f27nx8bgA0F+6qTIh5omxz1xL5Nli1/DgUz
         MjgHe/+wPplUrSlewZHdOeOpFpaa4yP6L9SFzJTAO/2Hl6x/NThZpPmNzPgCm/VZ/uAG
         gb2X/xJY6G+622iRbG1nBjAa3jtBuNe9YvUH5gHi/rPx3oamT/0v4irO6jTW0B8ZJ4Da
         +3VA==
X-Forwarded-Encrypted: i=1; AL+hErE+Xas7+ktyBKMl8YKUUpgmyvRozs1r5UWihM0oztm46cMnZH/EL7aX4t6XiSMv9l1iB4MGhnJsBJRnQQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9CMLckR/XZbSta6wanii81j/DG5jYz0NCNraVHchjnWEWN0kwp
	RewTe3y92RTKkilNW3jCT5gU5/G3C07FnchBr+avwQ2v5eIwW3F6Gysk
X-Gm-Gg: AZFdTZd6swcvBAtln4JdTQaftL25SiKFt11NINVb8WaFUzm0q1+fBVGAcn0yz33GOhO
	zKAclYg14imm8dNZlvTnQ4iDDe27K7AIWamBrWObO8t5wvY19iGjkbVltkpkEYq9TMp9SrZ7l5Q
	VaozKpWlDVkdOpNCD6OTpbojhKoBJJtYlCxmDrQvtbRL9WLksfBH/55yuj/+QcbLXb996aMBtbG
	7xu+AT9haWIL/GM1BzHGa32YMOjPcT4rYZ/GTyZ0tWtoE4ortUzcr3lnOFgExImqEw2oBolKbCn
	QS79VMwAIs3jncrIH7W3nupPD7CbNOBpSlg0TOwhxGlSAGM8+mld+r+gLJV6MOlyQcNVz1+4nqm
	QLzygMzSop4dm/5crg7bhmtzCaMFpyHew8ODQQpkjAdTWFh6tjSjM9Rl9lGK0xRo7Sy+aKwEAEd
	QGXcSl/qC0Dou0TN2ASRrDzOxFE1xjrZmn8wpFmZi4MkEw2USnBE0TmhMbs3hpdcD525s296N5P
	TpjDgMToFJS476Tlhn1AQZ+wkUzXo/j99OqNmftRlvWBs4B3TIfb8fg3dl3q29VsigpBPVz1IE1
	UNCctpNNvkQiY+tsT0HeMbTs6dg=
X-Received: by 2002:a17:90b:1a8d:b0:3b3:c4dd:5437 with SMTP id 98e67ed59e1d1-3b3d06415fdmr2730809a91.5.1795001397974;
        Wed, 18 Nov 2026 03:29:57 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d143d69csm3960221a91.1.2026.11.18.03.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:29:57 -0800 (PST)
Date: Wed, 18 Nov 2026 19:29:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Peixin Xie <peixin.xie@linux.spacemit.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: cpu: Fix incorrect cached machine IDs on
 secondary harts
Message-ID: <av2L1MlTWoYI74eu@inochi.infowork>
References: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_032959_239206_B4E19A42 
X-CRM114-Status: GOOD (  17.73  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:04:33AM +0800, Peixin Xie wrote:
> During early ISA-string parsing, the boot hart stores its mvendorid
> and marchid in riscv_cpuinfo. This happens before setup_per_cpu_areas(),
> which copies the static per-CPU data to each CPU's allocated area.
> 
> When riscv_cpuinfo_starting() runs on the other harts, the copied IDs
> are already nonzero, so it skips reading their own IDs. As a result,
> secondary harts can retain the boot hart's IDs.
> 
> Read mvendorid and marchid unconditionally on each hart, as already
> done for mimpid.
> 
> Fixes: e482eab4d1eb ("riscv: cpufeature: Fix thead vector hwcap removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
> ---
>  arch/riscv/kernel/cpu.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index af84b97af3a1..64c0c83eff76 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -197,16 +197,12 @@ static int riscv_cpuinfo_starting(unsigned int cpu)
>  	struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
>  
>  #if IS_ENABLED(CONFIG_RISCV_SBI)
> -	if (!ci->mvendorid)
> -		ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> -	if (!ci->marchid)
> -		ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +	ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +	ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
>  	ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
>  #elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> -	if (!ci->mvendorid)
> -		ci->mvendorid = csr_read(CSR_MVENDORID);
> -	if (!ci->marchid)
> -		ci->marchid = csr_read(CSR_MARCHID);
> +	ci->mvendorid = csr_read(CSR_MVENDORID);
> +	ci->marchid = csr_read(CSR_MARCHID);
>  	ci->mimpid = csr_read(CSR_MIMPID);
>  #else
>  	ci->mvendorid = 0;
> 
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261118-riscv-marchid-fix-3ea3672d1e0e
> 
> Best regards,
> --  
> Peixin Xie <peixin.xie@linux.spacemit.com>
> 

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
