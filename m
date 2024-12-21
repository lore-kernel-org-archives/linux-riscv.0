Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70613E77184
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 10:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWZ36q8aT4Las7DdSWd/vVtg5NPmD2SrmSes8BaE3sw=; b=yZpcg4Y33Kar5h
	2Ime6gVJGL0m3j/wFDpGOXQ7ImiFq6WmxXzZ5sx3/voycT3L0A2W4ST+y9y6JxMIdqyrdtCQKF8kT
	NjJJWL923L5Jr4HlnXbUcLF1cZmBd0sbKY2vOrN7BW4HUnAmMAmzPjl2pa6fRWcoHU721dNYs3B9z
	b3m+9ieDtyfCPyI3PtJZJyu7octv6B0eeeYzBXvFEAtSNZox/2IT5fATP0KpX91JhwUFOfmCdFrYa
	FhdDAZRW6UijkgKcupSkMf9LbAP56N28u8fCYoRFTlRj9bymZHkYaE9/I2sySN8dEIYh2jl/UvItp
	1VgUj8oSdqaImej2VUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOwH7-00000006ppy-2pCH;
	Sat, 21 Dec 2024 09:59:57 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOwH5-00000006pp1-33kB;
	Sat, 21 Dec 2024 09:59:56 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e46ebe19368so2038809276.0;
        Sat, 21 Dec 2024 01:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734775194; x=1735379994; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
        b=b/AYHn3eI21o77FhBVWjLGQUgFszQ1VPp5jIQtyJkgEp8pEKok/nMOg0D/13jY0MJi
         E8IKSKoLFzrp+Xe1g9jrsjzv/8NBTpuGvxiDi/pKO2dDYu4x3MVz+nFVOnUlX/QjORlD
         rv8rz0gtUzavyMbAOev7Lb9vAw38lOQneIbsk+caJVJoRB+a4rmKXLqU3TkXnSbtm7TY
         ObzZHto4s96wSZetrJZbvdg8ZUsJ0SQpXwYQG/sSm5eBe8Bl34n1eFzFeYwAx9qxHQS/
         W3FmJAJqTvyBT0O06E7UhhPQykk4Yl5LWDIzeAUWrjMMArNrVIZpzz/mxMU9qHZC6O+6
         PGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734775194; x=1735379994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
        b=mdXHm9/kyyXlx7C/P9skYEyLWkPYeOWnZWprE8Xx7ZjgNkvlA9cVGMsxh6elYojRJm
         /vmJAfGsELF04KpTUV7rcJ6z44o7Svn+0lajAAPAZfgGA1d1eIs+U9qkt64gvBrqt0Kh
         kNvlRhrN2OGFxkRI5ihwiwTr3jusp4wlLToxZOf6ULmBiYJhLFBCoIsTUOwt2CNQa+Em
         aEBLj/0rYYj5WTTD1Zy2Qgy2pZ/shZRlSzMSYJqsTCE5fr3HBbs5drm8rBjfBZtEGndF
         0FA9uNK1IespFX50g1y2fXBCgNbKMBVmjHLjZde3yyLKb2/UuePXcTBuTMnCTSRaIWM+
         hHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcPwF+yZn2rVqbRLueC4DqPL/tKMVlYsRt53UK3ND1YC56NmdL+kBE39rBmmZ3K4WS0ElE9MyFaSsJfOR3wVcm@lists.infradead.org, AJvYcCUnQZ5qnDkUTbNyguPDrm2SUEj9WcYsP0ZS+fU/PMV1KEk/j2iYRtHgxDcOY/qBxU6MkiZtysBMYdc=@lists.infradead.org, AJvYcCXPvfscF+AVOLBy17tSIVuhbCD5zwUhSggwutlDXbF+IsLIwk5XO/u+z0cIxDUEuoPQ1ZB6mdvRETt9n+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVSsh8pZcAm1iQ/Udh12QG6GFnEmwqPQ3DJ8ErHw979jKwsCqF
	l+uqsTQUV9ymce+zeXZxIACytP8xri8mF0kXJK7tSXWICMNS/cENIvY1QQH0su+eORv+KdbxW+/
	Qa7cNbp0AolgH2uO/2TzNhqlB8bo=
