Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7441C5CFDB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYQMDdEsxnmlDKgpLieSZFNUreZU3JlE67+9w222AR8=; b=ofDJ4Z7jElkK55
	VTBFz1o01+KEwN5+6c83dHNzK4QDZY15aZaq5a1jBVW03KCg2tCIJXbwsL/s89cWgttydcHGXHJVC
	DzSOuYRzEpaaFDckn655UF1Hb5CoCAIdjha3iGNSSf9bviQE1uKT6JZLADCiU0mON24miPQaNq8Ge
	e6XaCwN49f1TMIML6pyAzZ0xJ0awGoVDokCucr0vPbgkz/+DuUWWD/V03y7BWEZgiwiAvohlXsXOq
	M+tnPdA3RYDoHoNGBV8mJ8qJN1B5XinjZcl+UmAPshTz5VIpuJbf1CktNecC1uloX1CtmPUu1Fm61
	B0yXzGOpBufLlb5JVbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurpb-00000002hzc-2w5z;
	Fri, 14 Aug 2026 13:20:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurpZ-00000002hyo-1PB3
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 13:20:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-471eeac43bfso892133f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2026 06:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786713615; cv=none;
        d=google.com; s=arc-20260327;
        b=am7xkdkC0AqRizjuyNA+043bddaIwrZebEsRnO00nSJWhgAPSGsnBloPjmE904jk14
         0thxng9Yv0Cs5KITBDiGvcXctikcE3R9MXfMWkU5wzeIY/jf3SNmZcNEC3xhZwxTdiZY
         EHAY5fOHhSXS9ucaTmXa4PvSPWp42FsE7t7LiNWc+T9Z49KteCQu1l38z6Io3xAmyu4F
         TZJd04C0d+Z+vUlYhmKHzs8O1JfyK3DlmdkeER8mJrZZ2j8GOPPjrML0wI8AI+dR37eh
         Zd3Fpw3OJBQ2lqMycRuhOEEN4YjYxMmLVWUgVSMTtE7ZxKnMTNrZwtqO4PZDupGnnKuN
         43FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rlV/GenIMCvRGvMST2aC8V0PXMEU4NQgNrIVIBM94yE=;
        fh=ZUQjarOZJiFdN4gvQWC0rpPGTjJRteVNFSMmmqULbxM=;
        b=GLv1VJclc41tpMV/BtT7pjgNqwfosyAvnqOBja2VgWkAoan0OxYMqa0G4c/sb+bPTB
         At/Y4oiZphLeOqcVYLLfhq564jxRUoUBnZsj2DtByKpeHAp1t4AirfCixHmD70BtYvw7
         evWqJDwU39y0nZbldKqi54cg3+nvQNjmfBY+bdZV49GKbJmEI8eBHg1AQV3fZa950KMl
         h/KPc0I210ip0NfZoqFFijWEWqB+JXO9lKZnFgH3SHzH3KEG8d0aGow2HpRlb52RtAGi
         N7ot+iAQplb2D9NVYyxB4ZpTNO5SLLXkIlOAtmvbHZFA7hp7w88gy2xFBVADf7+d+9GB
         0ZkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786713615; x=1787318415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlV/GenIMCvRGvMST2aC8V0PXMEU4NQgNrIVIBM94yE=;
        b=TwEmxuOA4dTph94St67IwPToOq63wLWpNHC8Wzix3p7jRpwsuGGY9e/l9Fa3AYCKNV
         HblNqQNhJzozNuNtKvBHxbvcKBhzNG0D3f5RvLpXpAHAPzmSRnVIcvy1aV5KTYFrSta9
         4M9CzLD4cCx5c5auSOYcYE0luO3q4IPjUgrsmJGjm970I+t/Rrz/qK11DXceili7ExnC
         vTA8TtYOekLsiBYBLctxH69EVL4LwH0F/XyoIuALieOF+sVmvEiuYUPcQQZyojvxDhi7
         l+Ga51k1u7U+3oPFjC3sPVqdyHjMyn6bGJyD8acTBInsG4JXyXxDBQc624iDSE2fcOxe
         n6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786713615; x=1787318415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlV/GenIMCvRGvMST2aC8V0PXMEU4NQgNrIVIBM94yE=;
        b=fTbB8Ny6hWlsODZHyHGPWQpb0VQGenWlKBPJA8tzXAktFA5p4/iSscNs1oSKuM1IoD
         qKZp4xxhvyqOhhxG6dsBNcva7swRVws+nikb8KtYAJ2AmbZASksMpqDv2eSdk1ez0SsW
         p/imMpQ/x5JyD6lG1eniqMynAbSQ8FXlUtuP1fvGjaNL2OuSZQPhHQzSXViacqXlq3Zy
         C7LkcASh9ZYT8K+U0Roi9v85WTdaIPdAcBRria+sxjqm/556jpEDx7t/ENYtXYCjaWn+
         zKgGWxtflKmWHgBLfmCwr+GzgG7rY23yEUS9AQt0y6VhWa8Dw20UGNrB1BSExddKeHPM
         Ve8Q==
