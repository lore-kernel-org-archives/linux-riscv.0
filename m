Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6428C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drBMtivh2xhB0B/Ter5n05RfeA14ozPhh222R2hAL4o=; b=4jo2xoAnh8EYrl
	jTLLhzq3TToG6evKd4NuWYi6h0/9JKKou4QAE/PHYNSvhNtvbrafRI2PGWiAN9BDzYIQqur1+r+Xf
	fZ+Q7jy7HMtXonGyHHGC1HTJas37zlF2Vwv/iw+a79TBpa6HGrPgQnY04/h62nKDK2d+XVDk7Zh0n
	Xvz/7Q6PahHu9cSXLXRMxN06VcNOGNycvcuLkc3r6ifZGGiGwhirHfiwDRR1kXEoIYFuG2MKfekAD
	LA0YLilA4Nb1MDeWtzV6E4dHLHw6xclalWKivDJr0DQI3GXKUazcw1EvV6PBYAUFfYRMhHAUGGYqN
	ujaOWPoreVRerebUKreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iMp-003uEb-0W;
	Wed, 08 Nov 2023 13:13:11 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0iMm-003uDG-06;
	Wed, 08 Nov 2023 13:13:09 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-4a18f724d47so2388821e0c.3;
        Wed, 08 Nov 2023 05:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699449175; x=1700053975; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ft6eZ7gdvNdoX8zWgCy+9HBlTTXU2ZG2Rqwy96S/LbY=;
        b=Xt7qsO5tt/M6Yu3r9UZUEkv8/Nh4S6vPyQdqsTEIgyC7gJ4xkZ+SGEx6frkmdlZzFY
         pdqusghVpLzMRHcv7oeHa8JnMvlmLagQKSlK0hhWlX1eWdXcVhPFyUtl6kAqiwh8al9P
         UoI6Qk5FicmSXnXSOYHf6f+6IHJ2ldj/KNxOeyM1JHncU/bYmzLxpN4maHbUz4ZMBIpc
         7ZnQDkdY2yIiZld5Zx/sClLF+jV/LnIwDvbKjXclWOoQGJYp6FgIsEHh2y8z0MnJLmeg
         kKs3Glb2MuFY1tASOHIqKq10YlurdwZ+UWwUhFec9+digiV4kx9RB8EOwHToEYKEWw+d
         VYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699449175; x=1700053975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ft6eZ7gdvNdoX8zWgCy+9HBlTTXU2ZG2Rqwy96S/LbY=;
        b=IW1RU3pRFksnvTEkYWRH/I7CEkICvXAnEzv/DqkBBLuahgnJyVGOxgrupUZYV2XZkO
         EfgeEpGOn3U/woEgSHt7f4bcdB6JO6SWyCAYoKx7xn83SKgkNynqPplQf8J+ZTuheqWB
         54RJCgcu5XeSQNq2eaJQc4nGYZlUVtEYYZwsMfbDYb3UEGTQulKEMfFdwnLjYTLUBe5v
         loYlMG+hKql9rwW94e9lw5+EZCMDPzzJ6J9nT8ezojwVmvVgh3l7oeQO7g5GlTOWQBWw
         xelbCTUejwQd79amWbx+Ku8bPRpKVlb1F/9fpOcbDtfdGi/ElOVDsW6O2Qc/kxfwsj+q
         e4LQ==
X-Gm-Message-State: AOJu0YyPnYlkbdAAeItv8n+JbD41XqflmCS2amveDQ5ZRnH6efyvULSg
	FgfG7MEVne1tcnI/LYeqViI08JEHMpDHTWPVGMs=
X-Google-Smtp-Source: AGHT+IGnNKiNfLM7gSd9tpJTMtrPx7MGpLQC/Nnecax5MydayZ6xY9XvkwIZEEoSNkBj2PAjYKc48smVJ/kWIrB5PY4=
X-Received: by 2002:a1f:9c0d:0:b0:49a:9a34:ec40 with SMTP id
 f13-20020a1f9c0d000000b0049a9a34ec40mr1439708vke.2.1699449175113; Wed, 08 Nov
 2023 05:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20231026084010.11888-1-alexghiti@rivosinc.com>
In-Reply-To: <20231026084010.11888-1-alexghiti@rivosinc.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 8 Nov 2023 13:12:20 +0000
Message-ID: <CA+V-a8tZLZV5vnoZNhXO7OSURv8xH9mSzMpZMYfmaLaAct6=9Q@mail.gmail.com>
Subject: Re: [PATCH -fixes v2] drivers: perf: Do not broadcast to other cpus
 when starting a counter
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_051308_093847_27D0E745 
X-CRM114-Status: GOOD (  21.71  )
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

