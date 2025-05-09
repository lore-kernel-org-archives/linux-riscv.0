Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB1CC3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXI3Y9S9WMCHcOsKkMQZGNA/48GMOSi0Nd1OuqMEOIc=; b=ofxft4Ov8GMaHT
	RkLFd0Ny/c4wNNHyCAc4cJU0KBGWTQQhRbZG6VRARlX4PpXrArLJUpf18k+NBcbQMvOTn7yMPXH95
	hDyGr1MnOm4y7MyRljPOnlvIOgG92HEJeuP2Kvy9GJto7GqDaNeBhtqwUrmbMbMCtj6kD4Awz+bk/
	qddQx2x0EG01L5dQImUMwP5y2rb0KCgXTPceJgDLT5DbpUJ6MepbWHfUl6dWmMNVr9rQYzibmcCmD
	lkpbj5AZQWf7nnf5JUbDi3AQxABEmJbtsstz5ftLw+93VcGrtrS7y3jXmpgRDYnLO7fhEL7XRW9Z0
	t0Dxmozc7gJs3R5gNYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJuL-0000000359D-2NgL;
	Fri, 09 May 2025 09:20:41 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJMu-00000002yMo-3RAo
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 08:46:09 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-acb94bf784bso30666066b.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 01:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746780367; x=1747385167; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGiJMRlH7N8wVvTRH9S0DCs9CUNhc8t6xLRe72oOUGs=;
        b=MG/MWb+MkrXoIS4XWT4fFwKzjR5rVSI2RqfpdJgVJcCv/nAkDj4NRh+vot3axbP042
         RicTQmAWKAsnS0lF9t0muE7YAQD4qYSVKWLquVBxao/K+FAB5CNprqcw16NdPVXs4bv4
         SVc9U4aoeYlrBUxncMw5dqBmrH8Lug6I5BS+ksavzcyDPfPoHwWRkgTXH45doSCSDYe/
         bvIaY+CMQBWt7k7IRUhxUmJdBXkefxbXsfJWqcCZiyekoavCCNnaB1QVeGB5oXNez5eI
         11hFFGzVcQALtV29H5UU//HIGcdr+shzZVDaYu5V7s6g2jE82Y+3O1T1XG4GKgkCnEkY
         b0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780367; x=1747385167;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NGiJMRlH7N8wVvTRH9S0DCs9CUNhc8t6xLRe72oOUGs=;
        b=BH5J78uOVN5ICs6/5qQgidlGsfJZWREcHFQ5C752kBZKXttqZ93ONfCz0lTY5+A12r
         X7W4qgdVHGcUEFuHQrCdTcysV4Q/19F5J9qh9hY2/6k3AowZsGo6BrSZ9QgIlka29SZE
         VGEqtom2a2MzlJrEf1ow5lXM/oIEnLlAY6wU0DwADiU1h+W7/2BNGiQrkKcAN7rJTo4N
         t5AYhCWp9s2GYVrdqDFyHYvv/NiD6S1I0IuqZVsLwg4Yar3W1xaS5NI+wDVWUq1mWf56
         5CIbWSP89iduapUliDO2DB3tqlogqq94+mkbg8hufvQSTjs7tLTA9B5i2TPI9Q3Hl+Ep
         q1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm4MXcukRVY61C5peLjMTUdJK4eaSTxC9NHNxdoo7b4uLDTq3HIivGgMYRHaSLnKJtZc8umyxSYMwVHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5PGy/sbMaKNWrfns0A/nPP8Gp6ndDnIMl6KRXBBbrwfDNlk19
	GFENi3+6OY0BnnofEqemsp6uHErWyb3KA2iKbzNW4B2jzHS1SUoQJWHF3iuGSdQ=