X-Forwarded-Encrypted: i=1; AHgh+RphPiCBbgXi9RQ9MEccSGu+daRapXeeOYztgECu0nxT7QKD7z74dJ7q2SGuy0WG4zamFqqv6lfVLt1qkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtwaEZnpiRMyKD0Ei5YcZJMyW+6CLgm40JU6NJvtr0LpP5sUci
	3JGeR+faqUYIWo78NK52Fwxv4sQp0DHvSZPZWXLgwKwP6xwiGEOMQ5Vd2RkQiCGDYB2l1ycywgb
	iUnKtGCiispZHWKknj+MZN2I9MtzlfAU=
X-Gm-Gg: AR+sD13qCO0uOrwjBvqeqdMzdRvq2f57r5Rg8GnccqkqP00NvHgW0qw+2AilGk8hDhD
	MwrazUeS63xYWtZ4S40JWihH5LU4BD1nDjsga/aPF9YaEeFTzlHK3uh3TyizWCsF9uzorCdWht2
	ebqGc7zZi+ctHEjdIFw93YXlJMjx/1cm1QtP9+SRvfDFi0duG65XeIGfpeLEPk8bswPuLht3Asm
	WGoVF/NZrdNiy6C0KnLLgppjnOhCFogajIqzhdXekWh7osEmdbJCOJrei4zDnAWrYnGqiH2EOEq
	IXfO9fR9R8VfBGsBXR/XX4QCiAL4upymRgK3slcZjkSooBwo3iAj045Bbg8rzvM045YfHoGoZx9
	D9EMG56epLk79IoJ6MTVqupaR8e+SU+0igA/fuUYlmja61B+hSgQ2GPvhj+oLboK2PKAI3U7/Yw
	==
X-Received: by 2002:a05:6000:610:b0:475:3a97:8e2c with SMTP id
 ffacd0b85a97d-4816077e28amr8481012f8f.16.1786713615046; Fri, 14 Aug 2026
 06:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260814082742.148403-1-xiaofengmian@163.com> <20260814082742.148403-3-xiaofengmian@163.com>
In-Reply-To: <20260814082742.148403-3-xiaofengmian@163.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 14 Aug 2026 14:19:47 +0100
X-Gm-Features: AcwNN1VxOmPk-wnNNRA6RYkQPOgxFzBugec7vz-k3A5aQvb0wTx9OewX4J1vpm8
Message-ID: <CA+V-a8ugp9d8LESGcY1ZrwGbuL084BECERFxc8FmXfvmYmYGFA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] riscv: patch: skip fixmap mapping when kernel text
 is already writable
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
	Klara Modin <klara@kasm.eu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_062017_406616_A1F4CFD3 