X-Gm-Gg: ASbGncuf3QCFmfWH3AmHjmqH16CHzvB7RYlQIjsZqlVODCVOH9H1EDLG1mrgLALimrk
	rrEfmIPea7whsom67aFG1qNtq344NmcYsukGRbdI=
X-Google-Smtp-Source: AGHT+IG9hgHXPNsbBNiOuY+6OAJ+D2q82bPj4v1OfjOz7h337kMTVjsW2qLUpiuBZXc33tZc49lNKi5hOGaIXzFbkh0=
X-Received: by 2002:a05:690c:4b13:b0:6ef:7036:3b25 with SMTP id
 00721157ae682-6f3f8216b3cmr49229327b3.31.1734775193934; Sat, 21 Dec 2024
 01:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20241220092638.2611414-1-guoweikang.kernel@gmail.com> <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
In-Reply-To: <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sat, 21 Dec 2024 17:59:43 +0800
Message-ID: <CAOm6qnnFDjyiQvUmyVA4iq5aJAO8NC=wcAvpKscvfRZKPnzkYw@mail.gmail.com>
Subject: Re: [PATCH] mm/memblock: Add memblock_alloc_or_panic interface
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>, rafael.j.wysocki@intel.com, 
	Palmer Dabbelt <palmer@rivosinc.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Johannes Berg <johannes.berg@intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Christian Brauner <brauner@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Jonas Bonn <jonas@southpole.se>, 
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
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Len Brown <lenb@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Tero Kristo <kristo@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Pavel Machek <pavel@ucw.cz>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Marco Elver <elver@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	kasan-dev@googlegroups.com, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-omap@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_015955_774728_E728BA08 
X-CRM114-Status: GOOD (  18.08  )
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

QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGUgb24gU2F0dXJk
YXksIDIxCkRlY2VtYmVyIDIwMjQgMDc6MDY6Cj4KPiBPbiBGcmksIDIwIERlYyAyMDI0IDE3OjI2
OjM4ICswODAwIEd1byBXZWlrYW5nIDxndW93ZWlrYW5nLmtlcm5lbEBnbWFpbC5jb20+IHdyb3Rl
Ogo+Cj4gPiBCZWZvcmUgU0xVQiBpbml0aWFsaXphdGlvbiwgdmFyaW91cyBzdWJzeXN0ZW1zIHVz
ZWQgbWVtYmxvY2tfYWxsb2MgdG8KPiA+IGFsbG9jYXRlIG1lbW9yeS4gSW4gbW9zdCBjYXNlcywg
d2hlbiBtZW1vcnkgYWxsb2NhdGlvbiBmYWlscywgYW4gaW1tZWRpYXRlCj4gPiBwYW5pYyBpcyBy
ZXF1aXJlZC4gVG8gc2ltcGxpZnkgdGhpcyBiZWhhdmlvciBhbmQgcmVkdWNlIHJlcGV0aXRpdmUg
Y2hlY2tzLAo+ID4gaW50cm9kdWNlIGBtZW1ibG9ja19hbGxvY19vcl9wYW5pY2AuIFRoaXMgZnVu
Y3Rpb24gZW5zdXJlcyB0aGF0IG1lbW9yeQo+ID4gYWxsb2NhdGlvbiBmYWlsdXJlcyByZXN1bHQg
aW4gYSBwYW5pYyBhdXRvbWF0aWNhbGx5LCBpbXByb3ZpbmcgY29kZQo+ID4gcmVhZGFiaWxpdHkg
YW5kIGNvbnNpc3RlbmN5IGFjcm9zcyBzdWJzeXN0ZW1zIHRoYXQgcmVxdWlyZSB0aGlzIGJlaGF2
aW9yLgo+ID4KPgo+IFNlZW1zIG5pY2UuCj4KPiA+IC4uLgo+ID4KPiA+IC0tLSBhL2luY2x1ZGUv
bGludXgvbWVtYmxvY2suaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tZW1ibG9jay5oCj4gPiBA
QCAtNDE3LDYgKzQxNywxOSBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgKm1lbWJsb2Nr
X2FsbG9jKHBoeXNfYWRkcl90IHNpemUsIHBoeXNfYWRkcl90IGFsaWduKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgTUVNQkxPQ0tfQUxMT0NfQUNDRVNTSUJMRSwgTlVN
QV9OT19OT0RFKTsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCAq
bWVtYmxvY2tfYWxsb2Nfb3JfcGFuaWMocGh5c19hZGRyX3Qgc2l6ZSwgcGh5c19hZGRyX3QgYWxp
Z24pCj4KPiBXZSBsb3N0IHRoZSBwcmludGluZyBvZiB0aGUgZnVuY3Rpb24gbmFtZSwgYnV0IGl0
J3MgZWFzeSB0byByZXRhaW4gd2l0aAo+IHNvbWV0aGluZyBsaWtlCj4KPiAjZGVmaW5lIG1lbWJs
b2NrX2FsbG9jX29yX3BhbmljKHNpemUsIGFsaWduKSAgICBcCj4gICAgICAgICAgICAgICAgIF9f
bWVtYmxvY2tfYWxsb2Nfb3JfcGFuaWMoc2l6ZSwgYWxpZ24sIF9fZnVuY19fKQo+CllvdSdyZSBh
YnNvbHV0ZWx5IHJpZ2h0LCB0aGlzIHdhcyBhbiBvdmVyc2lnaHQgb24gbXkgcGFydC4gSeKAmWxs
IG1ha2UKc3VyZSB0byB1cGRhdGUgaXQgd2l0aCB0aGUgY29ycmVjdCBmdW5jdGlvbiBuYW1lLgo+
ID4gK3sKPiA+ICsgICAgIHZvaWQgKmFkZHIgPSBtZW1ibG9ja19hbGxvYyhzaXplLCBhbGlnbik7
Cj4gPiArCj4gPiArICAgICBpZiAodW5saWtlbHkoIWFkZHIpKQo+ID4gKyNpZmRlZiBDT05GSUdf
UEhZU19BRERSX1RfNjRCSVQKPiA+ICsgICAgICAgICAgICAgcGFuaWMoIiVzOiBGYWlsZWQgdG8g
YWxsb2NhdGUgJWxsdSBieXRlc1xuIiwgX19mdW5jX18sIHNpemUpOwo+Cj4gV29uJ3QgdGhpcyBh
bHdheXMgcHJpbnQgIm1lbWJsb2NrX2FsbG9jX29yX3BhbmljOiBGYWlsZWQgLi4uIj8gIE5vdAo+
IHZlcnkgdXNlZnVsLgo+CkFzIG1lbnRpb25lZCBhYm92ZS4KPiA+ICsjZWxzZQo+ID4gKyAgICAg
ICAgICAgICBwYW5pYygiJXM6IEZhaWxlZCB0byBhbGxvY2F0ZSAldSBieXRlc1xuIiwgX19mdW5j
X18sIHNpemUpOwo+ID4gKyNlbmRpZgo+Cj4gV2UgY2FuIGF2b2lkIHRoZSBpZmRlZiB3aXRoIHBy
aW50aydzICIlcGFwIj8KPgpJIGFwcHJlY2lhdGUgeW91IHBvaW50aW5nIHRoaXMgb3V0LiBJIHdh
c27igJl0IGF3YXJlIG9mIHRoaXMgYXBwcm9hY2gsCmJ1dCBpdOKAmXMgYSBncmVhdCBpZGVhLiBJ
dCBkZWZpbml0ZWx5IHNpbXBsaWZpZXMgdGhpbmdzLCBhbmQgSeKAmXZlCmxlYXJuZWQgc29tZXRo
aW5nIG5ldyBpbiB0aGUgcHJvY2Vzcy4gSSdsbCBpbmNvcnBvcmF0ZSB0aGlzIGludG8gdGhlCmNv
ZGUuCj4gPiArICAgICByZXR1cm4gYWRkcjsKPiA+ICt9Cj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
