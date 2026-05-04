Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F87FF886F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 May 2026 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqkwHZd1T6eIkraa6kwKlHILVkHlWA3vXRdfoRbLuGU=; b=JoCg5ik4pU+gL6
	Ulp7CG6JFMuf/8K7SlCIlikFb4IzY94nNDFrBNPH9T9jvM0ZWPBMkocjWzfm2466LI4PSpqoQnfz4
	XG6j5setwEdROY0CRBYlOgSl2dBtLuDNa5UV9/GYOZF4OqAziyN8WGVQpd/YbGkm8H7rWDqRvIrsB
	eq4NKH0TogAJ6+ItWVCfX8mztRrjQ5exdZIjdbwAbUR3eK8PrF9yZ5sqnWaV6KPyDCuT0HmeLnB65
	wXyNpQY8k0OwzeE1CbcaWvODfOSAgmIEuRNjYoFslP2yAw6yYtVZtZcYrdAa3lIcz0jj30I2ATEdl
	9eQHfGOJuX29MQeh+fQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsy1-0000000DE5r-0OO1;
	Mon, 04 May 2026 13:04:09 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsxy-0000000DE4n-0Kr7
	for linux-riscv@lists.infradead.org;
	Mon, 04 May 2026 13:04:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0FB5A6B1DA;
	Mon,  4 May 2026 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1777899844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBtiQAQr6P3N+MHRplixCzeobIB5oib2P5/9uPnbyH4=;
	b=JL/XmGCbCu7Pn0UFm+jahisb16WhHFai6O+3lv7XPFMu2xae2FLJC9y73Ya7QQ1c594PSp
	zIul6PJ51MjlwxJvLAh3JoWQaiH8bSjtiZuj66e8SanvgvDhY0yDxgFLxCNajU06uEybXH
	6z1rmn93QXxpKSaJmJiYKMHvK8WYKX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1777899844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBtiQAQr6P3N+MHRplixCzeobIB5oib2P5/9uPnbyH4=;
	b=vznWPr7EkkLaMX6V8cqN+5Swo1ue1myMCE36D39F6CcK3OfL/g2gaHWLp5fMsKlngpFtjp
	hjbl6G2bCuN8gcDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1777899844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBtiQAQr6P3N+MHRplixCzeobIB5oib2P5/9uPnbyH4=;
	b=JL/XmGCbCu7Pn0UFm+jahisb16WhHFai6O+3lv7XPFMu2xae2FLJC9y73Ya7QQ1c594PSp
	zIul6PJ51MjlwxJvLAh3JoWQaiH8bSjtiZuj66e8SanvgvDhY0yDxgFLxCNajU06uEybXH
	6z1rmn93QXxpKSaJmJiYKMHvK8WYKX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1777899844;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBtiQAQr6P3N+MHRplixCzeobIB5oib2P5/9uPnbyH4=;
	b=vznWPr7EkkLaMX6V8cqN+5Swo1ue1myMCE36D39F6CcK3OfL/g2gaHWLp5fMsKlngpFtjp
	hjbl6G2bCuN8gcDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFD4B593A3;
	Mon,  4 May 2026 13:04:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UPmGOkOZ+GmDfgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 04 May 2026 13:04:03 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id BFC89A078E; Mon, 04 May 2026 15:03:58 +0200 (CEST)
Date: Mon, 4 May 2026 15:03:58 +0200
From: Jan Kara <jack@suse.cz>
To: Barry Song <baohua@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>, 
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <n5vsmp6ingbhfztl6wzcwmrz56gkkfbpzardk43scr7rcgqsw5@evtnov34c5bt>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <yezmezj26xntushmylductlmytfgvwsnbnzlhffkfwugfxkt6m@gleq22spziyk>
 <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4y8JtCxEy9hVxVd8eaf8D9WC8BcRQp9afUVu=FJA1-awA@mail.gmail.com>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	R_RATELIMIT(0.00)[to_ip_from(RLhrg5631p11qpq785u7koq73u)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,lpc.events:url,infradead.org:email,suse.com:email];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.cz,infradead.org,linux-foundation.org,kvack.org,kernel.org,google.com,suse.com,suse.de,kylinos.cn,gmail.com,oppo.com,tencent.com,huaweicloud.com,redhat.com,lge.com,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email,imap1.dmz-prg2.suse.org:helo,lpc.events:url,infradead.org:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_060406_474488_FFA500EC 
X-CRM114-Status: GOOD (  41.99  )
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

