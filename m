Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1245C433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 12:09:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363A6613AA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 12:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 363A6613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cnkam3UyTt9Ky0TPsfXorn3xW1dBzUVahGnzm6omzWA=; b=QqoXvn3yoX3wTmtklq2PNtNt3
	05FJRli9RSc/YWQExbwqxTJ6Fsr91wgj8i/AgYVE3MuB0a1xbAOos5efHnWOb0UdDPbolakH3SkPT
	qsvftsE1+aRuJ6VqiL6627hn60Sw4T/8yXXsSquhfwGBpC9y/O+YrylCzn/iCTN5qm5mPgt/dpZNI
	p0flGFwpXXPrwLKUctb2yuGH6Z1dFAhSalXMPfcDJOF4pWnSv1WBhJSEWtfvtbfhhy4yqiLjtmJ8b
	xQFCSX7jYjcyAWKSTM1YInN7zRXsDOqeHKQJO9mo11qoFpyqFKw7WcclxBVzLuRSyRZ6ayrJomCgV
	tplKPUqIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldtrx-00G9mz-6s; Tue, 04 May 2021 12:09:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldtrv-00G9mR-7R; Tue, 04 May 2021 12:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=GoONfpBLyMysB/FhmzAT7uuw2J/Ov3DAFLCcF6TfPu0=; b=dT3odR20UjpiAbJCdaYFtkOBBE
 SUwL2QBWANSazcs1kcmXyDs9gFiP/BHdHcwkqv7Bj61RGHb2zN7MYEp7m/iHIna9+GnhmIUJmxV2W
 UfTcOxAtrt4abFvRhsTDTimZ5fBtLHFBGioD2bJed/19bfoFC2EdWE9Vu0SdFWOw5IFX21OkilYfc
 KIMGk9g5Gi/uljYRv1RVxYNzMsg9dRqYwJlb+CUc5DdqknrSMCqRS2EAZXqRl7ErzpAM9subYZ7Fq
 BIw4TxTu8omF4dFgOse0PfZvqST1lnN8xVkXadgCi5wP/hRERXQ6+tm4MWA/63L7bc2g1vxrCTUoI
 r4VZB+zQ==;
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldtrs-003xGL-Ml; Tue, 04 May 2021 12:09:38 +0000
Received: by mail-yb1-xb30.google.com with SMTP id v188so1713829ybe.1;
 Tue, 04 May 2021 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GoONfpBLyMysB/FhmzAT7uuw2J/Ov3DAFLCcF6TfPu0=;
 b=tckQoMf463vNPurJ8/DE4FlF1sR1Nq0y0BGfCjVf8H5j3Et6hVbvUaiODNjIcMs8Mt
 /jviFaGyjUN7LjTPIxRHFL6MbcW/qsfvx7daHYGdThRFhwx1eXpFdf80lgbrdZv5XAjV
 q4gQ4TPa7fL+vnbwn0z/rAJc/sZkrwddRBwa++gDz+AHI7QIQYmqAdOtMto9fFmvT2bc
 fVvw/3LRWi+nbFtSTZbFEIN/PYyaBpsjosnuewLM9WmkMpdXmIGMx9D0R9AaZW8PuyET
 eTYCcWQ8qBfkV4daDjJf5RPZUriDmdZ2ym+kRWtgTKy71x49yqybOjhVhEz2ORMPpte6
 O99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GoONfpBLyMysB/FhmzAT7uuw2J/Ov3DAFLCcF6TfPu0=;
 b=oEw5O7vv4Z5xHl/8oc8oP/ps757Bxf4mRRFo5PWGptKlGyG2zBqRTlNW3i2Ym2zKib
 +ujgPK6F0qbVaxOgVPVCIeyW4dR4TRbVtNIzr0ZLhiSAg5I2Xe4618/TOLVIXprQxO3Q
 o/nNZzPjfIy5uJqh/zTcBBdsmOBMxles2dwGbP4IpnIuVHLH03b6CtfxjEzyoxz9KJXX
 P/FgrDOG75HfEPxkNtKhd4kTa4TZOlYT0MsURYT2utsLFG7WN4hPZaD8M89xVheKtuhD
 ypxpzaWLz5drNFpBaN72lGIsBmpxlJebrZNWO6xDfZpuDBZX3nX5nU0zJk2DmC+vwFe+
 9Zdg==
X-Gm-Message-State: AOAM5310WweIALKmM7OIIyIgtelQquTfNuaWw0S1ImdCJntpH+E8KHcJ
 bnYb7S9Rkoek56+iy8gA2cw+puwbDVSlq4Ym3qI=
X-Google-Smtp-Source: ABdhPJyVieeZ40YfvrO3ib1FXeZbp8MAXFqo0Q4vUyeRjydd2sG818ixSt8PiKN39BRhtEFPC21X4DYHtphGIkl2Kro=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr34501993ybk.115.1620130175246; 
 Tue, 04 May 2021 05:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk>
 <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
 <20210504092225.GS6564@kitsune.suse.cz>
In-Reply-To: <20210504092225.GS6564@kitsune.suse.cz>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 4 May 2021 14:09:24 +0200
Message-ID: <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Joe Perches <joe@perches.com>, Paul Mackerras <paulus@samba.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_050936_776987_0A9FFC41 
X-CRM114-Status: GOOD (  19.04  )
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

