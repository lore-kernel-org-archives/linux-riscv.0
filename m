Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D567D74EFF
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOh+m074QLof84hyJJXSP5p4We6hAvLv3CV81anhRx4=; b=FhEWg6lrqOFjP7
	jKdhkGRdE2G7M1QD/WzrniiAOl0Qo8x2tvULwHoTA3V7rIgoFOZOo/01cx9Iu9b2M+MIfD3l8nNvp
	MXMLyFdn55VqRiFXIK0odWByEyvu3v41/odbq/8d0vIvwTUOEOBadxR6XvdBzc2nmWhV6B3z9UAqo
	hJP1KHNCvSoVbHmoXwFI19mhvfrkAe84gpmbUnqVWuauglmfeP3/TcSBwwLVmsJBLR2T0YYQU4Rwf
	lmj5jzFZcsjlQpweOtjc5v4WW+0lvwYqmFs7+O7GjXsHkYxjLw8QL6m7wZmdjZloTizkX/guFcrgU
	UCx3N4y7CMElF8/+xl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJ4n-0000000CDv4-3OW7;
	Mon, 26 Jan 2026 09:40:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJ4k-0000000CDuX-2lup
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 09:40:03 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47edffe5540so49272775e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 01:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769420400; cv=none;
        d=google.com; s=arc-20240605;
        b=ScuXTtqoiE6xZytHH1S8R9F9pOgeNqN5IbqN+veVRm2l1pbbQIhi7RLWmyKT0sVl4e
         F9iF6LzEjko0o1eKAH2q33EA3CC/8mOGg81LjQKu0CrVEJR8YWeDhTimrvgr5Ls1DRkr
         0PCzxeQ5tuDigu7GDafZV3gek6ZGfnZeVrz5vvIwvsngzLVyORFIc6QSikUBjrtCLase
         HeItJlGs5pKuzJC3x3JCUYT8CcH99d55LMk14oFwHcNkl68QQkqbhdD8DE3E+fGWN76G
         w73ZiMy4+vs154Ylw0wuB2OPawRjDf4HXi4m60VrrvAqVEs1hCfNYXOLOUX0UlrVaSuE
         DnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BRf37ApjnGe7/nAIJf9JO0r2p0iFOfO+Cd7wNGIbJtQ=;
        fh=f7A9lv08pn1/6b8ycqefw37KeXbjMXI/xJY9vYTngak=;
        b=fv4RG2Fx9DcjC5bDr5NP282qIljU4fjFG69t7LYjTQZ/ZVrQIiUU7861yGz8COqZ/8
         +458x3MJG8C91om6pguSQf1f1EW/g+9iXHci8vLo30mdY03bbINGSId1Q3WC+4q2zHu8
         Q2z6JCljfbwY3Kjk+/mRwM9PyrBVv3Z3Cko6rPBjcXtBJMuObGG7VlR1iSAsNR7ibpDV
         cE1BfOspqyyO4Wvz5svnmkfHxqNTI6Iwo+Me4nTXFeYoWPxCYdFX48UZ1DVWootYS06P
         rdlYef49LJIe43+XGorDJvRiVLtO/GQqSuPj6ohgDmzSDkSy5GOzcnexxacYRCdMlOPp
         PlOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769420400; x=1770025200; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRf37ApjnGe7/nAIJf9JO0r2p0iFOfO+Cd7wNGIbJtQ=;
        b=cfHvqQ2cRqKDYRyCD6xDhKQql4zOl0z9px/TgNSx+qEyCFX1U/+6d50utdNzRUwzE/
         aXm9/gvIqOjO9PHb6YzOnGjQ/PTOxMKOmfPsjn9GVPRiK/zuDK8l6rpvihWrCATMSxWB
         wEag0/uPoagRDhTEdJ/hBhJaNLH1ZqtgBU6c1xphTgu/oVCXVfNoN2rWcXdDVJjkmmUK
         eo9vIxeQgCBRMV61o2sJ6Wdc0IQ+g83sTzVkJtnkC0G/DyQtqwmvFIw2vQjme4ui9gS/
         zvO9Zvoi1ZTScJ46EILBTr6+WX4I8EejBD71n2L52bwOk5gGkofVykWrQ0uvCWuf83SX
         eceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769420400; x=1770025200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BRf37ApjnGe7/nAIJf9JO0r2p0iFOfO+Cd7wNGIbJtQ=;
        b=M5v/j1jKBbIRsqPjrXuFpKgNlO52ibtqYG3rd3hOmXHNPmqP09qR0PZ3WEBBLd2WjU
         49aEegsl/NWC7KYaBtBDMYVnC5IpYdra9fcli2i61stBCpICheYrVRkNvC+ManMGITMg
         NEZxYwCFfeKFAlk1YSS1k0WGwUTk/Z0XLjzan7yDbyL8w3UtxrIDkfxe8kbYPiETLryK
         RYvwDw9EuGHZUmxOLiwR90Pl/ryt3ymMdefo7Dmj6g49q8L8m2F7txyL1VZAnEVpIRlT
         blE2gEs84crtJmchZrK1DESGil3hOzxXET+iwJKR3wolAaD+iCKufi4I97JWJTftiFXm
         FWTw==
