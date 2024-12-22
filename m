Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E665E7718B
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Dec 2024 00:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHQJ0xCnWYaugMNbNEYOq5SWXFUGAwoJA/fvdc6j3ZM=; b=JQSMVzj6rjkmsZ
	cvu7Apc6VuHaLgY2yt3JMGxG19A2b+o/A9vJMmM+9ScGsS1JqqrFQvUAS5Kl8cSFRg1b9wXvBFV2C
	FIB0wj8+zO1MrE+c0WWMQ2DYKXbg+ucOBpu6jlKWn6589Wx+4btsdFipeZJzijGW7VilbDyCO0Mbn
	ah9SDGYulrsuXM0awAlzlAxOiMZyL7ytSuO6pGz/uiop9OnitegnaZamMg/RI2+2fZK3rj7ktw5+e
	x/ibdIcGzwOfJkgCkCw1/mGFfNWJ5ga2mPMiVNIfx/ar+virnC5jWEUHN2IxXN34TP8r70e/0XR+G
	KQGVJhhNMWOFEiUWNkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPACq-00000007cAX-1Kbu;
	Sun, 22 Dec 2024 00:52:28 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPACn-00000007c9n-3YdL;
	Sun, 22 Dec 2024 00:52:27 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6eff8289d0eso27694917b3.0;
        Sat, 21 Dec 2024 16:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734828744; x=1735433544; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G56dFj5BRaIttSoRxhRi+K83W3sP81bwdAaZ6QoaIrc=;
        b=FGASEvmUrZZyY2avjPCCV8kOxTz6tTHO6xo/zK8EPkJlDiK+4yJ8u2W76I6Nax7USV
         /2Pe2vww6IhBYSsI/y/SC2+q0NpOsAtnbUO0lPwDmz1DobuCNwFNj2X9rrCiFg2VbdEx
         n8wIbSYMEFL7AYEAGCnQ9IU1tvxLqPo1JXXnR8qiC36T3HpNNIlx5bcVoJE/x6juxygX
         moHcmwuRwsl677csl4x5B4uyHczN2Ig7rakQWXFZYvHkpR13P9zIgCd2iIFioHbmONvC
         XxP8NgMq6/jh7c72y56o1Jys4odHpaR9v/J22lp4klrWMf93fZbHgCM1nOuuhKho3BLK
         8S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734828744; x=1735433544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G56dFj5BRaIttSoRxhRi+K83W3sP81bwdAaZ6QoaIrc=;
        b=TPXY0YFV+D2A2baBvy0cJ3kGXVRPnOa+gTcIKUF234g5KpzM6P8/TNT2I2YTcEbEhA
         zbBejT1ihoeUBCkgJlAsKwI2Y0/vRhuiKB0GynNh+7abF03p7INTb+bhHQyY7lYyLs3E
         zPbufMMZvVLwl9Cs6EMArqRAPxN3nWMMG5vC+LGQlDKVjTGgnAiRJ42Hi82E/Q3WD5T2
         vEx+yZ4x39qduVos+ZLIq8V7pBe1Co0mYhg0OXA6fVgjeKfABOXbk8FgqEo0EXBuZAGW
         AZ1mSB36QWvqKFmRUITKVrDmcynkfVwy+Et+VYBw3s1Ul13e8zsmfPsFV4l6k8qNgZur
         J5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+pa/bIdcZPSzAmYzFJ+ActKWr9YDfqVPli06/joKAkA8nAW60PHLIgqajf7HvIffeori2wHrFkbY6y2P9LdAt@lists.infradead.org, AJvYcCX4MLM3GYo4GcJMwI99WoKg+Qz97XWryyJ3uoBpULo4NX1D0fPhXih3cHcz383kUoNH7Pq8GzELuOE=@lists.infradead.org, AJvYcCXnmX2DhpHmgB9OGJunFXu3/klQzodP2Vr3ffBPCvLwiotVkdcpMg0r49aCDq46TIc3EnPCa5rs14XNGek=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDvjL9ntqkYGik0PcJfbjUFYAbgFOfbRbL9auDHPlsHN35RMZM
	p8UlbkpIv5N+YXgrOZfcc5HtZjdn9MdSyzR1H0+e2vocvcYp5rmoq/aqZObFxjqPFvvTaVS2qFF
	o0YcakS/VMYW3l8C3C7g3uVKErAk=
X-Gm-Gg: ASbGncst9bKDrcNXEn6pDytJAnm7EREZYl1f0mmicD4y8Qk6MG9Qxv7UsV/Lj25PHbs
	pTk/xMqCgh6qoxAEhLD0ihLeEBq38JUBrjQ9+ZX0=
X-Google-Smtp-Source: AGHT+IHH5gTAOmFubOYjlrK+2+jdIvePBlyZPYVyBZBy90RljxEGCQgcvHQMo3bTypvAoytVk58QJl8i95oeqQUdh1w=
X-Received: by 2002:a05:690c:4e82:b0:6f0:21d6:4497 with SMTP id
 00721157ae682-6f3f80d911amr42730727b3.9.1734828744363; Sat, 21 Dec 2024
 16:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20241221104304.2655909-1-guoweikang.kernel@gmail.com> <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXbB-ksxZ9+YRz86wazPGSM09ZFX7JZoyH--=UDndS=TQ@mail.gmail.com>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 08:52:14 +0800
