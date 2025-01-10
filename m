Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B64EE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DV4m2FNnMBTvkuS7loCLr3fsP3voq3w8/AhumfG3aPs=; b=UqQDGu64Ty1Yra
	olhFLmnw6TNO7NjK9CZ5BBBOJhyxhrYZmqPIqbtcdCx5gUoZIRQP2MLXk34Bll9U+WZrCJz8Og0mM
	+8xTYce/d+iJ3+jIWIRVVm6qemV/iBMkCGfW13A7gz5RSOWZ9OBIZM1tOriNHP2IDCgW4ylI9aITG
	rkYZgR7QU9M8Eo+xcUxnE5YAs8QEKFwsZWtHkn18uWD9EDXmh3xlab1LqP9DHn6OVSrnXLHK+Zh/k
	1DHbZJyh92AKfuY/2OOBTzJNUOCcv6xUD8kdXXS+7hjRezPXppqJO4B0CAvUuVTHTLAkjdEV+UjA8
	IBJiXxU/bjPsy9FEpO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJTs-0000000GWfg-0oxi;
	Fri, 10 Jan 2025 18:11:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWJTg-0000000GWdb-10Fg
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 18:11:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9D195C5115
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 18:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58527C4AF0B
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 18:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736532683;
	bh=tvsh4hr+RpRunTiBWlCn4gyuE/0HI1YBjC00BuBbCZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K/JqBXyDfZHReSXezfeArduMX/HhV0GxaP7feYQuH9tZczRfS2NDttkQbcyLrIyYv
	 Fwmf6D2nWqVIw5UmM2/IjprnkTiiQHJIv5FvINmGzxeJY+B64N4D6GsiZhaEnUFKOg
	 4aHPRpbF5p50Kg6HI+sbZZS9V4YVTKBKZh4yg1E/ZbbwiASICV+EDXiowfqD8XEjhs
	 F07D0sds/OKom3n4hMtAHGjStmNcD54KikSI0YtJZv9V+H9nax9VbPLMGmthh1ZgxS
	 JhIRRaxUy8MEjsmFXrwCSYeYql8gjcO98eddfNudTwfeqJM+3m4KsYw8Ky5PYGwTtr
	 xqtV7N7I6xULA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401be44b58so2388646e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 10:11:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHEBLp1uLQbhVc05DBZ8Z2crTOrHf9NSFNft7+43aYRiA0Fq4TUVFwHoz90tdhu64fNe+sp6Lc+ipcsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzztZQrMIIKnLJqWcvPtV3joCCj20pLWXiqlb48e6DQCHBLqsNK
	WqFIG/kKx3Pd5tjHg9npjKp+DqydeeTyevDiGVgwsueV+g7lfwObakhjlLht3pOGs19mc0Li4D0
	YIT5f7ZU3FAOWExBdNOXtweCOxDQ=
X-Google-Smtp-Source: AGHT+IHb+bVSbz/gWKROdqBObQn5D87lJ5UfB6lJ8BolyK+Cbfvoq5wnSddYteub72xoaPb4ig6IvpgTBgEULc/b/no=
X-Received: by 2002:a05:6512:3b0e:b0:540:5253:6af2 with SMTP id
 2adb3069b0e04-542845af9c9mr3654946e87.12.1736532681694; Fri, 10 Jan 2025
 10:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com> <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
In-Reply-To: <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Jan 2025 19:11:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
X-Gm-Features: AbW1kvasbJxXizyCj8YjS23s-yzUuL4NZfOhY2CO3pG_FqQEpOsXCxnYOlub1mk
Message-ID: <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_101124_361247_FBE1893B 
X-CRM114-Status: GOOD (  15.36  )
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

