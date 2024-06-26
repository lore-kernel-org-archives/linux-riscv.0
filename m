Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC74C3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0/fZixQ+wgqTM2RDBtL9acXC5+1tIQJAHqSQPJb9Ns=; b=3yk79A1hxJJKah
	4rvU7Hqa3pQvZcTohU00UEhlpeioqWJDX4yPKEu4vgoHaL/a1rMaNDBHHYacLdB7RR0p9jd4Nl6mx
	TOyq/wHis4BfkZa6nButxlXQVgpOv4IieXhghMBnwQtkSn6ku2hVRoVLJqd/2KskvMUjTtkMUStHF
	njsH06iPFIEJX4BygXINgi3smP3nExH+sORT5rhj1O97KFDQQjmf/gHqemTOykXfBS5yk9DnVz+8h
	5P8ROuv7VwrIHUx4D1l2kAQcEQbFu8sbN97dPG7W1nAZoRkO0cmUTzUMyhP6DBDqvP76+iCZ50afy
	fxSCE5gVWhepO4jWAN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSoc-00000006zSZ-3NG6;
	Wed, 26 Jun 2024 13:36:02 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSoX-00000006zPh-0bKV
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:36:01 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id B95B21FB57;
	Wed, 26 Jun 2024 13:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719408954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfrpoZhgiakpLLc3RPoEygxxgDJs9BsRwzh2jo1OcAM=;
	b=hH+fkMh4zjWLvQFqnHzhw2DJ84Ru97zHt38bUK2J5PeiDbX4dl6z4PgdKc/DuIwMY/63+W
	LfaHZbyfUbgxhad880f2Xem9C255DA/VkGRvAOpjSx+uQd5RToZZ4Tin7EW+veC6+qUnoz
	kU+h2rDen1C6tRpKuzro2t4YogKxSbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719408954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfrpoZhgiakpLLc3RPoEygxxgDJs9BsRwzh2jo1OcAM=;
	b=dHlhl5n7lGk1VnXkSQin/xnWpsqKyAilrbdOOJlP5dfhRSn0D6uqMNf5H4Q50stPpk1r3F
	vqCpKNMu6VzzR3BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719408954; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfrpoZhgiakpLLc3RPoEygxxgDJs9BsRwzh2jo1OcAM=;
	b=hH+fkMh4zjWLvQFqnHzhw2DJ84Ru97zHt38bUK2J5PeiDbX4dl6z4PgdKc/DuIwMY/63+W
	LfaHZbyfUbgxhad880f2Xem9C255DA/VkGRvAOpjSx+uQd5RToZZ4Tin7EW+veC6+qUnoz
	kU+h2rDen1C6tRpKuzro2t4YogKxSbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719408954;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfrpoZhgiakpLLc3RPoEygxxgDJs9BsRwzh2jo1OcAM=;
	b=dHlhl5n7lGk1VnXkSQin/xnWpsqKyAilrbdOOJlP5dfhRSn0D6uqMNf5H4Q50stPpk1r3F
	vqCpKNMu6VzzR3BQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 8204B4A050D; Wed, 26 Jun 2024 15:35:54 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
In-Reply-To: <ZnwObmA70Bfx9yCn@xhacker> (Jisheng Zhang's message of "Wed, 26
	Jun 2024 20:49:50 +0800")
References: <20240625040500.1788-1-jszhang@kernel.org>
	<20240625040500.1788-3-jszhang@kernel.org>
	<acd2e53f-b5c1-49c5-86e2-bc09eb917163@app.fastmail.com>
	<ZnwKXWzRz9B5FbLM@xhacker> <ZnwObmA70Bfx9yCn@xhacker>
X-Yow: I like the IMPUDENT NOSE on that car..  Are you a TEEN-AGER?  
Date: Wed, 26 Jun 2024 15:35:54 +0200
Message-ID: <mvma5j7omh1.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_063557_351793_4F85F9B0 
X-CRM114-Status: UNSURE (   6.33  )
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

On Jun 26 2024, Jisheng Zhang wrote:

> no output constraints either. It just uses "r" input constraints to tell
> gcc to read the store address into one proper GP reg.

Again, this is backwards.  Being an input operand means the asm is using
this operand as an input to the instructions.  The compiler needs to
arrange to put the value in the allocated operand location according to
the constraint.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
