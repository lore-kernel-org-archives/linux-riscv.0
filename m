Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0671EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 19:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RGMZEQ66dUJeqlzD0McLbDEjjm5fhVhiHzX9DIfPVFY=; b=09KbvjSO/Eo7HOsd/HryVhsHFx
	II1wJjfO2xCbhKbZQDeiil8kTe072f0gyO7SjdXbpbP4XrlT60eX0KUv/KuE6ab3nZRvjS18re1Np
	AklFWzQIs+inPKjFtTfzQuvqnGim8iSRSuWTdlDOwtWFSRDpPqnqj2/KEdHRDpoTf5tlJR0hzV7BG
	3wJYyHhJ95vrv0QqhVVsGujQ9hivM2OrhUpwGxzgwzkAHpiJsgT5eZ2dDgruVsGF8CWHh1NhnDcq7
	NY+VSshmOu9625EO4zRgHKNcXQXuOdbbi/w0+mwNZQjl5JUXsNxaQZ2112gIaobvlgy6ohlyg1c+W
	cu7DnImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUun-002XE6-0d;
	Thu, 06 Jul 2023 19:45:21 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHUuj-002XDP-2v
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 19:45:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b80b343178so6320235ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 12:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688672716; x=1691264716;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrNhiTqDQItKHcCBe+k1gh83J9Zxaz0xFFK2k4JYDbk=;
        b=2G9krPYp+J1M049iq9qKlWbi8hvMukNAJ3a0MDGLFJQNVU4DW/0O5Q5eoZtUw5vyWU
         TAlQnQUi5eYli+xFyLOXpDhmrjiGlt+J8wlZJfH+Mn75qLUu1IEgZ2T8FEZ6lPNTch4R
         fWpSyxvFCCJQKW/9GYkRWwcAXIDgG/NKunkK1iwVukBy1Lmxk2WpIzKrElawSv8FsASi
         6nom6jfIcfZZLB5Wct6j/VgnSQmGvjKpCTbuJFxL/2XwPEUnvXh7wwGA1ly+O4CklJCp
         6qSgQNH44kWwp6qLB5mQFx8trUltNAK01LDYljiGd+BcomL+NOcYYPYoCIStzzk/PZR8
         FH8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688672716; x=1691264716;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrNhiTqDQItKHcCBe+k1gh83J9Zxaz0xFFK2k4JYDbk=;
        b=L37KKu/OlwfiNgGtDLFfg2miFrSQNqfeuNFRLZdTLC3hbONjZ9E+f9BmpvRqOnHA4Z
         GcjD18IVFLexrndPQBe87U6Hhnb1tTFkwbQze9HxH5K+qmPBdtfjULaVE2jsaNuo439T
         7owoAm4vGKn1dx4osB+ufVwQ8cd3tlNqGr98Yd9dFUrmxdhrin0s4fnvYGmXL9GTrdFt
         4lJi/BSQPxPfhbDHIUab3/POlc7EQK3BkojutvbHpLrEDfkp5P5BANzJGYff5iZrAk42
         jIuHDsLv8q+qkjoYLpBe9D2qRxIVBv6aSYk8AGs6JUtqeozuWBX02FlLh5fk1XGErCmx
         Z/gg==
X-Gm-Message-State: ABy/qLYRNUVBqw7R2vOL/Gcs8B0VGyBYG5FVsw1l9gaAggA8hByCx16t
	ZoXPtZSat2+l/h0glErRxyaPdw==
X-Google-Smtp-Source: APBJJlEOjvLvA7GdlM4mx+7ttBgWvWAOkGPMRSO1WGP2vSp3DNx4FH+IJgkckUOcCrgrOEmxjvK4Nw==
X-Received: by 2002:a17:902:ecc2:b0:1b1:ae33:30de with SMTP id a2-20020a170902ecc200b001b1ae3330demr3234128plh.13.1688672715791;
        Thu, 06 Jul 2023 12:45:15 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902e84400b001b9be3b94d3sm180213plg.140.2023.07.06.12.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:45:15 -0700 (PDT)
