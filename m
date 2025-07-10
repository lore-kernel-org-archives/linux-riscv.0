Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C30C83F20
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 11:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klxt+Xn/XgOJ+xqqVOfWvGTcqt2QPErX5SE45wAflFU=; b=Zkweq+3byfoMpp
	PydewRAjclt2PYlLCyDcgjUwJgi7JAlKYkUugSLliFSbtzDjq73pwMvMTKsyYp3/wqS9V1p3PHBqd
	03Joxkiv+94buj+2itbX1Q5h4FGKMig0eb6LvrkHteKtcvloc8WI3A8rin/DKHD8EzvdxHLnJns94
	Y790da4EdL+2FPiJzWcVQl42kJqiidOZLEQkNTkTRmk3iuAci+7K5XXjGOjlvPgqIWiL/JW/eJo5K
	uPIO3I6k3EOORvD/WQJUqlZBnE2MimBpbtMZGOkdtHe4YnrCoiMBSn8NPMPJpshZOe2ZNlBZlx93S
	CBfvj9AoL/6cmqpBmtWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZppL-0000000BgEg-3HTk;
	Thu, 10 Jul 2025 11:52:35 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoYQ-0000000BUih-2Vpq
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 10:31:04 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 270102115F;
	Thu, 10 Jul 2025 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752143459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBoEEQ0y8ugJybCL6zZltsWznkqPvTb54W9gdu4GoWQ=;
	b=V938quBVkIdhqOXC8S+jPExJl7D70lalW204dNN7iINejPBHM8mdqf1N0fqUqJ1oQCGvgO
	1a6FCOFo1l+MbWSbrlTz/k69v36FSDKAYg9MlZvX4cTepNgQ3UW+FIQ2744afVHeiJkdmm
	s0O9z/jJM4EXxzpMkVZLzJmPcDRikE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752143459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBoEEQ0y8ugJybCL6zZltsWznkqPvTb54W9gdu4GoWQ=;
	b=uQZnzEkhLpt7x3c8GzcJ4Fb+6IIN8sJLWiZ+X0hm3TxVWj2nWgqexV/MnelYtlDdsmJkCM
	yDxId7n63MMlXKDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752143459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBoEEQ0y8ugJybCL6zZltsWznkqPvTb54W9gdu4GoWQ=;
	b=V938quBVkIdhqOXC8S+jPExJl7D70lalW204dNN7iINejPBHM8mdqf1N0fqUqJ1oQCGvgO
	1a6FCOFo1l+MbWSbrlTz/k69v36FSDKAYg9MlZvX4cTepNgQ3UW+FIQ2744afVHeiJkdmm
	s0O9z/jJM4EXxzpMkVZLzJmPcDRikE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752143459;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBoEEQ0y8ugJybCL6zZltsWznkqPvTb54W9gdu4GoWQ=;
	b=uQZnzEkhLpt7x3c8GzcJ4Fb+6IIN8sJLWiZ+X0hm3TxVWj2nWgqexV/MnelYtlDdsmJkCM
	yDxId7n63MMlXKDg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id BACB74A05C6; Thu, 10 Jul 2025 12:21:37 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Subject: Re: openSBI 1.7 causes v6.16-rc boot to hang on VisionFive 2
In-Reply-To: <4e6cab2e-c18e-4bc3-8a9f-450326324d98@ghiti.fr> (Alexandre
	Ghiti's message of "Wed, 9 Jul 2025 08:46:24 +0200")
References: <mvm1pqrkmoe.fsf@suse.de>
	<4e6cab2e-c18e-4bc3-8a9f-450326324d98@ghiti.fr>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Thu, 10 Jul 2025 12:21:37 +0200
Message-ID: <mvmtt3kgxce.fsf@suse.de>
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.982];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,hawking.nue2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_033102_781879_2674DCD3 
X-CRM114-Status: UNSURE (   4.24  )
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

On Jul 09 2025, Alexandre Ghiti wrote:

> Do you have a means to know what happens here (pc, sepc, stval etc)?

Unfortunately, sysrq does not work at this point.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
