Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCB0C0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsm+uceuq9ttiVD4Wi5XVcRmirFnLPTRA+v6gH/Ndu4=; b=2/iP5zz2SQTnG4
	NniloHe5Ujwxqgi3leOjy0JTUjsUFLyN95kLJPFyZ8ZXi/csw2gDAJWhRrHI8PBEvKrnv8/EDA3WY
	4s1nxRqGRA3MXpR5BDZJkGBREYIjnpjpdJhI3fBVRxpA3mRH13ykSQqHuDptEsVGD7AhzJ/j81Xvf
	KNMjU0j99lbyaRKwWRkItnAIYLTdro2SAuqi6u2GjBrMrDb4+pZRTny7Cpt/AMV8hjn0g6eA3pPLr
	JKdT155vpRzhCDOGSoORBhEBZHSel3HvJJQBKm+xT7L8QbZJZxGSwj1BUVpO6GPsdrVCnFMw3bLYP
	rpzc0TYyWOH3L89qZCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVtw-000000091FQ-050h;
	Thu, 30 Jan 2025 14:52:16 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVtt-000000091Ey-365u
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 14:52:15 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 3C3191F383;
	Thu, 30 Jan 2025 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738248730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhjXRQBcL+Vc8yB+vfF7shV11ojC6g+eIdGRk4/e074=;
	b=zu+LCcRGwpayK7X8rIG3sMIQ53MV1vsXD3x/1mZdiX61LoQWBTrAfaY22GCv6Exi57xuiB
	K+Ul7riIkr3DUQ0BCYqJ6uEhhC5SP+ORQNZaD9zT6u4M+vsJtANnla/RnYOM+XRJUCcq7g
	CNLIMkIkv6t6dJeDN6KZWIy57lJPsbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738248730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhjXRQBcL+Vc8yB+vfF7shV11ojC6g+eIdGRk4/e074=;
	b=ZlNBkuYVRgI7OyK18RhCJ0QMZ7X/MYm6vWi2G2OH1Ggb1T7HimjlxYHlXwh0dTgd5f9dsO
	MgOzu7SAOrQR/hDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738248729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhjXRQBcL+Vc8yB+vfF7shV11ojC6g+eIdGRk4/e074=;
	b=elIz4k7Ng3fqf0IoYQ9FbXQI5bCJ+UBI6MFkaeOUcBmGfRp70lgRjP6rt1lDqkYsxy+22x
	T66/oEE8U77G3acVGTfH+tkSapgsPWCUzQflb42EFsOTYK4Jvi9yY7MFtxvSHppZ3XkY6G
	X3AEu8NSR/LyGJlKR+sG596FJs+xYPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738248729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hhjXRQBcL+Vc8yB+vfF7shV11ojC6g+eIdGRk4/e074=;
	b=xvQQ0L+qTb3V+8jEEJFMhOU6TIhgNliVkND+JbOgnM0ePy2psgMZqa7TVHP4+Y+Pyebsmu
	DuPeFDh1tiXZZBAg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 0D8694A03B1; Thu, 30 Jan 2025 15:52:08 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
In-Reply-To: <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr> (Alexandre
	Ghiti's message of "Thu, 30 Jan 2025 15:18:54 +0100")
References: <mvmed0k4prh.fsf@suse.de>
	<c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr>
Date: Thu, 30 Jan 2025 15:52:08 +0100
Message-ID: <mvm5xlw4anb.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,bootlin.com:url,hawking.nue2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_065213_921620_2AD191A1 
X-CRM114-Status: UNSURE (   6.38  )
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

> That's a nice catch indeed. IIUC, we have the same issue here
> https://elixir.bootlin.com/linux/v6.13/source/arch/riscv/include/asm/futex.h#L89
> right?

Indeed, though it doesn't result in wrong code currently.  This is
because the compare value is passed unmodified as u32 to the asm and the
compiler keeps the value sign extended in registers.  That would break
if you would add a cast to long like in commit 6c58f25e6938 as that
would erroneously zero extend it.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
