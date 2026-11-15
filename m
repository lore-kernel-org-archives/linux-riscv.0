Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4D606A323
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 22:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RqioDQUD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yNGX8YxI;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dHWSkrl9;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cJgxd3Yd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=w6YCGSqQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J9dlEy63yPa5+DfuU8b4mpbaFKCZXukQna+YAZTuueU=; b=RqioDQUDHxRA7R7bK+EXTeGEMP
	EIA+6cAOIFa1CO5/1ooy2fvQZAXrnq4ljuaC9RPoYsCjgf1QVqUXq3h7EisRKyDwHrpRrtG5y3fez
	ugnrsI+tQJSGIR7yEOsivW814T9ZVK8BW7cpUm0XFarer9U51co1dIi7PbfdtkmGee/gkwf/qtkT+
	9kcw5+qilc/O6D7ZbqU8X+6X1cxGpjCYgcAAztGiQkyYipa1n+d06wmJLcEEW4AkMTDpRlCjb8jc5
	J0Wd1HIDlCe+iZdvVvQnHtQtsoeZZfZ9XJw5zebAK7WWFnzCVDug2xG7DBrvFsmJiNECC6F2YeeUV
	aERoJhNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiIW-00000000awt-0wdw;
	Sun, 15 Nov 2026 22:02:04 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiIR-00000000avF-06SV
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 22:02:02 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 823DA1F453;
	Sun, 15 Nov 2026 22:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zf9DtiDcfPDq5FyebYj0+43UHmIfZzFWjiLt3zTvI4=;
	b=yNGX8YxIAosQlOja9ZU/DwAPoErOoX9tiCZ8akKF166Lm6qYQSMCeAL3R3/sF4TQjX6FLE
	ycbjHmfI2H5imUKG32J0skIjvnlST3pMqc4fujZJvoc+xd1o3qxri9w24OytkYPztxdXa8
	mVpwdedxzbtfSWpy+SUNIgEqEP4lses=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zf9DtiDcfPDq5FyebYj0+43UHmIfZzFWjiLt3zTvI4=;
	b=dHWSkrl9Ab90oUOi+637KJWjEanMbqrLDo3uZW0Gyq6k0uWKl8iO8v4ZcRmM8vAWx36wiG
	v20AB2TvWuegIPCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cJgxd3Yd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=w6YCGSqQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zf9DtiDcfPDq5FyebYj0+43UHmIfZzFWjiLt3zTvI4=;
	b=cJgxd3YdqlBzrT0x3saP226VtNmr8Dbf0IuXsJ9QRky7GmCFPKjT/AUigeik0r1vhnYNH2
	ICgRncrTSMVHljQ9jm5u2khxArdWaJ6CMfrTjAjSrnMudJQ5V84BSRo+6RpWMXavkh/iz9
	tdLK99DGjhU5Q4PGrZawd1ea9gBCSVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1zf9DtiDcfPDq5FyebYj0+43UHmIfZzFWjiLt3zTvI4=;
	b=w6YCGSqQW59XynwaOG0YgMU9UeloEIJoSsXdzI1jbZzMZoXjJ4gKyf4TsH0cnQjD68KAzM
	nAStPVwSQnbzEOAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C67B134F4;
	Sun, 15 Nov 2026 22:01:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lhSBO9Ar+mr7cQAAD6G6ig
	(envelope-from <clopez@suse.de>); Sun, 15 Nov 2026 22:01:53 +0000
