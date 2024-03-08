Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA90C54E4A
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHz+HpnjqBltA6aPl9L6xgAqELshqTTapOuCmpG7E80=; b=CxI5aVC6KsFypJ
	R8+J0xlUIA4aJvNkNjWAAjIdkOjO58LPhmwWlpBKCq/xKgSUm0ah4iur24iVqjJJ1IOxBvu9I3XV7
	rkPmp/3sWueId1WAxliVryi7pYcMVc3dPCBp6QsXcgplo/wD22gSvE6SmGdPG32kiHF4OWyeCWgNx
	oVj1XSsY3r18BPhLn4/bk5DL9+UpZrOL4bGQY06SEEmtuvEeShIdwrMW2ZhG72yIZxOv/vPvGEhDA
	U4gCc7yBcv7tAREL3nFMLkn+GBq69TGhBF2o4x/RqdNkUrB34Z/M650oY+AbYZ1wA485KRUll/2Ns
	Aorfc4HKLoAZAld6ynrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rib7O-00000009Xv1-0TWE;
	Fri, 08 Mar 2024 14:22:38 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rib7K-00000009Xqc-0YhK
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 14:22:36 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-513173e8191so1283760e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709907748; x=1710512548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojcrxVImzaAPTIc4pyg/lucaOPEu+fy//Huzchcs5ZA=;
        b=S73DEchAZkcVgHtGE4uDOQvsJrCZi6CRUthZQ0guHtU6/habuzpDCab90jJVvSviRx
         6tTcpLHyKu8YeHY0g3c8AFr2WoNBNfQmRloiige5av//3xs+5qLeZfmUocrO5OrTaxag
         vde4KjfrARNEDJ6nFDh8KReVRVFD4YDLBFJWKRG1uPJGQHSy7DJMYKWMGajCXnq4ZVAf
         ayMCmNcJuas5XjEpm6Se8/0hrbbFZlxBNxxqQi8p2RiMHalhKepYbHisZ2ilhOLnBIPs
         +5S6GDQtxIbiroZXGchnJm75N9PRqTeuySb76Mmml9a34+riNXVMPl3KIwwec24Vuk6N
         V7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709907748; x=1710512548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojcrxVImzaAPTIc4pyg/lucaOPEu+fy//Huzchcs5ZA=;
        b=X0uMIO7JCprbsnD/3yb2JuQNIjM1WiYDIoi/a5DOFegWfibrJkXBv51uljEVuoaxa1
         ovYXAgNOwg9PwJrItCG38We4DwNGKNcaZE4zM8cPN/OHqF3Xg3hDz3uB1+DOQFcd2VSq
         PMHnI2W0leAH26MYRHSPQYy/blAqDyiwIAlr6qSwDNSiglBI6IZiA/XKhzvrAfTIIXsa
         4vbnKaL5xIKEbV6i5k1Su0zkzkB7vVbSAZ3U5kRB2X+u3RLc2uLw2czjaES4dePvfV6Y
         soiuhsceOxrNKkOxdZ2dJCrqRLXM9wpPbtNJKyEDPH8ZBo/HvuZ+gyYZPb8P68ccx3bv
         spEA==
X-Forwarded-Encrypted: i=1; AJvYcCVXNEZgQbo4bMEls+ZcNm+lciORTU7rZYcqAVLLWcyJ4ZSCpwT955WBDx5KWpQQ/VC/WrvU2PCrqVT7RAjDnvvUR44sZqXU/+Fq+I+ysllM
X-Gm-Message-State: AOJu0YxRoOyiUQ+SelnTWTVlvQBiyq1DcFE0e66n1TgjFqXBZfe3LWr5
	NbGRQzKOSKvCPg/8SnFLKdgaxb4+DG6wga2DlGmCVHz6hBYE/dOZLzND/VolsO8wcLTBc+Zqq/a
	I0LMIX1tqrcrg8/ytyTCvvl0k+Lg=
