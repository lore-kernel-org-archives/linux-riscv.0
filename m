Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E672DE63C9A
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 09:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30qmrb1tI7nGXnlEXAWQanGDU0+d5C/KE1oa8XuLasA=; b=1DOvQGXPUFlWJV
	dmu/8C3gM0dmTFNOKpEQS26F8ESD1F8rHDfuY4JT3XrX22QD1GIOVKspc8DVETvFWgMEfI3Jx2UgO
	kGHgUCS2zA+WwKGpUfLtoDCrwkyyYullfRvdHT0/+D8ZIc/bQt0PA2BuZKZMoTJlrXKviAs/2Rzkh
	9WlcgXCL+V1XgwsqVZW+D/tpjgEAq6beLEIdglb1BxpaRTG9AOl4iviE8xj8FEOd5XTO5olZn5GdW
	7mGd0KnGqht0F9V5s5qnLehgo63f5JixFmdD/a7pISNRZ0x7WQJN0UFV2kTJomAaOR0BRwBVvBf+K
	wc+enDNkWDD/0XpNRbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjwtr-0000000B42p-2oTw;
	Sun, 25 Jan 2026 09:59:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjwto-0000000B42P-2yNW
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 09:59:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E4C0340795;
	Sun, 25 Jan 2026 09:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4929EC4CEF1;
	Sun, 25 Jan 2026 09:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769335152;
	bh=t90pzN2k6Whbca/34ndSIUtQ6ODauPo1RiRNlXzDNBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lXW3ae0YU8z55SpbxpHPpo8QS9OjGqTcHsbiii51ODHCMOf6hliMbhrjJWn+728Be
	 TgZj79d5jvu5iItz6H9z2pmlrAqZUWh5ktcnp/oBBLBErOg264g+S0l93REVWuqUc7
	 9f1SvxnhTk/H3zWkQkzLti8BWy0U2XDnGrip1KUUg+j/NWfT1ToyfG8YMEEV0sxDWC
	 KglKM8yIWZ/13LlIhLbEqUClho2mOfcPaccYreX2EQEnOjI+jvuATB8GxADABVYNyK
	 Jh2oups9hDCMfNMF3wtxjcp2b1X8NBJWd29wiq4EXkdQUSJ2jgLnBg87nxA121pjwM
	 f05aOgFlDDr5w==
Date: Sun, 25 Jan 2026 11:58:58 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Lain Fearyncess Yang <fearyncess@aosc.io>,
	WANG Xuerui <kernel@xen0n.name>, Kexy Biscuit <kexybiscuit@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] loongarch: wire up memfd_secret system call
Message-ID: <aXXpYqDyTeftKV2c@kernel.org>
References: <20260109051054.188030-1-fearyncess@aosc.io>
 <aWC6bIEg6UqvX1DO@kernel.org>
 <CAAhV-H5tHZRHmXSA6m+fyhaN9nNjLFbEiVK7OWjL8EoJn16doQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhV-H5tHZRHmXSA6m+fyhaN9nNjLFbEiVK7OWjL8EoJn16doQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_015916_867493_C0A50D9F 
X-CRM114-Status: GOOD (  12.05  )
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

T24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgMTI6MDM6MjVQTSArMDgwMCwgSHVhY2FpIENoZW4gd3Jv
dGU6Cj4gT24gRnJpLCBKYW4gOSwgMjAyNiBhdCA0OjIx4oCvUE0gTWlrZSBSYXBvcG9ydCA8cnBw
dEBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIEphbiAwOSwgMjAyNiBhdCAwMTox
MDo1MVBNICswODAwLCBMYWluIEZlYXJ5bmNlc3MgWWFuZyB3cm90ZToKPiA+ID4gRnJvbTogIkxh
aW4gXCJGZWFyeW5jZXNzXCIgWWFuZyIgPGZlYXJ5bmNlc3NAYW9zYy5pbz4KPiA+ID4KPiA+ID4g
TG9vbmdBcmNoIHN1cHBvcnRzIEFSQ0hfSEFTX1NFVF9ESVJFQ1RfTUFQLCB0aGVyZWZvcmUgd2ly
ZSB1cCB0aGUKPiA+ID4gbWVtZmRfc2VjcmV0IHN5c3RlbSBjYWxsLCB3aGljaCBkZXBlbmRzIG9u
IGl0Lgo+ID4KPiA+IExvb25nQXJjaCB2ZXJzaW9uIG9mIHNldF9tZW1vcnkqIGRvZXMgbm90IHN1
cHBvcnQgc3BsaXR0aW5nIG9mIGxlYWYgUE1ECj4gPiBlbnRyaWVzLiBEb2VzIExvb25nQXJjaCBh
bHdheXMgdXNlIFBURS1sZXZlbCBtYXBwaW5ncyBpbiB0aGUgZGlyZWN0IG1hcD8KPiBObyBQTUQg
bGV2ZWwgbWFwcGluZ3Mgbm93LgoKVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlvbi4gWW91IGNh
biBhZGQKCkFja2VkLWJ5OiBNaWtlIFJhcG9wb3J0IChNaWNyb3NvZnQpIDxycHB0QGtlcm5lbC5v
cmc+CgppZiBpdCdzIG5vdCB0b28gbGF0ZSA6KQoKPiBIdWFjYWkKCi0tIApTaW5jZXJlbHkgeW91
cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
