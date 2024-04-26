Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC184C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 18:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwK2Yj0Radb4FZabxwlpbzDjhw3dzQjgsijqO2HX+88=; b=XNlbEwtWZz7ZxE
	9hBrg6xHMRVY0l5TFJ0KPsX/Sl+kN9zhzFJbL1vcdrJ8HMHeTS5G1YFDxnE0B7p4CfpfIpw4jZ321
	jDSr7z1xJV6EA18e6Dnf4n3KJZvMVU4Dw63uWkj/Qe+9pDuuyQoz8P0GTCMtN7wQUfS/LjYt9hh3S
	WMdMXxq7R3VL6xVjzQuR9HNdNmscXDK9hbmV1jk1nE0PKU8ZBwUmCDYKGPuMiKKIOS5aAmzasfygy
	PTAB7CP+RZGF6z+5IwrMpLmjIy8w7SydMSCaeciXueDyC/rusiSqu13kHJ+eUDKW9PFJvnQbf/Dmg
	po814GcFz8UyV4iTfBlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0QiZ-0000000DjDK-1P6w;
	Fri, 26 Apr 2024 18:54:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0QiW-0000000DjBZ-0dSI;
	Fri, 26 Apr 2024 18:54:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8026E62101;
	Fri, 26 Apr 2024 18:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB48C2BD11;
	Fri, 26 Apr 2024 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714157679;
	bh=Erw8uuVUeGio0PshYx2zkVsumWpV4GynBPxpYdsctHY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QeY0Q5CWKGUNkZV4cnTSE1WS5+eVGN0gFY1x99TWFJOz/NVZq+OjKksNbrH0CcX/L
	 aFsWENgqvWMDoRx0SH9KLjE4OC22Bf5Qa/YglImk9bxrHhpE1cvJ4rGWoP1CmD3tyx
	 5GVQHrCTqQ4hMaUzd/bPyc6futZG+WNd5KuMCzBntmiQO9LBrcntwqDWmLag8UFFnd
	 KJjIeprHGBh5VFeH8ex6x8CUqFgQgt00rSl+aepgBxkP4M7ne4NCshtRBFGFAtb0T3
	 ag90uwhMbViW+NGATzyAcLeYJJ3m5AxjLrtmYQZ6+zQePK+mZWBptrLFWzXfkeMx7C
	 kFKBeHGA1rHAw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a58a36008ceso321005366b.0;
        Fri, 26 Apr 2024 11:54:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHmaWEaMrUTdfsES/oyXPL2LhtWhOCSbPj6Nb0U18dlLn96F0U1DHf4aa295u1+0pAZ9VTwHU0vz8ZBUAMu7+2S8BpjfbjZ04xdQeL6+pYexQ3RBHM2bYtwVI47Kedwf7xLozms1sZXVjENUmWaUOhlXUfUsw=
X-Gm-Message-State: AOJu0YxXSRfXHmv4oP905Et+JKwjwpJrOCooPH367CdmkkwzytMxZlfj
	Ph8vW+un1WyVoDF+WV46WIbXWLV0teYVczguCstWo8/kK16Faqz72W07gkoezL4s0ilAwylYdgi
	rVYRIrtI8X/PAq3cgfinkHz/0yUk=
X-Google-Smtp-Source: AGHT+IHR8dCzuYaMcfUu9DJ1W7DJuyt98T5r37UenPfdlzP0RlXEYGrXPEenPo3iSsrLDDgw6B5I00dbfOalDiVdMh8=
X-Received: by 2002:ac2:5202:0:b0:51c:1fb4:2327 with SMTP id
 a2-20020ac25202000000b0051c1fb42327mr2189866lfl.24.1714157657105; Fri, 26 Apr
 2024 11:54:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-8-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-8-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 11:54:06 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7+wmDA_aaZKhNLfEZ-F1aLpUKssXqu5tUs6s=P9yvB-Q@mail.gmail.com>
Message-ID: <CAPhsuW7+wmDA_aaZKhNLfEZ-F1aLpUKssXqu5tUs6s=P9yvB-Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/16] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Sam Ravnborg <sam@ravnborg.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_115440_282759_A819146E 
X-CRM114-Status: GOOD (  13.29  )
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMTozMOKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPgo+IFNldmVyYWwgYXJjaGl0ZWN0dXJlcyBvdmVycmlkZSBtb2R1bGVfYWxsb2Mo
KSBvbmx5IHRvIGRlZmluZSBhZGRyZXNzCj4gcmFuZ2UgZm9yIGNvZGUgYWxsb2NhdGlvbnMgZGlm
ZmVyZW50IHRoYW4gVk1BTExPQyBhZGRyZXNzIHNwYWNlLgo+Cj4gUHJvdmlkZSBhIGdlbmVyaWMg
aW1wbGVtZW50YXRpb24gaW4gZXhlY21lbSB0aGF0IHVzZXMgdGhlIHBhcmFtZXRlcnMgZm9yCj4g
YWRkcmVzcyBzcGFjZSByYW5nZXMsIHJlcXVpcmVkIGFsaWdubWVudCBhbmQgcGFnZSBwcm90ZWN0
aW9ucyBwcm92aWRlZAo+IGJ5IGFyY2hpdGVjdHVyZXMuCj4KPiBUaGUgYXJjaGl0ZWN0dXJlcyBt
dXN0IGZpbGwgZXhlY21lbV9pbmZvIHN0cnVjdHVyZSBhbmQgaW1wbGVtZW50Cj4gZXhlY21lbV9h
cmNoX3NldHVwKCkgdGhhdCByZXR1cm5zIGEgcG9pbnRlciB0byB0aGF0IHN0cnVjdHVyZS4gVGhp
cyB3YXkgdGhlCj4gZXhlY21lbSBpbml0aWFsaXphdGlvbiB3b24ndCBiZSBjYWxsZWQgZnJvbSBl
dmVyeSBhcmNoaXRlY3R1cmUsIGJ1dCByYXRoZXIKPiBmcm9tIGEgY2VudHJhbCBwbGFjZSwgbmFt
ZWx5IGEgY29yZV9pbml0Y2FsbCgpIGluIGV4ZWNtZW0uCj4KPiBUaGUgZXhlY21lbSBwcm92aWRl
cyBleGVjbWVtX2FsbG9jKCkgQVBJIHRoYXQgd3JhcHMgX192bWFsbG9jX25vZGVfcmFuZ2UoKQo+
IHdpdGggdGhlIHBhcmFtZXRlcnMgZGVmaW5lZCBieSB0aGUgYXJjaGl0ZWN0dXJlcy4gIElmIGFu
IGFyY2hpdGVjdHVyZSBkb2VzCj4gbm90IGltcGxlbWVudCBleGVjbWVtX2FyY2hfc2V0dXAoKSwg
ZXhlY21lbV9hbGxvYygpIHdpbGwgZmFsbCBiYWNrIHRvCj4gbW9kdWxlX2FsbG9jKCkuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IChJQk0pIDxycHB0QGtlcm5lbC5vcmc+CgpBY2tl
ZC1ieTogU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
