Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E4CAC5AC
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 02:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXTJ9DXqniZPVy7DKBrtpRIXxEGQUGWLqtThBGbcNyY=; b=jzeVCIbuATxQtv
	/bTQ3bbt+LUENr4D/DyPGzvHlflMwJ03XrO0vE5izdCzPYtewcPNMvrC9blIA04ALjM1jz9KcVRHo
	RKBrxfJlMkV42oVP08mYhcki3g8DR+2ydtUOFUlVYMV5RMTLN61gKYmecNcJ1BqBTdv9GvGiSOWak
	UIpKI2GMBr5jLkdEgvgCZadFhcTVZ6zlCTMDJWi4kfb756NFkL7HvweWQgpLFp+iDUaG9AVLatJcn
	MU4Qi9OgLTClfF63BJ2qXSYWI/X9nHJGGwZMlcwFqBkBdeRbwXNvHvve0BBsJZoVZgr2mc6vxtQfK
	Ed6Z56m1BuyYXhvrgDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FRf-0000000FNRo-2Bly;
	Wed, 24 Sep 2025 02:41:27 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FRc-0000000FNQX-3OEV
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 02:41:26 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-30cce8c3afaso5793216fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 19:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758681683; x=1759286483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ7ZD4HOO6vcvN2jhvcYNuUy+e/nu1npqP5xs4E4kvw=;
        b=Uej9z9LM8zulwukzbwLyZKT7fDb2ZA7VGYsaKyz3WyD/4tjTtFySMNirbDQBg8dPnl
         W0y6l6xahVC4n0TqWMAh+3X7e30SHAiHOMJdIg9hjHotcr+qcg7V7xHkrex8acdAboOY
         mQqNKTsDGg7gB56FpkVQbQrdTh5W8KSxXI8piToP8/3RdbggEuhzo8eWIX0MSGGwPTsr
         hl90/SYI+gJzjHgwth6NJEdC8SGBmW8wjC3xB6VplJ3XPvh/tu4ohya/gjZa/oZg9qVk
         1G17koAe0lApDYD8H82mfW1/L+Q49342zeQlv4h8BFPyJflS97GBVCnMpZ56F5XPrl4O
         b3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758681683; x=1759286483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJ7ZD4HOO6vcvN2jhvcYNuUy+e/nu1npqP5xs4E4kvw=;
        b=ByWu2pKniNjrZgpNY8S/lQWQUEbMcOyk576aXx0vgXwzSndq/5QWUG3AW/gmWsTtuc
         mxfHHaTha+GUs52Idj7Ia9Vq6fRLMYcTZwKnQ/MyZjI4jGvJSAqr+KjhSry8Ejk6I0L5
         EHD3Nu5MGRZKGE6CXaSbhVlR2YBxyFiNAioDB5l5WKxafrtVG+da/d2U9gYG8Q4sFiqP
         D9rY8o1prA2Bn7FQH+2CLl5vAkDGl+ODdQGQuh61SH6n8FWI989bdJ4KR1WQFeCjbBGe
         kq0ON95yMsHZ2REtgkQvLWPJe4HC8URorxZdKllmNN2/d53YuCuyFV3skw9uhKmUxmnD
         /HjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpN/KC2AppXKYoXaIFiGX7B7n1yskP2RA68C+Ub7BRHBnmGgSouX4M0I4zCvS2tyLTN/yWhArNN94JGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6VJwXJwsyjeIysIMI9YiqZQxvtI0XkrvjUMG9s0fwGfy5nD+9
	GiF5uOztCC1pBf2OPAtWTm+FpKHRD8iLDZKbZad8+tgBjJHjYEtsb8Jy73sVT+7nG78iqKHgd6W
	+rRSvedhiZnHfYeLb5lHR8+L40Wcj/GX7pzwVYAxfbw==
X-Gm-Gg: ASbGnctadoe7rg4daIFeQNsEQrT8K8WRMXd/WxNsGUJZ6IotS6hkcaWGidmpXox01kK
	J/NujOZ20zW87a3FXkrIoim4a2DzF55yuCs3v2UF2ADBOSCnBsIc61g+Z4/KVLxgdtaAXbRk3ZL
	lewS2Sz6pOSkEqv0rvGmEUaeXKBHkGqbtBd6jthtRunnCiopzYTmLv81sUFPimEE0RbqDGd6VJp
	1auQErIYEFKGt695OfZTYCF5ovnONw=
X-Google-Smtp-Source: AGHT+IGEpNk9DDtckp5YNfBhGfRHVJ45anN0NmcR9uT9RDyjMg5L8WQA0A/0mav6VX8Fgt6VaztuETs4XxHkt904xHk=
X-Received: by 2002:a05:6808:4fcf:b0:439:b9b3:af48 with SMTP id
 5614622812f47-43f2d4fa2f9mr2800409b6e.51.1758681683348; Tue, 23 Sep 2025
 19:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250827100959.83023-1-cuiyunhui@bytedance.com>
 <20250827100959.83023-2-cuiyunhui@bytedance.com> <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
