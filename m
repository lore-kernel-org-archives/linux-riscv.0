Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41822606A333
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rk+VEG0/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lWT6b5dW;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ryh0U1mL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lWT6b5dW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ryh0U1mL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yknc+y1atl9nOLW4nfqyYEmj68y/MhALn2iu1eQqesw=; b=rk+VEG0/QU9RccpiCedfjw9EWe
	8yZvnfL5jDZrEmAsAwjeGFIlzv7PrTugYqCIOGVB6m8gOT7jIpNOkaGYp0xRoM3elUzcd6unyqtg0
	ix2gtpoh9vyMEjjA6W0M7Fvrc8Kt5FfTSY7c5mkKk2hf50Nw1r/39pCeQGlJ8CT3J+sVUbjPTqJyg
	HM3XT+qIq+S52o8tmwjXuhO+EpeZ20ulQlmNv+OZChmPP2zWOrG2BcFzhQZEjuruifcFm9BYjAdmV
	RYrhtXWzxm5aVQ3nBB0r1Shp48/1jT4l57drMlqn/dyPsvivt3GyFaYQSf1gmpO9xcPVbGNx68QPo
	jAUhVtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiH6-00000000aPY-0qwp;
	Sun, 15 Nov 2026 22:00:36 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiGr-00000000aMA-11bl
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 22:00:35 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C5861F45A;
	Sun, 15 Nov 2026 22:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1RSqXe5NSBqTmAqgI8yQZO9YY1N+JiA5u+pgxFt2XGs=;
	b=lWT6b5dWKL4zHWCtNzWw4QbP9c2lP277H/TJ4gs21j9HdqDLwKhCuTdOPoTvq/W0hKti9N
	qiRESjvlUKws885BTsvURzshHmxXehtvXR2uyjE4ltBfq3YZqLH8r65sMV7sIeXAW7lFpW
	Ax5ukyMJonFfG3Nki741rMlwANhsgC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780019;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1RSqXe5NSBqTmAqgI8yQZO9YY1N+JiA5u+pgxFt2XGs=;
	b=Ryh0U1mLig3r/y4YnBhEFlh8FmJ9siMCFCE6mh+qhd9Jfxu5Tzs6a+eMWexV2xzYpJf/b4
	RCEFROmkX4WWK0CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lWT6b5dW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ryh0U1mL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1RSqXe5NSBqTmAqgI8yQZO9YY1N+JiA5u+pgxFt2XGs=;
	b=lWT6b5dWKL4zHWCtNzWw4QbP9c2lP277H/TJ4gs21j9HdqDLwKhCuTdOPoTvq/W0hKti9N
	qiRESjvlUKws885BTsvURzshHmxXehtvXR2uyjE4ltBfq3YZqLH8r65sMV7sIeXAW7lFpW
	Ax5ukyMJonFfG3Nki741rMlwANhsgC0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780019;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1RSqXe5NSBqTmAqgI8yQZO9YY1N+JiA5u+pgxFt2XGs=;
	b=Ryh0U1mLig3r/y4YnBhEFlh8FmJ9siMCFCE6mh+qhd9Jfxu5Tzs6a+eMWexV2xzYpJf/b4
	RCEFROmkX4WWK0CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 51406134F4;
	Sun, 15 Nov 2026 22:00:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 65LNBHEr+mrobwAAD6G6ig
	(envelope-from <clopez@suse.de>); Sun, 15 Nov 2026 22:00:17 +0000
Message-ID: <343d0637-d88a-4505-b7d3-37b41c89a9f9@suse.de>
Date: Sun, 15 Nov 2026 23:00:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] mm/huge_memory: honor MM_CP_TRY_CHANGE_WRITABLE in
 change_huge_pud()
To: "David Hildenbrand (Arm)" <david@kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, ljs@kernel.org,
 imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-5-clopez@suse.de>
 <136002e1-646d-4607-be3f-b6a6a869bbec@kernel.org>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <136002e1-646d-4607-be3f-b6a6a869bbec@kernel.org>
X-Rspamd-Queue-Id: 0C5861F45A
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
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RL3zg8z7sygsujbub1yh4z3pr1)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -13.50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_140021_455129_A4D52903 
X-CRM114-Status: GOOD (  10.75  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTMvMjYgNzo1OCBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6Cj4gT24g
MTEvMTIvMjYgMTU6MjAsIENhcmxvcyBMw7NwZXogd3JvdGU6Cj4+IGNoYW5nZV9wcm90ZWN0aW9u
KCkgYXBwbGllcyB2bWEtPnZtX3BhZ2VfcHJvdCwgd2hpY2ggbGFja3MgdGhlIHdyaXRlIGJpdAo+
PiBmb3IgQ29XIGFuZCB3cml0ZS1ub3RpZmllZCBtYXBwaW5ncy4gTU1fQ1BfVFJZX0NIQU5HRV9X
UklUQUJMRSBtYWtlcwo+PiBlbnRyaWVzIHdyaXRhYmxlIGFnYWluIGlmIGEgd3JpdGUgZmF1bHQg
d291bGQgb25seSBzZXQgdGhlIHdyaXRlIGJpdC4KPj4KPj4gSG93ZXZlciwgY2hhbmdlX2h1Z2Vf
cHVkKCkgaWdub3JlcyB0aGUgZmxhZy4gRm9yIGV4YW1wbGUsIGRldmljZSBEQVgKPj4gbWFwcGlu
Z3MgYXJlIHdyaXRlLW5vdGlmaWVkIG9uY2Ugc29mdC1kaXJ0eSB0cmFja2luZyBpcyBhcm1lZCB0
aHJvdWdoCj4+IC9wcm9jL3BpZC9jbGVhcl9yZWZzLCBhbmQgYSBwcm90ZWN0aW9uIGNoYW5nZSB0
aGVuIGxlYXZlcyBkaXJ0eSBQVURzCj4+IHJlYWQtb25seSwgc28gdGhlIG5leHQgd3JpdGUgdG8g
ZWFjaCBvZiB0aGVtIGZhdWx0cy4KPj4KPj4gRml4IHRoaXMgYnkgYWRkaW5nIGNhbl9jaGFuZ2Vf
cHVkX3dyaXRhYmxlKCksIGJhc2VkIG9uCj4+IGNhbl9jaGFuZ2VfcG1kX3dyaXRhYmxlKCkuIEl0
IG9taXRzIHRoZSBOVU1BIGFuZCB1ZmZkLXdwIGNoZWNrcywgYXMKPj4gY2hhbmdlX2h1Z2VfcHVk
KCkgYmFpbHMgb3V0IG9uIHRob3NlIGNoYW5nZXMuCj4gCj4gQWdhaW4sIHBsZWFzZSBrZWVwIE1N
IGNoYW5nZXMgdG8gYSBiYXJlIG1pbmltdW0gZm9yIHlvdXIgd29yay4KPiAKPiBJZiB0aGlzIGlz
IG5vdCByZXF1aXJlZCBmb3IgeW91ciB3b3JrLCBwbGVhc2UgZHJvcCBpdC4KCkl0IGlzIHJlcXVp
cmVkLiBUaGUgbmV3IGZsYWcgaXMgbm90IGNvcnJlY3Qgd2l0aG91dCBpdCwgYXMgYSBwcm90ZWN0
aW9uCmNoYW5nZSB0aGF0IHJlbW92ZXMgbm8gcGVybWlzc2lvbiBiaXRzIHN0aWxsIHdyaXRlLXBy
b3RlY3RzIHdyaXRhYmxlClBVRHMuIEknbGwgZXhwbGFpbiB0aGlzIGJldHRlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
