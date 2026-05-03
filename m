Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D18CD3427
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 18:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xEh9+XlT31F5/LAz0LLB2oPqncsc6IVi8/v9V+Pj1Y=; b=39a7Axn8zXkYCb
	rkwZwij+iu3Om+3TcPFMrj+QpY2nGvN1O0PwJkA2mBUvgsJ4UoNp3TcSlkocowzvjmkJCw/uNMyWV
	AUl31eLODCCCYBPfWNcfrSlGOJCsK8bJelBSMXcM8o3aHSCVZ4ZznF+T66vdOyeWNR7U0WN6d0Rke
	EF9uhHT4vL8Y3yDbuleEa09SvcIo5MtGvHvHeDpPEbAFMQS5nOfWSgTjRAs9fqz4meDD07el07QLJ
	8dlXZPOodsVhrV6TOpESgHqxrI/kehrcQaVAOY4WiQjgaJQ47FekD4d4EcpsRwiXVfxEhJEGbZ9hb
	M3BFWenMzhPwFlS92fuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJbNt-0000000BUOU-248Y;
	Sun, 03 May 2026 18:17:41 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJbNr-0000000BUNV-0SSB
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 18:17:40 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9BB95C010;
	Sun,  3 May 2026 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1777832255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsKSGKv1gbQ1kxj3oO+fSJmap4EgBc+0PTi6YnXpoZE=;
	b=OoNHn3y4rN894Hek56TAHXPlCqi/IQ1Uo/ALP1kQg3A/6zShv94jQjNfaUtelYYh+YOGMu
	YeRcyoqLNAZBC2BP6OBIZWp0DepiBiJDwjmpOTSysVRWSzDWf2mNm6RtcDBCZaXZCcT03y
	JNuY4E27lqaHD9OEaIdKjcy6iTWHDa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1777832255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsKSGKv1gbQ1kxj3oO+fSJmap4EgBc+0PTi6YnXpoZE=;
	b=q7pHytijoJfoB1JUwtZq+JLzu+1pit499ofgLxkX0CU8I3YxZ3scCg1SxCoipgJc/00K6j
	CBR8iE/NRq1ZfJBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1777832255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsKSGKv1gbQ1kxj3oO+fSJmap4EgBc+0PTi6YnXpoZE=;
	b=OoNHn3y4rN894Hek56TAHXPlCqi/IQ1Uo/ALP1kQg3A/6zShv94jQjNfaUtelYYh+YOGMu
	YeRcyoqLNAZBC2BP6OBIZWp0DepiBiJDwjmpOTSysVRWSzDWf2mNm6RtcDBCZaXZCcT03y
	JNuY4E27lqaHD9OEaIdKjcy6iTWHDa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1777832255;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsKSGKv1gbQ1kxj3oO+fSJmap4EgBc+0PTi6YnXpoZE=;
	b=q7pHytijoJfoB1JUwtZq+JLzu+1pit499ofgLxkX0CU8I3YxZ3scCg1SxCoipgJc/00K6j
	CBR8iE/NRq1ZfJBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93C8F593A8;
	Sun,  3 May 2026 18:17:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a28LJD+R92kuFQAAD6G6ig
	(envelope-from <jack@suse.cz>); Sun, 03 May 2026 18:17:35 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 2B30FA078B; Sun, 03 May 2026 15:13:04 +0200 (CEST)
