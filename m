Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967F3CCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 03:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rRMIxPlaN8rDb82mKuaN2B6LTboWRg1do61xAZEYR0=; b=oXCxzOPsr0Vhde
	UZAi9bD+ND7NkhGuwO6BhvhdAWHIPjz8k9PxagYfGJf1tmJ3Ts4dg8rlNks4nX64sNPbBU8AehE5b
	WUxmaaM02p1DmbN23utitTt3muQeeYsARnLXDQFTThwmYllHsNYmB49/cen0ODMpZmiOX6cuwgdXo
	6mnVNo/on4FpAscFWgBmb5dYgDTzcSpPesM/U5nQOjoaxkcaNQ2QpmxpOJg8pHd79u78UKdAKbNIy
	dP6K7G2aWJnzSGN5sOR7YSqPPt8VaFKeLXaKjMMWAWbLNl+hmYdsIn1433fV4KlL0ycE8NqPbih7D
	YjOKPXK0m5e2L1dmL/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCl4-0000000GbNL-1RXO;
	Fri, 07 Nov 2025 03:03:26 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCl1-0000000GbM2-2KXj
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 03:03:24 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-9354425df5cso182037241.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Nov 2025 19:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762484599; x=1763089399; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IroOHHwKYkiVIAKakQ8I70mb4O9KcHsXhYng7ogWZ7Y=;
        b=Yybo3sZr2fCNbtcmXpLPM3Fsb3XNYjoKWkcj6BLw005fCsdkSZxc58TJHjSNMf05Xz
         A+L/hZ41JYr2TQhgkTfJK4oVfsSmwgnfoVt+234dcbrX46SVdFiBZShBzDpKR37WyPXh
         r4c8sq0ZdKXPrH8RGs+ojURe75NgJ3U3seDClFHi+JpusE74BvEloOw7EqGmTj23mDAw
         7ZsDbmqAUgyWCYHhtz/ChJUwYljPkvguGvhOvng6T2iZnJ2DcHfRXEtT+6OH15CHCTco
         l48PznrgBZRtAk7vrPsPKRDFPygwQeCvT6BkKLWo0N8YzgFqseJFd4ARjvHauSYOx2H8
         n4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762484599; x=1763089399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IroOHHwKYkiVIAKakQ8I70mb4O9KcHsXhYng7ogWZ7Y=;
        b=Tw59ccYwAKrxFhUH7wWBhq7MliuFf7UmWLLU2v+6dnw4xZHIPJ9qMtIIatnaE/x9eb
         s8JWD4kat6Tf6VklfqndRslh3ORAaLn23Op+HoNp1UEFvTDbzziJDhM9cNxh8MwSHsoG
         unZb+OoEmVdmdcOYq70u/krJSOK6X0TUnM8xBjSa3vncnfNCy639ulL88v8exfxhSI5j
         4stToXiuMZhgCrcc4oFz56tMkFXk5Zfv9O/HsgePUJcXRZnWtM/Qlvyf16KJTADPXR1D
         179V+s2kUOIJo7cNuZOjP37F8PrVYJzUxuD90Yev2DPrG6qh5neo6MYVko5JszZlSr11
         ci9w==
X-Forwarded-Encrypted: i=1; AJvYcCVwcOGQrSficid882pIMWBsUuDV+RzZj1QIXQbUJVZy+hUhLxl22s3YcCOuxmqoZDRIMSxYeEvbjv2+xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9DbgCwZUOiyv7cOB77Ser4jzP5YBARreHqL3cUikyW0JArV43
	9utSCT5zr3NoFRs40fkf7JOxWQHNUq0b5FarZcNrx9/es6BNc9WiBEX5UM11gM815itDmrrtfy9
	3IraP8hWO3hppk4cUXt+/Qg2F6b9VrVi5MEOGpQNqkQ==
X-Gm-Gg: ASbGncsEhzMR5awxhiHJEO6MmqIcKdP6+uAL5awdySl1Jxednp4XFtzeZv0Lw4s6N+K
	PGVoEp2i3I2N6Z0/AFoqdf8ECcWv+IJq2Zf8pC24s6OcPdpcXHAte4gMi1vGHzhqROSLbIRntzq
	HIq9ccofIo49mTJsSpF1t/b833PWbLPX29+8Dq9/XkLaTsOtBL+oCBtPr1mM6bl2q2FvWqrhES5
	KM+o6XwSBkEeCmxjbVZFYU80iipxJYY29+ggjstXos68qhsTOwn4ko1V1aoyE8nhhVCKgSRmLWK
	pws8mEG0
X-Google-Smtp-Source: AGHT+IHYxdX8uI6XTg2hpwUlTY+AGxtiKgpLWOxoD+YcGsGPPNadx5W9DaiEtKxbj4fY31N8+HaRLrzXWfnL9LKVtA0=
X-Received: by 2002:a05:6102:ccb:b0:534:cfe0:f85b with SMTP id
 ada2fe7eead31-5ddb22561a2mr722708137.20.1762484599334; Thu, 06 Nov 2025
 19:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20251030135652.63837-1-luxu.kernel@bytedance.com> <CAJF2gTQ8TGWQWU8rKstGwuEz1hE97cgwzNsugzKzxwJdd-TNDg@mail.gmail.com>
