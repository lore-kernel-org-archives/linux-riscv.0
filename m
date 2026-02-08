Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DC3EF06EE
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SiNTHLjdc+AGUYincPTZfsLBn0QrNt2TY6eF/zgXsg=; b=dT+5xXhUCDWCYh
	9tgtOe3RtonFa9JbPmD8BubS97E55YCpT3W4s7fviStMmfKw0S9vIuzXk45KY0L28cZM9409lic13
	tlfpiexhmLrGCrYVUYTFQjSrZBmg5Kzn/X9QYrD+nApJQ5Q3zMGktzf7XfEQ6b8oqSsyOvBBCzBjE
	r+dZ9jS+7+2UcRk7WVVJtQUdHxpLRxFyKLSOLeOCTM0qwJSJ7hDBwzmsx4EjZqTqYUAWzZ0vNT7m2
	l+gNdcBQitza1SHi9lGthoi4dhqXauILK1pq5JfXn1w1+E9r2GrzocU2fo8KaEKhWkh+WaJGFi4tS
	3ZNAKMUPfD5cPj1lip0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpCVX-0000000ERWC-0ccN;
	Sun, 08 Feb 2026 21:39:55 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpCVU-0000000EROF-0l7K
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 21:39:53 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-649b5f5570fso4842971d50.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Feb 2026 13:39:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770586790; cv=none;
        d=google.com; s=arc-20240605;
        b=fuL1V3jst+HRYS1Ig7E+2Sjvo1DR1TXK/bOZBVZY126wdItKYkl8qAHDTJUKWFQimL
         1XQBijqIjbI59+xsIlycc9AJ9mSzFSP6oAK6I8+br/pan1LEWC/twkfQePB5FK024XpV
         DqxPmcG7W4Su3jtUBZgdiVfTM3drTkVCsqRY6+miENHqQaa90VSH8j6FOLOVCTfyt6AB
         Vl8W28FvtKP0f2Yh06yXJ/Im3u+cU2hdQhTgtfNbiYyx8g7uX/Hq9anZLnPMlVfT/Anx
         TU4zCH80zT0gdSXTuIrDpTTGVbiTnix/DKVePbkcBje5OkCTScFHpJkycribT9ZWFJc6
         QYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bE4KLuNDmmwdLE9+ipQbVHt6P79ExA5fyxCMLhhgUHI=;
        fh=EFAXvHadlMal6EKvdGkCThMWYJUFk1yv5Ki+uDSdbu0=;
        b=UvoM1TjXyDa0AKkktfe+8nMKwCQJlI5zP06XUfQq0lrKkAlDxsFEr5cD2rBoYwk0/v
         SwN5s0TNQyDANTgjTt549ThAlkaJxkCKO+D6BcVTn44oIGS/jsz0H6thwbmrSzorNsD9
         69VrCX1OFWTBPlZSTL46xgrwV1UyN1UUl35JTQD3k878u2DaJ2SMiSjoeE93bxAsRmN9
         mPpL4mDtCRol71hSsYTiOw+0KxmpaotBcAjU1y+7pciCxlqzp3/SsIs4RWYbY8zLk4G5
         6lDOrFSXPeFS5gsaPrrRlPUiJDuAuwOCRVpjkPRmJR947AvvbumUAkzbP2ZpimyhzNY/
         LAhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1770586790; x=1771191590; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE4KLuNDmmwdLE9+ipQbVHt6P79ExA5fyxCMLhhgUHI=;
        b=AXDUfr7gjSM47/KquW60B7d8k72K2Po0IadaeMYhAAezFhywFeKKHNJITaBX5Bq2PT
         PTDmDcFaNIlRxM7Xo9UgodRxZg9mbze+bPCgwktzhGDkfXdaPMQ287r76NO/1KEtw4nE
         cZTPTDambzoNRUnf/Ze6ioCOcsRyJuK5TUJV8wha/9ubY06cuKo84tOWjA1Be2CP2fwr
         R7NW8ZtlEgSTgU625GnjOwYR/8tu41ZFlaLu8PonPvR+tEqZ4DTkiedtscUKeUwNqRuM
         rHad8wZKgO1+7nD8iSsmszdHLZgMSmdFYQfcvF0RA4QqvDTk7VADG361o/i9R9sltUNu
         OJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770586790; x=1771191590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bE4KLuNDmmwdLE9+ipQbVHt6P79ExA5fyxCMLhhgUHI=;
        b=t8UxAk8nazK8bh2C2NpCQdLeezu2APL3X/DWrzulXQtbLhzl7wz+cvIMPGEuzKne4T
         blL+OtqNcauOEdtvlBFv3WsK/CtTXayplIX6o3p1NeoIy+zxnA99KcRdpgrRIqDQFFnl
         Cu3pR+1Xo/59j94G4SYyKt8Ht8NOIeRtkc4Hn9sxgTY1ay/Q6bZ7zDMm12q+bFY5cXco
         kXDnIM0FRW99GYt6EeG52clhK50pEg6fstpA7wWYfuKs5bL4SFSrl4AJ478qq/XIPEZj
         Bxuw7EwxdwsStNwy9qsHtMVb1FtC/TUblFZh2Eh/i3rVPyAf50uL0r41sRxTlhCX/MV8
         BK1g==