Date: Thu, 06 Jul 2023 12:45:15 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 12:44:29 PDT (-0700)
Subject: Re: [PATCH v2] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
In-Reply-To: <CALs-Hssc6Uxf-6FKbye2n-CD0FWWE4xDmUWvN1NoKNFpn88SKg@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-ebe222a1-57eb-41cf-a541-38b4b5595ac0@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_124518_190570_4AA89DFE 
X-CRM114-Status: GOOD (  33.71  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwNiBKdWwgMjAyMyAxMjozNDozMCBQRFQgKC0wNzAwKSwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBUaHUsIEp1bCA2LCAyMDIzIGF0IDM6NTPigK9BTSBDb25vciBEb29sZXkgPGNvbm9y
LmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPj4KPj4gT24gVGh1LCBKdWwgMDYsIDIwMjMg
YXQgMTA6MDE6MzFBTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+PiA+IE9uIFdlZCwgSnVs
IDA1LCAyMDIzIGF0IDEwOjI5OjMxQU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4+ID4gPiBJ
biAvcHJvYy9jcHVpbmZvLCBtb3N0IG9mIHRoZSBpbmZvcm1hdGlvbiB3ZSBzaG93IGZvciBlYWNo
IHByb2Nlc3NvciBpcwo+PiA+ID4gc3BlY2lmaWMgdG8gdGhhdCBoYXJ0OiBtYXJjaGlkLCBtdmVu
ZG9yaWQsIG1pbXBpZCwgcHJvY2Vzc29yLCBoYXJ0LAo+PiA+ID4gY29tcGF0aWJsZSwgYW5kIHRo
ZSBtbXUgc2l6ZS4gQnV0IHRoZSBJU0Egc3RyaW5nIGdldHMgZmlsdGVyZWQgdGhyb3VnaCBhCj4+
ID4gPiBsb3dlc3QgY29tbW9uIGRlbm9taW5hdG9yIG1hc2ssIHNvIHRoYXQgaWYgb25lIENQVSBp
cyBtaXNzaW5nIGFuIElTQQo+PiA+ID4gZXh0ZW5zaW9uLCBubyBDUFVzIHdpbGwgc2hvdyBpdC4K
Pj4gPiA+Cj4+ID4gPiBOb3cgdGhhdCB3ZSB0cmFjayB0aGUgSVNBIGV4dGVuc2lvbnMgZm9yIGVh
Y2ggaGFydCwgbGV0J3MgcmVwb3J0IElTQQo+PiA+ID4gZXh0ZW5zaW9uIGluZm8gYWNjdXJhdGVs
eSBwZXItaGFydCBpbiAvcHJvYy9jcHVpbmZvLiBXZSBjYW5ub3QgY2hhbmdlCj4+ID4gPiB0aGUg
ImlzYToiIGxpbmUsIGFzIHVzZXJtb2RlIG1heSBiZSByZWx5aW5nIG9uIHRoYXQgbGluZSB0byBz
aG93IG9ubHkKPj4gPiA+IHRoZSBjb21tb24gc2V0IG9mIGV4dGVuc2lvbnMgc3VwcG9ydGVkIGFj
cm9zcyBhbGwgaGFydHMuIEFkZCBhIG5ldyAiaGFydAo+PiA+ID4gaXNhIiBsaW5lIGluc3RlYWQs
IHdoaWNoIHJlcG9ydHMgdGhlIHRydWUgc2V0IG9mIGV4dGVuc2lvbnMgZm9yIHRoYXQKPj4gPiA+
IGhhcnQuIFRoaXMgbWF0Y2hlcyB3aGF0IGlzIHJldHVybmVkIGluIHJpc2N2X2h3cHJvYmUoKSB3
aGVuIHF1ZXJ5aW5nIGEKPj4gPiA+IGdpdmVuIGhhcnQuCj4+ID4gPgo+PiA+ID4gU2lnbmVkLW9m
Zi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+Cj4+ID4gPgo+PiA+ID4gLS0tCj4+
ID4gPgo+PiA+ID4gQ2hhbmdlcyBpbiB2MjoKPj4gPiA+ICAtIEFkZGVkIG5ldyAiaGFydCBpc2Ei
IGxpbmUgcmF0aGVyIHRoYW4gYWx0ZXJpbmcgYmVoYXZpb3Igb2YgZXhpc3RpbmcKPj4gPiA+ICAg
ICJpc2EiIGxpbmUgKENvbm9yLCBQYWxtZXIpCj4+ID4gPgo+PiA+ID4KPj4gPiA+IEkgYmFzZWQg
dGhpcyBzZXJpZXMgb24gdG9wIG9mIENvbm9yJ3MgcmlzY3YtZXh0ZW5zaW9ucy1zdHJpbmdzIGJy
YW5jaAo+PiA+ID4gZnJvbSBKdWx5IDNyZCwgc2luY2Ugb3RoZXJ3aXNlIHRoaXMgY2hhbmdlIGdl
dHMgaG9wZWxlc3NseSBlbnRhbmdsZWQKPj4gPiA+IHdpdGggdGhhdCBzZXJpZXMuCj4+ID4gPgo+
PiA+ID4gSSB3YXMgdW5zdXJlIGlmIEkgY291bGQgc251Z2dsZSB0aGUgbmV3ICJoYXJ0IGlzYSIg
bGluZSBpbiBqdXN0IGJlbG93Cj4+ID4gPiAiaXNhIi4gQWVzdGhldGljYWxseSBpdCB3b3VsZCBi
ZSBxdWl0ZSBwbGVhc2luZywgYnV0IGl0IHJ1bnMgdGhlIHJpc2sgb2YKPj4gPiA+IGJyZWFraW5n
IGJyaXR0bGUgdXNlcm1vZGUgcGFyc2VycyB0aGF0IGFyZSBhc3N1bWluZyBhIHNwZWNpZmljIGxp
bmUKPj4gPiA+IG9yZGVyLiBTbyBJIHB1dCBpdCBhdCB0aGUgZW5kLgo+PiA+Cj4+ID4gQWN0dWFs
bHksIHRoZXkncmUgcHJvYmFibHkgb25seSBhZXN0aGV0aWNhbGx5IHBsZWFzaW5nIHdoZW4gdGhl
eSBtYXRjaC4gSWYKPj4gPiB0aGVyZSBhcmUgZGlmZmVyZW5jZXMsIHRoZW4gSSdkIGd1ZXNzIGhh
dmluZyB0aGVtIHNpZGUgYnkgc2lkZSwgYWxtb3N0IHRoZQo+PiA+IHNhbWUsIGJ1dCBkaWZmZXJl
bnQsIHdvdWxkIG1ha2UgdGhlbSBldmVuIGhhcmRlciB0byBsb29rIGF0IHRoZW4gdGhleQo+PiA+
IGFscmVhZHkgYXJlLiBTbyBJIHRoaW5rIEknbGwgYmUgaGFwcGllciB3aXRoIHRoZW0gc2VwYXJh
dGVkIGJ5IGEgZmV3IGxpbmVzCj4+ID4gYW55d2F5Lgo+Pgo+PiBUaGlzIGxpc3QgaXMgZXZlbnR1
YWxseSBnb2luZyB0byBiZSBzbyBiaWcgdGhhdCBJIGRvbid0IHRoaW5rIGRvaW5nCj4+IGJ5LWV5
ZSBhbnl0aGluZyBpcyBnb2luZyB0byBiZSB1c2VmdWwsIHNvIGFlc3RoZXRpY3MgYmUgZGFtbmVk
Lgo+PiBUaGF0IHNhaWQsIGEgcGFyc2VyIHRoYXQgcmVsaWVzIG9uIHRoZSBvcmRlciBvZiBpbmRp
dmlkdWFsIGxpbmVzIGxpa2UKPj4gdGhhdCBtaWdodCBkZXNlcnZlIHRvIGJlIGJyb2tlbiA7KQo+
Pgo+PiBBbnl3YXksIGNoYW5nZSBsb29rcyBnb29kIHRvIG1lOgo+PiBSZXZpZXdlZC1ieTogQ29u
b3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4KPj4gSSB3YXMgdGhpbmtp
bmcgdGhlIHVhYmkgZG9jIG1pZ2h0IG5lZWQgYW4gdXBkYXRlIC0gc2hvdWxkIHdlIGFkZCB0byBp
dAo+PiB0aGF0ICJpc2EiIG1lYW5zIHRoZSBjb21tb24gc2V0ICYgImhhcnQgaXNhIj8KPgo+IEkg
ZGlkIGRvIGEgbGl0dGxlIHNlYXJjaCBmb3IgZG9jdW1lbnRhdGlvbiB0byB1cGRhdGUsIGJ1dCBm
YWlsZWQgdG8KPiBjb21lIHVwIHdpdGggYW55LiBXaGljaCBkb2MgYXJlIHlvdSB0aGlua2luZyBv
Zj8KClNob3VsZCBiZSBzb21ld2hlcmUgbGlrZSBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvdWFi
aS5yc3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
