Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B2DC5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 04:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IgjBk4ceAbN3PO26eUxlY8XhWtLJSL1DJpjqq0XbMA=; b=b4GYR/F1QzrB0s
	XpGuIMK6zEH27AUYEna227rWmpUsETujW96PTBBa4/eK9+QJcmAK77mLcxc10omURU9gyJBhpoBA/
	8HXmq2ta7kkoaKUdZmM1DuRpcrKdSZjrfnL8fJ36cHpppmx0GygG0UIwg75AoO2cIIgor2f+BJnK+
	FMLt7ZckZNfOlt26qfMuhD+4xwubceBTNB49jWFvF5egjbtXYJV9qi0e5/vn581coUTJzYBRxwR6O
	g7knt2xiMIIqghgVRr6Nf3OKJGAP5uKnXZPj5R3kcrdJ9bVhJxYS+kZYwjUO58baRVNTdTCmjlKxl
	xqX/htm1nuAkDEgBzMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN2JG-0000000Ei9c-3adU;
	Thu, 05 Jun 2025 04:34:34 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN2JE-0000000Ei99-14Xi
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 04:34:33 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7A10B211B8;
	Thu,  5 Jun 2025 04:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749098070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhg/BSQkQq1b9VFsC44xsekkKzQTY9ISghkCrgC0U1c=;
	b=j4BsejGmsGIart99M2DYOoBQRNrxndzoLe0uY67fCL+DfJ0mKiVsqYYkqtXe6TUoSP4RCN
	OBqU5Xq6N3FWBLDUCzTXBXHfVUfBL//MihaCCFhZPq5VLy/Pp+YfVnxXur7lpmwbyF+R7S
	Oe2FhipjgZrzJoIZhn0/QQce+fyosNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749098070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhg/BSQkQq1b9VFsC44xsekkKzQTY9ISghkCrgC0U1c=;
	b=ImT1PK+usPgp6EFG7l/JQOANOn7kVpf/m9BBX94NrCn59BYc5biRXmJyp34SnwjsK5hvbF
	ArQ1+zPywDQOLSDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749098070; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhg/BSQkQq1b9VFsC44xsekkKzQTY9ISghkCrgC0U1c=;
	b=j4BsejGmsGIart99M2DYOoBQRNrxndzoLe0uY67fCL+DfJ0mKiVsqYYkqtXe6TUoSP4RCN
	OBqU5Xq6N3FWBLDUCzTXBXHfVUfBL//MihaCCFhZPq5VLy/Pp+YfVnxXur7lpmwbyF+R7S
	Oe2FhipjgZrzJoIZhn0/QQce+fyosNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749098070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vhg/BSQkQq1b9VFsC44xsekkKzQTY9ISghkCrgC0U1c=;
	b=ImT1PK+usPgp6EFG7l/JQOANOn7kVpf/m9BBX94NrCn59BYc5biRXmJyp34SnwjsK5hvbF
	ArQ1+zPywDQOLSDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22774137FE;
	Thu,  5 Jun 2025 04:34:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ViaJBVUeQWirdwAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 05 Jun 2025 04:34:29 +0000
Date: Thu, 5 Jun 2025 06:34:23 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Barry Song <baohua@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jann Horn <jannh@google.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
Message-ID: <aEEeT2zyafbHzSyy@localhost.localdomain>
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-0.99)[-0.989];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,redhat.com,oracle.com,suse.cz,google.com,suse.com,linux.dev,xen0n.name,southpole.se,saunalahti.fi,gmail.com,sifive.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,lists.linux.dev,vger.kernel.org,lists.infradead.org,kvack.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_213432_447398_6309936B 
X-CRM114-Status: GOOD (  20.80  )
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

On Wed, Jun 04, 2025 at 03:19:58PM +0100, Lorenzo Stoakes wrote:
> The walk_page_range_novma() function is rather confusing - it supports two
> modes, one used often, the other used only for debugging.
> 
> The first mode is the common case of traversal of kernel page tables, which
> is what nearly all callers use this for.
> 
> Secondly it provides an unusual debugging interface that allows for the
> traversal of page tables in a userland range of memory even for that memory
> which is not described by a VMA.
> 
> It is far from certain that such page tables should even exist, but perhaps
> this is precisely why it is useful as a debugging mechanism.
> 
> As a result, this is utilised by ptdump only. Historically, things were
> reversed - ptdump was the only user, and other parts of the kernel evolved
> to use the kernel page table walking here.
> 
> Since we have some complicated and confusing locking rules for the novma
> case, it makes sense to separate the two usages into their own functions.
> 
> Doing this also provide self-documentation as to the intent of the caller -
> are they doing something rather unusual or are they simply doing a standard
> kernel page table walk?
> 
> We therefore establish two separate functions - walk_page_range_debug() for
> this single usage, and walk_kernel_page_table_range() for general kernel
> page table walking.
> 
> We additionally make walk_page_range_debug() internal to mm.
> 
> Note that ptdump uses the precise same function for kernel walking as a
> convenience, so we permit this but make it very explicit by having
> walk_page_range_novma() invoke walk_kernel_page_table_range() in this case.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
