Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8C9C41513
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 14:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2P/Ut32596owqDajAiSa78uUwp3vBAxkUv6RQTXzdCw=; b=Wk78froeKGDYYa
	dTZpdvkrCpTT/9UKdp+OuSapyE4hG0bwd02F92CoEdOTY0DUemRFUuI0yXhV9RAd/uQrjA337Zoxa
	XBfdBhZTLNC/lzooUU6mKKVAMw8AQjGH6pCkbJ1PXqg3viLkRu9tkMr4pcCwoIpF17cDwpPEYTipK
	8Gq88ZEyhtoZzch7WIxpSSe/7FDXzaIoh+CNAesePol5vHoofduKCnnyS+NyPDR6veUB1zXllpBTm
	2Z4vzfQxqpbOFJmkQueL061HNmskEsfcHDpwbwejkVB2dyWI7f8Jt622SPEfR7Dkq8tmyL+G3GCpI
	VJZOvuQTj25lHeCjX+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QML-000000009Jf-18oq;
	Tue, 21 May 2024 14:20:57 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9QMB-000000009DP-3ycS
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 14:20:54 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38F19342D8;
	Tue, 21 May 2024 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716301234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2gl6IIKZoaIcIf/VQk1wtsxiVEKAJnwFVp8xEUBBLc=;
	b=rO2eJGX2DCJrhuV+yZ3rMgnlKH+er2PdvSaY9aJKC/k8tQiX0sB1kwl5fRblWX1Lpm2Nlf
	grAAgFgARm88tcvB9VMdVY52e5DDA07n+cAxv6yUz9gShNiBcXKpDbotyF/HMvfjt9EXvl
	fBq/X2Kyo2xaVnUhaLJq1R6MyAbqgKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716301234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2gl6IIKZoaIcIf/VQk1wtsxiVEKAJnwFVp8xEUBBLc=;
	b=RLmDzPRIx+fhV+XYlKEzah51idE+LCMoIzIxbs59YgHiyMR7BXn6s/ds/Ll/ivLWuobT4k
	UGFf0v2KQ4F3SXBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rO2eJGX2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RLmDzPRI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716301234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2gl6IIKZoaIcIf/VQk1wtsxiVEKAJnwFVp8xEUBBLc=;
	b=rO2eJGX2DCJrhuV+yZ3rMgnlKH+er2PdvSaY9aJKC/k8tQiX0sB1kwl5fRblWX1Lpm2Nlf
	grAAgFgARm88tcvB9VMdVY52e5DDA07n+cAxv6yUz9gShNiBcXKpDbotyF/HMvfjt9EXvl
	fBq/X2Kyo2xaVnUhaLJq1R6MyAbqgKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716301234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2gl6IIKZoaIcIf/VQk1wtsxiVEKAJnwFVp8xEUBBLc=;
	b=RLmDzPRIx+fhV+XYlKEzah51idE+LCMoIzIxbs59YgHiyMR7BXn6s/ds/Ll/ivLWuobT4k
	UGFf0v2KQ4F3SXBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D5DE13A1E;
	Tue, 21 May 2024 14:20:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yy4lELGtTGaZAQAAD6G6ig
	(envelope-from <osalvador@suse.de>); Tue, 21 May 2024 14:20:33 +0000
Date: Tue, 21 May 2024 16:20:31 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 5/9] riscv: mm: Add memory hotplugging support
Message-ID: <ZkytryG_cAhjLaQT@localhost.localdomain>
References: <20240521114830.841660-1-bjorn@kernel.org>
 <20240521114830.841660-6-bjorn@kernel.org>
 <CAHVXubi_yQ6L5g4dODoHMNvgO6kHy8i6YskRXSPoTU4N2P8rUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubi_yQ6L5g4dODoHMNvgO6kHy8i6YskRXSPoTU4N2P8rUA@mail.gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 38F19342D8
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,eecs.berkeley.edu,redhat.com,dabbelt.com,sifive.com,lists.infradead.org,rivosinc.com,catalinasystems.io,gmail.com,ventanamicro.com,vger.kernel.org,kvack.org,lists.linux-foundation.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_072048_201859_C9B6093D 
X-CRM114-Status: GOOD (  16.28  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMDM6MTk6MzdQTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IE9uIFR1ZSwgTWF5IDIxLCAyMDI0IGF0IDE6NDnigK9QTSBCasO2cm4gVMO2cGVs
IDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiA+ICsgICAgICAgaWYgKFBhZ2VSZXNlcnZlZChw
YWdlKSkgewo+ID4gKyAgICAgICAgICAgICAgIF9fQ2xlYXJQYWdlUmVzZXJ2ZWQocGFnZSk7Cj4g
Cj4gV2hhdCdzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gX19DbGVhclBhZ2VSZXNlcnZlZCgpIGFu
ZAo+IENsZWFyUGFnZVJlc2VydmVkKCk/IEJlY2F1c2UgaXQgc2VlbXMgbGlrZSBmcmVlX3Jlc2Vy
dmVkX3BhZ2UoKSBjYWxscwo+IHRoZSBsYXR0ZXIgYWxyZWFkeSwgc28gd2h5IHdvdWxkIHlvdSBu
ZWVkIHRvIGNhbGwKPiBfX0NsZWFyUGFnZVJlc2VydmVkKCkgb24gdGhlIGZpcnN0IHBhZ2U/Cgpf
X3tTZXQsQ2xlYXJ9UGFnZSBhcmUgdGhlIG5vbi1hdG9taWMgdmVyc2lvbi4KVXN1YWxseSB1c2Vk
IHdoZW4geW91IGtub3cgdGhhdCBubyBvbmUgZWxzZSBjYW4gZmlkZGxlIHdpdGggdGhlIHBhZ2Us
IHdoaWNoCnNob3VsZCBiZSB0aGUgY2FzZSBoZXJlIHNpbmNlIHdlIGFyZSByZW1vdmluZyB0aGUg
bWVtb3J5LgoKQXMgdG8gd2h5IHdlIGhhdmUgX19DbGVhclBhZ2VSZXNlcnZlZCBhbmQgdGhlbiBo
YXZpbmcKZnJlZV9yZXNlcnZlZF9wYWdlKCkgY2FsbCBDbGVhclBhZ2VSZXNlcnZlZCBJIGRvIG5v
dCByZWFsbHkga25vdy4KTG9va2luZyBhdCB0aGUgaGlzdG9yeSwgaXQgaGFzIGFsd2F5cyBiZWVu
IGxpa2UgdGhpcy4KCkkgcmVtZW1iZXIgSSBsb29rZWQgYXQgdGhpcyBhIGZldyB5ZWFycyBhZ28g
YnV0IEkgY2Fubm90IHJlbWVtYmVyIHRoZSBvdXRjb21lCm9mIHRoYXQuCgpNYXliZSBEYXZpZCBy
ZW1lbWJlcnMgYmV0dGVyLCBidXQgSSB0aGluayB3ZSBjb3VsZCByZW1vdmUgdGhhdApfX0NsZWFy
UGFnZVJlc2VydmVkLgpMb29raW5nIGF0IHBvd2VycGMgaW1wbGVtZW50YXRpb24gY29kZSwgaXQg
ZG9lcyBub3QgZG8gdGhlCl9fQ2xlYXJQYWdlUmVzZXJ2ZWQgYW5kIHJlbGllcyBvbmx5IG9uIGZy
ZWVfcmVzZXJ2ZWRfcGFnZSgpLgoKSSB3aWxsIGhhdmUgYSBsb29rLgoKLS0gCk9zY2FyIFNhbHZh
ZG9yClNVU0UgTGFicwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
