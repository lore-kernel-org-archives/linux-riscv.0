Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BA2C25B79
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9G1gwt8aVlcs6m7xHkB40h0/zYnsVpPJwJq//i+7OV0=; b=pApvMB4GeYbioj
	VDkQOJRTVAbBxZ7e5GfjmzETrktv++HrZxG6+OOmgtQGu48ub4m06P6HzSP6RyWuXS08v3x3NpwI3
	sgbx8zwnDq8SH9M1tOIAEjDStRGw99GvvBbliQAuMHM4Rt055JGeS6e3zgALMMN0+0s+osoNRGzPd
	isFzf8ePcjctl5ziIQIrES19CGmUJ0UlrMKBqPYbgEgQabYV8n6R3JWM48+yRJJt8OA/zhwwq/mYr
	G6ojrFOn+p4ifDdE0h03dbPdOEPpOFWKvx84cMBCFn6mAYalpqmatEvpi/EQ6RLaG6uM7ytKTwxqI
	EiRCIjnXJnnudnKOhbdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6zJR-0000000H9j1-3csN;
	Tue, 14 May 2024 21:03:53 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6zJL-0000000H9hR-27QD
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 21:03:50 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9CA9A1FBA6;
	Tue, 14 May 2024 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715720625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsytN/Ol0bA8FK1+9NUuQFTtsbXKHbOnQZ7CagSXtsE=;
	b=u6ZVCiAjzycXAwGcaHq1QPNWE8OZdJEdtr1m3hRNKyev3uDuY/xGzqChh7uk5T4NjYUeuX
	crPvzJ8JLq4isvh9TLO9QECXAWJcCSPwVNvvV4EaVYUA0JSXjP8d2wiQD6p7VEwYDjXCzq
	me1TGuukLfetINnfR6MZSOOO4cCcJYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715720625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsytN/Ol0bA8FK1+9NUuQFTtsbXKHbOnQZ7CagSXtsE=;
	b=/f9yNye86xDoN89fH3Puo6+R4EuwSeCQwsnMxLRcEwCCN0q/fXDri7/gSpoFwdEyJN7aIK
	ecgjVPiglyCZWdAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u6ZVCiAj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/f9yNye8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715720625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsytN/Ol0bA8FK1+9NUuQFTtsbXKHbOnQZ7CagSXtsE=;
	b=u6ZVCiAjzycXAwGcaHq1QPNWE8OZdJEdtr1m3hRNKyev3uDuY/xGzqChh7uk5T4NjYUeuX
	crPvzJ8JLq4isvh9TLO9QECXAWJcCSPwVNvvV4EaVYUA0JSXjP8d2wiQD6p7VEwYDjXCzq
	me1TGuukLfetINnfR6MZSOOO4cCcJYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715720625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lsytN/Ol0bA8FK1+9NUuQFTtsbXKHbOnQZ7CagSXtsE=;
	b=/f9yNye86xDoN89fH3Puo6+R4EuwSeCQwsnMxLRcEwCCN0q/fXDri7/gSpoFwdEyJN7aIK
	ecgjVPiglyCZWdAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B45331372E;
	Tue, 14 May 2024 21:03:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /kVBKbDRQ2Y5KAAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 14 May 2024 21:03:44 +0000
Date: Tue, 14 May 2024 23:03:39 +0200
From: Oscar Salvador <osalvador@suse.de>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Subject: Re: [PATCH v2 5/8] riscv: mm: Take memory hotplug read-lock during
 kernel page table dump
Message-ID: <ZkPRq5zca7PGsqwJ@localhost.localdomain>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-6-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514140446.538622-6-bjorn@kernel.org>
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9CA9A1FBA6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[rivosinc.com,eecs.berkeley.edu,redhat.com,dabbelt.com,sifive.com,lists.infradead.org,catalinasystems.io,gmail.com,ventanamicro.com,vger.kernel.org,kvack.org,lists.linux-foundation.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rivosinc.com:email,suse.de:dkim,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_140347_796163_A3C7D094 
X-CRM114-Status: GOOD (  11.88  )
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

On Tue, May 14, 2024 at 04:04:43PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> During memory hot remove, the ptdump functionality can end up touching
> stale data. Avoid any potential crashes (or worse), by holding the
> memory hotplug read-lock while traversing the page table.
> =

> This change is analogous to arm64's commit bf2b59f60ee1 ("arm64/mm:
> Hold memory hotplug lock while walking for kernel page table dump").
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

funny enough, it seems arm64 and riscv are the only ones holding the
hotplug lock here.
I think we have the same problem on the other arches as well (at least
on x86_64 that I can see).

If we happen to finally need the lock in those, I would rather have a
centric function in the generic mm code with the locking and then
calling an arch specific ptdump_show function, so the lock is not
scattered. But that is another story.

 =


-- =

Oscar Salvador
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
