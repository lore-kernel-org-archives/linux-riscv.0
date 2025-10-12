Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57740CCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 23:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCUZvwehVj/aPq6pZNBLkQpd3vEYDUI55vjbc9Xo704=; b=Y4oNQnuGqcX8Hu
	bsj6jhBTXF7bAakaTeInoqLBJTWCqXPLPzTSKfYBbVN6Ig4pyBGW+v6TRRM91zGl3RwEW8BfXAx2h
	qZZfVKbN+eJ3wVLl1iIyRr6B9IgqilDosfZVouA2o6O/3rrDJlzFbUmre8gruhJ5xpDccqMg7UyyJ
	1fYJScFGpED7SR/xoIYrObsNUMfHuemrKHYqrHJwFniPSGF0P+4wFPiikv97QT1els6w+gON+agOE
	KhZxYJnVSTDTHkmqHrLvP6+tdGbryAlhL1+I636xKW0IKeiOTUYoyBVDml+PgZYMuExPaGI9WT1LD
	eS2skONpQHQ1wz6e6VSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v85qu-0000000BqZC-0VoZ;
	Sun, 12 Oct 2025 23:51:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v85qs-0000000BqYu-41Kv
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 23:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C923F6023F
	for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 23:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F01C19424
	for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 23:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760313072;
	bh=1hhfwvgv5qJC+AoyphWDuLXE10eJqEn11Hz3jk9+lyE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kw3Mm/SA/tcRTDDQ0+CmcuVqmFGAuU0e/hwAnKAkWFj22IGpBtaPzugH872mSVTQb
	 riasJyANRBjXFE8o+aXAwjpPj3x6Tbx6YvdSGbmpXAYNuvUN8+xPuS0V+v/wN88BYu
	 ip0LhTlEgS4fC+2S5nYhcGdaV7itc1jDE83y4qLbhhqG+UmtH3z3gIziL4rSUzO+Ek
	 3Smcj1v8vBPx/PsEZwwjKtqlYi2rRrInX31DlH3k57PrclKlPOHBcytiNRbeGsQdai
	 mZ71XQcwerid2o+5XcFcP3tBXL06oDHyqP2+WDlyr196XolE/a4c32t0yhWGu3IxTt
	 2anadroMn7fGw==
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so2094987f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 16:51:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEI9e/ykHIbRpCHF+NEbCsCpCgaqxbKhiUG0w3yHZyBv3kHSfflqvjtIbwwZEV4bTSp0kpdZCCrQ8X4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3oudLwPJC/VaK00Cq2BvMmv3a0JQViGqhduIMl6KOqS86/k5B
	2niytzec2wvBBckD8KEpxpg2E/AHX9ewLJu0SMsxPfx1yhhjXnSVPTOFMkV78zphRZY6dRZu4fy
	W+qJwT+jZ8XtqCuPd2Sw3p1ffx/HToMM=
X-Google-Smtp-Source: AGHT+IEYzBXknTykBQ1N4HifJ4EJ5ABEr2IxiSGzoS1xGp1F6TYtaXxoMPgsPrk1p0g+88PANj1vgBGlykuqRZRGutI=
X-Received: by 2002:a5d:64c8:0:b0:3e7:63b0:bf3c with SMTP id
 ffacd0b85a97d-4266e7c6209mr14072627f8f.27.1760313070758; Sun, 12 Oct 2025
 16:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20251011155746.1558731-1-guoren@kernel.org> <CAK9=C2UrYg+sHsDqkmz7f7KnaREU7hXF4rbON002cnAti_pDXg@mail.gmail.com>
