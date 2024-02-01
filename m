Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA60C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 15:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3DBMgC04DQrBFgPsqKxTcd/j+9A57SG8kH3cq5WcOQ=; b=x7xHEJuR1zthz8
	zCI9mve9iT4umJhvheM1VnnxhiQyKnTRpfmwl1GYmbUT1Np/0Mx2U7lEazm3dGlbs4V2Y3Y4OLBuK
	c0sZo2rhEauRMAIm7eAUz2SjA1UWu/IXNcw1sfUw6kMTHGIh9fS9NYGwBvkBqWSB3GT5KNWzcavju
	6OeRb9OSYMj3xQ8vkTU592RLaGzUSwhMVNzAbuFob96jwO9Vc3ZO1qCvPWWC87jVJNkJTYERCEMmZ
	nTRqaQb1nSpawtmOL/Sy9Xo6CGFmsvu8DwNWfhOWYpFU94EPndmMiBW3ZJnbqPi8KskyLGc1oAOOP
	pi4tWoXyyY09u386N77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVYfF-00000008NP2-1dHE;
	Thu, 01 Feb 2024 15:07:41 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVYfC-00000008NN1-0iz7
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 15:07:39 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2cf4fafa386so14528501fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 07:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706800055; x=1707404855; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLy6aeMXF8RQMmhWAlLcYtBSh4Y9QyUdmEdSbRti4xA=;
        b=nRT+xhp+jjfihH58fvV9OM2y/HeCUN5oxf+KYap56WCx57JrYiCa+o29vZPeeAqoTg
         khaxw/2dljDCdu4sawyDKD4He16jvTeGLuyUBMhyaFhNVCRT0y1+xFffVMF/7jJD2Kal
         i9DuSROlXRZBWUeQ2Wv0+DNMYF0X3+qi2TpmvWSDrhkPcWkiqCd1gAypwaDmcbgTlTp6
         72Y4mGRCr5DcU+iRJrPpPRYBQoOty0mnoV10WcM1OXP/ya8wSXBR3TFkelHogL6++cbL
         iozKvhjO8XiMzU6jRM3PDthSQqaRs43001LLMmyooTqwYprqZPt2APw5pKD5629tdT/+
         s0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706800055; x=1707404855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLy6aeMXF8RQMmhWAlLcYtBSh4Y9QyUdmEdSbRti4xA=;
        b=bWT0RyLpMyfHNN3IdmROO+KN1il6gZihXh7rpWEvoB1bvzqOUp/tvHlsbozuzx7Xw+
         fx4qxAy7IDaO3P+mrgmYd9ZHd0FG/p5l6PD5TyChBKOZh+3DBCVrAjM3krWkBoKYhCEW
         88IV1SlfQsDeLZJGxS/aDyO7SeHULh69XcbO/ToON0K2J9JiJTk91zWtqNOmuFK8UCi+
         Yh0icimXfScyzBJc/6Fp4xB002EAMwbQ+FepNBkYjLFoqjhIZtmP+V6YukNW/0haYcVy
         C/otebPeApgVQuFzsNXvH3ZtqM4o0qi2scSuU0iHeGcVaZpMd4zYV5+UY1NPeDEQ0EWa
         iQqA==
X-Gm-Message-State: AOJu0YyS5CnstK9Q3OuxM3Y8udCi2K1hitkDCSjT4U0euzAWDnt/R+K9
	wUoE/bB2w2FqseW+X7/dx/gX3kBmLPPz+eQ9fr5ORXuUiG3X6EHHxedgyMX0WPbXqNKxTghYQcb
	KjuuTiKyn6g0YGXwyAYa3DGP9E4T7Gfmj9RPWzQ==
