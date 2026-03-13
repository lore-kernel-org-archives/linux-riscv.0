Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CA8105F785
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 09:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8p3/ZHskNtGjCWWVr4iNWViwMmS33FeFFmROcDcQWxA=; b=f5BU/t9kFMlDuK
	c+J8KYSUNqIKSETzYM/LatjRQ3bLsGoNSDsGosOGvjq1WnJOsmSXTGg8qwejbeWbCcVKjtbGz9X0a
	oXzieZRpWLxw9lo7xpGPTVsT8gyoRefrtY1FBMtaAvJYo2+gYy3kgxlfXJvr7TtQ3R9cz1/ieAKnH
	k/VfKTIO/UXQEhbM8OKbm/E7GFRjqBoZWaF1A9h2JMhHzMxrAMdF7A9TXeeFm1EffTyyw5LgQ1jf4
	+6p9rQksnYgwCfKecf6n7/jGjkepvbA8cEptbofUFfszJhXP/0TiTOh4amDnwQgAorZTnVcMB8LMF
	S42w1LL170uBajUB10aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z2D-0000000HPWe-39W7;
	Fri, 13 Mar 2026 09:42:21 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0z2B-0000000HPWF-3Qql
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 09:42:21 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-798374d0f44so45955627b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 13 Mar 2026 02:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773394938; cv=none;
        d=google.com; s=arc-20240605;
        b=Qa5UAhdXCBYXxOE88kHPr5dRJEsBE6l0LpIv36GCjt9ZFt2tM8WQgtaJkCySppaajQ
         lzJq6kLO0Tt60y8tt3U50pNz1V7jyStXB8DHfG41SXLMgFEAHwrV3EwO25eQW9a0i7cM
         yfIS1TkOn8JISqyLc+xQMYlPMS/SUt3qcuvr7AE04q+EEQcvsGh0bq10cH1Jn1UD/2Pn
         iyiPUOaXox0K9fDKR8BcCDKH4tYFOEzwLYO4iVuV/DZ2kIJqbn2CrGowfAG+Wq0XNa4M
         YSAqgVKpgPE+yKNoKPnqTtrTTGBm+Z3ufoPwCtQe3Be6Plu8davXFzEj8E3ExoMFTXUD
         sOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3WjmletplWN85DKdqz792fPfJhrtfvngbL64ZSg/oZw=;
        fh=2FBfuvkpg+HNDfNEscDWLZd3ipxWAFFYyUzOMjwXj18=;
        b=DgZskWYLSMFVFpxDhHeFnjZ1cVB3UmWH6NcdrAm0gVsaly7S/68hnnONU+xRhYKKm2
         +MlrhG+fSZLSnk2xb/9e0sIeU7aaSLkwMZQ7ed5tPSRWwu0YGd/wTWurt21PZdOwhgcM
         UqRuHpZBmwLdnwgWCBsxLp9Q3zEnBuGpixntVzfXTndgpBX7SyHrzsqilyMV3rE1P+nT
         AvnNHY0NpzGUaEc18vXPUB6GlnGicdFHi8vXkvAToq3qkdNDil27BiPV4TTFDcCAmYXc
         jMrqrotRH6n2nfbd6uGXmbPPLHWon6QjGGRYwBlyyzKGbD5x7nqTzOtDSg6tpP5ycXh4
         nrCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773394938; x=1773999738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WjmletplWN85DKdqz792fPfJhrtfvngbL64ZSg/oZw=;
        b=bbbO/uR420gzTGBclvpyz3qWh9YVe2AqFGWV7i0v2yhKfw3D3PkNLUuDMWQJQ/JVLw
         923LX8s728azDtsRrfnHxey2cnq5H00LuPZT6P+4O6A8LABkZDRL1Zhx0i9o1yWutDzE
         cStcrFGKqy+Odv/jc453MO7iIf/2jELZS5jOQlqpOErPVudFPlTckTBxUMe8GHC2TDWj
         eUtHlwtVyvLmmpkSqyaotP0R0auTDVT7f2uhbcngNPm2FxNiBQF8MctahltHvASwG9Df
         cnmIan1+gOTG9iNiDkrbIOcPL/NuVcvxp8s3bZZipQI6QGjlqWGn202umn+KfhJ+5cyF
         zEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394938; x=1773999738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3WjmletplWN85DKdqz792fPfJhrtfvngbL64ZSg/oZw=;
        b=fIZusc8UsPmdF/BqGN1oJz86DY6rQlvlUNmaXukERliKf1fruKQP49PwdlGAEXXKdE
         rnc2e04t0gbyjUJSvSvZFhmTAtmKmpxh0EpRan7DNAGFRhbCHy8gXg4oY6xfR17jAk1B
         cb5auKo2S/HwuBXpbygwjd1MLIKm3v4w82cidI/LeYvZ7tYkZGqsUYMmUpFbFl5cksy7
         9vyzKUKxzIBIx/Qcw4HwuC5dNPQyObPQzFs0JPsT1kiJLNMgeGW130naXj1T2Qd6MTA6
         sSL7koTB2xMo7aLMYsUBcABTN2ZkonpqlTZ+7YeiXpC70mLmjyWJpZkpI6NVnqPW9nKa
         mMoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7tbz2mRVXJFCvPqMUdxQfd5+MgzR1EcZfJEgLJfZAikP0C3y4hGNUAqgjzUm2cnR7iCUVFTnc+EkQjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoHtnbY15s5EQTT+NhB/rXKNcFwwTqQ053IrPjSRG1EiJ/KpFe
	UtXkF9+wB5E7BQ4pzja97TA+1vofcQeMj0GDnhnGJFt+/+/J5Z/LksBlOEfVoGiJipPDc51ISn0
	LAZNvHVD2DsiPQGQcJ4osp9GdfMjjKQ0=
