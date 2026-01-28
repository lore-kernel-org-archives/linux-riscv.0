Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FB5D3F082
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGeHR+Z9nk3Zj+bfmZQwRp6rIOR5pJYGIJ5AYhEbTfo=; b=AYErtAhcy1/aNJ
	KjeoUJZlBqIu8x1ojWH0aOtt44QbLLKqxgoyCroNMjfwxbKczyJpHSGZckpRrTNPc+7eNWs/7JpaZ
	/qYh6KR1AIF7M0z95hR1wvD5D91WjNvEhpJqjS/ozh5oDWeWPTcdyvXtk7XpMlGWP4ZKcvxRwXUzP
	qAjHFT1GUD0POFVHOx9WrZBevPtO1qmrvM31QQpPlxYPVI93gD0B8ABsHgTZNZI0m4npMTPzX1Gj3
	trFCKzpNAbGeQijOBm1tu7bvJiJZ27/HxIV+AqVWhNd+xkg0sdNR0Jv1+yLLHaIFbjt23A6gWGoRz
	3KashQXlAJFGC4ghMsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7h3-0000000GJBP-0bV1;
	Wed, 28 Jan 2026 15:42:57 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7h1-0000000GJAt-0V98
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 15:42:56 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-64965ee303dso4573028d50.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 07:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769614974; cv=none;
        d=google.com; s=arc-20240605;
        b=ZGz9BUss6d5VirOQydIulhVMM2uRuyywVWWr1BUHy3SlPhUpEiDHe6TvarLxuBE/pH
         801GKHXWRhSmT2e4etbM5hezPX9aLsAU3XdTciRceMKSce+9w8lt8flc+eNemp6G8p6P
         Fmj8xtawkuwLlQFMR733U5ZwJ4sIEz4n37EsVeh5mV5iPdrzhRJj8H+K2x77b4106GFO
         qR3wnIQlnMPNnqJCySvQgX0oKUnIYOeDnbQnENe23mWk8TCweKSPQlq6VmbrvI2GmxKM
         kXiJwfd9W6+3Gz1LsurEVPA4ugVmWUB7CE6b4FqVMEW5Jb58O7O2mlvvQ9Z/SgRR/ugo
         vvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8HL0HkET+dj1w35XFDXNOqZl3z1k2yF2PBoeKmcws1E=;
        fh=UeYWaf9igKhvcj0b5JiOiT6dzMb20odgSj82IDpkk+M=;
        b=XfdHcXt4i23/vHqmsmvmeGrLheaPUeE8tmwEwwld5a7KdTN7cS7XspqrqfnroMkoXf
         moMIHkNI8d8ArpbAjyRshrePA1/xz2rIlOvSUS7mSP5mt7QAJW9tWITFtBKPUE9V96D+
         1S0uTuXtCWP56iJM/3oXIm540E+RVPV6Nu3FheSIsAw1Uh40Z1LZvwY4ElTjHN8a2DWo
         /1SmtAD2wGhdtCFw/6A9l4VhpB550ToJMwgQzhBJ459tK+Vd3VBrr3vJSmhe6I5gmqeh
         XDc02Jig57UHEBVfK0wcUshl5QaMwX5dJ8q+ojXadW0sQdfu9Q8yH/56AuGr6C39KNbw
         TKqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769614974; x=1770219774; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HL0HkET+dj1w35XFDXNOqZl3z1k2yF2PBoeKmcws1E=;
        b=fCR2G5IT2epNGFtS416piZYGiXzYjKFu5k0nrgvSUVj8XlihDmzmKoN+uL0wrayS4U
         /fzmHtezx4NYqMOC7coOLVku3yv2iN2sF+gm1LgpCjzk1U4Pbq3t5J0fMYN8P7C1rLNZ
         eBxj0vs/5aeQ8wmJ/Lsg+KmNlHQaYmHtc22BOdbMSexKxH3/t5vPl6WPugjpaWjrxENV
         2Cu/r5HeJzCf/93tlJqOZy0+bKJVd65X9r70CGuWcxd66FzJSjOpHxaJUAhJ4Vq3yx5X
         i/wSEJY1AnRStrleZGCp41bPZuacvC5Z1xrO9wCj6hPMmVVgYftY5EgKQRkRzhlKoGMe
         LMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769614974; x=1770219774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8HL0HkET+dj1w35XFDXNOqZl3z1k2yF2PBoeKmcws1E=;
        b=TttKpEY1cdQ+GS8tEAcHFdagLydrQPf+MR1eElBMusVdIDgx7QEi+rsoX0dhavr4aq
         dq/ddXE2tJ31nyddnmGD4f/j0z9scMeLdIhn+LlMHB3EMYhVGlvjxO7UJ/6DVCR5QO3O
         01J2jWLkVO94b7YKia+J9XcCohkULFv1jezR7CI0FXgOs+j/MIZ+ppLhmwp45jQJTNxl
         X5KNYzF30P4Ht5RJXNxP+1/Y8ljSWiUrJiPcB/Kk2WrqJCvCuRVBv/ara6FLYlF5FqyR
         KTZMLYlzLSz739v64A/9VlVTS3vgDWF91Eqalyjswgn1hAKymoddrSwUQT+e1l1+pajn
         SUNw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/glqpBtdgCNPaOSrg1l5PR2/Ciko5pSUM16q1SbrAv4n2L7qoiDFiPuhxhD7OVEGxD+qAoPcgFq1ig==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrZl6v4dbBXlLUClmlB9tf5fcWd1pOjEb3k9sR/v6uSSF5ozb8
	7ITHlnHVGA19cccz08zmkJCuJsFL6iTajqQiX/gVlyVxrYlSQDmK5c29J5kP41qsyd7gbr8/u/T
	/pm/inuRGbZpN4jlF6dI/p8az4rgquWAaX6HrrNcjPw==
