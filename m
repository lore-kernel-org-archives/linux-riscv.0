Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7CFC25B79
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbFPWU6FitYSwBEEwxDU9hxj8RPsvaSjwAE8PrluDPQ=; b=hqtOYsihF9eYqX
	YWXWhYlHJFl/GUBAaX9jButA9HZLRi8vb0oiIgBuI85uLEEf916pRf+99TKtcPwiZ+FpfptFm4feY
	t1N18hkUN2aofG83Xum0juwRbEv7YY74JHaG9wpBQJ/ssiPczBqfKm1raiSvfH4H0W4jLtmJJQJTI
	9fbG/6bd+2H1AYWtlVxGaNHwbw+DZp4yz5XPPVaGl/a0EE1IaEVNRZ/vtt6JgctMt1kFdYewNSEcR
	7ct8O9/slgG6WCe3C2PrMVj/rfC8Yc8U8+NENPX+0llahEF88LJK083FUYs8872ACqwaLACNtQ3mp
	Wgch6Z9i+i6Pmq2roN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9q41-00000003hWa-2SSy;
	Wed, 22 May 2024 17:47:45 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9q3x-00000003hP1-3eRZ
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 17:47:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso1422a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 10:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716400037; x=1717004837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxpzkj4h24ckPZbqXAVMFddkCZE0Xyra0TpA42yUw6Y=;
        b=mIy7sGZ1Q2gQXgsn/KF1i9AmsM4+FtG6ycbtUI0IFr+LTjwKwOHDNCmdHwS6MuxEf8
         3fc3kcK7s5MWES3idhTtpPB0/7wVeRnQwjQ2WLn2rXPCnKidMu5jTEwu+OMBQmTVCHON
         3krbOyoeGL3YBU/EFmSpkDfS7J3ArKykwxeumFlHndN2Krt8p0GShbKk/6xcfZqCngMy
         kbKrPIjepgiRsmf0WMdM3UX1MIPi9k9wj1BZvIoZTdrTstDUkHWmuV5WEa2x21iCs6FF
         7ReRGqdbe2kDL4HUsmoQOxgG8klHNrK6FxdHyvJGVKPaKTXIZrMgA4a+DiRPYL6TgnUf
         gYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716400037; x=1717004837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxpzkj4h24ckPZbqXAVMFddkCZE0Xyra0TpA42yUw6Y=;
        b=qDNtQyxI4lzsStRBUItlJhRrhxoCSReavkaJ3aH5z5KjQkIgk6/+1nwXPihH+v25h2
         yHOI+E5Z8RbjTX4MmqfhHa1C3PXbbIc8EBs0FbnB8rQXzkBjuOh5CiAH9F0uELS4RuQ3
         iVexADGVAM06Ezo/MTyrfBqYMhjsKjdlxP/NQdBfhoJoz9iFKhWoot7HFkp21Yf2wCSL
         1RbZtey+wVsxpSsOS6CO1VMfWPpJXDW/knLJvWWYQ9XtFXbn206MFnoUsrjE6yFDJ/yZ
         JjgTqINIaBgjEy7qv7LW32YK7ZldD5n+3pNHS3h08XVxuGdRbNOC/8jKtjY2a0wF/ROb
         +tuw==
X-Forwarded-Encrypted: i=1; AJvYcCVgIDSx+MWFVFJifGarO0lnVm5HCst9oWhFq75dJsKrJu1GTDDuzEhPeNV+hdQ+FkASqPQsPBguge+SLL99/LMIK90vffsBgJRJki35XGYq
X-Gm-Message-State: AOJu0YxeEzGjQM7DOUKYRRSidz/i0ciqFZnbYUhLufqdCUyc5aEwAB11
	xz4qizBEg4THzRPdIPcrXIgDyWpeo3zVEP1kg1UEAUMN77q6dudkBeGk15ahOIUSVOyLeayCA1H
	FqmF+kGQMFRD0u+MrNpIxIDMb+SJUkxmfVf5a
