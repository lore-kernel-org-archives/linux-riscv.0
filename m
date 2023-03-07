Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD519C678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 12:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCmih5t24ar8FjNiR2xZ7MvRXlfdDlEFyjPA9Qz4Bbc=; b=bxcYxIKqZbzFSi
	gScI6AiouH0aC+O2+tkOnAk7uVrpktXZjCEmkaBhKXp4cBeR/5gKuDzDngLMDVU9tqEQrLzLah2k8
	V/aKvjDjYFYVrxvsuk4PPQultFI5lM5esiwnyEbtHd23fg2ic92hWADY54VJzn41pVYm5Kauu4lot
	4zZY7N+VulYs0TAB9Lixb562uUEB/R6uBMn0SaaBP+f8UBhAYMl/YNOmPqwgC22wraPhtxrgFAjMF
	Z9MKFWQpQJ01K/FSS4iynNV4QKxI7yxwTWivp0KrFOedqidDzqXRuSlTd6ZChTFqF8NJDeDtIwKjv
	HQ1XRWx7O7DvA9yC/xoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWd7-0008Hu-J7; Tue, 07 Mar 2023 12:41:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWd2-0008Gp-6D
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 12:41:19 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5CF4E3FDDE
	for <linux-riscv@lists.infradead.org>; Tue,  7 Mar 2023 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1678192874;
	bh=5dcTMuGM5x4jDH9Im/Ajb398saoasYhP635I/igmqgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=v2cqN46i9petUMuigMupNOqBkrHmWpHYjx2G/VUo+hTUjY1MaXsuExKaahSKcwXAb
	 orL08nSz9TQRX9ZHwp/kbx4F3dgx1ugY+UZTyFK2CdZ/j1g6ed4yurMpAmJ/86zrWw
	 4ZP/JwzM2ZTa9JZZeJkglR4IrskpU8+Im03uutuHn7iyif9WtX99NdEtdxZLbUxOSD
	 uCXrkxG8zXIY5rnOJ80vry2dTmPpsxmg3S27BK4HE2lp5XHiG106m+9wKn+tDhwCmf
	 Q0SZXv1if8PQOmfVsil6sOphyhJXYOwTxL0H0Yez7jla62VXbAUfUtOB8SfbxnWvEV
	 1Svf6SzWe3KtA==
Received: by mail-qv1-f72.google.com with SMTP id x10-20020ad440ca000000b005800220da38so6196028qvp.14
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 04:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dcTMuGM5x4jDH9Im/Ajb398saoasYhP635I/igmqgk=;
        b=dQbizR/U46cIUlukln/f72NfKDYYX1yhpMif8pEu+VZ4u7jOj7G8WUa0JlR94EnCrh
         rMjRsO6i9oOloDQ7e97dXmYlXGzgH+ZA0o7jzPj06c+S57Q90A2QjZskdTm8hJ6Lx+kn
         JgzpnxQupOEo03jkQfDkvs10rNAJVfZcq+ajurUyFUHxX0Cbc+uaS7KHpLSXXt/e8Rvq
         ibZciNwF0f7/VnIl/7CV3+C7v93iDYQw/p0lqRVoNR53pQvoki13HIQXjbdEdOQTIGeA
         8O3FM3bBdIGkAKwQ/eWBWrFxSgz2kHdRHbRwbzANQzrBuBt+95fygc5BEFNB2jEH4QiA
         7w0A==
X-Gm-Message-State: AO0yUKUPv8t8KWpmAD/r0aMpNz+bWj/KN5X5Sr6JhpBbwjdW7tX6vgxi
	cf/KMsUjJEMl8OZbYNMma8+F5ueVqFfuXJ2EMZLNGK0moNwyGx35XAPSPQlDQWoZGTJ72umXDWH
	2tXMxCZBDv7coTRolE328a3jCNNQq3biQC+4WFElohXth1sKxWNlnty3DdQBcjg==
X-Received: by 2002:aed:27db:0:b0:3bf:da0f:ed90 with SMTP id m27-20020aed27db000000b003bfda0fed90mr3748953qtg.3.1678192873239;
        Tue, 07 Mar 2023 04:41:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8chedSpyZZZaRafGT1LOeApVeMpQZ0D8sGlhCw7bUyERGfB8dVAwY0F0nD/btENIxFCgHxqoI2YFpwPG379FA=
