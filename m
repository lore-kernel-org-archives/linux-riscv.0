Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB3FCD4F41
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 20:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNveIdnLeAG4KVHM3AxSoyrMnBEOQg0c6dyn+Vaaxrw=; b=0jAyEPX27MzUZ5
	TdwwMUdT9KteGPOKFKDt0Di4qZ3U9E5Uq+jT+RwMTNVRrqrxaPk6wsGPBE1iFteFRp6IU0vg1+dBe
	uUTDmJxecruBUAlubJgemgFY1ZeqpjjYhGW6xxxGQS30S2XMfzH2ZRmKyHPgyMjXGk2u5AVwFIcV6
	Sv3UKSznW5DNxkeolkG9+tWvXABHKqhU6CxNXraq+iUkXq0Z3Tt6Rs32kAsT5i0Qy+Df0v2ZiKHcU
	njVZwMhg15GHUx97ldkGAmLw69f3bsjg7zu0Ayjt71lVn2irF5GEfjqVEnmT73YckQ9Wi7nWq+ie5
	euBuamJuz8nA6CDwfYfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNGFq-00000003iWs-0jFk;
	Wed, 13 May 2026 20:32:30 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLRw-0000000CfIu-0cAG
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 07:53:13 +0000
Received: from hawking.suse.de (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out2.suse.de (Postfix) with ESMTP id 912365BDEA;
	Mon, 11 May 2026 07:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778485988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrMwjdTs3ZOqPfrtk4czGVOUuRqiGW+6XKywJYPIV94=;
	b=v0pUWhY+WVWI5C+299Hw8Tz/uAJwhUzDVsp0SXe1DFqqD1YZKXIvfnGFFvbonz5Yq/hC1g
	RggYljNRohrzC59qpnLAWRIaKUFn5m7yCFi01qMdzwqoIfSnDsn4FAEwrUZu5uE9RLnp1V
	89TtYKD6kQBBlz6WqDF4EpVpWR3iEmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778485988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrMwjdTs3ZOqPfrtk4czGVOUuRqiGW+6XKywJYPIV94=;
	b=zyj0zqNHREl2W+IdqrLf3yiP78262eSIPMazok/r/cvP5U7Oih5guNiPmIKyKhiAtEkjxZ
	sSdPGfOO0ldwYiAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v0pUWhY+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zyj0zqNH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778485988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrMwjdTs3ZOqPfrtk4czGVOUuRqiGW+6XKywJYPIV94=;
	b=v0pUWhY+WVWI5C+299Hw8Tz/uAJwhUzDVsp0SXe1DFqqD1YZKXIvfnGFFvbonz5Yq/hC1g
	RggYljNRohrzC59qpnLAWRIaKUFn5m7yCFi01qMdzwqoIfSnDsn4FAEwrUZu5uE9RLnp1V
	89TtYKD6kQBBlz6WqDF4EpVpWR3iEmg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778485988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrMwjdTs3ZOqPfrtk4czGVOUuRqiGW+6XKywJYPIV94=;
	b=zyj0zqNHREl2W+IdqrLf3yiP78262eSIPMazok/r/cvP5U7Oih5guNiPmIKyKhiAtEkjxZ
	sSdPGfOO0ldwYiAg==
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 797784AADBC; Mon, 11 May 2026 09:53:08 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Zishun Yi <vulab@iscas.ac.cn>
Cc: pjw@kernel.org,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alex@ghiti.fr,  ajones@ventanamicro.com,  cleger@rivosinc.com,
  charlie@rivosinc.com,  namcao@linutronix.de
Subject: Re: [PATCH v2] riscv: misaligned: Restore epc in error path
In-Reply-To: <20260509074053.1748061-1-vulab@iscas.ac.cn> (Zishun Yi's message
	of "Sat, 9 May 2026 15:40:53 +0800")
References: <20260509074053.1748061-1-vulab@iscas.ac.cn>
Date: Mon, 11 May 2026 09:53:08 +0200
Message-ID: <mvmh5oe1ixn.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [15.29 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(3.00)[1.000];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.suse.de];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.suse.de];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:a101:3:92b1:1cff:fe69:ddc:from];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid]
X-Spamd-Bar: +++++++++++++++
X-Rspamd-Queue-Id: 912365BDEA
X-Rspamd-Action: add header
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_005312_372728_527C4A83 
X-CRM114-Status: GOOD (  10.74  )
X-Mailman-Approved-At: Wed, 13 May 2026 13:32:29 -0700
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

On Mai 09 2026, Zishun Yi wrote:

> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 2a27d3ff4ac6..24f898853bba 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -307,13 +307,17 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>  		return -1;
>  	}
>  
> -	if (!IS_ENABLED(CONFIG_FPU) && fp)
> +	if (!IS_ENABLED(CONFIG_FPU) && fp) {
> +		regs->epc = epc;
>  		return -EOPNOTSUPP;
> +	}
>  
>  	val.data_u64 = 0;
>  	if (user_mode(regs)) {
> -		if (copy_from_user(&val, (u8 __user *)addr, len))
> +		if (copy_from_user(&val, (u8 __user *)addr, len)) {
> +			regs->epc = epc;
>  			return -1;
> +		}
>  	} else {
>  		memcpy(&val, (u8 *)addr, len);
>  	}
> @@ -409,12 +413,16 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
>  		return -1;
>  	}
>  
> -	if (!IS_ENABLED(CONFIG_FPU) && fp)
> +	if (!IS_ENABLED(CONFIG_FPU) && fp) {
> +		regs->epc = epc;
>  		return -EOPNOTSUPP;
> +	}
>  
>  	if (user_mode(regs)) {
> -		if (copy_to_user((u8 __user *)addr, &val, len))
> +		if (copy_to_user((u8 __user *)addr, &val, len)) {
> +			regs->epc = epc;
>  			return -1;
> +		}

I think this is better handled by a common error exit.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
