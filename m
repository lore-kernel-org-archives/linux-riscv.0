Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C14C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xmGk0GCFo+FB/5S6MoS6nP0ulF0maqqeTjIA9sJ8qw=; b=ZzNGAn1o69Kfps
	dRedTpYFvPB7tM0F5zpzu3hsxGkZ8cL1Zjx5iGkx9+XJzDxgk9g8kJWQE3QEo4w53u7+jzrFTJPU2
	weVE6GXD38wT1G/4+BsjRNokY1O/II+n+h5rmRJixm5b1ZvdcgHmMkR68cDsRtTqnGNM051yprFVA
	JPiHYjekGEpg6EYuA1bQJ7UOg0gE0ADVFMi5+B5EnjtfrPwLJ/c1XGUu0MGKh5+fL2aYJxzISXaDJ
	QBSwbyQVYk8PgUS7abgHcxHbPZ/bxIp0IiSVO+iz4odogjkaBzQ9G88Zx5oteadMV/o9FCHs9sbAv
	vXZpCq/nAQzR60yJOhUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7xs-00000009Esy-3Ika;
	Tue, 21 Jul 2026 10:44:44 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7xq-00000009Es3-0Qh8
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 10:44:43 +0000
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 531843E07;
	Tue, 21 Jul 2026 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784630678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0Py5B3mwQHc+JOXafe3hbEgSFjr03UEdbTua5LDYRg=;
	b=JtQP6lged4KTQ9qwSmJWoFVAqDxIRDZ+BQwSXLtHg+hxvrs0KZqezKv7NOpLhu1e843nkg
	JT1pK7pnMGMQMv8FU5RcH5t+x4oxP4g/E6bssli90KGK+L+lwzEkt2iJceUzwLYI/PZ++9
	PvGiUBNZ/4KSC7Vpjng9OD92j/wQyII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784630678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0Py5B3mwQHc+JOXafe3hbEgSFjr03UEdbTua5LDYRg=;
	b=y2frQJ8pJWgRl/gkkNhGtA7abbAg0ghd3xXR7bRLXh8+ijdsEq5T6omONmmn2klKmyD0HA
	vXo1mY9eOZlpodCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JtQP6lge;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y2frQJ8p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784630678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0Py5B3mwQHc+JOXafe3hbEgSFjr03UEdbTua5LDYRg=;
	b=JtQP6lged4KTQ9qwSmJWoFVAqDxIRDZ+BQwSXLtHg+hxvrs0KZqezKv7NOpLhu1e843nkg
	JT1pK7pnMGMQMv8FU5RcH5t+x4oxP4g/E6bssli90KGK+L+lwzEkt2iJceUzwLYI/PZ++9
	PvGiUBNZ/4KSC7Vpjng9OD92j/wQyII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784630678;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B0Py5B3mwQHc+JOXafe3hbEgSFjr03UEdbTua5LDYRg=;
	b=y2frQJ8pJWgRl/gkkNhGtA7abbAg0ghd3xXR7bRLXh8+ijdsEq5T6omONmmn2klKmyD0HA
	vXo1mY9eOZlpodCA==
Date: Tue, 21 Jul 2026 12:44:37 +0200
From: Michal Suchanek <msuchanek@suse.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Radu Rendec <radu@rendec.net>,
	Renzo Davoli <renzo@cs.unibo.it>, Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH] seccomp: Fix syscall skip logic on ptrace
Message-ID: <al9NlZi20xHMvla2@kunlun.suse.cz>
References: <20260707181957.433213175@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707181957.433213175@kernel.org>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [2.49 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b306:2000::2:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,amacapital.net,chromium.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,vger.kernel.org,lists.infradead.org,suse.de,ellerman.id.au,linux.ibm.com,lists.ozlabs.org,lists.linux.dev,arm.com,huawei.com,gmail.com,lwn.net,rendec.net,cs.unibo.it,redhat.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	R_RATELIMIT(0.00)[to_ip_from(RLgmbm6kmdycgna1ji64zx9jke)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,kunlun.suse.cz:helo,kunlun.suse.cz:mid]
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: 531843E07
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_034442_456156_69794AA9 
X-CRM114-Status: GOOD (  18.71  )
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

seccomp takes a shortcut here. When the syscall number is re-read after
ptrace and the sign bit is set in the syscall number the syscall is
skipped right away.

This works fairly well on x86 where the return value of the syscall is
preset before seccomp is processed.

However, on some architectures the syscall return value overlaps with
the syscall number or syscall arguments, and as a result the return
value cannot be preset in advance.

For these architectures seccomp needs to exit without flagging the
syscall as skipped. Then processing of invalid syscall number in the
architecture code should set the return value to -ENOSYS and skip the
syscall.

This introduces a change: If the syscall number has the sign bit
set, such as -1, previously the filter re-check would not be done, not
applying the filter after trace. Now the re-check is done both for
syscall nubers with and without sign bit set. This would only make a
difference if the syscall number or the filter was changed by the
tracer. Otherwise the filter would be resolved the first time around.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 kernel/seccomp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 066909393c38..9e40a38aaedf 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1318,11 +1318,8 @@ static int __seccomp_filter(int this_syscall, const bool recheck_after_trace)
 		 */
 		if (fatal_signal_pending(current))
 			goto skip;
-		/* Check if the tracer forced the syscall to be skipped. */
-		this_syscall = syscall_get_nr(current, current_pt_regs());
-		if (this_syscall < 0)
-			goto skip;
 
+		this_syscall = syscall_get_nr(current, current_pt_regs());
 		/*
 		 * Recheck the syscall, since it may have changed. This
 		 * intentionally uses a NULL struct seccomp_data to force
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
