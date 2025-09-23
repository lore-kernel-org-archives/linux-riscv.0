Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13225CAC5B1
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czW3yJTpz5NxjJtKPiRJWAxqXy0oXU8oJGEmWYsMwRg=; b=xvjd9Y0f7gGSPJ
	lxhpDzlFqg4JOqGlv3RSN/N4Y3aPJLmnOkJr6YPF3krMQv36Txn03FwabDs/Il0x0ssX6tx2icgPV
	AbwdNSAI1VpH2jkoBu2t2uwUacdcbsgQ5IhzB4elEUexs+kYKpS9VbNiCRRmwQo3aTIss1iyQ4yEu
	9enZ1W+S1TeOWofydQHpJG5Rm0u0Vm9IWeNf2LC+GI+Bng1CPdfktvhPifgS+//uQKv7uCYYNSLwD
	0kHAZdkUZ8YUXn9W8siKbHoydZl42Vi+vT+Y6d5fBRAF9BazT8m7pONLD5T/vlkwuhcr5w+te/qw0
	+17XyukkWynJJtVSbCKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178i-0000000ERIY-0JoS;
	Tue, 23 Sep 2025 17:49:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v178e-0000000ERF5-3f2m
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 17:49:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso3440777f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 10:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758649755; x=1759254555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
        b=Z7raoLH3/yTKAwr7ZGoTmFV28FZrI29ssO0qaspLKLHIgvIGWSxm3LEHM3aHcZS59D
         GPKDd6dthjhGuAs/Ei/qvV50wBsr0e/wQl29nfqQDwT4ixBWwXBgqBrVfZbTPKP82Mwr
         pfDVV9hv2P4rzCLLGGEDlJMZjTDO3F0jhio5EXBUew5g04zGEwDJWbaz1sUt4pVaS9I4
         0TAfwuypGetpRAhhDJpOMWjaaH+GGZr6JuikQL4PLWx5+Qg5VK85IZpuFwoo8QmlhDKu
         EbdlcjXadxwEDAqww8+npJcoH0MwpvOzrFWmU3B8AhoPSEiMfQdFC994GlZKU5FRFYBL
         a5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758649755; x=1759254555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ak83w47Un+0YVkw6h4ejJTiciQnGZqbDFJcToiU+0xQ=;
        b=VHYa5JLgB1xl2r8yXQO9nDEPAdoZdbtB8VBxIUj1VOL5GEQcZvU5cnXGzlqW0r5B6Q
         zG4rCMBEWfxM3kZMZ8s9g4Q1f006oRBWoZEzN1WV0g0Q4TC6UX/Tk/agybiB0WMV1Eqq
         Yaij/6vBALDgX0cuLxwH1W6nxtkU8I/TmotYN2QRtTwWq0KQttZrwrfJK7nn5Gs1NDpe
         G3yJjnLQREizhU2x+CHoIs4MZRmq+D5jqEwkyaImbU9LmUcpxtOa/GQJdp6RlUdifPy8
         4Fipu+UrttSLwylW99hdqx2PYdUh+eVSFtVHBpg9nseEGgY0idLI93vR4tdF/UyIVlWw
         PWPA==
X-Forwarded-Encrypted: i=1; AJvYcCVnQINMyis5UkN6kHCITn6zHxoVtwY8Xwe1NhO916QHc7t4E/3c4GI2JGyt5zGSBbxnCFlSk0u5nPsFug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxfT7Q8EwpOSdcPCuYfR7yDyqDuZ6o5fHmfeBo6zhGqe90u4/qD
	zlHODGHj7/L6j0EvDVECTkkn7uosPTl5KvlmjKUfeUp9EzQQUDGYVKjAzLAXpS8r8vWEfmjfRHE
	sUwJ4Yc4SKwgbioi+1ysAMxECdg1uve0=
X-Gm-Gg: ASbGncv4jJM18cwBEcLTa2C1oUe4P0kx3MPufmU7YjEj/+FxiSK5/9OLnTQDzeuQcOb
	n7etduNZrr4ccDUN5BiCmJ1gYhCjaj3QDyI3gDvC1wKx3KHEyOaxaG2XdypW8rSAEpn0e4imsMe
	8cIaCSYZOjy1UNw0f7VJPQmtmJNiWUk7xBkeId/odezAFuHcsllWhrhpFeRrdP8m4SIWiqzlfKe
	D0voMn5aA==
X-Google-Smtp-Source: AGHT+IFSBc+NBD1jZsd0LSs+Pw95eV8L2vwpY4rCb+CqA5TPaGXD6Axn8yxp6z29u7E5i0MPRJJiZRdC/VoVJA9DlfM=
X-Received: by 2002:a05:6000:2585:b0:3ea:c7ea:13da with SMTP id
 ffacd0b85a97d-405c4a9734bmr2645479f8f.9.1758649754815; Tue, 23 Sep 2025
 10:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
 <CA+fCnZdFp69ZHbccLSEKYH3i7g6r2WdQ0qzyf+quLnA0tjfXJg@mail.gmail.com> <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
In-Reply-To: <CACzwLxh4pJOBbU2fHKCPWkHHCuLtDW-rh52788u2Q6+nG-+bTA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 23 Sep 2025 19:49:03 +0200
X-Gm-Features: AS18NWAo7UnIsKkvCh16EnxIlUsef04XXrIh6VHPmyIq2HZ6eh0cMjqVLlDuPQw
Message-ID: <CA+fCnZce3AR+pUesbDkKMtMJ+iR8eDrcjFTbVpAcwjBoZ=gJnQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, 
	hca@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn, 
	chenhuacai@loongson.cn, davidgow@google.com, glider@google.com, 
	dvyukov@google.com, alexghiti@rivosinc.com, alex@ghiti.fr, 
	agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_104916_954209_AB368044 