X-Forwarded-Encrypted: i=1; AJvYcCWgXPpdPxboDm5iWVZVopV5T/pEFZ5fExnTzSlwMtM2345+oMZOoejDeQStV4VDUs2rVQCREgyqDeeEtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSrG7uSH1dEq3FnG8LgBAswazYHCSRqjP3A4l1g8J5gNmyZPuX
	odPDnKRERMZm7uqig2D9LI/+tLQi/daRQ68ZJK/JrlS3pIhP30GioAgNyVFquyqPIYu5ZxGvIjb
	kyL9WQ0010H4oO0wa/eFJpLwWllyvMA6jHjmM
X-Gm-Gg: AZuq6aJCXh9QwWSyyfBkXNdskRGRDPphkb/cS6OZkBsO8r1uY5IudXs2Og9gzPYcpVI
	uMEE53BhDSrJfCBGxSfjeD4S5Nguahuuy7lT/6P8AU7Da/oMrlEX9Jcx2NvCmN5C/8UgMpBHLsl
	Gockjcuj0ZRCPfENJw8yqu4jIaKRxen+psqciXmxg88JCkAsyL162vclmCxBTYPPSM03DrAuZzN
	E59cVF/6IEZXFLdY8YvTE+bONkED5wimkNSizYoi2+aSAvBskmpNyc/BLs697bz4ihPXrA=
X-Received: by 2002:a05:600c:314f:b0:480:3b4e:41ba with SMTP id
 5b1f17b1804b1-4805cf669b2mr55307945e9.18.1769420400364; Mon, 26 Jan 2026
 01:40:00 -0800 (PST)
MIME-Version: 1.0
References: <aXGNwBk79yMuvysm@adminpc-PowerEdge-R7525> <a2a69633-8462-01ac-626c-2f0f0160553e@kernel.org>
In-Reply-To: <a2a69633-8462-01ac-626c-2f0f0160553e@kernel.org>
From: Austin Kim <austindh.kim@gmail.com>
Date: Mon, 26 Jan 2026 18:39:48 +0900
X-Gm-Features: AZwV_Qg75Zsxxv-uA164YAQy9KwujqP3s8KHze6VhGPWVA6jHOxbD41U3W_Ailc
Message-ID: <CADLLry65+uvd5mPwn+L3obNAL8sc=K1E3xHnh9uTz8bV7ob6aw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add macros for software check and hardware error
 exception codes
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_014002_736951_D62CCCA0 
X-CRM114-Status: GOOD (  16.85  )
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

