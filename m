Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E222DC7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 16:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7F3YkweGnhVCJRIyaNaylPMu5pEI4M0Q4XIocbpi+Q=; b=dH4/IAih22CnS2
	cTttx7NTmJ5P3oC59KibQ2ZyaJRmHH+47YvXTIhtlsVEAGvcUDDwnNrhmc6Ia5LWvmfkQHJ6+xGNW
	t5zHbm5bb6xkr/CYntvWATnnEw5SW559VfbYnjbYZns1ANrD9PkTm/nNKm2QqsXaYfqMMe0n1zh0h
	UShOIhHX4I+Eaw8sCerJUObRHBhlavtVEqgdDkCdrPNoEa3e0xxyd5aJg4rImREFVA36Vx0ZsSXrU
	B4rDV4wzyUyJqFUj6z4mu8j70sqnLpJfU9M+iClYuxg00S1QXNnevRqJvRSoOmCufZh2cuMh4Chmm
	A1UMoOwryayvStXPHhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q427e-00EYWX-21;
	Tue, 30 May 2023 16:22:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q427b-00EYUq-2q
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 16:22:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DA7A62CAB
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 16:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88D7C4339B
	for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685463774;
	bh=JGeOPr61EyRFf2BxMykJnZJ/gcMx62FZwVC/VLhCqLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JL+fH5y+8C5qPBJYQWPbXjIqM2lL0QtUk4Gvq6RvFfcMNTqrnfXSdiV00866UicbW
	 Oz8PX6Y19MIZ7wwC4SkojqG0ojDjwV8xjV9U7sRNgoK5YfxyhqOM14cuA2tiSyMDu3
	 ZZrNRgSZ/+BttKq/ZI6OO3HRXpFjskquiXylawsQ8Sge48v4ZBkNM9J0Ob+Atd1cbI
	 pAwogzMhqQZvze5EEwcgJhI6k0cYB6Jc6QZOSCVQel3OjmXvWYVDvUy6WSikNojDVL
	 Ov5s9iEzzs9xE4b7e0IhQrZAbwXIKDCoPxpytmfU3n7DO3nDfb3b7F/5rdZu1cCCdQ
	 Vlxn9oV2wjHqw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5149e65c218so4247320a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 09:22:54 -0700 (PDT)
X-Gm-Message-State: AC+VfDzlWOm508g4O7CZ1iWxJ9lNZPBvO+EZ7gO/IKRV0oyT4QG8UaBn
	cmX1LC9plc8+2QHxtabUfCn/B2Ag3MlKrP/2lDE=
X-Google-Smtp-Source: ACHHUZ5oYKOXYVKPGZYL2Sd9Egd4s06eBPOBJs+Vz76XkHlA6svwRkGBAjLGUyj94EpgMZbFw5pOhDIGICxJjGBIEvg=
X-Received: by 2002:aa7:ccca:0:b0:50d:f9b3:444c with SMTP id
 y10-20020aa7ccca000000b0050df9b3444cmr1813894edt.17.1685463773136; Tue, 30
 May 2023 09:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230529073845.2859178-1-guoren@kernel.org> <20230529-jasmine-amigo-6d01f6852b35@wendy>
 <CAJF2gTRSoZbexqka=_7nf4+dHZW2FGf++BiTMypfTbeoGAbUiA@mail.gmail.com>
 <CAJF2gTTzUfp7xDr8myA+xMcxGNEQ+XLEYMfoR91NShdBAQMu7Q@mail.gmail.com>
 <CABgGipXu7iq-J5v6GVMPrnHiGVLuMxabB0_hPb+o+04T2MAwpw@mail.gmail.com>
 <CAJF2gTR2fAkk1532VWmsWP5DSYN17ib80wa5QwwT=DC0LY9gGw@mail.gmail.com>
 <20230530-static-smith-96cf543bfda2@spud> <CAJF2gTTD-Qbp1bJ2EZgpBTzRrWtUEy7k644GzYES2qRWY3D3LQ@mail.gmail.com>
In-Reply-To: <CAJF2gTTD-Qbp1bJ2EZgpBTzRrWtUEy7k644GzYES2qRWY3D3LQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 31 May 2023 00:22:41 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTje+Kbyw2iC+ZsfeftTJ9CyqHN789wgocr0WOFnk=3dg@mail.gmail.com>
Message-ID: <CAJF2gTTje+Kbyw2iC+ZsfeftTJ9CyqHN789wgocr0WOFnk=3dg@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Fixup modules compile error
To: Conor Dooley <conor@kernel.org>
Cc: Andy Chiu <andy.chiu@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, paul.walmsley@sifive.com, 
	palmer@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_092255_958009_08BEB83B 
X-CRM114-Status: GOOD (  16.03  )
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

T24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgMTI6MTTigK9BTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAzMSwgMjAyMyBhdCAxMjowNOKAr0FNIENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVHVlLCBNYXkgMzAs
IDIwMjMgYXQgMTE6Mzc6MzhQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+ID4gSSBqdXN0IGZv
dW5kIExpbnV4LW5leHQgYnVpbGQgaXMgYnJva2VuLCBzbyBJIHNlbnQgdGhlIHBhdGNoLiBJdCBz
ZWVtcwo+ID4gPiB5b3UndmUgc29sdmVkIHRoYXQuIFRoYXQncyBva2F5Lgo+ID4KPiA+IEFyZSB5
b3Ugc3VyZSB0aGF0IGxpbnV4LW5leHQgaXMgYnJva2VuIGJlY2F1c2Ugb2YgdGhpcz8KPiA+IFRo
aXMgc2VyaWVzIHNob3VsZCBub3QgYmUgaW4gbGludXgtbmV4dC4uLgo+IEkgbWVhbjoKPgo+IGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BhbG1lci9saW51
eC5naXQvbG9nLz9oPWZvci1uZXh0Ckkgd291bGQgY2hhbmdlIGl0IHRvCgorcmlzYy12IGdpdCBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXgu
Z2l0I2Zvci1uZXh0CgpuZXh0LgoKPgo+Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVu
CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
