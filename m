Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32FAC5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 20:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CF0CNtzMM36Itbu694lGVFcldZtne65cXNhSV7kdtEA=; b=HkE9PWKijEkn+Hz5UMxNUFHQrj
	DEzdVIMaNujXW7/vE1nj2ihTmSJGNU1fO+efVEcS1zUZt/nHoPX1GKrJsmMcu6pFkWvmj9qrcMdJ4
	t8Sbu2VhJ4l+twZGfAqdl0JbbPUYSqRcLgfAznDvoc3UzVMTvl1TTYJsoKipw+6gso4020ZpB6rPs
	fwBeFSfM6RyvIJt8ZKeX/xJEOzC2yO2Xp1WjLLbNHj1IIFwCTZfwWqIzDjWmDJ2x6pmrvxmuAylu/
	z08syXjVOZnkkOk1HZY4RLfbFWAOyy3uPjCLPekFX/y6tRYgbY8cQ1+os0sz6H6elWOCLSlDCXE++
	oQb3qSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFas-00000006THk-0iQC;
	Thu, 22 Feb 2024 20:22:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdFam-00000006TGX-3on0
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 20:22:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d7431e702dso2066325ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 12:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708633372; x=1709238172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvT+skZuVtuaziWCz2kmemhaijwUBiIAPgW6NDDOZYI=;
        b=KCq/J4KMHpKshHtkaO+Q7Wo6HsweiAoM+sh9i8YdqI3abLaiZ6I3oQp09ZWcyRmdLy
         fUZC2UpybJyjHNCxrR/aAi3mhGGDX8R19fwu9kTBKpH+C/Kb79ReL+SVhId5jCwC2cek
         WZY3JvmQb+gfmy4lwTXiHvIaSN8Yo0R2ih5wIFM8tDfZ4lmH4lhdohrUCfb2Ou+DnhPT
         v55lhqWbpUAUsze6OqSMmvosdSIVhdzT1RU2/7fxt3VtCh0cjp7WmCxUEse73KNv72Sb
         Q3ysPgXHj1ImuwMtMLPqNA55s1aMIewO/x0sIQbJDctv5dIjH8Db7cSL2BDIpAjz8HzW
         AFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708633372; x=1709238172;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvT+skZuVtuaziWCz2kmemhaijwUBiIAPgW6NDDOZYI=;
        b=eD6WDuzfc1apF0vTYAEmu8oTnH71CktcMYqfhmgkpGSqGTiq64shGgHKwdDxv//W6F
         qamjwZBYaniIvzeJVT/KlMslmPLSbP5lBfAT3yUBkmwbVxygvStxYexEdEfl3h0KrqOR
         V6g6FCqWyzJ1wkZ5j2dQeO5cW55ldK2qKp6cmBeXzE7llJ24ug47SMPvs2E3CmkueE3t
         S7klqZErpX3iDJhFcaThgNkf8ta85pPRHjcKw+4qh51XVvZMeJWx/QTHwv6R8MTkD9MH
         rsXnQpd9gPxb0ec4hyxUGrTAmIrhtfdT8fKDhGgxd5CeMMRpMC7l+jALW56jsQOA6VzH
         mBQw==
X-Forwarded-Encrypted: i=1; AJvYcCXuQwwqzZv4M5rN/M2yxY9/uvGKg0KH0rEy3g6QcBDeHMnMZ3oMFHuGIJlfroxGVWiopgkjIimH/bBMwPTzLfHFD9M1nxr4ZHsLxEtsgVZV
X-Gm-Message-State: AOJu0YzCcei1Y6VTeWjObUjBYaeowye80mmyi7msZIze8oB/UtV/8oei
	BX/tOh739oIzIDUEZQVwXnw7FJntINJ7FfAp8P3PoPaMgk+Eg8LwE3gn6hBJbV7aI6c85NPMVlq
	adKo=
X-Google-Smtp-Source: AGHT+IFX4Geggl92/IhMKrsNdt44zGVSwXSPbnf0r4+rgv+x/pEZjNOybydm0AF02MocpX49oCjQPA==
X-Received: by 2002:a17:902:db11:b0:1db:f049:6315 with SMTP id m17-20020a170902db1100b001dbf0496315mr15282166plx.51.1708633371738;
        Thu, 22 Feb 2024 12:22:51 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id km16-20020a17090327d000b001d9fc826522sm2839647plb.239.2024.02.22.12.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:22:51 -0800 (PST)