X-Gm-Gg: ASbGncu2toTPDuZ6QxNf8ldYPH6RwPFPNp+rsKx2rDVlVOsvx0pEaVEpaqVpoaMMWVd
	9W3UmUF+xtKOLOjZVDaFxWsHeWrTDK7Co8qm68v7xVvw7HG5E1FPXGGDd38iEsEMNA9kWG1cVBY
	FRFXXZ0KvqthhItqW3zrGM7mxu005UMzZ3h3k63WgYixZgfBm7Qs9kduXOlWC09Uq6NBNTlFf5j
	wJs0mOlJdb+U51eIDBAvj0dBcKgwCMZHNEsULWr6pUd+/v1XFVKphD1sTJznRHjehJ0jXCvThK2
	ENXtkvoRBH2eg1cfyadlbR2ZitQ0Yoi9kbaOmt6J8M2B1BU4Vku9jzEdGn7f2vUnDW3OqWmOgWw
	R
X-Google-Smtp-Source: AGHT+IGAYEclMsV5S50C0hAJ9Rssz25VsqYW3XofjFIyQasz4bI9bHUIYQ48ZI6cYslINiw1CF431Q==
X-Received: by 2002:a17:907:2e19:b0:acb:1d24:a9e0 with SMTP id a640c23a62f3a-ad219ac5111mr79947866b.11.1746780366510;
        Fri, 09 May 2025 01:46:06 -0700 (PDT)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c93d3sm118978066b.16.2025.05.09.01.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:46:06 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 09 May 2025 10:46:05 +0200
Message-Id: <D9RHYLQHCFP1.24E5305A5VDZH@ventanamicro.com>
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones" <ajones@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v2 2/2] RISC-V: KVM: add KVM_CAP_RISCV_MP_STATE_RESET
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
 <20250508142842.1496099-4-rkrcmar@ventanamicro.com>
 <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2nOBndtJ46yHbdjc2f0cNoPV3kjXth-q57cXt8jZA6bQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_014608_880597_6FD1C67B 
X-CRM114-Status: GOOD (  29.87  )
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

