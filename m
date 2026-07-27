Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A45C53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 10:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5K/pttMcpx/vqI3RkcfW6XFrNRg/+vbPNIacUUZTza8=; b=Tu7dXhUMIytv4i
	JYB6ubxPX4HeVLDWPMA6Mm2bQhRb5ynvCu0tOP7dT1gi/Ye7IgJat2XqDpByWzmJwTF9X5rYa/jOV
	9aDCdGvJlpWBsVqqWBcdq81fqDvRAsQY2tnx8Ryncoq8NrFtH3ma6RLCGJhVLSsQK5s7oViQcITt7
	p5qDBAT9Yohss5YlwRR+6L147IGABM/ONgKv6n4Wu6BkBGhIk0NReF+YxUEikLWZ1mcgkOQlI42yv
	ARA1swdK58RfFkm2Gf2B/w1C1OJNVjyRloJiwT8p7rqeQ4dw6B6Zzvvr8JOt7iEoVA5BVo+RPH8cP
	v/ZeJET2NzA5onIaeIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woINe-00000002SS1-1qB9;
	Mon, 27 Jul 2026 10:16:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woINc-00000002SRE-3eY1;
	Mon, 27 Jul 2026 10:16:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2746F601ED;
	Mon, 27 Jul 2026 10:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0021F000E9;
	Mon, 27 Jul 2026 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147375;
	bh=aPvuz+aL88c21S8YC4GLGVYZg37SgTBgz+cPgSwl5YY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aeXLGKxn+RhuEpjDFbt/ECV2BxYK5diVi7xVn6tULU7vDF7IK7Nil1nVqd/uTLs0a
	 j54JY+fifjoQHmXB9CR+jCM4rvP6pUcAJpAIgW91yTz1VWA8cFXD1DZoURmpEUqlBo
	 Tq8KvwKyQ4fOEXf51Jdb/5lt35sWrjNBv7X3ON5nEjg++ndjFL8fdwh7RQt7DAiufK
	 NEu++wGQ+modaUWU4wmPBGb6eEqXBiiWFcOGq4t079CkA4z0301GVt3RVtw+hHhHy4
	 jlT37q6tmmybvVR0a4m6cIFpSFH0potJvfTJYgzoIW0uyrUmfcVfT1diLwjHu9fMt5
	 gbvr2kjjgFHYQ==
Date: Mon, 27 Jul 2026 13:16:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: linux-mm@kvack.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
Message-ID: <amcv4Q_jxriraFzU@kernel.org>
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
 <amDe_3KFBc9CcIbo@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <amDe_3KFBc9CcIbo@google.com>
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

SGkgQWRyaWFuLAoKT24gV2VkLCBKdWwgMjIsIDIwMjYgYXQgMDM6MTc6MTlQTSArMDAwMCwgQWRy
aWFuIEJhcm5hxZsgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgMDc6MjM6MjNQTSAr
MDMwMCwgTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSB3cm90ZToKPiAKPiBIaSBNaWtlLAo+IAo+
ID4gT25jZSB0aGlzIHNldHRsZXMsIHRoZSBuZXh0IHN0ZXAgSSdtIHBsYW5uaW5nIGlzIHRvIGNv
bnZlcnQgYXJtNjQuIFRoaXMKPiA+IHdvdWxkIGJlIG11Y2ggbW9yZSBpbnZvbHZlZCB0aGFuIGxv
b25nYXJjaCBhbmQgcmlzY3YgdG9nZXRoZXIsIHNvIEkKPiA+IGRpZG4ndCBldmVuIGFzcGlyZSB0
byBpbmNsdWRlIGFybTY0IGluIHRoZSBmaXJzdCBSRkMuIFRoYXQgc2FpZCwgSSBoYXZlCj4gPiBh
IHZlcnkgdWdseSBhcm02NCBwcm90b3R5cGUgdGhhdCByZXdyaXRlcyBhcmNoL2FybTY0L3BhZ2Vh
dHRyLmMgdG8gdXNlCj4gPiB0aGUgZ2VuZXJpYyBDUEEgaW5mcmFzdHJ1Y3R1cmUgYW5kIHJlcGxh
Y2VzIHRoZSBleGlzdGluZyBpbXBsZW1lbnRhdGlvbgo+ID4gb2YgcGFnZSB0YWJsZSBzcGxpdHMg
Zm9yIHN5c3RlbXMgdGhhdCBzdXBwb3J0IGJibWwyLiBCdXQgdGhlcmUncyBhIGxvdAo+ID4gb2Yg
eWFrIHNoYXZpbmcgdGhlcmUgdG8gZ2V0IGZyb20gYSBQb0MgdG8gYWN0dWFsIHBhdGNoZXMuCj4g
Cj4gQ291bGQgeW91IHNoYXJlIHlvdXIgUG9DIGZvciBBUk02NC4gSSBjYW4gaGVscCB5b3Ugd2l0
aCB0aGF0IGFuZCBhbGlnbiBteQo+IGV4ZWNtZW0gcm94IGNhY2hlIGZvciBBUk02NCAgY2hhbmdl
cyB0byB0aGUgZGVzaXJlZCBzaGFwZSBvZiB0aGlzIEFQSS4KCkl0J3MgdG9vIHVnbHkgYW5kIG1v
cmUgaW1wb3J0YW50bHkgaXQgY3V0cyB0b28gbWFueSBlZGdlcy4gCkknbGwgdHJ5IHRvIGJyaW5n
IGl0IGludG8gYSBiZXR0ZXIgc2hhcGUgYW5kIHdpbGwgc2hhcmUgdGhlbiBSZWFsbHkgU29vbiA6
KQogCj4gQmVzdCByZWdhcmRzLAo+IEFkcmlhbgoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
