Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A13C02195
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 08:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VTZ/wlKePG3WBA9YLEXw3s8Ykeoj/7x4aR4YkXsms8=; b=a5dvVkA0OleFsN
	S9SMHziumZXg8xCVmiTh4WCwEQP+Eb5mNlLd7ELLzNLCH7QbF/CTwBsxNyM0zKqcg9nliP53NcDZL
	tQki6eFTMa8qOcyihMhvwhHgr+JsIuc9Ux34sUZubBmHDm3jvGf2X6nlyurvKUEuTPyGCxfCSVoOi
	4zXRgfVuK85q5B/5oaYPH6rTpr9fdYGc7N7dpuyvt0VP9uvYDwc7XbXTeR5QkLjukBGT8YjI9/jRU
	iXXEdTaYioUX8rj/Dzy/tmOqoNkmmI79OXqVXTEdiDncw2MTd0x9b9Lw68u2+4U+tGZA/wLuq0ImB
	4e1gsYrgn7YeXoEaWSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tes1w-0000000Eskn-1UM7;
	Mon, 03 Feb 2025 08:42:08 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tes1t-0000000Esip-3hiV
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 08:42:07 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id BC7812115C;
	Mon,  3 Feb 2025 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738572122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMhCIlOH9NIe7h5EnD+8+3/+PiMl7AWO2+4/9VnEWp4=;
	b=dMrAk6Kj3CzFRFp8ks+pDXOWRYOzLtTvurvFSjv+oYhLr7GRihr7nAkj2QEtUdQf03hGxf
	oLsp9PiBcLttWy12cRiCFvmwfJjiU8eNV9u3fay48O+3QXKhelO7vFfUW460QsJv2ekoHd
	dCGXp8eck1ptZnUMInRegnhMBi/93Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738572122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMhCIlOH9NIe7h5EnD+8+3/+PiMl7AWO2+4/9VnEWp4=;
	b=5C2qnMQttcfXV8+R0RukR0YGvicOCV9/PY00IjDdNsMe+XRTsMneOsi8FTqE/OT4pW60oU
	uh3/nSNKu/zRPPBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738572122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMhCIlOH9NIe7h5EnD+8+3/+PiMl7AWO2+4/9VnEWp4=;
	b=dMrAk6Kj3CzFRFp8ks+pDXOWRYOzLtTvurvFSjv+oYhLr7GRihr7nAkj2QEtUdQf03hGxf
	oLsp9PiBcLttWy12cRiCFvmwfJjiU8eNV9u3fay48O+3QXKhelO7vFfUW460QsJv2ekoHd
	dCGXp8eck1ptZnUMInRegnhMBi/93Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738572122;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zMhCIlOH9NIe7h5EnD+8+3/+PiMl7AWO2+4/9VnEWp4=;
	b=5C2qnMQttcfXV8+R0RukR0YGvicOCV9/PY00IjDdNsMe+XRTsMneOsi8FTqE/OT4pW60oU
	uh3/nSNKu/zRPPBA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id AC2614A0551; Mon,  3 Feb 2025 09:42:02 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for
 unsigned in arch_cmpxchg
In-Reply-To: <20250130213504.285b4675@pumpkin> (David Laight's message of
	"Thu, 30 Jan 2025 21:35:04 +0000")
References: <mvmed0k4prh.fsf@suse.de> <20250130213504.285b4675@pumpkin>
Date: Mon, 03 Feb 2025 09:42:02 +0100
Message-ID: <mvmseov2zdx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.19 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.964];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_004206_062841_CB9411AE 
X-CRM114-Status: UNSURE (   9.63  )
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

On Jan 30 2025, David Laight wrote:

> On Thu, 30 Jan 2025 10:25:38 +0100
> Andreas Schwab <schwab@suse.de> wrote:
>
>> Sign extend also an unsigned compare value to match what lr.w is doing.
>> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
>> that has the sign bit set, as it happens often in inode_set_ctime_current.
>> 
>> Do this in three conversion steps.  The first conversion to long is needed
>> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
>> pointer type.
>
> Doesn't that break things by discarding the high bits of a pointer value?

If you have 32-bit pointers then the conversions are no-ops.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