T24gVGh1LCBPY3QgMjYsIDIwMjMgYXQgOTo0MeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIGNvbW1hbmQ6Cj4KPiAkIHBlcmYgcmVj
b3JkIC1lIGN5Y2xlczprIC1lIGluc3RydWN0aW9uczprIC1jIDEwMDAwIC1tIDY0TSBkZCBpZj0v
ZGV2L3plcm8gb2Y9L2Rldi9udWxsIGNvdW50PTEwMDAKPgo+IGdpdmVzIHJpc2UgdG8gdGhpcyBr
ZXJuZWwgd2FybmluZzoKPgo+IFsgIDQ0NC4zNjQzOTVdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDEw
NCBhdCBrZXJuZWwvc21wLmM6Nzc1IHNtcF9jYWxsX2Z1bmN0aW9uX21hbnlfY29uZCsweDQyYy8w
eDQzNgo+IFsgIDQ0NC4zNjQ1MTVdIE1vZHVsZXMgbGlua2VkIGluOgo+IFsgIDQ0NC4zNjQ2NTdd
IENQVTogMCBQSUQ6IDEwNCBDb21tOiBwZXJmLWV4ZWMgTm90IHRhaW50ZWQgNi42LjAtcmM2LTAw
MDUxLWczOTFkZjgyZThlYzMtZGlydHkgIzczCj4gWyAgNDQ0LjM2NDc3MV0gSGFyZHdhcmUgbmFt
ZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+IFsgIDQ0NC4zNjQ4NjhdIGVwYyA6IHNtcF9jYWxs
X2Z1bmN0aW9uX21hbnlfY29uZCsweDQyYy8weDQzNgo+IFsgIDQ0NC4zNjQ5MTddICByYSA6IG9u
X2VhY2hfY3B1X2NvbmRfbWFzaysweDIwLzB4MzIKPiBbICA0NDQuMzY0OTQ4XSBlcGMgOiBmZmZm
ZmZmZjgwMDlmOWUwIHJhIDogZmZmZmZmZmY4MDA5ZmE1YSBzcCA6IGZmMjAwMDAwMDAwMDM4MDAK
PiBbICA0NDQuMzY0OTY2XSAgZ3AgOiBmZmZmZmZmZjgxNTAwYWEwIHRwIDogZmY2MDAwMDAwMmI4
MzAwMCB0MCA6IGZmMjAwMDAwMDAwMDM4YzAKPiBbICA0NDQuMzY0OTgyXSAgdDEgOiBmZmZmZmZm
ZjgxNTAyMWYwIHQyIDogMDAwMDAwMDAwMDAwMDAxZiBzMCA6IGZmMjAwMDAwMDAwMDM4YjAKPiBb
ICA0NDQuMzY0OTk4XSAgczEgOiBmZjYwMDAwMDAyYzU0ZDk4IGEwIDogZmY2MDAwMDAwMmE3Mzk0
MCBhMSA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICA0NDQuMzY1MDEzXSAgYTIgOiAwMDAwMDAwMDAw
MDAwMDAwIGEzIDogMDAwMDAwMDAwMDAwMDAwMyBhNCA6IDAwMDAwMDAwMDAwMDAxMDAKPiBbICA0
NDQuMzY1MDI5XSAgYTUgOiAwMDAwMDAwMDAwMDEwMTAwIGE2IDogMDAwMDAwMDAwMGYwMDAwMCBh
NyA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICA0NDQuMzY1MDQ0XSAgczIgOiAwMDAwMDAwMDAwMDAw
MDAwIHMzIDogZmZmZmZmZmZmZmZmZmZmZiBzNCA6IGZmNjAwMDAwMDJjNTRkOTgKPiBbICA0NDQu
MzY1MDYwXSAgczUgOiBmZmZmZmZmZjgxNTM5NjEwIHM2IDogZmZmZmZmZmY4MGMyMGM0OCBzNyA6
IDAwMDAwMDAwMDAwMDAwMDAKPiBbICA0NDQuMzY1MDc1XSAgczggOiAwMDAwMDAwMDAwMDAwMDAw
IHM5IDogMDAwMDAwMDAwMDAwMDAwMSBzMTA6IDAwMDAwMDAwMDAwMDAwMDEKPiBbICA0NDQuMzY1
MDkwXSAgczExOiBmZmZmZmZmZjgwMDk5Mzk0IHQzIDogMDAwMDAwMDAwMDAwMDAwMyB0NCA6IDAw
MDAwMDAwZWFjMGM2ZTYKPiBbICA0NDQuMzY1MTA0XSAgdDUgOiAwMDAwMDAwNDAwMDAwMDAwIHQ2
IDogZmY2MDAwMDAwMmUwMTBkMAo+IFsgIDQ0NC4zNjUxMjBdIHN0YXR1czogMDAwMDAwMDIwMDAw
MDEwMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAzCj4g
WyAgNDQ0LjM2NTIyNl0gWzxmZmZmZmZmZjgwMDlmOWUwPl0gc21wX2NhbGxfZnVuY3Rpb25fbWFu
eV9jb25kKzB4NDJjLzB4NDM2Cj4gWyAgNDQ0LjM2NTI5NV0gWzxmZmZmZmZmZjgwMDlmYTVhPl0g
b25fZWFjaF9jcHVfY29uZF9tYXNrKzB4MjAvMHgzMgo+IFsgIDQ0NC4zNjUzMTFdIFs8ZmZmZmZm
ZmY4MDZlOTBkYz5dIHBtdV9zYmlfY3RyX3N0YXJ0KzB4N2EvMHhhYQo+IFsgIDQ0NC4zNjUzMjdd
IFs8ZmZmZmZmZmY4MDZlODgwYz5dIHJpc2N2X3BtdV9zdGFydCsweDQ4LzB4NjYKPiBbICA0NDQu
MzY1MzM5XSBbPGZmZmZmZmZmODAxMjExMWE+XSBwZXJmX2FkanVzdF9mcmVxX3VudGhyX2NvbnRl
eHQrMHgxOTYvMHgxYWMKPiBbICA0NDQuMzY1MzU2XSBbPGZmZmZmZmZmODAxMjM3YWE+XSBwZXJm
X2V2ZW50X3Rhc2tfdGljaysweDc4LzB4OGMKPiBbICA0NDQuMzY1MzY4XSBbPGZmZmZmZmZmODAw
M2ZhZjQ+XSBzY2hlZHVsZXJfdGljaysweGU2LzB4MjVlCj4gWyAgNDQ0LjM2NTM4M10gWzxmZmZm
ZmZmZjgwMDhhMDQyPl0gdXBkYXRlX3Byb2Nlc3NfdGltZXMrMHg4MC8weDk2Cj4gWyAgNDQ0LjM2
NTM5OF0gWzxmZmZmZmZmZjgwMDk5MWVjPl0gdGlja19zY2hlZF9oYW5kbGUrMHgyNi8weDUyCj4g
WyAgNDQ0LjM2NTQxMF0gWzxmZmZmZmZmZjgwMDk5M2U0Pl0gdGlja19zY2hlZF90aW1lcisweDUw
LzB4OTgKPiBbICA0NDQuMzY1NDIyXSBbPGZmZmZmZmZmODAwOGE2YWE+XSBfX2hydGltZXJfcnVu
X3F1ZXVlcysweDEyNi8weDE4YQo+IFsgIDQ0NC4zNjU0MzNdIFs8ZmZmZmZmZmY4MDA4YjM1MD5d
IGhydGltZXJfaW50ZXJydXB0KzB4Y2UvMHgxZGEKPiBbICA0NDQuMzY1NDQ0XSBbPGZmZmZmZmZm
ODA2Y2RjNjA+XSByaXNjdl90aW1lcl9pbnRlcnJ1cHQrMHgzMC8weDNhCj4gWyAgNDQ0LjM2NTQ1
N10gWzxmZmZmZmZmZjgwMDZhZmE2Pl0gaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnErMHg4MC8weDEx
NAo+IFsgIDQ0NC4zNjU0NzBdIFs8ZmZmZmZmZmY4MDA2NWI4Mj5dIGdlbmVyaWNfaGFuZGxlX2Rv
bWFpbl9pcnErMHgxYy8weDJhCj4gWyAgNDQ0LjM2NTQ4M10gWzxmZmZmZmZmZjgwNDVmYWVjPl0g
cmlzY3ZfaW50Y19pcnErMHgyZS8weDQ2Cj4gWyAgNDQ0LjM2NTQ5N10gWzxmZmZmZmZmZjgwOGE5
YzYyPl0gaGFuZGxlX3Jpc2N2X2lycSsweDRhLzB4NzQKPiBbICA0NDQuMzY1NTIxXSBbPGZmZmZm
ZmZmODA4YWE3NjA+XSBkb19pcnErMHg3Yy8weDdlCj4gWyAgNDQ0LjM2NTc5Nl0gLS0tWyBlbmQg
dHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tCj4KPiBUaGF0J3MgYmVjYXVzZSB0aGUgZml4IGlu
IGNvbW1pdCAzZmVjMzIzMzM5YTQgKCJkcml2ZXJzOiBwZXJmOiBGaXggcGFuaWMKPiBpbiByaXNj
diBTQkkgbW1hcCBzdXBwb3J0Iikgd2FzIHdyb25nIHNpbmNlIHRoZXJlIGlzIG5vIG5lZWQgdG8g
YnJvYWRjYXN0Cj4gdG8gb3RoZXIgY3B1cyB3aGVuIHN0YXJ0aW5nIGEgY291bnRlciwgdGhhdCdz
IG9ubHkgbmVlZGVkIGluIG1tYXAgd2hlbgo+IHRoZSBjb3VudGVycyBjb3VsZCBoYXZlIGFscmVh
ZHkgYmVlbiBzdGFydGVkIG9uIG90aGVyIGNwdXMsIHNvIHNpbXBseQo+IHJlbW92ZSB0aGlzIGJy
b2FkY2FzdC4KPgo+IEZpeGVzOiAzZmVjMzIzMzM5YTQgKCJkcml2ZXJzOiBwZXJmOiBGaXggcGFu
aWMgaW4gcmlzY3YgU0JJIG1tYXAgc3VwcG9ydCIpCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IFRlc3RlZC1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+IFRlc3RlZC1ieTogWXUgQ2hpZW4gUGV0ZXIgTGlu
IDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIEZp
eCB3cm9uZyB1c2FnZSBvZiBwbXVfc2JpX3NldF9zY291bnRlcmVuIGluIHBtdV9zYmlfY3RyX3N0
b3AsIGFzCj4gICBub3RpY2VkIGJ5IFBldGVyIExpbgo+IC0gQWRkIFRCIGZyb20gUGV0ZXIgTGlu
Cj4KPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyB8IDYgKystLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KVGVzdGVkLWJ5OiBMYWQg
UHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+ICNPbgpS
Wi9GSXZlIFNNQVJDIEVWSwoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4g
aW5kZXggOTZjN2Y2NzBjOGYwLi5mY2IwYzcwY2EyMjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9w
ZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMK
PiBAQCAtNTQzLDggKzU0Myw3IEBAIHN0YXRpYyB2b2lkIHBtdV9zYmlfY3RyX3N0YXJ0KHN0cnVj
dCBwZXJmX2V2ZW50ICpldmVudCwgdTY0IGl2YWwpCj4KPiAgICAgICAgIGlmICgoaHdjLT5mbGFn
cyAmIFBFUkZfRVZFTlRfRkxBR19VU0VSX0FDQ0VTUykgJiYKPiAgICAgICAgICAgICAoaHdjLT5m
bGFncyAmIFBFUkZfRVZFTlRfRkxBR19VU0VSX1JFQURfQ05UKSkKPiAtICAgICAgICAgICAgICAg
b25fZWFjaF9jcHVfbWFzayhtbV9jcHVtYXNrKGV2ZW50LT5vd25lci0+bW0pLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBtdV9zYmlfc2V0X3Njb3VudGVyZW4sICh2b2lkICop
ZXZlbnQsIDEpOwo+ICsgICAgICAgICAgICAgICBwbXVfc2JpX3NldF9zY291bnRlcmVuKCh2b2lk
ICopZXZlbnQpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgcG11X3NiaV9jdHJfc3RvcChzdHJ1Y3Qg
cGVyZl9ldmVudCAqZXZlbnQsIHVuc2lnbmVkIGxvbmcgZmxhZykKPiBAQCAtNTU0LDggKzU1Myw3
IEBAIHN0YXRpYyB2b2lkIHBtdV9zYmlfY3RyX3N0b3Aoc3RydWN0IHBlcmZfZXZlbnQgKmV2ZW50
LCB1bnNpZ25lZCBsb25nIGZsYWcpCj4KPiAgICAgICAgIGlmICgoaHdjLT5mbGFncyAmIFBFUkZf
RVZFTlRfRkxBR19VU0VSX0FDQ0VTUykgJiYKPiAgICAgICAgICAgICAoaHdjLT5mbGFncyAmIFBF
UkZfRVZFTlRfRkxBR19VU0VSX1JFQURfQ05UKSkKPiAtICAgICAgICAgICAgICAgb25fZWFjaF9j
cHVfbWFzayhtbV9jcHVtYXNrKGV2ZW50LT5vd25lci0+bW0pLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHBtdV9zYmlfcmVzZXRfc2NvdW50ZXJlbiwgKHZvaWQgKilldmVudCwg
MSk7Cj4gKyAgICAgICAgICAgICAgIHBtdV9zYmlfcmVzZXRfc2NvdW50ZXJlbigodm9pZCAqKWV2
ZW50KTsKPgo+ICAgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfUE1VLCBTQklfRVhUX1BN
VV9DT1VOVEVSX1NUT1AsIGh3Yy0+aWR4LCAxLCBmbGFnLCAwLCAwLCAwKTsKPiAgICAgICAgIGlm
IChyZXQuZXJyb3IgJiYgKHJldC5lcnJvciAhPSBTQklfRVJSX0FMUkVBRFlfU1RPUFBFRCkgJiYK
PiAtLQo+IDIuMzkuMgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
