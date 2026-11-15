Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC26606A323
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 22:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u7RRBcZZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gY3mMjYg;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DmLbD5KU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qIV84Pyr;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mZIJVbXM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q/QFUtt+ltsVNfjjZAmjWLTm7b1TIrnIfcLsFW8AAds=; b=u7RRBcZZPtQdf2o6WlFxxDTFVc
	DuBs23aW22l0lUVhQOqb1tWtA4VwDh7lNXeypZZgir+gYU82xwr22MJGbxATqFybr+FLqOH/i5e8j
	3V30+1/+gmhsQRc+PtoolfiQASVV6ZhhOuSAJuMPS45dU6fdFFR5cpWKS1oBHTGBiQdmo7PLuBbTf
	PgYkme7ukKv/R0D/W/cqu7gywtQyV2btg98CdjdesAfdd5Zci3yyAZ6oW0xHacmyQIlD9YOFSawQi
	+yc89oFH5qLzcLBkCtnck1LyZYcPUQTnUv4gEQsGjPwQAybwDQ58aFm+drJq5MPoBcNaBH0GOyhlS
	UrsVKEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiGa-00000000aJN-0Jtz;
	Sun, 15 Nov 2026 22:00:04 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiGK-00000000aG3-2BhT
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 22:00:03 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1ED7B1F449;
	Sun, 15 Nov 2026 21:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794779983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVZtep4ZvvYVafoyhBpdOjFTJN1dKVl9nzH4Gq67ry0=;
	b=gY3mMjYgF5vu+pI9mP2Rd7Drc/pLMD4+v0EO8drluBELU1wBHzwhO1G0DsDiVTzXFHGgH+
	O1TnR4e+K/hgSgv0EpizCjhk7Znh2BGwNm/UvaVImw1Nl0VmTZZ0sY8HpSDVbFQn5Cmuwe
	x/iUHMnlIVIoZGAEAtOoUhKk69k9i7Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794779983;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVZtep4ZvvYVafoyhBpdOjFTJN1dKVl9nzH4Gq67ry0=;
	b=DmLbD5KUDJLP/w2kKJHYFJocZG1hzbxdIfNN2YISnQFOeYfkFh3/beBXJ6IR+yltYHkFXR
	2sIQl02LYF9HBpDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qIV84Pyr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mZIJVbXM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794779982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVZtep4ZvvYVafoyhBpdOjFTJN1dKVl9nzH4Gq67ry0=;
	b=qIV84PyrNE0dD3kBoWUBjZeNZWF3AuDrlfCmqolb2FyOl3t/p9nLINmfhRiuwbEhnf7cHn
	uvbVod1sY0b1k4VFPEjCI4wF9A6sHGkBMWXKQMyIMavO1PCvH88n5U2cE3xwkVVWvd5TV9
	ynZMTjAbR5YSxOQOGxknOfLcTpH5dRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794779982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CVZtep4ZvvYVafoyhBpdOjFTJN1dKVl9nzH4Gq67ry0=;
	b=mZIJVbXM4XB1a0Tz1IPi2hV9yfHM9XZLuK3X4kSgmZKoLw9I0IrLNWZDHe+a9xJq9w2YW+
	TR77jarbUdO9STAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5ABED134F4;
	Sun, 15 Nov 2026 21:59:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 408tCkwr+mr9bgAAD6G6ig
	(envelope-from <clopez@suse.de>); Sun, 15 Nov 2026 21:59:40 +0000
Message-ID: <743f60f7-d611-4d73-a2d1-d5873bcdda36@suse.de>
Date: Sun, 15 Nov 2026 22:59:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] mm: keep writable entries writable on protection
 changes
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
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-6-clopez@suse.de>
 <603cd8e0-c2c5-4c1e-85c4-d0a5ceda8d4c@kernel.org>
From: =?UTF-8?Q?Carlos_L=C3=B3pez?= <clopez@suse.de>
Content-Language: en-US
In-Reply-To: <603cd8e0-c2c5-4c1e-85c4-d0a5ceda8d4c@kernel.org>
X-Rspamd-Queue-Id: 1ED7B1F449
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[27];
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
X-CRM114-CacheID: sfid-20261115_135948_711843_8B94BD22 
X-CRM114-Status: GOOD (  11.80  )
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

