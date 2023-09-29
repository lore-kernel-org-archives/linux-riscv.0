Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ABF9E743F4
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvzgzD7hy4cS2iEt39jsEh3NpoEa1DvF6VVf8lmYky4=; b=fPDdjbRgT4XRga
	VzdIkLCHYF4x7yr2uSxr6312VAtGzbuPH4T0G9+iTWDoOk28CWhMG5fzx92zDL4p1hCQeqT97xMwF
	L6hwPsYYRp/I0Splu/VQHbc23S2dvCPKnTrHCRTp9x6TzaPQfasjuVa8ZFl+6ldwHGar+5x2Sz2Be
	rc1veLxqGavhu+4rQTmn1MI6Bm5AbqjUfwg90I+DNtDiO31NnvJ8W7eI3xJaXX7gaPheMEca8ThXj
	0Kxju9zUgMTTkQ5o10X7mFJ6uofJ/oteOlKT8kQCndToIyqhe8p95m01dpApcyRPHgsBuUwRdov5g
	qQdVbwQ/gDOaQubkBjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm8pG-007N5I-2M;
	Fri, 29 Sep 2023 08:26:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm8pB-007N4p-0b
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 08:26:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso111109965e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 01:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695975970; x=1696580770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX41g5Ex2mgCQT3kQj51PYJPgefWmJ9XFZpouAvDF2A=;
        b=i1X4qClyscQKPOVzKsmH22+K1IiMP+AzwNgM1DaL0FcTrNI/VhTLDdBl7go6rgoRwO
         OKMdEwDWhAQROV+Avys3hwRf9dd5z1MDYeLCPllslJfgbxXqVFrN1dZZILLok+Tx2+jy
         6mjMPiQGiI1EQju20XQujic8XwHXL2jprV/3v70Syjr8SF1Qw2Gwn81AmpRk0TmoyKiF
         3VpSsiafr5bsZHzUmB4vRbdYTLq9kac3rDKkGp2ertOt9UQxXaT6KI9Q5AI3OeZ7H+uV
         XGDHAJc8Hf15SKrJb7IACmEFARPV1LJN5C5GkQlXStrRHkpHXJzFKI3nc0R58nf/8gxe
         n9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695975970; x=1696580770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WX41g5Ex2mgCQT3kQj51PYJPgefWmJ9XFZpouAvDF2A=;
        b=CGKCu8moengo/FdVqM28xQOkozyu/ZLwvnuinFoWhgVJ2iPv2+8Ix70P1GONkLO0I9
         OwtL7NCeynqEQLibT/6NYywzyGVf7gGVVdP4sRGhpwHyZYxcHP1Vj36Va6GUk3nA5qSY
         NE8pHVGYVVLHEL10OSuc7468ibVYgc6xd+mwyB9yGIrMwgOys1CcYRSrR2BaXFrcQIYT
         T/gOczJxcnrNA1cog0sTxyf4+tUgQLbDGvb2VBz8Fp1pIcKbKKH0tlT4tltNBTZ+x/oX
         fymvoY/jyjRILOvvma0nc2K2M7P51lV30L7uYOccXHL9lrfzSRHPcXPu70IuuRTMsV7l
         tj6Q==
X-Gm-Message-State: AOJu0Yy30X0tbrESkdNqs0C/yYD2KNb+IWunzr9i4kfGQcpZLww8MaiY
	QgxxaGhtFMarBmXD5OaOZZRJk/pjqKwRPYgoIWC2+w==
X-Google-Smtp-Source: AGHT+IFotf6XO1lJDjNVA9fLU3PZ+wvlEqKsBa8iaRjpXi7p8SNYxOKrZWD/2txCrOvhDZQYnkNiaXxU6mEtgFRW1Ho=
X-Received: by 2002:a05:600c:3785:b0:401:b204:3b98 with SMTP id
 o5-20020a05600c378500b00401b2043b98mr3941830wmr.19.1695975970106; Fri, 29 Sep
 2023 01:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <f74665d1-4d28-01a2-5694-b06fde202d39@ghiti.fr> <20230928231239.2144579-2-twuufnxlz@gmail.com>
