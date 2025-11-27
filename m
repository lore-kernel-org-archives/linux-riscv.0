Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68630D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 16:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4G4XothQckVuDhrXBr0fasqgVSEsWjliBOZEhoQQNAw=; b=e/YEQQubVd+OKD
	iDT0HKeaD7UCbdLLkGoEiqVFqve2021pzeZy9aDUNlM1PJg6l1cxNCP7xTdlSPU0nD64T5XIJb1Tp
	ZUvMMPw9K5R0fXm/bH6jrAAkylouVy1CPuhFReAPUcboHW+/OC127noFHLFP0tlYDwE4LYRPg352s
	zRAc2S5/SQmVoLoKu4tDMcK6v/T6hCLB7zzgNrO3/io9o2oF6fpQBkY0UVQq27SBarTnIsuHo0M6H
	7sgBvFSUDx2JAUnGF8fuJ/z9pstIKzj/30OxzA4P5bzI9RrEEfzJ9ubt6fNTcjd3yBplZndHfCIxO
	MLlX5n5EIs7JkmCWGrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOepM-0000000GvTJ-1SpI;
	Thu, 27 Nov 2025 16:26:40 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOepJ-0000000GvSb-3rer
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 16:26:39 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DBDA35BCD0;
	Thu, 27 Nov 2025 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764260796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	b=ZHiiaKMUmjNdWcVAx8mYcgTlMl1TOlhTMWZHQjR+94hOuoktlCF9vmt31KXPM4+AcFl+pM
	EQgq43Z+eyMXp1+L5gFoiJEpmRbbniA6s9GdZ1rmPu04VKmEjGTUMyqxUcB4zAZ5XtFJgp
	RojEOrR6fk/DRDLpX/+/5ENN40+0B+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764260796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	b=yfppcghBR1WbD5x+jBg3untex+AQq3wnFzjWFxXVpWHFw2mYcqeYp/H38fj1sxNVgS1Tt/
	LQjfOIwvDgidrnBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764260795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	b=zEaMcsMO1K/qzdMAPBBEFSsamoUnY7luJn2W4Su9EbhFLsy+LsjJb4eG4bRMTQ+zsek9le
	+0DPoFYxdw+c3R1+NwqBJZQXT1fWUIabhWrbGMgK5bu7ot2yykBkgkoPQpaDgCf7dNM0g2
	SM/dRSvFRjf6UO1K0wHfczBMDnnbqmY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764260795;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yuMiS1EJ+aLGYrc/rNjM/OAOkdGlczkOx6GMs+RJ+u0=;
	b=i378ebTyzO87EOksHlUeGilkDnovXrO3fX9hNSy4tcFTkNCwjal395WIRU7eDS7gb4PIcX
	CKMGNmDhxrj2L1Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1DDE43EA63;
	Thu, 27 Nov 2025 16:26:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pdD/A7h7KGnRfwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 27 Nov 2025 16:26:32 +0000
Date: Thu, 27 Nov 2025 16:26:30 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	Oven Liyang <liyangouwen1@oppo.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Matthew Wilcox <willy@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ada Couprie Diaz <ada.coupriediaz@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	Wentao Guan <guanwentao@uniontech.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Steven Rostedt <rostedt@goodmis.org>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Nam Cao <namcao@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <v-songbaohua@oppo.com>
Subject: Re: [RFC PATCH 1/2] mm/filemap: Retry fault by VMA lock if the lock
 was released for I/O
Message-ID: <kzwpwntmta4bpt27stif2hs5cwlu54kayfi34o562jpr2mjbew@h3ddkbxibxhf>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <20251127011438.6918-2-21cnbao@gmail.com>
 <5by7tko4v3kqvvpu4fdsgpw42yl5ed5qisbaz3la4an52hq4j2@v75fagey6gva>
 <CAGsJ_4xQKARuEuhrVuV+WmBC7+NCNd==Zi9nGmze5mfSjF1kdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4xQKARuEuhrVuV+WmBC7+NCNd==Zi9nGmze5mfSjF1kdw@mail.gmail.com>
X-Spamd-Result: default: False [-7.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kvack.org,oppo.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,linutronix.de,redhat.com,alien8.de,zytor.com,oracle.com,suse.cz,google.com,suse.com,suse.de,renesas.com,uniontech.com,linux.dev,goodmis.org,bytedance.com,lists.infradead.org,vger.kernel.org,lists.linux.dev,lists.ozlabs.org,tencent.com,huaweicloud.com];
	R_RATELIMIT(0.00)[to_ip_from(RL3mhzhn45zpqpmgqn4z7synfm)];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oppo.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_082638_134188_FAB91906 
X-CRM114-Status: GOOD (  34.57  )
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