Message-ID: <CAOm6qn=aN_n3jRc79wr-AGVaQXCbZoyE0yXYcZfw28-uBv+zuQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/memblock: Add memblock_alloc_or_panic interface
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_165225_904549_0815503B 
X-CRM114-Status: GOOD (  25.19  )
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

R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGUgb24gU2F0dXJk
YXksIDIxCkRlY2VtYmVyIDIwMjQgYXQgMjI6MTAKPgo+IEhpIEd1bywKPgo+IE9uIFNhdCwgRGVj
IDIxLCAyMDI0IGF0IDExOjQz4oCvQU0gR3VvIFdlaWthbmcKPiA8Z3Vvd2Vpa2FuZy5rZXJuZWxA
Z21haWwuY29tPiB3cm90ZToKPiA+IEJlZm9yZSBTTFVCIGluaXRpYWxpemF0aW9uLCB2YXJpb3Vz
IHN1YnN5c3RlbXMgdXNlZCBtZW1ibG9ja19hbGxvYyB0bwo+ID4gYWxsb2NhdGUgbWVtb3J5LiBJ
biBtb3N0IGNhc2VzLCB3aGVuIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWxzLCBhbiBpbW1lZGlhdGUK
PiA+IHBhbmljIGlzIHJlcXVpcmVkLiBUbyBzaW1wbGlmeSB0aGlzIGJlaGF2aW9yIGFuZCByZWR1
Y2UgcmVwZXRpdGl2ZSBjaGVja3MsCj4gPiBpbnRyb2R1Y2UgYG1lbWJsb2NrX2FsbG9jX29yX3Bh
bmljYC4gVGhpcyBmdW5jdGlvbiBlbnN1cmVzIHRoYXQgbWVtb3J5Cj4gPiBhbGxvY2F0aW9uIGZh
aWx1cmVzIHJlc3VsdCBpbiBhIHBhbmljIGF1dG9tYXRpY2FsbHksIGltcHJvdmluZyBjb2RlCj4g
PiByZWFkYWJpbGl0eSBhbmQgY29uc2lzdGVuY3kgYWNyb3NzIHN1YnN5c3RlbXMgdGhhdCByZXF1
aXJlIHRoaXMgYmVoYXZpb3IuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFdlaWthbmcgPGd1
b3dlaWthbmcua2VybmVsQGdtYWlsLmNvbT4KPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPgo+
ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4
L21lbWJsb2NrLmgKPiA+IEBAIC00MTcsNiArNDE3LDIwIEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxp
bmUgdm9pZCAqbWVtYmxvY2tfYWxsb2MocGh5c19hZGRyX3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxp
Z24pCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1FTUJMT0NLX0FM
TE9DX0FDQ0VTU0lCTEUsIE5VTUFfTk9fTk9ERSk7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgX19h
bHdheXNfaW5saW5lIHZvaWQgKl9fbWVtYmxvY2tfYWxsb2Nfb3JfcGFuaWMocGh5c19hZGRyX3Qg
c2l6ZSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwaHlzX2FkZHJfdCBhbGlnbiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpmdW5jKQo+ID4gK3sKPiA+
ICsgICAgICAgdm9pZCAqYWRkciA9IG1lbWJsb2NrX2FsbG9jKHNpemUsIGFsaWduKTsKPiA+ICsK
PiA+ICsgICAgICAgaWYgKHVubGlrZWx5KCFhZGRyKSkKPiA+ICsgICAgICAgICAgICAgICBwYW5p
YygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAlbGx1IGJ5dGVzXG4iLCBmdW5jLCBzaXplKTsKPiA+
ICsgICAgICAgcmV0dXJuIGFkZHI7Cj4gPiArfQo+Cj4gUGxlYXNlIG1ha2UgdGhpcyBvdXQtb2Yt
bGluZSwgYW5kIG1vdmUgaXQgdG8gbW0vbWVtYmxvY2suYywgc28gd2UgaGF2ZQo+IGp1c3QgYSBz
aW5nbGUgY29weSBpbiB0aGUgZmluYWwgYmluYXJ5Lgo+CkdvdCBpdCwgSSdsbCBtYWtlIHRoZSBj
aGFuZ2UKPiA+ICsKPiA+ICsjZGVmaW5lIG1lbWJsb2NrX2FsbG9jX29yX3BhbmljKHNpemUsIGFs
aWduKSAgICBcCj4gPiArICAgICAgICBfX21lbWJsb2NrX2FsbG9jX29yX3BhbmljKHNpemUsIGFs
aWduLCBfX2Z1bmNfXykKPiA+ICsKPiA+ICBzdGF0aWMgaW5saW5lIHZvaWQgKm1lbWJsb2NrX2Fs
bG9jX3JhdyhwaHlzX2FkZHJfdCBzaXplLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwaHlzX2FkZHJfdCBhbGlnbikKPiA+ICB7Cj4gPiBkaWZmIC0t
Z2l0IGEvaW5pdC9tYWluLmMgYi9pbml0L21haW4uYwo+Cj4gR3J7b2V0amUsZWV0aW5nfXMsCj4K
PiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+Cj4gLS0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCj4KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCkJlc3Qg
cmVnYXJkcwogICAgICAgICAgICAgR3VvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
