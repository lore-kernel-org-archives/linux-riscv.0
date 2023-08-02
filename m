Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ED7C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeLSKWnSmCNpOtTmKZ/CccPOGzEQxBNuY+bso5FVemQ=; b=H7FcnCjgH48+eH
	6jt94cjQ4rWgK0tXfOHwBJKN15M6eekYykLDjYIwoJSrRFkfcMv1+CaUufJbh94ZLG9k2jTFzUdmo
	Dv7hJ/MqiIrIgJ/ERvmH0Tl7xIh0Y+/dZ8r69ylh4dqnUFE1IXQX9ybktBM5+m00cCHXe3qRgLXRM
	kunadK+Mla1fEU2g42o5lo9LDLMNLsoI0gFovC+lQtsXqOgkW4mYsxDtTojCEEk1CRAtCSkaDgCgP
	kT5tudx2R3PZCT8DZKk+kaQhqfyGjcDC96yGCw6hR3GMH1O+6AuSiW/AX5AqVyOIFxUbQiJ0AkQ9v
	UPMrqNvVh4a9j3sQnEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLKy-0068g3-04;
	Wed, 02 Aug 2023 23:33:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRLKu-0068fA-32;
	Wed, 02 Aug 2023 23:33:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49ECC61B77;
	Wed,  2 Aug 2023 23:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38FBC433C7;
	Wed,  2 Aug 2023 23:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691019179;
	bh=FK76VYD0fSgaooLp/CAaS/PvEJ/Zd6gnSb8E/N6uXsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUe7Ngf4ChVgSmATGFyoeoYBIDR8yc0LfOrSXHDg/aoVPPZtoKWr2nFg3XxiVMknr
	 kzuFQ3sy/7ku8kBdyEtl1cVfsKzC1VxmtbEg5f7SBkCDbYuDj2gJ9XDpUw09BvG7rq
	 eT0oe4Y2yuRLxd5FiooDlyJ8USH6m/vjZgVcIkEea8955uaUkG/jV4Tnxk5LBC3/HX
	 uCgniuMWXku5AAQaT9UBTc8ZPnWBLX5epO/VF7+NIt8AHS9JDTh1IPgg1ynHBdUQsC
	 2fsWnWv/heA/xIrzqkl4ZDmJgwofZHhSWr8k0xiN/rx53FEvAjhUDDEydhEcSJ2AR9
	 D8HNLyuPJbmnQ==
Date: Wed, 2 Aug 2023 19:32:48 -0400
From: Guo Ren <guoren@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
Message-ID: <ZMrnoBAHO0Iaj6b/@gmail.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230417103402.798596-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_163301_023489_E085DF27 
X-CRM114-Status: GOOD (  16.72  )
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

On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> The SBI STA extension enables steal-time accounting. Add the
> definitions it specifies.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 945b7be249c1..485b9ec20399 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -30,6 +30,7 @@ enum sbi_ext_id {
>  	SBI_EXT_HSM = 0x48534D,
>  	SBI_EXT_SRST = 0x53525354,
>  	SBI_EXT_PMU = 0x504D55,
> +	SBI_EXT_STA = 0x535441,
>  
>  	/* Experimentals extensions must lie within this range */
>  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> @@ -236,6 +237,20 @@ enum sbi_pmu_ctr_type {
>  /* Flags defined for counter stop function */
>  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
>  
> +/* SBI STA (steal-time accounting) extension */
> +enum sbi_ext_sta_fid {
> +	SBI_EXT_STA_SET_STEAL_TIME_SHMEM = 0,
> +};
> +
> +struct sbi_sta_struct {
> +	__le32 sequence;
> +	__le32 flags;
> +	__le64 steal;
Could we wrap the "sequence & steal" into one 64-bit variable? Then only
rv32 needs double READs, and only one ld instruction for rv64 ISA.

> +	u8 preempted;
> +	u8 pad[47];
> +} __packed;
> +
> +/* SBI spec version fields */
>  #define SBI_SPEC_VERSION_DEFAULT	0x1
>  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
>  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
