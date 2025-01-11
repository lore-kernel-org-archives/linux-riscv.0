Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A22E77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 01:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcRKA45TY0w/pIPY1IsWnGDo73BN3Zy6Twt7nxjF2DA=; b=RCVE4taFfbWoA/
	YwujdGIL4QcI2DdoCmmQ4PHqx7I1Q4J6/HcfHuzme7NscBB8/fBDbYbNoSlp/Df5e/TrYHSEcayED
	R6iUhlriBr/aeSCC5sHbZTHzeJHqOv5Syown9UPat+r+AWni6PJFyp9OEjeQzQJ4A5+GYqpWaJzNs
	NzRUD4ity22oTmPGnMe08OuZ09ntCmWBSro2okNk0+lWT07KcD26eDagh9q1w1a8Pk6wQ5Fxtat3K
	nqYe0Le8ZJJVXeIdqz3AsA7Olwo9gR9e8BktG6lWsAekPNDLUokiO6QVSF1IBsedvTQDrrveNfig4
	s5f5uRY6p1B3g1QmaYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQ54-0000000HTZ9-0dSQ;
	Sat, 11 Jan 2025 01:14:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQ51-0000000HTYg-3bHN
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 01:14:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8286C5C584D
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jan 2025 01:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFD5C4CEE4
	for <linux-riscv@lists.infradead.org>; Sat, 11 Jan 2025 01:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736558062;
	bh=n+iRm2VaEJvvCCHmY+X42mIpAqGf52//qef9C9sjFzQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d7pch/5Ai3D88+mYzxr4tKRXyYeEsstHsz/AP6jZ82xJ0g8upbBSoEyBI1db98t7t
	 0F7GdQO9QmYnkCBfdeM0TsLHrK2pqjQv8cI8X0FiuY2Ms4o3JBAMlNVMJ1Aj4rtUZx
	 n7EsOzPpwFwaSZMVErvoOh4P2tCVro1wy0UTSjeopvuM+99b64WltPIgDZ0rfVXozl
	 z1QPZbXeyS/eIDR2uhGW+RsGUDEUUmSXBzKyJB+V/JGWCSARSemS6DVeMnPLj+u/vt
	 YU02Cea6ay5x5waHfpsNge0+ud9mpJXhHYConhWsavxvveg4Qj4GGZjhEhUWGfROT7
	 axdJtyrH0Lr1Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53df80eeeedso2493223e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 17:14:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGTzvDJmwhIpr8psMJZbklajnjjFBiqI+O2/OcBxPeybensS5P6UXHYJFL8j4r9P4Q9aDwsPgzPLO9MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLH4lbRsTMl+Kkv0bXSEAvjIOqrCVDJod3j4ZdUEVWocsNjZmJ
	UAyTaIH4QtusU9V8H/0k69PT4cFFTOt/CWyAucqlr+kaGOnw1ZeITJPmGxIDKlW1oPUU2eh0e02
	pWLWPl0tP5B7L/IzlvEsvcqjl36Q=
X-Google-Smtp-Source: AGHT+IHY04Sligz279mJ22kXB8Zjf/y7VUC/N6Z6gUTMrSAcA4W4uor1DT6HPAp0b14YuYtRYWDA7k5jcE8WiamKzAc=
X-Received: by 2002:a05:6512:6cc:b0:53e:350a:729e with SMTP id
 2adb3069b0e04-542845b94d0mr4507675e87.35.1736558060770; Fri, 10 Jan 2025
 17:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20250110082744.457067-2-ardb+git@google.com> <CAK7LNASygf5gRdYOOa3KsKbz8mny9nnn5RduuGtP5WoWgXDTQA@mail.gmail.com>
 <CAMj1kXEPq6VU19qzmW9DNVG=nzoGbnCMt7dE5nXeZCqk2JPE3A@mail.gmail.com> <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com>
In-Reply-To: <CAHk-=wiGfhxb4q4T2=W=Vg=sHwZwwMTN2EaDYbmS0VG1Srdb-w@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 10:13:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNASrzZnoLeRQz9FH6EUEz1rSPY_-GHvmS=8JA2R8eCjSKg@mail.gmail.com>
X-Gm-Features: AbW1kvYUzM6oy1WA3iNunnG5Otg_1tGF6QyaJF7fe05aRP67ws8j4txIP2SJldQ
Message-ID: <CAK7LNASrzZnoLeRQz9FH6EUEz1rSPY_-GHvmS=8JA2R8eCjSKg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Strip runtime const RELA sections correctly
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Ard Biesheuvel <ardb+git@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_171423_986249_C5646BEB 
X-CRM114-Status: GOOD (  14.75  )
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

