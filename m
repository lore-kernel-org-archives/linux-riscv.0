Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB64606A327
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 07:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GLMlGJkb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tugbffd1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G5rSNZRxJ7CbkSRsEX5V7fR/QD9oX9gsryLUeELQU6k=; b=GLMlGJkbKUO1VyCjiOtDs9j9P+
	2YU1fdJ7mNRQLNQYa0onQKr45oWDKTOIq7Sr0jT9K5cwoLDR2aRYpETnwc/KTkprK5CVSXfH65ZXC
	RRgiMdIR86McFku/fhVl/9cdmFo7sFjnSUFkdUXCS+zBQ7SvFWv6yaZyy3f8xotd5ThZNI5cFdDxS
	kQfTEE0rMl7JNFoyn81+Ijo1BcNmT/na+pGIShvQ/SMLU6TqKyI/nGMH7ZUYm/1rngpBntu0qbS3X
	1eJF5qwthAt1F6gWJfX9e9oqlcPbAv3T48epkZUYKH+7LuNS0Gt0Re9XVadKpzcGo/WP38ePC/9rn
	qmUzmC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUQh-0000000H9it-3UTO;
	Sun, 15 Nov 2026 07:13:35 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUQe-0000000H9i8-3AY7
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 07:13:34 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-37986eb6fa2so2476783eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794726811; x=1795331611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
        b=Tugbffd12bDzpzufplR7lc6K7Rrb/Y8q95QPFSIwNd8gSK00dh01F5LP9OkvPWMpZT
         ZRozise/c7Bh6abpa8bESo9ek3zPif/bCKsRL4m16QVsjCi+DsVRiwcAYMOMAAnIMREf
         H8WNRPer7icAL7sOxGTTEOtTAivqJK0dV5bmWkbUzHQfbVfPdYmomTwfrTJQ4RMaQiYu
         CxQhsk9rrZUWiWFI7i54rYaYzvSgi06SR4ldebBhVgZQY1PoQFx2SpgcUfFYNcdapzur
         uxWjEFY51lmzAzBPRc269dxA1Xi5YWtERLroA2hOtAk9YY+Gu0D/d4K0oFIogzTxwwb1
         4x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794726811; x=1795331611;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
        b=mQngcktzTHViQCL0Rtov+mKahPRh8GXhDW0Pul6F9ScPYjGKx2/4OnW+STt8jaPkE8
         8Cf2es8CHkv9sP4uYYs5MWJ8r77qTX0n+0mji08OHW6cKX29dyNWfflPjLvt7VbFBFH0
         kh/aBMp99uoXqKkNls/UOW5AkszwgXD8gCQMfQQUi9JO3xBLTogxbAU6UYipDsfq+VNk
         L2saTuuTV1Ds43w7WOMfjPXTBlSwlZJ7kahf8pA0+jc8whkILJ1YWV45gdT+i3QgKGeQ
         7Kj01fXWWe/sgvm3lPQgi/fd5RPcL8+mvjGQpNtwXthTrVJiMpafZB8pT1vszY3c9VeW
         DyiQ==
X-Forwarded-Encrypted: i=1; AL+hErFII12Yuo8/1R6QTV0nmfGpyFRb59yhsrLXIt5EuGpwI7skW1pxMSOpwRfqQI39EMsbDXfYSoB5+TXjzA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/SWkn/0tVOKbI66YmqcY6ISJnuzpzxPcpRy07o1x1PF8Txb/LI
	AcC1zpgOIx3/AlI41FlEvUErgNaMg3QlsHFosa0lbMlP94f+hYRORRhx
X-Gm-Gg: AYBFou34GEl8QSNb25UDpSws0j3DwxTRI4s7rinjiVC+Djo4fnaFIpAdjx05ydRCDSC
	twDcukxYakOdaRbmtZ1N0DAqpMbwkpWNJH4s5G6sRcSNdGRF6ubQ/C1/y7K0yfu1O0YOI2RPX1J
	iuzUPVA+JaMg5mFAi825/BWE7mesvhaBkiPCxAiSliw+BUdUkQ84mvFB3rRx2q55YH0Vh1lZ87a
	AtmfmrW/xzh7iC5r3Xu43ANX4BE4LoWQNK3wqOdkliz6QmqR9hIUgSpSJVX3YneP9gMfBQLY8GA
	bWr4HiQamlQeDYf/dbhZGhcPiSNrUsoJvUrcV6HO6wBPk3ZDg3oHAhrT6XUj3NvUoKpDhmL+FC0
	B8JBWI15+BZ0yMZNZ8F+dVM5xWJBpLWQqqHqhMLB7vnUcfYw+G/WVTgCyyV8DzFZfmD6W7+ea4O
	DDQ9IFYq2uFgKI/a7RwY+Atq2EAoz4VOZ7l1iI6M5eIcsznhTWdkj9IljfIVQjCCK5KE7fr90jF
	X6BwK6M3FuudsLQMnsBSu+TuYfBifJfsy/HrjRSAsu8X7HliXmwQZx3S7/hnGObvcCYjIBdxvqq
	tYFuhxmQXyWWfbF4lNh3g1pLezM=
