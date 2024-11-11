Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9453FD2E9D4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6T4RnIHkbvOEO3/3JAB7zF8umlc4OY9KT2hKCgShXc=; b=mk9BmaqaGDX4jL
	HrilKFuGK2yJbXMukoLA4lF+oxKisjyJYl5HzEBOT0fkPxm63auUPnbs592dLj1r0hyyhrkbO5sJ4
	T6W0sw/7X9y5BGoHia2QLKQK/L+3RV8VDx5ap7WeDnC3hEexQtZObd/dwkmW50gnX/Z7H0pQqByTy
	VZ6t8AtFia4Fq0yAF9udv6a7OG23n6z+WObND1SYPYkC3WYpDchTofta/uh9RlxFnvdwZwAIEC2G9
	mPJKTHjVZgXRvFxz1AxbCtDUcU8qDm08sxnnaKR7ofitpZYhpP0hLoR2S8EAGm319nhvru/0UhOmI
	/WY0yHGHfOW0zUuylvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARht-0000000HHon-2r4i;
	Mon, 11 Nov 2024 10:31:41 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARhV-0000000HHgO-1FkZ
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 10:31:20 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 719041F38E;
	Mon, 11 Nov 2024 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731321075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nfi7a58jU32D1+tZqSR1uyYTpo3a6Ot5dHSnFw3swqs=;
	b=Dz+4af/diseO0gevlrqmnutwAcUhTfiCz/BxXQTeID18P/+AQsxcWb6ua6GcOYs7q1RUfB
	wFWaQYHW0RUX1YFc1VzVn+VXEcxT7pxgVx9Lo/z1IyLAt7W85drf6n3Ek2AcNevgF96UQA
	rDdZU+sFCMJYjlM2FcLrkAo2PD2DaEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731321075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nfi7a58jU32D1+tZqSR1uyYTpo3a6Ot5dHSnFw3swqs=;
	b=louDERMs0Kojt+RlAyOIpBV8mOMMXHEHQ/WCoMRRvgqNmYPcWCY0ONQte7njrst+NNSQKx
	oMuWqtH3JNfR4+DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731321075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nfi7a58jU32D1+tZqSR1uyYTpo3a6Ot5dHSnFw3swqs=;
	b=Dz+4af/diseO0gevlrqmnutwAcUhTfiCz/BxXQTeID18P/+AQsxcWb6ua6GcOYs7q1RUfB
	wFWaQYHW0RUX1YFc1VzVn+VXEcxT7pxgVx9Lo/z1IyLAt7W85drf6n3Ek2AcNevgF96UQA
	rDdZU+sFCMJYjlM2FcLrkAo2PD2DaEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731321075;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nfi7a58jU32D1+tZqSR1uyYTpo3a6Ot5dHSnFw3swqs=;
	b=louDERMs0Kojt+RlAyOIpBV8mOMMXHEHQ/WCoMRRvgqNmYPcWCY0ONQte7njrst+NNSQKx
	oMuWqtH3JNfR4+DQ==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 6295F4A0564; Mon, 11 Nov 2024 11:31:15 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
  Charlie Jenkins <charlie@rivosinc.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  Andrea Parri <parri.andrea@gmail.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: add forwarding header for
 arch/riscv/include/asm/fence.h
In-Reply-To: <26452229-7461-48aa-987a-28444ace4f28@ghiti.fr> (Alexandre
	Ghiti's message of "Mon, 11 Nov 2024 11:28:37 +0100")
References: <mvm5xq44bqh.fsf@suse.de>
	<d380fd10-ebc4-4d66-becb-13995372d41a@ghiti.fr>
	<mvmfrnyxg2n.fsf@suse.de>
	<26452229-7461-48aa-987a-28444ace4f28@ghiti.fr>
X-Yow: I want a VEGETARIAN BURRITO to go..  with EXTRA MSG!!
Date: Mon, 11 Nov 2024 11:31:15 +0100
Message-ID: <mvmbjymxdsc.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.70 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,rivosinc.com,sifive.com,dabbelt.com,eecs.berkeley.edu,gmail.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_023117_557778_D25AE9D7 
X-CRM114-Status: UNSURE (   4.66  )
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

On Nov 11 2024, Alexandre Ghiti wrote:

> Indeed, Bjorn's patches did not make it into rc7...

That needs to be fixed ASAP!

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
