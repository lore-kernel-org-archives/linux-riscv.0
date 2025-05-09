Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A118BC3ABCD
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bE36B26zsgZOGvKDhSS8qDyIDSJxp076dyGhjFdaNbM=; b=SvmU4FSEc/s3yA
	ahduqlog7VRcpKHRb4gGwOBlXY4RLnYGj+yGMaUoe6odM8NGMWH1FFMh+RUueH7wOhHx8sYjp5z3h
	Rh9gW/Jb/jM34xipArKM6hfNBerXc4i/sDx9+yXk2PG1tcTkzxBbWE1Q4hx1Z65xeCJ1rWjzfTsua
	Zkzt3y1bUDc589+ejULUEzBzIitoWg9Qpkm+dAZ6TN7qgsG8HM6mhtbDpRve5a+tSlhEY5D+rp8Dk
	WLqn3Utub0HCBXlt0lHgQY5ztpu1GXxdz1zpVzuQQ6L5vqub/7+k0BZOxJLUUF0prryiE0/KTqOKs
	PaDxLhuNtVsqijUyZKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNjS-00000003ktz-36i3;
	Fri, 09 May 2025 13:25:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMrN-00000003as9-2NaB
	for linux-riscv@bombadil.infradead.org;
	Fri, 09 May 2025 12:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=AmSXbLbqCzPF90SNiwdHQn9vNmHfXn9lOr1cdvWu+qo=; b=JpBRcivl3zIniE8cClX+rI5k3j
	8eoNUCQ/geMGRDJ1Ya/hFnesNq1ACZPEugLKQHiJpA/hiRiFmRV1TO+cHt2hCIfhe8lEe5Bhs0yac
	O6gy+/bP9TqwNnbR4HpJPUfAA70S5ZiS1mFQ8esScRxArm46S4RnX9PTmiaK9u9o+EH7ZUbsQzW73
	YSx48ob/hFYo7H5Z+Zt5ersS7qD6q9VvaryitES4MYw8G36jI5YJAS2Yjn8GzsrxoI7pEQOv1mr1u
	bJ7RqwDX5VXpqrYUcA0OvPynrN5Ji/l5tBQKGG/N8MwWt1cHZOQBjMN7bPHNfEe5qI914zl0sTCc0
	zXX3OUZA==;
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uDMrJ-0000000GGmh-3T8W
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 12:29:48 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-861525e9b0aso185854639f.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746793783; x=1747398583; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmSXbLbqCzPF90SNiwdHQn9vNmHfXn9lOr1cdvWu+qo=;
        b=nBrY0J+SB348vZMYqJ0HNkS/7TCsXLNPJ7qkrs+BSx9UD2BOkliWGeXAfKKL1HtcI9
         eLHtqEpWPSXtfXIHaAMoaGz2y9ocQvROG8shEqRs39LZ925zdYcwaCEZlgaBOsp6YgBM
         VLbzPuE9CLuQtxOVcP8NQzCh/rwaXzKs8ylrNttqbTZwfO7YHxK6CUcJoSin1gNS+W5Q
         +MsrrJI7pivSfUXoxDGIvjafEdYztzc42HCMLlb8o8m6AeLZjhaqVQF+6WLAPdwZKC7g
         Z6/ya/sHWoP1gtaGlia9zXVUjJNJRMz4jD23siIoysbsynuEHT5dZ/zVRWPtrffAlqXG
         YZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793783; x=1747398583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmSXbLbqCzPF90SNiwdHQn9vNmHfXn9lOr1cdvWu+qo=;
        b=t5GEWiKrwz6bNQCKHNUMKiZ+Y2vQwBN4X63ruqvjZaPxBz4N6jQsi+3Rbsm9eV4qzE
         XYnKzlFxmbPalIwEgM6wbL/lRC8w7MSuOmjTx+CGHqo9InHBN/q9HoyDr1ZIw8Aj3xhw
         Nh/NFLXLIqq5J6R+tYJOl7SitxTQHv79ple4fUb7LwNYqXFy6LqJT7Urid5kfRmpmXce
         FJOzbuNKrpcTgsPmE4ns+LlCD4jK0tIwLjpxVYxz2WKE1PnLK8HG9qOLe4bPsfxgamL6
         f/ohL7Vh0QlOSnpmrzorKNzRXhOnwGUXA6WIOkgQcncbdeLn6KCGF6US+k0C+s0KDTH5
         NEFg==
