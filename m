Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F50C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 20:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3ZQzva2CLMZR0QRKhkCOEk40w9KY/X6TByHoj8NlXw=; b=lxZN0njtSYUQtB
	ROvkJsTlwGbMrUfhP538edCpYMN1ruA7IoUfvwBE4zBbs0Nu/4ALEFvjzaGNRjnppS4z5/kUzomwj
	LXc5qzXIGC18tdoCApcLiguSmJ7f1tULUf6JsCmOyioNxjg6g9LUSA7cefFFEYidTarIMBc3rlOgg
	ZVNtaN+PssjhE5yby14TDSseAxnQ5igmlTzyVs1SW4LjniLzc0/7l/blSMhQgeGPp2jg7+0TSE/zk
	kHFmqIS7pQhCOUKE1gyrUYsknqRiUFX0KVXGooahNMvHIuxMT3R/Qb4G8x7K2u2ib2r0qEuCoO4FM
	7oRspQW+sazmNY2cAaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6z5s-0000000H8KA-2k3D;
	Tue, 14 May 2024 20:49:52 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6z5o-0000000H8HZ-13Xh
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 20:49:51 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 862361FB6C;
	Tue, 14 May 2024 20:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715719786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8/TImExnPcn0/P4PnWsqrauOrC1YnmySZaU3kuuKQg=;
	b=mKTR+aaKzODX7Bm5w+mkknOuaO+jQQbCeLDym0is6AC8PmHYyN73dBi0/hYTnEDofuxj8I
	Kx6PgXdk12mRN2ld6Yd4E5D27Hlf5mWPJFCGPgE+QXWp915yIRKXeXXDemrCc4ZBJYCb1k
	WOoKWXyX5jM/nzSiNnnqm5xz7ai09fQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715719786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8/TImExnPcn0/P4PnWsqrauOrC1YnmySZaU3kuuKQg=;
	b=k9frE569ZnCt5JYUlUd2v5N4OV51TvkKRoEmTpdpMQ2eEuLOUzTKFZAGFr82Xh1MKEl6Qr
	0iBt6+BWhUaPkCDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715719786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8/TImExnPcn0/P4PnWsqrauOrC1YnmySZaU3kuuKQg=;
	b=mKTR+aaKzODX7Bm5w+mkknOuaO+jQQbCeLDym0is6AC8PmHYyN73dBi0/hYTnEDofuxj8I
	Kx6PgXdk12mRN2ld6Yd4E5D27Hlf5mWPJFCGPgE+QXWp915yIRKXeXXDemrCc4ZBJYCb1k
	WOoKWXyX5jM/nzSiNnnqm5xz7ai09fQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715719786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G8/TImExnPcn0/P4PnWsqrauOrC1YnmySZaU3kuuKQg=;
	b=k9frE569ZnCt5JYUlUd2v5N4OV51TvkKRoEmTpdpMQ2eEuLOUzTKFZAGFr82Xh1MKEl6Qr
	0iBt6+BWhUaPkCDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92F761372E;
	Tue, 14 May 2024 20:49:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F3YiIWnOQ2aMJAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 14 May 2024 20:49:45 +0000
Date: Tue, 14 May 2024 22:49:44 +0200
From: Oscar Salvador <osalvador@suse.de>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v2 4/8] riscv: mm: Add memory hotplugging support
Message-ID: <ZkPOaAUZrRWRGke0@localhost.localdomain>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-5-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514140446.538622-5-bjorn@kernel.org>
X-Spamd-Result: default: False [-2.63 / 50.00];
	BAYES_HAM(-1.33)[90.33%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rivosinc.com,eecs.berkeley.edu,redhat.com,dabbelt.com,sifive.com,lists.infradead.org,catalinasystems.io,gmail.com,ventanamicro.com,vger.kernel.org,kvack.org,lists.linux-foundation.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_134948_491295_2ED81D19 
X-CRM114-Status: GOOD (  12.39  )
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

On Tue, May 14, 2024 at 04:04:42PM +0200, Bj=F6rn T=F6pel wrote:
> +static void __meminit free_vmemmap_storage(struct page *page, size_t siz=
e,
> +					   struct vmem_altmap *altmap)
> +{
> +	if (altmap)
> +		vmem_altmap_free(altmap, size >> PAGE_SHIFT);
> +	else
> +		free_pages((unsigned long)page_address(page), get_order(size));

David already pointed this out, but can check
arch/x86/mm/init_64.c:free_pagetable().

You will see that we have to do some magic for bootmem memory (DIMMs
which were not hotplugged but already present)

> +#ifdef CONFIG_SPARSEMEM_VMEMMAP
> +void __ref vmemmap_free(unsigned long start, unsigned long end, struct v=
mem_altmap *altmap)
> +{
> +	remove_pgd_mapping(start, end, true, altmap);
> +}
> +#endif /* CONFIG_SPARSEMEM_VMEMMAP */
> +#endif /* CONFIG_MEMORY_HOTPLUG */

I will comment on the patch where you add support for hotplug and the
dependency, but on a track in LSFMM today, we decided that most likely
we will drop memory-hotplug support for !CONFIG_SPARSEMEM_VMEMMAP
environments.
So, since you are adding this plain fresh, please consider to tight the
hotplug dependency to CONFIG_SPARSEMEM_VMEMMAP.
As a bonus, you will only have to maintain one flavour of functions.


-- =

Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