In-Reply-To: <CAJF2gTQ8TGWQWU8rKstGwuEz1hE97cgwzNsugzKzxwJdd-TNDg@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 7 Nov 2025 11:03:07 +0800
X-Gm-Features: AWmQ_blu0vLpTSKdzSVtCk3uQ59k-Xep1rAbenoTFJjftixB__jtRfFIz-1szOM
Message-ID: <CAPYmKFuopwQcDeCymuavTgC8crGg7Jb5Bs=hbnTtFvM+9X8HKg@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH v1 0/4] riscv: mm: Defer tlb flush to context_switch
To: Guo Ren <guoren@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_190323_628440_8977A5C4 
X-CRM114-Status: GOOD (  23.61  )
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

T24gRnJpLCBOb3YgNywgMjAyNSBhdCA5OjU24oCvQU0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgOTo1N+KAr1BNIFh1IEx1IDxs
dXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+Cj4gPiBXaGVuIG5lZWQgdG8gZmx1
c2ggdGxiIG9mIGEgcmVtb3RlIGNwdSwgdGhlcmUgaXMgbm8gbmVlZCB0byBzZW5kIGFuIElQSQo+
ID4gaWYgdGhlIHRhcmdldCBjcHUgaXMgbm90IHVzaW5nIHRoZSBhc2lkIHdlIHdhbnQgdG8gZmx1
c2guIEluc3RlYWQsIHdlCj4gPiBjYW4gY2FjaGUgdGhlIHRsYiBmbHVzaCBpbmZvIGluIHBlcmNw
dSBidWZmZXIsIGFuZCBkZWZlciB0aGUgdGxiIGZsdXNoCj4gPiB0byB0aGUgbmV4dCBjb250ZXh0
X3N3aXRjaC4KPiA+Cj4gPiBUaGlzIHJlZHVjZXMgdGhlIG51bWJlciBvZiBJUEkgZHVlIHRvIHRs
YiBmbHVzaDoKPiA+Cj4gPiAqIGx0cCAtIG1tYXBzdHJlc3MwMQo+ID4gQmVmb3JlOiB+MTA4awo+
ID4gQWZ0ZXI6IH40NmsKPgo+IENvdWxkIHlvdSBhZGQgdGhlIHJlc3VsdHMgZm9yIHRoZXNlIHR3
byB0ZXN0IGNhc2VzIHRvIHRoZSBuZXh0IHZlcnNpb24/Cj4KPiAqIGxtYmVuY2ggLSBsYXRfcGFn
ZWZhdWx0Cj4gKiBsbWJlbmNoIC0gbGF0X21tYXAKClJvZ2VyIHRoYXQuIFRoYW5rcyBmb3IgeW91
ciBzdXBwbGVtZW50LgoKPgo+IFRoYW5rIHlvdSEKPgo+ID4KPiA+IEZ1dHVyZSBwbGFuIGluIHRo
ZSBuZXh0IHZlcnNpb246Cj4gPgo+ID4gLSBUaGlzIHBhdGNoIHNlcmllcyByZWR1Y2VzIElQSSBi
eSBkZWZlcnJpbmcgdGxiIGZsdXNoIHRvCj4gPiBjb250ZXh0X3N3aXRjaC4gSXQgZG9lcyBub3Qg
Y2xlYXIgdGhlIG1tX2NwdW1hc2sgb2YgdGFyZ2V0IG1tX3N0cnVjdC4gSW4KPiA+IHRoZSBuZXh0
IHZlcnNpb24sIEkgd2lsbCBhcHBseSBhIHRocmVzaG9sZCB0byB0aGUgbnVtYmVyIG9mIEFTSURz
Cj4gPiBtYWludGFpbmVkIGJ5IGVhY2ggY3B1J3MgdGxiLiBPbmNlIHRoZSB0aHJlc2hvbGQgaXMg
ZXhjZWVkZWQsIEFTSUQgdGhhdAo+ID4gaGFzIG5vdCBiZWVuIHVzZWQgZm9yIHRoZSBsb25nZXN0
IHRpbWUgd2lsbCBiZSBmbHVzaGVkIG91dC4gQW5kIGN1cnJlbnQKPiA+IGNwdSB3aWxsIGJlIGNs
ZWFyZWQgaW4gdGhlIG1tX2NwdW1hc2suCj4gPgo+ID4gVGhhbmtzIGluIGFkdmFuY2UgZm9yIHlv
dXIgY29tbWVudHMuCj4gPgo+ID4gWHUgTHUgKDQpOgo+ID4gICByaXNjdjogbW06IEludHJvZHVj
ZSBwZXJjcHUgbG9hZGVkX2FzaWQKPiA+ICAgcmlzY3Y6IG1tOiBJbnRyb2R1Y2UgcGVyY3B1IHRs
YiBmbHVzaCBxdWV1ZQo+ID4gICByaXNjdjogbW06IEVucXVldWUgdGxiZmx1c2ggaW5mbyBpZiB0
YXNrIGlzIG5vdCBydW5uaW5nIG9uIHRhcmdldCBjcHUKPiA+ICAgcmlzY3Y6IG1tOiBQZXJmb3Jt
IHRsYiBmbHVzaCBkdXJpbmcgY29udGV4dF9zd2l0Y2gKPiA+Cj4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9tbXVfY29udGV4dC5oIHwgIDEgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dGxiZmx1c2guaCAgICB8ICA0ICsrCj4gPiAgYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMgICAgICAg
ICAgICAgIHwgMTAgKysrKwo+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICAg
ICB8IDc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICA0IGZpbGVzIGNoYW5nZWQs
IDkwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiAtLQo+ID4gMi4yMC4xCj4g
Pgo+Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
