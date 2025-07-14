Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166FFCA0EE4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/8/7efoB8io1SCp46jg2MpNWejzi7xPdtAkuxk2B9c=; b=1qCUlg0hCGHrah
	eaZUaIEe/H+vENbrk19Vg33HPmRL1li+vVklxe0aemT7pf3Ty2tUHyrigjyipAHIDh+bp7LypHT1h
	irDtkFY/fYh9KnW73HBygmO5NgN0wQm9cJJWWHinfncwZLFdY16Pps2L1eYMaji6a+5z0Nz5PevcG
	RQnGMf0TF1mfAvNanMJcdPdmbV8ZadclFjdjZwxHAK4WwLiL8OBUT/hw4SbA9RjR/zUZ0fkeUu6nt
	yFlppwQZOms6LIrkFYuYIQOUxfdp8f9GAPEaQhXJBT7oakQidjWJ7E0ht5MU2VDt4ybUY7FyE90vu
	XDwAW9fYjPQ1xY4gcfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulx24-0000000C6rM-06YI;
	Tue, 12 Aug 2025 21:59:48 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDGp-00000001QRf-1uRl
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 07:06:40 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 3D2281F387;
	Mon, 14 Jul 2025 07:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752476796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfAYkrc663Cdw7o2El9zjp3T7cTtGsn9SFhA5HNgxLU=;
	b=hnD4vPPqNTDy1Ps38nxV50vP3sXFg/vh2vf/Hk125Wbzirw3XqsPQwfg68omuzcpaeFSNd
	MuKBgs8xu9BudnbwxCQKu7Q7peJxO7ocAdSwCMbBJjbc7nqc148iWoynGSyZzsVfZJD0/f
	X8/Qr3xctMCwAIg+YQoFtQQNXI5eRwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752476796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfAYkrc663Cdw7o2El9zjp3T7cTtGsn9SFhA5HNgxLU=;
	b=XuDGmYU0XV+y5RyydFPkr1Fp5S4d3iBJHhdAFPubH196XpVZYDe5BycJmOpKz1WIjIwvAU
	74jzBVU5hGzITiDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hnD4vPPq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XuDGmYU0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752476796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfAYkrc663Cdw7o2El9zjp3T7cTtGsn9SFhA5HNgxLU=;
	b=hnD4vPPqNTDy1Ps38nxV50vP3sXFg/vh2vf/Hk125Wbzirw3XqsPQwfg68omuzcpaeFSNd
	MuKBgs8xu9BudnbwxCQKu7Q7peJxO7ocAdSwCMbBJjbc7nqc148iWoynGSyZzsVfZJD0/f
	X8/Qr3xctMCwAIg+YQoFtQQNXI5eRwU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752476796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfAYkrc663Cdw7o2El9zjp3T7cTtGsn9SFhA5HNgxLU=;
	b=XuDGmYU0XV+y5RyydFPkr1Fp5S4d3iBJHhdAFPubH196XpVZYDe5BycJmOpKz1WIjIwvAU
	74jzBVU5hGzITiDQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 3AB1B4A05D8; Mon, 14 Jul 2025 08:59:11 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,  damien.lemoal@wdc.com,
  anup@brainfault.org,  palmer@dabbelt.com
Subject: Re: [PATCH] riscv: traps_misaligned: properly sign extend value in
 misaligned load handler
In-Reply-To: <d1533a6a-d904-428b-a44c-362faf61daf8@ghiti.fr> (Alexandre
	Ghiti's message of "Fri, 11 Jul 2025 09:29:13 +0200")
References: <mvmikk0goil.fsf@suse.de>
	<d1533a6a-d904-428b-a44c-362faf61daf8@ghiti.fr>
Date: Mon, 14 Jul 2025 08:59:11 +0200
Message-ID: <mvmy0srfebk.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [15.28 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_SPAM_SHORT(2.99)[0.997];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MID_RHS_MATCH_FROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:a101:3:92b1:1cff:fe69:ddc:from];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: 3D2281F387
X-Rspamd-Action: add header
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_000639_647971_4F72DBB3 
X-CRM114-Status: UNSURE (   4.84  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 12 Aug 2025 14:55:28 -0700
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

On Jul 11 2025, Alexandre Ghiti wrote:

> Does that fix the issue you reported when booting with opensbi 1.7?

Yes, it does.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
