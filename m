Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF61E7849A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 07:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h23TYcEj5HfYSHnFTKgi+tcaudK8vwqouEqARD38Bsk=; b=jbLo8SsATPLrE+
	rBLHerU1XM3VnRtpPkE4pP8ZQ8frt08ONRlyn+2nVK4Gu+L8M9zdtiGNYaucnh67C2U8+xmsY1kJz
	mwqgjJBV8HsJAA/lkZeWUFMLiVZDh2ONxKQU5S7/WmIe7HOaBHCpXcB9VtTwZb5x2ttYtTU8WoWiz
	BTm8NHlXZpZdXczMRRgthncVQkde/OjuPRWD3sMDgPC3DAlwNn8kx91AG4rVbScEloz2/y8HkqXl0
	l+jCD1Cfuc8igAPK6v9ObqTZkoJNMxTfiGjj05NyPS7YSEAqNU9L/gOYSN+QDVBOCbFZapBYrGDst
	ADqVNRqeWugWUv1WjFsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnD88-00C4hh-2l;
	Mon, 02 Oct 2023 07:14:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnD84-00C4gu-1k
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 07:14:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3215f19a13aso16082199f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696230844; x=1696835644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vyEJm0Vs8HzMk1ARIArOtOc0lGgfBnw3jKoPIGWI2IU=;
        b=a9XwAFz/SIDK/EJ2cxbkPpXgT/+A1LE4EFq9FkSL3ExEfQ7qarLRaiu08nLyiz6inV
         6gbYALiC74TR9g3mrVBnMVwGDdZ0JmN0Z0gBMFcdqtX6tsIjCMw1BvnwvTktyq7npCqY
         Sh/dlQWO2uv3lup2n+AtrN62GDz84VH6b+tzWUs/2WdIf435xQAp+RC9SK5bcBQBTSZk
         p6FMNGSz8T7IMmWavGG6k2oUXCKijMUNpdKJa9jDq27h8TyA8Mcrv2MUYsBNuf/m3Nhz
         ba4v26Mn+X0uojq3AZ3s48kUeopKhLhWovEXsrCclXPI37OoxD64H+MsikfaZdob8W8s
         VVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230844; x=1696835644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyEJm0Vs8HzMk1ARIArOtOc0lGgfBnw3jKoPIGWI2IU=;
        b=fZ3NgzR7CYMQhrd1Sktui6QsDUbbF/Cv8A0za1TeGlxJE41Lfs0eilZ+Icam51mnQz
         zGF4uE7iJksRZLYQsQkrmEpo9YjQVcAcUX6ttLFr8R9UdVCULZlvrXhS5U1f9dEnAPTj
         xs4KAYeDxR+ynfZXYWY04FQLm6vNmTiKOy6KuQEUTa8QaN0OvKfIb0wIpYsCO5mz2gEJ
         0vBiON5t6Q7JN+fYG3ef+Zb8o5Bj3doHJRalvJvzQ9T6tRuI5ZjP5/5SydaZT42B3gCS
         JXoc8PqQUi+JDYoKeF2/23DC5Tsb0QG/uC2+Dkh+EqGr88W3XL9y0UuAfvwcDZCE8bxS
         jAkQ==
X-Gm-Message-State: AOJu0YySwjCuU3t/Ngjkh7crSV1MXufqx4pB9Px2S9vZOEunVsUHAPBx
	wRIx5dmuUFepQrbJg3Gj+oOX3hhUSrhXnId3sJNjPg==
X-Google-Smtp-Source: AGHT+IE1VZdXGHpgzUv4UDd0KzzvuoCETZFBpMqTRickj71vAcjHjYrXq5/yuyrtgxCez/B9xnBlD/+UaNE0EyqoKzE=
X-Received: by 2002:a5d:674a:0:b0:324:7a6b:d4fe with SMTP id
 l10-20020a5d674a000000b003247a6bd4femr9856489wrw.9.1696230843723; Mon, 02 Oct
 2023 00:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHVXubhG2c=ShFHF4hMMFm8=BYDTyDUduOizujbUWQBW+55wTw@mail.gmail.com>
 <20230929230549.45206-2-twuufnxlz@gmail.com>
In-Reply-To: <20230929230549.45206-2-twuufnxlz@gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 2 Oct 2023 09:13:52 +0200
Message-ID: <CAHVXubiBVKJ89fBtV1fvEpoOyLvdvjkWfeDmw2yZsod5ao9hPw@mail.gmail.com>
Subject: Re: [PATCH] Test for riscv fixes
To: Edward AD <twuufnxlz@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor@kernel.org, 
	gregkh@linuxfoundation.org, guoren@kernel.org, jirislaby@kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, liushixin2@huawei.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, 
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_001408_814198_5C5068BC 
X-CRM114-Status: GOOD (  18.47  )
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