X-CRM114-Status: GOOD (  19.62  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgOToyOeKAr0FNIFhpYW9mZW5nIFl1YW4gPHhpYW9mZW5n
bWlhbkAxNjMuY29tPiB3cm90ZToKPgo+IHBhdGNoX21hcCgpIGFsd2F5cyBjcmVhdGVzIGEgdGVt
cG9yYXJ5IHdyaXRhYmxlIG1hcHBpbmcgdmlhIGZpeG1hcCBmb3IKPiBrZXJuZWwgdGV4dCBhZGRy
ZXNzZXMsIGV2ZW4gd2hlbiBDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1ggaXMgZGlzYWJsZWQKPiBh
bmQgdGhlIGtlcm5lbCB0ZXh0IGlzIGFscmVhZHkgbWFwcGVkIHdpdGggX1BBR0VfV1JJVEUuCj4K
PiBUaGlzIGlzIHVubmVjZXNzYXJ5IG92ZXJoZWFkIGF0IGJlc3QsIGFuZCBvbiBtaW5pbWFsIGNv
bmZpZ3VyYXRpb25zCj4gaXQgY2FuIGNhdXNlIHBhZ2UgZmF1bHRzLgo+Cj4gU2tpcCB0aGUgZml4
bWFwIHBhdGggZm9yIGtlcm5lbCB0ZXh0IHdoZW4gQ09ORklHX1NUUklDVF9LRVJORUxfUldYCj4g
aXMgbm90IGVuYWJsZWQsIHNpbmNlIHRoZSB0ZXh0IHBhZ2VzIGFyZSBhbHJlYWR5IHdyaXRhYmxl
IGluIHRoYXQgY2FzZS4KPiBUaGUgbW9kdWxlIHRleHQgcGF0aCBpcyBhbHJlYWR5IGdhdGVkIG9u
IENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWCBhbmQKPiBpcyBrZXB0IHVuY2hhbmdlZC4KPgo+IFJl
cG9ydGVkLWJ5OiBLbGFyYSBNb2RpbiA8a2xhcmFAa2FzbS5ldT4KPiBDbG9zZXM6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC9hbnRfOFRhQmJvdl9HUzRpQHNvZGEuaW50Lmthc20uZXUvCj4g
UmVwb3J0ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPgo+
IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBK1YtYTh0UUs4cmloOVNHR1R5
cXJFQkdwTmt4NEgwZVgyWWNjQ1JyZ2tWQVByK0VCZ0BtYWlsLmdtYWlsLmNvbS8KPiAtLS0KPiB2
NTogZml4IHRoZSBmaXhtYXAgZ2F0aW5nIGZvciBrZXJuZWwgdGV4dC4gVGhlIHY0IGVhcmx5IHJl
dHVybiBvbgo+ICAgICBDT05GSUdfU1RSSUNUX01PRFVMRV9SV1ggd3JvbmdseSBza2lwcGVkIHRo
ZSBmaXhtYXAgZm9yIGtlcm5lbCB0ZXh0Cj4gICAgIHRvbywgd2hpY2ggcGFuaWNzIG9uIGNvbmZp
Z3Mgd2l0aCBDT05GSUdfTU9EVUxFUz1uIHdoZXJlCj4gICAgIENPTkZJR19TVFJJQ1RfTU9EVUxF
X1JXWCBpcyB1bmF2YWlsYWJsZSBidXQgQ09ORklHX1NUUklDVF9LRVJORUxfUldYCj4gICAgIGlz
IHN0aWxsIGVuYWJsZWQgYW5kIGtlcm5lbCB0ZXh0IGlzIHJlYWQtb25seS4KPiB2MzogZWFybHkg
cmV0dXJuIHdoZW4gIUNPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWCAocGVyIE5hbSBDYW8ncyBzdWdn
ZXN0aW9uKQo+IHYyOiBhZGQgY29tbWl0IGRlc2NyaXB0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBY
aWFvZmVuZyBZdWFuIDx4aWFvZmVuZ21pYW5AMTYzLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvcGF0Y2guYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+
ClRlc3RlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gaW5kZXggMTZiMjQz
Mzc2Zi4uMjIzOWMyODk4MSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+IEBAIC00NSw2ICs0NSw4IEBAIHN0
YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCAqcGF0Y2hfbWFwKHZvaWQgKmFkZHIsIGNvbnN0IHVu
c2lnbmVkIGludCBmaXhtYXApCj4gICAgICAgICBwaHlzX2FkZHJfdCBwaHlzOwo+Cj4gICAgICAg
ICBpZiAoY29yZV9rZXJuZWxfdGV4dCh1aW50YWRkcikgfHwgaXNfa2VybmVsX2V4aXR0ZXh0KHVp
bnRhZGRyKSkgewo+ICsgICAgICAgICAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1NUUklD
VF9LRVJORUxfUldYKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gYWRkcjsKPiAg
ICAgICAgICAgICAgICAgcGh5cyA9IF9fcGFfc3ltYm9sKGFkZHIpOwo+ICAgICAgICAgfSBlbHNl
IGlmIChJU19FTkFCTEVEKENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWCkpIHsKPiAgICAgICAgICAg
ICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSB2bWFsbG9jX3RvX3BhZ2UoYWRkcik7Cj4gLS0KPiAy
LjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
