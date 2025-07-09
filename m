Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF93CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klxt+Xn/XgOJ+xqqVOfWvGTcqt2QPErX5SE45wAflFU=; b=dFbI4IFjExl0eD
	pE+yD2xItd9CBRjhL/riChwdQtjUlnw9erDRGyc5xdJj9ZcHknq0aUl/ImI5UiWh546gqh7l362YM
	/t28gBHwr28iIWxrwhL003w2glQCPYiqoPOHvtGeosbhfHRZ54q9KXMuGtV4CBZS1VrnvCSbeDPNT
	coFaCcC+jQfceNq6bHs9SzYvwoLNxY5bdYVxTTXbhPVaY3QOjfkNvBhmZebRnbf2xvuxso6ycn0D6
	UQDLdvIYQDzy/FcKQ4lEZK/pgO+zCgmJ8CjHS8AkXMF8NcMtJV4rPITXe+Y1EViDEl6hTs256aelH
	icT9s1YooQciz4lqV9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulx22-0000000C6rA-3kae;
	Tue, 12 Aug 2025 21:59:46 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPGd-00000007olG-0P8l
	for linux-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 07:31:00 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 12FEB1F452;
	Wed,  9 Jul 2025 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752046252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBoEEQ0y8ugJybCL6zZltsWznkqPvTb54W9gdu4GoWQ=;
	b=vtbdBOs6fomuZT9kXVPBXeWT04uN1pu5wHEckSewdeL7AiFvUijTW+OruSR4fWQ03+5/Ly
	PrFMX8nq0eqvkhJXveGFVQ0KVc4CPuSm9BswfXKSrcDZGNiM83Zb/rJcGNg6Z/OJCPQGY3
	WmaCrrFQtGn9bPZyRFSgOoFy16sRtps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752046252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBoEEQ0y8ugJybCL6zZltsWznkqPvTb54W9gdu4GoWQ=;
	b=CcIZb9TW29fO/ZumSn2tbUtCZWmV1siXsWLJgBNao7hmonjQI+sU6WDEYjmt1D4/DpbG5k
	JIEFn1xycJnviVCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=te6fqrrg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lOyMG5VT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752046251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBoEEQ0y8ugJybCL6zZltsWznkqPvTb54W9gdu4GoWQ=;
	b=te6fqrrgNHiu5V6PI22OWtHektkp+BFnFXM8snaSFs0/oqPbPSXe7P5JtobNdYgGPiCZyx
	jSzAmYQsA3dh2mn9bBGFUHzyuQAeAlPyw2h7TJ0NAtLpJczf01Lb2doMrWAg6fcpESdCrz
	oh9KiKTAg6IJic5vXdPJ/gJqNl45gC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752046251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBoEEQ0y8ugJybCL6zZltsWznkqPvTb54W9gdu4GoWQ=;
	b=lOyMG5VTsjzIulQfZaYuzdKHNKYlDZkX1Nj0rpq+311VfsKdqOr0OeokSHfyveYZ9t6gzR
	OfaO0OXJXDm5dGDw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 981B04A05EC; Wed,  9 Jul 2025 09:21:06 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Subject: Re: openSBI 1.7 causes v6.16-rc boot to hang on VisionFive 2
In-Reply-To: <4e6cab2e-c18e-4bc3-8a9f-450326324d98@ghiti.fr> (Alexandre
	Ghiti's message of "Wed, 9 Jul 2025 08:46:24 +0200")
References: <mvm1pqrkmoe.fsf@suse.de>
	<4e6cab2e-c18e-4bc3-8a9f-450326324d98@ghiti.fr>
Date: Wed, 09 Jul 2025 09:21:06 +0200
Message-ID: <mvm4ivlkexp.fsf@suse.de>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:a101:3:92b1:1cff:fe69:ddc:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,hawking.nue2.suse.org:helo]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: 12FEB1F452
X-Rspamd-Action: add header
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003059_384539_DC14EF12 
X-CRM114-Status: UNSURE (   4.42  )
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

On Jul 09 2025, Alexandre Ghiti wrote:

> Do you have a means to know what happens here (pc, sepc, stval etc)?

Unfortunately, sysrq does not work at this point.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