In-Reply-To: <CAK9=C2UrYg+sHsDqkmz7f7KnaREU7hXF4rbON002cnAti_pDXg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 13 Oct 2025 07:50:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR9VbOcBQOfF6Tqsp00289mypYExi2iGeKhwTu-iDS+aA@mail.gmail.com>
X-Gm-Features: AS18NWANYCTOkqbOuxt6SoWPohB4_pnla1E2x3tWojPPEfaEypOaOFajbNCOlnA
Message-ID: <CAJF2gTR9VbOcBQOfF6Tqsp00289mypYExi2iGeKhwTu-iDS+aA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add pgprot_dmacoherent definition
To: Anup Patel <apatel@ventanamicro.com>
Cc: samuel.holland@sifive.com, david@redhat.com, yongxuan.wang@sifive.com, 
	cuiyunhui@bytedance.com, luxu.kernel@bytedance.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, palmer@dabbelt.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

T24gU3VuLCBPY3QgMTIsIDIwMjUgYXQgMTE6NTHigK9QTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE9jdCAxMSwgMjAyNSBhdCA5OjI44oCv
UE0gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiAiR3VvIFJlbiAoQWxp
YmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPgo+ID4gUklTQy1WIFN2
cGJtdCBTdGFuZGFyZCBFeHRlbnNpb24gZm9yIFBhZ2UtQmFzZWQgTWVtb3J5IFR5cGVzCj4gPiBk
ZWZpbmVzIHRocmVlIG1vZGVzOgo+ID4KPiA+ICBNb2RlIHwgVmFsdWUgfCBSZXF1ZXN0ZWQgTWVt
b3J5IEF0dHJpYnV0ZXMKPiA+ICBQTUEgIHwgICAwICAgfCBOb25lCj4gPiAgTkMgICB8ICAgMSAg
IHwgTm9uLWNhY2hlYWJsZSwgaWRlbXBvdGVudCwgd2Vha2x5LW9yZGVyZWQgKFJWV01PKSwKPiA+
ICAgICAgIHwgICAgICAgfCBtYWluIG1lbW9yeQo+ID4gIElPICAgfCAgIDIgICB8IE5vbi1jYWNo
ZWFibGUsIG5vbi1pZGVtcG90ZW50LCBzdHJvbmdseS1vcmRlcmVkCj4gPiAgICAgICB8ICAgICAg
IHwgKEkvTyBvcmRlcmluZyksIEkvTwo+ID4KPiA+IFRoZSBwZ3Byb3RfZG1hY29oZXJlbnQgZGVm
YXVsdCB1c2VzIHRoZSBJTyBtZW1vcnkgYXR0cmlidXRlIGlmIHRoZXJlCj4gPiBpcyBubyBhc20g
ZGVmaW5pdGlvbiwgYnV0IElPIGlzIG5vdCBmb3IgbWFpbiBtZW1vcnkgYWNjb3JkaW5nIHRvCj4g
PiBTdnBibXQgcnVsZXMuCj4gPgo+ID4gVGhpcyBjb21taXQgY29ycmVjdHMgcGdwcm90X2RtYWNv
aGVyZW50IHdpdGggdGhlIE5DIG1lbW9yeSBhdHRyaWJ1dGUsCj4gPiB3aGljaCBzYXRpc2ZpZXMg
cGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQgYW5kIHByZXZlbnRzIHVzaW5nIHRoZSBJTwo+ID4gYXR0
cmlidXRlIHRvIGFjY2VzcyBtYWluIG1lbW9yeS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIChBbGliYWJhIERBTU8gQWNhZGVteSkgPGd1b3JlbkBrZXJuZWwub3JnPgo+Cj4gSSBoYWQg
c2VudCB0aGUgc2FtZSBwYXRjaCBvbiBBdWcgMjAgYW5kIHlvdSBoYWQgcHJvdmlkZWQKPiBUZXN0
ZWQtYnkgdG8gdGhhdCBwYXRjaC4KPgo+IElmIHlvdSBoYWQgY29uY2VybnMgd2l0aCBteSBwYXRj
aCB0aGVuIHlvdSBjb3VsZCBoYXZlIHByb3ZpZGVkCj4gY29tbWVudHMgYnV0IHlvdSBjaG9vc2Ug
dG8gaGlqYWNrIGl0IGFuZCBjaGFuZ2UgYXV0aG9yc2hpcC4KSSBkaWRuJ3QgZmluZCB5b3VyIHBh
dGNoIGF0IGZpcnN0LCBzbyBJIHNlbnQgaXQgb3V0LiBXaGVuIEkgZGlzY292ZXJlZAp5b3VyIHBh
dGNoLCBJIGdhdmUgdGhlIFRlc3RlZC1ieSB0byB5b3Vycy4KSSd2ZSBhZGRlZCB0aGUgYWJhbmRv
bmVkIHJlcGx5IHRvIHRoaXMgdGhyZWFkLiBIYXZlIHlvdSBzZWVuIHRoYXQgWzFdPwoKWzFdIGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUpGMmdUUmZMenJxSG9ZcmV4UzU1QVQzc2puNVZi
Yk5LZjJXTUVHV3J3OUVSUkxZWUFAbWFpbC5nbWFpbC5jb20vCgo+Cj4gUmVnYXJkcywKPiBBbnVw
Cj4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgOSArKysr
KysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgKPiA+IGluZGV4IDI5ZTk5NGE5YWZiNi4uMmE4NDQ3OWRlODFiIDEw
MDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiBAQCAtNjU0LDYgKzY1NCwxNSBA
QCBzdGF0aWMgaW5saW5lIHBncHJvdF90IHBncHJvdF93cml0ZWNvbWJpbmUocGdwcm90X3QgX3By
b3QpCj4gPiAgICAgICAgIHJldHVybiBfX3BncHJvdChwcm90KTsKPiA+ICB9Cj4gPgo+ID4gKy8q
Cj4gPiArICogRE1BIGFsbG9jYXRpb25zIGZvciBub24tY29oZXJlbnQgZGV2aWNlcyB1c2Ugd2hh
dCB0aGUgUklTQy1WIGFyY2hpdGVjdHVyZQo+ID4gKyAqIGNhbGwgIk5vbi1DYWNoZWFibGUiIG1l
bW9yeSBhdHRyaWJ1dGUsIHdoaWNoIHBlcm1pdHMgaWRlbXBvdGVudCwgd2Vha2x5LW9yZGVyZWQK
PiA+ICsgKiAoUlZXTU8pLCBtYWluIG1lbW9yeS4gVGhpcyBpcyBkaWZmZXJlbnQgZnJvbSAiSS9P
IiBtZW1vcnkgYXR0cmlidXRlIHdoaWNoIGlzCj4gPiArICogaW50ZW5kZWQgZm9yIE1NSU8gYWNj
ZXNzIHdpdGggTm9uLWNhY2hlYWJsZSwgbm9uLWlkZW1wb3RlbnQsIHN0cm9uZ2x5LW9yZGVyZWQK
PiA+ICsgKiAoSS9PIG9yZGVyaW5nKSwgSS9PIGF0dHJpYnV0ZXMuCj4gPiArICovCj4gPiArI2Rl
ZmluZSBwZ3Byb3RfZG1hY29oZXJlbnQgcGdwcm90X3dyaXRlY29tYmluZQo+ID4gKwo+ID4gIC8q
Cj4gPiAgICogQm90aCBTdmFkZSBhbmQgU3ZhZHUgY29udHJvbCB0aGUgaGFyZHdhcmUgYmVoYXZp
b3Igd2hlbiB0aGUgUFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LiBCeQo+ID4gICAqIGRlZmF1
bHQgdGhlIE0tbW9kZSBmaXJtd2FyZSBlbmFibGVzIHRoZSBoYXJkd2FyZSB1cGRhdGluZyBzY2hl
bWUgd2hlbiBvbmx5IFN2YWR1IGlzIHByZXNlbnQgaW4KPiA+IC0tCj4gPiAyLjQwLjEKPiA+Cj4g
PgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
