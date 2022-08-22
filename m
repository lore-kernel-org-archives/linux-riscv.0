Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82EBC28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 11:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QT2ub+DnlieQz4hKfXdAd3L4VUu3pILpUBvCbNBxpzA=; b=i1ItwInr8BigyA
	Ci44Nj5neJ/HTd5VZe4Uk++2zAKngJPyzV0NBQjuEjoV3VXBOV1aMkp8AATMI0Zx9ccpQ6upZIUkq
	klRe00IGdlULZNhSV2W9DvLgwXzpXFYz3y26R+oPOf3AtGdENurS8GEwXmRfubTf//OFh7H+lq2en
	Qb6ohOSWg8XRJttrQbo1hD5ZQxrcN3u23EtpfmIrGq47ARH1ju352BP9n9S3l6XkmRZAg9wa9rugj
	Zs1inLEnTmW5Hb9IlYHcmiBpqCw+QYQByelnO0WqR7O49jsXXwl9maVzNajr5MNz/kve7rdRN9Ag3
	vActMWiFL1JbDzjkCKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5tx-008U1D-UQ; Mon, 22 Aug 2022 11:47:30 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ5tv-008Tv7-9V
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 11:47:28 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-11c896b879bso12518021fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 04:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=gD3YKhawXxvo58bUKUOlExnV1tyEwvD6NRrt00bkb+Q=;
        b=ARWAEphV7V8WtcDCUpuTHqTMpbZEiP6ioNOzYNa1V/kAem9IrxwpDRxb07g28bsVbk
         mcxubpkfOYQiDY3Ud8J7oxvtovQC/O2WwNnvKJUNiJV83vjbFd5jW0uEcmeslxnJZfRJ
         mWK+kVuXCdj4ovfuLQbjxSDXDXmwWZnZd94C6Orzl3O7/MbIHfKGdAbx5KVtUWvWLUy7
         IouIGhzWkAYtQJrPH7l5CWGPrcD87j9ikjpsAYallYe0kMG1pwOwd7ZF8M1dgslTjIyE
         av/YKhyB9Gy7+rGquwp+vD8wip7580greqS7EhkfJHLo+VE3IVfvACbuD2ydTmV27yXK
         /5PQ==
X-Gm-Message-State: ACgBeo3z53BqOWAx22HMMAXWpjIR1wodYvKNf6NNNlm5jGPLd+iYvXNp
	vPsqbkV+g1S/7s4T3UHmrMqw4FG349kqrw==
X-Google-Smtp-Source: AA6agR4vEFFw8LZEqXcIJdg2OyAkQiih2yrySDm6/fwfrOBd5pv3A78YbQSseUKpvGNFl62fWt5FWg==
X-Received: by 2002:a05:6870:a103:b0:11c:bdcb:e29 with SMTP id m3-20020a056870a10300b0011cbdcb0e29mr7619551oae.192.1661168845045;
        Mon, 22 Aug 2022 04:47:25 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com. [209.85.210.42])
        by smtp.gmail.com with ESMTPSA id q13-20020a056870e60d00b0011c4b72e352sm2936132oag.13.2022.08.22.04.47.24
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 04:47:24 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id v12-20020a9d7d0c000000b00638e210c995so7480303otn.13
        for <linux-riscv@lists.infradead.org>; Mon, 22 Aug 2022 04:47:24 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr18713118ybr.202.1661168424232; Mon, 22
 Aug 2022 04:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220815050815.22340-1-samuel@sholland.org> <5593349.DvuYhMxLoT@jernej-laptop>
 <3881930.ZaRXLXkqSa@diego> <2249129.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <2249129.ElGaqSPkdT@jernej-laptop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Aug 2022 13:40:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEjKnkj8JKpHUajU=xnDyuWeHmtrz0Y7qML+_XuCxDRg@mail.gmail.com>
Message-ID: <CAMuHMdVEjKnkj8JKpHUajU=xnDyuWeHmtrz0Y7qML+_XuCxDRg@mail.gmail.com>
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base devicetree
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_044727_439523_95941DD0 
X-CRM114-Status: GOOD (  21.47  )
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

