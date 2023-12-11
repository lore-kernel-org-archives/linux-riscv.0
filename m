Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6817AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 14:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCIBBL6PfejsGeFSKDy4wS5cA054mxCjwbqIGHKOqBQ=; b=q88/rsP1mcH5zb
	/ISXbXyUoegkMI5QfHgtoSWF4HcXUrGOrOyc0UMFRX4Z3Azsct7ew9QhF+N2fuzLP+HG0wO65Le/r
	dlhuwM7AvRN+jiiL9Eb+ClN7DXpHO5oIWHA2gqrVshSOcyXObOG6ANZC3eEkHNlW+2GPTagFQFhib
	mfgalAIhQ06SuiqBMv8nNoen0LmChIkGmZKLP8XzrWTBhRof3GGNDwazEDcKtFTgYP0KbPJnPYwyp
	M2g8HgyXuy5Uk6c0j6adz6/j7C0O7/eryI1OR/Ys8BWNCepKIGr7IbpxBJ/W+qN+FiIlnGSMwNUtw
	ELSa1JR/GYeUvZrcAN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgz9-0057D7-0p;
	Mon, 11 Dec 2023 14:10:15 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgz1-005780-22
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 14:10:11 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id EAE5F1FB98;
	Mon, 11 Dec 2023 14:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702303803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IKxVyX+SKPCIYF4IJBe8/I2MyUGreeFRL0iWzGK5Q4w=;
	b=iKo7/NtwiCsZCOfWLOJpz9mx4wKtKPFqRJjZkJ81RIcrB/n6hw2eM3fHOiUTgzmEGwSVti
	5dA7MlJa2DBWySFuFTz/zo7MQH7ScbtW5L8vshDNjx8F/lcmAG2h7bONiklr1Ov2d1ODZK
	qP46GWnTJ4Dfd+rCIWNFi4v4maIylfg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702303803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IKxVyX+SKPCIYF4IJBe8/I2MyUGreeFRL0iWzGK5Q4w=;
	b=9FxoBVTdPWBMOqL4QBpYrRECIw94ljwhBkz7MKZlSJclOdQwhNbH5SQxY2lianCA9p3WTT
	j4wr3DY+1sMecoCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702303802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IKxVyX+SKPCIYF4IJBe8/I2MyUGreeFRL0iWzGK5Q4w=;
	b=kczBXqTM1vaAGqbVAA5pR0fxilW68PuB9MyIUuOZFBPu3ORPDu3swUUDxY+tovIYmSYBVH
	x8YIwCc8VHNddMe6k1q4jlhG2RUZi4VVUzeMMrw/9YZsM3pOZG+sudOe38VltPEXoDSUs8
	Iri+gBpJKvOuXvh5yEJx55bF20ulc2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702303802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IKxVyX+SKPCIYF4IJBe8/I2MyUGreeFRL0iWzGK5Q4w=;
	b=2DEYPgfostj5x0QebrIKAQA+QKl9Tr1auGjcjdU6c1ILBaWzXreF/Ba3kPMt3wSJfOGv8n
	73qgFtSGg2OYdACg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id D94014A0379; Mon, 11 Dec 2023 15:10:02 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org,  jiajie.ho@starfivetech.com,
  palmer@rivosinc.com,  conor.dooley@microchip.com,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: Backport riscv kconfig for v6.6
In-Reply-To: <20231211145750.7bc2d378@namcao> (Nam Cao's message of "Mon, 11
	Dec 2023 14:57:50 +0100")
References: <20231211145750.7bc2d378@namcao>
X-Yow: Hello.  I know the divorce rate among unmarried Catholic
 Alaskan females!!
Date: Mon, 11 Dec 2023 15:10:02 +0100
Message-ID: <mvmwmtkq18l.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-1.30 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.982];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-0.01)[45.07%]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_061008_224071_F49C00EF 
X-CRM114-Status: UNSURE (   5.29  )
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

On Dez 11 2023, Nam Cao wrote:

> Without this, it is not possible to configure the kernel with SPI drivers
> for the Visionfive 2 board.

Is it?  There is nothing that stops you from just enabling it.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
