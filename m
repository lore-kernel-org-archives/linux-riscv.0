Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561C9CD4F25
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RQhhHr5amBq+8YNxVaxPU6v9tukgMDWBmcSLRDmt1IY=; b=E02x0sx1rAe6I/
	emHI8FQjdWK9DaOjeanpsHdF5la0X6XnRCr9vut0MwVlN3wq8dyAr1YhO28wbPoB9kbJ+0F5eTuBU
	0WyTQID3GRrfnGpo6Qr0sklXblwySULwZJBkFklelIABPOq0aWnJtY6HA+mrbBBcVbj4rbLrFQ7QS
	xcgwdeAbvlVjmEUq+V1BPcYKA0XyZNDRJWmNctcuy9NaDdyUgOD5Vl2VHuOhp0JxS2nM/O+7F6OFK
	0kis52z5erbs17maTlYKGhmfXuwCGb/WQhiPesMnpqYYOf3zfbZrAQdR8FRW8yjXRVFQI7cTlQ9PO
	B/VJXuk2llYTcZPyPZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNttX-00000008cgz-0DZ0;
	Fri, 15 May 2026 14:52:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNttV-00000008cge-1G9S
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 14:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Reply-To:Message-ID:Subject:Cc:To:From:
	Date:Sender:Content-ID:Content-Description;
	bh=C1D/1YterPCnTmcPwmatqIt56Q+poHbCW9oYvcHSQ2M=; b=JvkmrGozrQD/Wz7M2hi5DuoPAQ
	9h1oBzlufBFLXcNakM+2o+rzgELLmNOo/aDUg+79sDqlWkqGsfRu5m2xmZZ1rT6PlAzux+nHZVt3f
	CHUasugkPnulQ8tCAV/N/04mFQg4hOssjnnj7vBmZAo9k8LQfo25rKDyppgl3cMlkM0ImCo9x9D0C
	9vBV+Ju/yWOvP/KTpCYcl0TQw2Yi4MUq3dCbUilKCZ7rZ+jTDBr91pgvgLA56UR8rb2lRCkvaxFxI
	LN81DT0MtPDj8ivdm1WO1qbP8Vf8ezlzrTqfHc38Tb43PYc6XKPIM7DUZgMJFszfee4l9pN1AntPd
	/Bw4NIVg==;
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNttS-00000005V0Y-0IRs
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:52:04 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B04666D5C;
	Fri, 15 May 2026 14:52:00 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 041E0593A9;
	Fri, 15 May 2026 14:52:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BdG/ABAzB2onPgAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Fri, 15 May 2026 14:52:00 +0000
Date: Fri, 15 May 2026 16:51:58 +0200
From: David Sterba <dsterba@suse.cz>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: kreijack@inwind.it, Goffredo Baroncelli <kreijack@libero.it>,
	Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
	Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
Message-ID: <20260515145158.GP2558453@suse.cz>
References: <20260512052230.2947683-1-hch@lst.de>
 <20260512052230.2947683-2-hch@lst.de>
 <20260512114231.GG2558453@suse.cz>
 <20260513054742.GA1018@lst.de>
 <0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
 <0507CCEF-0548-442F-8703-1D006B5E068B@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0507CCEF-0548-442F-8703-1D006B5E068B@zytor.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 4B04666D5C
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_155202_533372_D0D3E01E 
X-CRM114-Status: GOOD (  21.62  )
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTI6NTc6NTNQTSAtMDcwMCwgSC4gUGV0ZXIgQW52aW4g
d3JvdGU6Cj4gT24gTWF5IDE0LCAyMDI2IDEyOjUxOjU5IFBNIFBEVCwgR29mZnJlZG8gQmFyb25j
ZWxsaSA8a3JlaWphY2tAbGliZXJvLml0PiB3cm90ZToKPiA+T24gMTMvMDUvMjAyNiAwNy40Nywg
Q2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPj4gT24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMDE6
NDI6MzFQTSArMDIwMCwgRGF2aWQgU3RlcmJhIHdyb3RlOgo+ID4KPiA+PiAKPiA+Pj4gVGhlIGRl
Z2VuZXJhdGUgbW9kZXMgb2YKPiA+Pj4gcmFpZDAsIDUsIG9yIDYgYXJlIGV4cGxpY2l0IGFzIGEg
cG9zc2libGUgbWlkZGxlIHN0ZXAgd2hlbiBjb252ZXJ0aW5nCj4gPj4+IHByb2ZpbGVzLiAgV2Ug
Y2FuIHVzZSBhIGZhbGxiYWNrIGltcGxlbWVudGF0aW9uIGZvciB0aGlzIGNhc2UgaWYgdGhlCj4g
Pj4+IGFjY2VsZXJhdGVkIGltcGxlbWVudGF0aW9ucyBjYW5ub3QgZG8gaXQuCj4gPj4gCj4gPj4g
VGhpcyBpcyBub3QgYWJvdXQgYSBkZWdlbmVyYXRlZCBtb2RlLiAgRm9yIGEgZGVnZW5lcmF0ZWQg
UkFJRCA2LCBwYXJpdHkKPiA+PiBnZW5lcmF0aW9uIHVzZXMgdGhlIFJBSUQgNSBYT1Igcm91dGlu
ZXMgYXMgdGhlIHNlY29uZCBwYXJpdHkgd2lsbCBiZQo+ID4+IG1pc3NpbmcuICBUaGlzIGlzIGFi
b3V0IGdlbmVyYXRpbmcgdHdvIHBhcml0aWVzIGZvciBhIHNpbmdsZSBkYXRhIGRpc2ssCj4gPj4g
d2hpY2ggbXVzdCBiZSBleHBsaWNpdGx5IHNlbGVjdGVkLgo+ID4+IAo+ID4KPiA+SSB0aGluayB0
aGF0IHRoZSBEYXZpZCBjb25jZXJuIGlzIDogIndoYXQgaGFwcGVucyBmb3IgYW4gYWxyZWFkeQo+
ID5leGlzdGluZyBidHJmcyByYWlkNiAzIGRpc2tzIGZpbGVzeXN0ZW0gd2hlbiB0aGUgdXNlciB1
cGdyYWRlIHRoZSBrZXJuZWwgPyIKPiA+KEkgYW0gdGhpbmtpbmcgd2hlbiBhIG5ldyBCRyBuZWVk
cyB0byBiZSBhbGxvY2F0ZWQpLi4uCj4gCj4gVGhhdCdzIHdoYXQgSSdtIHNheWluZyDigJMgaXQg
c2hvdWxkIGludm9rZSB0aGUgUkFJRC0xIGNvZGUgdW5kZXIgdGhlIGNvdmVyIChhcyB3aXRoIDMg
ZGlza3MsIEQgPSBQID0gUS4pCgpUaGFua3MsIGl0IHdhcyBub3QgY2xlYXIgdG8gbWUgd2hhdCB5
b3UgbWVhbnQuIEZvciB0aGUgdHdvIGVkZ2UgY2FzZXMKdGhlIGNvZGUgc2hvdWxkIGRvIHNpbXBs
ZSBtZW1jcHkgZm9yIGJvdGggY2FsY3VsYXRpb25zIG9mIHBhcml0eSBhbmQKcmVjb3ZlcnkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