X-Received: by 2002:aed:27db:0:b0:3bf:da0f:ed90 with SMTP id
 m27-20020aed27db000000b003bfda0fed90mr3748935qtg.3.1678192872885; Tue, 07 Mar
 2023 04:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-12-samin.guo@starfivetech.com> <CAJM55Z_8m42vfoPDicTP18S6Z1ZXYbFeS1edTjzYVB3Kq2xFeQ@mail.gmail.com>
 <8bd8654e-4bba-c718-4b17-5291e70f05fe@starfivetech.com>
In-Reply-To: <8bd8654e-4bba-c718-4b17-5291e70f05fe@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 7 Mar 2023 13:40:56 +0100
Message-ID: <CAJM55Z8-65ENJHfSUOTd+FSNx2b-mYF1L64CKT+Gez2jK3Qr2Q@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] riscv: dts: starfive: visionfive-2-v1.2a: Add
 gmac+phy's delay configuration
To: Guo Samin <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_044116_583290_AE422783 
X-CRM114-Status: GOOD (  27.33  )
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

T24gVHVlLCA3IE1hciAyMDIzIGF0IDAyOjQzLCBHdW8gU2FtaW4gPHNhbWluLmd1b0BzdGFyZml2
ZXRlY2guY29tPiB3cm90ZToKPiDlnKggMjAyMy8zLzYgMjE6MDA6MTksIEVtaWwgUmVubmVyIEJl
cnRoaW5nIOWGmemBkzoKPiA+IE9uIEZyaSwgMyBNYXIgMjAyMyBhdCAxMDowMSwgU2FtaW4gR3Vv
IDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4gPj4gdjEuMkEgZ21hYzAgdXNl
cyBtb3RvcmNvbW0gWVQ4NTMxKHJnbWlpLWlkKSBQSFksIGFuZCBuZWVkcyBkZWxheQo+ID4+IGNv
bmZpZ3VyYXRpb25zLgo+ID4+Cj4gPj4gdjEuMkEgZ21hYzEgdXNlcyBtb3RvcmNvbW0gWVQ4NTEy
KHJtaWkpIFBIWSwgYW5kIG5lZWRzIHRvCj4gPj4gc3dpdGNoIHJ4IGFuZCByeCB0byBleHRlcm5h
bCBjbG9jayBzb3VyY2VzLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogU2FtaW4gR3VvIDxzYW1p
bi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4KPiA+PiAtLS0KPiA+PiAgLi4uL3N0YXJmaXZlL2poNzEx
MC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEuMmEuZHRzIHwgMTMgKysrKysrKysrKysrKwo+ID4+
ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUt
Mi12MS4yYS5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2
ZS12aXNpb25maXZlLTItdjEuMmEuZHRzCj4gPj4gaW5kZXggNGFmMzMwMGYzY2YzLi4yMDVhMTNk
OGM4YjEgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcx
MTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjJhLmR0cwo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi12MS4yYS5kdHMK
PiA+PiBAQCAtMTEsMyArMTEsMTYgQEAKPiA+PiAgICAgICAgIG1vZGVsID0gIlN0YXJGaXZlIFZp
c2lvbkZpdmUgMiB2MS4yQSI7Cj4gPj4gICAgICAgICBjb21wYXRpYmxlID0gInN0YXJmaXZlLHZp
c2lvbmZpdmUtMi12MS4yYSIsICJzdGFyZml2ZSxqaDcxMTAiOwo+ID4+ICB9Owo+ID4+ICsKPiA+
PiArJmdtYWMxIHsKPiA+PiArICAgICAgIHBoeS1tb2RlID0gInJtaWkiOwo+ID4+ICsgICAgICAg
YXNzaWduZWQtY2xvY2tzID0gPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19HTUFDMV9UWD4sCj4gPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICA8JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX0dNQUMxX1JY
PjsKPiA+PiArICAgICAgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnN5c2NyZyBKSDcxMTBf
U1lTQ0xLX0dNQUMxX1JNSUlfUlRYPiwKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8JnN5c2NyZyBKSDcxMTBfU1lTQ0xLX0dNQUMxX1JNSUlfUlRYPjsKPiA+PiArfTsKPiA+
PiArCj4gPj4gKyZwaHkwIHsKPiA+PiArICAgICAgIHJ4LWludGVybmFsLWRlbGF5LXBzID0gPDE5
MDA+Owo+ID4+ICsgICAgICAgdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8MTM1MD47Cj4gPj4gK307
Cj4gPgo+ID4gSGVyZSB5b3UncmUgbm90IHNwZWNpZnlpbmcgdGhlIGludGVybmFsIGRlbGF5cyBm
b3IgcGh5MSB3aGljaCBtZWFucyBpdAo+ID4gZGVmYXVsdHMgdG8gMTk1MHBzIGZvciBib3RoIHJ4
IGFuZCB0eC4gSXMgdGhhdCByaWdodCBvciBkaWQgeW91IG1lYW4KPiA+IHRvIHNldCB0aGVtIHRv
IDAgbGlrZSB0aGUgdjEuM2IgcGh5MT8KPgo+IEhpLCBlbWlsLCB1c3VhbGx5LCBvbmx5IDEwMDBN
IChyZ21paSkgbmVlZHMgdG8gY29uZmlndXJlIHRoZSBkZWxheSwgYW5kIDEwME0ocm1paSkgZG9l
cyBub3QuCgpBaCwgSSBzZWUuCgo+ID4gQWxzbyB5b3VyIHUtYm9vdCBzZWVtcyB0byBzZXQgd2hh
dCB0aGUgbGludXggcGh5IGRyaXZlciBjYWxscwo+ID4gbW90b3Jjb21tLGtlZXAtcGxsLWVuYWJs
ZWQgYW5kIG1vdG9yY29tbSxhdXRvLXNsZWVwLWRpc2FibGVkIGZvciBhbGwKPiA+IHRoZSBwaHlz
LiBEaWQgeW91IGxlYXZlIHRob3NlIG91dCBvbiBwdXJwb3NlPwo+Cj4gSGksIEVtaWwsIFdlIGRp
ZCBjb25maWd1cmUgbW90b3Jjb21tLGF1dG8tc2xlZXAtZGlzYWJsZWQgZm9yIHl0ODUxMiBpbiB1
Ym9vdCwKPiBidXQgWXV0YWkgdXBzdHJlYW0ncyBMaW51eCBkcml2ZXIgb25seSB5dDg1MjEveXQ4
NTMxIHN1cHBvcnRzIHRoaXMgcHJvcGVydHkuCgpJJ20gY29uZnVzZWQuIElzIFl1dGFpIGFsc28g
RnJhbmsgU2FlPyBCZWNhdXNlIGhlIGlzIHRoZSBvbmUgd2hvIGFkZGVkCnN1cHBvcnQgZm9yIHRo
ZSB5dDg1MzEgdXBzdHJlYW0uCgo+IFl0ODUxMiBpcyBhIEdlbmVyaWMgUEhZIGRyaXZlciBhbmQg
ZG9lcyBub3Qgc3VwcG9ydCB0aGUgY29uZmlndXJhdGlvbiBvZgo+IG1vdG9yY29tbSxhdXRvLXNs
ZWVwLWRpc2FibGVkIGFuZCBtb3RvcmNvbW0sa2VlcC1wbGwtZW5hYmxlZC4KClJpZ2h0IHBoeTEg
b2YgdGhlIDEuMmEgbWlnaHQgdXNlIGEgZGlmZmVyZW50IHBoeSwgYnV0IEknbSBhbHNvIHRhbGtp
bmcKYWJvdXQgcGh5MCBhbmQgdGhlIHYxLjNiIHdoaWNoIGRvZXMgdXNlIHRoZSB5dDg1MzEgcmln
aHQ/Cgo+IEFuZCB3aXRob3V0IGNvbmZpZ3VyaW5nIHRoZXNlIHR3byBhdHRyaWJ1dGVzLCB2ZjIt
MS4yYSBnbWFjMSBhbHNvIHdvcmtzIG5vcm1hbGx5LgoKWWVzLCBidXQgd2hhdCBJJ20gd29ycmll
ZCBhYm91dCBpcyB0aGF0IGl0IG9ubHkgd29ya3MgYmVjYXVzZSB1LWJvb3QKaW5pdGlhbGlzZXMg
dGhlIFBIWXMgYW5kIGV0aGVybmV0IG1heSBzdG9wIHdvcmtpbmcgaWYgeW91J3JlIHVzaW5nIGEK
ZGlmZmVyZW50IGJvb3Rsb2FkZXIgb3IgTGludXggZ2FpbnMgc3VwcG9ydCBmb3IgcmVzZXR0aW5n
IHRoZSBQSFlzCmJlZm9yZSB1c2UuCgo+Cj4gQmVzdCByZWdhcmRzLAo+IFNhbWluCj4gPgo+ID4+
IC0tCj4gPj4gMi4xNy4xCj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gPj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPgo+IC0tCj4gQmVzdCByZWdhcmRz
LAo+IFNhbWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