T24gVHVlLCBNYXkgNCwgMjAyMSBhdCAxMToyMiBBTSBNaWNoYWwgU3VjaMOhbmVrIDxtc3VjaGFu
ZWtAc3VzZS5kZT4gd3JvdGU6Cj4KPiBFeGNlcHQgaXQgbWFrZXMgYW5zd2VyaW5nIHRoZSBxdWVz
dGlvbiAiSXMgdGhpcyBidWcgd2Ugc2VlIG9uIHRoaXMKPiBhbmNpZW50IHN5c3RlbSBzdGlsbCBw
cmVzZW50IGluIHVwc3RyZWFtPyIgbmVlZGxlc3NseSBtb3JlIGRpZmZpY3VsdCB0bwo+IGFuc3dl
ci4KCkNhbiB5b3UgcGxlYXNlIHByb3ZpZGUgc29tZSBkZXRhaWxzPyBJZiB5b3UgYXJlIHRhbGtp
bmcgYWJvdXQgdGVzdGluZwphIG5ldyBrZXJuZWwgaW1hZ2UgaW4gdGhlIGFuY2llbnQgc3lzdGVt
ICJhcy1pcyIsIHdoeSB3b3VsZG4ndCB5b3UKYnVpbGQgaXQgaW4gYSBuZXdlciBzeXN0ZW0/IElm
IHlvdSBhcmUgdGFsa2luZyBhYm91dCAgcGFydGljdWxhcgpwcm9ibGVtcyBhYm91dCBiaXNlY3Rp
bmcgKGtlcm5lbCwgY29tcGlsZXIpIHBhaXJzIGV0Yy4sIGRldGFpbHMgd291bGQKYWxzbyBiZSB3
ZWxjb21lLgoKPiBTdXJlLCB0aHJvd2luZyBvdXQgb2xkIGNvbXBpbGVyIHZlcnNpb25zIHRoYXQg
YXJlIGtub3duIHRvIGNhdXNlCj4gcHJvYmxlbXMgbWFrZXMgc2Vuc2UuIFVwZGF0aW5nIHRvIGxh
dGVzdCBqdXN0IGJlY2F1c2UgbXVjaCBsZXNzIHNvLgoKSSBkZWZpbml0ZWx5IGRpZCBub3QgYXJn
dWUgZm9yICJsYXRlc3QgY29tcGlsZXIiIG9yICJ1cGRhdGluZyBqdXN0IGJlY2F1c2UiLgoKPiBP
bmUgb2YgdGhlIHNlbGxpbmcgcG9pbnQgb2YgQyBpbiBnZW5lcmFsIGFuZCBnY2MgaW4gcGFydGlj
dWxhciBpcwo+IHN0YWJpbGl0eS4gSWYgd2UgbmVlZCB0aGUgbGF0ZXN0IGNvbXBpbGVyIHdlIGNh
biBhcyB3ZWxsIHJld3JpdGUgdGhlCj4ga2VybmVsIGluIFJ1c3Qgd2hpY2ggaGFzIGEgcmVxdWly
ZWQgdXBkYXRlIGN5Y2xlIG9mIGEgZmV3IG1vbnRocy4KClJ1c3QgZG9lcyBub3QgaGF2ZSBhICJy
ZXF1aXJlZCB1cGRhdGUgY3ljbGUiIGFuZCBpdCBkb2VzIG5vdCBicmVhayBvbGQKY29kZSB1bmxl
c3MgcmVhbGx5IHJlcXVpcmVkLCBqdXN0IGxpa2UgQyBhbmQgY29tbW9uIGNvbXBpbGVycy4KCkNv
bmNlcm5pbmcgR0NDLCB0aGV5IHBhdGNoIHJlbGVhc2VzIGZvciB+Mi41IHllYXJzLCBzdXJlLCBi
dXQgZm9yIG1hbnkKcHJvamVjdHMgdGhhdCBpcyBub3QgbmVhcmx5IGVub3VnaC4gU28geW91IHN0
aWxsIG5lZWQgY3VzdG9tIHN1cHBvcnQsCndoaWNoIGlzIGFueXdheSB3aGF0IG1vc3QgcGVvcGxl
IGNhcmUgYWJvdXQuCgo+IEJlY2F1c2Ugc29tZSBtYWlubGluZSBrZXJuZWwgZmVhdHVyZXMgcmVs
eSBvbiBibGVlZGluZyBlZGdlIHRvb2xzIEkgZW5kCj4gdXAgYnVpbGRpbmcgbWFpbmxpbmUgd2l0
aCBjdXJyZW50IHRvb2xzIGFueXdheSBidXQgaWYgeW91IGRvIG5vdCBuZWVkCj4gQlRGIG9yIHdo
YXRldmVyIG90aGVyIGxhdGVzdCBnaW1taWNrIG9sZGVyIHRvb2xjaGFpbnMgc2hvdWxkIGRvLgoK
SXQgd291bGQgYmUgYmV0dGVyIHRvIGhlYXIgY29uY3JldGUgYXJndW1lbnRzIGFib3V0IHdoeSAi
b2xkZXIKdG9vbGNoYWlucyBzaG91bGQgZG8iLCByYXRoZXIgdGhhbiBjYWxsaW5nIHRoaW5ncyBh
IGdpbW1pY2suCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