X-Gm-Gg: ATEYQzz43lBdUKktcyR4T6qClqpjrvD5uj3iOpnlm02tR29eCxLXQBkOLO36YFb50r3
	PSrEtuQGIdPdiyQbqoKl/y0b0dKwTNRxHPbbaJES/EEaZv4NE71lp8G5Myxq9q/XNmqITwjp4/L
	cpGb1kVqbNi7YN7AtLRRzF0E6b6rvLATEh5inlXCNvoMelrUMd0jxxNQ1BeVRJnwrOLh/gEiVgH
	Ta3WS0LScNvDm8mTl/2ht6QR8XqnOzdXyWuG1qG3bD5VpZiEXKvKJT8+HWUJuLakliSbC9b9fSf
	9efxpVY=
X-Received: by 2002:a05:690c:c4f9:b0:798:7039:eecc with SMTP id
 00721157ae682-79a1bbb4527mr27419187b3.6.1773394938250; Fri, 13 Mar 2026
 02:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
 <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com> <20260313001940-GKA407679@kernel.org>
In-Reply-To: <20260313001940-GKA407679@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 13 Mar 2026 10:42:07 +0100
X-Gm-Features: AaiRm51e5SToR1tOSk9liHEfRop_JhUUodJVYw5is_oXMgLYIQA1K8IuEgYknus
Message-ID: <CABdCQ=Mv-3X8KE1WOWKVTmq+POgJczsL-qFdAyp5qzM6=0s28A@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
 and power infrastructure
To: Yixun Lan <dlan@kernel.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_024219_892751_FDDA7F5C 
X-CRM114-Status: GOOD (  21.97  )
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

