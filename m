Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3827BD2E9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFNB7gjDm6Tk5Q7NKJWAX3rIJn27UJ1flemUtdNYhgs=; b=oi28cXNWzL+zQh
	jj8rn9aR/HLT2XG9DGhG0WviPmhfvzEgxwst2N06HFNHp+fZPVPiBURVKp7MpwT8/gTJfwvCKhy8F
	I5TI7C/XOUMFVicuWwkiIMlbb9Bre9gd68sxhHc6BMIqRrZD495yBkgtLMpU2n70mhQsnfrpQWNyf
	Si43/BLYwXL3HJAxZDmccNhBulBocPKroCUamtvBP5ya4F1RGBZgAaNflTXWUVLqxrvHI4MMiPN2b
	dXueaKEbn+Gxx0MJSar+P+vI2or4hyx3huz7/7uzKuk7Z7niZwX3Y16cmo60iErkfF0l6J/PfOY26
	65o2WiFVgI4q5ilvV/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tATI8-0000000HYdq-0C5Y;
	Mon, 11 Nov 2024 12:13:12 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tATHS-0000000HYLm-0706;
	Mon, 11 Nov 2024 12:12:33 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 00DAA219A1;
	Mon, 11 Nov 2024 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1731327148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iANPCmTdrG0dfddLD/86nECIn88ibsqSoXP4uV8W0vU=;
	b=Ok8U02Fvt0EU9i9W5t0LJJfjpgxj3N3vYS/lMurPRF+CO64VmWLVaQh52hGZ5/bxJ77RVi
	ZUJGYmyk7rmeRok10pV6QqnDmHvUlTDYXZorzD1Ntw96EBRRYDHaQGlLYFcHIPulUrHdK5
	HAA6nPdMD0ZmsbSRhl/QliSqO2u8lEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1731327148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iANPCmTdrG0dfddLD/86nECIn88ibsqSoXP4uV8W0vU=;
	b=j2QD2NXf9iM6A3lDT0znetsKbwYNYmvFMFBtxvge+XwxrwBvEJ5ESvs6RQp1PCXkHb/5U7
	2okHicBRuUxbSHBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Ok8U02Fv;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=j2QD2NXf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1731327148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iANPCmTdrG0dfddLD/86nECIn88ibsqSoXP4uV8W0vU=;
	b=Ok8U02Fvt0EU9i9W5t0LJJfjpgxj3N3vYS/lMurPRF+CO64VmWLVaQh52hGZ5/bxJ77RVi
	ZUJGYmyk7rmeRok10pV6QqnDmHvUlTDYXZorzD1Ntw96EBRRYDHaQGlLYFcHIPulUrHdK5
	HAA6nPdMD0ZmsbSRhl/QliSqO2u8lEs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1731327148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iANPCmTdrG0dfddLD/86nECIn88ibsqSoXP4uV8W0vU=;
	b=j2QD2NXf9iM6A3lDT0znetsKbwYNYmvFMFBtxvge+XwxrwBvEJ5ESvs6RQp1PCXkHb/5U7
	2okHicBRuUxbSHBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95C9B13301;
	Mon, 11 Nov 2024 12:12:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zH8/JKv0MWdjOgAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 11 Nov 2024 12:12:27 +0000
Message-ID: <440b2682-dbfb-4a5c-927c-2397413a7f9c@suse.cz>
Date: Mon, 11 Nov 2024 13:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/6] arch: introduce set_direct_map_valid_noflush()
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Patrick Roy <roypat@amazon.co.uk>,
 tabba@google.com, quic_eberman@quicinc.com, seanjc@google.com,
 pbonzini@redhat.com, jthoughton@google.com, ackerleytng@google.com,
 vannapurve@google.com, rppt@kernel.org
Cc: graf@amazon.com, jgowans@amazon.com, derekmn@amazon.com,
 kalyazin@amazon.com, xmarcalx@amazon.com, linux-mm@kvack.org,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 hpa@zytor.com, luto@kernel.org, peterz@infradead.org, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, shuah@kernel.org,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20241030134912.515725-1-roypat@amazon.co.uk>
 <20241030134912.515725-2-roypat@amazon.co.uk>
 <a774e13e-0616-4d96-bb51-bac0fcb2cb9b@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <a774e13e-0616-4d96-bb51-bac0fcb2cb9b@redhat.com>
X-Rspamd-Queue-Id: 00DAA219A1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	R_RATELIMIT(0.00)[to_ip_from(RLisu716frudqkg98kczdd9eac)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_041230_720776_A92F560A 
X-CRM114-Status: GOOD (  18.80  )
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

On 10/31/24 10:57, David Hildenbrand wrote:
> On 30.10.24 14:49, Patrick Roy wrote:
>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>> 
>> From: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> 
>> Add an API that will allow updates of the direct/linear map for a set of
>> physically contiguous pages.
>> 
>> It will be used in the following patches.
>> 
>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
> 
> 
> [...]
> 
>>   #ifdef CONFIG_DEBUG_PAGEALLOC
>>   void __kernel_map_pages(struct page *page, int numpages, int enable)
>>   {
>> diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
>> index e7aec20fb44f1..3030d9245f5ac 100644
>> --- a/include/linux/set_memory.h
>> +++ b/include/linux/set_memory.h
>> @@ -34,6 +34,12 @@ static inline int set_direct_map_default_noflush(struct page *page)
>>   	return 0;
>>   }
>>   
>> +static inline int set_direct_map_valid_noflush(struct page *page,
>> +					       unsigned nr, bool valid)
> 
> I recall that "unsigned" is frowned upon; "unsigned int".
> 
>> +{
>> +	return 0;
>> +}
> 
> Can we add some kernel doc for this?
> 
> In particular
> 
> (a) What does it mean when we return 0? That it worked? Then, this

Seems so.

>      dummy function looks wrong. Or this it return the

That's !CONFIG_ARCH_HAS_SET_DIRECT_MAP and other functions around do it the
same way. Looks like the current callers can only exist with the CONFIG_
enabled in the first place.

>      number of processed entries? Then we'd have a possible "int" vs.
>      "unsigned int" inconsistency.
> 
> (b) What are the semantics when we fail halfway through the operation
>      when processing nr > 1? Is it "all or nothing"?

Looking at x86 implementation it seems like it can just bail out in the
middle, but then I'm not sure if it can really fail in the middle, hmm...



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