X-Google-Smtp-Source: AGHT+IHbJBJ7YxaQlxRHLubYk5mC6hSutRyT7koHpdOpAI01kSdP/Fen2aCh7OgP+TYgCNNz73qnZVSrl+LwoncuI9I=
X-Received: by 2002:a2e:9dc8:0:b0:2cf:495a:1396 with SMTP id
 x8-20020a2e9dc8000000b002cf495a1396mr3525139ljj.17.1706800055030; Thu, 01 Feb
 2024 07:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87r0hzuw87.fsf@all.your.base.are.belong.to.us> <87le87uulb.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2UYCKUBKggtM606orH2mBu_AbTdB5-R5AP1M0t-LsEbEQ@mail.gmail.com>
 <87cytjvybb.fsf@all.your.base.are.belong.to.us> <87ttmuq3m7.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2UEpbd+pHAMg-AuP-fTPZVho16u69oSjOHhsR11HTwiew@mail.gmail.com> <87fryeognc.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87fryeognc.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 1 Feb 2024 20:37:22 +0530
Message-ID: <CAK9=C2UX0sRb5UbLdm8xwe1dP=x+enJRYzAuCPf6MdHTLTC_Cw@mail.gmail.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_070738_243085_03E34D40 
X-CRM114-Status: GOOD (  38.04  )
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMTE6MTnigK9QTSBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29t
PiB3cml0ZXM6Cj4KPiA+IE9uIFR1ZSwgSmFuIDMwLCAyMDI0IGF0IDg6MTjigK9QTSBCasO2cm4g
VMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Pgo+ID4+IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQGtlcm5lbC5vcmc+IHdyaXRlczoKPiA+Pgo+ID4+ID4gQW51cCBQYXRlbCA8YXBhdGVs
QHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKPiA+PiA+Cj4gPj4gPj4gT24gVHVlLCBKYW4gMzAs
IDIwMjQgYXQgMToyMuKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+ID4+ID4+Pgo+ID4+ID4+PiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0
ZXM6Cj4gPj4gPj4+Cj4gPj4gPj4+ID4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5j
b20+IHdyaXRlczoKPiA+PiA+Pj4gPgo+ID4+ID4+PiA+PiBUaGUgUklTQy1WIEFJQSBzcGVjaWZp
Y2F0aW9uIGlzIHJhdGlmaWVkIGFzLXBlciB0aGUgUklTQy1WIGludGVybmF0aW9uYWwKPiA+PiA+
Pj4gPj4gcHJvY2Vzcy4gVGhlIGxhdGVzdCByYXRpZmllZCBBSUEgc3BlY2lmY2F0aW9uIGNhbiBi
ZSBmb3VuZCBhdDoKPiA+PiA+Pj4gPj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFp
YS9yZWxlYXNlcy9kb3dubG9hZC8xLjAvcmlzY3YtaW50ZXJydXB0cy0xLjAucGRmCj4gPj4gPj4+
ID4+Cj4gPj4gPj4+ID4+IEF0IGEgaGlnaC1sZXZlbCwgdGhlIEFJQSBzcGVjaWZpY2F0aW9uIGFk
ZHMgdGhyZWUgdGhpbmdzOgo+ID4+ID4+PiA+PiAxKSBBSUEgQ1NScwo+ID4+ID4+PiA+PiAgICAt
IEltcHJvdmVkIGxvY2FsIGludGVycnVwdCBzdXBwb3J0Cj4gPj4gPj4+ID4+IDIpIEluY29taW5n
IE1lc3NhZ2UgU2lnbmFsZWQgSW50ZXJydXB0IENvbnRyb2xsZXIgKElNU0lDKQo+ID4+ID4+PiA+
PiAgICAtIFBlci1IQVJUIE1TSSBjb250cm9sbGVyCj4gPj4gPj4+ID4+ICAgIC0gU3VwcG9ydCBN
U0kgdmlydHVhbGl6YXRpb24KPiA+PiA+Pj4gPj4gICAgLSBTdXBwb3J0IElQSSBhbG9uZyB3aXRo
IHZpcnR1YWxpemF0aW9uCj4gPj4gPj4+ID4+IDMpIEFkdmFuY2VkIFBsYXRmb3JtLUxldmVsIElu
dGVycnVwdCBDb250cm9sbGVyIChBUExJQykKPiA+PiA+Pj4gPj4gICAgLSBXaXJlZCBpbnRlcnJ1
cHQgY29udHJvbGxlcgo+ID4+ID4+PiA+PiAgICAtIEluIE1TSS1tb2RlLCBjb252ZXJ0cyB3aXJl
ZCBpbnRlcnJ1cHQgaW50byBNU0lzIChpLmUuIE1TSSBnZW5lcmF0b3IpCj4gPj4gPj4+ID4+ICAg
IC0gSW4gRGlyZWN0LW1vZGUsIGluamVjdHMgZXh0ZXJuYWwgaW50ZXJydXB0cyBkaXJlY3RseSBp
bnRvIEhBUlRzCj4gPj4gPj4+ID4+Cj4gPj4gPj4+ID4+IEZvciBhbiBvdmVydmlldyBvZiB0aGUg
QUlBIHNwZWNpZmljYXRpb24sIHJlZmVyIHRoZSBBSUEgdmlydHVhbGl6YXRpb24KPiA+PiA+Pj4g
Pj4gdGFsayBhdCBLVk0gRm9ydW0gMjAyMjoKPiA+PiA+Pj4gPj4gaHR0cHM6Ly9zdGF0aWMuc2No
ZWQuY29tL2hvc3RlZF9maWxlcy9rdm1mb3J1bTIwMjIvYTEvQUlBX1ZpcnR1YWxpemF0aW9uX2lu
X0tWTV9SSVNDVl9maW5hbC5wZGYKPiA+PiA+Pj4gPj4gaHR0cHM6Ly93d3cueW91dHViZS5jb20v
d2F0Y2g/dj1yMDcxZEw4WjB5bwo+ID4+ID4+PiA+Pgo+ID4+ID4+PiA+PiBUbyB0ZXN0IHRoaXMg
c2VyaWVzLCB1c2UgUUVNVSB2Ny4yIChvciBoaWdoZXIpIGFuZCBPcGVuU0JJIHYxLjIgKG9yIGhp
Z2hlcikuCj4gPj4gPj4+ID4+Cj4gPj4gPj4+ID4+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUg
Zm91bmQgaW4gdGhlIHJpc2N2X2FpYV92MTIgYnJhbmNoIGF0Ogo+ID4+ID4+PiA+PiBodHRwczov
L2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPiA+PiA+Pj4gPj4KPiA+PiA+Pj4gPj4gQ2hh
bmdlcyBzaW5jZSB2MTE6Cj4gPj4gPj4+ID4+ICAtIFJlYmFzZWQgb24gTGludXgtNi44LXJjMQo+
ID4+ID4+PiA+PiAgLSBJbmNsdWRlZCBrZXJuZWwvaXJxIHJlbGF0ZWQgcGF0Y2hlcyBmcm9tICJn
ZW5pcnEsIGlycWNoaXA6IENvbnZlcnQgQVJNCj4gPj4gPj4+ID4+ICAgIE1TSSBoYW5kbGluZyB0
byBwZXIgZGV2aWNlIE1TSSBkb21haW5zIiBzZXJpZXMgYnkgVGhvbWFzLgo+ID4+ID4+PiA+PiAg
ICAoUEFUQ0g3LCBQQVRDSDgsIFBBVENIOSwgUEFUQ0gxNCwgUEFUQ0gxNiwgUEFUQ0gxNywgUEFU
Q0gxOCwgUEFUQ0gxOSwKPiA+PiA+Pj4gPj4gICAgIFBBVENIMjAsIFBBVENIMjEsIFBBVENIMjIs
IFBBVENIMjMsIGFuZCBQQVRDSDMyIG9mCj4gPj4gPj4+ID4+ICAgICBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjIxMTIxMTM1NjUzLjIwODYxMTIzM0BsaW51dHJv
bml4LmRlLykKPiA+PiA+Pj4gPj4gIC0gVXBkYXRlZCBBUExJQyBNU0ktbW9kZSBkcml2ZXIgdG8g
dXNlIHRoZSBuZXcgV0lSRURfVE9fTVNJIG1lY2hhbmlzbS4KPiA+PiA+Pj4gPj4gIC0gVXBkYXRl
ZCBJTVNJQyBkcml2ZXIgdG8gc3VwcG9ydCBwZXItZGV2aWNlIE1TSSBkb21haW5zIGZvciBQQ0kg
YW5kCj4gPj4gPj4+ID4+ICAgIHBsYXRmb3JtIGRldmljZXMuCj4gPj4gPj4+ID4KPiA+PiA+Pj4g
PiBUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcywgQW51cCEgSSdtIHN0aWxsIHJldmlld2luZyB0
aGUgcGF0Y2hlcy4KPiA+PiA+Pj4gPgo+ID4+ID4+PiA+IEknbSBoaXR0aW5nIGEgYm9vdCBoYW5n
IGluIHRleHQgcGF0Y2hpbmcsIHdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCBvbgo+ID4+ID4+PiA+
IDYuOC1yYzIuIElQSSBpc3N1ZXM/Cj4gPj4gPj4+Cj4gPj4gPj4+IE5vdCB0ZXh0IHBhdGNoaW5n
ISBPbmUgY3B1IHNwaW5uaW5nIGluIHNtcF9jYWxsX2Z1bmN0aW9uX21hbnlfY29uZCgpIGFuZAo+
ID4+ID4+PiB0aGUgb3RoZXJzIGFyZSBpbiBjcHVfcmVsYXgoKS4gU21lbGxzIGxpa2UgSVBJLi4u
Cj4gPj4gPj4KPiA+PiA+PiBJIHRyaWVkIGJvb3RlZmkgZnJvbSBVLUJvb3QgbXVsdGlwbGUgdGlt
ZXMgYnV0IGNhbid0IHJlcHJvZHVjZSB0aGUKPiA+PiA+PiBpc3N1ZSB5b3UgYXJlIHNlZWluZy4K
PiA+PiA+Cj4gPj4gPiBUaGFua3MhIEkgY2FuIHJlcHJvZHVjZSB3aXRob3V0IEVGSSwgYW5kIHNp
bXBsZXIgY29tbWFuZC1saW5lOgo+ID4+ID4KPiA+PiA+IHFlbXUtc3lzdGVtLXJpc2N2NjQgXAo+
ID4+ID4gICAtYmlvcyAvcGF0aC90by9md19keW5hbWljLmJpbiBcCj4gPj4gPiAgIC1rZXJuZWwg
L3BhdGgvdG8vSW1hZ2UgXAo+ID4+ID4gICAtYXBwZW5kICdlYXJseWNvbiBjb25zb2xlPXR0eTAg
Y29uc29sZT10dHlTMCcgXAo+ID4+ID4gICAtbWFjaGluZSB2aXJ0LGFpYT1hcGxpYy1pbXNpYyBc
Cj4gPj4gPiAgIC1uby1yZWJvb3QgLW5vZGVmYXVsdHMgLW5vZ3JhcGhpYyBcCj4gPj4gPiAgIC1z
bXAgNCBcCj4gPj4gPiAgIC1vYmplY3Qgcm5nLXJhbmRvbSxmaWxlbmFtZT0vZGV2L3VyYW5kb20s
aWQ9cm5nMCBcCj4gPj4gPiAgIC1kZXZpY2UgdmlydGlvLXJuZy1kZXZpY2Uscm5nPXJuZzAgXAo+
ID4+ID4gICAtbSA0RyAtY2hhcmRldiBzdGRpbyxpZD1jaGFyMCAtc2VyaWFsIGNoYXJkZXY6Y2hh
cjAKPiA+PiA+Cj4gPj4gPiBJIGNhbiByZXByb2R1Y2Ugd2l0aCB5b3VyIHVwc3RyZWFtIHJpc2N2
X2FpYV92MTIgcGx1cyB0aGUgY29uZmlnIGluIHRoZQo+ID4+ID4gZ2lzdCBbMV0sIGFuZCBhbGwg
bGF0ZXN0IFFFTVUvT3BlblNCSToKPiA+PiA+Cj4gPj4gPiBRRU1VOiAxMWJlNzA2NzdjNzAgKCJN
ZXJnZSB0YWcgJ3B1bGwtdmZpby0yMDI0MDEyOScgb2YgaHR0cHM6Ly9naXRodWIuY29tL2xlZ29h
dGVyL3FlbXUgaW50byBzdGFnaW5nIikKPiA+PiA+IE9wZW5TQkk6IGJiOTBhOWViZjZkOSAoImxp
Yjogc2JpOiBQcmludCBudW1iZXIgb2YgZGVidWcgdHJpZ2dlcnMgZm91bmQiKQo+ID4+ID4gTGlu
dXg6IGQ5YjlkNmViOTg3ZiAoIk1BSU5UQUlORVJTOiBBZGQgZW50cnkgZm9yIFJJU0MtViBBSUEg
ZHJpdmVycyIpCj4gPj4gPgo+ID4+ID4gUmVtb3ZpbmcgIixhaWE9YXBsaWMtaW1zaWMiIGZyb20g
dGhlIENMSSBhYm92ZSBjb21wbGV0ZXMgdGhlIGJvb3QgKGkuZS4KPiA+PiA+IHBhbmlja2luZyBh
Ym91dCBtaXNzaW5nIHJvb3QgbW91bnQgOy0pKQo+ID4+Cj4gPj4gTW9yZSBjb250ZXh0OyBUaGUg
aGFuZyBpcyBkdXJpbmcgYSBsYXRlIGluaXRjYWxsLCB3aGVyZSBhbiBmdHJhY2UgZGlyZWN0Cj4g
Pj4gKHJlZ2lzdGVyX2Z0cmFjZV9kaXJlY3QoKSkgbW9kaWZpY2F0aW9uIGlzIGRvbmUuCj4gPj4K
PiA+PiBTdG9wIG1hY2hpbmUgaXMgdXNlZCB0byBjYWxsIGludG8gX19mdHJhY2VfbW9kaWZ5X2Nh
bGwoKS4gVGhlbiBpbnRvIHRoZQo+ID4+IGFyY2ggc3BlY2lmaWMgcGF0Y2hfdGV4dF9ub3N5bmMo
KSwgd2hlcmUgZmx1c2hfaWNhY2hlX3JhbmdlKCkgaGFuZ3MgaW4KPiA+PiBmbHVzaF9pY2FjaGVf
YWxsKCkuIEZyb20gIm9uX2VhY2hfY3B1KGlwaV9yZW1vdGVfZmVuY2VfaSwgTlVMTCwgMSk7IiB0
bwo+ID4+IG9uX2VhY2hfY3B1X2NvbmRfbWFzaygpICJzbXBfY2FsbF9mdW5jdGlvbl9tYW55X2Nv
bmQobWFzaywgZnVuYywgaW5mbywKPiA+PiBzY2ZfZmxhZ3MsIGNvbmRfZnVuYyk7IiB3aGljaCBu
ZXZlciByZXR1cm5zIGZyb20gImNzZF9sb2NrX3dhaXQoY3NkKSIKPiA+PiByaWdodCBiZWZvcmUg
dGhlIGVuZCBvZiB0aGUgZnVuY3Rpb24uCj4gPj4KPiA+PiBBbnkgaWRlYXM/IERpc2FibGluZyBD
T05GSUdfSElEX0JQRiwgdGhhdCBkb2VzIHRoZSBlYXJseSBmdHJhY2UgY29kZQo+ID4+IHBhdGNo
aW5nIGZpeGVzIHRoZSBib290IGhhbmcsIGJ1dCBpdCBkb2VzIHNlZW0gcmVsYXRlZCB0byBJUEku
Li4KPiA+Pgo+ID4gTG9va3MgbGlrZSBmbHVzaF9pY2FjaGVfYWxsKCkgZG9lcyBub3QgdXNlIHRo
ZSBJUElzIChvbl9lYWNoX2NwdSgpCj4gPiBhbmQgZnJpZW5kcykgY29ycmVjdGx5Lgo+ID4KPiA+
IE9uIG90aGVyIGhhbmQsIHRoZSBmbHVzaF9pY2FjaGVfbW0oKSBkb2VzIHRoZSByaWdodCB0aGlu
ZyBieQo+ID4gZG9pbmcgbG9jYWwgZmx1c2ggb24gdGhlIGN1cnJlbnQgQ1BVIGFuZCBJUEkgYmFz
ZWQgZmx1c2ggb24gb3RoZXIKPiA+IENQVXMuCj4gPgo+ID4gQ2FuIHlvdSB0cnkgdGhlIGZvbGxv
d2luZyBwYXRjaCA/Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVz
aC5jIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPiA+IGluZGV4IDU1YTM0ZjIwMjBhOC4u
YTNkZmJlNGRlODMyIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMK
PiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jCj4gPiBAQCAtMTksMTIgKzE5LDE4
IEBAIHN0YXRpYyB2b2lkIGlwaV9yZW1vdGVfZmVuY2VfaSh2b2lkICppbmZvKQo+ID4KPiA+ICB2
b2lkIGZsdXNoX2ljYWNoZV9hbGwodm9pZCkKPiA+ICB7Cj4gPiArICAgIGNwdW1hc2tfdCBvdGhl
cnM7Cj4gPiArCj4gPiAgICAgIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKPiA+Cj4gPiArICAg
IGNwdW1hc2tfYW5kbm90KCZvdGhlcnMsIGNwdV9vbmxpbmVfbWFzaywgY3B1bWFza19vZihzbXBf
cHJvY2Vzc29yX2lkKCkpKTsKPiA+ICsgICAgaWYgKGNwdW1hc2tfZW1wdHkoJm90aGVycykpCj4g
PiArICAgICAgICByZXR1cm47Cj4gPiArCj4gPiAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19S
SVNDVl9TQkkpICYmICFyaXNjdl91c2VfaXBpX2Zvcl9yZmVuY2UoKSkKPiA+IC0gICAgICAgIHNi
aV9yZW1vdGVfZmVuY2VfaShOVUxMKTsKPiA+ICsgICAgICAgIHNiaV9yZW1vdGVfZmVuY2VfaSgm
b3RoZXJzKTsKPiA+ICAgICAgZWxzZQo+ID4gLSAgICAgICAgb25fZWFjaF9jcHUoaXBpX3JlbW90
ZV9mZW5jZV9pLCBOVUxMLCAxKTsKPiA+ICsgICAgICAgIG9uX2VhY2hfY3B1X21hc2soJm90aGVy
cywgaXBpX3JlbW90ZV9mZW5jZV9pLCBOVUxMLCAxKTsKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJP
TChmbHVzaF9pY2FjaGVfYWxsKTsKPgo+IFVuZm9ydHVuYXRlbHksIEkgc2VlIHRoZSBzYW1lIGhh
bmcuIExNSyBpZiB5b3UnZCBsaWtlIG1lIHRvIHRyeSBhbnl0aGluZwo+IGVsc2UuCgpJIHdhcyBh
YmxlIHRvIHJlcHJvZHVjZSB0aGlzIGF0IG15IGVuZCBidXQgSSBoYWQgdG8gdXNlIHlvdXIgY29u
ZmlnLgoKRGlnZ2luZyBmdXJ0aGVyLCBpdCBzZWVtcyB0aGUgaXNzdWUgaXMgb2JzZXJ2ZWQgb25s
eSB3aGVuIHdlIHVzZQppbi1rZXJuZWwgSVBJcyBmb3IgY2FjaGUgZmx1c2hpbmcgKGluc3RlYWQg
b2YgU0JJIGNhbGxzKSBhbG9uZyB3aXRoCnNvbWUgb2YgdGhlIHRyYWNlcnMgKG9yIGRlYnVnZ2lu
ZyBmZWF0dXJlcykgZW5hYmxlZC4gV2l0aCB0aGUgdHJhY2Vycwoob3IgZGVidWcgZmVhdHVyZXMp
IGRpc2FibGVkIHdlIGRvbid0IHNlZSBhbnkgaXNzdWUuIEluIGZhY3QsIHRoZQp1cHN0cmVhbSBk
ZWZjb25maWcgd29ya3MgcGVyZmVjdGx5IGZpbmUgd2l0aCBBSUEgZHJpdmVycyBhbmQKaW4ta2Vy
bmVsIElQSXMuCgpJdCBzZWVtcyBBSUEgYmFzZWQgaW4ta2VybmVsIElQSXMgYXJlIGV4cG9zaW5n
IHNvbWUgb3RoZXIgaXNzdWUKd2l0aCBSSVNDLVYga2VybmVsLiBJIHdpbGwgZGVidWcgbW9yZSB0
byBmaW5kIHRoZSByb290IGNhdXNlLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
