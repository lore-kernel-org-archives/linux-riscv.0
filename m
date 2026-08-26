Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A757C5DF97
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 05:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhjJDblroxJbxS3N5hWaX6o+rOOJcBhwsml2PLHUY80=; b=v0i/Zb60cqSAPA
	lnLM1YYkUmDWzwP1UL8GkBgyiOMrT/LzMeROvwt7tFUftatYSL2xwO+SL66GaqhewKMWX767y473M
	Qhq7lW0zCLb/lxu//Eh0gZPOVqtkySlkBBT4LtMr4mJnnt9fwCyPzaJgVMuw6FNU8LugivxY1sPqa
	wMPtpu9n3WhMvdFBFlRbMCnkdYUPErsM6YQuJjLoPpPHFCo63Bl+oi+eK1vShEpxtVzPiquTzd4CT
	6DgVpXam7miEjtDhczPei3N9+9WXKf40l8WVrsvvWM/0kJabDhTyEteiudx2bOZVWzU/AXLM7ZlOn
	AQc2EnxZUAYRS26fFqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz6Zb-00000001wW7-0B7m;
	Wed, 26 Aug 2026 05:53:19 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz6ZY-00000001wVh-3X2V
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 05:53:18 +0000
Received: from hawking.suse.de (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3A4EA87271;
	Wed, 26 Aug 2026 05:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787723589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNvNUCXhyehNUs7EdlvTJWHNSuaexrptLaVqfNEkOzI=;
	b=mooYyg5/xCHIih4IrEqNuKqlHzZP3e7c0dECQKaoPD2fxgnHffD59CLWYVRKzFNcO9jXG5
	WLfiqXLaG+G3Wb3iRyoPASELtox9HdZUwHftFTaY3n/i6kg0OL0FeoUnHJnNnFyKY4nJc2
	OCPqi0nWHEfacySa5seanUF0lidiEy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787723589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNvNUCXhyehNUs7EdlvTJWHNSuaexrptLaVqfNEkOzI=;
	b=XvRpuv9BRAiKY2RxKBTFbJ1zC8dvFKbyr0AhDbf28VoTYrxcma4BB4arezmyt2m7PSlacK
	Jn2ZtIZnnFjGrdBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787723585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNvNUCXhyehNUs7EdlvTJWHNSuaexrptLaVqfNEkOzI=;
	b=QbkveSXRip7y6KaFBISbofwH5/sbEZRAeRIoSD0yv5pksmCroJ+oLCYnza3exkwzkZWOC3
	U6k/1XKhKz4pWuaJXdEXa7CDrb4fw13b9VbNoeQcDRF9AY/d7zP5geE/hB3WqWdCdYuHv9
	zvFREaqtHLkCAq1AZTp6CNgzIM9lgbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787723585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tNvNUCXhyehNUs7EdlvTJWHNSuaexrptLaVqfNEkOzI=;
	b=HmGDbRxbM6LqVhOIedb2i5GLhAO4aG3nnXq+TCxInZqre4H1TbQ63jYUXUyFgJUTMHXotV
	8lOQ2tIkEDMRCKAA==
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 2BC374AAD89; Wed, 26 Aug 2026 07:53:05 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: pjw@kernel.org,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  alex@ghiti.fr,  andrew.jones@oss.qualcomm.com,
  conor.dooley@microchip.com,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: hwprobe: fix has_fpu() to require D extension
 only
In-Reply-To: <20260825191950.42614-1-skunkolee@gmail.com>
References: <20260825191950.42614-1-skunkolee@gmail.com>
Date: Wed, 26 Aug 2026 07:53:05 +0200
Message-ID: <mvmfr01l96m.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.19 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.935];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_225317_054942_E2E42BE3 
X-CRM114-Status: UNSURE (   4.03  )
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

On Aug 25 2026, Ivy Lopez wrote:

> The kernel never supports F without D, since D depends on F. As such,
                            D without F

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
