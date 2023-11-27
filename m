Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF5C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqeTMbFjc8lvktgrz1Z/IgE6CYU3VRULXlgxHE3NZZg=; b=ytXYV78sMM1uQ8
	uVvU0SbOxOZIF3MrRaUUkcU2Cv6prGDOes+HmIOyvnjyamPAmLEvZk9myW/80dRnEY/UNuGrmZ0qN
	cuRegiuQf9+KkAskfjl2ThcwfGmyPbn3NwaLbK+H3gVJ0WcPsTw0GRTWG2MC9uUFb2zGquZNJD1xh
	pteM1QhlnTF4waDTgWAvq7iaie0Y1s3To1zBfAxK732vIAf3uVObzCAU+zauuvJIPXB1HtiI/uTUy
	WZatuD3w5Ed6YjFWdDomIkdfmeJm58Ib5LgghQFloNzGe0m/o88YZVi3pW2dAhktnLN1wCxtdic21
	LowrDeD3TYqxyaMKAciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7dzT-002tNb-2b;
	Mon, 27 Nov 2023 15:57:43 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ZYy-002BCm-2m;
	Mon, 27 Nov 2023 11:14:09 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E414521C6F;
	Mon, 27 Nov 2023 11:13:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C5491367B;
	Mon, 27 Nov 2023 11:13:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pc/rIfd5ZGXRZQAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Mon, 27 Nov 2023 11:13:59 +0000
Message-ID: <81628606-ca9b-866f-5e71-91001e856871@suse.cz>
Date: Mon, 27 Nov 2023 12:13:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v13 17/35] KVM: Add transparent hugepage support for
 dedicated guest memory
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>,
 David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>,
 Maciej Szmigiero <mail@maciej.szmigiero.name>,
 David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
 Liam Merwick <liam.merwick@oracle.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