X-Forwarded-Encrypted: i=1; AJvYcCXkuP2Lj0f+FXVbgshJpLaD9Ubit6yBbI2F4b+6fbzcFX+4FqZfm7rGVpq4v1Fe7zLUuKfS06jhAv07Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6/fLlgFWwVjGSI66p4V0t2pVVI3D7TOY750is4nZI+e0R8P5P
	Hl0cRp4JpHP81cYZqlSVc8wqa2cF+Rvl0W/W2wzXZhtDMCfxE5gkxUg+Xpj7SnG54a4IUohQwzU
	TU/fSBsEU5rGjGTIe99GosRnTMW4SlypHHoTAEp8UAaEAK4zGGazLEHI=
X-Gm-Gg: AZuq6aLL7iJ+5m1IcVX15h9x+MhN9PJ42ISCRGA7pX/+dXCyMna4QL9eH5sUFuAt5ju
	4/3BaUktPWaJ0uPQLnDNBdwL14K+UNbzu7pLahd441VSKHmanMS2cye7tuxs2pbgY7t0OaxgDPp
	DAlZVrwyMPKek12LZTG2aBXngn1O7DZPeHBNhm9uLFfzGbfXAlopKPmf21eZWe8kQsYIecPZCtE
	AuD5SjhFCXbG38Riq4x2ovyMKEhauEXz3LKegHB7gW+t1Qt+t2AQNGrX3gbmxl4CkjKlQLf1ORO
	uFxBzuFuLI0xpObv4f0zmlYEBL+vQCYGE+IMqCplmoQHK71yOOORtvdqTw==
X-Received: by 2002:a53:cb85:0:b0:649:b062:674a with SMTP id
 956f58d0204a3-649f253441dmr6382827d50.37.1770586790136; Sun, 08 Feb 2026
 13:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
 <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll> <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
 <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org> <CAEev2e99LEoi83_d09NEJwzcSiYdFFZvLOFZUTRRrYtL_qCErw@mail.gmail.com>
 <e242a327-b53e-4b24-a9c1-9ae990de901e@kernel.org> <20260207-stifle-chowtime-8502c0a57f70@spud>
 <6ebcb1a9-78ca-4734-8723-758f79e6819e@kernel.org>
In-Reply-To: <6ebcb1a9-78ca-4734-8723-758f79e6819e@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Sun, 8 Feb 2026 15:39:39 -0600
X-Gm-Features: AZwV_QgkEwTCiwXuHTTQ3WLCXuNOfifaUxe6wncI1nA-Tus6DJ7O3arSqaM8mRM
Message-ID: <CAEev2e9ukBSgWc5WT1xcv+G1ZzOWAnuwp9kaJcKKe6mbtOtoFA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_133952_236523_8C0CBF99 
X-CRM114-Status: GOOD (  18.40  )
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

