Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0D5606A33F
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 15:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TzzJrFeR;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=T99h4t2e;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A2iRrZUk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TrP7zV8B;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pwChqOUr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jTDN0Qy0iUKspqg8SHyAckLDZG4LTygdLygY349l6c0=; b=TzzJrFeRQ79U/D/MSleejmP9tZ
	RnN/KDp5T0AsF/UIqqmAH06h+WgTZ7CbnxKMs2jcH/DchfT9Kj7ZpmbvHkhj/QUvK992H7RvlLK6U
	NRx1n+lD/vBpuFjSFHq2FhJLUNIx0RtjCwD9bqW/TmOQIU9x4b9aKI5f16ALrYBhq0+zFvppd4hLK
	mm05ZrsKrQr/OGaAitTLd5Q1ZEjfR7UrDdUkQC8xl/64J4DREbpaQDWlqvWmAB2BhEncotJLqxtZb
	ToUFie9ufTUq1y4NEbpG+92ZN559bt5aNXPwDOBJJRbDIYVGOaek/UjurM3z+T20sL59VSD7EduQT
	Orf55RVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLTX-0000000Cm3Z-0tgz;
	Fri, 06 Nov 2026 15:03:31 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLTU-0000000Cm2N-38F8
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 15:03:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C528B1F452;
	Fri,  6 Nov 2026 15:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793977407; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FoXJI83hjTO3ej0IaD9RjGbYyhgQtVCqkHhpUVyi4c=;
	b=T99h4t2eVaDmcmrjVcu27YVtUhLbvUNfnyHjcqGwmJAK8EY3JM5NW5F64yAYp/wwy8z4CL
	OQ3ZR7qiT0H/FjFFL5nmUgbhfEZgFD9A5EtEfwwQfjsDhOuOnsVFcTehzefBuemiKXfZT6
	E8gfqHNX/vfuRnQ1iXGfrwne/66b0go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793977407;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FoXJI83hjTO3ej0IaD9RjGbYyhgQtVCqkHhpUVyi4c=;
	b=A2iRrZUkUprSGaX3DSBXtYraW62Mf+y73dvDiOil3BLXplUYqTBbKk5eyLZK8lPx4MkHqO
	AdHMM067QoKSB0DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TrP7zV8B;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pwChqOUr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793977405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FoXJI83hjTO3ej0IaD9RjGbYyhgQtVCqkHhpUVyi4c=;
	b=TrP7zV8B8N1md/3I8OjCcYITIt4ESSWHs0Yz8xJhnNoMmua2OoyrnWj4n7PNXBtu2z1R9G
	90BoSMUNQDUeYsD97x9WMj89IbtxNHO6Bl24ZQQIgRG5rYGqdWpolgLjdvqds6BCDhpws1
	YspriT66b/zBgFq/O7crDSGBMle7v+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793977405;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FoXJI83hjTO3ej0IaD9RjGbYyhgQtVCqkHhpUVyi4c=;
	b=pwChqOUrbMtB61kYeSJynpZeIOHohxyjdHnde7E83dlZHSYA2ThLpp3JiZ/YStXID2sheR
	ThpKDcjnpwj+lDBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33B42132C9;
	Fri,  6 Nov 2026 15:03:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mWThNTvs7Wo+GAAAD6G6ig
	(envelope-from <clopez@suse.de>); Fri, 06 Nov 2026 15:03:24 +0000
Message-ID: <8e5f0caa-6292-4a65-ba8b-7ae647dd3b1f@suse.de>
Date: Fri, 6 Nov 2026 16:03:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] mm/mprotect: keep writable entries writable on
 permission upgrades
To: "David Hildenbrand (Arm)" <david@kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, ljs@kernel.org,
 imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
References: <20261105165004.2663799-4-clopez@suse.de>
 <20261105165004.2663799-9-clopez@suse.de>
 <60c4f0a0-e3c9-42dc-b2e0-0860ab6e30f0@kernel.org>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <60c4f0a0-e3c9-42dc-b2e0-0860ab6e30f0@kernel.org>
