Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FC2CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 13:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceUcvmCBRIVQslhxTBsuJjk8u8nowzmyX/HZ1tTo8EY=; b=sMkoTqCmBGbpQO
	g3n/jqdjBs6wt0Hxp3oE8d9WLIKsGyGiSUcgTdGoVnqddKMhf7eiadoweQadasJjNiy2fL/m1u6Zr
	Tax2J51P4ZibBkRk2jp3k3a+A8Su/d2O8zZvHDWUwjbozjTyQxyX9OIH3bWYpHpfk7aIlf1trIFvD
	KiTNcoMVknIr8AhwiZ8WnPXv340s3FEjwm3Hfe72DAsrbXFKMSD1gmu9RNcd0MnnBTEzdWzUsd9AF
	IjmPPzJ/QEDIv4wFfYprbJ0Lov6XdhDF5ccwgLYBqur3/Z+GUtOjy+vGsCAyfZXOjRBqbn0q2Xat6
	HrJOjTN8ExkeVFS8e2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNMI-00000002rMS-3wKn;
	Thu, 04 Apr 2024 13:42:26 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsNMC-00000002rJc-0nYX
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 13:42:24 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 40D985D9E9;
	Thu,  4 Apr 2024 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712238136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKECyJGr5HtdnaY4tsEoyLq946ISDZRIngiGxLxPkeQ=;
	b=kqEylmTqvUE77JwCy+hG582za952DmmVZ9IFzsBtxTCoEm89d89I3FuVs4D6GbqbUBw9Gx
	/sHNBke+ZcojfIQfncITw5u+dt/ZUEX0rfMOGdOpm7aZTKXLtklfsv0DlCiVq7T2i7wINH
	cT13HaHBGHKuIMVcOsd5+7Gz+jz5ouU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712238136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKECyJGr5HtdnaY4tsEoyLq946ISDZRIngiGxLxPkeQ=;
	b=KkNAOZuR118ii50urefvcvYFK1hYSXzWbOzMJWFmUQTK8w32+r9IzLsXZAAGMiBeDVx6D9
	8bsnRCIPpN7aXdCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1712238136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKECyJGr5HtdnaY4tsEoyLq946ISDZRIngiGxLxPkeQ=;
	b=kqEylmTqvUE77JwCy+hG582za952DmmVZ9IFzsBtxTCoEm89d89I3FuVs4D6GbqbUBw9Gx
	/sHNBke+ZcojfIQfncITw5u+dt/ZUEX0rfMOGdOpm7aZTKXLtklfsv0DlCiVq7T2i7wINH
	cT13HaHBGHKuIMVcOsd5+7Gz+jz5ouU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712238136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKECyJGr5HtdnaY4tsEoyLq946ISDZRIngiGxLxPkeQ=;
	b=KkNAOZuR118ii50urefvcvYFK1hYSXzWbOzMJWFmUQTK8w32+r9IzLsXZAAGMiBeDVx6D9
	8bsnRCIPpN7aXdCQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 228F54A0553; Thu,  4 Apr 2024 15:41:46 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Yunhui Cui <cuiyunhui@bytedance.com>,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: use KERN_INFO in do_trap
In-Reply-To: <mvmy1aegrhm.fsf@suse.de> (Andreas Schwab's message of "Tue, 19
	Mar 2024 16:40:05 +0100")
References: <mvmy1aegrhm.fsf@suse.de>
X-Yow: All I can think of is a platter of organic PRUNE CRISPS being trampled
 by an army of swarthy, Italian LOUNGE SINGERS...
Date: Thu, 04 Apr 2024 15:41:46 +0200
Message-ID: <mvmcyr5ckit.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.14 / 50.00];
	BAYES_HAM(-2.94)[99.75%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_064220_421899_4DB9F8F3 
X-CRM114-Status: UNSURE (   3.70  )
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

Ping!

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