X-Gm-Gg: AZuq6aJYF0FRjm4CXGP7aki5TOiDT3L04tCq+mBgHxo0aJrUniS5TSsVHE44XwRaUZs
	2/AElLUizT8WXdA8WqPeu2WybvqdNLsTrP3GQCVX8YGpXA+3ve6i9cFMYZoFhTLRnEneRJ2sJRy
	SWv6i5jnvQPKIzLYibTZdr4MpP8hV7usHIqL4JEcBb1nR7SX8OiJyGRtBoX9AtymiQ4DxOKAzDW
	no7wa7Zo7KkdWGxHoFNk4DIJP7toIvptheYJQdhQ3RV1WnSkR9Cd+6Xnsy6JZTLDSBc2jnZWqvb
	Ouw3ZQltKR0F14L35jNI8ofKqjVxPh5C0ekCAPJ5VgeKzikjoY3yI4gCIDMa
X-Received: by 2002:a05:690e:1481:b0:647:108c:146 with SMTP id
 956f58d0204a3-6498fc469cdmr4118109d50.57.1769614973756; Wed, 28 Jan 2026
 07:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
 <20260127-mystify-carmaker-150aa3fcd6c6@spud> <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
 <20260128-duckling-confess-88e64fabe752@spud>
In-Reply-To: <20260128-duckling-confess-88e64fabe752@spud>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 28 Jan 2026 09:42:42 -0600
X-Gm-Features: AZwV_Qi-uXOx5p8xPeM0zhwGXZ9arE9COUg5t7UOd-tNyeJsiugC1O9p5HwMOKM
Message-ID: <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Conor Dooley <conor@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_074255_168054_393C9BE1 
X-CRM114-Status: GOOD (  39.38  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIEphbiAyOCwgMjAyNiBhdCA5OjAy4oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDI3LCAyMDI2IGF0IDA1
OjM5OjMzUE0gLTA2MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiA+IEhpIENvbm9yLAo+
ID4KPiA+IE9uIFR1ZSwgSmFuIDI3LCAyMDI2IGF0IDE6NTjigK9QTSBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIEphbiAyNiwgMjAyNiBh
dCAwMzowNzoxNFBNIC0wNjAwLCBBbmlydWRoIFNyaW5pdmFzYW4gd3JvdGU6Cj4gPiA+ID4gRG9j
dW1lbnQgYmluZGluZ3MgZm9yIFRlbnN0b3JyZW50IEF0bGFudGlzIFBSQ00gdGhhdCBtYW5hZ2Vz
IGNsb2Nrcwo+ID4gPiA+IGFuZCByZXNldHMuIFRoaXMgYmxvY2sgaXMgaW5zdGFudGlhdGVkIDQg
dGltZXMgaW4gdGhlIFNvQy4KPiA+ID4gPiBUaGlzIGNvbW1pdCBkb2N1bWVudHMgdGhlIGNsb2Nr
cyBmcm9tIHRoZSBSQ1BVIFBSQ00gYmxvY2suCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBBbmlydWRoIFNyaW5pdmFzYW4gPGFzcmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+Cj4g
PiA+ID4gLS0tCj4gPiA+IFRoaXMgaXMgcHJldHR5IHN1c3BlY3Qgc291bmRpbmcsIGlmIHRoZSBQ
TExzIGZvciAhcmNwdSBhcmUgY29udHJvbGxlZCBpbgo+ID4gPiB0aGUgcmNwdSByZWdpc3RlciBy
ZWdpb24sIHdoeSBpcyBpdCBub3QgYSBjbG9jayBwYXJlbnQgZm9yIHRoZSAhcmNwdQo+ID4gPiBw
cmNtcz8KPiA+Cj4gPiBJIHNhdyBhbm90aGVyIGNsb2NrIGRyaXZlciBkb2luZyBpdCBpbiB0aGUg
bWFubmVyIEkgZGlkIFsxXSwgYW5kCj4KPiBUaGUgZXhhbXBsZSBpcyB1c2luZyBpdCBqdXN0IHRv
IGNoZWNrIGxvY2sgc3RhdHVzLCB3aGljaCBJIHRoaW5rIGlzCj4gZGlmZmVyZW50IHRoYW4gd2hh
dCB5b3UndmUgZ290IGhlcmU/IFdoYXQgeW91IHdyb3RlIGltcGxpZXMgdGhhdCB0aGUKPiB3aG9s
ZSBjb25maWd1cmF0aW9uIGZvciB0aGVzZSBQTExzIGlzIGluIHRoYXQgcmVnaXN0ZXIgcmVnaW9u
LgoKWWVzLCBpdCBzZWVtcyBsaWtlIHRoYXQgZXhhbXBsZSBhY3R1YWxseSBuZWVkcyBvbmUgcmVn
bWFwIGZvcgpjb25maWd1cmluZyBhbmQgYW5vdGhlciBmb3IgY2hlY2tpbmcgbG9jayBzdGF0dXMg
b2YgdGhlIFBMTCwgYnV0IGluCm91ciBjYXNlIG9ubHkgb25lIGlzIGVub3VnaC4KCj4gPiB0aG91
Z2h0IHRoYXQgaXQgd291bGQgbWFrZSB3cml0aW5nIHRoZSBiaW5kaW5ncyBhbmQgdGhlIGNsb2Nr
IGRyaXZlcgo+ID4gc2ltcGxlci4gRWFjaCBwcmNtIG5vZGUgd291bGQgaGF2ZSBhIHNpbmdsZSBp
bnB1dCBjbG9jayAob3RoZXJ3aXNlCj4gPiB0aGVyZSB3b3VsZCBiZSBhIGRpZmZlcmluZyBudW1i
ZXIgb2YgaW5wdXQgY2xvY2tzIGZvciBlYWNoIHByY20gbm9kZSkuCj4gPgo+ID4gV2hhdCB3b3Vs
ZCB5b3Ugc3VnZ2VzdCB0aGF0IEkgZG8/Cj4KPiBJIHN1Z2dlc3QgdGhhdCB5b3UgbW9kZWwgdGhl
IGNsb2NrIHRyZWUgY29ycmVjdGx5IGluIGRldmljZXRyZWUsIGV2ZW4gaWYKPiB0aGF0IG1ha2Vz
IHRoaW5ncyBtb3JlIGNvbXBsaWNhdGVkLiBPbmUgcHJjbSBub2RlIGhhdmluZyBtb3JlIGlucHV0
Cj4gY2xvY2tzIGlzbid0IHNvbWV0aGluZyB0byBiZSBhZnJhaWQgb2YsIGl0IHNob3VsZCBiZSBw
cmV0dHkKPiBzdHJhaWdodGZvcndhcmQgdG8gaGFuZGxlIGluIGJvdGggZGV2aWNldHJlZSBhbmQg
ZHJpdmVyLCBhbmQgaXMgbm90IGFueQo+IG1vcmUgY29tcGxpY2F0ZWQgdGhhbiBoYXZpbmcgdG8g
ZGVhbCB3aXRoIHRoZSBzeXNjb24gcGhhbmRsZSB0aGF0IHlvdQo+IHVzZSBhdCB0aGUgbW9tZW50
LgoKVW5kZXJzdG9vZC4KCj4KPiBidHcsIHdoZXJlIGlzIHRoZSBjb2RlIGZvciB0aGUgIXJjcHUg
Y2xvY2sgY29udHJvbGxlcnM/IEFGQUlDVCwgdGhpcwo+IHNlcmllcyBvbmx5IGhhcyB0aGUgcmNw
dSBwb3J0aW9uIGFuZCBJIGNhbid0IGZpbmQgdGhlIGNvZGUgdGhhdCBhY3R1YWxseQo+IHVzZXMg
dGhlIHBoYW5kbGUuIFdoeSBpcyB0aGUgcGF0Y2ggZG9jdW1lbnRpbmcgc3R1ZmYgdGhhdCBoYXMg
bm8gdXNlcj8KCkkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gY29tcGxldGVseSB0ZXN0IHRoZSBjbG9j
ayBkcml2ZXIgZm9yIHRoZSBvdGhlcgpzdWJzeXN0ZW1zIHlldCwgc28gdGhhdCBoYXNuJ3QgYmVl
biBwb3N0ZWQgeWV0LiBPbmUgb2YgdGhlIGNvbW1lbnRzIG9uCnRoZSBwcmV2aW91cyB2ZXJzaW9u
cyBvZiB0aGlzIHNlcmllcyB3YXMgdG8gZG9jdW1lbnQgdGhlIGNvbXBsZXRlCmJpbmRpbmdzLCBz
byBJJ3ZlIHRyaWVkIHRvIGRvY3VtZW50IGFsbCB0aGUgNCBQUkNNcy4KCj4KPiA+IFRoaXMgd291
bGQgYWxzbyBhdm9pZCBoYXZpbmcgdGhlIGNsb2NrIHRyZWUgaW4gdGhlIGRyaXZlciBjb250YWlu
Cj4gPiBtdWx0aXBsZSBlbnRyaWVzIGZvciBzb21lIG9mIHRoZSBQTExzIChvbmUgaW4gdGhlIHJj
cHUgc3Vic3lzdGVtIHdoZXJlCj4gPiBpdCBpcyBkZWZpbmVkIGFuZCBhbm90aGVyIHdoZXJlIHRo
ZSBzYW1lIGNsb2NrIGlzIHJlZmVycmVkIHdpdGggewo+ID4gLmluZGV4ID0gMCB9KSB3aGljaCBj
b3VsZCBiZWNvbWUgY29uZnVzaW5nLgo+Cj4gSSBkb24ndCByZWFsbHkgdW5kZXJzdGFuZCB3aGF0
IHlvdSBtZWFuIGJ5IHRoaXMuIENhbiB5b3UgZWxhYm9yYXRlPwo+IElmIHlvdSBtZWFuIHRoYXQg
bXVsdGlwbGUgY2xvY2tzIHByb2R1Y2VkIGJ5IHRoZSBwcmNtIHdvdWxkIGFsbCB1c2UKPiBpbmRl
eCA9IDAgYXMgdGhlaXIgcGFyZW50LCB0aGF0IGRvZXMgbm90IHNvdW5kIGFibm9ybWFsIHRvIG1l
LiBXaXRob3V0Cj4gYmVpbmcgYWJsZSB0byBzZWUgdGhlICFyY3B1IGRyaXZlciBpbXBsZW1lbnRh
dGlvbnMsIEkgY2FuJ3QgZXZlbiBtYWtlCj4gZ3Vlc3NlcyBhcyB0byB3aGF0IHRoZSBjbG9jayB0
cmVlIGxvb2tzIGxpa2UuCgpJbiB0aGUgY2xvY2sgZHJpdmVyLCB5b3UnZCBlbmQgdXAgaGF2aW5n
IHNvbWV0aGluZyBsaWtlIHRoaXMKCnN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRh
IG9zY18yNG1fY2xrW10gPSB7CiAgICAgICAgeyAuaW5kZXggPSAwIH0sCiB9OwouCi4Kc3RhdGlj
IGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50X2RhdGEgcGNpZV9wbGxbXSA9IHsKICAgICAgICB7IC5p
bmRleCA9IDAgfSwKfTsKCkJvdGggcG9pbnQgdG8gaW5kZXggMCwgYnV0IG9uZSBpcyBmb3IgdGhl
IHJjcHUgcHJjbSBhbmQgYW5vdGhlciBpcyBmb3IKdGhlIHBjaWUgcHJjbS4gVG8gbWUsIHRoaXMg
ZmVsdCBsaWtlIGl0IG1pZ2h0IGNvbmZ1c2Ugc29tZW9uZSBsb29raW5nCmF0IHRoZSBkcml2ZXIu
IEJ1dCBpdCBkb2Vzbid0IGFmZmVjdCBmdW5jdGlvbmFsaXR5IGluIGFueSBtYW5uZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