X-Spamd-Result: default: False [-14.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
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
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -14.50
X-Spam-Level: 
X-Rspamd-Queue-Id: C528B1F452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_070329_105544_5B1F7909 
X-CRM114-Status: GOOD (  17.25  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvNS8yNiA2OjA2IFBNLCBEYXZpZCBIaWxkZW5icmFuZCAoQXJtKSB3cm90ZToKPiBPbiAx
MS81LzI2IDE3OjUwLCBDYXJsb3MgTMOzcGV6IHdyb3RlOgo+PiBjaGFuZ2VfcHJvdGVjdGlvbigp
IGFwcGxpZXMgdm1hLT52bV9wYWdlX3Byb3QsIHdoaWNoIGxhY2tzIHRoZSB3cml0ZSBiaXQKPj4g
Zm9yIENvVyBhbmQgd3JpdGUtbm90aWZpZWQgbWFwcGluZ3MsIHNvIGl0IHdyaXRlLXByb3RlY3Rz
IGV2ZXJ5IGVudHJ5Cj4+IGluIHRoZW0uIFdoZW4gYW4gZW50cnkgd291bGQgc2ltcGx5IGJlIG1h
ZGUgd3JpdGFibGUgb24gZmF1bHQgd2l0aG91dAo+PiBmdXJ0aGVyIGNoZWNrcyAoZS5nLiBkaXJ0
eSBQVEVzIGluIHNoYXJlZCBtYXBwaW5ncywgZXhjbHVzaXZlIGFub255bW91cwo+PiBwYWdlcyks
IE1NX0NQX1RSWV9DSEFOR0VfV1JJVEFCTEUgbWFrZXMgdGhlIGVudHJ5IHdyaXRhYmxlIGFnYWlu
IHRvCj4+IGF2b2lkIHRoZSBmdXR1cmUgZmF1bHQuCj4+Cj4+IEhvd2V2ZXIsIHdyaXRhYmxlIGVu
dHJpZXMgaW4gc2hhcmVkIG1hcHBpbmdzIHRoYXQgYXJlIG5vdCBkaXJ0eSBzdGlsbAo+PiBiZWNv
bWUgcmVhZC1vbmx5LiBGb3IgZXhhbXBsZSwgYSB1ZmZkLXdwIHVucHJvdGVjdCBtYWtlcyBjbGVh
biBzaG1lbQo+PiBQVEVzIHJlYWQtb25seSBldmVuIGlmIHRoZXkgd2VyZSBuZXZlciB3cml0ZS1w
cm90ZWN0ZWQsIGUuZy4gd2hlbiB0aGV5Cj4+IHdlcmUgbWFwcGVkIGJ5IGEgcmVhZCBmYXVsdCBi
ZWZvcmUgdWZmZC13cCB3YXMgcmVnaXN0ZXJlZC4gVGhlIG5leHQKPj4gd3JpdGUgdG8gZWFjaCBv
ZiB0aGVtIGNhdXNlcyBhIGZhdWx0IHRoYXQgb25seSByZXN0b3JlcyB0aGUgd3JpdGUgYml0Lgo+
Pgo+PiBOb3cgdGhhdCBNTV9DUF9QRVJNX1VQR1JBREUgaW5kaWNhdGVzIHdoZXRoZXIgbXByb3Rl
Y3QoKSBvbmx5IGFkZHMKPj4gcGVybWlzc2lvbnMsIGNoYW5nZV9wcm90ZWN0aW9uKCkgY2FuIHRl
bGwsIHRvZ2V0aGVyIHdpdGggdGhlCj4+IHVzZXJmYXVsdGZkIHVucHJvdGVjdCBmbGFncywgd2hl
biBhIGNoYW5nZSByZXZva2VzIG5vIGFjY2Vzcy4gS2VlcAo+PiB3cml0YWJsZSBlbnRyaWVzIHdy
aXRhYmxlIGluIHRoZXNlIGNhc2VzLCBhdCB0aGUgUFRFLCBQTUQgYW5kIFBVRAo+PiBsZXZlbHMu
IFRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHRoZSB3cml0ZSBmYXVsdCBoYW5kbGVyLCBhcyBhbiBl
bnRyeQo+PiB0aGF0IGlzIGFscmVhZHkgd3JpdGFibGUgbmVlZHMgbm8gd3JpdGUgZmF1bHQuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNsb3BlekBzdXNlLmRlPgo+PiAtLS0K
Pj4gIG1tL2h1Z2VfbWVtb3J5LmMgfCA3ICsrKysrKysKPj4gIG1tL2ludGVybmFsLmggICAgfCA3
ICsrKysrKysKPj4gIG1tL21wcm90ZWN0LmMgICAgfCA0ICsrKysKPj4gIDMgZmlsZXMgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbW0vaHVnZV9tZW1vcnkuYyBi
L21tL2h1Z2VfbWVtb3J5LmMKPj4gaW5kZXggNTA2ZTFlNjFjMGZkLi42ZTIzZDBlNGFlNjYgMTAw
NjQ0Cj4+IC0tLSBhL21tL2h1Z2VfbWVtb3J5LmMKPj4gKysrIGIvbW0vaHVnZV9tZW1vcnkuYwo+
PiBAQCAtMjgwOSw2ICsyODA5LDEwIEBAIGludCBjaGFuZ2VfaHVnZV9wbWQoc3RydWN0IG1tdV9n
YXRoZXIgKnRsYiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4+ICAJaWYgKHVzZXJmYXVs
dGZkX3J3cCh2bWEpICYmIHBtZF91ZmZkKGVudHJ5KSkKPj4gIAkJZW50cnkgPSBwbWRfbW9kaWZ5
KGVudHJ5LCBQQUdFX05PTkUpOwo+PiAgCj4+ICsJLyogU2VlIGNoYW5nZV9wcmVzZW50X3B0ZXMo
KS4gKi8KPj4gKwlpZiAobW1fY3BfaXNfcGVybV91cGdyYWRlKGNwX2ZsYWdzKSAmJiBwbWRfd3Jp
dGUob2xkcG1kKSkKPj4gKwkJZW50cnkgPSBwbWRfbWt3cml0ZShlbnRyeSwgdm1hKTsKPj4gKwo+
PiAgCS8qIFNlZSBjaGFuZ2VfcHRlX3JhbmdlKCkuICovCj4+ICAJaWYgKChjcF9mbGFncyAmIE1N
X0NQX1RSWV9DSEFOR0VfV1JJVEFCTEUpICYmICFwbWRfd3JpdGUoZW50cnkpICYmCj4+ICAJICAg
IGNhbl9jaGFuZ2VfcG1kX3dyaXRhYmxlKHZtYSwgYWRkciwgZW50cnkpKQo+PiBAQCAtMjg4NSw2
ICsyODg5LDkgQEAgaW50IGNoYW5nZV9odWdlX3B1ZChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4gIAkgKi8KPj4gIAlvbGRwdWQgPSBwdWRwX2lu
dmFsaWRhdGUodm1hLCBhZGRyLCBwdWRwKTsKPj4gIAllbnRyeSA9IHB1ZF9tb2RpZnkob2xkcHVk
LCBuZXdwcm90KTsKPj4gKwkvKiBTZWUgY2hhbmdlX3ByZXNlbnRfcHRlcygpLiAqLwo+PiArCWlm
IChtbV9jcF9pc19wZXJtX3VwZ3JhZGUoY3BfZmxhZ3MpICYmIHB1ZF93cml0ZShvbGRwdWQpKQo+
PiArCQllbnRyeSA9IHB1ZF9ta3dyaXRlKGVudHJ5KTsKPiAKPiBUaGF0IGxvb2tzIGNvbXBsZXRl
bHkgaGFja2VkIG9uLiBXZSBkbyBoYXZlIGNhbl9jaGFuZ2VfcHVkX3dyaXRhYmxlKCkgYmVsb3cg
dG8KPiBtYWtlIHN1Y2ggZGVjaXNpb25zLgoKT2theSwgZm9yIHYzIEkgY2FuIHBhc3MgdGhlIG9s
ZCBlbnRyeSB0byBjYW5fY2hhbmdlX3twbWQscHVkfV93cml0YWJsZSgpCmFuZCByZXR1cm4gdHJ1
ZSBpZiBpdCB3YXMgd3JpdGFibGUsIGFmdGVyIHRoZSBleGlzdGluZyB3cml0ZS10cmFja2luZwpj
aGVja3MgKHVmZmQtd3Avc29mdC1kaXJ0eSkuIEZvciBQVEVzLCBjYW5fY2hhbmdlX3B0ZV93cml0
YWJsZSgpIGlzIG5vdAp1c2VkIG9uIHRoZSBjaGFuZ2VfcHJvdGVjdGlvbigpIHBhdGgsIHNvIHRo
ZSBzYW1lIGNoZWNrIHdvdWxkIGdvIGluCnNldF93cml0ZV9wcm90X2NvbW1pdF9mbHVzaF9wdGVz
KCkuCgpEb2VzIHRoYXQgc291bmQgbW9yZSByZWFzb25hYmxlPwoKPiBXaGFhdGV2ZXIgeW91IHBy
b3Bvc2UgaGVyZSBpcyBlaXRoZXIgd3Jvbmcgb3Igd2F5IHRvbyBzaGFreSwgc29ycnkuCgpUaGUg
aWRlYSBpcyB0aGF0IE1NX0NQX1RSWV9DSEFOR0VfV1JJVEFCTEUgcmVsaWVzIG9uIHRoZSBkaXJ0
eSBiaXQgdG8KbWFrZSBlbnRyaWVzIGluIHNoYXJlZCBtYXBwaW5ncyB3cml0YWJsZSwgd2hpY2gg
bWlzc2VzIGNsZWFuIGVudHJpZXMKdGhhdCB3ZXJlIGFscmVhZHkgd3JpdGFibGUgKGUuZy4gc2ht
ZW0gcmVhZC1mYXVsdGVkIGJlZm9yZSB1ZmZkLXdwCnJlZ2lzdHJhdGlvbikuIFN1Y2ggZW50cmll
cyBjYW4gc3RheSB3cml0YWJsZSwgYXMgYW55dGhpbmcgdGhhdCByZWxpZXMKb24gd3JpdGUgZmF1
bHRzIHdyaXRlLXByb3RlY3RzIHRoZSBlbnRyeSBmaXJzdC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
