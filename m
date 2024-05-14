Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2B0C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 21:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ST7lGBDnVGCxbfgUI2E6QDzTYMiwVKtjMRg0G1jN8SU=; b=c/ZsDpVoSecva/
	bvv1xsBr5mUJl5Lx3afh3t+oHjLpesTm8dnNAC6yIovBGiMjLVQIqWDFRg8xoARsrZ3ob5ZHa+1yj
	0AV1Eq3sx8ju9vCa9apgLex65XaV1om3WAnF4f9X+pOdNwvnG9uhXS4ifSrX+iYx/ubcYJjhLSTLD
	iUGedtZsNSDnFqojHzI48zZp1womoHRO4Tc9e2wsj0LNb+YVWR6LouePuLJaTCs9uoix2BxW2DbuA
	Y/6QNSTmjuN7xU/cy0jRJjHJctl3sfPz4fLy6j1mrRZwarUSyhRHIqj0Okt9dKK4xxbTSb0ARhv9f
	+fu5/MdxJdW5WdrW+Row==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6zMJ-0000000HA7Y-0qeN;
	Tue, 14 May 2024 21:06:51 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6zMF-0000000HA6R-0CvA
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 21:06:49 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 670E51FBAB;
	Tue, 14 May 2024 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715720805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMfKixceV4qr83nNPK38FwuyfKkOiLi4Qx7Rk6Mapug=;
	b=hHft803ecNlAb2YgHf6izR+uuw6VXIVGwgEFzoR3J5Fmy5mxhCGpMIwVP/QgnoAuADzfR8
	3fBt2jrbi3GFXS3JqjP3piN11nmBrP+zcHEkBhDSoXVP0kPQC3xT8lJyOMt8SqNesYXY9U
	NeV9r4RpUeBPDj9g0R0N3D5bQ7WuMoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715720805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMfKixceV4qr83nNPK38FwuyfKkOiLi4Qx7Rk6Mapug=;
	b=wMWfzj2HuRxxULRaIM/Wsg5cwWf03TJ88p+VC7oC193PoZn+9GVXkz0sGMRxpDwJhL28LZ
	O6TSPa/HhmUko3AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hHft803e;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wMWfzj2H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715720805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMfKixceV4qr83nNPK38FwuyfKkOiLi4Qx7Rk6Mapug=;
	b=hHft803ecNlAb2YgHf6izR+uuw6VXIVGwgEFzoR3J5Fmy5mxhCGpMIwVP/QgnoAuADzfR8
	3fBt2jrbi3GFXS3JqjP3piN11nmBrP+zcHEkBhDSoXVP0kPQC3xT8lJyOMt8SqNesYXY9U
	NeV9r4RpUeBPDj9g0R0N3D5bQ7WuMoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715720805;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qMfKixceV4qr83nNPK38FwuyfKkOiLi4Qx7Rk6Mapug=;
	b=wMWfzj2HuRxxULRaIM/Wsg5cwWf03TJ88p+VC7oC193PoZn+9GVXkz0sGMRxpDwJhL28LZ
	O6TSPa/HhmUko3AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E7D21372E;
	Tue, 14 May 2024 21:06:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QUEoHGTSQ2bjKAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 14 May 2024 21:06:44 +0000
Date: Tue, 14 May 2024 23:06:43 +0200
From: Oscar Salvador <osalvador@suse.de>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v2 6/8] riscv: Enable memory hotplugging for RISC-V
Message-ID: <ZkPSY6JLddeusGXJ@localhost.localdomain>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-7-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514140446.538622-7-bjorn@kernel.org>
X-Spamd-Result: default: False [-6.50 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,rivosinc.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 670E51FBAB
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_140647_266541_9DBC7BAF 
X-CRM114-Status: GOOD (  15.14  )
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

On Tue, May 14, 2024 at 04:04:44PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> Enable ARCH_ENABLE_MEMORY_HOTPLUG and ARCH_ENABLE_MEMORY_HOTREMOVE for
> RISC-V.
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---
>  arch/riscv/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6bec1bce6586..b9398b64bb69 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -16,6 +16,8 @@ config RISCV
>  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
>  	select ARCH_DMA_DEFAULT_COHERENT
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> +	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM && 64BIT && MMU

Hopefully this should be SPARSEMEM_VMEMMAP.
We are trying to deprecate memory-hotplug on !SPARSEMEM_VMEMMAP.

And it is always easier to do it now that when the code goes already in,
so please consider if you really need SPARSEMEM and why (I do not think
you do).

 =


-- =

Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
