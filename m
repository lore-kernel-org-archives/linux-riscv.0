Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4BC606A335
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 22:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lL4hhaMN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VtC39wDA;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FSD3EA54;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VtC39wDA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FSD3EA54
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AzV6kWddRKM3r2qZnCr3CjS5FBzfx087xS93/Xsftrc=; b=lL4hhaMNaQG/7/TOI7bWzD/7dB
	vVac56/lBil58ONmJF/OY4is5v+PBxJ436Ht2ZB0NbdGzSlpVByWd8aDSwnEzIQRrs+mlEugDQpQy
	3JNerD0CpAE5zVyMRkTkKysP4kfiiG/NNXkdInDVVhbhzfIXnJNx18iqDbOiLr3hG4crU3TaO9Gxn
	XLZYfiU4fBDrP7lPySQTixvfFFcs/Hk7cWUy27fmlP1pv92ENllCqDxVJWCEOWagpijm3SibKg7EV
	4Rf0o68fT9J/q0WcizZBekEgsO0XnmCbzZcPopCEQ6VTxb6zbxlKsBSrbbJ7D8HGqUzFg3N0PvMI7
	NukWNgOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiHN-00000000aXY-3KkG;
	Sun, 15 Nov 2026 22:00:53 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiHF-00000000aSf-0hjm
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 22:00:51 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8882F1F449;
	Sun, 15 Nov 2026 22:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1q2m7iCmRu8/0QbFElHLPq1Wp6Csg/qGVcaQCf3LJU=;
	b=VtC39wDA1GWTGm0xox6CVDf2jVHsVvaOgt8LdKsluJlNGWsTnvwnbRNo+nszbXNH/ZPn6y
	mdlew/Jpo8f7BwJUW4HaSquuZ8yOPAoLg69ziQTIda6nEc5Eni7s2jrotzE7DBLQUWLjFQ
	AmQHK4DwrDTT5G6BDD9HFxk+aM4yeTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1q2m7iCmRu8/0QbFElHLPq1Wp6Csg/qGVcaQCf3LJU=;
	b=FSD3EA54NpSYVbs7Zde8pdPXSOSxZXRemtfdLIRL9+aSukEH1zgttElCb9EI88/JkNI5gh
	sHc8q8hKGbej2QAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794780043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1q2m7iCmRu8/0QbFElHLPq1Wp6Csg/qGVcaQCf3LJU=;
	b=VtC39wDA1GWTGm0xox6CVDf2jVHsVvaOgt8LdKsluJlNGWsTnvwnbRNo+nszbXNH/ZPn6y
	mdlew/Jpo8f7BwJUW4HaSquuZ8yOPAoLg69ziQTIda6nEc5Eni7s2jrotzE7DBLQUWLjFQ
	AmQHK4DwrDTT5G6BDD9HFxk+aM4yeTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794780043;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1q2m7iCmRu8/0QbFElHLPq1Wp6Csg/qGVcaQCf3LJU=;
	b=FSD3EA54NpSYVbs7Zde8pdPXSOSxZXRemtfdLIRL9+aSukEH1zgttElCb9EI88/JkNI5gh
	sHc8q8hKGbej2QAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9EFE134F4;
	Sun, 15 Nov 2026 22:00:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KoiGLokr+mqVcAAAD6G6ig
	(envelope-from <clopez@suse.de>); Sun, 15 Nov 2026 22:00:41 +0000
