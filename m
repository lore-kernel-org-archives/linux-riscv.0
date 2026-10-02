Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0233ACA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sR5UBiB5HmPoxnIHmO9MbXBNAT++KbHigtX5P2PfVoE=; b=PXNnOmTtx772Iq
	Ffh9rn9CdgEpLjuxqKg7Pypg/Rxryq51heYfHbTmYdymj74h0yb6fP0P6yTcl+bVqNSRXmTVRABlW
	+Mfuh1cMclR81d1QuWeubcNqqh868n+38orPI9rYM7T2GVPlWcJ7KVqrT/wQ/1Uy0U6pspHxf5bRz
	CpOTzDKTTBh59QbRBuuksg0U82Ut6cQfSxIzywSft0pWoNZVxmAywvOVKUXHhn5zhDVRJ6xHRAED8
	lfEFS+IAxKUHkftRENWWDRlO/9jOBejWbw7d8lt+6aq+WaZ4hgw+x+Ipr897XKiUgDgmLm46d614J
	A9mTs4mD4jsvX0IPN2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCays-0000000BP0H-1uez;
	Fri, 02 Oct 2026 10:59:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCayq-0000000BOzY-3mu9
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 10:59:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05A6360A90
	for <linux-riscv@lists.infradead.org>; Fri,  2 Oct 2026 10:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8344A1F000FF
	for <linux-riscv@lists.infradead.org>; Fri,  2 Oct 2026 10:59:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=GFcq79Kf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1790938741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pxei7jjMKgKYiJq7FPMIUgor4y30+Z660JBwkmAeSIU=;
	b=GFcq79KfRexVqilVjQe3T/gap32hK9qtzApE0XFvXwM/oaDLzOd7whYw4Kh6lglo15H2aR
	RtzjZBAdP97mxck7aFDAqWM8j3nNia5mfzweaufHZr5e1ofSYjFOWnoVXzgIvlsUtgQbv5
	8kteJa0XF5H880jzodM0MYuQAKRXNY8=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 700a7e15 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <linux-riscv@lists.infradead.org>;
	Fri, 2 Oct 2026 10:59:01 +0000 (UTC)
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afe9fa8e0so909602466b.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 03:59:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVOjCZ71sYFqHXHGoL5CmTuTz7PO8MTm3AYR05JzSyOEWGTR+UClscGmZKo8L9t312z8RnqsSN5otntA==@lists.infradead.org
X-Gm-Message-State: AFuF++k9djwOyg+KKdoTW6CYRcxQGdaX5MY6JoHRA0RbSvb8USzavQhH
	WBNZYJ5xDRJyQ3GWeK4BdnGh1sUTl7LgqFSeMnMaeF/zN9Q3Y+ZXxGH092aln03D9brgn3dAJIz
	PQ7ev06/6wTmakuq5+ufTFQTtqMljl9o=
X-Received: by 2002:a17:906:ba87:b0:c2e:3acb:34df with SMTP id
 a640c23a62f3a-c2e4b3ffd07mr185815666b.39.1790938736158; Fri, 02 Oct 2026
 03:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <179093852073.149722.832232613857480812.b4-ty@kernel.org>
In-Reply-To: <179093852073.149722.832232613857480812.b4-ty@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 2 Oct 2026 12:58:44 +0200
X-Gmail-Original-Message-ID: <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
X-Gm-Features: AclHuK806shnKBNqNgOvgQVyH7F2xaT6wyW4EoVyeu-ArFe_UTxaLC7DpGRwXbE
Message-ID: <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
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

T24gRnJpLCBPY3QgMiwgMjAyNiBhdCAxMjo1N+KAr1BNIENocmlzdG9waGUgTGVyb3kgKENTIEdS
T1VQKQo8Y2hsZXJveUBrZXJuZWwub3JnPiB3cm90ZToKPgo+Cj4gT24gRnJpLCAyNSBTZXAgMjAy
NiAyMjo0NjozMiArMDEwMCwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4gPiBBZnRlciBhIHJl
Y2VudCBjaGFuZ2UgaW4gTExWTSBbMV0sIGJ1aWxkcyB3aXRoIHRoZSByYW5kb20gdkRTTwo+ID4g
aW1wbGVtZW50YXRpb24sIHN1Y2ggYXMgUG93ZXJQQyBhbmQgUklTQy1WLCBmYWlsIHdoZW4gY2hl
Y2tpbmcgdGhlIHZEU086Cj4gPgo+ID4gICBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vdmRzbzMy
LnNvLmRiZzogZHluYW1pYyByZWxvY2F0aW9ucyBhcmUgbm90IHN1cHBvcnRlZAo+ID4gICBhcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28uc28uZGJnOiBkeW5hbWljIHJlbG9jYXRpb25zIGFyZSBu
b3Qgc3VwcG9ydGVkCj4gPgo+ID4gbWVtc2V0KCkgaXMgbm93IGdlbmVyYXRlZCB3aGVuIHplcm9p
bmcgcGFyYW1zLT5yZXNlcnZlZCBmb3Igc29tZSBidWlsZHMKPiA+IGJlY2F1c2UgTExWTSBoYXMg
YW4gb3B0aW1pemF0aW9uIChub3cgcnVuIGluIG1vcmUgaW5zdGFuY2VzKSB0aGF0IGNhbgo+ID4g
cmVjb2duaXplIGF0IGNvbXBpbGUgdGltZSB3aGVuIGl0IGlzIGFzc2lnbmluZyBhIHN0YXRpYyB2
YWx1ZSB0byBhCj4gPiBjb250aWd1b3VzIGFyZWEgb2YgbWVtb3J5IGFuZCB0dXJuIHRoYXQgaW50
byBhIGNhbGwgdG8gbWVtc2V0KCkuIEJvdGgKPiA+IGNsYW5nIGFuZCBHQ0MgYXNzdW1lIG1lbXNl
dCgpIGlzIGFsd2F5cyBhdmFpbGFibGUgWzJdLgo+ID4KPiA+IFsuLi5dCj4KPiBBcHBsaWVkLCB0
aGFua3MhCj4KPiBbMS8xXSByYW5kb206IHZEU086IEF2b2lkIGNhbGwgdG8gbWVtc2V0KCkgd2hl
biB6ZXJvaW5nIHJlc2VydmVkIGluIF9fY3Zkc29fZ2V0cmFuZG9tX2RhdGEoKQo+ICAgICAgIChu
byBjb21taXQgaW5mbykKClRoYXQncyBub3QgZm9yIHlvdSB0byBhcHBseS4gSSdtIHNlbmRpbmcg
dGhpcyB0aHJvdWdoIG15IHJhbmRvbSB0cmVlLAphbG9uZyB3aXRoIGEgaGFuZGZ1bCBvZiBvdGhl
ciB0aGluZ3MgSSBuZWVkIHRvIGZpeC4gQnV0IEkgd2FudGVkIHRvCmxldCB0aGlzIGNvb2sgYSBi
aXQgbW9yZS4gSSBjYW4gYWRkIHlvdXIgcmV2aWV3ZWQtYnkgbGluZSwgdGhvdWdoLgoKSmFzb24K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