X-Forwarded-Encrypted: i=1; AJvYcCUbwgQsnk7YHYR2v/KckmC3QvE15Ke/tnyGmXl1Ofxrxdus/3We2rdo4XBZGJiRzyLnjF5KF7sKzRBh7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YytkasGLUTw272aWQxlKUe0Vzyw75UI9K/Jvu3ByDZrsrd0UIo7
	bTGqqc1xxaCFlQH6D5ackIhWf0ax9eaQhUWBTEV2CrxV047ok67UMvaLJSZyXRZQ5zwwOa4Gdew
	GuUo8LcNBj+MbINTkVYVcbvE9l7xAesE04QbStQ==
X-Gm-Gg: ASbGncuTgQXFpxQtPm6GWYkZbCqjli2Je9JgWp9eqVyTGPYR2aVQjNIVHZGmBbDkzaf
	n8A/d2Vu4m3SIJZCrWDZXNSg3GGC3K3UaunJE5WDXqjbKs8YY7sx4USyL8yBGMmEgQgOocfUbz4
	iiVdYsyswb1jcPwQfF/GE85YiO2FI/uOOOxQ==
X-Google-Smtp-Source: AGHT+IHp3DAd3qnbQTzEXrr/AOZUFWtye6vkktK43JI1h3+333nR09AfAjWbSTrZebXAYTQjM4E8ILVD9YcJzu9MLfI=
X-Received: by 2002:a05:6e02:1605:b0:3d0:239a:c46a with SMTP id
 e9e14a558f8ab-3da7e1e6ff5mr39960875ab.9.1746793779664; Fri, 09 May 2025
 05:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com> <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
 <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com> <CAAhSdy2U_LsoVm=4jdZQWdOkPkCH8c2bk6rsts8rY+ZGKwVuUg@mail.gmail.com>
 <20250509-0811f32c1643d3db0ad04f63@orel>
In-Reply-To: <20250509-0811f32c1643d3db0ad04f63@orel>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 May 2025 17:59:28 +0530
X-Gm-Features: AX0GCFsIuiVVtRxrNte_DR3qLk13RCLnfai43T5xiVxY6FHBVScamxZ1lBQWA4g
Message-ID: <CAAhSdy389g=cvi81e7SKAi=2KTC2y9bd17aHniTUr4RNY=Kokg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
To: Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_132946_497715_03273221 
X-CRM114-Status: GOOD (  54.85  )
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