In-Reply-To: <CAD=FV=WiZ5=4Ck3G2gme=ey6uYQhi-3Wo32DpLj9P53wxGCojw@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 24 Sep 2025 10:41:12 +0800
X-Gm-Features: AS18NWB66CdU_tLMngkAZDvsu7vdd4uKDW0eFr5qi5AGo0Yw70dG5SNPb2ixTPc
Message-ID: <CAEEQ3wnHzL6KVaW=RAkoMNSoM+HW11n=5miFwkw7=LQw+375Gw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] watchdog: refactor watchdog_hld functionality
To: Doug Anderson <dianders@chromium.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, anup@brainfault.org, will@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, catalin.marinas@arm.com, 
	masahiroy@kernel.org, suzuki.poulose@arm.com, maz@kernel.org, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, mingo@kernel.org, 
	lihuafei1@huawei.com, akpm@linux-foundation.org, jpoimboe@kernel.org, 
	rppt@kernel.org, kees@kernel.org, thomas.weissschuh@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_194124_841217_F83ACF0A 
X-CRM114-Status: GOOD (  17.13  )
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

SGkgRG91ZywKCk9uIFNhdCwgQXVnIDMwLCAyMDI1IGF0IDU6MzTigK9BTSBEb3VnIEFuZGVyc29u
IDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiBXZWQsIEF1ZyAy
NywgMjAyNSBhdCAzOjEw4oCvQU0gWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+ID4KPiA+IE1vdmUgd2F0Y2hkb2dfaGxkLmMgdG8ga2VybmVsLywgYW5kIHJlbmFt
ZSBhcm1fcG11X2lycV9pc19ubWkoKQo+ID4gdG8gYXJjaF9wbXVfaXJxX2lzX25taSgpIGZvciBj
cm9zcy1hcmNoIHJldXNhYmlsaXR5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm02NC9rZXJuZWwv
TWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAxIC0KPiA+ICBkcml2ZXJzL3BlcmYvYXJtX3Bt
dS5jICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ICBpbmNsdWRlL2xpbnV4L25taS5o
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEgKwo+ID4gIGluY2x1ZGUvbGludXgvcGVyZi9h
cm1fcG11LmggICAgICAgICAgICAgICAgIHwgMiAtLQo+ID4gIGtlcm5lbC9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIHthcmNoL2FybTY0L2tlcm5lbCA9
PiBrZXJuZWx9L3dhdGNoZG9nX2hsZC5jIHwgOCArKysrKystLQo+ID4gIDYgZmlsZXMgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gIHJlbmFtZSB7YXJjaC9hcm02
NC9rZXJuZWwgPT4ga2VybmVsfS93YXRjaGRvZ19obGQuYyAoOTclKQo+Cj4gSSdtIG5vdCBhIGh1
Z2UgZmFuIG9mIHRoZSBwZXJmIGhhcmRsb2NrdXAgZGV0ZWN0b3IgYW5kIElNTyB3ZSBzaG91bGQK
PiBtYXliZSBqdXN0IGRlbGV0ZSBpdC4gVGh1cyBzcHJlYWRpbmcgaXQgdG8gc3VwcG9ydCBhIG5l
dyBhcmNoaXRlY3R1cmUKPiBpc24ndCBteSBmYXZvcml0ZSB0aGluZyB0byBkby4gQ2FuJ3QgeW91
IHVzZSB0aGUgYnVkZHkgaGFyZGxvY2t1cAo+IGRldGVjdG9yPwo+Cj4gVGhhdCBiZWluZyBzYWlk
LCBJIGRpZCBhIHF1aWNrIGxvb2sgYXQgeW91ciBwYXRjaC4gSSdtIHByZXR0eSBzdXJlIHlvdQo+
IGNhbid0IGp1c3QgbW92ZSB0aGUgYXJtNjQgIndhdGNoZG9nX2hsZC5jIiB0byBiZSBnZW5lcmlj
LiBXb24ndAo+IGh3X25taV9nZXRfc2FtcGxlX3BlcmlvZCgpIGNvbmZsaWN0IHdpdGggZXZlcnlv
bmUgZWxzZSdzICh4ODYgYW5kCj4gcG93ZXJwYyk/CgpBZnRlciBkaXNjdXNzaW5nIHdoZXRoZXIg
dG8gcmVtb3ZlIHdhdGNoZG9nIHBlcmYsIGl0IHN0aWxsIHNlZW1zCm5lY2Vzc2FyeSB0byBrZWVw
IGFkdmFuY2luZyB3aXRoIGl0LiBGb3IgdGhlIGNvZGUsIHdlIGp1c3QgbmVlZCB0bwpkZWNvcmF0
ZSBod19ubWlfZ2V0X3NhbXBsZV9wZXJpb2QoKSB3aXRoIF9fd2VhaywgcmlnaHQ/CgoKPgo+IC1E
b3VnCj4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
