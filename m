Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E19C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PpPUlcq5skh4b7uCFDbn7Dg3602DHy8n4P9+GXaetXc=; b=ffnKFHH7iYwTHK
	919cpej1NPTUK+QIW5/HZTzEd4eSyMEx/ywodt1cU+xB5IK4Z2Rj3LHClsxJ6rznIDNU9budWA58q
	5BY7WBOEvSfS1z3ODd8k2co3553kwG5lo5cEEpijIdD/jvGAz8e1cSkIW+Tvc8c4fT5xpXMXqKxfF
	LGPW9pXPuP/EcgcYSjxI/NTomFG3E/UxrVZGLD6MA16ImjAZDKh8A4UZvSoL5lC3m/ar8FpJ5nkmX
	XqgstVd3yhsZtZNzS9+jFQweoZZCmQtriuMoNerReL2f9kYc2mneizTVOPHhhrwcYPRR/suPvXAXv
	OL2ydAzj3uQpcNnVXI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EWE-00000007TNQ-2VHa;
	Tue, 22 Apr 2025 14:22:38 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DLy-00000007Emu-0IT4
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 13:07:59 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2D76F1F38D;
	Tue, 22 Apr 2025 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745327275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=459wLOanZpqg4/wTTubPImQcdIHPEf/5eXqSk/5Gj0o=;
	b=1gbh9z3qlJG2bLbA/KBC+kPz6BbahXH8Alv145/rJ/T7i7y7oVPcxeEYpJrKYENtMwOTse
	hxtF87Nm5V09QI3BI2ydKBFJrmXD+MXjHIvvj0JyLhvQ6nnRsScdFXM9BwBcPtWkMMbaHy
	AkOClcSQ98ATwRmRUB54H+naTwel5ZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745327275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=459wLOanZpqg4/wTTubPImQcdIHPEf/5eXqSk/5Gj0o=;
	b=QJff4qRL8Pv5i2LCKHPnHNR5yeWpBvzxH7fJIyIpuAtlF+0a3NlgXyjqrw5PHKFfHAIKKD
	s0MLFtynM1J0xoAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745327275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=459wLOanZpqg4/wTTubPImQcdIHPEf/5eXqSk/5Gj0o=;
	b=1gbh9z3qlJG2bLbA/KBC+kPz6BbahXH8Alv145/rJ/T7i7y7oVPcxeEYpJrKYENtMwOTse
	hxtF87Nm5V09QI3BI2ydKBFJrmXD+MXjHIvvj0JyLhvQ6nnRsScdFXM9BwBcPtWkMMbaHy
	AkOClcSQ98ATwRmRUB54H+naTwel5ZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745327275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=459wLOanZpqg4/wTTubPImQcdIHPEf/5eXqSk/5Gj0o=;
	b=QJff4qRL8Pv5i2LCKHPnHNR5yeWpBvzxH7fJIyIpuAtlF+0a3NlgXyjqrw5PHKFfHAIKKD
	s0MLFtynM1J0xoAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04B2E137CF;
	Tue, 22 Apr 2025 13:07:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Si7UAKuUB2g/MQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 22 Apr 2025 13:07:55 +0000
Message-ID: <a7cf9864-6810-43d8-a7f6-f71cc1ee081c@suse.cz>
Date: Tue, 22 Apr 2025 15:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ryo Takakura <ryotkkr98@gmail.com>, alex@ghiti.fr, aou@eecs.berkeley.edu,
 bigeasy@linutronix.de, conor.dooley@microchip.com, jirislaby@kernel.org,
 john.ogness@linutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com,
 pmladek@suse.com, samuel.holland@sifive.com, u.kleine-koenig@baylibre.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org, stable@vger.kernel.org
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
 <20250405044338.397237-1-ryotkkr98@gmail.com>
 <2025040553-video-declared-7d54@gregkh>
 <397723b7-9f04-4cb1-b718-2396ea9d1b91@suse.cz>
 <2025042202-compare-entrap-0089@gregkh>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <2025042202-compare-entrap-0089@gregkh>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ghiti.fr,eecs.berkeley.edu,linutronix.de,microchip.com,kernel.org,dabbelt.com,sifive.com,suse.com,baylibre.com,vger.kernel.org,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_060758_260112_A13EB2AD 
X-CRM114-Status: GOOD (  26.98  )
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

On 4/22/25 12:50, Greg KH wrote:
> On Tue, Apr 22, 2025 at 12:20:42PM +0200, Vlastimil Babka wrote:
>> 
>> I admit it's surprising to see such a request as AFAIK it's normally done to
>> mix stable fixes and new features in the same series (especially when the
>> patches depend on each other), and ordering the fixes first and marking only
>> them as stable should be sufficient. We do that all the time in -mm. I
>> thought that stable works with stable marked commits primarily, not series?
> 
> Yes, but when picking which "branch" to apply a series to, what would
> you do if you have some "fix some bugs, then add some new features" in a
> single patch series?  The one to go to -final or the one for the next
> -rc1?

As a maintainer I could split it myself.

> I see a lot of bugfixes delayed until -rc1 because of this issue, and
> it's really not a good idea at all.

In my experience, most of the time these fixes are created because a dev:

- works on the code to implement the feature part
- while working at the code, spots an existing bug
- the bug can be old (Fixes: commit a number of releases ago)
- wants to be helpful so isolates the fix separately as an early patch of
the series and marks stable because the bug can be serious enough in theory
- at the same time there are no known reports of the bug being hit in the wild

In that case I don't see the urgency to fix it ASAP (unless it's e.g.
something obviously dangerously exploitable) so it might not be such a bad
idea just to put everything towards next rc1.

This very thread seems to be a good example of the above. I see the later
version added a
Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
which is a v5.2 commit.

Thanks,
Vlastimil

>> Also since the patches are AFAIU dependent on each other, sending them
>> separately makes the mainline development process more difficult, as
>> evidenced by the later revisions having to add notes in the diffstat area
>> etc. This would go against the goal that stable process does not add extra
>> burden to the mainline process, no?
> 
> If they are dependent on each other, that's the creator's issue, not the
> maintainer's issue, no?  :)
> 
> Submit the bug fixes, get them merged, and then submit the new features.
> 
> thanks,
> 
> greg k-h


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