References: <20231027182217.3615211-18-seanjc@google.com>
 <7c0844d8-6f97-4904-a140-abeabeb552c1@intel.com>
 <ZUEML6oJXDCFJ9fg@google.com>
 <92ba7ddd-2bc8-4a8d-bd67-d6614b21914f@intel.com>
 <ZUJVfCkIYYFp5VwG@google.com>
 <CABgObfaw4Byuzj5J3k48jdwT0HCKXLJNiuaA9H8Dtg+GOq==Sw@mail.gmail.com>
 <ZUJ-cJfofk2d_I0B@google.com>
 <4ca2253d-276f-43c5-8e9f-0ded5d5b2779@redhat.com>
 <ZULSkilO-tdgDGyT@google.com>
 <CABgObfbq_Hg0B=jvsSDqYH3CSpX+RsxfwB-Tc-eYF4uq2Qw9cg@mail.gmail.com>
 <ZUPCWfO1iO77-KDA@google.com>
 <CABgObfa=DH7FySBviF63OS9sVog_wt-AqYgtUAGKqnY5Bizivw@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CABgObfa=DH7FySBviF63OS9sVog_wt-AqYgtUAGKqnY5Bizivw@mail.gmail.com>
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=none;
	spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither permitted nor denied by domain of vbabka@suse.cz) smtp.mailfrom=vbabka@suse.cz
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.89 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 R_SPF_SOFTFAIL(4.60)[~all];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(1.20)[suse.cz];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 RCPT_COUNT_TWELVE(0.00)[44];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[intel.com,kernel.org,linux.dev,ellerman.id.au,brainfault.org,sifive.com,dabbelt.com,eecs.berkeley.edu,zeniv.linux.org.uk,infradead.org,linux-foundation.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,kvack.org,linux.intel.com,google.com,digikod.net,maciej.szmigiero.name,redhat.com,amd.com,oracle.com,gmail.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Queue-Id: E414521C6F
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_031405_255493_94758A6B 
X-CRM114-Status: GOOD (  22.16  )
X-Mailman-Approved-At: Mon, 27 Nov 2023 07:57:40 -0800
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

T24gMTEvMi8yMyAxNjo0NiwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiBUaHUsIE5vdiAyLCAy
MDIzIGF0IDQ6MzjigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4g
d3JvdGU6Cj4+IEFjdHVhbGx5LCBsb29raW5nIHRoYXQgdGhpcyBhZ2FpbiwgdGhlcmUncyBub3Qg
YWN0dWFsbHkgYSBoYXJkIGRlcGVuZGVuY3kgb24gVEhQLgo+PiBBIFRIUC1lbmFibGVkIGtlcm5l
bCBfcHJvYmFibHlfICBnaXZlcyBhIGhpZ2hlciBwcm9iYWJpbGl0eSBvZiB1c2luZyBodWdlcGFn
ZXMsCj4+IGJ1dCBtb3N0bHkgYmVjYXVzZSBUSFAgc2VsZWN0cyBDT01QQUNUSU9OLCBhbmQgSSBz
dXBwb3NlIGJlY2F1c2UgdXNpbmcgVEhQIGZvcgo+PiBvdGhlciBhbGxvY2F0aW9ucyByZWR1Y2Vz
IG92ZXJhbGwgZnJhZ21lbnRhdGlvbi4KPiAKPiBZZXMsIHRoYXQncyB3aHkgSSBkaWRuJ3QgZXZl
biBib3RoZXIgZW5hYmxpbmcgaXQgdW5sZXNzIFRIUCBpcwo+IGVuYWJsZWQsIGJ1dCBpdCBtYWtl
cyBldmVuIG1vcmUgc2Vuc2UgdG8ganVzdCB0cnkuCj4gCj4+IFNvIHJhdGhlciB0aGFuIGhvbm9y
IEtWTV9HVUVTVF9NRU1GRF9BTExPV19IVUdFUEFHRSBpZmYgVEhQIGlzIGVuYWJsZWQsIEkgdGhp
bmsKPj4gd2Ugc2hvdWxkIGRvIHRoZSBiZWxvdyAoSSB2ZXJpZmllZCBLVk0gY2FuIGNyZWF0ZSBo
dWdlcGFnZXMgd2l0aCBUSFA9bikuICBXZSdsbAo+PiBuZWVkIGFub3RoZXIgY2FwYWJpbGl0eSwg
YnV0IChhKSB3ZSBwcm9iYWJseSBzaG91bGQgaGF2ZSB0aGF0IGFueXdheXMgYW5kIChiKSBpdAo+
PiBwcm92aWRlcyBhIGNsZWFuZXIgcGF0aCB0byBhZGRpbmcgUFVELXNpemVkIGh1Z2VwYWdlIHN1
cHBvcnQgaW4gdGhlIGZ1dHVyZS4KPiAKPiBJIHdvbmRlciBpZiB3ZSBuZWVkIEtWTV9DQVBfR1VF
U1RfTUVNRkRfSFVHRVBBR0VfUE1EX1NJWkUgdGhvdWdoLiBUaGlzCj4gc2hvdWxkIGJlIGEgZ2Vu
ZXJpYyBrZXJuZWwgQVBJIGFuZCBpbiBmYWN0IHRoZSBzaXplcyBhcmUgYXZhaWxhYmxlIGluCj4g
YSBub3Qtc28tZnJpZW5kbHkgZm9ybWF0IGluIC9zeXMva2VybmVsL21tL2h1Z2VwYWdlcy4KPiAK
PiBXZSBzaG91bGQganVzdCBhZGQgL3N5cy9rZXJuZWwvbW0vaHVnZXBhZ2VzL3NpemVzIHRoYXQg
Y29udGFpbnMKPiAiMjA5NzE1MiAxMDczNzQxODI0IiBvbiB4ODYgKG9ubHkgdGhlIGZvcm1lciBp
ZiAxRyBwYWdlcyBhcmUgbm90Cj4gc3VwcG9ydGVkKS4KPiAKPiBQbHVzOiBpcyB0aGlzIHRoZSBi
ZXN0IEFQSSBpZiB3ZSBuZWVkIHNvbWV0aGluZyBlbHNlIGZvciAxRyBwYWdlcz8KPiAKPiBMZXQn
cyBkcm9wICp0aGlzKiBwYXRjaCBhbmQgcHJvY2VlZCBpbmNyZW1lbnRhbGx5LiAoQWdhaW4sIHRo
aXMgaXMKPiB3aGF0IEkgd2FudCB0byBkbyB3aXRoIHRoaXMgZmluYWwgcmV2aWV3OiBpZGVudGlm
eSBwbGFjZXMgdGhhdCBhcmUKPiBzdGlsIHN0aWNreSwgYW5kIGRvbid0IGxldCB0aGVtIGJsb2Nr
IHRoZSByZXN0KS4KPiAKPiBDb2luY2lkZW50aWFsbHkgd2UgaGF2ZSBhbiBvcGVuIHNwb3QgbmV4
dCB3ZWVrIGF0IHBsdW1iZXJzLiBMZXQncwo+IGV4dGVuZCBGdWFkJ3Mgc2VjdGlvbiB0byBjb3Zl
ciBtb3JlIGd1ZXN0bWVtIHdvcmsuCgpIaSwKCndhcyB0aGVyZSBhbnkgb3V0Y29tZSB3cnQgdGhp
cyBvbmU/IEJhc2VkIG9uIG15IGV4cGVyaWVuY2Ugd2l0aCBUSFAncyBpdAp3b3VsZCBiZSBiZXN0
IGlmIHVzZXJzcGFjZSBkaWRuJ3QgaGF2ZSB0byBvcHQtaW4sIG5vciBjYXJlIGFib3V0IHRoZQpz
dXBwb3J0ZWQgc2l6ZS4gSWYgdGhlIGdpdmVuIHNpemUgaXMgdW5hbGlnbmVkLCBwcm92aWRlIGEg
bWl4IG9mIGxhcmdlIHBhZ2VzCnVwIHRvIGFuIGFsaWduZWQgc2l6ZSwgYW5kIGZvciB0aGUgcmVz
dCBmYWxsYmFjayB0byBiYXNlIHBhZ2VzLCB3aGljaCBzaG91bGQKYmUgYmV0dGVyIHRoYW4gLUVJ
TlZBTCBvbiBjcmVhdGlvbiAoaXMgaXQgcG9zc2libGUgd2l0aCB0aGUgY3VycmVudAppbXBsZW1l
bnRhdGlvbj8gSSdkIGhvcGUgc28gc28/KS4gQSB3YXkgdG8gb3B0LW91dCBmcm9tIGh1Z2UgcGFn
ZXMgY291bGQgYmUKdXNlZnVsIGFsdGhvdWdoIHRoZXJlJ3MgYWx3YXlzIHRoZSByaXNrIG9mIHNv
bWUgaW5pdGlhbCB0cm91YmxlcyByZXN1bHRpbmcKaW4gdmFyaW91cyBvbmxpbmUgc291cmNlcyBj
YXJnby1jdWx0IHJlY29tbWVuZGluZyB0byBvcHQtb3V0IGZvcmV2ZXIuCgpWbGFzdGltaWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