MjAyNS0wNS0wOVQxMjoyNToyNCswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBNYXkgOCwgMjAyNSBhdCA4OjAx4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Pgo+PiBBZGQgYSB0b2dnbGVhYmxlIFZN
IGNhcGFiaWxpdHkgdG8gbW9kaWZ5IHNldmVyYWwgcmVzZXQgcmVsYXRlZCBjb2RlCj4+IHBhdGhz
LiAgVGhlIGdvYWxzIGFyZSB0bwo+PiAgMSkgQWxsb3cgdXNlcnNwYWNlIHRvIHJlc2V0IGFueSBW
Q1BVLgo+PiAgMikgQWxsb3cgdXNlcnNwYWNlIHRvIHByb3ZpZGUgdGhlIGluaXRpYWwgVkNQVSBz
dGF0ZS4KPj4KPj4gKFJpZ2h0IG5vdywgdGhlIGJvb3QgVkNQVSBpc24ndCByZXNldCBieSBLVk0g
YW5kIEtWTSBzZXRzIHRoZSBzdGF0ZSBmb3IKPj4gIFZDUFVzIGJyb3VnaHQgdXAgYnkgc2JpX2hh
cnRfc3RhcnQgd2hpbGUgdXNlcnNwYWNlIGZvciBhbGwgb3RoZXJzLikKPj4KPj4gVGhlIGdvYWxz
IGFyZSBhY2hpZXZlZCB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoKPj4gICogUmVzZXQgdGhl
IFZDUFUgd2hlbiBzZXR0aW5nIE1QX1NUQVRFX0lOSVRfUkVDRUlWRUQgdGhyb3VnaCBJT0NUTC4K
Pgo+IFJhdGhlciB0aGFuIHVzaW5nIHNlcGFyYXRlIE1QX1NUQVRFX0lOSVRfUkVDRUlWRUQgaW9j
dGwoKSwgd2UgY2FuCj4gZGVmaW5lIGEgY2FwYWJpbGl0eSB3aGljaCB3aGVuIHNldCwgdGhlIHNl
dF9tcHN0YXRlIGlvY3RsKCkgd2lsbCByZXNldCB0aGUKPiBWQ1BVIHVwb24gY2hhbmdpbmcgVkNQ
VSBzdGF0ZSBmcm9tIFJVTk5BQkxFIHRvIFNUT1BQRUQgc3RhdGUuCgpZZWFoLCBJIHN0YXJ0ZWQg
d2l0aCB0aGF0IGFuZCB0aGVuIHJlYWxpemVkIGl0IGhhcyB0d28gZHJhd2JhY2tzOgoKICogSXQg
d2lsbCByZXF1aXJlIGxhcmdlciBjaGFuZ2VzIGluIHVzZXJzcGFjZXMsIGJlY2F1c2UgZm9yCiAg
IGV4YW1wbGUgUUVNVSBub3cgZmlyc3QgbG9hZHMgdGhlIGluaXRpYWwgc3RhdGUgYW5kIHRoZW4g
dG9nZ2xlcyB0aGUKICAgbXBfc3RhdGUsIHdoaWNoIHdvdWxkIGluY29ycmVjdGx5IHJlc2V0IHRo
ZSBzdGF0ZS4KCiAqIEl0IHdpbGwgYWxzbyByZXF1aXJlIGFuIGV4dHJhIElPQ1RMIGlmIGEgc3Rv
cHBlZCBWQ1BVIHNob3VsZCBiZQogICByZXNldAogICAgMSkgU1RPUFBFRCAtPiBSVU5OSU5HICg9
IHJlc2V0KQogICAgMikgUlVOTklORyAtPiBTVE9QUEVEIChWQ1BVIHNob3VsZCBiZSBzdG9wcGVk
KQogICBvciBpZiB0aGUgY3VycmVudCBzdGF0ZSBvZiBhIFZDUFUgaXMgbm90IGtub3duLgogICAg
MSkgPz8/ICAgICAtPiBTVE9QUEVECiAgICAyKSBTVE9QUEVEIC0+IFJVTk5JTkcKICAgIDMpIFJV
Tk5JTkcgLT4gU1RPUFBFRAoKSSBjYW4gZG8gdGhhdCBmb3IgdjMgaWYgeW91IHRoaW5rIGl0J3Mg
YmV0dGVyLgoKPj4gICogUHJlc2VydmUgdGhlIHVzZXJzcGFjZSBpbml0aWFsaXplZCBWQ1BVIHN0
YXRlIG9uIHNiaV9oYXJ0X3N0YXJ0Lgo+PiAgKiBSZXR1cm4gdG8gdXNlcnNwYWNlIG9uIHNiaV9o
YXJ0X3N0b3AuCj4KPiBUaGVyZSBpcyBubyB1c2Vyc3BhY2UgaW52b2x2ZW1lbnQgcmVxdWlyZWQg
d2hlbiBhIEd1ZXN0IFZDUFUKPiBzdG9wcyBpdHNlbGYgdXNpbmcgU0JJIEhTTSBzdG9wKCkgY2Fs
bCBzbyBTVFJPTkcgTk8gdG8gdGhpcyBjaGFuZ2UuCgpPaywgSSdsbCBkcm9wIGl0IGZyb20gdjMg
LS0gaXQgY2FuIGJlIGhhbmRsZWQgYnkgZnV0dXJlIHBhdGNoZXMgdGhhdAp0cmFwIFNCSSBjYWxs
cyB0byB1c2Vyc3BhY2UuCgpUaGUgbGFjayBvZiB1c2Vyc3BhY2UgaW52b2x2ZW1lbnQgaXMgdGhl
IGlzc3VlLiAgS1ZNIGRvZXNuJ3Qga25vdyB3aGF0CnRoZSBpbml0aWFsIHN0YXRlIHNob3VsZCBi
ZS4KCj4+ICAqIERvbid0IG1ha2UgVkNQVSByZXNldCByZXF1ZXN0IG9uIHNiaV9zeXN0ZW1fc3Vz
cGVuZC4KPgo+IFRoZSBlbnRyeSBzdGF0ZSBvZiBpbml0aWF0aW5nIFZDUFUgaXMgYWxyZWFkeSBh
dmFpbGFibGUgb24gU0JJIHN5c3RlbQo+IHN1c3BlbmQgY2FsbC4gVGhlIGluaXRpYXRpbmcgVkNQ
VSBtdXN0IGJlIHJlc2V0dGVkIGFuZCBlbnRyeSBzdGF0ZSBvZgo+IGluaXRpYXRpbmcgVkNQVSBt
dXN0IGJlIHNldHVwLgoKVXNlcnNwYWNlIHdvdWxkIHNpbXBseSBjYWxsIHRoZSBWQ1BVIHJlc2V0
IGFuZCBzZXQgdGhlIGNvbXBsZXRlIHN0YXRlLApiZWNhdXNlIHRoZSB1c2Vyc3BhY2UgZXhpdCBh
bHJlYWR5IHByb3ZpZGVzIGFsbCB0aGUgc2JpIGluZm9ybWF0aW9uLgoKSSdsbCBkcm9wIHRoaXMg
Y2hhbmdlLiAgSXQgZG9lc24ndCBtYWtlIG11Y2ggc2Vuc2UgaWYgd2UgYXJlbid0IGZpeGluZwp0
aGUgc2JpX2hhcnRfc3RhcnQgcmVzZXQuCgo+PiBUaGUgcGF0Y2ggaXMgcmV1c2luZyBNUF9TVEFU
RV9JTklUX1JFQ0VJVkVELCBiZWNhdXNlIHdlIGRpZG4ndCB3YW50IHRvCj4+IGFkZCBhIG5ldyBJ
T0NUTCwgc29ycnkuIDopCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmty
Y21hckB2ZW50YW5hbWljcm8uY29tPgo+PiAtLS0KPj4gSWYgeW91IHNlYXJjaCBmb3IgY2FwIDcu
NDIgaW4gYXBpLnJzdCwgeW91J2xsIHNlZSB0aGF0IGl0IGhhcyBhIHdyb25nCj4+IG51bWJlciwg
d2hpY2ggaXMgd2h5IHdlJ3JlIDcuNDMsIGluIGNhc2Ugc29tZW9uZSBib3RoZXJzIHRvIGZpeCBB
Uk0uCj4+Cj4+IEkgd2FzIGFsc28gc3Ryb25nbHkgY29uc2lkZXJpbmcgY3JlYXRpbmcgYWxsIFZD
UFVzIGluIFJVTk5BQkxFIHN0YXRlIC0tCj4+IGRvIHlvdSBrbm93IG9mIGFueSBzaW1pbGFyIHF1
aXJrcyB0aGF0IGFyZW4ndCBpbXBvcnRhbnQsIGJ1dCBjb3VsZCBiZQo+PiBmaXhlZCB3aXRoIHRo
ZSBuZXcgdXNlcnNwYWNlIHRvZ2dsZT8KPgo+IFVwb24gY3JlYXRpbmcgYSBWTSwgb25seSBvbmUg
VkNQVSBzaG91bGQgYmUgUlVOTkFCTEUgYW5kIGFsbAo+IG90aGVyIFZDUFVzIG11c3QgcmVtYWlu
IGluIE9GRiBzdGF0ZS4gVGhpcyBpcyBpbnRlbnRpb25hbCBiZWNhdXNlCj4gaW1hZ2luZSBhIGxh
cmdlIG51bWJlciBvZiBWQ1BVcyBlbnRlcmluZyBHdWVzdCBPUyBhdCB0aGUgc2FtZQo+IHRpbWUu
IFdlIGhhdmUgc3BlbnQgYSBsb3Qgb2YgZWZmb3J0IGluIHRoZSBwYXN0IHRvIGdldCBhd2F5IGZy
b20gdGhpcwo+IHNpdHVhdGlvbiBldmVuIGluIHRoZSBob3N0IGJvb3QgZmxvdy4gV2UgY2FuJ3Qg
ZXhwZWN0IHVzZXIgc3BhY2UgdG8KPiBjb3JyZWN0bHkgc2V0IHRoZSBpbml0aWFsIE1QX1NUQVRF
IG9mIGFsbCBWQ1BVcy4gV2UgY2FuIGNlcnRhaW5seQo+IHRoaW5rIG9mIHNvbWUgbWVjaGFuaXNt
IHVzaW5nIHdoaWNoIHVzZXIgc3BhY2UgY2FuIHNwZWNpZnkKPiB3aGljaCBWQ1BVIHNob3VsZCBi
ZSBydW5uYWJsZSB1cG9uIFZNIGNyZWF0aW9uLgoKV2UgYWxyZWFkeSBkbyBoYXZlIHRoZSBtZWNo
YW5pc20gLS0gdGhlIHVzZXJzcGFjZSB3aWxsIHNldCBNUF9TVEFURSBvZgpWQ1BVIDAgdG8gU1RP
UFBFRCBhbmQgd2hhdGV2ZXIgVkNQVXMgaXQgd2FudHMgYXMgYm9vdCB3aXRoIHRvIFJVTk5BQkxF
CmJlZm9yZSBydW5uaW5nIGFsbCB0aGUgVkNQVXMgZm9yIHRoZSBmaXJzdCB0aW1lLgoKVGhlIHVz
ZXJzcGFjZSBtdXN0IGNvcnJlY3RseSBzZXQgdGhlIGluaXRpYWwgTVAgc3RhdGUgYW55d2F5LCBi
ZWNhdXNlIGEKcmVzdW1lIHdpbGwgd2FudCBhIG1wX3N0YXRlIHRoYXQgYSBmcmVzaCBib290LgoK
PiBUaGUgY3VycmVudCBhcHByb2FjaCBpcyB0byBkbyBIU00gc3RhdGUgbWFuYWdlbWVudCBpbiBr
ZXJuZWwKPiBzcGFjZSBpdHNlbGYgYW5kIG5vdCByZWx5IG9uIHVzZXIgc3BhY2UuIEFsbG93aW5n
IHVzZXJzcGFjZSB0bwo+IHJlc2V0dGluZyBhbnkgVkNQVSBpcyBmaW5lIGJ1dCB0aGlzIHNob3Vs
ZCBub3QgYWZmZWN0IHRoZSBmbG93IGZvcgo+IFNCSSBIU00sIFNCSSBTeXN0ZW0gUmVzZXQsIGFu
ZCBTQkkgU3lzdGVtIFN1c3BlbmQuCgpZZXMsIHRoYXQgaXMgdGhlIGRlc2lnbiBJIHdhcyB0cnlp
bmcgdG8gY2hhbmdlLiAgSSB0aGluayB1c2Vyc3BhY2UKc2hvdWxkIGhhdmUgY29udHJvbCBvdmVy
IGFsbCBhc3BlY3RzIG9mIHRoZSBndWVzdCBpdCBleGVjdXRlcyBpbiBLVk0uCgpBY2NlbGVyYXRp
bmcgU0JJIGluIEtWTSBpcyBnb29kLCBidXQgdXNlcnNwYWNlIHNob3VsZCBiZSBhYmxlIHRvIHNh
eSBob3cKdGhlIHVuc3BlY2lmaWVkIHBhcnRzIGFyZSBpbXBsZW1lbnRlZC4gIFRyYXBwaW5nIHRv
IHVzZXJzcGFjZSBpcyB0aGUKc2ltcGxlc3Qgb3B0aW9uLiAgKEFuZCBzdWZmaWNpZW50IGZvciBl
Y2FsbHMgdGhhdCBhcmUgbm90IGEgaG90IHBhdGguKQoKVGhhbmtzLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
