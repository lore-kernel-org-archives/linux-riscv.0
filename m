Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AECBC0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4KXdzh/L14aqm3w/kluTX6RgK0j9h28U3qJlrGi7XI=; b=pwhfo26iFbQA+U
	yGJkkBfy6DEMAuGSE76VsAm8G2VWdKqtqeWallKCzfJB+D7kww8tccgCat+IHxEosihKXH4XkrvsZ
	xqFB7JK1fzMp7LTesW1u+tToVhEdMPcaFbK6aQbP8IIpc/sCy3g9Xdfv8hTyXXiF4JCaEa5GUISc4
	PQEAAACDa43uyH2X7YMGtKLQyN1zcJYUs9VDltB9kFebJ3pz+UgupHA1zDZd1lxix7m/srSIt6d1s
	Imr7cswh4bLRwzjNT+jcRuhMeSfC2wIMkPX1lzlxIIz/WL6qIwqpMkzbN5SLwyudUd1lnP/x6Hrzi
	mXyF2bmTB95ywZCQuhoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWri-000000095rf-2eHs;
	Thu, 30 Jan 2025 15:54:02 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdWrg-000000095qR-0BXd
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 15:54:01 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out1.suse.de (Postfix) with ESMTP id ECB2821119;
	Thu, 30 Jan 2025 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738252438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPAJkN6OC+am6GO8NqpZY0HniVqg2hpiAus7C+OxupE=;
	b=khs6mK5swyyHFpf4usPkQ0pCcp8Xcaozpqs0SYZ9N9MjHKvW/ztn035f5iX5aimAM8Rie+
	u7SyQJfXE/9gb7L+BUUasK6OynWbtohOzB/GW5575p4aFwBMOzUN0AGZ+rXjz1vvxy8AtF
	emk8KRMU3hxzvpOZv/eVAR2VGBLD6pM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738252438;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPAJkN6OC+am6GO8NqpZY0HniVqg2hpiAus7C+OxupE=;
	b=uK2e1rJeDgXquAqIvNL4xfZwq4Wjic1lROQupuAs0l1l4V1Bt+Pb8dm7Fb5togQswNL0k6
	MkflyO78/1fF7mDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hIueoExz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DaIYu31c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738252437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPAJkN6OC+am6GO8NqpZY0HniVqg2hpiAus7C+OxupE=;
	b=hIueoExz8w2EA9+RQGCp0zkyTsKG1tf36eI78UeOhey//shZ1a29leFllK9S9kDvlQnhXH
	Ry6zEk2IYfnii+XRRExjfpbgZal2pLvlIHGa+aaPaOSrTJaZpSaIjtttj7XQmPu6vKh7n8
	xLvM09rjdgpfD9oM11gZVQD4DTsCnII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738252437;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RPAJkN6OC+am6GO8NqpZY0HniVqg2hpiAus7C+OxupE=;
	b=DaIYu31cjQcUKGB6NlFSCJezQxKLBj0UT3AET+YFIa7mm3waN1jTbei+1eCsFU4+lD4t48
	UgXjJ9Efv8cmXADw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id D84AE4A03B1; Thu, 30 Jan 2025 16:53:57 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
In-Reply-To: <ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr> (Alexandre
	Ghiti's message of "Thu, 30 Jan 2025 16:23:00 +0100")
References: <mvmed0k4prh.fsf@suse.de>
	<c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr>
	<mvm5xlw4anb.fsf@suse.de>
	<ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr>
Date: Thu, 30 Jan 2025 16:53:57 +0100
Message-ID: <mvmwmec2t7u.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [2.59 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: ECB2821119
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_075400_227699_8F3073FE 
X-CRM114-Status: UNSURE (   5.31  )
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

On Jan 30 2025, Alexandre Ghiti wrote:

> a2 is used as it is passed by the calling function, so we can't be sure a2
> is sign extended to me, what am I missing?

32-bit scalar arguments are guaranteed to be sign extended on entry.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
