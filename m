Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D354C47DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrGOz+UOgYJWuTnm377XesUtIUTqPp991lj8a0o30KQ=; b=Kn73P9wJ8WntDR
	Y8NpZU1ULe65Zzv+AyTz3O4/vI/iQy0H5IdVPAn9q+FLL6D5WMJrflg9tnGWw4OYcen20lHI8EiFK
	sbyk/rUqwlKAiBj3Mn+mFH1uNGqkBWxPu7u6oM3XSDZppNTgMiq71YRDyTCwiG7AQ9lLPiVRpXHKN
	d9fdUYMrJl6DFPx8C9lGXPKvEnPi7HfmW8I7W+mBNfL4d0YRG42+ebcEOGKt8F3m+hsl3ZkoDo4yA
	v/UJsxk1Jq2HOKYfe2nufcTdxiTdh9Zc69uXV6Y9tvaGxpGcR++j3fxiRE7qvpnvaJ0RH79SN+J2a
	I21y+RyaBDrtY/eWypYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRowd-00AtiX-1e;
	Mon, 22 Jan 2024 07:42:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRowa-00Atfr-1O;
	Mon, 22 Jan 2024 07:42:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8F62610E7;
	Mon, 22 Jan 2024 07:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B284C43394;
	Mon, 22 Jan 2024 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705909326;
	bh=6q+Ae298LK6Fwx9w1Hxqg+/TcqF4+MMHBmWb7Tw8+hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jOnqDMRdvXuWTje7hxQN2dCLE7PzYUq8rAYWennGmg2eWAJlF8wYxF7WITOD93XyX
	 kOi7HC3t/JBdyraClA4q5IQ6eCe0QP9DQEOOLu5rJzGGtUakerutvskNDSebyStAJZ
	 z+mnBJqfh9Fcq+5rh+Kc2KPiYn9xLCRpmCpxOFhvwp4xLOdS0I9/a1r1ZusQ+JEtay
	 eerJbS9dnoFfr2YnDqeIifjrZ8RFwgs3XLP/I8Wfw7PBHR0aHCQTC5FxayDUKgCqE/
	 I+Nux9qFYloyZL8LPJSk6tchB/m6C22f9IUgs1mhO9obbBZ8/pniLuN0IIT85I3k0j
	 4+4RMm18KCn0Q==
Date: Mon, 22 Jan 2024 09:41:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	gregkh@linuxfoundation.org, patches@amperecomputing.com,
	rafael@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, kuba@kernel.org, vschneid@redhat.com,
	mingo@kernel.org, akpm@linux-foundation.org, vbabka@suse.cz,
	tglx@linutronix.de, jpoimboe@kernel.org, ndesaulniers@google.com,
	mikelley@microsoft.com, mhiramat@kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
	cl@os.amperecomputing.com
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <Za4cNBQBLZujlAlP@kernel.org>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
 <Zan9sb0vtSvVvQeA@yury-ThinkPad>
 <1cd078fd-c345-4d85-a92f-04c806c20efa@amperemail.onmicrosoft.com>
 <Zao13I4Bb0tur0fZ@kernel.org>
 <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b8786c38-d6c4-4fea-a918-ac6a45682dba@amperemail.onmicrosoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_234208_547393_CBC0D99D 
X-CRM114-Status: GOOD (  18.64  )
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

T24gRnJpLCBKYW4gMTksIDIwMjQgYXQgMDQ6NTA6NTNQTSArMDgwMCwgU2hpamllIEh1YW5nIHdy
b3RlOgo+IAo+IOWcqCAyMDI0LzEvMTkgMTY6NDIsIE1pa2UgUmFwb3BvcnQg5YaZ6YGTOgo+ID4g
SXMgdGhlcmUgYSBmdW5kYW1lbnRhbCByZWFzb24gdG8gaGF2ZSBlYXJseV9jcHVfdG9fbm9kZSgp
IGF0IGFsbD8KPiAKPiBUaGUgZWFybHlfY3B1X3RvX25vZGUgZG9lcyBub3Qgd29yayBvbiBzb21l
IEFSQ0hzICh3aGljaCBzdXBwb3J0IHRoZSBOVU1BKSwKPiBzdWNoIGFzwqAgU1BBUkMsIE1JUFMg
YW5kIFMzOTAuCgpNeSBxdWVzdGlvbiB3YXMgd2h5IHdlIG5lZWQgZWFybHlfY3B1X3RvX25vZGUo
KSBhdCBhbGwgYW5kIHdoeSBjYW4ndCB3ZSB1c2UKY3B1X3RvX25vZGUoKSBlYXJseSBvbiBhcmNo
ZXMgdGhhdCBkbyBoYXZlIGl0LgogCj4gVGhhbmtzCj4gCj4gSHVhbmcgU2hpamllCj4gCj4gPiBJ
dCBzZWVtcyB0aGF0IGFsbCB0aGUgbWFwcGluZ3MgYXJlIGtub3duIGJ5IHRoZSBlbmQgb2Ygc2V0
dXBfYXJjaCgpIGFuZCB0aGUKPiA+IGluaXRpYWxpemF0aW9uIG9mIG51bWFfbm9kZSBjYW4gYmUg
bW92ZWQgZWFybGllci4KPiA+ID4gPiBJIHdvdWxkIGFsc28gaW5pdGlhbGl6ZSB0aGUgbnVtYV9u
b2RlIHdpdGggTlVNQV9OT19OT0RFIGF0IGRlY2xhcmF0aW9uLAo+ID4gPiA+IHNvIHRoYXQgaWYg
c29tZW9uZSBjYWxscyBjcHVfdG9fbm9kZSgpIGJlZm9yZSB0aGUgdmFyaWFibGUgaXMgcHJvcGVy
bHkKPiA+ID4gPiBpbml0aWFsaXplZCBhdCBydW50aW1lLCBoZSdsbCBnZXQgTk9fTk9ERSwgd2hp
Y2ggaXMgb2J2aW91c2x5IGFuIGVycm9yLgo+ID4gPiBFdmVuIHdlIHNldCB0aGUgbnVtYV9ub2Rl
IHdpdGggTlVNQV9OT19OT0RFLCBpdCBkb2VzIG5vdCBhbHdheXMgcHJvZHVjZQo+ID4gPiBlcnJv
ci4KPiA+ID4gCj4gPiA+IFBsZWFzZSBzZWUgdGhlIGFsbG9jX3BhZ2VzX25vZGUoKS4KPiA+ID4g
Cj4gPiA+IAo+ID4gPiBUaGFua3MKPiA+ID4gCj4gPiA+IEh1YW5nIFNoaWppZQo+ID4gPiAKCi0t
IApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
