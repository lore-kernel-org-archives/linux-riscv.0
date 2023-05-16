Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A55DC77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wyrqaAzHgGcquAyxHWDNInYsdYX1yAkXpekSTq9vo2o=; b=pQvYjLQzC6rP4N
	ikaGHq/TLrWAtVSKwXcXge6T78XVUWiVXH090k8blB60j994UswIBnQ+XmuprVQvRGpaRNP9IEg57
	VyNKPuqe5oiiGgnoec9AsunTgsrMftCS/MsJN65Yz0cGK7gYY/lmEx5KO7dP6FizQMK7vT4M2SAUK
	kDUiAsxYQgYIFYkGNDDH+BVpzkKAe7Bt2OpmjkgR50XNxAvbnIm9c1b7opWuQuoFev2QzlteYJZSX
	q4Twglvnsmge3u0VhhlEPmIVSuJBOZ1du2gr+PIwIm/Y3fGJe12BnDViaP9+Qq8MCj/sz/mZfB6vq
	JLZzWbdbCcPUn0l8diKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyx93-006NoZ-0d;
	Tue, 16 May 2023 16:03:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyx8x-006NmW-0g
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 16:03:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6DEF1617E6;
	Tue, 16 May 2023 16:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A397C433D2;
	Tue, 16 May 2023 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684252997;
	bh=helSsO57tH8dHbFRP7TCi/6hSqDAckI7M3dabJ0ZYsA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sRkEXd4R4P1ulUwx8C82RCmJWGwc8Ste6XlVCpWZvC9Qcc2gYmHA1k6dQ21Zf+Tiy
	 qT8FRgwCIYA2117hVruEKq1bbXpARuD7yg9dDIHvUkcjIprxWMEttCswGjfaODMqXc
	 AbXpR7xi/J1hAdmFn+Qh5gjJ9JxKLjCb3Cof3rc+4o65KBLnERtyx/NaKaoY9mPWbF
	 3mHNnv6y/Mb2J/lWb+cFvzU15NB9pXvxhSykI2u2DfhhpK+alFr4cBdVnQ9MCZ4kK7
	 BaZPMq90Cc6L+2Qm7TdMttAPm2F4w1UnWDoohkzsv7EmzaY3M2R0sCCQD8nVffAXI3
	 WooI/NSCY2bRw==
Date: Wed, 17 May 2023 01:03:11 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ze Gao <zegao2021@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, Alexei
 Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Conor Dooley <conor@kernel.org>, Jiri Olsa
 <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v2 2/4] fprobe: make fprobe_kprobe_handler recursion
 free
Message-Id: <20230517010311.f46db3f78b11cf9d92193527@kernel.org>
In-Reply-To: <CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
References: <20230516071830.8190-1-zegao@tencent.com>
	<20230516071830.8190-3-zegao@tencent.com>
	<20230516091820.GB2587705@hirez.programming.kicks-ass.net>
	<CAD8CoPDFp2_+D6nykj6mu_Pr57iN+8jO-kgA_FRrcxD8C7YU+Q@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_090319_295925_2CCCB47B 
X-CRM114-Status: GOOD (  16.27  )
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

T24gVHVlLCAxNiBNYXkgMjAyMyAxNzo0Nzo1MiArMDgwMApaZSBHYW8gPHplZ2FvMjAyMUBnbWFp
bC5jb20+IHdyb3RlOgoKPiBQcmVjaXNlbHksIHRoZXNlIHRoYXQgYXJlIGNhbGxlZCB3aXRoaW4g
a3Byb2JlX2J1c3lfe2JlZ2luLCBlbmR9LAo+IHdoaWNoIHRoZSBwcmV2aW91cyBwYXRjaCBkb2Vz
IG5vdCByZXNvbHZlLgoKTm90ZSB0aGF0IGtwcm9iZV9idXN5X3tiZWdpbixlbmR9IGRvbid0IG5l
ZWQgdG8gdXNlIG5vdHJhY2UgdmVyc2lvbgpiZWNhdXNlIGtwcm9iZSBpdHNlbGYgcHJvaGliaXRz
IHByb2Jpbmcgb24gcHJlZW1wdF9jb3VudF97YWRkLHN1Yn0uCgpUaGFuayB5b3UsCgo+IEkgd2ls
bCByZWZpbmUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIG1ha2UgaXQgY2xlYXIuCj4gCj4gRllJLCBk
ZXRhaWxzIGNhbiBjaGVja2VkIG91dCBoZXJlOgo+ICAgICBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC10cmFjZS1rZXJuZWwvMjAyMzA1MTYxMzI1MTYuYzkwMmVkY2YyMTAyODg3
NGE3NGZiODY4QGtlcm5lbC5vcmcvCj4gCj4gUmVnYXJkcywKPiBaZQo+IAo+IE9uIFR1ZSwgTWF5
IDE2LCAyMDIzIGF0IDU6MTjigK9QTSBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5v
cmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgTWF5IDE2LCAyMDIzIGF0IDAzOjE4OjI4UE0gKzA4
MDAsIFplIEdhbyB3cm90ZToKPiA+ID4gQ3VycmVudCBpbXBsZW1lbnRhdGlvbiBjYWxscyBrcHJv
YmUgcmVsYXRlZCBmdW5jdGlvbnMgYmVmb3JlIGRvaW5nCj4gPiA+IGZ0cmFjZSByZWN1cnNpb24g
Y2hlY2sgaW4gZnByb2JlX2twcm9iZV9oYW5kbGVyLCB3aGljaCBvcGVucyBkb29yCj4gPiA+IHRv
IGtlcm5lbCBjcmFzaCBkdWUgdG8gc3RhY2sgcmVjdXJzaW9uIGlmIHByZWVtcHRfY291bnRfe2Fk
ZCwgc3VifQo+ID4gPiBpcyB0cmFjZWFibGUuCj4gPgo+ID4gV2hpY2ggcHJlZW1wdF9jb3VudCoo
KSBhcmUgeW91IHJlZmVycmluZyB0bz8gVGhlIG9uZXMgeW91IGp1c3QgbWFkZQo+ID4gX25vdHJh
Y2UgaW4gdGhlIHByZXZpb3VzIHBhdGNoPwoKCi0tIApNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUp
IDxtaGlyYW1hdEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