Date: Sun, 3 May 2026 15:13:04 +0200
From: Jan Kara <jack@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Cc: Barry Song <baohua@kernel.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afTpoL3FklpQZNMM@casper.infradead.org>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	R_RATELIMIT(0.00)[to_ip_from(RLhrg5631p11qpq785u7koq73u)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,kvack.org,infradead.org,google.com,suse.com,suse.cz,suse.de,kylinos.cn,gmail.com,oppo.com,tencent.com,huaweicloud.com,redhat.com,lge.com,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,infradead.org:email,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_111739_307513_01FBFB31 
X-CRM114-Status: GOOD (  27.88  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpIDAxLTA1LTI2IDE4OjU3OjUyLCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPiBPbiBTYXQs
IE1heSAwMiwgMjAyNiBhdCAwMTo0NDozNEFNICswODAwLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4g
T24gRnJpLCBNYXkgMSwgMjAyNiBhdCAxMDo1N+KAr1BNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBNYXkgMDEsIDIwMjYgYXQg
MDY6NDk6NThBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+ID4gPiAxLiBUaGVyZSBpcyBu
byBkZXRlcm1pbmlzdGljIGxhdGVuY3kgZm9yIEkvTyBjb21wbGV0aW9uLiBJdCBkZXBlbmRzIG9u
Cj4gPiA+ID4gYm90aCB0aGUgaGFyZHdhcmUgYW5kIHRoZSBzb2Z0d2FyZSBzdGFjayAoYmlvL3Jl
cXVlc3QgcXVldWVzIGFuZCB0aGUKPiA+ID4gPiBibG9jayBzY2hlZHVsZXIpLiBTb21ldGltZXMg
dGhlIGxhdGVuY3kgaXMgc2hvcnQ7IGF0IG90aGVyIHRpbWVzIGl0IGNhbgo+ID4gPiA+IGJlIHF1
aXRlIGxvbmcuIEluIHN1Y2ggY2FzZXMsIGEgaGlnaC1wcmlvcml0eSB0aHJlYWQgcGVyZm9ybWlu
ZyBvcGVyYXRpb25zCj4gPiA+ID4gc3VjaCBhcyBtcHJvdGVjdCwgdW5tYXAsIHByY3RsX3NldF92
bWEsIG9yIG1hZHZpc2UgbWF5IGJlIGZvcmNlZCB0byB3YWl0Cj4gPiA+ID4gZm9yIGFuIHVucHJl
ZGljdGFibGUgYW1vdW50IG9mIHRpbWUuCj4gPiA+Cj4gPiA+IEJ1dCBkb2VzIHRoYXQgYWN0dWFs
bHkgaGFwcGVuPyAgSSBmaW5kIGl0IGhhcmQgdG8gYmVsaWV2ZSB0aGF0IHRocmVhZCBBCj4gPiA+
IHVubWFwcyBhIFZNQSB3aGlsZSB0aHJlYWQgQiBpcyBpbiB0aGUgbWlkZGxlIG9mIHRha2luZyBh
IHBhZ2UgZmF1bHQgaW4KPiA+ID4gdGhhdCBzYW1lIFZNQS4gIG1wcm90ZWN0KCkgYW5kIG1hZHZp
c2UoKSBhcmUgbW9yZSBsaWtlbHkgdG8gaGFwcGVuLCBidXQKPiA+ID4gaXQgc3RpbGwgc2VlbXMg
cmVhbGx5IHVubGlrZWx5IHRvIG1lLgo+ID4gCj4gPiBJdCBkb2VzbuKAmXQgaGF2ZSB0byBpbnZv
bHZlIHVubWFwcGluZyBvciBhcHBseWluZyBtcHJvdGVjdCB0bwo+ID4gdGhlIGVudGlyZSBWTUHi
gJRqdXN0IGEgcG9ydGlvbiBvZiBpdCBpcyBzdWZmaWNpZW50Lgo+IAo+IFllcywgYnV0IHRoYXQg
c3RpbGwgZmFpbHMgdG8gYW5zd2VyICJkb2VzIHRoaXMgYWN0dWFsbHkgaGFwcGVuIi4gIEhvdyBt
dWNoCj4gcGVyZm9ybWFuY2UgaXMgYWxsIHRoaXMgY29tcGxleGl0eSBpbiB0aGUgcGFnZSBmYXVs
dCBoYW5kbGVyIGJ1eWluZyB1cz8KPiBJZiB5b3UgZG9uJ3QgYW5zd2VyIHRoaXMgcXVlc3Rpb24s
IEknbSBqdXN0IGdvaW5nIHRvIGdvIGluIGFuZCByaXAgaXQKPiBhbGwgb3V0LgoKSSBmdWxseSBh
Z3JlZSB3aXRoIHlvdSB3ZSBzaG91bGQgdmVyaWZ5IHdoZXRoZXIgdGhlIHJldHJ5IGNvZGUgc3Rp
bGwgYnJpbmdzCmluIHJlYWwtd29ybGQgYWR2YW50YWdlIHRvZGF5IHdpdGggVk1BIGxvY2tzLiBB
ZnRlciBhbGwgdGhlIHJldHJ5IGxvZ2ljIGhhcwpiZWVuIGludHJvZHVjZWQgaW4gMjAxMC4gVGhh
dCBiZWluZyBzYWlkIGlmIHRoZXJlIGFyZSByZWFsaXN0aWMgbG9hZHMgd2hlcmUKb25lIHRocmVh
ZCBuZWVkcyBWTUEgd3JpdGUgbG9jayB3aGlsZSBhbm90aGVyIHRocmVhZCBpcyBmYXVsdGluZyB0
aGUgVk1BLAp0aGVuIHRoZSBsYXRlbmNpZXMgY2FuIGJlIGluZGVlZCBleHRyZW1lLiBGb3IgZXhh
bXBsZSB0aGluZ3MgbGlrZSBjZ3JvdXAgSU8KdGhyb3R0bGluZyBoYXBwZW4gb24gdGhlIElPIHBh
dGggYW5kIHRodXMgY2FuIHRocm90dGxlIElPIG9mIGEgbG93LXByaW9yaXR5CnRocmVhZCBmb3Ig
YSBsb25nIHRpbWUuCgpCVFcgSSdtIG5vdCBzdXJlIEkgcXVpdGUgdW5kZXJzdGFuZCBCYXJyeSdz
IHByaW9yaXR5IGludmVyc2lvbiBwcm9ibGVtCnNpbmNlIEknZCBleHBlY3QgYWxsIHRocmVhZHMg
b2YgYSB0YXNrIHRvIGdlbmVyYWxseSBiZSB0cmVhdGVkIHdpdGggdGhlCnNhbWUgcHJpb3JpdHku
Li4KCgkJCQkJCQkJSG9uemEKLS0gCkphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMs
IENSCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
