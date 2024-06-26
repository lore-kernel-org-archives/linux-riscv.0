Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C90C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 13:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQz356Ib9mNEW9iIMadR8BglmQXTV/ZXBADR8rNK7/c=; b=otDKOEvnNob4xn
	1dMIMvEvFS/c+af4OKICTrGZL86sModEyWIylGACrhXUEINVTWhRzJ1PuDsqqai3ZJ/9vLj+xZB9d
	leuavVTpT5oP3PRIF95Gqyw+MwN9OChPuPQH2hKJFE/7UjLhGN4yQA7b/54MV/i4mBeeQNo5SF8Tc
	rAdonAy0rL8BqYrmEIPNCE7GqFOZrK8DEN1b2kd1y67kb9N5UkylKroudEktU2KgZNR8HlXC/KKR1
	/EfJb9ZiDzxz8Ef6CfQgTstQTZZq1IH+lFhfsXskUWct+bzq89OojVyHQrUc/zRyL3W3axS74Ty2z
	sQmDwgZMcZWXEigci6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSSN-00000006u7N-0LHe;
	Wed, 26 Jun 2024 13:13:03 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMSSD-00000006u3c-1bH5
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 13:13:00 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 25B7421A99;
	Wed, 26 Jun 2024 13:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719407570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCa82HaPuM92DEe4lqLQ19XPhcnsH9XJaUHSDB5WOrg=;
	b=B+pAT+RVwsuhyDCyJlII7uNA+7KhhqBIQeT3pkN9/guAk3tUG2+qyus0DKMdOvgFa+rNiJ
	FfBkZ3KQPCd7+qupc1NNhOKHdzB+90ign7VtPpZ8zkssGVdV8gubo3xo8XeRKC9oKtbGyl
	cB9j0NtJsrnrcfgJDbnu90WqXrFLN/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719407570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCa82HaPuM92DEe4lqLQ19XPhcnsH9XJaUHSDB5WOrg=;
	b=JsPBC40J3px8snBbnKMa/1cpnkIANAq3EgZsMvFhgexwioIfRjOlrzwZ5X7lRbhk8tm1fF
	Osm8UCYX7RkVj/Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719407570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCa82HaPuM92DEe4lqLQ19XPhcnsH9XJaUHSDB5WOrg=;
	b=B+pAT+RVwsuhyDCyJlII7uNA+7KhhqBIQeT3pkN9/guAk3tUG2+qyus0DKMdOvgFa+rNiJ
	FfBkZ3KQPCd7+qupc1NNhOKHdzB+90ign7VtPpZ8zkssGVdV8gubo3xo8XeRKC9oKtbGyl
	cB9j0NtJsrnrcfgJDbnu90WqXrFLN/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719407570;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCa82HaPuM92DEe4lqLQ19XPhcnsH9XJaUHSDB5WOrg=;
	b=JsPBC40J3px8snBbnKMa/1cpnkIANAq3EgZsMvFhgexwioIfRjOlrzwZ5X7lRbhk8tm1fF
	Osm8UCYX7RkVj/Bg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 14A504A050D; Wed, 26 Jun 2024 15:12:50 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
In-Reply-To: <20240625040500.1788-3-jszhang@kernel.org> (Jisheng Zhang's
	message of "Tue, 25 Jun 2024 12:04:58 +0800")
References: <20240625040500.1788-1-jszhang@kernel.org>
	<20240625040500.1788-3-jszhang@kernel.org>
X-Yow: MMM-MM!!  So THIS is BIO-NEBULATION!
Date: Wed, 26 Jun 2024 15:12:50 +0200
Message-ID: <mvmikxvonjh.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.18 / 50.00];
	BAYES_HAM(-2.98)[99.92%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.986];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_061253_595648_4A7C7792 
X-CRM114-Status: UNSURE (   7.09  )
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

On Jun 25 2024, Jisheng Zhang wrote:

> I believe the output constraints "=m" is not necessary, because
> the instruction itself is "write", we don't need the compiler
> to "write" for us.

No, this is backwards.  Being an output operand means that the *asm* is
writing to it, and the compiler can read the value from there afterwards
(and the previous value is dead before the asm).

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