T24gRnJpLCBNYXkgOSwgMjAyNSBhdCA1OjQ54oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAwOSwgMjAyNSBhdCAwNTozMzo0
OVBNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCAy
OjE24oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiAyMDI1LTA1LTA5VDEyOjI1OjI0KzA1OjMwLCBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPjoKPiA+ID4gPiBPbiBUaHUsIE1heSA4LCAyMDI1IGF0IDg6MDHigK9Q
TSBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPiA+
ID4+Cj4gPiA+ID4+IEFkZCBhIHRvZ2dsZWFibGUgVk0gY2FwYWJpbGl0eSB0byBtb2RpZnkgc2V2
ZXJhbCByZXNldCByZWxhdGVkIGNvZGUKPiA+ID4gPj4gcGF0aHMuICBUaGUgZ29hbHMgYXJlIHRv
Cj4gPiA+ID4+ICAxKSBBbGxvdyB1c2Vyc3BhY2UgdG8gcmVzZXQgYW55IFZDUFUuCj4gPiA+ID4+
ICAyKSBBbGxvdyB1c2Vyc3BhY2UgdG8gcHJvdmlkZSB0aGUgaW5pdGlhbCBWQ1BVIHN0YXRlLgo+
ID4gPiA+Pgo+ID4gPiA+PiAoUmlnaHQgbm93LCB0aGUgYm9vdCBWQ1BVIGlzbid0IHJlc2V0IGJ5
IEtWTSBhbmQgS1ZNIHNldHMgdGhlIHN0YXRlIGZvcgo+ID4gPiA+PiAgVkNQVXMgYnJvdWdodCB1
cCBieSBzYmlfaGFydF9zdGFydCB3aGlsZSB1c2Vyc3BhY2UgZm9yIGFsbCBvdGhlcnMuKQo+ID4g
PiA+Pgo+ID4gPiA+PiBUaGUgZ29hbHMgYXJlIGFjaGlldmVkIHdpdGggdGhlIGZvbGxvd2luZyBj
aGFuZ2VzOgo+ID4gPiA+PiAgKiBSZXNldCB0aGUgVkNQVSB3aGVuIHNldHRpbmcgTVBfU1RBVEVf
SU5JVF9SRUNFSVZFRCB0aHJvdWdoIElPQ1RMLgo+ID4gPiA+Cj4gPiA+ID4gUmF0aGVyIHRoYW4g
dXNpbmcgc2VwYXJhdGUgTVBfU1RBVEVfSU5JVF9SRUNFSVZFRCBpb2N0bCgpLCB3ZSBjYW4KPiA+
ID4gPiBkZWZpbmUgYSBjYXBhYmlsaXR5IHdoaWNoIHdoZW4gc2V0LCB0aGUgc2V0X21wc3RhdGUg
aW9jdGwoKSB3aWxsIHJlc2V0IHRoZQo+ID4gPiA+IFZDUFUgdXBvbiBjaGFuZ2luZyBWQ1BVIHN0
YXRlIGZyb20gUlVOTkFCTEUgdG8gU1RPUFBFRCBzdGF0ZS4KPiA+ID4KPiA+ID4gWWVhaCwgSSBz
dGFydGVkIHdpdGggdGhhdCBhbmQgdGhlbiByZWFsaXplZCBpdCBoYXMgdHdvIGRyYXdiYWNrczoK
PiA+ID4KPiA+ID4gICogSXQgd2lsbCByZXF1aXJlIGxhcmdlciBjaGFuZ2VzIGluIHVzZXJzcGFj
ZXMsIGJlY2F1c2UgZm9yCj4gPiA+ICAgIGV4YW1wbGUgUUVNVSBub3cgZmlyc3QgbG9hZHMgdGhl
IGluaXRpYWwgc3RhdGUgYW5kIHRoZW4gdG9nZ2xlcyB0aGUKPiA+ID4gICAgbXBfc3RhdGUsIHdo
aWNoIHdvdWxkIGluY29ycmVjdGx5IHJlc2V0IHRoZSBzdGF0ZS4KPiA+ID4KPiA+ID4gICogSXQg
d2lsbCBhbHNvIHJlcXVpcmUgYW4gZXh0cmEgSU9DVEwgaWYgYSBzdG9wcGVkIFZDUFUgc2hvdWxk
IGJlCj4gPiA+ICAgIHJlc2V0Cj4gPiA+ICAgICAxKSBTVE9QUEVEIC0+IFJVTk5JTkcgKD0gcmVz
ZXQpCj4gPiA+ICAgICAyKSBSVU5OSU5HIC0+IFNUT1BQRUQgKFZDUFUgc2hvdWxkIGJlIHN0b3Bw
ZWQpCj4gPiA+ICAgIG9yIGlmIHRoZSBjdXJyZW50IHN0YXRlIG9mIGEgVkNQVSBpcyBub3Qga25v
d24uCj4gPiA+ICAgICAxKSA/Pz8gICAgIC0+IFNUT1BQRUQKPiA+ID4gICAgIDIpIFNUT1BQRUQg
LT4gUlVOTklORwo+ID4gPiAgICAgMykgUlVOTklORyAtPiBTVE9QUEVECj4gPiA+Cj4gPiA+IEkg
Y2FuIGRvIHRoYXQgZm9yIHYzIGlmIHlvdSB0aGluayBpdCdzIGJldHRlci4KPiA+Cj4gPiBPa2F5
LCBmb3Igbm93IGtlZXAgdGhlIE1QX1NUQVRFX0lOSVRfUkVDRUlWRUQgaW9jdGwoKQo+ID4KPiA+
ID4KPiA+ID4gPj4gICogUHJlc2VydmUgdGhlIHVzZXJzcGFjZSBpbml0aWFsaXplZCBWQ1BVIHN0
YXRlIG9uIHNiaV9oYXJ0X3N0YXJ0Lgo+ID4gPiA+PiAgKiBSZXR1cm4gdG8gdXNlcnNwYWNlIG9u
IHNiaV9oYXJ0X3N0b3AuCj4gPiA+ID4KPiA+ID4gPiBUaGVyZSBpcyBubyB1c2Vyc3BhY2UgaW52
b2x2ZW1lbnQgcmVxdWlyZWQgd2hlbiBhIEd1ZXN0IFZDUFUKPiA+ID4gPiBzdG9wcyBpdHNlbGYg
dXNpbmcgU0JJIEhTTSBzdG9wKCkgY2FsbCBzbyBTVFJPTkcgTk8gdG8gdGhpcyBjaGFuZ2UuCj4g
PiA+Cj4gPiA+IE9rLCBJJ2xsIGRyb3AgaXQgZnJvbSB2MyAtLSBpdCBjYW4gYmUgaGFuZGxlZCBi
eSBmdXR1cmUgcGF0Y2hlcyB0aGF0Cj4gPiA+IHRyYXAgU0JJIGNhbGxzIHRvIHVzZXJzcGFjZS4K
PiA+ID4KPiA+ID4gVGhlIGxhY2sgb2YgdXNlcnNwYWNlIGludm9sdmVtZW50IGlzIHRoZSBpc3N1
ZS4gIEtWTSBkb2Vzbid0IGtub3cgd2hhdAo+ID4gPiB0aGUgaW5pdGlhbCBzdGF0ZSBzaG91bGQg
YmUuCj4gPgo+ID4gVGhlIFNCSSBIU00gdmlydHVhbGl6YXRpb24gZG9lcyBub3QgbmVlZCBhbnkg
S1ZNIHVzZXJzcGFjZQo+ID4gaW52b2x2ZW1lbnQuCj4gPgo+ID4gV2hlbiBhIFZDUFUgc3RvcHMg
aXRzZWxmIHVzaW5nIFNCSSBIU00gc3RvcCgpLCB0aGUgR3Vlc3QgaXRzZWxmCj4gPiBwcm92aWRl
cyB0aGUgZW50cnkgYWRkcmVzcyBhbmQgYXJndW1lbnQgd2hlbiBzdGFydGluZyB0aGUgVkNQVQo+
ID4gdXNpbmcgU0JJIEhTTSBzdGFydCgpIHdpdGhvdXQgYW55IEtWTSB1c2Vyc3BhY2UgaW52b2x2
ZW1lbnQuCj4gPgo+ID4gSW4gZmFjdCwgZXZlbiBhdCBHdWVzdCBib290IHRpbWUgYWxsIG5vbi1i
b290IFZDUFVzIGFyZSBicm91Z2h0LXVwCj4gPiB1c2luZyBTQkkgSFNNIHN0YXJ0KCkgYnkgdGhl
IGJvb3QgVkNQVSB3aGVyZSB0aGUgR3Vlc3QgaXRzZWxmCj4gPiBwcm92aWRlcyBlbnRyeSBhZGRy
ZXNzIGFuZCBhcmd1bWVudCB3aXRob3V0IGFueSBLVk0gdXNlcnNwYWNlCj4gPiBpbnZvbHZlbWVu
dC4KPgo+IEhTTSBvbmx5IHNwZWNpZmllcyB0aGUgc3RhdGUgb2YgYSBmZXcgcmVnaXN0ZXJzIGFu
ZCB0aGUgSVNBIG9ubHkgYSBmZXcKPiBtb3JlLiBBbGwgb3RoZXIgcmVnaXN0ZXJzIGhhdmUgSU1Q
REVGIHJlc2V0IHZhbHVlcy4gWmVyb3MsIGxpa2UgS1ZNCj4gc2VsZWN0cywgYXJlIGEgZ29vZCBj
aG9pY2UgYW5kIHRoZSBiZXN0IGRlZmF1bHQsIGJ1dCBpZiB0aGUgVk1NIGRpc2FncmVlcywKPiB0
aGVuIGl0IHNob3VsZCBiZSBhbGxvd2VkIHRvIHNlbGVjdCB3aGF0IGl0IGxpa2VzLCBhcyB0aGUg
Vk1NL3VzZXIgaXMgdGhlCj4gcG9saWN5IG1ha2VyIGFuZCBLVk0gaXMgImp1c3QiIHRoZSBhY2Nl
bGVyYXRvci4KClRpbGwgbm93IHRoZXJlIGFyZSBubyBzdWNoIElNUERFRiByZXNldCB2YWx1ZXMg
ZXhwZWN0ZWQuIFdlIHdpbGwKY3Jvc3MgdGhhdCBicmlkZ2Ugd2hlbiBuZWVkZWQuIEFsdGhvdWdo
LCBJIGRvdWJ0IHdlIHdpbGwgZXZlciBuZWVkIGl0LgoKPgo+ID4KPiA+ID4KPiA+ID4gPj4gICog
RG9uJ3QgbWFrZSBWQ1BVIHJlc2V0IHJlcXVlc3Qgb24gc2JpX3N5c3RlbV9zdXNwZW5kLgo+ID4g
PiA+Cj4gPiA+ID4gVGhlIGVudHJ5IHN0YXRlIG9mIGluaXRpYXRpbmcgVkNQVSBpcyBhbHJlYWR5
IGF2YWlsYWJsZSBvbiBTQkkgc3lzdGVtCj4gPiA+ID4gc3VzcGVuZCBjYWxsLiBUaGUgaW5pdGlh
dGluZyBWQ1BVIG11c3QgYmUgcmVzZXR0ZWQgYW5kIGVudHJ5IHN0YXRlIG9mCj4gPiA+ID4gaW5p
dGlhdGluZyBWQ1BVIG11c3QgYmUgc2V0dXAuCj4gPiA+Cj4gPiA+IFVzZXJzcGFjZSB3b3VsZCBz
aW1wbHkgY2FsbCB0aGUgVkNQVSByZXNldCBhbmQgc2V0IHRoZSBjb21wbGV0ZSBzdGF0ZSwKPiA+
ID4gYmVjYXVzZSB0aGUgdXNlcnNwYWNlIGV4aXQgYWxyZWFkeSBwcm92aWRlcyBhbGwgdGhlIHNi
aSBpbmZvcm1hdGlvbi4KPiA+ID4KPiA+ID4gSSdsbCBkcm9wIHRoaXMgY2hhbmdlLiAgSXQgZG9l
c24ndCBtYWtlIG11Y2ggc2Vuc2UgaWYgd2UgYXJlbid0IGZpeGluZwo+ID4gPiB0aGUgc2JpX2hh
cnRfc3RhcnQgcmVzZXQuCj4gPiA+Cj4gPiA+ID4+IFRoZSBwYXRjaCBpcyByZXVzaW5nIE1QX1NU
QVRFX0lOSVRfUkVDRUlWRUQsIGJlY2F1c2Ugd2UgZGlkbid0IHdhbnQgdG8KPiA+ID4gPj4gYWRk
IGEgbmV3IElPQ1RMLCBzb3JyeS4gOikKPiA+ID4gPj4KPiA+ID4gPj4gU2lnbmVkLW9mZi1ieTog
UmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+ID4+IC0tLQo+
ID4gPiA+PiBJZiB5b3Ugc2VhcmNoIGZvciBjYXAgNy40MiBpbiBhcGkucnN0LCB5b3UnbGwgc2Vl
IHRoYXQgaXQgaGFzIGEgd3JvbmcKPiA+ID4gPj4gbnVtYmVyLCB3aGljaCBpcyB3aHkgd2UncmUg
Ny40MywgaW4gY2FzZSBzb21lb25lIGJvdGhlcnMgdG8gZml4IEFSTS4KPiA+ID4gPj4KPiA+ID4g
Pj4gSSB3YXMgYWxzbyBzdHJvbmdseSBjb25zaWRlcmluZyBjcmVhdGluZyBhbGwgVkNQVXMgaW4g
UlVOTkFCTEUgc3RhdGUgLS0KPiA+ID4gPj4gZG8geW91IGtub3cgb2YgYW55IHNpbWlsYXIgcXVp
cmtzIHRoYXQgYXJlbid0IGltcG9ydGFudCwgYnV0IGNvdWxkIGJlCj4gPiA+ID4+IGZpeGVkIHdp
dGggdGhlIG5ldyB1c2Vyc3BhY2UgdG9nZ2xlPwo+ID4gPiA+Cj4gPiA+ID4gVXBvbiBjcmVhdGlu
ZyBhIFZNLCBvbmx5IG9uZSBWQ1BVIHNob3VsZCBiZSBSVU5OQUJMRSBhbmQgYWxsCj4gPiA+ID4g
b3RoZXIgVkNQVXMgbXVzdCByZW1haW4gaW4gT0ZGIHN0YXRlLiBUaGlzIGlzIGludGVudGlvbmFs
IGJlY2F1c2UKPiA+ID4gPiBpbWFnaW5lIGEgbGFyZ2UgbnVtYmVyIG9mIFZDUFVzIGVudGVyaW5n
IEd1ZXN0IE9TIGF0IHRoZSBzYW1lCj4gPiA+ID4gdGltZS4gV2UgaGF2ZSBzcGVudCBhIGxvdCBv
ZiBlZmZvcnQgaW4gdGhlIHBhc3QgdG8gZ2V0IGF3YXkgZnJvbSB0aGlzCj4gPiA+ID4gc2l0dWF0
aW9uIGV2ZW4gaW4gdGhlIGhvc3QgYm9vdCBmbG93LiBXZSBjYW4ndCBleHBlY3QgdXNlciBzcGFj
ZSB0bwo+ID4gPiA+IGNvcnJlY3RseSBzZXQgdGhlIGluaXRpYWwgTVBfU1RBVEUgb2YgYWxsIFZD
UFVzLiBXZSBjYW4gY2VydGFpbmx5Cj4gPiA+ID4gdGhpbmsgb2Ygc29tZSBtZWNoYW5pc20gdXNp
bmcgd2hpY2ggdXNlciBzcGFjZSBjYW4gc3BlY2lmeQo+ID4gPiA+IHdoaWNoIFZDUFUgc2hvdWxk
IGJlIHJ1bm5hYmxlIHVwb24gVk0gY3JlYXRpb24uCj4gPiA+Cj4gPiA+IFdlIGFscmVhZHkgZG8g
aGF2ZSB0aGUgbWVjaGFuaXNtIC0tIHRoZSB1c2Vyc3BhY2Ugd2lsbCBzZXQgTVBfU1RBVEUgb2YK
PiA+ID4gVkNQVSAwIHRvIFNUT1BQRUQgYW5kIHdoYXRldmVyIFZDUFVzIGl0IHdhbnRzIGFzIGJv
b3Qgd2l0aCB0byBSVU5OQUJMRQo+ID4gPiBiZWZvcmUgcnVubmluZyBhbGwgdGhlIFZDUFVzIGZv
ciB0aGUgZmlyc3QgdGltZS4KPiA+Cj4gPiBPa2F5LCBub3RoaW5nIHRvIGJlIGRvbmUgb24gdGhp
cyBmcm9udC4KPiA+Cj4gPiA+Cj4gPiA+IFRoZSB1c2Vyc3BhY2UgbXVzdCBjb3JyZWN0bHkgc2V0
IHRoZSBpbml0aWFsIE1QIHN0YXRlIGFueXdheSwgYmVjYXVzZSBhCj4gPiA+IHJlc3VtZSB3aWxs
IHdhbnQgYSBtcF9zdGF0ZSB0aGF0IGEgZnJlc2ggYm9vdC4KPiA+ID4KPiA+ID4gPiBUaGUgY3Vy
cmVudCBhcHByb2FjaCBpcyB0byBkbyBIU00gc3RhdGUgbWFuYWdlbWVudCBpbiBrZXJuZWwKPiA+
ID4gPiBzcGFjZSBpdHNlbGYgYW5kIG5vdCByZWx5IG9uIHVzZXIgc3BhY2UuIEFsbG93aW5nIHVz
ZXJzcGFjZSB0bwo+ID4gPiA+IHJlc2V0dGluZyBhbnkgVkNQVSBpcyBmaW5lIGJ1dCB0aGlzIHNo
b3VsZCBub3QgYWZmZWN0IHRoZSBmbG93IGZvcgo+ID4gPiA+IFNCSSBIU00sIFNCSSBTeXN0ZW0g
UmVzZXQsIGFuZCBTQkkgU3lzdGVtIFN1c3BlbmQuCj4gPiA+Cj4gPiA+IFllcywgdGhhdCBpcyB0
aGUgZGVzaWduIEkgd2FzIHRyeWluZyB0byBjaGFuZ2UuICBJIHRoaW5rIHVzZXJzcGFjZQo+ID4g
PiBzaG91bGQgaGF2ZSBjb250cm9sIG92ZXIgYWxsIGFzcGVjdHMgb2YgdGhlIGd1ZXN0IGl0IGV4
ZWN1dGVzIGluIEtWTS4KPiA+Cj4gPiBGb3IgU0JJIEhTTSwgdGhlIGtlcm5lbCBzcGFjZSBzaG91
bGQgYmUgdGhlIG9ubHkgZW50aXR5IG1hbmFnaW5nLgo+Cj4gVGhlIFZNTSBzaG91bGQgYWx3YXlz
IGJlIHRoZSBvbmx5IG1hbmFnZXIuIEtWTSBjYW4gcHJvdmlkZSBkZWZhdWx0cyBpbgo+IG9yZGVy
IHRvIHN1cHBvcnQgc2ltcGxlIFZNTXMgdGhhdCBkb24ndCBoYXZlIG9waW5pb25zLCBidXQgVk1N
cyBjb25jZXJuZWQKPiB3aXRoIG1hbmFnaW5nIGFsbCBzdGF0ZSBvbiBiZWhhbGYgb2YgdGhlaXIg
dXNlcnMnIGNob2ljZXMgYW5kIHRvIGVuc3VyZQo+IHN1Y2Nlc3NmdWwgbWlncmF0aW9ucywgd2ls
bCB3YW50IHRvIGJlIGludm9sdmVkLgoKSSB0aGluayB5b3UgbWlzdW5kZXJzdG9vZCBteSBjb21t
ZW50LiBWTU0gaXMgc3RpbGwgdGhlIG92ZXIgbWFuYWdlcgpidXQgdGhlIFZDUFUgU0JJIEhTTSBz
dGF0ZXMgYXJlIG1hbmFnZWQgYnkgdGhlIGtlcm5lbCBLVk0uCgpSZWdhcmRzLApBbnVwCgo+Cj4g
VGhhbmtzLAo+IGRyZXcKPgo+ID4KPiA+ID4KPiA+ID4gQWNjZWxlcmF0aW5nIFNCSSBpbiBLVk0g
aXMgZ29vZCwgYnV0IHVzZXJzcGFjZSBzaG91bGQgYmUgYWJsZSB0byBzYXkgaG93Cj4gPiA+IHRo
ZSB1bnNwZWNpZmllZCBwYXJ0cyBhcmUgaW1wbGVtZW50ZWQuICBUcmFwcGluZyB0byB1c2Vyc3Bh
Y2UgaXMgdGhlCj4gPiA+IHNpbXBsZXN0IG9wdGlvbi4gIChBbmQgc3VmZmljaWVudCBmb3IgZWNh
bGxzIHRoYXQgYXJlIG5vdCBhIGhvdCBwYXRoLikKPiA+ID4KPiA+Cj4gPiBGb3IgdGhlIHVuc3Bl
Y2lmaWVkIHBhcnRzLCB3ZSBoYXZlIEtWTSBleGl0cyBhdCBhcHByb3ByaWF0ZSBwbGFjZXMKPiA+
IGUuZy4gU0JJIHN5c3RlbSByZXNldCwgU0JJIHN5c3RlbSBzdXNwZW5kLCBldGMuCj4gPgo+ID4g
UmVnYXJkcywKPiA+IEFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
