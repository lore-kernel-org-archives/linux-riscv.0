Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434EE606A32F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bAWJldOo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l0FofxsE;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=uC+Qn4yw;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r8H5tXPE;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=XhxLpZB3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4dp9jmeCoInoEAXXCSk5nfAWunUC18UQITyKvwCssc4=; b=bAWJldOo+Rzdoviixv1QhsQuup
	ePPdGDLpL7R0P9em5Llt80w5XA9aENp5uksQrlIIaFxB0g5SvlxXMkDpR47UwnrN2yaVdlwu3b4HJ
	l1v6grwdvQNI4meE7Q9fmA+4ICXsL5TVlPIHD5JhKRqrPNhTB3CRoTRR5tZvM9vXDpKJcqyKHnI5Q
	q1cMCLwIHso37QD2VFIWneo/BTca+3A44LkvSYIK/CURBWQEu/hRJR5f/POriazLloN1O8a656qPL
	/zRvQ2OAJMbB13NBmYUX67l4O/m2f1KEtviE45jvcgWulssd1f8O3vET6MrfkxsX7WLRuS1EYnvts
	wirmtmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiZy-00000000cpF-196S;
	Sun, 15 Nov 2026 22:20:06 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiZv-00000000cos-3VAi
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 22:20:05 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2320F1F453;
	Sun, 15 Nov 2026 22:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794781200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3rAtedktrSwXVekAFGPioCnjnnEo6sIvs0uSQj8koE=;
	b=l0FofxsEj7ZfE5jdC8pSPGeEiJJBaKymA4HRl9c+CNaG70rfjcdrQH1+vKsjEukB6864z8
	kCVVWURXjil96kZmgY4K4F6IhtBZELjq7qZ4NneOaNz/q1RDRhljcIy8XjPyecEnHduvYX
	GtRqwwAvJpzaikJtjZNlcIC5jwdfsnw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794781200;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3rAtedktrSwXVekAFGPioCnjnnEo6sIvs0uSQj8koE=;
	b=uC+Qn4ywawI31ggkR3nxBg4KdFBGSO6u95J0oXgJ42zKn2UElFjFNmgN41BHBkGdy7OZ7Z
	rFtdTHKyzEB4ThAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r8H5tXPE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XhxLpZB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794781199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3rAtedktrSwXVekAFGPioCnjnnEo6sIvs0uSQj8koE=;
	b=r8H5tXPEcYAOEhBl0gVbqRFO0u40h4FsQlxVnPfSqDvfh5vBc3KiQmfTQrCUgm8yOdiMxr
	+RJUA+zY3qVDXarEuqD9hlGqn5v2EpZWlePta87ucCAzGVVTmABftMyln1tlanwZXcw48b
	SYeey9qwqhzcjUds7EVfs/4QLgXplcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794781199;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3rAtedktrSwXVekAFGPioCnjnnEo6sIvs0uSQj8koE=;
	b=XhxLpZB3Izj3+Sqc1fD3IYSg8BD0r3TCwNIGyJxkHeFD6TeRbep+ifEc1VkZSK6j/fzFlq
	nxF+ZPZgnRZ35VCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E34F5134F4;
	Sun, 15 Nov 2026 22:19:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 83EDLA0w+mrmBAAAD6G6ig
	(envelope-from <clopez@suse.de>); Sun, 15 Nov 2026 22:19:57 +0000
Message-ID: <749a4a86-5b7e-47ff-a6d8-d885354dc68e@suse.de>
Date: Sun, 15 Nov 2026 23:19:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] KVM: don't zap secondary MMU on permission upgrade
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 seanjc@google.com, pbonzini@redhat.com, akpm@linux-foundation.org,
 david@kernel.org, peterx@redhat.com, imbrenda@linux.ibm.com,
 borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
References: <20261112142039.907090-2-clopez@suse.de>
 <avd4MOhiTCw0I_e1@gremlin>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <avd4MOhiTCw0I_e1@gremlin>
X-Rspamd-Queue-Id: 2320F1F453
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -13.50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_142004_046872_BE33E936 
X-CRM114-Status: GOOD (  13.47  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 9:59 PM, Lorenzo Stoakes (ARM) wrote:
> Sorry but as I said to David I really question what you're doing with this
> series on the mm side, and I wonder whether we should even consider it for
> this cycle, frankly, given [0].

I was not aware, sorry. Considering this, I am happy to wait until
7.5-rc1 to send the next version.

> And, myself being the fool who is engaged in the Sisyphean task of
> converting VMA flags everywhere, you can imagine my delight when I saw that
> you (seemingly quite knowingly!) chose to abuse that API, writing code that
> I'll personally have to rewrite later.
> 
> Don't do that please :)

I was also not aware of the ongoing effort, I'll use the new API.

> Please also do not keep respinning based on sashiko feedback. FIRST get a
> clear understanding of what maintainers want.
> 
> Sashiko is a bug finder, not a reviewer.
> 
> And see [1]:
> 
> "Wait for a minimum of one week before resubmitting or pinging reviewers -
> possibly longer during busy times like merge windows."
> 
> Please only respin once a week at the minimum.

Understood. For what it's worth, each version went out about a week
after the previous one, but fair enough, I should have waited for David
and you to agree on direction.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