Message-ID: <1cc05b4d-e713-49e8-9bac-444259bf12f3@suse.de>
Date: Sun, 15 Nov 2026 23:00:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] mm/huge_memory: honor MM_CP_TRY_CHANGE_WRITABLE in
 change_huge_pud()
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 seanjc@google.com, pbonzini@redhat.com, akpm@linux-foundation.org,
 david@kernel.org, peterx@redhat.com, imbrenda@linux.ibm.com,
 borntraeger@linux.ibm.com, frankja@linux.ibm.com,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-5-clopez@suse.de> <avd0Cexmmu7kCN45@gremlin>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <avd0Cexmmu7kCN45@gremlin>
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL8fugicft4tip39ru97wanzoz)];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.29
X-Spam-Level: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_140045_609648_B1D3A27F 
X-CRM114-Status: GOOD (  15.36  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTMvMjYgOTo0OCBQTSwgTG9yZW56byBTdG9ha2VzIChBUk0pIHdyb3RlOgo+IE9uIFRo
dSwgTm92IDEyLCAyMDI2IGF0IDAzOjIwOjMyUE0gKzAxMDAsIENhcmxvcyBMw7NwZXogd3JvdGU6
Cj4+IGNoYW5nZV9wcm90ZWN0aW9uKCkgYXBwbGllcyB2bWEtPnZtX3BhZ2VfcHJvdCwgd2hpY2gg
bGFja3MgdGhlIHdyaXRlIGJpdAo+PiBmb3IgQ29XIGFuZCB3cml0ZS1ub3RpZmllZCBtYXBwaW5n
cy4gTU1fQ1BfVFJZX0NIQU5HRV9XUklUQUJMRSBtYWtlcwo+PiBlbnRyaWVzIHdyaXRhYmxlIGFn
YWluIGlmIGEgd3JpdGUgZmF1bHQgd291bGQgb25seSBzZXQgdGhlIHdyaXRlIGJpdC4KPj4KPj4g
SG93ZXZlciwgY2hhbmdlX2h1Z2VfcHVkKCkgaWdub3JlcyB0aGUgZmxhZy4gRm9yIGV4YW1wbGUs
IGRldmljZSBEQVgKPj4gbWFwcGluZ3MgYXJlIHdyaXRlLW5vdGlmaWVkIG9uY2Ugc29mdC1kaXJ0
eSB0cmFja2luZyBpcyBhcm1lZCB0aHJvdWdoCj4+IC9wcm9jL3BpZC9jbGVhcl9yZWZzLCBhbmQg
YSBwcm90ZWN0aW9uIGNoYW5nZSB0aGVuIGxlYXZlcyBkaXJ0eSBQVURzCj4+IHJlYWQtb25seSwg
c28gdGhlIG5leHQgd3JpdGUgdG8gZWFjaCBvZiB0aGVtIGZhdWx0cy4KPj4KPj4gRml4IHRoaXMg
YnkgYWRkaW5nIGNhbl9jaGFuZ2VfcHVkX3dyaXRhYmxlKCksIGJhc2VkIG9uCj4+IGNhbl9jaGFu
Z2VfcG1kX3dyaXRhYmxlKCkuIEl0IG9taXRzIHRoZSBOVU1BIGFuZCB1ZmZkLXdwIGNoZWNrcywg
YXMKPj4gY2hhbmdlX2h1Z2VfcHVkKCkgYmFpbHMgb3V0IG9uIHRob3NlIGNoYW5nZXMuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7NwZXogPGNsb3BlekBzdXNlLmRlPgo+IAo+IElzIHRo
aXMgYSByZWFsIHByb2JsZW0gdGhhdCBhY3R1YWwgcGVvcGxlIGhhdmUgaGFkPwo+IAo+IFRoZSB3
aHkgb2YgYWxsIHRoaXMgaXMgc3RpbGwgZWx1ZGluZyBtZSwgZXNwZWNpYWxseSBmb3IgVEhQIFBV
RC4uLgoKTm9ib2R5IHJlcG9ydGVkIGl0LCBidXQgdGhlIG5ldyBmbGFnIGRlcGVuZHMgb24gaXQs
IHNlZSBteSByZXBseSB0bwpEYXZpZCBmb3IgdGhpcyBzYW1lIHBhdGNoLgoKPj4gWy4uLl0KPj4g
KyNpZmRlZiBDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRAo+PiArc3Rh
dGljIGlubGluZSBib29sIGNhbl9jaGFuZ2VfcHVkX3dyaXRhYmxlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLAo+PiArCQkJCQkgICB1bnNpZ25lZCBsb25nIGFkZHIsIHB1ZF90IHB1ZCkKPj4g
K3sKPj4gKwlzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4gKwo+PiArCWlmIChXQVJOX09OX09OQ0UoISh2
bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpKSkKPj4gKwkJcmV0dXJuIGZhbHNlOwo+PiArCj4+ICsJ
LyogRG8gd2UgbmVlZCB3cml0ZSBmYXVsdHMgZm9yIHNvZnRkaXJ0eSB0cmFja2luZz8gKi8KPj4g
KwlpZiAodm1hX3NvZnRfZGlydHlfZW5hYmxlZCh2bWEpICYmICFwdWRfc29mdF9kaXJ0eShwdWQp
KQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwlpZiAoISh2bWEtPnZtX2ZsYWdzICYgVk1f
U0hBUkVEKSkgewo+IAo+IFRoaXMgaXMgZ2V0dGluZyBhbm5veWluZyBub3csIHlvdSdyZSBzZWVt
aW5nbHkgX2tub3dpbmdseV8gd3JpdGluZyBkZXByZWNhdGVkCj4gVk1BIGZsYWcgQVBJIGNvZGUg
b24gcHVycG9zZS4KClNvcnJ5LCBJIGJhc2VkIGl0IG9uIGNhbl9jaGFuZ2VfcG1kX3dyaXRhYmxl
KCksIEknbGwgdXNlIHZtYV90ZXN0KCkgaW5zdGVhZC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
