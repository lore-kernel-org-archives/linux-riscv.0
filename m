Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7715F606A332
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 22:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2G/o0EPE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZGBkIWcO;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4PQMnCTn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZGBkIWcO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4PQMnCTn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/CkQJRVaLRfZc4bmnr8WFBo07Mbr6ElX3pNQUy++yXQ=; b=2G/o0EPEvbEDGunAWu5SjsRf+Q
	u9/cwr+MDX//UKByXm1t+gRI8Byg8YAPXkv1GSivj+lskJW/kFFVLc5yhnLbLBr2f9nz9AvGvOz5A
	sMfn6u9wefXSlfl0+MjVfdILQxMt3fYtkvmhFEVxsJcPkN5tcQ18ZBVjYJ+2g9PQydxTgDWNY8tKy
	gpfEQjFMOudWcmnM16oOuIp0M1WBnXZ2nKahcrJZF+4RcOG9ONuchA3itaYifwId8SXDZOz1y+eWr
	td4F2F9Kpde8ypIOQrGmWSuDi4B+14U9cXFly6Ff9FU77XAm7tEorDNbvyKqSoZaOBzq0FnBgiIqk
	mkA40ZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiKL-00000000bGq-2VGI;
	Sun, 15 Nov 2026 22:03:57 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiKI-00000000bGL-123G
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 22:03:55 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 33AF321E76;
	Sun, 15 Nov 2026 22:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFjckpkKpxZQl7refnurMjE2pE+eWaaM4naABY3aji0=;
	b=ZGBkIWcOxQJjdDqEfSg9iVP0fEIttrVsvIVsoss9fKm4l11GcJPktxSG50oAMsrtkp3cvo
	6fesLoGr9nX+06DOsA6sVXYccYxDKwOCbKw8UtI4q8x3gvLOU70VaBDZvEbPMgBT+v1z3/
	Ikj79aL7x81OAYkHknKK5Mh6xz8abps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFjckpkKpxZQl7refnurMjE2pE+eWaaM4naABY3aji0=;
	b=4PQMnCTnsDkT7rVaMOut/wKMfi9DV4yhSwE86WrI6WPRoW6YksQCEIpgq9eOIBRP+mhjnC
	1zJrxQTfOr22O0AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZGBkIWcO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4PQMnCTn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFjckpkKpxZQl7refnurMjE2pE+eWaaM4naABY3aji0=;
	b=ZGBkIWcOxQJjdDqEfSg9iVP0fEIttrVsvIVsoss9fKm4l11GcJPktxSG50oAMsrtkp3cvo
	6fesLoGr9nX+06DOsA6sVXYccYxDKwOCbKw8UtI4q8x3gvLOU70VaBDZvEbPMgBT+v1z3/
	Ikj79aL7x81OAYkHknKK5Mh6xz8abps=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780232;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFjckpkKpxZQl7refnurMjE2pE+eWaaM4naABY3aji0=;
	b=4PQMnCTnsDkT7rVaMOut/wKMfi9DV4yhSwE86WrI6WPRoW6YksQCEIpgq9eOIBRP+mhjnC
	1zJrxQTfOr22O0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAAC4134F4;
	Sun, 15 Nov 2026 22:03:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ut9FG0Ys+moHdAAAD6G6ig
	(envelope-from <clopez@suse.de>); Sun, 15 Nov 2026 22:03:50 +0000
Message-ID: <5412ba3a-ff32-48e8-b5a1-d46b97cf5f8f@suse.de>
Date: Sun, 15 Nov 2026 23:03:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] mm/mprotect: add MM_CP_PERM_UPGRADE
To: "David Hildenbrand (Arm)" <david@kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, ljs@kernel.org,
 imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-7-clopez@suse.de>
 <3314e44d-dbfe-45da-a1b0-8337784a5e86@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
In-Reply-To: <3314e44d-dbfe-45da-a1b0-8337784a5e86@kernel.org>
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
	RCPT_COUNT_TWELVE(0.00)[21];
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
X-Rspamd-Queue-Id: 33AF321E76
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_140354_455776_43788D7F 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On 11/13/26 7:51 PM, David Hildenbrand (Arm) wrote:
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 84bcfe0281d3..8c0fcd10f5a3 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -767,6 +767,17 @@ static const struct mm_walk_ops prot_none_walk_ops = {
>>  	.walk_lock		= PGWALK_WRLOCK,
>>  };
>>  
>> +static bool vma_flags_is_perm_upgrade(vma_flags_t old_vma_flags,
>> +				      vma_flags_t new_vma_flags)
> 
> Two tab indent.

Will fix

>> +{
>> +	vm_flags_t old = vma_flags_to_legacy(old_vma_flags);
>> +	vm_flags_t new = vma_flags_to_legacy(new_vma_flags);
>> +	/* VM_ACCOUNT does not affect page tables */
>> +	vm_flags_t mask = VM_READ | VM_WRITE | VM_EXEC | VM_ACCOUNT;
> 
> Why is VM_ACCOUNT a permission upgrade? At best it's "no change".
> 
> What am I missing?

It isn't, this just means to cover the case where mprotect(PROT_READ |
PROT_WRITE) on a private read-only VMA sets VM_ACCOUNT as well. Without
this, the change is not detected as an upgrade.

> Also, what you really care about is "no permission downgrade", and "no
> permission upgrade" is not the inverse of that ;)

Right, I'll rename it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