T24gMTEvMTMvMjYgNzo1NiBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgKEFybSkgd3JvdGU6Cj4gT24g
MTEvMTIvMjYgMTU6MjAsIENhcmxvcyBMw7NwZXogd3JvdGU6Cj4+IGNoYW5nZV9wcm90ZWN0aW9u
KCkgYXBwbGllcyB2bWEtPnZtX3BhZ2VfcHJvdCwgd2hpY2ggbGFja3MgdGhlIHdyaXRlIGJpdAo+
PiBmb3IgQ29XIGFuZCB3cml0ZS1ub3RpZmllZCBtYXBwaW5ncy4gTU1fQ1BfVFJZX0NIQU5HRV9X
UklUQUJMRSBtYWtlcwo+PiBlbnRyaWVzIHdyaXRhYmxlIGFnYWluIGlmIGEgd3JpdGUgZmF1bHQg
d291bGQgb25seSBzZXQgdGhlIHdyaXRlIGJpdC4KPj4gSW4gc2hhcmVkIG1hcHBpbmdzLCBpdCBy
ZWxpZXMgb24gdGhlIGRpcnR5IGJpdCBmb3IgdGhpcywgYXMgYSBjbGVhbgo+PiBlbnRyeSBtaWdo
dCBzdGlsbCBuZWVkIGEgd3JpdGUgZmF1bHQgdG8gbm90aWZ5IHRoZSBGUy4KPj4KPj4gSG93ZXZl
ciwgdGhpcyBtaXNzZXMgY2xlYW4gZW50cmllcyB0aGF0IHdlcmUgYWxyZWFkeSB3cml0YWJsZS4g
Rm9yCj4+IGV4YW1wbGUsIGEgdWZmZC13cCB1bnByb3RlY3QgbWFrZXMgc2htZW0gUFRFcyByZWFk
LW9ubHkgaWYgdGhleSB3ZXJlCj4+IG1hcHBlZCBieSBhIHJlYWQgZmF1bHQgYmVmb3JlIHVmZmQt
d3Agd2FzIHJlZ2lzdGVyZWQsIHNvIHRoZSBuZXh0IHdyaXRlCj4+IHRvIGVhY2ggb2YgdGhlbSBm
YXVsdHMuCj4gCj4gU2VlIG15IG90aGVyIHJlcGx5LCBhZGRpbmcgc3VjaCBvcHRpbWl6YXRpb25z
IHdpdGhvdXQgYW55IG1vdGl2YXRpb24gd2h5IHdlCj4gc2hvdWxkIGV2ZW4gY2FyZSBpcyBub3Qg
cmVhbGx5IHdoYXQgd2Ugd2FudC4KPiAKPiBEcm9wIGl0IGZyb20geW91ciBzZXJpZXMgYW5kIGtl
ZXAgdGhlIE1NIGNoYW5nZXMgdG8gYSBiYXJlIG1pbmltdW0gcGxlYXNlLgo+IAo+IE9yIGlzIHRo
ZXJlIGEgcmVhbCBkZXBlbmRlbmN5IGZvciB5b3VyIHdvcms/Cj4gCgpZZXMgdGhlcmUgaXMsIGJ1
dCBJIGNsZWFybHkgZGlkIG5vdCBleHBsYWluIGl0IHByb3Blcmx5LgoKVGhlIHdob2xlIHBvaW50
IG9mIHRoZSBzZXJpZXMgaXMgdG8gYXZvaWQgemFwcyB3aGVuIG5vIHBlcm1pc3Npb24gYml0cwph
cmUgcmVtb3ZlZCBieSBhIHByb3RlY3Rpb24gY2hhbmdlLCBlLmcuIG1wcm90ZWN0KFBST1RfUkVB
RCB8ClBST1RfV1JJVEUpIG9uIGEgcmVhZC1vbmx5IFZNQS4gTXkgcHJvcG9zYWwgaXMgZm9yIGNo
YW5nZV9wcm90ZWN0aW9uKCkKdG8gc2lnbmFsIHRoaXMgaXMgdGhlIGNhc2UgdG8gTU1VIG5vdGlm
aWVycyB3aXRoIGEgbmV3IGZsYWcuIEhvd2V2ZXIsCmNoYW5nZV9wcm90ZWN0aW9uKCkgc29tZXRp
bWVzIHdyaXRlLXByb3RlY3RzIGVudHJpZXMgdGhhdCB3ZXJlIHdyaXRhYmxlLAp3aGljaCBtYWtl
cyB0aGUgZmxhZyB3cm9uZywgc28gdGhpcyBwYXRjaCBmaXhlcyB0aGF0LgoKSSdsbCBiZSBzdXJl
IHRvIGV4cGxhaW4gdGhpcyBwcm9wZXJseS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