T24gU2F0LCBKYW4gMTEsIDIwMjUgYXQgMzozM+KAr0FNIExpbnVzIFRvcnZhbGRzCjx0b3J2YWxk
c0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIDEwIEphbiAyMDI1IGF0
IDEwOjExLCBBcmQgQmllc2hldXZlbCA8YXJkYkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBJ
IHN1cHBvc2UgdGhpcyBpcyBhIGNvbnNlcXVlbmNlIG9mIDg5NjJiNmI0NzViZGRjICgia2J1aWxk
OiBwcmludAo+ID4gc2hvcnQgbG9nIGluIGFkZGl0aW9uIHRvIHRoZSB3aG9sZSBjb21tYW5kIHdp
dGggVj0xIikgd2hpY2ggaW50cm9kdWNlZAo+ID4gYW4gJChpZiApIHdoZXJlIHRoZSBlbHNlIGJy
YW5jaCBpcyBzaW1wbHkgJzonIGFuZCBzbyBpdCBhbHdheXMKPiA+IHN1Y2NlZWRzLgo+Cj4gSG1t
LiBPZGQuIEkgZG9uJ3Qgc2VlIHdoeSB0aGF0IHBhcnQgb2YgdGhlIGNvbW1pdCBleGlzdHMsIGFu
ZCB5b3UncmUKPiByaWdodCwgdGhhdCBzZWVtcyBsaWtlIGEgYmFkIGlkZWEuCj4KPiBBbmQgcmVt
b3ZpbmcgdGhhdCBvZGQgJChpZi4uKSBhbmQgbWFraW5nIGl0IGp1c3QgZG8KPgo+ICAgIGNtZCA9
IEBzZXQgLWU7ICQoJChxdWlldClsb2dfcHJpbnQpICQoZGVsZXRlLW9uLWludGVycnVwdCkgJChj
bWRfJCgxKSkKPgo+IGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGFueSBvYnZpb3VzIG5lZ2F0aXZlIGVm
ZmVjdHMuCgpXaGVuIGNtZF9mb28gaXMgbm90IGRlZmluZWQsICQoY2FsbCBpZl9jaGFuZ2VkLGZv
bykgd2lsbCBmYWlsIHdpdGggdGhpcyBjaGFuZ2UsCmJ1dCAkKGNhbGwgY21kLGZvbykgd2lsbCBz
dWNjZWVkIHJlZ2FyZGxlc3MuCgpJbiBNYWtlZmlsZSwgdGhlIHZhcmlhYmxlIGV4cGFuc2lvbiB3
b3JrcyBsaWtlIHRoZSBsYXR0ZXIuCldoZW4gWCBpcyBub3QgZGVmaW5lZCwgJChYKSBpcyBleHBh
bmRlZCB0byBhbiBlbXB0eSBzdHJpbmcgc3VjY2Vzc2Z1bGx5LgpUaGlzIGlzIHVzZWZ1bC4KCgo+
IEknbSBwcm9iYWJseSBtaXNzaW5nIHNvbWUgb2J2aW91cyByZWFzb24gd2h5IHRoYXQgJChpZi4u
KSB3YXMgYWRkZWQsCj4gaXQncyBiZWVuIHRoYXQgd2F5IGZvciB0d28geWVhcnMgbm93LgoKV2Ug
ZG8gbm90IG5lZWQgdG8gZ3VhcmQgYm90aCBhIGRlZmluaXRpb24gYW5kIGl0cyBjYWxsc2l0ZS4K
CkZvciBleGFtcGxlLCB0aGUgY3VycmVudCBjb2RlIGluIGFyY2gvcG93ZXJwYy9NYWtlZmlsZS5w
b3N0bGluazoKCnZtbGludXg6IEZPUkNFCiAgICAgICAgQHRydWUKaWZkZWYgQ09ORklHX1BQQzY0
CiAgICAgICAgJChjYWxsIGNtZCxoZWFkX2NoZWNrKQplbmRpZgppZmRlZiBDT05GSUdfUkVMT0NB
VEFCTEUKICAgICAgICAkKGNhbGwgaWZfY2hhbmdlZCxyZWxvY3NfY2hlY2spCmVuZGlmCmlmZGVm
IENPTkZJR19GVU5DVElPTl9UUkFDRVIKaWZuZGVmIENPTkZJR19QUEM2NF9FTEZfQUJJX1YxCiAg
ICAgICAgJChjYWxsIGNtZCxmdHJhY2VfY2hlY2spCmVuZGlmCmVuZGlmCgoKLi4uIGNhbiBiZSBz
aW1wbGlmaWVkIGludG86Cgp2bWxpbnV4OiBGT1JDRQogICAgICAgICQoY2FsbCBjbWQsaGVhZF9j
aGVjaykKICAgICAgICAkKGNhbGwgaWZfY2hhbmdlZCxyZWxvY3NfY2hlY2spCiAgICAgICAgJChj
YWxsIGNtZCxmdHJhY2VfY2hlY2spCgoKCgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFt
YWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