T24gRnJpLCAxMCBKYW4gMjAyNSBhdCAxMzoxNCwgTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEphbiAxMCwgMjAyNSBhdCA1OjI44oCvUE0g
QXJkIEJpZXNoZXV2ZWwgPGFyZGIrZ2l0QGdvb2dsZS5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206
IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+Cj4gPgo+ID4gRHVlIHRvIHRoZSBmYWN0
IHRoYXQgcnVudGltZSBjb25zdCBFTEYgc2VjdGlvbnMgYXJlIG5hbWVkIHdpdGhvdXQgYQo+ID4g
bGVhZGluZyBwZXJpb2Qgb3IgZG91YmxlIHVuZGVyc2NvcmUsIHRoZSBSU1RSSVAgbG9naWMgdGhh
dCByZW1vdmVzIHRoZQo+ID4gc3RhdGljIFJFTEEgc2VjdGlvbnMgZnJvbSB2bWxpbnV4IGZhaWxz
IHRvIGlkZW50aWZ5IHRoZW0uIFRoaXMgcmVzdWx0cwo+ID4gaW4gYSBzaXR1YXRpb24gbGlrZSBi
ZWxvdywgd2hlcmUgc29tZSBzZWN0aW9ucyB0aGF0IHdlcmUgc3VwcG9zZWQgdG8gZ2V0Cj4gPiBy
ZW1vdmVkIGFyZSBsZWZ0IGJlaGluZC4KPiA+Cj4gPiAgIFtOcl0gTmFtZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFR5cGUgICAgICAgICAgICBBZGRyZXNzICAgICAgICAgIE9mZiAgICAg
U2l6ZSAgIEVTIEZsZyBMayBJbmYgQWwKPiA+Cj4gPiAgIFs1OF0gcnVudGltZV9zaGlmdF9kX2hh
c2hfc2hpZnQgICAgICAgIFBST0dCSVRTICAgICAgICBmZmZmZmZmZjgzNTAwZjUwIDI5MDBmNTAg
MDAwMDE0IDAwICAgQSAgMCAgIDAgIDEKPiA+ICAgWzU5XSAucmVsYXJ1bnRpbWVfc2hpZnRfZF9o
YXNoX3NoaWZ0ICAgUkVMQSAgICAgICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgNTViNmYwMCAwMDAw
NzggMTggICBJIDcwICA1OCAgOAo+ID4gICBbNjBdIHJ1bnRpbWVfcHRyX2RlbnRyeV9oYXNodGFi
bGUgICAgICBQUk9HQklUUyAgICAgICAgZmZmZmZmZmY4MzUwMGY2OCAyOTAwZjY4IDAwMDAxNCAw
MCAgIEEgIDAgICAwICAxCj4gPiAgIFs2MV0gLnJlbGFydW50aW1lX3B0cl9kZW50cnlfaGFzaHRh
YmxlIFJFTEEgICAgICAgICAgICAwMDAwMDAwMDAwMDAwMDAwIDU1YjZmNzggMDAwMDc4IDE4ICAg
SSA3MCAgNjAgIDgKPiA+ICAgWzYyXSBydW50aW1lX3B0cl9VU0VSX1BUUl9NQVggICAgICAgICAg
UFJPR0JJVFMgICAgICAgIGZmZmZmZmZmODM1MDBmODAgMjkwMGY4MCAwMDAyMzggMDAgICBBICAw
ICAgMCAgMQo+ID4gICBbNjNdIC5yZWxhcnVudGltZV9wdHJfVVNFUl9QVFJfTUFYICAgICBSRUxB
ICAgICAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCA1NWI2ZmYwIDAwMGQ1MCAxOCAgIEkgNzAgIDYy
ICA4Cj4gPgo+ID4gU28gdHdlYWsgdGhlIG1hdGNoIGV4cHJlc3Npb24gdG8gc3RyaXAgYWxsIHNl
Y3Rpb25zIHN0YXJ0aW5nIHdpdGggLnJlbC4KPiA+IFdoaWxlIGF0IGl0LCBjb25zb2xpZGF0ZSB0
aGUgbG9naWMgdXNlZCBieSBSSVNDLVYsIHMzOTAgYW5kIHg4NiBpbnRvIGEKPiA+IHNpbmdsZSBz
aGFyZWQgTWFrZWZpbGUgbGlicmFyeSBjb21tYW5kLgo+Cj4gSSBkbyBub3Qga25vdyBob3cgdGhp
cyB3b3JrcyBiZWNhdXNlIGFyY2gvKi9NYWtlZmlsZS5wb3N0Cj4gZG8gbm90IGluY2x1ZGUgc2Ny
aXB0cy9NYWtlZmlsZS5saWIKPgoKQXBvbG9naWVzIC0gaXQgc2VlbXMgSSBkaWRuJ3QgdGVzdCB0
aGlzIHRob3JvdWdobHkuCgpUaGUgYnVpbGQgaGFwcGlseSBjb21wbGV0ZXMgd2l0aG91dCBhbnkg
ZXJyb3JzLCB0aG91Z2ggLSBpdCBhcHBlYXJzCmRvaW5nICckKGNhbGwgY21kLGZvbyknIGRvZXMg
bm90IHRyaWdnZXIgYW4gZXJyb3Igd2hlbiBjbWRfZm9vIGRvZXMKbm90IGV4aXN0LgoKSSBzdXBw
b3NlIHRoaXMgaXMgYSBjb25zZXF1ZW5jZSBvZiA4OTYyYjZiNDc1YmRkYyAoImtidWlsZDogcHJp
bnQKc2hvcnQgbG9nIGluIGFkZGl0aW9uIHRvIHRoZSB3aG9sZSBjb21tYW5kIHdpdGggVj0xIikg
d2hpY2ggaW50cm9kdWNlZAphbiAkKGlmICkgd2hlcmUgdGhlIGVsc2UgYnJhbmNoIGlzIHNpbXBs
eSAnOicgYW5kIHNvIGl0IGFsd2F5cwpzdWNjZWVkcy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
