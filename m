Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49E5C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 11:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJoPrpdiVwgZcJK1zCwzD+NuGOXtCd9XSKT/fYqOjAA=; b=ScEoIqu5+Pv2CL
	ozEUKJv32KdBa/DfG38k/lNyp+Hpb3JcOhUex7HiJ5IoXKfqzmqM/rzxTy1BuEZ6ly9Ce3ChnrD8R
	a6XV6wh+HQm6put1rv7Wl96JDnbspQQWAnthlViw8iRuoNHqazAwBNo7U0xpl2uQbDML/rmS0+6dd
	0+TQlgwsBwLERJ5tQCQXjVAYbtYtOvHTtxm52P4sgunBCnNZ65z/E9m7RXcHZDhyh12EA5Cgi+S82
	Ae680v55SQLHcP8/4msgBIkfKVDRgdDm2FkdhePMB48gJGAKe+XtPTRd02megZaKj/uvsOQSb9ta+
	M6V/N45oPL17AjZChGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFqx-005aIG-9W; Wed, 15 Feb 2023 11:21:35 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFql-005aDf-AP
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 11:21:25 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4EA283F71B
	for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 11:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676460077;
	bh=hwzNkkVHAMig3SgTdNBISffkqWyB+YZfYs1moUFjJBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=A+IZ+CWRwgyejGne7EI3/hIFUYzJnGJjgGeZJ9ut6aoRpODPYfE9TeYN/Z9v84yMa
	 ekKvc2YKG58K1qoA5dJbWCO/qk8O2s52Wesldwfd/SDMQXgdsaOgV3CTo04/Cx6aQ2
	 ubDImuiPnqdIcDseDrs8tNUABxahqPqVJfkjEX+u1AAIuB+fpKFpH3q7CufXWYZpZ7
	 6b/yvxDZevEhJmpbMhV/y2BhJ6l/f/hyEmWwRQ8I/s8/TXjxqIsM8y10y1zek1vS76
	 BiFU1K4tv0OL6HVCRBbvx7xWwAZ1eUqAmITLWLN1IRotyoXvTDfiJdNhW3zLB/Y9Yu
	 lHYamaQpw+81Q==
Received: by mail-qt1-f197.google.com with SMTP id g26-20020ac8481a000000b003bd01832685so370940qtq.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 03:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwzNkkVHAMig3SgTdNBISffkqWyB+YZfYs1moUFjJBQ=;
        b=Br3MkIXnJY5w70n05rJhaMA7amgndRFFW7k1MtdP1Sqd5VKmogoBwNcAmX8fQUr8Vo
         0ApEfusFscEHzVF2cWhbToXuDxeWsOxtW/o0JepdJn2xBsdVBwm2D0rf89Acihta8YCH
         FpOBNy/cVFzFY642qNZ59le24fP689RnYBl6Vu7h+h7JZTzG+JtiwfqW/V6MXzoUwPOZ
         DWq7InroFGiTvZj4SGRE5VwjFXFsD6wQPa9IE4CAXWRd1VgMvxZqiJUSu08eyZaz2lpE
         2fqUfgK8As8nNOGJWdFU+Lp1gb3vyenpQnfv+IuTfv9E084KY4nNDQIXwwPZ1jZV655m
         5uuQ==
X-Gm-Message-State: AO0yUKWvYLJzr8RcVRfY3/u2+RS2lgxrwt/qGYOligbw1BpDhBCyAO0a
	elK2yjBynyB1IOk91lFEsgEC7AO7lUw/QsF/yAzz89J2rOaTvh2Hno/pGSw3roTcNT63FPB+wgL
	q5S/c4s6OPfj/2U2NXpXDYqUQRHKdnf2H0ERMXoGccgrhEvQiBoCotamRzvnYGA==
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id y15-20020a05622a164f00b003bce3a8d1d6mr195949qtj.229.1676460075472;
        Wed, 15 Feb 2023 03:21:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9/NeWH75yJcn/t46NzwvdAG3kpXtrEWKot0xC2tKbCmHsBGrLAxxXzoc7xjxLRcnJ3CgUfTfDnKiYp8juZgUM=
X-Received: by 2002:a05:622a:164f:b0:3bc:e3a8:d1d6 with SMTP id
 y15-20020a05622a164f00b003bce3a8d1d6mr195937qtj.229.1676460075213; Wed, 15
 Feb 2023 03:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-9-cristian.ciocaltea@collabora.com>
 <Y+e+N/aiqCctIp6e@lunn.ch> <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
In-Reply-To: <d1769dac-9e80-2f0d-6a5c-386ef70e1547@collabora.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 15 Feb 2023 12:20:58 +0100
Message-ID: <CAJM55Z8Uq2ZU3KvJZKDLZUJDLEyvHjCRJKcYn5CAOR0c2rhT7Q@mail.gmail.com>
Subject: Re: [PATCH 08/12] net: stmmac: Add glue layer for StarFive JH7100 SoC
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_032123_786468_D0568453 
X-CRM114-Status: GOOD (  24.20  )
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

