Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3727C5DF7D
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qCX2YzrJxeHcjkoYAzY6NdTAvQBSMOllv9aD7JBLP8c=; b=Gal7Z76u+WjBYQ
	gDjLd68X7Ohk5OgCAsyQy3JEqtJRshe/pVwB7/tuKW971b85GlAx3ukvOWGHs77uSENUY4/toNA3g
	DOv+uQxx12rTLqI9C6kPFsBOltgRHIUfXX/TYPmtUt3l7bjnXysOK0/8Fx2tijbTz1+4OtppM7gGL
	LznssSIlBBiPkn0CWCriYaMadnOpwwJJqMgsAKYcXdftoaPvQM9lPxJLV+Plx/b0NDfv3TBuN6U4R
	v82k5I6fKFli2qvkvP5/3LdRAp2C5MQE2gWI4JFhvakLUwMF/s0eBQNnpux3NaleAYgQ5hyonvGLg
	V710hKgk+zU14QN45yjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGwW-00000007i26-2e4R;
	Tue, 18 Aug 2026 10:21:16 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwGwU-00000007i1Q-2XMI
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 10:21:15 +0000
Received: from hawking.suse.de (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id A06B13E4A;
	Tue, 18 Aug 2026 10:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787048401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8cuwAvcOfjBzbS80UdhNgvQSbbnsMgt2nAr4JljR4P4=;
	b=SIyr5+h02Y27+KMMdpnlxVlXQgUuU/Sp6pzT1F0FksmZMkhFSzEygtxeFCvV8LoVM/i4ER
	nLHs8Yd2JgMgRNlpaY/m6xxqIK4ttasWsWJRHwMhSNroRZDtorNp7232l2jwas70jlC0BB
	Pl8PYKXl7y520UXksyjbmIXDFlbPFf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787048401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8cuwAvcOfjBzbS80UdhNgvQSbbnsMgt2nAr4JljR4P4=;
	b=xXYsIkgVmU/bI+XWKWnXYFjabKrn0QZHYC/Y+DzIz5GDbObDgomLlxiVuNzRrlSxj8vYD7
	0X0uwNlsVnTzW0CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787048397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8cuwAvcOfjBzbS80UdhNgvQSbbnsMgt2nAr4JljR4P4=;
	b=UGwDcVOsCminV+JuwZvWnI3roLjtUXyRTloRFLNSWu6RrMn/HSUSCvDKz8SYaX+SkLPlGV
	q/SS7OM70Elvpu8H06/DZ9vHrzTETlVHFJGF3EBL8sh33Lkr7ZLiW6AsY3JYlkXsYpsaxr
	gtISP+SqZ941ub6SeabDhnB5D61NVs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787048397;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8cuwAvcOfjBzbS80UdhNgvQSbbnsMgt2nAr4JljR4P4=;
	b=EYZCWdeVrKsGzXHYmWtVVhHokAYES+SibE2WUFbubHF1racjmwUFHw/dOodWCIcXtwYit5
	6SDEEVF7PTfn/SBw==
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 920F84AAD59; Tue, 18 Aug 2026 12:19:57 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: conor.dooley@microchip.com,  alex@ghiti.fr,
  andrew.jones@oss.qualcomm.com,  aou@eecs.berkeley.edu,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  palmer@dabbelt.com,  pjw@kernel.org
Subject: Re: [PATCH] riscv: hwprobe: require both F and D extensions for
 RISCV_HWPROBE_IMA_FD
In-Reply-To: <20260817211507.28685-1-skunkolee@gmail.com> (Ivy Lopez's message
	of "Mon, 17 Aug 2026 15:15:07 -0600")
References: <20260817-unmade-dyslexic-4bb4acf535af@wendy>
	<20260817211507.28685-1-skunkolee@gmail.com>
Date: Tue, 18 Aug 2026 12:19:57 +0200
Message-ID: <mvmh5krvigi.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.20 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
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
X-CRM114-CacheID: sfid-20260818_032114_791015_EAFC4D73 
X-CRM114-Status: UNSURE (   4.35  )
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

On Aug 17 2026, Ivy Lopez wrote:

> Would you prefer a v2 that fixes has_fpu() instead (checking D only,
> or F && D, whichever matches the intended semantics elsewhere), or

The D extension depends on F.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
