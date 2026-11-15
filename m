Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACA9606A31F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 22:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WxlOOKW8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jgqsZvXA;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kfYSjtFj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jgqsZvXA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kfYSjtFj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FIqqKT/+DZQRj91cqXsNE7fNVOj7fNXRYesM0hX97+E=; b=WxlOOKW80YFVPfDDk5eqAj6vL+
	Xg7VWKzv+iUkULr4Xm72uIjW4huC9l0y6JL2Ae3+2I4BCcRy4YcVzuf0bKEYe80uvWhm1iNfwaUbp
	Pes9mW8shUSLs0foOcuu3O7GlLZ/1GogIyOcEJHpqxYP9G7uZYcTapePgAc3/MZLAt4SmmdK07ROu
	IdF7pz7quND+84pY6vUOF+s4IYLxlhp8qVNJmwmDKNw+ogreEZ6QHb1o4Fa7Z/rUCpL/XyX/K7H1P
	nOVFxYnGSJFyvaDfVN8HUQbu619fRtZ/Pa5thPdIftTkHnQB9+zrq+iK7KmVD/eZNoBh9frA0Ahfm
	mt8+PmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiLL-00000000bQy-3CVN;
	Sun, 15 Nov 2026 22:04:59 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiLJ-00000000bQV-3MFi
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 22:04:59 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B11851F449;
	Sun, 15 Nov 2026 22:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUYxq7sCuPQGxi589AvNCc1rPmpCBz76vLmdvKJICFs=;
	b=jgqsZvXAQv3sa3ZKlAOT1DBrXfR53fZtdjR5VWrSHuB5csGHYm4IdRMdCXDLXwfrHFz7Nk
	x3SavfnF4aLjII/x9VKOdyQ31FSXdXLX6btCjycj4QVAv9EsS9pY3vH6gqBBcLp/uzz5DF
	S0w6w8b8/rsc7kCDFGgOimgz6K1zr8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780295;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUYxq7sCuPQGxi589AvNCc1rPmpCBz76vLmdvKJICFs=;
	b=kfYSjtFjQVHLxnSdfm48vtiiUnf91Rk+0jfqMhKDSMiofz2Mp+y0l41sq3BcrY1v4jgmO9
	nj9NC00Byc9jHIDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jgqsZvXA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=kfYSjtFj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUYxq7sCuPQGxi589AvNCc1rPmpCBz76vLmdvKJICFs=;
	b=jgqsZvXAQv3sa3ZKlAOT1DBrXfR53fZtdjR5VWrSHuB5csGHYm4IdRMdCXDLXwfrHFz7Nk
	x3SavfnF4aLjII/x9VKOdyQ31FSXdXLX6btCjycj4QVAv9EsS9pY3vH6gqBBcLp/uzz5DF
	S0w6w8b8/rsc7kCDFGgOimgz6K1zr8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780295;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUYxq7sCuPQGxi589AvNCc1rPmpCBz76vLmdvKJICFs=;
	b=kfYSjtFjQVHLxnSdfm48vtiiUnf91Rk+0jfqMhKDSMiofz2Mp+y0l41sq3BcrY1v4jgmO9
	nj9NC00Byc9jHIDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A80FF134F4;
	Sun, 15 Nov 2026 22:04:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8Vt2HoYs+mrodAAAD6G6ig
	(envelope-from <clopez@suse.de>); Sun, 15 Nov 2026 22:04:54 +0000
Message-ID: <eabeee00-1ed9-4740-b7b6-6b5be5496766@suse.de>
Date: Sun, 15 Nov 2026 23:04:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] KVM: don't zap secondary MMU on permission upgrade
To: "David Hildenbrand (Arm)" <david@kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, ljs@kernel.org,
 imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
References: <20261112142039.907090-2-clopez@suse.de>
 <2ff19317-8da9-4014-be04-27fc218b8eea@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <2ff19317-8da9-4014-be04-27fc218b8eea@kernel.org>
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: B11851F449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_140458_149419_34E757CD 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

On 11/13/26 8:00 PM, David Hildenbrand (Arm) wrote:
>> Series overview
>> ===============
>>
>> Patches 1-4 fix cases where change_protection() needlessly makes or
>> leaves entries read-only, so that the next write to them faults. They
>> only affect performance and can be picked up independently.
> 
> We generally don't add performance improvements without clear motivation and
> data to back it up.

Right, this is on me for not explaining the dependency better in the
cover letter and the commit messages. Patches 1-4 are required for the
new notifier flag to be correct. I'll explain this better.

> MM is currently busy with more important stuff, so best to keep your changes to
> a bare minimum.

I had not seen your "Firefighting mode" email earlier this week, sorry.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
