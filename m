Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1E6E6F078
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6nAohenm10w0F4You7DxtJ3Scmrpv9DWYweG9K0OW0=; b=LhKBvNRRivjazs
	ZB8xcT9i6u3iUQsU2dlulc0Gx9UgY5/G3JaZ9IxDAGbqZXNEgnsbZevqUJymBJnW/mSgSrq+s08QR
	UFcXj7BFanJvDvLN5A9fQ+s3wlkjJxCvXVf+p0G1xZgWt3Me4gpYN6c9rJdObDr6TKoFpbFqXW+Kl
	Wj8u0W28eZEDWXJ6ZofDRU+FwQ+caJGVK0M4cqRaBQWHTqRfjxQ4b67zoYHT+usBaNsyMSGOcWndb
	ZUjZqxV70/lT9APTLR/qkBMoi4K/ustVjihgQ/C/2x78u0sd4jOS3fgUIhdotZc7ZfujN0zAo+x+n
	Y1xHloto6H6c4t1KyFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXysq-0000000EmZc-35ms;
	Tue, 23 Dec 2025 09:40:48 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXysn-0000000EmYe-3LY9
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 09:40:47 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 591D4336CA;
	Tue, 23 Dec 2025 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766482841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZdRSSvs2aVpnn7IZDI7qNSbU0W6jegWiD2v75muEUA=;
	b=XynscgSMzalVPHbN9I9u+cZUDPbDgeVrvET9iQxtnhxyaJQ2pMGDFNQ4yJ8Z3iy+Qjh8py
	q6Tvi1Z9J88U/1+cY5N0CrB7pmCxBTay7rygrhXO/8iVCZnZVigKspRlmYdYvh7ppI/twD
	SSZi34upUHrMYFY8cSACEW7icbBd0nM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766482841;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZdRSSvs2aVpnn7IZDI7qNSbU0W6jegWiD2v75muEUA=;
	b=bJR/eS6PwIKCSEA6Ec+78+ACEc/61r5DkLxS+E4PG3cuvX/hnl1gzuLYQpEpxmXznE5jn2
	IFDrmu0ut53pgtCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bmpsjkMf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fqeZ6EET
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766482840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZdRSSvs2aVpnn7IZDI7qNSbU0W6jegWiD2v75muEUA=;
	b=bmpsjkMfzZa+aJthWTEaBV0QlKNqoKdIva7oCTmUAeF4TBqhJ/fc2pJwprfBcuqUtGZqHf
	yyOy6pLCzbrNwOx5AFslXLtfGaXRqhbMIEp84BHgwV6i5QuZhvI+0BnWnmvVIp8vObwnB6
	yVMVoe//dYJS/5wAy9M/+FkE14SKteg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766482840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZdRSSvs2aVpnn7IZDI7qNSbU0W6jegWiD2v75muEUA=;
	b=fqeZ6EET1iPcOFDW+Tv/sHohy3LIxiz3vQMOuWefonoSzdQQrF31I6f1MwCjOz3nrV0Z80
	y60ZypezGTQdT3Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 663DB3EA63;
	Tue, 23 Dec 2025 09:40:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uTrzFZdjSmnzOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Dec 2025 09:40:39 +0000
Date: Tue, 23 Dec 2025 10:40:30 +0100
Message-ID: <87sed1ilip.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-sound@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: intel: Introduce msi64 parameter to override 64-bit MSI restriction
In-Reply-To: <20251220170501.3972438-1-gaohan@iscas.ac.cn>
References: <20251220170501.3972438-1-gaohan@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linux.intel.com,gmail.com,linux.dev,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,iscas.ac.cn:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 591D4336CA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_014045_984571_C193D616 
X-CRM114-Status: UNSURE (   9.16  )
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

On Sat, 20 Dec 2025 18:05:01 +0100,
Han Gao wrote:
> 
> Sophgo SG2042 MSI driver does not support 32-bit MSI.
> Introduce an 'msi64' kernel parameter to bypass NO_MSI64 for ATI/HDMI.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

As Arnd already suggested, there is no reason to add a new module
option just for this case.

If any, we can add a device-specific quirk entry, but it should be
investigated more deeply at first.


thanks,

Takashi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