X-CRM114-Status: GOOD (  21.30  )
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

T24gTW9uLCBTZXAgMTUsIDIwMjUgYXQgNjozMOKAr0FNIFNhYnlyemhhbiBUYXNib2xhdG92Cjxz
bm92aXRvbGxAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gV2h5IGlzIHRoZSBjaGVjayByZW1vdmVk
IGhlcmUgYW5kIGluIHNvbWUgb3RoZXIgcGxhY2VzIGJlbG93PyBUaGlzCj4gPiBuZWVkIHRvIGJl
IGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4KPiBrYXNhbl9hcmNoX2lzX3JlYWR5
IHdoaWNoIHdhcyB1bmlmaWVkIHdpdGgga2FzYW5fZW5hYmxlZCwgd2FzIHJlbW92ZWQKPiBoZXJl
IGJlY2F1c2UKPiBfX2thc2FuX3NsYWJfcHJlX2ZyZWUgaXMgY2FsbGVkIGZyb20gaW5jbHVkZS9s
aW51eC9rYXNhbi5oIFsxXSB3aGVyZQo+IHRoZXJlJ3MgYWxyZWFkeSBrYXNhbl9lbmFibGVkKCkg
Y2hlY2suCj4KPiBbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTYuNy9z
b3VyY2UvaW5jbHVkZS9saW51eC9rYXNhbi5oI0wxOTgKPgo+IFBsZWFzZSBsZXQgbWUga25vdyBp
ZiB2NyBpcyByZXF1aXJlZCB3aXRoIHRoZSBjaGFuZ2UgaW4gdGhlIGdpdCBjb21taXQKPiBtZXNz
YWdlIG9ubHkuCgpObyBuZWVkLCBidXQgbmV4dCB0aW1lIHBsZWFzZSBhZGQgc3VjaCBpbmZvIGlu
dG8gdGhlIGNvbW1pdCBtZXNzYWdlLgoKPiA+IFdoYXQgSSBtZWFudCB3aXRoIHRoZXNlIF9fd3Jh
cHBlcnMgd2FzIHRoYXQgd2Ugc2hvdWxkIGFkZCB0aGVtIGZvciB0aGUKPiA+IEtBU0FOIGhvb2tz
IHRoYXQgYXJlIGNhbGxlZCBmcm9tIG5vbi1LQVNBTiBjb2RlIChpLmUuIGZvciB0aGUgaG9va3MK
PiA+IGRlZmluZWQgaW4gaW5jbHVkZS9saW51eC9rYXNhbi5oKS4gQW5kIHRoZW4gbW92ZSBhbGwg
dGhlCj4gPiBrYXNhbl9lbmFibGVkKCkgY2hlY2tzIGZyb20gbW0va2FzYW4vKiB0byB3aGVyZSB0
aGUgd3JhcHBlcnMgYXJlCj4gPiBkZWZpbmVkIGluIGluY2x1ZGUvbGludXgva2FzYW4uaCAoc2Vl
IGthc2FuX3VucG9pc29uX3JhbmdlKCkgYXMgYW4KPiA+IGV4YW1wbGUpLgo+ID4KPiA+IGthc2Fu
X3NhdmVfZnJlZV9pbmZvIGlzIGEgS0FTQU4gaW50ZXJuYWwgZnVuY3Rpb24gdGhhdCBzaG91bGQg
bmVlZAo+ID4gc3VjaCBhIHdyYXBwZXIuCj4gPgo+ID4gRm9yIG5vdywgdG8gbWFrZSB0aGVzZSBw
YXRjaGVzIHNpbXBsZXIsIHlvdSBjYW4ga2VlcCBrYXNhbl9lbmFibGVkKCkKPiA+IGNoZWNrcyBp
biBtbS9rYXNhbi8qLCB3aGVyZSB0aGV5IGFyZSBub3cuIExhdGVyIHdlIGNhbiBtb3ZlIHRoZW0g
dG8KPiA+IGluY2x1ZGUvbGludXgva2FzYW4uaCB3aXRoIGEgc2VwYXJhdGUgcGF0Y2guCj4KPiBZ
ZXMsIEknZCBsaWtlIHRvIHJldmlzaXQgdGhpcyBpbiB0aGUgbmV4dCBzZXBhcmF0ZSBwYXRjaCBz
ZXJpZXMuCgpHcmVhdCEKCkJ1dCBmb3Igbm93LCBwbGVhc2Ugc2VuZCBhIGZpeC11cCBwYXRjaCB0
aGF0IHJlbW92ZXMgdGhlCl9fa2FzYW5fc2F2ZV9mcmVlX2luZm8oKSB3cmFwcGVyIChvciBhIHY4
PyBCdXQgSSBzZWUgdGhhdCB5b3VyIHNlcmllcwppcyBub3cgaW4gbW0tc3RhYmxlLCBzbyBJIGd1
ZXNzIGEgc2VwYXJhdGUgZml4LXVwIHBhdGNoIGlzIHByZWZlcnJlZCkuCgpJIGRvbid0IHRoaW5r
IHlvdSBuZWVkIGEga2FzYW5fZW5hYmxlZCgpIGNoZWNrIGluCmthc2FuX3NhdmVfZnJlZV9pbmZv
KCkgYXQgYWxsLiBCb3RoIHRoZSBoaWdoZXIgbGV2ZWwgcGF0aHMKKGthc2FuX3NsYWJfZnJlZSBh
bmQga2FzYW5fbWVtcG9vbF9wb2lzb25fb2JqZWN0KSBhbHJlYWR5IGNvbnRhaW4gdGhpcwpjaGVj
ay4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
