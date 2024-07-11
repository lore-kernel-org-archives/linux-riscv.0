Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43135C3271E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 04:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XF8HeEbNviS9RMwQUPDamrsAL/itIIW8aWLr94DaFcQ=; b=AhbCzvHUSVxNEq
	pBwUkZHByTykW3iz8UoE/jJgsYQQWk2rl9VxN/tiH4TsPPIuxtkdBZ0XCIKG5MgSC1Pir4GiTjTIo
	BiG+ZK8d7c11It7JZ2ssJk9WhqSFp46+/RukKSYQq4ad2AAyeD9+yUdrogQ+KBgX2GbLX/qTyem6k
	v3ndzYoef7YspUoM9cwwze4Vjme5cNxr7fJQ09qUFlHR7kB2RR9lGnL1K9xurmz/EB+1ZDC1UVlu2
	HjZ7K35AKC1u5GAxPT0b/v/UxtDd9lMiRyIX2WQK3O4AKnDUi0lvH18WcGhwOECblmH98CiNN13dZ
	trDW2wK+GJkxLyvMfWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRld0-0000000Ch33-1hsZ;
	Thu, 11 Jul 2024 04:41:58 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRlcu-0000000Ch10-2h22
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 04:41:56 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5048D21AD9;
	Thu, 11 Jul 2024 04:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720672909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGC4t0EPsoDxakk7kovehODLvnJDDjL515TUwaqwESk=;
	b=ifQddp+bVIeM+Yx+z9uKTOHtGHhCStkpqcwPYZe6gJ0Dk5hU/dR5KMBejCNnNTG+O6ze5d
	dh9RObfIQIj7ndmf0GbFkX9sj5fVX6hZkJfmlMEBZw0r9E24oHS/e/WPjQ3wVcgM5TPwhr
	qTC085XcWU6rkFYGxnRq+wGsOc2T77w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720672909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGC4t0EPsoDxakk7kovehODLvnJDDjL515TUwaqwESk=;
	b=huDiHLvd0kRpqQ791FvfFmskD0Uh2F2/dbc1hQTNr8yKgicf6jV6fKPwoSu2sKBZhOVDXU
	uV4IYonSvhQooODg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720672909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGC4t0EPsoDxakk7kovehODLvnJDDjL515TUwaqwESk=;
	b=ifQddp+bVIeM+Yx+z9uKTOHtGHhCStkpqcwPYZe6gJ0Dk5hU/dR5KMBejCNnNTG+O6ze5d
	dh9RObfIQIj7ndmf0GbFkX9sj5fVX6hZkJfmlMEBZw0r9E24oHS/e/WPjQ3wVcgM5TPwhr
	qTC085XcWU6rkFYGxnRq+wGsOc2T77w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720672909;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGC4t0EPsoDxakk7kovehODLvnJDDjL515TUwaqwESk=;
	b=huDiHLvd0kRpqQ791FvfFmskD0Uh2F2/dbc1hQTNr8yKgicf6jV6fKPwoSu2sKBZhOVDXU
	uV4IYonSvhQooODg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86248136D6;
	Thu, 11 Jul 2024 04:41:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b21xG4xij2bSFgAAD6G6ig
	(envelope-from <osalvador@suse.de>); Thu, 11 Jul 2024 04:41:48 +0000
Date: Thu, 11 Jul 2024 06:41:38 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org, linux-riscv@lists.infradead.org,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 2/3] mm: Remove pud_user() from
 asm-generic/pgtable-nopmd.h
Message-ID: <Zo9igs5GoQqjoi0w@localhost.localdomain>
References: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
 <c31a39463929daba6c91917598ec05cf47103af5.1720597744.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c31a39463929daba6c91917598ec05cf47103af5.1720597744.git.christophe.leroy@csgroup.eu>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_214152_863557_4E25F8D3 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 10, 2024 at 09:51:21AM +0200, Christophe Leroy wrote:
> Commit 2c8a81dc0cc5 ("riscv/mm: fix two page table check related
> issues") added pud_user() in include/asm-generic/pgtable-nopmd.h
> 
> But pud_user() only exists on ARM64 and RISCV and is not expected
> by any part of MM.
> 
> Add the missing definition in arch/riscv/include/asm/pgtable-32.h
> and remove it from asm-generic/pgtable-nopmd.h
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Oscar Salvador <osalvador@suse.de>


-- 
Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
