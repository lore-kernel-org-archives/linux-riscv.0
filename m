Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A54C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6py4oO/ul1PVtptjhfdM71D9x4sR/onnv25gW8qGKg=; b=ZgvRMvn4M0Xahu
	xBk/6riODUsJZ8+KFtRMnN7/pOmXIpFrYWTeBMMQUKTxb5BtjCAXXje3ETcwvUDL3ug0ksgTmzoiT
	2sbSXNi0xxJO9ukVwI5m3WITw+ygwS6YM8MqB73z/6xRgvNLmsqp5/AcVrT2r6ontCqQVHAD2bmC0
	P7J1C/jWM+W3vA3f/+JPtD6UQAP2g/kFAzRzrK6awIkeVPmYJLbUF3D2EoZXy9MTQgKibW8xjwA+c
	QyzUoKVy6kld/H7dutiN+lQm1aqpHv1myZawv11YvtwzH+uEM1SY1Sy1LlLPWmLWvSCOEsezrO8nG
	odzJFkhJbBB5RbtFkaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxiZ-00000005llf-2roy;
	Thu, 06 Feb 2025 08:58:39 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfxiW-00000005ll8-3hTY
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 08:58:38 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id B4B5D1F381;
	Thu,  6 Feb 2025 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738832313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8o8RvKmfC5bSrwy01wT5aWPFCBt3LDXie/ZQ3XWxPnI=;
	b=2MiUDuvmE1kUXKZ6ftY4J6vLV1VzlPZ48GmXEsSXyNHsnQlZ/k1SkRdrvJ/duUB7OUnQxo
	8yONjLnDteDiqxsKhOvty+FM1xWi0hNZGsl4v+0H+Veb3KNo5W51YSIUJ59O+wJ34dJd3C
	eTQs0nrqQ2bHzqQ/wjRSpTBSD8pZBQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738832313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8o8RvKmfC5bSrwy01wT5aWPFCBt3LDXie/ZQ3XWxPnI=;
	b=VcnWeTmmGlG+8LdZeZQLm050NZl8GNZDC74mgQ48YKPEkuAUMURb6uqi1RL1bezqSkO6uK
	nzOiW5t/roxxS6BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738832313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8o8RvKmfC5bSrwy01wT5aWPFCBt3LDXie/ZQ3XWxPnI=;
	b=2MiUDuvmE1kUXKZ6ftY4J6vLV1VzlPZ48GmXEsSXyNHsnQlZ/k1SkRdrvJ/duUB7OUnQxo
	8yONjLnDteDiqxsKhOvty+FM1xWi0hNZGsl4v+0H+Veb3KNo5W51YSIUJ59O+wJ34dJd3C
	eTQs0nrqQ2bHzqQ/wjRSpTBSD8pZBQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738832313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8o8RvKmfC5bSrwy01wT5aWPFCBt3LDXie/ZQ3XWxPnI=;
	b=VcnWeTmmGlG+8LdZeZQLm050NZl8GNZDC74mgQ48YKPEkuAUMURb6uqi1RL1bezqSkO6uK
	nzOiW5t/roxxS6BQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id A4EE94AADB9; Thu,  6 Feb 2025 09:58:33 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,  alex@ghiti.fr,  Charlie Jenkins
 <charlie@rivosinc.com>,  Mr.Bossman075@gmail.com,  Jesse Taube
 <jesse@rivosinc.com>
Subject: Re: [PATCH v2 1/2] RISC-V: hwprobe: Use BIT macro to avoid warnings
In-Reply-To: <20250205204129.10639-2-palmer@rivosinc.com> (Palmer Dabbelt's
	message of "Wed, 5 Feb 2025 12:40:26 -0800")
References: <20250205204129.10639-1-palmer@rivosinc.com>
	<20250205204129.10639-2-palmer@rivosinc.com>
Date: Thu, 06 Feb 2025 09:58:33 +0100
Message-ID: <mvmo6zf1mbq.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.70 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,ghiti.fr,rivosinc.com,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_005837_062511_44A06DEF 
X-CRM114-Status: UNSURE (   7.37  )
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

On Feb 05 2025, Palmer Dabbelt wrote:

> From: Jesse Taube <jesse@rivosinc.com>
>
> In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit field
> which causes checkpatch to warn. Use BIT(N) and BIT_ULL(N) to avoid
> these warnings.

_BITUL(N) and _BITULL(N)

> @@ -98,6 +99,6 @@ struct riscv_hwprobe {
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> -#define RISCV_HWPROBE_WHICH_CPUS	(1 << 0)
> +#define RISCV_HWPROBE_WHICH_CPUS	BIT(0)

s/BIT/_BITUL/

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