T24gU2F0LCBGZWIgNywgMjAyNiBhdCAxMjozOeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAwNy8wMi8yMDI2IDE1OjU0LCBDb25vciBEb29s
ZXkgd3JvdGU6Cj4gPj4+Pj4gc3VnZ2VzdHMgcGlja2luZyBhIG1vcmUgZ2VuZXJpYyBuYW1lIGlu
IHRoaXMgY2FzZSwgc28gaXNuJ3QKPiA+Pj4+PiAidGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbSIg
b2theSBmb3IgdGhhdD8KPiA+Pj4+Cj4gPj4+PiBObywgYmVjYXVzZSBJIGRvbid0IHdhbnQgdG8g
a2VlcCBndWVzc2luZyB0aGlzLiBUaGUgZG9jcyBjbGVhcmx5IGFzayB5b3UKPiA+Pj4+IHRvIHBv
c3QgY29tcGxldGUgYmluZGluZ3MsIHdoaWNoIG5vdyBiZWNhbWUgbGVzcy1jb21wbGV0ZSwgYnV0
IGZpbmUuCj4gPgo+ID4gSSBkb24ndCB0aGluayBpdCBhY3R1YWxseSBpcyAibGVzcyBjb21wbGV0
ZSIgd2l0aG91dCB0aGUgb3RoZXIKPiA+IGNvbXBhdGlibGVzLiBUaGUgbm9uLXJjcHUgcHJjbXMg
ZnVuY3Rpb24gZGlmZmVyZW50bHkgdG8gdGhlIHJjcHUgcHJjbQo+ID4gKHRoZXkgc2VlbSB0byBi
ZSBjb25zdW1lcnMgb2YgY2xvY2tzIHRoYXQgdGhlIHJjcHUgcHJvZHVjZXMpIGFuZCBhcmUgbm90
Cj4gPiBzdXBwb3J0ZWQgYnkgdGhlIGRyaXZlcnMgaW4gdGhpcyBzZXJpZXMuIFRoZXkncmUgZGlm
ZmVyZW50IGRldmljZXMgYW5kIEkKPiA+IHRoaW5rIHNob3VsZCBvbmx5IGJlIGRvY3VtZW50ZWQg
d2hlbiBzdXBwb3J0IGZvciB0aGVtIGNvbWVzIGFsb25nLiB2NAo+ID4gaGFkIHByb2JsZW1zIHRo
YXQgd2VyZSBjYXVzZWQgYnkgdHJ5aW5nIHRvIGRvY3VtZW50IHRoZW0gd2l0aG91dAo+ID4gYWN0
dWFsbHkgaGF2aW5nIGRyaXZlciBzdXBwb3J0IGZpZ3VyZWQgb3V0Lgo+Cj4gSXQncyBmaW5lIHdp
dGhvdXQgdGhlbSwgYnV0IHRoZW4gbGV0J3MganVzdCBuYW1lIHRoZSBmaWxlIGFmdGVyIHRoYXQK
PiBvbmx5IHNvbGUgY29tcGF0aWJsZS4KCk9rYXksIHRoYW5rIHlvdSBmb3IgY2xhcmlmeWluZyB0
aGlzLiBJIHdpbGwganVzdCBhZGQgb25lIGNvbXBhdGlibGUKYW5kIG5hbWUgdGhlIGJpbmRpbmdz
IGZpbGUgYmFzZWQgb24gdGhhdCBvbmUuCgpJbiB0aGUgZnV0dXJlIHdoZW4gSSBhZGQgdGhlIHJl
bWFpbmluZyBjb21wYXRpYmxlcyAoYW5kIGRyaXZlciBmb3IKdGhlbSksIHNob3VsZCBJIGFkZCB0
aGVtIHRvIHRoaXMgc2FtZSBiaW5kaW5ncyBmaWxlPyBDYW4gSSByZW5hbWUgdGhlCmZpbGUgdG8g
aGF2ZSBhIG1vcmUgZ2VuZXJpYyBuYW1lIHRoZW4/IElzIHJlbmFtaW5nIGJpbmRpbmdzIGZpbGVz
Cm9rYXk/IE9yIGlzIHRoaXMgc29tZXRoaW5nIHRvIHdvcnJ5IGFib3V0IGZvciBsYXRlcj8KCj4K
PiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