SGVsbG8sCgoyMDI264WEIDHsm5QgMjTsnbwgKO2GoCkgUE0gNDo1NywgUGF1bCBXYWxtc2xleSA8
cGp3QGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPgo+IEhpIEF1c3RpbiwKPgo+IE9uIFRodSwg
MjIgSmFuIDIwMjYsIEF1c3RpbiBLaW0gd3JvdGU6Cj4KPiA+IFRoZSBsYXRlc3QgUklTQy1WIFBy
aXZpbGVnZWQgc3BlY2lmaWNhdGlvbiBkZWZpbmVzIG5ldyBzeW5jaHJvbm91cwo+ID4gZXhjZXB0
aW9uIGNvZGVzIGluIHRoZSBzY2F1c2UgcmVnaXN0ZXI6Cj4gPgo+ID4gICAgMTg6IFNvZnR3YXJl
IGNoZWNrCj4gPiAgICAxOTogSGFyZHdhcmUgZXJyb3IKPiA+Cj4gPiBMaW5rOiBodHRwczovL2Rv
Y3MucmlzY3Yub3JnL3JlZmVyZW5jZS9pc2EvcHJpdi9zdXBlcnZpc29yLmh0bWwKPiA+IC0gMTIu
MS44LiBTdXBlcnZpc29yIENhdXNlIChzY2F1c2UpIFJlZ2lzdGVyCj4gPgo+ID4gQWRkIHRoZXNl
IG1hY3JvcyBmb3IgZnV0dXJlIHVzZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdXN0aW4gS2lt
IDxhdXN0aW5kaC5raW1AZ21haWwuY29tPgo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guICBUaG91
Z2gsIG1heWJlIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gYWRkIHRoZXNlCj4gYWxvbmcgd2l0aCBj
b2RlIHRoYXQgdXNlcyB0aGVtPwoKVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suCgpDb3VsZCB5
b3UgY29uc2lkZXIgYWRkaW5nIG1hY3JvIGRlZmluaXRpb25zIGZvciB0aGUgdXBjb21pbmcgZXhj
ZXB0aW9uIGNvZGVzPwpUaGVzZSBtaWdodCBiZSB1c2VkIGxhdGVyIHdoZW4gdHJ5aW5nIHRvIGhh
bmRsZSBleGNlcHRpb25zIGZvcgpTT0ZUV0FSRV9DSEVDSyBvciBIQVJEV0FSRV9FUlJPUi4KCiAg
ICAxOCA9IGludGVncml0eSBmYXVsdAogICAgMTkgPSBjb3JydXB0L3BvaXNvbmVkIG1lbW9yeQoK
PEZyb206IGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcml2aWxlZ2VkL3RvcGljL25l
d19leGNlcHRpb25fY2F1c2VfY29kZXNfZm9yLzEwMDUxODkxMj4KCkFzIGZvciBTT0ZUV0FSRV9D
SEVDSygxOCksIERlZXBhayBHdXB0YSBpcyBub3cgZGV2ZWxvcGluZyBwYXRjaC1zZXQKZm9yIHRo
ZSBlbnRpcmUgcGF0Y2ggZm9yCkNGSSB3aXRoIFNPRlRXQVJFX0NIRUNLIGVycm9yLCBhcyBiZWxv
dy4KCmh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDI1LzYvNC85NzkKCkFuZCBIQVJEV0FSRV9FUlJP
UigxOSkgaXMgaW50ZW50ZWQgZm9yICdpbXBsZW1lbnRhdGlvbiBkZWZpbmVkJy4KCkkgZ3Vlc3Mg
dGhlIGZvbGxvd2luZyBzd2l0Y2h+Y2FzZSBpcyB0aGUgcmlnaHQgcGxhY2UgdG8gcHV0CkVYQ19T
T0ZUV0FSRV9DSEVDSyBhbmQKRVhDX0hBUkRXQVJFX0VSUk9SLgoKYXJjaC9yaXNjdi9rdm0vdmNw
dV9leGl0LmMKaW50IGt2bV9yaXNjdl92Y3B1X2V4aXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBz
dHJ1Y3Qga3ZtX3J1biAqcnVuLAogICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX2Nw
dV90cmFwICp0cmFwKQp7ClsuLi5dCiAgICAgICAgY2FzZSBFWENfQlJFQUtQT0lOVDoKICAgICAg
ICAgICAgICAgIHJ1bi0+ZXhpdF9yZWFzb24gPSBLVk1fRVhJVF9ERUJVRzsKICAgICAgICAgICAg
ICAgIHJldCA9IDA7CiAgICAgICAgICAgICAgICBicmVhazsKKyAgICAgICBjYXNlIEVYQ19TT0ZU
V0FSRV9DSEVDSzoKKyAgICAgICBjYXNlIEVYQ19IQVJEV0FSRV9FUlJPUjoKKyAgICAgICAgICAg
ICAgIC8qIFRvZG86IFRoaXMgZXhjZXB0aW9uIGNvZGUgaXMgYWRkZWQgYXQgUHJpdmlsZWdlZApJ
U0EgdmVyc2lvbiAxLjEzLAorICAgICAgICAgICAgICAgICAgZnVydGhlciBhY3Rpb25zIHdpbGwg
Zm9sbG93ICAgICAgICAgICovCisgICAgICAgICAgICAgICBicmVhazsKCklmIGNvZGUgd2l0aCB0
aGUgbWFjcm8gZGVmaW5pdGlvbiBzaG91bGQgYmUgYWRkZWQsIEkgd2lsbCBwcm9wb3NlIGEKbmV3
IHZlcnNpb24gbGF0ZXIKd2l0aCB0aGVzZSBtYWNybyBkZWZpbml0aW9uLgoKVGhhbmsgeW91IGFn
YWluLgoKQlIsCkF1c3RpbiBLaW0KCj4KPgo+IC0gUGF1bAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