Date: Thu, 22 Feb 2024 12:22:51 -0800 (PST)
X-Google-Original-Date: Thu, 22 Feb 2024 12:22:43 PST (-0800)
Subject: Re: [PATCH v2] riscv: mm: fix NOCACHE_THEAD does not set bit[61] correctly
In-Reply-To: <CAHVXubg8NKBdeutbwrJh5hdZwhRFsgyTPknM=xUhV=VG+o2Lrw@mail.gmail.com>
CC: cyy@cyyself.name, linux-riscv@lists.infradead.org, jszhang@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, guoren@kernel.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-4faa415d-93d9-46fc-b2f3-3b08c0de28ee@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_122252_970685_4D5693AC 
X-CRM114-Status: GOOD (  20.30  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMSBGZWIgMjAyNCAwNjowMDo0OSBQU1QgKC0wODAwKSwgYWxleGdoaXRpQHJpdm9z
aW5jLmNvbSB3cm90ZToKPiBIaSBZYW5neXUsCj4KPiBPbiBXZWQsIEZlYiAyMSwgMjAyNCBhdCA0
OjA04oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+IHdyb3RlOgo+Pgo+PiBQcmV2
aW91cyBjb21taXQgZGJmYmRhM2JkNmJmICgicmlzY3Y6IG1tOiB1cGRhdGUgVC1IZWFkIG1lbW9y
eSB0eXBlCj4+IGRlZmluaXRpb25zIikgZnJvbSBwYXRjaCBbMV0gbWlzc2VkIGEgYDxgIGZvciBi
aXQgc2hpZnRpbmcsIHJlc3VsdCBpbgo+PiBiaXQoNjEpIGRvZXMgbm90IHNldCBpbiBfUEFHRV9O
T0NBQ0hFX1RIRUFEIGFuZCBsZWF2ZXMgYml0KDApIHNldCBpbnN0ZWFkLgo+PiBUaGlzIHBhdGNo
IGdldCB0aGlzIGZpeGVkLgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAqIHJld29yZCBjb21t
aXQgbWVzc2FnZSBhbmQgYWRkIHJldmlld2VkLWJ5Cj4+Cj4+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwOTEyMDcyNTEwLjI1MTAtMS1qc3poYW5nQGtlcm5l
bC5vcmcvIFsxXQo+PiBGaXhlczogZGJmYmRhM2JkNmJmICgicmlzY3Y6IG1tOiB1cGRhdGUgVC1I
ZWFkIG1lbW9yeSB0eXBlIGRlZmluaXRpb25zIikKPj4gU2lnbmVkLW9mZi1ieTogWWFuZ3l1IENo
ZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2Vy
bmVsLm9yZz4KPj4gUmV2aWV3ZWQtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9y
Zz4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaCB8IDIgKy0K
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3BndGFibGUtNjQuaAo+PiBpbmRleCBiNDIwMTdkNzY5MjQuLmI5OWJk
NjYxMDdhNiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0
LmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmgKPj4gQEAgLTEz
Niw3ICsxMzYsNyBAQCBlbnVtIG5hcG90X2NvbnRfb3JkZXIgewo+PiAgICogMTAwMTAgLSBJTyAg
IFN0cm9uZ2x5LW9yZGVyZWQsIE5vbi1jYWNoZWFibGUsIE5vbi1idWZmZXJhYmxlLCBTaGFyZWFi
bGUsIE5vbi10cnVzdGFibGUKPj4gICAqLwo+PiAgI2RlZmluZSBfUEFHRV9QTUFfVEhFQUQgICAg
ICAgICAgICAgICAgKCgxVUwgPDwgNjIpIHwgKDFVTCA8PCA2MSkgfCAoMVVMIDw8IDYwKSkKPj4g
LSNkZWZpbmUgX1BBR0VfTk9DQUNIRV9USEVBRCAgICAoKDFVTCA8IDYxKSB8ICgxVUwgPDwgNjAp
KQo+PiArI2RlZmluZSBfUEFHRV9OT0NBQ0hFX1RIRUFEICAgICgoMVVMIDw8IDYxKSB8ICgxVUwg
PDwgNjApKQo+PiAgI2RlZmluZSBfUEFHRV9JT19USEVBRCAgICAgICAgICgoMVVMIDw8IDYzKSB8
ICgxVUwgPDwgNjApKQo+PiAgI2RlZmluZSBfUEFHRV9NVE1BU0tfVEhFQUQgICAgIChfUEFHRV9Q
TUFfVEhFQUQgfCBfUEFHRV9JT19USEVBRCB8ICgxVUwgPDwgNTkpKQo+Pgo+PiAtLQo+PiAyLjQz
LjAKPj4KPgo+IEkgZmVlbCBwcmV0dHkgY29uZmlkZW50IG9uIHRoaXMgb25lIDopCgpZYSwgc29y
cnkgSSBtaXNzZWQgaXQgdGhlIGZpcnN0IHRpbWUgYXJvdW5kIC0tIHRoYXQncyBhIGJpdCBlbWJh
cmFzc2luZyAKOykuICBJdCBzaG91bGQgc2hvdyB1cCBvbiBmaXhlcyBzb29uLCBqdXN0IHF1ZXVl
ZCB1cCBiZWhpbmQgc29tZSBvdGhlciAKcGF0Y2hlcyBidXQgdGhlIHRlc3RlciBpcyBiYWNrIGFs
aXZlIHNvIHRoaW5nIHNob3VsZCBiZSBzYW5lIGFnYWluLgoKPiBSZXZpZXdlZC1ieTogQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+Cj4gVGhhbmtzLAo+Cj4gQWxleAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