X-Received: by 2002:a05:7300:6148:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-37967dd7e1dmr11471490eec.34.1794726811302;
        Sat, 14 Nov 2026 23:13:31 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm27441185eec.27.2026.11.14.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:13:30 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S.
 Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald
 Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko
 Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>,
 Liviu Dudau <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit
 <nadav.amit@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Peter
 Zijlstra <peterz@infradead.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell
 King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Song Liu
 <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v8 11/16] powerpc: extend execmem_params for kprobes allocations
In-Reply-To: <avlTdlK9ErlqVRYl@kernel.org>
Date: Sun, 15 Nov 2026 12:33:31 +0530
Message-ID: <4idi8tks.ritesh.list@gmail.com>
References: <20240505160628.2323363-1-rppt@kernel.org> <20240505160628.2323363-12-rppt@kernel.org> <3f7af771-87a7-4ae7-9919-bc4c23bd31c9@kernel.org> <avlTdlK9ErlqVRYl@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_231332_797478_3AC97C24 
X-CRM114-Status: GOOD (  16.82  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEhpIENocmlzdG9waGUs
Cj4KPiBPbiBGcmksIE5vdiAxMywgMjAyNiBhdCAwMzozNjowMVBNICswMTAwLCBDaHJpc3RvcGhl
IExlcm95IChDUyBHUk9VUCkgd3JvdGU6Cj4+IEhpIE1pa2UsCj4+IAo+PiBMb29rcyBsaWtlIEkg
bWlzc2VkIHRoaXMgY2hhbmdlIC4uLgo+PiAKCkkgZGlkbid0IGluaXRpYWxseSBnZXQgd2hhdCBD
aHJpc3RvcGhlIG1lYW50IGhlcmUuIFRoZW4gSSBjYW1lIGFjcm9zcyB0aGlzCnJlcGx5IG9mIGZy
b20gaGltWzFdLiBTbyBsb29rcyBsaWtlIHNvbWVob3cgYmV0d2VlbiB2MyB0byB2OCwgc29tZXRo
aW5nIGdvdApjaGFuZ2VkPyAKCiAgICBPbiBwb3dlcnBjIGJvb2szcy8zMiwgdm1hbGxvYyBzcGFj
ZSBpcyBub3QgZXhlY3V0YWJsZS4gT25seSBtb2R1bGVzIAogICAgc3BhY2UgaXMgZXhlY3V0YWJs
ZS4gWC9OWCBjYW5ub3QgYmUgc2V0IG9uIGEgcGVyIHBhZ2UgYmFzaXMsIGl0IGNhbiBvbmx5IAog
ICAgYmUgc2V0IG9uIGEgMjU2IE1ieXRlcyBzZWdtZW50IGJhc2lzLgoKICAgIFNlZSBjb21taXQg
YzQ5NjQzMzE5NzE1ICgicG93ZXJwYy8zMnM6IE9ubHkgbGVhdmUgTlggdW5zZXQgb24gc2VnbWVu
dHMgCiAgICB1c2VkIGZvciBtb2R1bGVzIikgYW5kIDZjYTA1NTMyMmRhOCAoInBvd2VycGMvMzJz
OiBVc2UgZGVkaWNhdGVkIHNlZ21lbnQgCiAgICBmb3IgbW9kdWxlcyB3aXRoIFNUUklDVF9LRVJO
RUxfUldYIikgYW5kIDdiZWUzMWFkOGUyZiAoInBvd2VycGMvMzJzOiBGaXggCiAgICBpc19tb2R1
bGVfc2VnbWVudCgpIHdoZW4gTU9EVUxFU19WQUREUiBpcyBkZWZpbmVkIikuCgogICAgU28gaWYg
eW91ciBpbnRlbnRpb24gaXMgc3RpbGwgdG8gaGF2ZSBhbiBleGVjdXRhYmxlIGtwcm9iZXMsIHRo
ZW4geW91IAogICAgY2FuJ3QgdXNlIHZtYWxsb2MgYWRkcmVzcyBzcGFjZS4KClsxXTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzFjYjQxNzYxLTI5ZDAtNWQzMy1iN2MxLTBjYTNhY2FhODEw
ZEBjc2dyb3VwLmV1LwoKPj4gTGUgMDUvMDUvMjAyNCDDoCAxODowNiwgTWlrZSBSYXBvcG9ydCBh
IMOpY3JpdMKgOgo+PiA+IEZyb206ICJNaWtlIFJhcG9wb3J0IChJQk0pIiA8cnBwdEBrZXJuZWwu
b3JnPgo+PiA+IAo+PiA+IHBvd2VycGMgb3ZlcnJpZGVzIGtwcm9iZXM6OmFsbG9jX2luc25fcGFn
ZSgpIHRvIHJlbW92ZSB3cml0YWJsZQo+PiA+IHBlcm1pc3Npb25zIHdoZW4gU1RSSUNUX01PRFVM
RV9SV1ggaXMgb24uCj4+ID4gCj4+ID4gQWRkIGRlZmluaXRpb24gb2YgRVhFQ01FTV9LUlBPQkVT
IHRvIGV4ZWNtZW1fcGFyYW1zIHRvIGFsbG93IHVzaW5nIHRoZQo+PiA+IGdlbmVyaWMga3Byb2Jl
czo6YWxsb2NfaW5zbl9wYWdlKCkgd2l0aCB0aGUgZGVzaXJlZCBwZXJtaXNzaW9ucy4KPj4gPiAK
Pj4gPiBBcyBwb3dlcnBjIHVzZXMgYnJlYWtwb2ludCBpbnN0cnVjdGlvbnMgdG8gaW5qZWN0IGtw
cm9iZXMsIGl0IGRvZXMgbm90Cj4+ID4gbmVlZCB0byBjb25zdHJhaW4ga3Byb2JlIGFsbG9jYXRp
b25zIHRvIHRoZSBtb2R1bGVzIGFyZWEgYW5kIGNhbiB1c2UgdGhlCj4+ID4gZW50aXJlIHZtYWxs
b2MgYWRkcmVzcyBzcGFjZS4KPj4gCj4+IFVzaW5nIGJyZWFrcG9pbnQgbWVhbnMgdGhlIHNlZ21l
bnQgbXVzdCBzdGlsbCBiZSBleGVjdXRhYmxlLgo+PiBPbiBib29rM3MvMzIgVk1BTExPQyBzZWdt
ZW50IGlzIG5vdCBleGVjdXRhYmxlLCB3aGlsZSBtb2R1bGUgc2VnbWVudCBpcy4KPj4gCj4+IFNl
ZSBjb21taXQgNmNhMDU1MzIyZGE4ICgicG93ZXJwYy8zMnM6IFVzZSBkZWRpY2F0ZWQgc2VnbWVu
dCBmb3IgbW9kdWxlcwo+PiB3aXRoIFNUUklDVF9LRVJORUxfUldYIikKPj4gCj4+IFNlZSByZXBv
cnQgYW5kIGZpeCBhdCBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvZWQwM2QyOTBkNDQwZDU3
OWE4MWFlMGI3ZGU1MjQzNzIxMjkxZDkwMy4xNzk0NTQzOTA5LmdpdC5yaXRlc2gubGlzdEBnbWFp
bC5jb20vCj4KPiBJJ2xsIHRha2UgYSBsb29rLCB0aGFua3MhCj4gIAoKVGhhbmtzIE1pa2UgZm9y
IHRha2luZyBhIGxvb2suIFNvcnJ5LCBJIHNob3VsZCBoYXZlIGNjZCdkIHlvdSB0aGVyZSwgSQpn
dWVzcyBJIG1pc3NlZCBpdC4gSG93ZXZlciwgdGhlIGNoYW5nZXMgYXJlIHRoZXNlIG9uZSBoZXJl
IFsyXVszXQoKWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvODJjNDk3
M2FkZGViZDgyOTIzYzQ2MGNiNDQyMjFmNWI3NjE0NmFmZS4xNzk0NTcyMzY1LmdpdC5yaXRlc2gu
bGlzdEBnbWFpbC5jb20vClszXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2
L2Y3NWYyY2Y5N2Y0NDM3NWZkMmM4ODIwZTBjYWVhYjcwM2NkYjM3MWMuMTc5NDU3MjM2NS5naXQu
cml0ZXNoLmxpc3RAZ21haWwuY29tLwoKLXJpdGVzaAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
