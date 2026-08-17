Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCF7C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 01:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2x59B0l7R0GyRwwLW/OJgFFP+jRE3F96Lr3xSvAJja8=; b=P2eqiWsVDDvfGC
	ysp1ZS8isc6qXBQKbGdb+9iYEkEo0A0j1qy8cLFVB8549txyk2+llukAWxpgNnL9NkKNPAnJx3T1k
	AOZ43ZH1gnSM+O2YLPtE8/fsdzRKpYzg/Q3Q+slxD26TxPfCJ63/IvAPUruo44SM4cYyOTJ7yYWTd
	eWyRcabIn4NbGRwt0mWSOCuGyWehRwFxFgAzQJXjBHnP9dmygxgCH4ClwTyjUk8hNj/48Z/tXAF+b
	DED0UYwqdtl0zwGWu3rBv6un4XuOsKLqJs4OHPQQkMfZFqRJVEolUqblbalVmdRdJM3o0tJjKvQIt
	LXNNhIUSdKHqG8XGzlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvmL1-00000005GVB-0yhN;
	Mon, 17 Aug 2026 01:40:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvmKz-00000005GV5-44iK
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 01:40:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 53774601DE
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 01:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1B21F00A3D
	for <linux-riscv@lists.infradead.org>; Mon, 17 Aug 2026 01:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786930828;
	bh=wII6hxnB1dc212LTMU6AIct1KNscBDOB/iEUH2KCUuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ihSSmwnnc1yOyWDCnGpvPsjL7QCdNft89TZfep0jaX7LsslCU34fAnAmX3qOrJ2dC
	 jHc5IGfKEi00AyEDyuVacmQm2TwMEme4PrQjiXVMqglWhijvH3nqFTXUGqS71NGk2X
	 mVm8OJ8eRNUs5+RSQOJEJ0Cf5ismmtrzvs2BRhWe/4AXq1chDVy8zUiAzmen6qPdH9
	 uLSgp3txjkzXkVyj8ZMAIojzt1Ov4v8qbJRKBPNzOiXxrjjy8qZrAXuO9xqCGuPJ6c
	 sbkRzJVUnAPkJGYGw34mAWCTeH3DIH7DVjXMUuK5xVCm6/XvqA6XCvEUGmFUDTPROp
	 9sEVGhluHTQFw==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47362928f65so2762892f8f.2
        for <linux-riscv@lists.infradead.org>; Sun, 16 Aug 2026 18:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpqN31HN5KIV4CCYmJFFhivkYqrEmt8cV7rFCD61305VyYORWXtGsCnAoImyY4uOtjV9xXpjNbCkwnayQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ/L3jb28L2QhQIBifGGHXu47T3T8A+KJxAQEYOx+aaUu0H0n9
	74mfVueWGKtqD5Ur/e9MaHa+EQjGkYjoBaLWf7DuNNJkLc/u9LJxWd8RcmS2uNnNQBo0h2jfZlg
	+B+8el6RtVdlWZdrzEESDeEDEVWGFbAY=
X-Received: by 2002:a05:6000:4386:b0:47f:8ff9:c9bc with SMTP id
 ffacd0b85a97d-48160753971mr32144040f8f.14.1786930826717; Sun, 16 Aug 2026
 18:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260815015722.1736831-1-guoren@kernel.org> <20260815015722.1736831-3-guoren@kernel.org>
 <TY4PR01MB144323654B3A6569BD23F918E98D92@TY4PR01MB14432.jpnprd01.prod.outlook.com>
In-Reply-To: <TY4PR01MB144323654B3A6569BD23F918E98D92@TY4PR01MB14432.jpnprd01.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 17 Aug 2026 09:40:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQWkniMxoMfyNVinD_s-ECHQtAnf9+Qskb8d3Wg1YDRBQ@mail.gmail.com>
X-Gm-Features: AcwNN1U-V9USqqdyFxIKoqUZgLzbx7pRn_uMfX8m-Sf4VAPhfcyAolyCfwlzBZ8
Message-ID: <CAJF2gTQWkniMxoMfyNVinD_s-ECHQtAnf9+Qskb8d3Wg1YDRBQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: riscv: Add Xuantie C906/C908/C910/C920 compatibles
To: Shengyu Qu <wiagn233@outlook.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, robh+dt@kernel.org, 
	conor.dooley@microchip.com, krzk@kernel.org
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

T24gU3VuLCBBdWcgMTYsIDIwMjYgYXQgMzo0NeKAr0FNIFNoZW5neXUgUXUgPHdpYWduMjMzQG91
dGxvb2suY29tPiB3cm90ZToKPgo+IENhbid0IHdlIGp1c3QgcmVwbGFjZSBhbGwgZXhpc3Rpbmcg
ZHRzJyB0aGVhZCB0byB4dWFudGllPyBTbyB3ZSBjYW4KPiByZW1vdmUgdGhlYWQgaGVyZS4KCkdv
b2QgYWR2aWNlLCBJJ2xsIHRyeSB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24uIFRoeC4KCj4KPiA+
IEFkZCBlcXVpdmFsZW50IGNvbXBhdGlibGVzIHVzaW5nIHRoZSBuZXdseSBkZWZpbmVkIHh1YW50
aWUgdmVuZG9yCj4gPiBwcmVmaXguIEtlZXAgdGhlIGV4aXN0aW5nIHRoZWFkIGNvbXBhdGlibGVz
IHRvIHByZXNlcnZlIGNvbXBhdGliaWxpdHkKPiA+IHdpdGggZXhpc3RpbmcgZGV2aWNlIHRyZWVz
Lgo+ID4KPiA+IENjOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+
ID4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4gPiBDYzogZGV2aWNldHJl
ZSA8ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHVU8gUmVu
IChYdWFuVGllKSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDQgKysrKwo+ID4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiBpbmRleCA1ZmVlYjIyMDMw
NTAuLjVhYmExZThlZDE5NSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+IEBAIC02Nyw2ICs2NywxMCBAQCBwcm9w
ZXJ0aWVzOgo+ID4gICAgICAgICAgICAgICAgIC0gdGhlYWQsYzkwOAo+ID4gICAgICAgICAgICAg
ICAgIC0gdGhlYWQsYzkxMAo+ID4gICAgICAgICAgICAgICAgIC0gdGhlYWQsYzkyMAo+ID4gKyAg
ICAgICAgICAgICAgLSB4dWFudGllLGM5MDYKPiA+ICsgICAgICAgICAgICAgIC0geHVhbnRpZSxj
OTA4Cj4gPiArICAgICAgICAgICAgICAtIHh1YW50aWUsYzkxMAo+ID4gKyAgICAgICAgICAgICAg
LSB4dWFudGllLGM5MjAKPiA+ICAgICAgICAgICAgIC0gY29uc3Q6IHJpc2N2Cj4gPiAgICAgICAg
IC0gaXRlbXM6Cj4gPiAgICAgICAgICAgICAtIGVudW06Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
