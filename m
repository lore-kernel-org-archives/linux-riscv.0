Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F463C02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3EoVxizoKSin3J5p49LxTVg41GgpmMfLLwtFUza9ic=; b=k9kGdgjHXi9+gt
	92h9zlUXzPYoaWUGMxc15QQj0oxYQ+r14N7NrU1e1PXTf3f7+Piovk9jWcSgOTrMlJslrjoyx8igr
	kI5mvbo45gmmcWADCqRdRSU/yr5m4bnak0xMqBxQgNMrArxU4sUNk3UQBj6gb7XBallMarCjKRrBR
	BCSGhP4fLcjUwa/D/68Zss/p9S2ldlXTBTiGrLRgJG3OWHH6BNH6c4xnED/HNN+UE3rzexbWoaolO
	BGdUUS+G8IiMlQHUyCDknZadverTik3yvj3qghvpxve3M04eJigmFHKNkWA+n7eunzMrtjabHgY/J
	Vy6SJg+8k7rcuRwp26Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tes2l-0000000EstU-00mC;
	Mon, 03 Feb 2025 08:42:59 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tes2i-0000000Essp-3V4z
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:42:58 +0000
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 4266E1F37C;
	Mon,  3 Feb 2025 08:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738572175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4KmZoQfw8THBhrTIiwcH+di+9FGYYevhJ3k+w9c0xc=;
	b=ZRYXQX62EiH6D6fHevn7HpphdOaypDmDwrTpW7Cwo+d1b/O+2w3L2YhJAbrZenn8Ax6FS6
	c8981AUwCheJOZr5SqbnPbR7FSIjh1iZoWWzTZTjqH3MkQf2UUoTdzT93+VhuL2G2POO6z
	HLCzl+TC02gaVHILLiDqws9L3ZdTri4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738572175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4KmZoQfw8THBhrTIiwcH+di+9FGYYevhJ3k+w9c0xc=;
	b=WhfXxchtS4RjUIWr3l54PdGjWM1HtrSqRPzqPTTvVn4e73Mp6DkrGzkNsq2orSTcKdJQXj
	W3h2uh+1LdGnxPAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZRYXQX62;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WhfXxcht
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738572175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4KmZoQfw8THBhrTIiwcH+di+9FGYYevhJ3k+w9c0xc=;
	b=ZRYXQX62EiH6D6fHevn7HpphdOaypDmDwrTpW7Cwo+d1b/O+2w3L2YhJAbrZenn8Ax6FS6
	c8981AUwCheJOZr5SqbnPbR7FSIjh1iZoWWzTZTjqH3MkQf2UUoTdzT93+VhuL2G2POO6z
	HLCzl+TC02gaVHILLiDqws9L3ZdTri4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738572175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n4KmZoQfw8THBhrTIiwcH+di+9FGYYevhJ3k+w9c0xc=;
	b=WhfXxchtS4RjUIWr3l54PdGjWM1HtrSqRPzqPTTvVn4e73Mp6DkrGzkNsq2orSTcKdJQXj
	W3h2uh+1LdGnxPAw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 1EB8B4A0551; Mon,  3 Feb 2025 09:42:55 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
In-Reply-To: <CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com> (Jessica
	Clarke's message of "Thu, 30 Jan 2025 17:21:28 +0000")
References: <mvmed0k4prh.fsf@suse.de>
	<c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr>
	<mvm5xlw4anb.fsf@suse.de>
	<ac53a62e-4f89-49c9-a755-fdfa7a582337@ghiti.fr>
	<mvmwmec2t7u.fsf@suse.de>
	<CC2D9220-F8DE-4CC8-ACAD-7B1A21E276FE@jrtc27.com>
Date: Mon, 03 Feb 2025 09:42:55 +0100
Message-ID: <mvmo6zj2zcg.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [2.70 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM_SHORT(-0.09)[-0.440];
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
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: 4266E1F37C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_004257_024224_86E643B2 
X-CRM114-Status: UNSURE (   7.05  )
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

On Jan 30 2025, Jessica Clarke wrote:

> On 30 Jan 2025, at 15:53, Andreas Schwab <schwab@suse.de> wrote:
>> 
>> On Jan 30 2025, Alexandre Ghiti wrote:
>> 
>>> a2 is used as it is passed by the calling function, so we can't be sure a2
>>> is sign extended to me, what am I missing?
>> 
>> 32-bit scalar arguments are guaranteed to be sign extended on entry.
>
> Firstly, the calling convention is irrelevant if the function is
> inlined, which this almost always will be.

This is only about the non-inlined variant.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