In-Reply-To: <20230928231239.2144579-2-twuufnxlz@gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 29 Sep 2023 10:25:59 +0200
Message-ID: <CAHVXubhG2c=ShFHF4hMMFm8=BYDTyDUduOizujbUWQBW+55wTw@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix out of bounds in walk_stackframe
To: Edward AD <twuufnxlz@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor@kernel.org, 
	gregkh@linuxfoundation.org, guoren@kernel.org, jirislaby@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, liushixin2@huawei.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, 
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_012613_460326_7E11AC0E 
X-CRM114-Status: GOOD (  15.28  )
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

SGkgRWR3YXJkLAoKT24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMToxMuKAr0FNIEVkd2FyZCBBRCA8
dHd1dWZueGx6QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgdm1hbGxvYyBhbmQga2VybmVsIGFk
ZHJlc3NlcyBjaGVjayB0byBwcmV2ZW50IGludmFsaWQgYWNjZXNzLgo+Cj4gQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA5MjYxMDU5NDkuMTAyNTk5NS0yLXR3dXVmbnhs
ekBnbWFpbC5jb20vCj4gRml4ZXM6IDVkODU0NGUyZDAwNyAoIlJJU0MtVjogR2VuZXJpYyBsaWJy
YXJ5IHJvdXRpbmVzIGFuZCBhc3NlbWJseSIpCj4gUmVwb3J0ZWQtYW5kLXRlc3QtYnk6IHN5emJv
dCs4ZDI3NTdkNjJkNDAzYjJkOTI3NUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4gTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzAwMDAwMDAwMDAwMDAxNzBkZjA2MDVjY2Y5MWFA
Z29vZ2xlLmNvbS9ULwo+IFNpZ25lZC1vZmYtYnk6IEVkd2FyZCBBRCA8dHd1dWZueGx6QGdtYWls
LmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIHwgMyArKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N0YWNrdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+
IGluZGV4IDY0YTljMDkzYWVmOS4uMDMxYTRhMzVjMWQwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJh
Y2UuYwo+IEBAIC01NCw2ICs1NCw5IEBAIHZvaWQgbm90cmFjZSB3YWxrX3N0YWNrZnJhbWUoc3Ry
dWN0IHRhc2tfc3RydWN0ICp0YXNrLCBzdHJ1Y3QgcHRfcmVncyAqcmVncywKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAgLyogVW53aW5kIHN0YWNrIGZy
YW1lICovCj4gICAgICAgICAgICAgICAgIGZyYW1lID0gKHN0cnVjdCBzdGFja2ZyYW1lICopZnAg
LSAxOwo+ICsgICAgICAgICAgICAgICBpZiAoKGlzX3ZtYWxsb2NfYWRkcihmcmFtZSkgJiYgIXBm
bl92YWxpZChwYWdlX3RvX3Bmbih2bWFsbG9jX3RvX3BhZ2UoZnJhbWUpKSkpIHx8Cj4gKyAgICAg
ICAgICAgICAgICAgICAgIXZpcnRfYWRkcl92YWxpZChmcmFtZSkpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgICAgIHNwID0gZnA7Cj4gICAgICAgICAgICAg
ICAgIGlmIChyZWdzICYmIChyZWdzLT5lcGMgPT0gcGMpICYmIChmcmFtZS0+ZnAgJiAweDcpKSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZnAgPSBmcmFtZS0+cmE7Cj4gLS0KPiAyLjI1LjEK
PgoKSSdtIHN0aWxsIG5vdCBjb252aW5jZWQgdGhpcyB3aWxsIGZpeCB0aGUga2FzYW4gb3V0LW9m
LWJvdW5kcwphY2Nlc3NlcywgdGhlIHBhZ2UgY2FuIGJlIHZhbGlkIGJ1dCB0aGUgcmVhZCBjYW4g
aGFwcGVuIGF0IGFuIG9mZnNldApub3QgaW5pdGlhbGl6ZWQgYW5kIHRyaWdnZXIgc3VjaCBlcnJv
cnMgcmlnaHQ/IEkgc3RpbGwgdGhpbmsgdGhlcmUgaXMKc29tZXRoaW5nIHdlaXJkIGFib3V0IHRo
ZSBzdGFjayBmcmFtZSwgYXMgdG8gbWUgdGhpcyBzaG91bGQgbm90IGhhcHBlbgooYnV0IGFkbWl0
dGVkbHkgSSBkb24ndCBrbm93IG11Y2ggYWJvdXQgdGhhdCkuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
