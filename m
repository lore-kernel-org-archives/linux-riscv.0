Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36369C83F1B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/8/7efoB8io1SCp46jg2MpNWejzi7xPdtAkuxk2B9c=; b=tsrFiPYeOFwa0w
	yf6WnOCOmA5FvDFdsy61JIIqQd/fLGYzT/FjG4+78Bk698UtnVM7BdnXoeE10SpeKvPLj09HAnRSj
	mapVkeZR2xf4VVHdVLlxB68y1MugqoT2QA/wW/lIAEN0r2XYRije4kWuf3uIOve6gwhz9+C0yxDGp
	tjQTBR12ShByRE8/L+GXR5KISdmfTpcF0eBZLZg6onsmuzdK8pAkIIin1I/xVK+cGm6+WE8Y5BsFo
	c7lipa0q2reZWwfEpSUUgb3uZe7VpbLuQN4P25e5UtMpQC0DOSuAk97mo/gx7+mPedGyzF6vx3+t1
	sSzQx0A24+tgoga9OHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDvz-00000001WI1-2GLE;
	Mon, 14 Jul 2025 07:49:11 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDlQ-00000001Uoz-3MBe
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 07:38:17 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3595D211B0;
	Mon, 14 Jul 2025 07:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752478695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfAYkrc663Cdw7o2El9zjp3T7cTtGsn9SFhA5HNgxLU=;
	b=nXo0e+OHL5eVyjIxGYEU7XK4BPvm9LBTpUUOsZGPdJl+T6hpodYcVQ3u95hXmCIUJ51f+k
	PRyB933JttaB8dox2IB7ypvyFmoLR79a/3w+YU9hh/0XU1mjj/ZdqSSOIT1PiUwOQWfv0M
	cRVkDIQdFFn9iuaJHpfEfsk7104qG+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752478695;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfAYkrc663Cdw7o2El9zjp3T7cTtGsn9SFhA5HNgxLU=;
	b=7CmoMIKtXviVIUKbRuDANSQWMddsdc2H7XW7swmpyvFAcnx4fKJDPJ0deMRb0RNKiLl3WY
	FfONwzx8aGiLN2CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752478695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfAYkrc663Cdw7o2El9zjp3T7cTtGsn9SFhA5HNgxLU=;
	b=nXo0e+OHL5eVyjIxGYEU7XK4BPvm9LBTpUUOsZGPdJl+T6hpodYcVQ3u95hXmCIUJ51f+k
	PRyB933JttaB8dox2IB7ypvyFmoLR79a/3w+YU9hh/0XU1mjj/ZdqSSOIT1PiUwOQWfv0M
	cRVkDIQdFFn9iuaJHpfEfsk7104qG+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752478695;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfAYkrc663Cdw7o2El9zjp3T7cTtGsn9SFhA5HNgxLU=;
	b=7CmoMIKtXviVIUKbRuDANSQWMddsdc2H7XW7swmpyvFAcnx4fKJDPJ0deMRb0RNKiLl3WY
	FfONwzx8aGiLN2CA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 29D424A04CA; Mon, 14 Jul 2025 09:38:15 +0200 (CEST)
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
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Mon, 14 Jul 2025 09:38:15 +0200
Message-ID: <mvmh5zffcig.fsf@suse.de>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.980];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_003816_975647_C372332B 
X-CRM114-Status: UNSURE (   4.77  )
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