X-Google-Smtp-Source: AGHT+IHlNDCalmvWgglhccE8n0ysn68+ehYyI7316Fj/AoLgfLAbgPA0wvzexIBL9XUfgexyKtAVjsk3+IrB9O32rrc=
X-Received: by 2002:a05:6512:743:b0:513:1f44:7cf6 with SMTP id
 c3-20020a056512074300b005131f447cf6mr3255371lfs.64.1709907747997; Fri, 08 Mar
 2024 06:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20240306165904.108141-1-puranjay12@gmail.com> <87ttlhdeqb.fsf@all.your.base.are.belong.to.us>
 <CANk7y0gbQdYw0V+CEv-z8wFGXnki8KSn4c8+i0iZ1UFNCg7wJQ@mail.gmail.com> <87jzmdowp4.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87jzmdowp4.fsf@all.your.base.are.belong.to.us>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 8 Mar 2024 15:22:17 +0100
Message-ID: <CANk7y0jpKb8XUycKxHbsrJGEWcTvVDYFjM+A2VUe0JeZ2Y-Zbw@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Guo Ren <guoren@kernel.org>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Deepak Gupta <debug@rivosinc.com>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Song Shuai <suagrfillet@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jisheng Zhang <jszhang@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_062234_202172_3A3D9370 
X-CRM114-Status: GOOD (  10.50  )
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

SGkgQmrDtnJuLAoKT24gRnJpLCBNYXIgOCwgMjAyNCBhdCAxMToxNuKAr0FNIEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IElmIEkgcmVtZW1iZXIgZnJvbSBT
dGV2ZW4ncyB0YWxrLCB4ODYgdXNlcyBkeW5hbWljYWxseSBhbGxvY2F0ZWQgdHJhbXBvbGluZXMK
PiA+IGZvciBwZXIgY2FsbHNpdGUgdHJhY2Vycywgd291bGQgQ0FMTF9PUFMgcHJvdmlkZSBiZXR0
ZXIgcGVyZm9ybWFuY2UgdGhhbiB0aGF0Pwo+Cj4gUHJvYmFibHkgbm90LCBhbmQgaXQgd2FzIHJl
YWxseSBhIHRvbmd1ZS1pbi1jaGVlayBjb21tZW50IC0tIG5vdGhpbmcgSQo+IGVuY291cmFnZSB5
b3UgdG8gZG8hCj4KPiBOb3csIEkgdGhpbmsgYSBiZXR0ZXIgYXBwcm9hY2ggZm9yIFJJU0MtViB3
b3VsZCBiZSBpbXBsZW1lbnRpbmcgd2hhdCB4ODYKPiBoYXMgKGFyY2hfZnRyYWNlX3VwZGF0ZV90
cmFtcG9saW5lKCkpLCByYXRoZXIgdGhhbiBDQUxMX09QUyBmb3IgUklTQy1WLgo+Cj4gVGhvdWdo
dHM/CgpJIGFtIGdvaW5nIHRvIHNwaW4gc29tZSBwYXRjaGVzIGZvciBpbXBsZW1lbnRpbmcKYXJj
aF9mdHJhY2VfdXBkYXRlX3RyYW1wb2xpbmUoKSBmb3IKUklTQy1WLCB0aGVuIHdlIGNhbiBjb21w
YXJlIHRoZSB0d28gYXBwcm9hY2hlcyBhbmQgc2VlIHdoaWNoIGlzCmJldHRlci4gQnV0IEkgYWdy
ZWUKdGhhdCBhcmNoX2Z0cmFjZV91cGRhdGVfdHJhbXBvbGluZSgpIGlzIGEgYmV0dGVyIGFwcHJv
YWNoIGdpdmVuIHRoYXQKd2UgY2FuIGp1bXAgYW55d2hlcmUKd2l0aCBhdWlwYy9qYWxyLgoKVGhh
bmtzLApQdXJhbmpheQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
