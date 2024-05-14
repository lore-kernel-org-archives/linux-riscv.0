Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40372C25B75
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 20:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcgrmOsF4YDkaHDejnRsCGYPn0bS6QbSzKn41p2YUrg=; b=AYVKLXKdy6LGT9
	mrwrfTosYQyvPRbfljBhmQF1QH9y7ft37qHFFjtAs0LP0EXLf5xR7yvR043A4LLM/2jBRXSkBEIqY
	BhnOeY3srOeRn6se6Yp4sUeSilX2YmQI8/Cpm576D2WhYPR+CJYvBAwE+IytUI8zMl0p7SxF5E/uu
	xJhhkM0MkkhL5gh2ZTSO/KNsPLRVueysmbA4m627SYRoDIeg6xOu2wkg5UkD+JD1bt0Wwg2tj3KHx
	1d8BkutzL16DmaBXaDn9naKOFVpwu4hxSu6kGDt/1J/glD0qRtWk7CiTjlu6rKbKmZfiXrRz1fJ/A
	fHHDb9CvI4ZR75qtWdPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ypX-0000000H5dn-0dVl;
	Tue, 14 May 2024 20:32:59 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ypQ-0000000H5b6-2qfQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 20:32:57 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 948CB1F911;
	Tue, 14 May 2024 20:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715718769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kk3PUJn0ZHUnCyV3wo0S0YEaGX6X5EGmXK7wEUx20rU=;
	b=LukJ1p5PWWbiu3qKRQ/sdBVZjjoR0JzQ24HSt7G0MajKuuOYVYByXM20LDzK5JbQMo4ziE
	z56/SLJzivpZcOuRUZw98Ki+vjMIlh040AIgK3vCWPnae6g4phKWqb4LsXlpLf2oKOt2ie
	kBrnRmDUjemc4Kg1FQe04AfOtXVmfyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715718769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kk3PUJn0ZHUnCyV3wo0S0YEaGX6X5EGmXK7wEUx20rU=;
	b=0I+MOdkt9NAN1JNbZ+9l7B9kHwT3WJVbIfpIfdTQse7f9nh8EeVYBmLj1d8T55ebexCPns
	3m0Q9+x/wNs3lhDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LukJ1p5P;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0I+MOdkt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715718769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kk3PUJn0ZHUnCyV3wo0S0YEaGX6X5EGmXK7wEUx20rU=;
	b=LukJ1p5PWWbiu3qKRQ/sdBVZjjoR0JzQ24HSt7G0MajKuuOYVYByXM20LDzK5JbQMo4ziE
	z56/SLJzivpZcOuRUZw98Ki+vjMIlh040AIgK3vCWPnae6g4phKWqb4LsXlpLf2oKOt2ie
	kBrnRmDUjemc4Kg1FQe04AfOtXVmfyc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715718769;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kk3PUJn0ZHUnCyV3wo0S0YEaGX6X5EGmXK7wEUx20rU=;
	b=0I+MOdkt9NAN1JNbZ+9l7B9kHwT3WJVbIfpIfdTQse7f9nh8EeVYBmLj1d8T55ebexCPns
	3m0Q9+x/wNs3lhDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90A4B1372E;
	Tue, 14 May 2024 20:32:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kE0NIHDKQ2aOIAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 14 May 2024 20:32:48 +0000
Date: Tue, 14 May 2024 22:32:43 +0200
From: Oscar Salvador <osalvador@suse.de>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v2 2/8] riscv: mm: Change attribute from __init to
 __meminit for page functions
Message-ID: <ZkPKazeHI4CENSP3@localhost.localdomain>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-3-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514140446.538622-3-bjorn@kernel.org>
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 948CB1F911
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.49 / 50.00];
	BAYES_HAM(-2.98)[99.92%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_133253_036333_0E019312 
X-CRM114-Status: GOOD (  16.21  )
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

On Tue, May 14, 2024 at 04:04:40PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> Prepare for memory hotplugging support by changing from __init to
> __meminit for the page table functions that are used by the upcoming
> architecture specific callbacks.
> =

> Changing the __init attribute to __meminit, avoids that the functions
> are removed after init. The __meminit attribute makes sure the
> functions are kept in the kernel text post init, but only if memory
> hotplugging is enabled for the build.
> =

> Also, make sure that the altmap parameter is properly passed on to
> vmemmap_populate_hugepages().
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> +static void __meminit create_linear_mapping_range(phys_addr_t start, phy=
s_addr_t end,
> +						  uintptr_t fixed_map_size)
>  {
>  	phys_addr_t pa;
>  	uintptr_t va, map_size;
> @@ -1435,7 +1429,7 @@ int __meminit vmemmap_populate(unsigned long start,=
 unsigned long end, int node,
>  	 * memory hotplug, we are not able to update all the page tables with
>  	 * the new PMDs.
>  	 */
> -	return vmemmap_populate_hugepages(start, end, node, NULL);
> +	return vmemmap_populate_hugepages(start, end, node, altmap);

I would have put this into a separate patch.

 =


-- =

Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