T24gV2VkLCAxNSBGZWIgMjAyMyBhdCAwMTowOSwgQ3Jpc3RpYW4gQ2lvY2FsdGVhCjxjcmlzdGlh
bi5jaW9jYWx0ZWFAY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4KPiBPbiAyLzExLzIzIDE4OjExLCBB
bmRyZXcgTHVubiB3cm90ZToKPiA+PiArCj4gPj4gKyNkZWZpbmUgSkg3MTAwX1NZU01BSU5fUkVH
SVNURVIyOCAweDcwCj4gPj4gKy8qIFRoZSB2YWx1ZSBiZWxvdyBpcyBub3QgYSB0eXBvLCBqdXN0
IHJlYWxseSBiYWQgbmFtaW5nIGJ5IFN0YXJGaXZlIMKvXF8o44OEKV8vwq8gKi8KPiA+PiArI2Rl
ZmluZSBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5IDB4YzgKPiA+Cj4gPiBTZWVtcyBsaWtlIHRo
ZSBjb21tZW50IHNob3VsZCBiZSBvbmUgbGluZSBlYXJsaWVyPwoKV2VsbCB5ZXMsIHRoZSB2ZXJ5
IGdlbmVyaWMgcmVnaXN0ZXIgbmFtZXMgYXJlIGFsc28gYmFkLCBidXQgdGhpcwpjb21tZW50IHJl
ZmVycyB0byB0aGUgZmFjdCB0aGF0IGl0IGtpbmQgb2YgbWFrZXMgc2Vuc2UgdGhhdCByZWdpc3Rl
cgoyOCBoYXMgdGhlIG9mZnNldAogIDI4ICogNCBieXRlcyBwci4gcmVnaXN0ZXIgPSAweDcwCi4u
YnV0IHRoZW4gcmVnaXN0ZXIgNDkgaXMgb2RkbHkgb3V0IG9mIHBsYWNlIGF0IG9mZnNldCAweGM4
IGluc3RlYWQgb2YKICA0OSAqIDQgYnl0ZXMgcHIuIHJlZ2lzdGVyID0gMHhjNAoKPiA+IFRoZXJl
IGlzIHZhbHVlIGluIGJhc2luZyB0aGUgbmFtZXMgb24gdGhlIGRhdGFzaGVldCwgYnV0IHlvdSBj
b3VsZAo+ID4gYXBwZW5kIHNvbWV0aGluZyBtZWFuaW5nZnVsIG9uIHRoZSBlbmQ6Cj4gPgo+ID4g
I2RlZmluZSBKSDcxMDBfU1lTTUFJTl9SRUdJU1RFUjQ5X0RMWUNIQUlOIDB4YzgKPgo+IFVuZm9y
dHVuYXRlbHkgdGhlIEpINzEwMCBkYXRhc2hlZXQgSSBoYXZlIGFjY2VzcyB0byBkb2Vzbid0IHBy
b3ZpZGUgYW55Cj4gaW5mb3JtYXRpb24gcmVnYXJkaW5nIHRoZSBTWVNDVFJMLU1BSU5TWVMgcmVs
YXRlZCByZWdpc3RlcnMuIE1heWJlIEVtaWwKPiBjb3VsZCBwcm92aWRlIHNvbWUgZGV0YWlscyBo
ZXJlPwoKVGhpcyBpcyByZXZlcnNlIGVuZ2luZWVyZWQgZnJvbSB0aGUgYXV0byBnZW5lcmF0ZWQg
aGVhZGVycyBpbiB0aGVpciB1LWJvb3Q6Cmh0dHBzOi8vZ2l0aHViLmNvbS9zdGFyZml2ZS10ZWNo
L3UtYm9vdC9ibG9iL0pINzEwMF9WaXNpb25GaXZlX2RldmVsL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vYXJjaC1qaDcxMDAvc3lzY29uX3N5c21haW5fY3RybF9tYWNyby5oCgpDaHJpc3RpYW4sIEkn
bSBoYXBweSB0aGF0IHlvdSdyZSB3b3JraW5nIG9uIHRoaXMsIGJ1dCBtZXNzIGxpa2UgdGhpcwph
bmQgd2FpdGluZyBmb3IgdGhlIG5vbi1jb2hlcmVudCBkbWEgdG8gYmUgc29ydGVkIGlzIHdoeSBJ
IGRpZG4ndCBzZW5kCml0IHVwc3RyZWFtIHlldC4KCj4gPj4gKyAgICBpZiAoIW9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5wLCAic3RhcmZpdmUsZ3R4Y2xrLWRseWNoYWluIiwgJmd0eGNsa19kbHljaGFp
bikpIHsKPiA+PiArICAgICAgICAgICAgcmV0ID0gcmVnbWFwX3dyaXRlKHN5c21haW4sIEpINzEw
MF9TWVNNQUlOX1JFR0lTVEVSNDksIGd0eGNsa19kbHljaGFpbik7Cj4gPj4gKyAgICAgICAgICAg
IGlmIChyZXQpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUo
ZGV2LCByZXQsICJlcnJvciBzZWxlY3RpbmcgZ3R4Y2xrIGRlbGF5IGNoYWluXG4iKTsKPiA+PiAr
ICAgIH0KPiA+Cj4gPiBZb3Ugc2hvdWxkIHByb2JhYmx5IGRvY3VtZW50IHRoYXQgaWYgc3RhcmZp
dmUsZ3R4Y2xrLWRseWNoYWluIGlzIG5vdAo+ID4gZm91bmQgaW4gdGhlIERUIGJsb2IsIHRoZSB2
YWx1ZSBmb3IgdGhlIGRlbGF5IGNoYWluIGlzIHVuZGVmaW5lZC4gIEl0Cj4gPiB3b3VsZCBhY3R1
YWxseSBiZSBiZXR0ZXIgdG8gZGVmaW5lIGl0LCBzZXQgaXQgdG8gMCBmb3IgZXhhbXBsZS4gVGhh
dAo+ID4gd2F5LCB5b3Uga25vdyB5b3UgZG9uJ3QgaGF2ZSBhbnkgZGVwZW5kZW5jeSBvbiB0aGUg
Ym9vdGxvYWRlciBmb3IKPiA+IGV4YW1wbGUuCj4KPiBTdXJlLCBJIHdpbGwgc2V0IGl0IHRvIDAu
Cj4KPiA+Cj4gPiAgICAgICBBbmRyZXcKPgo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nLAo+IENyaXN0
aWFuCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