Message-ID: <079c15fb-8b41-472d-b9f2-d88826e27286@suse.de>
Date: Sun, 15 Nov 2026 23:01:52 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] mm/mprotect: add MM_CP_PERM_UPGRADE
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 seanjc@google.com, pbonzini@redhat.com, akpm@linux-foundation.org,
 david@kernel.org, peterx@redhat.com, imbrenda@linux.ibm.com,
 borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-7-clopez@suse.de> <avdw0O4rWi4WrTvy@gremlin>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <avdw0O4rWi4WrTvy@gremlin>
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_TWELVE(0.00)[21];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: 823DA1F453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_140159_651890_18E2AF3F 
X-CRM114-Status: GOOD (  21.08  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTMvMjYgOTozNyBQTSwgTG9yZW56byBTdG9ha2VzIChBUk0pIHdyb3RlOgo+IE9uIFRo
dSwgTm92IDEyLCAyMDI2IGF0IDAzOjIwOjM0UE0gKzAxMDAsIENhcmxvcyBMw7NwZXogd3JvdGU6
Cj4+IEFkZCBhIGNoYW5nZV9wcm90ZWN0aW9uKCkgZmxhZyBmb3IgY2hhbmdlcyB0aGF0IG9ubHkg
YWRkIHBlcm1pc3Npb25zLAo+PiBzbyB0aGF0IE1NVSBub3RpZmllciB1c2VycyBjYW4ga2VlcCB0
aGVpciBtYXBwaW5ncyBhbmQgZmF1bHQgaW4gdGhlIG5ldwo+PiBwZXJtaXNzaW9ucyBsYXRlci4g
bXByb3RlY3QoKSBzZXRzIGl0IHdoZW4gdGhlIG5ldyBWTUEgZmxhZ3Mgb25seSBhZGQKPj4gcmVh
ZCwgd3JpdGUgb3IgZXhlY3V0ZSBwZXJtaXNzaW9ucywgb3IgVk1fQUNDT1VOVCwgd2hpY2ggZG9l
cyBub3QgYWZmZWN0Cj4+IHRoZSBwYWdlIHRhYmxlcy4gQW55IG90aGVyIGNoYW5nZSwgc3VjaCBh
cyBhIGRpZmZlcmVudCBwcm90ZWN0aW9uIGtleSwKPj4gaXMgbm90IGFuIHVwZ3JhZGUuCj4gCj4g
SSdtIHN0cnVnZ2xpbmcgdG8gY29tcHJlaGVuZCB3aGF0IHRoaXMgbWVhbnMuCj4gCj4gJ0FkZCBh
IGZsYWcgZm9yIGNoYW5nZXMgdGhhdCBvbmx5IGFkZCAncGVybWlzc2lvbnMnIChub3QgZGVmaW5l
ZCkgc28gdGhhdCAnTU1VCj4gbm90aWZpZXIgdXNlcnMnIGNhbiBrZWVwIG1hcHBpbmdzIGFuZCAn
ZmF1bHQnIGluICd0aGUgbmV3IHBlcm1pc3Npb25zJyBsYXRlci4KPiAKPiBUaGUgcmVzdCBvZiB0
aGUgbWVzc2FnZSBqdXN0IHN0YXRlcyB3aGF0IHRoZSBjb2RlIGRvZXMgYnV0IHNwZWFrcyBhYm91
dCBpdCBhcyBpZgo+IGl0IHdhcyBhbHJlYWR5IHdoYXQgaGFwcGVuZWQuCj4gCj4gVGhpcyBuZWVk
cyB0byBiZSBjb21wbGV0ZWx5IHJld3JpdHRlbi4uLiEKCkknbGwgcmV3cml0ZSBpdC4gQnkgcGVy
bWlzc2lvbnMgSSBtZWFuIHRoZSBhY2Nlc3MgZ3JhbnRlZCBieSB0aGUKcHJvdGVjdGlvbiBiaXRz
IGluIHRoZSBwYWdlIHRhYmxlIGVudHJpZXMuCgo+IFsuLi5dCj4+ICsvKiBXaGV0aGVyIHRoaXMg
Y2hhbmdlIG9ubHkgdXBncmFkZXMvYWRkcyBwZXJtaXNzaW9ucyAqLwo+PiArI2RlZmluZSAgTU1f
Q1BfUEVSTV9VUEdSQURFICAgICAgICAgICAgICAgICgxVUwgPDwgNikKPiAKPiBXaGF0IGFyZSAn
cGVybWlzc2lvbnMnIGV4YWN0bHk/CgpTZWUgYWJvdmUKCj4gWy4uLl0KPj4gK3N0YXRpYyBib29s
IHZtYV9mbGFnc19pc19wZXJtX3VwZ3JhZGUodm1hX2ZsYWdzX3Qgb2xkX3ZtYV9mbGFncywKPj4g
KwkJCQkgICAgICB2bWFfZmxhZ3NfdCBuZXdfdm1hX2ZsYWdzKQo+IAo+IE5vIGNvbW1lbnQsIHJh
bmRvbSBhYmJyZXZpYXRpb24gKGJ1dCBqdXN0IG9uZSB3b3JkKS4gTm90IGlkZWFsLgoKSSdsbCBy
ZW5hbWUuIEFzIERhdmlkIG5vdGVkLCB0aGUgbmFtZSBJIGNob3NlIGlzIG5vdCByZWFsbHkgY29y
cmVjdC4KCj4+ICt7Cj4+ICsJdm1fZmxhZ3NfdCBvbGQgPSB2bWFfZmxhZ3NfdG9fbGVnYWN5KG9s
ZF92bWFfZmxhZ3MpOwo+PiArCXZtX2ZsYWdzX3QgbmV3ID0gdm1hX2ZsYWdzX3RvX2xlZ2FjeShu
ZXdfdm1hX2ZsYWdzKTsKPiAKPiBUaGlzIGlzIGJleW9uZCBhcHBhbGxpbmcgYW5kIGEgY29tcGxl
dGUgYWJ1c2Ugb2YgdGhlIFZNQSBmbGFncyBBUEkuCj4gCj4gWW91IHNlZW0gdG8gaGF2ZSBkZWNp
ZGVkIHRoYXQgeW91IHdvbid0IHRyeSB0byBsZWFybiBob3cgdGhlIEFQSSB3b3Jrcywgc28KPiBp
bnN0ZWFkIHlvdSdsbCBqdXN0IHdyaXRlIGRlcHJlY2F0ZWQgY29kZSB0aGF0IEkgaGF2ZSB0byBm
aW5kIHRpbWUgdG8gY29tZSBhbmQKPiBmaXggdXAgbGF0ZXIgSSBndWVzcz8KClNvcnJ5LCBJJ2xs
IHJld3JpdGUgdGhlIGhlbHBlciB3aXRoIHRoZSB2bWFfZmxhZ3NfdCBBUEksIHVzaW5nClZNQV9B
Q0NFU1NfRkxBR1MgYW5kIFZNQV9BQ0NPVU5UX0JJVCwgYW5kIGRvY3VtZW50IGl0LgoKPiBBbmQg
d2UncmUgYXQgdjMuLi4hCj4gCj4+ICsJLyogVk1fQUNDT1VOVCBkb2VzIG5vdCBhZmZlY3QgcGFn
ZSB0YWJsZXMgKi8KPiAKPiBXaGF0IGRvZXMgdGhpcyBtZWFuPyBBbmQgd2h5IGFyZSB5b3UgcmVm
ZXJyaW5nIHRvIGEgZGVwcmVjYXRlZCBjb25zdGFudD8KCkkgbWVhbnQgdGhhdCBzZXR0aW5nIFZN
X0FDQ09VTlQgZG9lcyBub3QgYWZmZWN0IHRoZSBwcm90ZWN0aW9uIGJpdHMgb2YKYW4gZW50cnks
IHNvIGl0IHNob3VsZCBub3QgcHJldmVudCB0aGUgbmV3IGZsYWcgZnJvbSBiZWluZyBzZXQuCm1w
cm90ZWN0KCkgc2V0cyBWTV9BQ0NPVU5UIHdoZW4gYSBwcml2YXRlIG1hcHBpbmcgYmVjb21lcyB3
cml0YWJsZSwKd2hpY2ggaXMgdGhlIGNhc2UgSSB3YW50ZWQgdG8gY292ZXIuIEknbGwgZXhwbGFp
biB0aGlzIGJldHRlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