T24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMDc6Mzk6MTFQTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBPbiBUaHUsIE5vdiAyNywgMjAyNSBhdCA2OjUy4oCvUE0gUGVkcm8gRmFsY2F0byA8cGZh
bGNhdG9Ac3VzZS5kZT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMDk6
MTQ6MzdBTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiA+ID4gRnJvbTogT3ZlbiBMaXlhbmcg
PGxpeWFuZ291d2VuMUBvcHBvLmNvbT4KPiA+ID4KPiA+ID4gSWYgdGhlIGN1cnJlbnQgcGFnZSBm
YXVsdCBpcyB1c2luZyB0aGUgcGVyLVZNQSBsb2NrLCBhbmQgd2Ugb25seSByZWxlYXNlZAo+ID4g
PiB0aGUgbG9jayB0byB3YWl0IGZvciBJL08gY29tcGxldGlvbiAoZS5nLiwgdXNpbmcgZm9saW9f
bG9jaygpKSwgdGhlbiB3aGVuCj4gPiA+IHRoZSBmYXVsdCBpcyByZXRyaWVkIGFmdGVyIHRoZSBJ
L08gY29tcGxldGVzLCBpdCBzaG91bGQgc3RpbGwgcXVhbGlmeSBmb3IKPiA+ID4gdGhlIHBlci1W
TUEtbG9jayBwYXRoLgo+ID4gPgo+ID4gPHNuaXA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE92ZW4g
TGl5YW5nIDxsaXlhbmdvdXdlbjFAb3Bwby5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnJ5
IFNvbmcgPHYtc29uZ2Jhb2h1YUBvcHBvLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBhcmNoL2FybS9t
bS9mYXVsdC5jICAgICAgIHwgNSArKysrKwo+ID4gPiAgYXJjaC9hcm02NC9tbS9mYXVsdC5jICAg
ICB8IDUgKysrKysKPiA+ID4gIGFyY2gvbG9vbmdhcmNoL21tL2ZhdWx0LmMgfCA0ICsrKysKPiA+
ID4gIGFyY2gvcG93ZXJwYy9tbS9mYXVsdC5jICAgfCA1ICsrKystCj4gPiA+ICBhcmNoL3Jpc2N2
L21tL2ZhdWx0LmMgICAgIHwgNCArKysrCj4gPiA+ICBhcmNoL3MzOTAvbW0vZmF1bHQuYyAgICAg
IHwgNCArKysrCj4gPiA+ICBhcmNoL3g4Ni9tbS9mYXVsdC5jICAgICAgIHwgNCArKysrCj4gPgo+
ID4gSWYgb25seSB3ZSBjb3VsZCB1bmlmeSBhbGwgdGhlc2UgcGF0aHMgOigKPiAKPiBSaWdodCwg
aXTigJlzIGEgcGFpbiwgYnV0IHdlIGRvIGhhdmUgYm90cyBmb3IgdGhhdD8KPiBBbmQgaXTigJlz
IGJhc2ljYWxseSBqdXN0IGNvcHktYW5kLXBhc3RlIGFjcm9zcyBkaWZmZXJlbnQgYXJjaGl0ZWN0
dXJlcy4KPiAKPiA+Cj4gPiA+ICBpbmNsdWRlL2xpbnV4L21tX3R5cGVzLmggIHwgOSArKysrKy0t
LS0KPiA+ID4gIG1tL2ZpbGVtYXAuYyAgICAgICAgICAgICAgfCA1ICsrKystCj4gPiA+ICA5IGZp
bGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmggYi9pbmNsdWRlL2xpbnV4L21t
X3R5cGVzLmgKPiA+ID4gaW5kZXggYjcxNjI1Mzc4Y2UzLi4xMmIyZDY1ZWYxYjkgMTAwNjQ0Cj4g
PiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbW1fdHlwZXMuaAo+ID4gPiArKysgYi9pbmNsdWRlL2xp
bnV4L21tX3R5cGVzLmgKPiA+ID4gQEAgLTE2NzAsMTAgKzE2NzAsMTEgQEAgZW51bSB2bV9mYXVs
dF9yZWFzb24gewo+ID4gPiAgICAgICBWTV9GQVVMVF9OT1BBR0UgICAgICAgICA9IChfX2ZvcmNl
IHZtX2ZhdWx0X3QpMHgwMDAxMDAsCj4gPiA+ICAgICAgIFZNX0ZBVUxUX0xPQ0tFRCAgICAgICAg
ID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkweDAwMDIwMCwKPiA+ID4gICAgICAgVk1fRkFVTFRfUkVU
UlkgICAgICAgICAgPSAoX19mb3JjZSB2bV9mYXVsdF90KTB4MDAwNDAwLAo+ID4gPiAtICAgICBW
TV9GQVVMVF9GQUxMQkFDSyAgICAgICA9IChfX2ZvcmNlIHZtX2ZhdWx0X3QpMHgwMDA4MDAsCj4g
PiA+IC0gICAgIFZNX0ZBVUxUX0RPTkVfQ09XICAgICAgID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkw
eDAwMTAwMCwKPiA+ID4gLSAgICAgVk1fRkFVTFRfTkVFRERTWU5DICAgICAgPSAoX19mb3JjZSB2
bV9mYXVsdF90KTB4MDAyMDAwLAo+ID4gPiAtICAgICBWTV9GQVVMVF9DT01QTEVURUQgICAgICA9
IChfX2ZvcmNlIHZtX2ZhdWx0X3QpMHgwMDQwMDAsCj4gPiA+ICsgICAgIFZNX0ZBVUxUX1JFVFJZ
X1ZNQSAgICAgID0gKF9fZm9yY2Ugdm1fZmF1bHRfdCkweDAwMDgwMCwKPiA+Cj4gPiBTbywgd2hh
dCBJIGFtIHdvbmRlcmluZyBoZXJlIGlzIHdoeSB3ZSBuZWVkIG9uZSBtb3JlIGZhdWx0IGZsYWcg
dmVyc3VzCj4gPiBqdXN0IGJsaW5kbHkgZG9pbmcgdGhpcyBvbiBhIHBsYWluLW9sZCBSRVRSWS4g
SXMgdGhlcmUgYW55IHBhcnRpY3VsYXIKPiA+IHJlYXNvbiB3aHk/IEkgY2FuJ3QgdGhpbmsgb2Yg
b25lLgo+IAo+IEJlY2F1c2UgaW4gc29tZSBjYXNlcyB3ZSByZXRyeSBzaW1wbHkgZHVlIHRvIG5l
ZWRpbmcgdG8gdGFrZSBtbWFwX2xvY2suCj4gRm9yIGV4YW1wbGU6Cj4gCj4gLyoqCj4gICogX192
bWZfYW5vbl9wcmVwYXJlIC0gUHJlcGFyZSB0byBoYW5kbGUgYW4gYW5vbnltb3VzIGZhdWx0Lgo+
ICAqIEB2bWY6IFRoZSB2bV9mYXVsdCBkZXNjcmlwdG9yIHBhc3NlZCBmcm9tIHRoZSBmYXVsdCBo
YW5kbGVyLgo+ICAqCj4gICogV2hlbiBwcmVwYXJpbmcgdG8gaW5zZXJ0IGFuIGFub255bW91cyBw
YWdlIGludG8gYSBWTUEgZnJvbSBhCj4gICogZmF1bHQgaGFuZGxlciwgY2FsbCB0aGlzIGZ1bmN0
aW9uIHJhdGhlciB0aGFuIGFub25fdm1hX3ByZXBhcmUoKS4KPiAgKiBJZiB0aGlzIHZtYSBkb2Vz
IG5vdCBhbHJlYWR5IGhhdmUgYW4gYXNzb2NpYXRlZCBhbm9uX3ZtYSBhbmQgd2UgYXJlCj4gICog
b25seSBwcm90ZWN0ZWQgYnkgdGhlIHBlci1WTUEgbG9jaywgdGhlIGNhbGxlciBtdXN0IHJldHJ5
IHdpdGggdGhlCj4gICogbW1hcF9sb2NrIGhlbGQuICBfX2Fub25fdm1hX3ByZXBhcmUoKSB3aWxs
IGxvb2sgYXQgYWRqYWNlbnQgVk1BcyB0bwo+ICAqIGRldGVybWluZSBpZiB0aGlzIFZNQSBjYW4g
c2hhcmUgaXRzIGFub25fdm1hLCBhbmQgdGhhdCdzIG5vdCBzYWZlIHRvCj4gICogZG8gd2l0aCBv
bmx5IHRoZSBwZXItVk1BIGxvY2sgaGVsZCBmb3IgdGhpcyBWTUEuCj4gICoKPiAgKiBSZXR1cm46
IDAgaWYgZmF1bHQgaGFuZGxpbmcgY2FuIHByb2NlZWQuICBBbnkgb3RoZXIgdmFsdWUgc2hvdWxk
IGJlCj4gICogcmV0dXJuZWQgdG8gdGhlIGNhbGxlci4KPiAgKi8KPiB2bV9mYXVsdF90IF9fdm1m
X2Fub25fcHJlcGFyZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKPiB7Cj4gLi4uCj4gfQo+IAo+IFRo
dXMsIHdlIGhhdmUgdG8gY2hlY2sgZWFjaCBicmFuY2ggb25lIGJ5IG9uZSwgYnV0IEkvTyB3YWl0
IGlzIHRoZSBtb3N0Cj4gZnJlcXVlbnQgcGF0aCwgc28gd2UgaGFuZGxlIGl0IGZpcnN0Lgo+CgpI
bW0sIHJpZ2h0LCBnb29kIHBvaW50LiBJIHRoaW5rIHRoaXMgaXMgdGhlIHNhZmVzdCBvcHRpb24g
dGhlbi4KCkZXSVc6CkFja2VkLWJ5OiBQZWRybyBGYWxjYXRvIDxwZmFsY2F0b0BzdXNlLmRlPgoK
LS0gClBlZHJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
