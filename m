Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A4BC19F4F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 19:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=adzSuaPqH+fYl06YyI71bolRdf9mvdn9ixy4nytUsAs=; b=q5u/CaclH7T1D9
	E0KoQIDh9P1QCbgMynwDoGfYgnXMf7JtRVKy/CjXUA2sggmMM22IEEBBsgciGuWqsSGOQwnilkZX1
	vj74cYM/yxh7Pfg5aztER4VeScBfGG1pCCGGHxmxGFQufNOZyGonF9sjpX/+N5sjWz8IuaKlDxI/3
	fWsSHKovJTGKwHRkApSFNnz+/BBZfZAmn0kd3DVjuempV4/JT19b7/g7lhFVjJAgwS11IQIFWTrNi
	Ipd/HA11WJYd8Nyhu3X18PArHT/LxWY3rdn6e1YOtXFiUbNoxck2/jo4cTQ1kN7BlM4mf0+U9QmFl
	rzM9dsiidCYFPTfJbbzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Qpo-0000000DkOR-0lKq;
	Fri, 26 Apr 2024 19:02:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Qpk-0000000DkMo-3zkE;
	Fri, 26 Apr 2024 19:02:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B73A6211F;
	Fri, 26 Apr 2024 19:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE1BC2BD10;
	Fri, 26 Apr 2024 19:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714158128;
	bh=spHwlcTCpaNA543nwyK0H2eAD2T0c3htMv4UjyBqffA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fWO+bScMh9fv6xYJIS/EzFzy8ryBVZw3+121t9ywO5Logh7zo145gUqpoaKQD+M/n
	 zZzr/36iRpEMzKbY3LL8rR/Y6NSkoOJbrLP2Lirl8PJgE3Z4JC8EDbDjm2qobxuVf9
	 HpdCIIZeWy5cOGk4Ayqe/zARMYt5kWXfQzlImbKw6tkLkgyhcQA3MsLG/oyD4NsMHV
	 DYt/qBS1ba9aNV9Uldmu+S3e3u6PYj4NTkIw8cfCCZ2I9zCX2s71QbRowZToNNOr6r
	 3CNqwpqcW1PmcHwg5Hn2mAkxp5AKoDG5jlYHhYWSqD3Hwc/XiVCS9J8zhZL0F0XlJC
	 s+eMqy0Cl5xwQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51c66cc680aso1694860e87.1;
        Fri, 26 Apr 2024 12:02:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7HEmUhEQpTNKx/OEy5QMLcXD9BUvMWtkccZC19zowYmL7nI9TJs+RgWcFRCmruC7GJDR/6oAx9AlTVpG3Cvo62asSldcxro1lLR3sR4ov1I/6tqmrWQIszFvMzMsU7egsPEEIKHUZ/hn6e6y6krv525048Kw=
X-Gm-Message-State: AOJu0YyWVaaRwUhlqSp7JjpKQjoi9y763aNNm2q6p9SYsw9Mpi2DenTP
	/h/y3ssBH6U5KkZukGKEMV6SRAscDbpXDOrK+1TASfpH19rsvszUtiug/N/SsABdlJnTMauXocl
	v7VSLE4YmMAo4NZngbMY3Lbke+wI=
X-Google-Smtp-Source: AGHT+IF/3UI9Cwbb8z8OI8jFmskqzepU4aeg2+YglDD7FKhfHPiRdUcmMxLF73Ba/yVMMyprkxylEY00eIaasdUhAvE=
X-Received: by 2002:a05:6512:151:b0:513:c1a2:d380 with SMTP id
 m17-20020a056512015100b00513c1a2d380mr1420572lfo.31.1714158105499; Fri, 26
 Apr 2024 12:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240426082854.7355-1-rppt@kernel.org> <20240426082854.7355-9-rppt@kernel.org>
In-Reply-To: <20240426082854.7355-9-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 26 Apr 2024 12:01:34 -0700
X-Gmail-Original-Message-ID: <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
Message-ID: <CAPhsuW52MYy4Md5O=7XVGvkw395-LB+BiSadxoDdw8CrLw5t7A@mail.gmail.com>
Subject: Re: [PATCH v6 08/16] mm/execmem, arch: convert remaining overrides of
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
X-CRM114-CacheID: sfid-20240426_120209_079184_ACCABEAB 
X-CRM114-Status: GOOD (  12.48  )
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
bmVsLm9yZz4KPgo+IEV4dGVuZCBleGVjbWVtIHBhcmFtZXRlcnMgdG8gYWNjb21tb2RhdGUgbW9y
ZSBjb21wbGV4IG92ZXJyaWRlcyBvZgo+IG1vZHVsZV9hbGxvYygpIGJ5IGFyY2hpdGVjdHVyZXMu
Cj4KPiBUaGlzIGluY2x1ZGVzIHNwZWNpZmljYXRpb24gb2YgYSBmYWxsYmFjayByYW5nZSByZXF1
aXJlZCBieSBhcm0sIGFybTY0Cj4gYW5kIHBvd2VycGMsIEVYRUNNRU1fTU9EVUxFX0RBVEEgdHlw
ZSByZXF1aXJlZCBieSBwb3dlcnBjLCBzdXBwb3J0IGZvcgo+IGFsbG9jYXRpb24gb2YgS0FTQU4g
c2hhZG93IHJlcXVpcmVkIGJ5IHMzOTAgYW5kIHg4NiBhbmQgc3VwcG9ydCBmb3IKPiBsYXRlIGlu
aXRpYWxpemF0aW9uIG9mIGV4ZWNtZW0gcmVxdWlyZWQgYnkgYXJtNjQuCj4KPiBUaGUgY29yZSBp
bXBsZW1lbnRhdGlvbiBvZiBleGVjbWVtX2FsbG9jKCkgdGFrZXMgY2FyZSBvZiBzdXBwcmVzc2lu
Zwo+IHdhcm5pbmdzIHdoZW4gdGhlIGluaXRpYWwgYWxsb2NhdGlvbiBmYWlscyBidXQgdGhlcmUg
aXMgYSBmYWxsYmFjayByYW5nZQo+IGRlZmluZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJh
cG9wb3J0IChJQk0pIDxycHB0QGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IFdpbGwgRGVhY29uIDx3
aWxsQGtlcm5lbC5vcmc+CgpuaXQ6IFdlIHNob3VsZCBwcm9iYWJseSBtb3ZlIHRoZSBsb2dpYyBm
b3IgQVJDSF9XQU5UU19FWEVDTUVNX0xBVEUKdG8gYSBzZXBhcmF0ZSBwYXRjaC4KCk90aGVyd2lz
ZSwKCkFja2VkLWJ5OiBTb25nIExpdSA8c29uZ0BrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