SGkgRWR3YXJkLAoKT24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMTowNuKAr0FNIEVkd2FyZCBBRCA8
dHd1dWZueGx6QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbGV4YW5kcmUsCj4KPiBPbiBGcmks
IDI5IFNlcCAyMDIzIDEwOjI1OjU5ICswMjAwIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiBJJ20gc3RpbGwgbm90IGNvbnZpbmNlZCB0aGlzIHdpbGwg
Zml4IHRoZSBrYXNhbiBvdXQtb2YtYm91bmRzCj4gPiBhY2Nlc3NlcywgdGhlIHBhZ2UgY2FuIGJl
IHZhbGlkIGJ1dCB0aGUgcmVhZCBjYW4gaGFwcGVuIGF0IGFuIG9mZnNldAo+ID4gbm90IGluaXRp
YWxpemVkIGFuZCB0cmlnZ2VyIHN1Y2ggZXJyb3JzIHJpZ2h0PyBJIHN0aWxsIHRoaW5rIHRoZXJl
IGlzCj4gPiBzb21ldGhpbmcgd2VpcmQgYWJvdXQgdGhlIHN0YWNrIGZyYW1lLCBhcyB0byBtZSB0
aGlzIHNob3VsZCBub3QgaGFwcGVuCj4gPiAoYnV0IGFkbWl0dGVkbHkgSSBkb24ndCBrbm93IG11
Y2ggYWJvdXQgdGhhdCkuCj4gVGhlIGFkZGVkIGNoZWNrIGNhbiBjb25maXJtIHRoYXQgdGhlIHBo
eXNpY2FsIHBhZ2UgaXMgaW52YWxpZCAod2hldGhlciBpdCBpcyBhCj4gdm1hbGxvYyBhbGxvY2F0
ZWQgcGFnZSBvciBhIHNsYWIgYWxsb2NhdGVkIHBhZ2UpLCBhbmQgZXhpdCB0aGUgZm9yIGxvb3Ag
d2hlbiBpdCBpcyBpbnZhbGlkLgoKWWVzLCBidXQgdG8gbWUgdGhpcyBpcyBub3Qgd2hhdCBoYXBw
ZW5zIGluIHRoZSBidWcgcmVwb3J0IHlvdSBsaW5rOgoKfCBCVUc6IEtBU0FOOiBvdXQtb2YtYm91
bmRzIGluIHdhbGtfc3RhY2tmcmFtZSsweDEzMC8weDJmMgphcmNoL3Jpc2N2L2tlcm5lbC9zdGFj
a3RyYWNlLmM6NTkKfCBSZWFkIG9mIHNpemUgOCBhdCBhZGRyIGZmMjAwMDAwMDZkMzdjMzggYnkg
dGFzayBzd2FwcGVyLzEvMAoKU28gdGhlIHJlYWQgYXQgYWRkcmVzcyBmZjIwMDAwMDA2ZDM3YzM4
IGlzIG5vdCAibm9ybWFsIiBhY2NvcmRpbmcgdG8KS0FTQU4gKHlvdSBjYW4gc2VlIHRoZXJlIGlz
IG5vIHRyYXAsIG1lYW5pbmcgdGhlIHBoeXNpY2FsIG1hcHBpbmcKZXhpc3RzKS4KCnwgVGhlIGJ1
Z2d5IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgdmlydHVhbCBtYXBwaW5nIGF0CnwgIFtmZjIwMDAw
MDA2ZDMwMDAwLCBmZjIwMDAwMDA2ZDM5MDAwKSBjcmVhdGVkIGJ5Ogp8IGtlcm5lbF9jbG9uZSsw
eDExOC8weDg5NiBrZXJuZWwvZm9yay5jOjI5MDkKClRoZSB2aXJ0dWFsIGFkZHJlc3MgaXMgbGVn
aXRpbWF0ZSBzaW5jZSB0aGUgdm1hIGV4aXN0cyBeCgp8IFRoZSBidWdneSBhZGRyZXNzIGJlbG9u
Z3MgdG8gdGhlIHBoeXNpY2FsIHBhZ2U6CnwgcGFnZTpmZjFjMDAwMDAyNTBkYmMwIHJlZmNvdW50
OjEgbWFwY291bnQ6MCBtYXBwaW5nOjAwMDAwMDAwMDAwMDAwMDAKaW5kZXg6MHgwIHBmbjoweDk0
MzZmCgpBbmQgdGhlIHBoeXNpY2FsIHBhZ2UgYWxzbyBleGlzdHMgXgoKU28gSSBpbnNpc3QsIGNo
ZWNraW5nIHRoYXQgYSBwaHlzaWNhbCBtYXBwaW5nIGV4aXN0cyB0byBleGl0IHRoZSBsb29wCmlz
IG5vdCBlbm91Z2gsIHRvIG1lLCB0aGUgZXJyb3IgaGVyZSBpcyB0aGF0IHRoZSBiYWNrdHJhY2Ug
Z29lcyAidG9vCmZhciIgYXQgYW4gYWRkcmVzcyB3aGVyZSBub3RoaW5nIHdhcyB3cml0dGVuIGJl
Zm9yZSBhbmQgdGhlbiBLQVNBTgpjb21wbGFpbnMgYWJvdXQgdGhhdCwgYWdhaW4sIHdlIGRvbid0
IHRha2UgYW55IHBhZ2UgZmF1bHQgaGVyZSBzbyBpdCdzCm5vdCBhIHByb2JsZW0gb2YgZXhpc3Rp
bmcgcGh5c2ljYWwgbWFwcGluZy4KCj4KPiBQZXJoYXBzIHdlIGNhbiB0cnVzdCB0aGUgdGVzdCBy
ZXN1bHRzIG9mIHN5emJvdC4KPgo+IFRoYW5rcywKPiBlZHdhcmQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