T24gTW9uIDA0LTA1LTI2IDAzOjU1OjQzLCBCYXJyeSBTb25nIHdyb3RlOgo+IE9uIE1vbiwgTWF5
IDQsIDIwMjYgYXQgMjoxN+KAr0FNIEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+IHdyb3RlOgo+ID4g
T24gRnJpIDAxLTA1LTI2IDE4OjU3OjUyLCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPiA+ID4gT24g
U2F0LCBNYXkgMDIsIDIwMjYgYXQgMDE6NDQ6MzRBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToK
PiA+ID4gPiBPbiBGcmksIE1heSAxLCAyMDI2IGF0IDEwOjU34oCvUE0gTWF0dGhldyBXaWxjb3gg
PHdpbGx5QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gT24gRnJpLCBNYXkgMDEsIDIw
MjYgYXQgMDY6NDk6NThBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+ID4gPiA+ID4gMS4g
VGhlcmUgaXMgbm8gZGV0ZXJtaW5pc3RpYyBsYXRlbmN5IGZvciBJL08gY29tcGxldGlvbi4gSXQg
ZGVwZW5kcyBvbgo+ID4gPiA+ID4gPiBib3RoIHRoZSBoYXJkd2FyZSBhbmQgdGhlIHNvZnR3YXJl
IHN0YWNrIChiaW8vcmVxdWVzdCBxdWV1ZXMgYW5kIHRoZQo+ID4gPiA+ID4gPiBibG9jayBzY2hl
ZHVsZXIpLiBTb21ldGltZXMgdGhlIGxhdGVuY3kgaXMgc2hvcnQ7IGF0IG90aGVyIHRpbWVzIGl0
IGNhbgo+ID4gPiA+ID4gPiBiZSBxdWl0ZSBsb25nLiBJbiBzdWNoIGNhc2VzLCBhIGhpZ2gtcHJp
b3JpdHkgdGhyZWFkIHBlcmZvcm1pbmcgb3BlcmF0aW9ucwo+ID4gPiA+ID4gPiBzdWNoIGFzIG1w
cm90ZWN0LCB1bm1hcCwgcHJjdGxfc2V0X3ZtYSwgb3IgbWFkdmlzZSBtYXkgYmUgZm9yY2VkIHRv
IHdhaXQKPiA+ID4gPiA+ID4gZm9yIGFuIHVucHJlZGljdGFibGUgYW1vdW50IG9mIHRpbWUuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gQnV0IGRvZXMgdGhhdCBhY3R1YWxseSBoYXBwZW4/ICBJIGZpbmQg
aXQgaGFyZCB0byBiZWxpZXZlIHRoYXQgdGhyZWFkIEEKPiA+ID4gPiA+IHVubWFwcyBhIFZNQSB3
aGlsZSB0aHJlYWQgQiBpcyBpbiB0aGUgbWlkZGxlIG9mIHRha2luZyBhIHBhZ2UgZmF1bHQgaW4K
PiA+ID4gPiA+IHRoYXQgc2FtZSBWTUEuICBtcHJvdGVjdCgpIGFuZCBtYWR2aXNlKCkgYXJlIG1v
cmUgbGlrZWx5IHRvIGhhcHBlbiwgYnV0Cj4gPiA+ID4gPiBpdCBzdGlsbCBzZWVtcyByZWFsbHkg
dW5saWtlbHkgdG8gbWUuCj4gPiA+ID4KPiA+ID4gPiBJdCBkb2VzbuKAmXQgaGF2ZSB0byBpbnZv
bHZlIHVubWFwcGluZyBvciBhcHBseWluZyBtcHJvdGVjdCB0bwo+ID4gPiA+IHRoZSBlbnRpcmUg
Vk1B4oCUanVzdCBhIHBvcnRpb24gb2YgaXQgaXMgc3VmZmljaWVudC4KPiA+ID4KPiA+ID4gWWVz
LCBidXQgdGhhdCBzdGlsbCBmYWlscyB0byBhbnN3ZXIgImRvZXMgdGhpcyBhY3R1YWxseSBoYXBw
ZW4iLiAgSG93IG11Y2gKPiA+ID4gcGVyZm9ybWFuY2UgaXMgYWxsIHRoaXMgY29tcGxleGl0eSBp
biB0aGUgcGFnZSBmYXVsdCBoYW5kbGVyIGJ1eWluZyB1cz8KPiA+ID4gSWYgeW91IGRvbid0IGFu
c3dlciB0aGlzIHF1ZXN0aW9uLCBJJ20ganVzdCBnb2luZyB0byBnbyBpbiBhbmQgcmlwIGl0Cj4g
PiA+IGFsbCBvdXQuCj4gPgo+ID4gSSBmdWxseSBhZ3JlZSB3aXRoIHlvdSB3ZSBzaG91bGQgdmVy
aWZ5IHdoZXRoZXIgdGhlIHJldHJ5IGNvZGUgc3RpbGwgYnJpbmdzCj4gPiBpbiByZWFsLXdvcmxk
IGFkdmFudGFnZSB0b2RheSB3aXRoIFZNQSBsb2Nrcy4gQWZ0ZXIgYWxsIHRoZSByZXRyeSBsb2dp
YyBoYXMKPiA+IGJlZW4gaW50cm9kdWNlZCBpbiAyMDEwLiBUaGF0IGJlaW5nIHNhaWQgaWYgdGhl
cmUgYXJlIHJlYWxpc3RpYyBsb2FkcyB3aGVyZQo+ID4gb25lIHRocmVhZCBuZWVkcyBWTUEgd3Jp
dGUgbG9jayB3aGlsZSBhbm90aGVyIHRocmVhZCBpcyBmYXVsdGluZyB0aGUgVk1BLAo+ID4gdGhl
biB0aGUgbGF0ZW5jaWVzIGNhbiBiZSBpbmRlZWQgZXh0cmVtZS4gRm9yIGV4YW1wbGUgdGhpbmdz
IGxpa2UgY2dyb3VwIElPCj4gPiB0aHJvdHRsaW5nIGhhcHBlbiBvbiB0aGUgSU8gcGF0aCBhbmQg
dGh1cyBjYW4gdGhyb3R0bGUgSU8gb2YgYSBsb3ctcHJpb3JpdHkKPiA+IHRocmVhZCBmb3IgYSBs
b25nIHRpbWUuCj4gCj4gSeKAmW0gcXVpdGUgc3VyZSB0aGF0IHN3YXAtaW4gYW5kIFZNQSB3cml0
ZXMgY2FuIG9jY3VyCj4gY29uY3VycmVudGx5LCBhbmQgdGhpcyBpcyBmYWlybHkgY29tbW9uLiBG
b3IgZXhhbXBsZSwKPiBKYXZhIEdDIG1heSB1c2UgbXByb3RlY3Qgb3IgdXNlcmZhdWx0ZmQgb24g
YSBzbWFsbAo+IHBvcnRpb24gb2YgYSBsYXJnZSBKYXZhIGhlYXAgd2hpbGUgb3RoZXIgcG9ydGlv
bnMgYXJlCj4gc3RpbGwgdW5kZXIgZG9fc3dhcF9wYWdlKCkuCgpPSywgbWFrZXMgc2Vuc2UuCgo+
IElmIHdlIHN0YXJ0IGV4cGxvcmluZyBkaWZmZXJlbnQgYXBwcm9hY2hlcyBmb3IgYW5vbiBhbmQK
PiBmaWxlLCBJIGFncmVlIEkgY2FuIHJldmlzaXQgdGhpcyBvbiBhbiBBbmRyb2lkIHBob25lIGlm
Cj4gdGhlcmUgaXMgYSByZWFsLCBzZXJpb3VzIGNhc2Ugd2hlcmUgYSBmaWxlIFZNQSBjYW4gYmUK
PiB3cml0dGVuIGFuZCBhIHBhZ2UgZmF1bHQgb2NjdXJzIGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4g
UGxlYXNlIG5vdGUgdGhhdCwgYXMgYW4gQW5kcm9pZCBkZXZlbG9wZXIsIEkgYW0gcGFydGljdWxh
cmx5Cj4gY2F1dGlvdXMgYWJvdXQgcHJpb3JpdHkgaW52ZXJzaW9uLiBBIHJlY2VudCBpc3N1ZSBj
YXVzaW5nCj4gc2V2ZXJlIHByaW9yaXR5IGludmVyc2lvbiBpcyB6cmFtIGF0dGVtcHRpbmcgdG8g
c3VwcG9ydAo+IHByZWVtcHRpb25bMV0uIFdoZW4gYSB0YXNrIHBlcmZvcm1pbmcgY29tcHJlc3Np
b24gb3IKPiBkZWNvbXByZXNzaW9uIGlzIG1pZ3JhdGVkIHRvIGFub3RoZXIgQ1BVIGFuZCB0aGVu
IHByZWVtcHRlZAo+IGJ5IG90aGVyIHRhc2tzLCBoaWdoLXByaW9yaXR5IHRhc2tzIHdhaXRpbmcg
b24gdGhlIG11dGV4IG1heQo+IGJlIHNpZ25pZmljYW50bHkgZGVsYXllZCwgaW1wYWN0aW5nIHVz
ZXIgZXhwZXJpZW5jZS4KCldlbGwsIGNvbnRhaW5lciBwZW9wbGUgYXJlIGNvbmNlcm5lZCBhYm91
dCBwcmlvcml0eSBpbnZlcnNpb24gYXMgd2VsbC4gQnV0CnVzdWFsbHkgdGhpcyBpcyB3aXRoIGNv
YXJzZSBsb2NrIChzdWNoIGFzIGdsb2JhbCBmaWxlc3lzdGVtIGxvY2tzKSBidXQgVk1BCmxvY2sg
aXMgc3BlY2lmaWMgdG8gYSB0YXNrIChhbmQgYSBWTUEpIHNvIHRoZXJlIHRoZSBvcHBvcnR1bml0
eSBmb3IKcHJpb3JpdHkgaW52ZXJzaW9uIGxvb2tzIG1vcmUgbGltaXRlZC4gIEJ1dCB0aGUgZXhh
bXBsZSB3aXRoIEphdmEgd2hlcmUgR0MKdGhyZWFkIGNhbiBwcmVzdW1hYmx5IGhhdmUgaGlnaGVy
IHByaW9yaXR5IHRoYW4gb3JkaW5hcnkgSmF2YSB0aHJlYWRzIGlzIGFuCmludGVyZXN0aW5nIG9u
ZS4KCj4gPiBCVFcgSSdtIG5vdCBzdXJlIEkgcXVpdGUgdW5kZXJzdGFuZCBCYXJyeSdzIHByaW9y
aXR5IGludmVyc2lvbiBwcm9ibGVtCj4gPiBzaW5jZSBJJ2QgZXhwZWN0IGFsbCB0aHJlYWRzIG9m
IGEgdGFzayB0byBnZW5lcmFsbHkgYmUgdHJlYXRlZCB3aXRoIHRoZQo+ID4gc2FtZSBwcmlvcml0
eS4uLgo+IAo+IEV4YWN0bHkgbm90LiBNYXliZSB0aGVzZSBzbGlkZXNbMl0gYW5kIHRoaXMgcHJv
amVjdFszXSBjYW4gZ2l2ZQo+IHlvdSBhIGhpbnTigJR0aGV5IGFpbSB0byBzdGFuZGFyZGl6ZSB0
aGluZ3Mgb24gTGludXggYnkKPiBsZWFybmluZyBmcm9tIEFwcGxlIE9TLiBCYXNpY2FsbHksIHRh
c2tzIGFyZSBjbGFzc2lmaWVkCj4gaW50byBmaXZlIHR5cGVzOgo+IAo+IFVTRVJfSU5URVJBQ1RJ
VkU6IFJlcXVpcmVzIGltbWVkaWF0ZSByZXNwb25zZS4KPiBVU0VSX0lOSVRJQVRFRDogVG9sZXJh
dGVzIGEgc2hvcnQgZGVsYXksIGJ1dCBtdXN0IHJlc3BvbmQgcXVpY2tseSBzdGlsbC4KPiBVVElM
SVRZOiBUb2xlcmF0ZXMgbG9uZyBkZWxheXMsIGJ1dCBub3QgcHJvbG9uZ2VkIG9uZXMuCj4gQkFD
S0dST1VORDogRG9lc27igJl0IG1pbmQgcHJvbG9uZ2VkIGRlbGF5cy4KPiBERUZBVUxUOiBTeXN0
ZW0gZGVmYXVsdCBiZWhhdmlvci4KCkFnYWluLCB0aGlzIGlzIGEgY2xhc2lmaWNhdGlvbiBvZiB0
YXNrcyBidXQgbm90IHJlYWxseSBvZiB0aHJlYWRzIGluIGEgdGFzawpzbyBhdCBsZWFzdCBmb3Ig
Vk1BIGxvY2sgdGhlcmUncyBubyBpbnZlcnNpb24gc28gaGF2ZT8KCgkJCQkJCQkJSG9uemEKCj4g
WzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1tLzIwMjUwMzAzMDIyNDI1LjI4NTk3
MS0zLXNlbm96aGF0c2t5QGNocm9taXVtLm9yZy8KPiBbMl0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2
ZW50LzE5L2NvbnRyaWJ1dGlvbnMvMjA4OS9hdHRhY2htZW50cy8xNzk3LzM4NzcvVXNlcnNwYWNl
JTIwQXNzaXN0ZWQlMjBTY2hlZHVsaW5nJTIwdmlhJTIwU2NoZWQlMjBRb1MucGRmCj4gWzNdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjA0MTUwMDA5MTAuMmg1bWlzdndjNDViZHVt
dUBhaXJidW50dS8KLS0gCkphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
