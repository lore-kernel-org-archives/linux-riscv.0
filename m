Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBCDC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5tdZPw82YVIA0I9aB6yR04ckNTesNrBwFqDW/yF+HO4=; b=emFsGEcouTpLlz
	R4lMirZamy673f8ZB/TR7q+lzVvHhAd9d5m/aHS5k7KnXp06rVvXLUIptmUkefI8ZpB3+VZyu3R1r
	RElu7FTx5ZaemkP1WjtDKlnUXWMnmt7NT6TVF0EMQIPoP6Ae+VSln2CFhCCMQbYBaLweTagdi5wY8
	5oI7P63zAm0wFlpEEOJohL6puXGoLDIJQOawFxCTQK2AwmdSoZ4NDQy6iaHEq1fCLpIES6d5NK3Hd
	EESrnc8Vup5YxRde/kc1jqPumBcx6qSSTbIFeLBg4m8XtyRIg+nXsDZAwGZKK/n3RAXVjLVo9xSJn
	QcH69r+gnV/1e07pxauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BPh-00000006s4A-3pHI;
	Tue, 22 Apr 2025 11:03:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AkD-00000006jKo-1Cuj
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Apr 2025 10:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3D2poOov/3bFYZAbueXXC8mWTQq1cPjBbaHqWB5PKcc=; b=StuZLZwOgZPTMESFrBn6kiaeoO
	QhDv5bEXo/gyFPNLN7P487sUVwOm97eQDWTICM0jEN9jmAfaVsJKsdDolZ84Uqj9fFMuYUWxQaRd5
	fZth9X967EKrFb8x0H4mBNrl554bcGquyPESx8ltzZEmM0BAYS8ebncYwh0FDGmleSvxPmu2MgVfL
	s6e0GQYz5vq05roNwVIJujpIZkUjcfastrRoNHgj22sEEGxqmAkRGiWoNYMvuT2Q0BDxKFKGAqRtF
	THdrqNI7gponwI5iKGPF6PBx6eaTAtDjdjKKFHaDDNA+PmNyT+eh3s4dF8UhFOLQo6uiN81/i92+0
	kU+HCCNg==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7AkA-0000000BB2F-0I8Q
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 10:20:48 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDFD9211B4;
	Tue, 22 Apr 2025 10:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745317242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D2poOov/3bFYZAbueXXC8mWTQq1cPjBbaHqWB5PKcc=;
	b=N5AgF1e6ldYFh8sXthel/HoK/0Po6kGmLJrOaJJ+EAGLxiF8vWxU1purTfHnO3ouwDC7gq
	6Mj0iefMkI+oRyEMXvxKu3euVEYFEIXCi5v1GGvaWGRXuiyo7aO9zmyDuhvwm5/dtJjNDc
	Pklr7S8xWhAvChkT7P67xlTTzLw9tv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745317242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D2poOov/3bFYZAbueXXC8mWTQq1cPjBbaHqWB5PKcc=;
	b=91hkOtytm9qKMrfBYv+ryJG1RdH4MbBnBYifI/Q3l8TIL6qbykLxHma6bunJj5EyKYegQ3
	U0+QWc9WOpN0yiDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745317242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D2poOov/3bFYZAbueXXC8mWTQq1cPjBbaHqWB5PKcc=;
	b=N5AgF1e6ldYFh8sXthel/HoK/0Po6kGmLJrOaJJ+EAGLxiF8vWxU1purTfHnO3ouwDC7gq
	6Mj0iefMkI+oRyEMXvxKu3euVEYFEIXCi5v1GGvaWGRXuiyo7aO9zmyDuhvwm5/dtJjNDc
	Pklr7S8xWhAvChkT7P67xlTTzLw9tv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745317242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3D2poOov/3bFYZAbueXXC8mWTQq1cPjBbaHqWB5PKcc=;
	b=91hkOtytm9qKMrfBYv+ryJG1RdH4MbBnBYifI/Q3l8TIL6qbykLxHma6bunJj5EyKYegQ3
	U0+QWc9WOpN0yiDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9715F137CF;
	Tue, 22 Apr 2025 10:20:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g6qTJHptB2i4dQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 22 Apr 2025 10:20:42 +0000
Message-ID: <397723b7-9f04-4cb1-b718-2396ea9d1b91@suse.cz>
Date: Tue, 22 Apr 2025 12:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] serial: sifive: lock port in startup()/shutdown()
 callbacks
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
 conor.dooley@microchip.com, jirislaby@kernel.org, john.ogness@linutronix.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, pmladek@suse.com,
 samuel.holland@sifive.com, u.kleine-koenig@baylibre.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-serial@vger.kernel.org, stable@vger.kernel.org
References: <20250405043833.397020-1-ryotkkr98@gmail.com>
 <20250405044338.397237-1-ryotkkr98@gmail.com>
 <2025040553-video-declared-7d54@gregkh>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <2025040553-video-declared-7d54@gregkh>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_112046_347470_50C7677A 
X-CRM114-Status: GOOD (  14.78  )
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

On 4/5/25 09:35, Greg KH wrote:
> On Sat, Apr 05, 2025 at 01:43:38PM +0900, Ryo Takakura wrote:
>> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
>> The register is also accessed from write() callback.
>> 
>> If console were printing and startup()/shutdown() callback
>> gets called, its access to the register could be overwritten.
>> 
>> Add port->lock to startup()/shutdown() callbacks to make sure
>> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
>> write() callback.
>> 
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>> Cc: stable@vger.kernel.org
> 
> What commit id does this fix?

> Why does patch 1/2 need to go to stable, but patch 2/2 does not?  Please
> do not mix changes like this in the same series, otherwise we have to
> split them up manually when we apply them to the different branches,
> right?

I admit it's surprising to see such a request as AFAIK it's normally done to
mix stable fixes and new features in the same series (especially when the
patches depend on each other), and ordering the fixes first and marking only
them as stable should be sufficient. We do that all the time in -mm. I
thought that stable works with stable marked commits primarily, not series?

Also since the patches are AFAIU dependent on each other, sending them
separately makes the mainline development process more difficult, as
evidenced by the later revisions having to add notes in the diffstat area
etc. This would go against the goal that stable process does not add extra
burden to the mainline process, no?

Thanks,
Vlastimil

> thanks,
> 
> greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
