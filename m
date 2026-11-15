Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60B2606A31F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 22:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hjbboH9W;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qwaE8OCh;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4+zODNCs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UL2AJR1B;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8xD41Gpx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nOcIwfpaltGyYXjpGt1pvq8nh6E1pm/V5AQc8VVH9mE=; b=hjbboH9W84Gty8lKIvb5EmQbT+
	PTUjacDflxvgcJ3+vpkdoyp6o4BAjy0g1HXrSe01y/U2496IqN1MYW8hVLndskN5W/F/F1rUJDFaq
	0ygjkVM81DFH0I4QNScR6Ax68jh0HjnDs/P6ZCfgF9qSgtsP+KxWmYf/Jijv55D415ohR83BFtS+N
	6NSFe5Q7sKAID/240ZtgacnVmHO+LICDWtboBE0nK4r5JweeRjErJPc3fSoBdaBSVhlx4nYrbaSQM
	SLxZ0C+jTD9IYVjaYEZFs0hKA0wKWjtivUNSnzMfhtqvGKo3oiTskl++e7cCQbu6i9+F8I4x/30ca
	Dx9gHThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiHY-00000000adS-02AF;
	Sun, 15 Nov 2026 22:01:04 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiHS-00000000aYz-0YkJ
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 22:01:02 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 220F51F453;
	Sun, 15 Nov 2026 22:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FlApLM+6NHXeyNHrZs7qFAb7ZQYfBd5O8QQnbg+ljM=;
	b=qwaE8OCh9q7DPjRCRWrDN3gSH+C/rRxOO4tjyMLG9u1935rUbhmfAqEsM8HKtkWWRu9Zwg
	Edk21Rf9o6W4cR/K8rlzm3w3VQgzTPqYi4XjKDo5va8dWtQTK9ZcUoAoaK0qag7ugYH9WW
	lJyY1EnCiHEFQrN5YOkYwKlBRizhvdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FlApLM+6NHXeyNHrZs7qFAb7ZQYfBd5O8QQnbg+ljM=;
	b=4+zODNCsDGJ5IVOEpCHjeUo1EVO9r5zTadv/CLmLmfPhVg+HsnElN6wR+yHo9EWPWXC3cw
	l/ef6th5jEOjNdCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UL2AJR1B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8xD41Gpx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FlApLM+6NHXeyNHrZs7qFAb7ZQYfBd5O8QQnbg+ljM=;
	b=UL2AJR1BrjXZmm+GGh4UMq32pWsgoSMmhN+u1mUj191Yfs5b2UovWRoPPLgbaxf4LoQxHe
	wCkxg0dVMwml21R9t1wsR4ic7Og+VfwWcbt6UfUHcYLsnTPWJqR53SFSh/uwgiQIBxfef2
	wFXlaHNqK/MHeQ+sqT4+M+Bw5A8iVJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FlApLM+6NHXeyNHrZs7qFAb7ZQYfBd5O8QQnbg+ljM=;
	b=8xD41GpxBN+xCOa43OZxnWJbsv0+D7lCV3ihsL9anYIBLNyrixPBhfRBT9DyCinpAMuTWb
	81hngw5kGsBimuBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D712134F4;
	Sun, 15 Nov 2026 22:00:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9PgqNJUr+moqcQAAD6G6ig
	(envelope-from <clopez@suse.de>); Sun, 15 Nov 2026 22:00:54 +0000
Message-ID: <f0a6bfcf-b131-419a-8b7d-ce10e0c507d8@suse.de>
Date: Sun, 15 Nov 2026 23:00:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] mm: fix eager write-bit restore for write-notified
 shared mappings
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 seanjc@google.com, pbonzini@redhat.com, akpm@linux-foundation.org,
 david@kernel.org, peterx@redhat.com, imbrenda@linux.ibm.com,
 borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Peter Feiner <pfeiner@google.com>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-3-clopez@suse.de> <avd12eMWaTl87uL0@gremlin>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <avd12eMWaTl87uL0@gremlin>
X-Rspamd-Queue-Id: 220F51F453
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
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -13.50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_140058_353379_A23A0719 
X-CRM114-Status: GOOD (  10.09  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 9:47 PM, Lorenzo Stoakes (ARM) wrote:
>>  static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_struct *vma)
>>  {
>>  	/*
>> @@ -596,19 +604,16 @@ static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_struct *vma
>>  	 * if we can't do that automatically for all PTEs in a mapping. For
>>  	 * private mappings, that's always the case when we have write
>>  	 * permissions as we properly have to handle COW.
>> +	 *
>> +	 * vma->vm_page_prot lacks the write bit if writenotify is already
>> +	 * enabled, so pass it with the bits restored, as vma_set_page_prot()
>> +	 * does.
> 
> We don't write code in comments.

I'll drop it.

>>  	 */
>>  	if (vma->vm_flags & VM_SHARED)
>> -		return vma_wants_writenotify(vma, vma->vm_page_prot);
>> +		return vma_wants_writenotify(vma,
>> +		       vma_pgprot_modify(vma->vm_page_prot, vma->flags));
> 
> You mention vma_set_page_prot() but then implement it differently from there and
> make no effort to abstract it?
> 
> And so both callers now do the same thing, and both open code it... you should
> abstract that.

Okay, I'll add a helper for both.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
