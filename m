Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19445C02190
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0PhZRhhWSfRH8YiZ3UHtO2jXMe20tVhjtTZFQPNitQ=; b=b4wEEkmmPSZcXa
	f0ENw76mrv8pnxfTOQMZfWLjkVtElHa2l7kkowhIHAK2Cx7NpDN0RxY4cQRX8arVVR6d+Y3QwCEhG
	ABX0P1NpVFMnL9iBWPGIRWHdqfGDFbz/FTq22U4+uugFVr/zqG6CQ7kfdYsYR4KRPvkE9+x7QkKJi
	DXv/iZPFV0jEiwhYp02BrS7JsdVhhSZicieHe4uGogUDF0GD91rvFXgmAET1/4RjevbYKeg9DEkB2
	xJeCSmOFyJr0O9D0chlsv704VpRlFKbgNWv6FCV7jvGK1ZxpcDrr40R5wdI1IpR2P+JJYehD6+RBs
	NY4WWU8N7SGwckAGAIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQri-00000008Vq5-2XO3;
	Thu, 30 Jan 2025 09:29:38 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQrf-00000008VpX-4258
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 09:29:37 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 4DD6920D93;
	Thu, 30 Jan 2025 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738229374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dA9EIQPA3LlcVtB+tMezspGE+fONF9lDmcS9FOPkdmo=;
	b=UkxQk9bacpOhOwz8sAB4aQyluRJpDgdZP+NRzPJcAotWbzoQaZXSJS+ls9RZlLDF0BD2TS
	kbGPzgl8UBTCFieY0d+mFbKXkRZ0whGJNU/jDM7j9iO1B/H5qGUV3bBQe+Nsv3bmUvkEoe
	+hXDbRmuyv7HcPwgkp+KY3179mjv990=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738229374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dA9EIQPA3LlcVtB+tMezspGE+fONF9lDmcS9FOPkdmo=;
	b=8YQr3t8sgBwk3x3rLY+1xQabuwyXCwp4z43GG0+ZkcjvJ8p6zXIZ7WjAVB3S/UDGwRze5c
	vLPAjPZx4WelWgCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738229374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dA9EIQPA3LlcVtB+tMezspGE+fONF9lDmcS9FOPkdmo=;
	b=UkxQk9bacpOhOwz8sAB4aQyluRJpDgdZP+NRzPJcAotWbzoQaZXSJS+ls9RZlLDF0BD2TS
	kbGPzgl8UBTCFieY0d+mFbKXkRZ0whGJNU/jDM7j9iO1B/H5qGUV3bBQe+Nsv3bmUvkEoe
	+hXDbRmuyv7HcPwgkp+KY3179mjv990=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738229374;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dA9EIQPA3LlcVtB+tMezspGE+fONF9lDmcS9FOPkdmo=;
	b=8YQr3t8sgBwk3x3rLY+1xQabuwyXCwp4z43GG0+ZkcjvJ8p6zXIZ7WjAVB3S/UDGwRze5c
	vLPAjPZx4WelWgCA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 3E72C4A056A; Thu, 30 Jan 2025 10:29:34 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Jeff Layton <jlayton@kernel.org>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-fsdevel@vger.kernel.org
Subject: Re: Multigrain timestamps do not work on RISC-V
In-Reply-To: <fe719cdf52e9fc48955f116ea2e23ea8136e4d87.camel@kernel.org> (Jeff
	Layton's message of "Wed, 29 Jan 2025 18:28:36 -0500")
References: <mvmv7ty3pd8.fsf@suse.de> <mvmikpx4jw4.fsf@suse.de>
	<f704b0c40c393d1c326f13d043505960924f879a.camel@kernel.org>
	<fe719cdf52e9fc48955f116ea2e23ea8136e4d87.camel@kernel.org>
Date: Thu, 30 Jan 2025 10:29:34 +0100
Message-ID: <mvma5b84pkx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_012936_145880_924CB281 
X-CRM114-Status: UNSURE (   7.27  )
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

On Jan 29 2025, Jeff Layton wrote:

> Obviously, fixing the macro seems like the better solution, but if
> fixing this efficiently is a problem, then moving I_CTIME_QUERIED to
> bit 30 is also an option.

There is no need to change it, the fix for arch_cmpxchg is pretty
straight forward, see
<https://lore.kernel.org/all/mvmed0k4prh.fsf@suse.de/>.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