SGkgSmVybmVqLAoKT24gVHVlLCBBdWcgMTYsIDIwMjIgYXQgMTE6MjggQU0gSmVybmVqIMWga3Jh
YmVjCjxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+IHdyb3RlOgo+IERuZSB0b3JlaywgMTYuIGF2
Z3VzdCAyMDIyIG9iIDExOjEyOjA1IENFU1QgamUgSGVpa28gU3TDvGJuZXIgbmFwaXNhbChhKToK
PiA+IEFtIERpZW5zdGFnLCAxNi4gQXVndXN0IDIwMjIsIDA5OjQ5OjU4IENFU1Qgc2NocmllYiBK
ZXJuZWogxaBrcmFiZWM6Cj4gPiA+IERuZSB0b3JlaywgMTYuIGF2Z3VzdCAyMDIyIG9iIDA5OjQx
OjQ1IENFU1QgamUgS3J6eXN6dG9mIEtvemxvd3NraQo+IG5hcGlzYWwoYSk6Cj4gPiA+ID4gT24g
MTUvMDgvMjAyMiAwODowOCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArICAgICAgIGRlOiBkaXNwbGF5LWVuZ2luZSB7Cj4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQxLWRpc3BsYXktZW5naW5lIjsKPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICBhbGx3aW5uZXIscGlwZWxpbmVzID0gPCZtaXhlcjA+LCA8
Jm1peGVyMT47Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsK
PiA+ID4gPiA+ICsgICAgICAgfTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgb3NjMjRN
OiBvc2MyNE0tY2xrIHsKPiA+ID4gPgo+ID4gPiA+IGxvd2VyY2FzZQo+ID4gPiA+Cj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDI0MDAwMDAwPjsKPiA+ID4gPgo+ID4g
PiA+IFRoaXMgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgYm9hcmQsIG5vdCBTb0MuCj4gPiA+Cj4gPiA+
IFNvQyBuZWVkcyAyNCBNSHogb3NjaWxsYXRvciBmb3IgY29ycmVjdCBvcGVyYXRpb24sIHNvIGVh
Y2ggYW5kIGV2ZXJ5IGJvYXJkCj4gPiA+IGhhcyBpdC4gSGF2aW5nIGl0IGhlcmUgc2ltcGxpZmll
cyBib2FyZCBEVCBmaWxlcy4KPiA+Cj4gPiBJIGd1ZXNzIHRoZSBvc2NpbGxhdG9yIGlzIGEgc2Vw
YXJhdGUgY29tcG9uZW50IG9uIGVhY2ggYm9hcmQsIHJpZ2h0Pwo+Cj4gQ29ycmVjdC4KPgo+ID4g
QW5kIERUIG9idmlvdXMgaXMgbWVhbnQgdG8gZGVzY3JpYmUgdGhlIGhhcmR3YXJlIC0gaW5kZXBl
bmRlbnRseSBmcm9tCj4gPiBpbXBsZW1lbnRhdGlvbi1zcGVjaWZpYyBjaG9pY2VzLgo+Cj4gVGhl
cmUgaXMgbm8gY2hvaWNlIGluIHRoaXMgY2FzZS4gMjQgTUh6IGNyeXN0YWwgaGFzIHRvIGJlIHBy
ZXNlbnQuCj4KPiBGV0lXLCBpbmNsdWRpbmcgY3J5c3RhbCBub2RlIGluIFNvQyBzcGVjaWZpYyBE
VFNJIGlzIGFscmVhZHkgY29tbW9uIHBhdHRlcm4gaW4KPiBBbGx3aW5uZXIgQVJNIFNvQyBEVFNJ
IGZpbGVzLgoKSSBjb3VsZCBhbHNvIGJlIGEgcHJvZ3JhbW1hYmxlIGNsb2NrIGdlbmVyYXRvciBv
biB0aGUgYm9hcmQsIHByb2dyYW1tZWQKdG8gZ2VuZXJhdGUgYSAyNCBNSHogY2xvY2sgb24gb25l
IG9mIGl0cyBvdXRwdXRzPyBBZ2Fpbiwgb24gdGhlIGJvYXJkLgoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0KR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
ZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkg
anVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
