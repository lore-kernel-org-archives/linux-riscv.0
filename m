Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9C1C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 20:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tS+41g2aGIeMdkQJNlvSYfSfBfgJ3wRkhgpPtvWRYa0=; b=hqKrdQh3xJfs82
	Qd6v02QlpzzmQ9T79f+58tArFuwOVhvD2XOUPjKt5/Cy3T4pdbJEpMTVoJamyHw4oi3P7/p8syDRk
	gEVyINIaIduCkrySD8Pmgt//ywi5ZYUv/xuMF4bvmkVfEPJ5yDGtpvCkAtWalZm5tXt/RmruUw/5a
	AdDPdaXm0CyyeBYq3P/dhSnxiPNgQc861p0EzBfrIjLCf/Q4M/waWwJvafDra3gYr8ikEicU1NFgd
	vr58s8dzdQN9DtfEG7NxcZyXalXYjsvfWBDUw0Ay2DQjQRjbBksu2z0U2TGM+6GfH1dMCCnayuXpd
	uLB/SZg3bktM6MF8VPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6yu7-0000000H6aA-0Vcj;
	Tue, 14 May 2024 20:37:43 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6yu2-0000000H6Z7-1IfG
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 20:37:41 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6E0E01FB48;
	Tue, 14 May 2024 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715719056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYsW9Vv80A6GLzgjCSYellhzJczA30skEMWWKeZBbJk=;
	b=ZpObK2cayBrGFB+P30B4ta0PrzL46RFr44vUY5OO1vAowzek8thfNxxeOGE4BRsC7fIwDq
	+7eTpVOAzgxb7RFh6pnv6Q8JBVIOkawpsPDcTa2ObSEicYd8rCm0YADkPKTN8xOT7XG4tp
	dPHkjGGM+KVPvwqMxmeWz35c4ilgZQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715719056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYsW9Vv80A6GLzgjCSYellhzJczA30skEMWWKeZBbJk=;
	b=UVARiUEao8bnM3tGOX6fumiBKcLPbudeKiBmMYfi0BLZlApPyZMjtuUZjjsrk5V1d0PyxV
	o55zuYS0CbLs8iBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZpObK2ca;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UVARiUEa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715719056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYsW9Vv80A6GLzgjCSYellhzJczA30skEMWWKeZBbJk=;
	b=ZpObK2cayBrGFB+P30B4ta0PrzL46RFr44vUY5OO1vAowzek8thfNxxeOGE4BRsC7fIwDq
	+7eTpVOAzgxb7RFh6pnv6Q8JBVIOkawpsPDcTa2ObSEicYd8rCm0YADkPKTN8xOT7XG4tp
	dPHkjGGM+KVPvwqMxmeWz35c4ilgZQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715719056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYsW9Vv80A6GLzgjCSYellhzJczA30skEMWWKeZBbJk=;
	b=UVARiUEao8bnM3tGOX6fumiBKcLPbudeKiBmMYfi0BLZlApPyZMjtuUZjjsrk5V1d0PyxV
	o55zuYS0CbLs8iBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8341B1372E;
	Tue, 14 May 2024 20:37:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IqYEHY/LQ2aHIQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 14 May 2024 20:37:35 +0000
Date: Tue, 14 May 2024 22:37:30 +0200
From: Oscar Salvador <osalvador@suse.de>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v2 3/8] riscv: mm: Refactor create_linear_mapping_range()
 for memory hot add
Message-ID: <ZkPLimx-TSkufhjK@localhost.localdomain>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-4-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514140446.538622-4-bjorn@kernel.org>
X-Spamd-Result: default: False [-6.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rivosinc.com,eecs.berkeley.edu,redhat.com,dabbelt.com,sifive.com,lists.infradead.org,catalinasystems.io,gmail.com,ventanamicro.com,vger.kernel.org,kvack.org,lists.linux-foundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,rivosinc.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6E0E01FB48
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_133738_526753_4DC4AB96 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Lorenzo Stoakes <lstoakes@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, May 14, 2024 at 04:04:41PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> Add a parameter to the direct map setup function, so it can be used in
> arch_add_memory() later.
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
>  arch/riscv/mm/init.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> =

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index c969427eab88..6f72b0b2b854 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -1227,7 +1227,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  }
>  =

>  static void __meminit create_linear_mapping_range(phys_addr_t start, phy=
s_addr_t end,
> -						  uintptr_t fixed_map_size)
> +						  uintptr_t fixed_map_size, const pgprot_t *pgprot)
>  {
>  	phys_addr_t pa;
>  	uintptr_t va, map_size;
> @@ -1238,7 +1238,7 @@ static void __meminit create_linear_mapping_range(p=
hys_addr_t start, phys_addr_t
>  					    best_map_size(pa, va, end - pa);
>  =

>  		create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
> -				   pgprot_from_va(va));
> +				   pgprot ? *pgprot : pgprot_from_va(va));
>  	}
>  }
>  =

> @@ -1282,22 +1282,19 @@ static void __init create_linear_mapping_page_tab=
le(void)
>  		if (end >=3D __pa(PAGE_OFFSET) + memory_limit)
>  			end =3D __pa(PAGE_OFFSET) + memory_limit;
>  =

> -		create_linear_mapping_range(start, end, 0);
> +		create_linear_mapping_range(start, end, 0, NULL);
>  	}
>  =

>  #ifdef CONFIG_STRICT_KERNEL_RWX
> -	create_linear_mapping_range(ktext_start, ktext_start + ktext_size, 0);
> -	create_linear_mapping_range(krodata_start,
> -				    krodata_start + krodata_size, 0);
> +	create_linear_mapping_range(ktext_start, ktext_start + ktext_size, 0, N=
ULL);
> +	create_linear_mapping_range(krodata_start, krodata_start + krodata_size=
, 0, NULL);
>  =

>  	memblock_clear_nomap(ktext_start,  ktext_size);
>  	memblock_clear_nomap(krodata_start, krodata_size);
>  #endif
>  =

>  #ifdef CONFIG_KFENCE
> -	create_linear_mapping_range(kfence_pool,
> -				    kfence_pool + KFENCE_POOL_SIZE,
> -				    PAGE_SIZE);
> +	create_linear_mapping_range(kfence_pool, kfence_pool + KFENCE_POOL_SIZE=
, PAGE_SIZE, NULL);
>  =

>  	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
>  #endif
> -- =

> 2.40.1
> =


-- =

Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