RWwgdmllLCAxMyBtYXIgMjAyNiBhIGxhcyAxOjE5LCBZaXh1biBMYW4gKDxkbGFuQGtlcm5lbC5v
cmc+KSBlc2NyaWJpw7M6Cj4KPiBIaSBUcmV2b3IsIElrZXIsCj4KPiBPbiAxNDoyNyBXZWQgMTEg
TWFyICAgICAsIFRyZXZvciBHYW1ibGluIHdyb3RlOgo+ID4gSGksCj4gPgo+ID4gT24gMjAyNi0w
My0wOSAwNzo0MCwgSWtlciBQZWRyb3NhIHdyb3RlOgo+ID4gPiBBZGQgU3BhY2VtaXQgUDEgUE1J
QyBjb25maWd1cmF0aW9uIGFuZCBib2FyZCBwb3dlciBpbmZyYXN0cnVjdHVyZSBmb3IKPiA+ID4g
dm9sdGFnZSByZWd1bGF0aW9uIHN1cHBvcnQuCj4gPiA+Cj4gPiA+IC0gQWRkIGJvYXJkIHBvd2Vy
IHJlZ3VsYXRvcnMgKDEyViBpbnB1dCwgNFYgcmFpbCkKPiA+ID4gLSBFbmFibGUgSTJDOCBmb3Ig
UE1JQyBjb21tdW5pY2F0aW9uCj4gPiA+IC0gQ29uZmlndXJlIFBNSUMgd2l0aCBidWNrNCAodm1t
YykgYW5kIGFsZG8xICh2cW1tYykgcmVndWxhdG9ycwo+ID4gPiAtIFNldCB1cCByZWd1bGF0b3Ig
Y29uc3RyYWludHMgZm9yIFNEIGNhcmQgb3BlcmF0aW9uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IElrZXIgUGVkcm9zYSA8aWtlcnBlZHJvc2FtQGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1vcmFuZ2VwaS1ydjIuZHRzIHwgNDgg
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2Vy
dGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazEtb3JhbmdlcGktcnYyLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azEtb3JhbmdlcGktcnYyLmR0cwo+ID4gPiBpbmRleCA3YjczMzFjYjNjNzI2ZjExZDU5N2Y4MTkx
N2YzYTNmNWZjMjFlMWI5Li40MTRiMDNmNWU2NDgwZjA1ZjVkN2VlYWFhMGFmYjRlODY0MjVhZTM2
IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLW9yYW5n
ZXBpLXJ2Mi5kdHMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1v
cmFuZ2VwaS1ydjIuZHRzCj4gPiA+IEBAIC0xOSw2ICsxOSwyNSBAQCBhbGlhc2VzIHsKPiA+ID4g
ICAgICAgICAgICAgZXRoZXJuZXQxID0gJmV0aDE7Cj4gPiA+ICAgICB9Owo+ID4gPgo+ID4gPiAr
ICAgcmVnX2RjX2luOiBkYy1pbi0xMnYgewo+ID4gPiArICAgICAgICAgICBjb21wYXRpYmxlID0g
InJlZ3VsYXRvci1maXhlZCI7Cj4gPiA+ICsgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gImRj
X2luXzEydiI7Cj4gPiA+ICsgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDEy
MDAwMDAwPjsKPiA+ID4gKyAgICAgICAgICAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8MTIw
MDAwMDA+Owo+ID4gPiArICAgICAgICAgICByZWd1bGF0b3ItYm9vdC1vbjsKPiA+ID4gKyAgICAg
ICAgICAgcmVndWxhdG9yLWFsd2F5cy1vbjsKPiA+ID4gKyAgIH07Cj4gPiA+ICsKPiA+IElzIHRo
aXMgdGhlIGNvcnJlY3Qgdm9sdGFnZT8gSSBkb24ndCBzZWUgYSAxMlYgcmFpbCBpbiB0aGUgUlYy
J3MKPiA+IGRhdGFzaGVldCwgYW5kIHRoZSBib2FyZCdzIHNwZWNpZmljYXRpb25zIG9ubHkgaW5k
aWNhdGUgYSA1ViBVU0ItQyBpbnB1dC4KPgo+IFJpZ2h0LCB0aGlzIHNob3VsZCBiZSBmaXhlZC4g
UGxlYXNlIG5vdGUgSGFuIHN1Ym1pdHRlZCBvbmUgdmVyc2lvbiBvZiBiYXNpYyBEVCBmb3IgcnYy
Cj4gd2hpY2ggSSB0aGluayB0aGF0IHNlcmllcyB3aWxsIGdvIGluIGZpcnN0Cj4KPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMzEwMTYxODUzLjM5MDA2MDUtMS1nYW9oYW5AaXNjYXMu
YWMuY24KPgoKSSdtIGZpbmUgd2l0aCB0aGF0LiBEbyB3ZSBoYXZlIGFuIGVzdGltYXRlIG9mIHdo
ZW4gdGhlc2UgY2hhbmdlcyB3aWxsCmxhbmQ/IEknbSBmaW5lIHdpdGggcmViYXNpbmcgb25jZSB0
aG9zZSBhcmUgbWVyZ2VkLCBidXQgSSdkIGxpa2UgdG8KY29udGludWUgd2l0aCB0aGUgcmV2aWV3
IGZvciB0aGUgcmVtYWluaW5nIGNoYW5nZXMgaW4gdGhpcyBwYXRjaApzZXJpZXMgYW5kIEknbSB1
bnN1cmUgb24gaG93IHRvIHByb2NlZWQuCgo+ID4gPiArICAgcmVnX3ZjY180djogdmNjLTR2IHsK
PiA+ID4gKyAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWd1bGF0b3ItZml4ZWQiOwo+ID4gPiAr
ICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2Y2NfNHYiOwo+ID4gPiArICAgICAgICAgICBy
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw0MDAwMDAwPjsKPiA+ID4gKyAgICAgICAgICAgcmVn
dWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NDAwMDAwMD47Cj4gPiA+ICsgICAgICAgICAgIHJlZ3Vs
YXRvci1ib290LW9uOwo+ID4gPiArICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ID4g
PiArICAgICAgICAgICB2aW4tc3VwcGx5ID0gPCZyZWdfZGNfaW4+Owo+ID4gPiArICAgfTsKPiA+
ID4gKwo+ID4gPiAgICAgY2hvc2VuIHsKPiA+ID4gICAgICAgICAgICAgc3Rkb3V0LXBhdGggPSAi
c2VyaWFsMCI7Cj4gPiA+ICAgICB9Owo+ID4gPiBAQCAtOTIsMyArMTExLDMyIEBAICZ1YXJ0MCB7
Cj4gPiA+ICAgICBwaW5jdHJsLTAgPSA8JnVhcnQwXzJfY2ZnPjsKPiA+ID4gICAgIHN0YXR1cyA9
ICJva2F5IjsKPiA+ID4gICB9Owo+ID4gPiArCj4gPiA+ICsmaTJjOCB7Cj4gPiA+ICsgICBwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gPiArICAgcGluY3RybC0wID0gPCZpMmM4X2NmZz47
Cj4gPiA+ICsgICBzdGF0dXMgPSAib2theSI7Cj4gPiA+ICsKPiA+ID4gKyAgIHBtaWNANDEgewo+
ID4gPiArICAgICAgICAgICBjb21wYXRpYmxlID0gInNwYWNlbWl0LHAxIjsKPiA+ID4gKyAgICAg
ICAgICAgcmVnID0gPDB4NDE+Owo+ID4gPiArICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDY0PjsK
PiA+ID4gKyAgICAgICAgICAgdmluLXN1cHBseSA9IDwmcmVnX3ZjY180dj47Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICAgICAgcmVndWxhdG9ycyB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgc2Rf
dm1tYzogYnVjazQgewo+IEknZCBzdWdnZXN0IG5hbWUgaXQgbW9yZSBnZW5lcmljIGFuZCBhZGQg
YSBjb21tZW50IHdoZXJlIGRldmljZSByZWZlcmVuY2UgdG8gaXQsCj4gc2luY2UgYnVjazQgcmVx
dWVzdGVkIGJ5IG1vcmUgdGhhbiBvbmUgZGV2aWNlcywgd2lsbCBtYWtlIHBlb3BsZSBsZXNzIGNv
bmZ1c2VkLgo+IHNvbWV0aGluZyBqdXN0IGxpa2U6Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
YnVjazQ6IGJ1Y2s0IHsKPgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLXJhbXAtZGVsYXkgPSA8NTAwMD47Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgIH07Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICBz
ZF92cW1tYzogYWxkbzEgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxh
dG9yLW1pbi1taWNyb3ZvbHQgPSA8NTAwMDAwPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gPDM0MDAwMDA+Owo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLWJvb3Qtb247Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZWd1bGF0b3ItYWx3YXlzLW9uOwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgIH07Cj4gPiA+ICsgICAgICAgICAgIH07Cj4gPiA+ICsgICB9Owo+ID4gPiArfTsKPiA+
ID4KPiA+Cj4KPiAtLQo+IFlpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