X-Google-Smtp-Source: AGHT+IEhvV3LATx35FZqHosI0UhkBDI1Niq/eTXGrnklxwDEu8dQhBOKQ05jw+yjdKEjHZAcrzgbp92SS4Zf1xFsuR0=
X-Received: by 2002:a05:6402:50cf:b0:572:57d8:4516 with SMTP id
 4fb4d7f45d1cf-5782f9f7e7bmr285506a12.2.1716400037143; Wed, 22 May 2024
 10:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com> <20240522005913.3540131-3-edliaw@google.com>
 <94b73291-5b8a-480d-942d-cfc72971c2f5@sirena.org.uk>
In-Reply-To: <94b73291-5b8a-480d-942d-cfc72971c2f5@sirena.org.uk>
From: Edward Liaw <edliaw@google.com>
Date: Wed, 22 May 2024 10:46:50 -0700
Message-ID: <CAG4es9WAASaSG+Xgp31-kLT3G8wpeT5vAqbCA4r=Z8G_zAF73w@mail.gmail.com>
Subject: Re: [PATCH v5 02/68] kselftest: Desecalate reporting of missing _GNU_SOURCE
To: Mark Brown <broonie@kernel.org>
Cc: shuah@kernel.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_104741_955589_989BA005 
X-CRM114-Status: GOOD (  14.58  )
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

T24gV2VkLCBNYXkgMjIsIDIwMjQgYXQgNDoyMeKAr0FNIE1hcmsgQnJvd24gPGJyb29uaWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAyMiwgMjAyNCBhdCAxMjo1Njo0OEFNICsw
MDAwLCBFZHdhcmQgTGlhdyB3cm90ZToKPgo+ID4gdG8gbWFrZSBzdG9wcGluZyBidWlsZHMgZWFy
bHkgcmVwbGFjZSB0aGUgc3RhdGljX2Fzc2VydCgpIHdpdGggYQo+ID4gbWlzc2luZyB3aXRob3V0
IG1ha2luZyB0aGUgZXJyb3IgbW9yZSBzZXZlcmUgdGhhbiBpdCBhbHJlYWR5IHdhcy4gIFRoaXMK
PiA+IHdpbGwgYmUgbW9vdCBvbmNlIHRoZSBpc3N1ZSBpcyBmaXhlZCBwcm9wZXJseSBidXQgcmVk
dWNlcyB0aGUgZGlzcnVwdGlvbgo+ID4gd2hpbGUgdGhhdCBoYXBwZW5zLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5
OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiA+IC0tLQo+ID4gIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2tzZWxmdGVzdF9oYXJuZXNzLmggfCAyICstCj4KPiBZb3UndmUgbm90
IHByb3ZpZGVkIGEgU2lnbmVkLW9mZi1ieSBmb3IgdGhpcyBzbyBwZW9wbGUgY2FuJ3QgZG8gYW55
dGhpbmcKPiB3aXRoIGl0LCBwbGVhc2Ugc2VlIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0
aW5nLXBhdGNoZXMucnN0IGZvcgo+IGRldGFpbHMgb24gd2hhdCB0aGlzIGlzIGFuZCB3aHkgaXQn
cyBpbXBvcnRhbnQuCgpTb3JyeSwgbXkgbWlzdGFrZSwgSSBmb3Jnb3QgdG8gYWRkIGl0IGFmdGVy
IGNoZXJyeS1waWNraW5nLiAgSWYgYWRkZWQKaW4gYSByZXBseSBsaWtlIHNvIHdvdWxkIGl0IHN1
ZmZpY2UsIG9yIHdvdWxkIEkgbmVlZCB0byBzZW5kIGFub3RoZXIKcGF0Y2g/CgpTaWduZWQtb2Zm
LWJ5OiBFZHdhcmQgTGlhdyA8ZWRsaWF3QGdvb2dsZS5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
