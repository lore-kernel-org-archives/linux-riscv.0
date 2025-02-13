Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E78C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/cpuHQ4nFOYQG4NfEw3VopwsYIKD52ljge14VSd4AXg=; b=uHWYLj4mbGK0fU
	Ioi8aBnVKNQ/DN9K10sZqbnrd0/knc8H1W3e8WEpTe204yfU3DawyMR+dXj0oIFNvCTPepVba7ngX
	RSKvLxj7Dq2n9efrfDznGIod31oxhxafRMxT2CdxemdfI+FlJVLC3izvB93vBbsIo6jJ2wp8Vs7VK
	/3gtVn8ypLLKVa3vVj5Xl+j/9wM4lsikcUd53KhBxjUodThELJ86FpDqtx6EAd8kuMhkOAbSfPFac
	xm0hqOmsfOOWSoX78tC1RX57inVEdzmF2c+76qqmuUxnF8WYHhRAqk8fLg1hxwDgKc6nMcvwO45dP
	y0SAEC5GLVWnpux+GJJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZAK-0000000B8Vq-1JBU;
	Thu, 13 Feb 2025 13:22:04 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYwT-0000000B6DO-2KFG
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 13:07:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-54504bf07cdso824608e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 05:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739452064; x=1740056864; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1m322IQyc9zOVSGsdHSNz551pCCbcY6hEwhI/Tt92E=;
        b=A9drX9fqQfC8XMDFpRjvInv8p0rN95uHGn2F0qo+1/T080DsxivN28V9UFpOwBwNa1
         w7WRMXTWOKltKt6uuBUvBshCsDGrdrBZOJYb+vtUU88+IrjqItC9YqRUyTT3KDXk7Vno
         WKaMxXG6Ck3nDTFB+WIRrP947Vo4jtERGXbFkxRyvXbYSn+jIjBfDZ4xhO2pObmJx97x
         N2P3rJfN+nG6IqiBkB30tyviwSv6Z0yIxNXYB2vBB8eVgRnA4cxrXuLd91y1iFZ7eN1t
         Nt8kADl3BAshuEpfyc08/eA2wMNqSH5YqF01GCrWDU9A0d5Winf1ENihuMHNoZi3nspj
         uonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739452064; x=1740056864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1m322IQyc9zOVSGsdHSNz551pCCbcY6hEwhI/Tt92E=;
        b=QhqedaXLeoNVE0E01YxjuluNwTpqi0rSVELu3vRJGEbCTLF8rV61RgZ8MffAnbSLzG
         g4phUzJ/IMmAJGhuQ5pmESkxsqiaWAYSSDPbZi7GOPzlkgdvCXR4oge5CONZBPLD6NXg
         QoZJYeAma7HjANsWpMt434seHcxPS9dqTmn3Ouv2nmvRqrA6b0wpayU8zqE2pqrLdhIo
         airUQ/fbzBwuz/RgOV1a9drlfbvuNPRe2ZZb+nDf+AVxgDbcxzhsspxTEU4p+5cnpGjo
         ZouyzGoVIK81LAtUxpDI2BcluzPr2OtisWeUXUdBFwWX5nSxE4bpeO7kLACGK0m+qKgO
         Y1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUmsxQ3PAm796292nmGhUObM3DkezimuGqOLA+F52t9TH60t19wTtaDza46J7MHwdzayaFvrFNFm6cTlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxib5rRa/phNl3Cwp7d3FoGva4gvVgf0JiZ1FK17d/yW65qv3b9
	O/wXs3+HE5063bS+UxYIPklzHuoBIa0UC3hEVVXqcrUjVFkzGL0BFJiYkOMvQhFgroPr0HHUR4v
	QCwrz75fCExgIqqqUlJq/jYIdgAlx/pdtckZDVw==
X-Gm-Gg: ASbGncsXrinncpBy2//So7LHRgpRhD2BK499oLYROGafCnMu9CSducuIHmomVYrni9p
	7MXJK3kgqyNpi6R05xZ2PUJTYG7v2judDzV/QkCyu1fTUmr8IPKFRxNF1v2XMWyoNBD5Bd13R
X-Google-Smtp-Source: AGHT+IGrhM736BFyGMpNf2ItBB+pdpJ4SiPwkgfbkvqCPSO0yrPV4uYNd3wllzeAV1mMnQTwQL7ndpAU15y6EgrFAw0=
X-Received: by 2002:a05:6512:2215:b0:540:2da2:f282 with SMTP id
 2adb3069b0e04-5451818959bmr1878297e87.42.1739452063461; Thu, 13 Feb 2025
 05:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-1-4641c95c0194@gentoo.org> <Z5FPJLzAEVXGWJnE@chonkvm.lixom.net>
 <20250123113042-GYA38135@gentoo> <Z5LOdh-4UxRtteOy@chonkvm.lixom.net>
 <20250127181726.GA538260-robh@kernel.org> <20250128031712-GYB47737@gentoo>
 <CACRpkdYbSOHD9UH5=+qjztxS3Cq_rxaoOT9tFtD8ZWm9zQGnPw@mail.gmail.com>
 <CACRpkdZa887vx4Lmxk1U_8w5n7AxMnyzGexeYzhsxNGT-DTYcQ@mail.gmail.com> <20250206133156-GYA5687@gentoo>
In-Reply-To: <20250206133156-GYA5687@gentoo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 14:07:31 +0100
X-Gm-Features: AWEUYZl5mIboPZ2_OX7ZzkKCHtZOEl9dcGB_tfGDF4p9QujG1OrkLL1Y1iNKYJ0
Message-ID: <CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_050745_606118_02849094 
X-CRM114-Status: GOOD (  31.72  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Olof Johansson <olof@lixom.net>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBGZWIgNiwgMjAyNSBhdCAyOjMy4oCvUE0gWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5v
cmc+IHdyb3RlOgoKPiA+ID4gZm9vLWdwaW9zIDwmZ3BpbyAyIDcgR1BJT19BQ1RJVkVfTE9XPjsK
Pgo+IGlmIHdlIG1vZGVsIHRoZSBkdHMgYXMgYWJvdmUsIHRoZW4gIiZncGlvIiB3aWxsIHJlZ2lz
dGVyIGl0c2VsZiBhcyBvbmUgc29sZSAic3RydWN0IGdwaW9fY2hpcCIsCj4gIHdoaWNoIG1lYW4g
b25lIGdwaW8gY2hpcCBjb21iaW5lIHRocmVlIGJhbmtzLi4KCk5vdCByZWFsbHk6IHRoZSBmYWN0
IHRoYXQgdGhlcmUgaXMganVzdCBvbmUgZ3BpbyBub2RlIGluIHRoZSBkZXZpY2UKdHJlZSBkb2Vz
IG5vdAptZWFuIHRoYXQgaXQgbmVlZHMgdG8gY29ycmVzcG9uZCB0byBvbmUgc2luZ2xlIGdwaW9f
Y2hpcCBpbnN0YW5jZSBpbnNpZGUgdGhlCkxpbnV4IGtlcm5lbC4KCkl0J3MganVzdCB3aGF0IHRo
ZSBjdXJyZW50IGV4aXN0aW5nIGJpbmRpbmdzIGFuZCB0aGUgY29kZSBpbiB0aGUgR1BJTyBzdWJz
eXN0ZW0KYXNzdW1lcy4gSXQgZG9lcyBub3QgaGF2ZSB0byBhc3N1bWUgdGhhdDogd2UgY2FuIGNo
YW5nZSBpdC4KCkknbSBzb3JyeSBpZiB0aGlzIGlzIG5vdCBlbnRpcmVseSBpbnR1aXRpdmUgOigK
Ck9uZSBub2RlIGNhbiB2ZXJ5IHdlbGwgc3Bhd24gdGhyZWUgZ3Bpb19jaGlwIGluc3RhbmNlcywg
YnV0IGl0IHJlcXVpcmVzCnNvbWUgY29yZSBjaGFuZ2VzLiBCdXQgSSB0aGluayBpdCdzIHRoZSBt
b3N0IGVsZWdhbnQuCgo+IGlmIHRha2luZyAib25lIGdwaW8gY2hpcCBzdXBwb3J0IG11bHRpIGJh
bmtzIiBkaXJlY3Rpb24sIHRoZW4gaXQgd2lsbCBiZSByZXZlcnRlZCBiYWNrIGFzIHBhdGNoIFYx
LAo+IHRoZW4sIGV2ZW4gdGhlIHRocmVlIGdwaW8tY2VsbHMgbW9kZWwgaXMgdW5uZWNlc3Nhcnkg
bmVlZGVkLCBhcyB3ZSBjYW4gbWFwIGdwaW8gbnVtYmVyCj4gIHRvIHRoZSA8YmFuaywgb2Zmc2V0
PiBhcnJheSBpbiB0aGUgdW5kZXJseWluZyBncGlvIGRyaXZlcgo+Cj4gdGhlIHY0IHBhdGNoIGlz
IHZlcnkgc2ltaWxhciB0byBkcml2ZXJzL2dwaW8vZ3Bpby1kd2FwYi5jCj4KPiBJZiBoYWQgdG8g
Y2hvb3NlIHRoZSBkaXJlY3Rpb24gYmV0d2VlbiB2MSBhbmQgdjQsIEkgcGVyc29uYWxseSB3b3Vs
ZCBmYXZvciB0aGUgbGF0dGVyLAo+ICBhcyBmcm9tIGh3IHBlcnNwZWN0aXZlLCBlYWNoIGdwaW8g
YmFuayBpcyBxdWl0ZSBpbmRlcGVkZW50IC0gaGFzIGl0cyBvd24gaW8vaXJxIHJlZ2lzdGVycywK
PiAgbWVyZWx5IGhhcyBpbnRlcmxlYXZlZCBpbyBtZW1vcnkgc3BhY2UsIG9uZSBzaGFyZWQgSVJR
IGxpbmUuLiBhbHNvIHRoZSBwYXRjaCB2NCBsZXZlcmFnZQo+ICBsb3RzIHVuZGVybHlpbmcgZ2Vu
ZXJpYyBncGlvIEFQSXMsIHJlc3VsdCBpbiBtdWNoIHNpbXBsaWZpZWQvY2xlYW4gY29kZSBiYXNl
Li4KClNvIHdoYXQgSSB3b3VsZCBzdWdnZXN0IGlzIGEgY29tYmluYXRpb24gb2YgdGhlIHR3by4K
Ck9uZSBncGlvIG5vZGUgaW4gdGhlIGRldmljZSB0cmVlLCBsaWtlIHRoZSBEVCBtYWludGFpbmVy
cyB3YW50IGl0LgoKVGhyZWUgc3RydWN0IGdwaW9fY2hpcCBpbnN0YW5jZXMgaW5zaWRlIHRoZSBk
cml2ZXIsIGFsbCB0aHJlZSBzcGF3biBmcm9tCnRoYXQgc2luZ2xlIGdwaW8gZGV2aWNlLCBhbmQg
ZnJvbSB0aGF0IHNpbmdsZSBwbGF0Zm9ybV9kZXZpY2UuCgpXaGF0IHdlIGFyZSBzdWdnZXN0aW5n
IGlzIGEgdGhyZWUtY2VsbCBwaGFuZGxlIGluIHRoZSBkZXZpY2UgdHJlZToKCmZvby1ncGlvcyA9
IDwmZ3BpbyAwIDcgR1BJT19BQ1RJVkVfSElHSD47CmJhci1ncGlvcyA9IDwmZ3BpbyAyIDMxIEdQ
SU9fQUNUSVZFX0hJR0g+OwoKTm90aWNlIHRoZSBuZXcgZmlyc3QgY2VsbCB3aGljaCBpcyAwIG9y
IDIuCgpUaGUgZmlyc3Qgb25lIGlzIHdoYXQgd2FzIHByZXZpb3VzbHkgY2FsbGVkIGdwaW8gNy4K
VGhlIHNlY29uZCBvbmUgaXMgd2hhdCB3YXMgMiozMiszMSA9IGdwaW8gOTUuCgpTbyBpbnRlcm5h
bGx5IGluIHRoZSBkcml2ZXIgaXQgaXMgZWFzeSB0byB1c2UgdGhlIGZpcnN0IGNlbGwgKDAgb3Ig
MikgdG8gbWFwIHRvCnRoZSByaWdodCBzdHJ1Y3QgZ3Bpb19jaGlwIGlmIHlvdSBoYXZlIGl0IGlu
IHlvdXIgZHJpdmVyIHNvbWV0aGluZyBsaWtlIHRoaXM6CgpzdHJ1Y3Qgc3BhY2VtaXRfZ3BpbyB7
CiAgICBzdHJ1Y3QgZ3Bpb19jaGlwIGdjc1szXTsKLi4uCn07CgpzdHJ1Y3Qgc3BhY2VtaXRfZ3Bp
byAqc2c7CnN0cnVjdCBncGlvX2NoaXAgKmdjOwppbnQgcmV0OwoKZm9yIChpID0gMDsgaSsrOyBp
IDwgMykgewogICAgIHJldCA9IGRldm1fZ3Bpb2NoaXBfYWRkX2RhdGEoZGV2LCAmc2ctPmdjc1tp
XSwgc2cpOwogICAgIGlmIChyZXQpCiAgICAgICAgcmV0dXJuIHJldDsKICAgICBnYyA9IHNnLT5n
Y3NbaV07CiAgICAgLi4uLiBkbyBzdHVmZiB3aXRoIHRoaXMgaW5zdGFuY2UgLi4uLgp9CgpDYWxs
YmFja3MgZXRjIHNob3VsZCB3b3JrIGFzIGJlZm9yZS4KClRoZW4gdGhlc2UgcGhhbmRsZXMgbmVl
ZHMgdG8gYmUgcHJvcGVybHkgdHJhbnNsYXRlZCwgd2hpY2ggaXMgZG9uZSB3aXRoIHRoZQpzdHJ1
Y3QgZ3Bpb19jaGlwIC5vZl94bGF0ZSgpIGNhbGxiYWNrLiAoSWYgeW91IGxvb2sgaW5zaWRlIGdw
aW9saWItb2YuYwp5b3Ugd2lsbCBzZWUgdGhhdCBjaGlwLT5vZl94bGF0ZSgpIGlzIGNhbGxlZCB0
byBtYXAgdGhlIHBoYW5kbGUgY2VsbHMKdG8gYSBjZXJ0YWluIEdQSU8gbGluZSkuCgpJbiBtb3N0
IGNhc2VzLCBkcml2ZXJzIGRvIG5vdCBhc3NpZ24gdGhlIGNoaXAtPm9mX3hsYXRlIGNhbGxiYWNr
CihvbmUgZXhjZXB0aW9uIGlzIGdwaW8tcHhhLmMpIGFuZCB0aGVuIGl0IGlzIGRlZmF1bHQtYXNz
aWduZWQgdG8Kb2ZfZ3Bpb19zaW1wbGVfeGxhdGUoKSB3aGljaCB5b3UgY2FuIGZpbmQgaW4gZ3Bp
b2xpYi1vZi5jIGFzIHdlbGwuCgpZb3UgbmVlZCB0byBjb3B5IHRoaXMgY2FsbGJhY2sgdG8geW91
ciBkcml2ZXIgYW5kIGF1Z21lbnQgaXQKcHJvcGVybHkuCgpUaGUgeGxhdGUgY2FsbGJhY2sgaXMg
dXNlZCB0byBsb2NhdGUgdGhlIHN0cnVjdCBncGlvX2NoaXAgYW5kCnN0cnVjdCBncGlvX2Rldmlj
ZSBhcyB3ZWxsLCBieSBqdXN0IGNhbGxpbmcgdGhlIHhsYXRlIGNhbGxiYWNrLCBzbyBpZgp5b3Ug
Y29kZSB1cCB0aGUgcmlnaHQgeGxhdGUgY2FsbGJhY2ssIGV2ZXJ5dGhpbmcgc2hvdWxkIGp1c3QK
d29yayBieSBpdHNlbGYuCgp0aGlzIGlzIGEgZ3Vlc3Mgb24gd2hhdCBpdCB3b3VsZCBsb29rIGxp
a2UgKGp1c3QgZHJ5IGNvZGluZywKYnV0IGhvcGVmdWxseSB0aGUgaWRlYSB3b3JrcyEpOgoKc3Rh
dGljIGludCBzcGFjZW1pdF9ncGlvX3hsYXRlKHN0cnVjdCBncGlvX2NoaXAgKmdjLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmdw
aW9zcGVjLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiAqZmxhZ3MpCnsKICAg
ICAgICBzdHJ1Y3Qgc3BhY2VtaXRfZ3BpbyAqc2cgPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7CiAg
ICAgICAgaW50IGk7CgogICAgICAgIGlmIChnYy0+b2ZfZ3Bpb19uX2NlbGxzICE9IDMpCiAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKCiAgICAgICAgaWYgKGdwaW9zcGVjLT5hcmdzX2Nv
dW50IDwgZ2MtPm9mX2dwaW9fbl9jZWxscykKICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
OwoKICAgICAgICAvKiBXZSBzdXBwb3J0IG1heGltdW0gMyBncGlvX2NoaXAgaW5zdGFuY2VzICov
CiAgICAgICAgaSA9IGdwaW9zcGVjLT5hcmdzWzBdOwogICAgICAgIGlmIChpID49IDMpCiAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKCiAgICAgICAgLyogT0sgaXMgdGhpcyB0aGUgcmln
aHQgZ3Bpb19jaGlwIG91dCBvZiB0aGUgdGhyZWUgPyAqLwogICAgICAgIGlmIChnYyAhPSBzZy0+
Z2NzW2ldKQogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgogICAgICAgIC8qIEFyZSB3
ZSBpbiByYW5nZSBmb3IgdGhpcyBHUElPIGNoaXAgKi8KICAgICAgICBpZiAoZ3Bpb3NwZWMtPmFy
Z3NbMV0gPj0gZ2MtPm5ncGlvKQogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgogICAg
ICAgIGlmIChmbGFncykKICAgICAgICAgICAgICAgICpmbGFncyA9IGdwaW9zcGVjLT5hcmdzWzJd
OwoKICAgICAgICAvKiBSZXR1cm4gdGhlIGh3IGluZGV4ICovCiAgICAgICAgcmV0dXJuIGdwaW9z
cGVjLT5hcmdzWzFdOwp9CgouLi4KZ2MtPm9mX2dwaW9fbl9jZWxscyA9IDM7CmdjLT5vZl94bGF0
ZSA9IHNwYWNlbWl0X2dwaW9feGxhdGU7CgpJZiBpdCB3b3JrcyBhcyBJIGhvcGUsIHRoaXMgd2ls
bCBtYWtlIHRoZSBjb2RlIGluIGdwaW9saWItb2YuYyBpbgpvZl9maW5kX2dwaW9fZGV2aWNlX2J5
X3hsYXRlKCkgY2FsbGluZyBncGlvX2RldmljZV9maW5kKCkKKHdoaWNoIHdpbGwgaXRlcmF0ZSBv
dmVyIGFsbCByZWdpc3RlcmVkIGdwaW9fY2hpcHMgYW5kIHRoZW4Kb2ZfZ3Bpb2NoaXBfbWF0Y2hf
bm9kZV9hbmRfeGxhdGUoKSB3aWxsIGNhbGwgdGhpcyBjdXN0b20gZnVuY3Rpb24KdG8gc2VlIGlm
IGl0J3MgdGhlIHJpZ2h0IG9uZSBhbmQgcmV0dXJuID4gMCB3aGVuIHdlIGhhdmUgdGhlIHJpZ2h0
CmNoaXAuCgpUaGlzIHNob3VsZCB3b3JrIGZvciBncGlvcyAqb25seSouIFdoZW4gd2UgdGhlbiBj
b21lIHRvIGlycXMsCnRoZXNlIGFzc3VtZSAoc2VlIGdwaW9saWIuYykgdGhhdCB3ZSBhcmUgdXNp
bmcKaXJxX2RvbWFpbl94bGF0ZV90d29jZWxsKCkgd2hlbiB1c2luZyBHUElPTElCX0lSUUNISVAs
IHNvCnlvdSBlaXRoZXIgbmVlZCB0byByb2xsIHlvdXIgb3duIGlycWNoaXAgY29kZSBvciB3ZSBz
aG91bGQgZml4CnRoZSBjb3JlIChJIGNhbiBoZWxwIHdpdGggdGhpcyBpZiB0aGUgYWJvdmUgd29y
a3MpLgoKU2V2ZXJhbCBncGlvIGNoaXBzIHVzZSB0aGVpciBvd24gZG9tYWluIHRyYW5zbGF0aW9u
IG91dHNpZGUKb2YgdGhlIGdwaW9saWIgc28geW91IGNhbiB1c2UgdGhpcyBhcyBhbiBpbnRlcm1l
ZGlhdGUgc3RlcDoKZ2l0IGdyZXAgaXJxX2RvbWFpbl9vcHMgZHJpdmVycy9ncGlvLwouLi4gYnV0
IGlmIHlvdSBnZXQgaGVyZSwgbGV0J3MgcGF0Y2ggdGhlIGNvcmUgdG8gZGVhbCB3aXRoIGN1c3Rv
bQppcnFkb21haW4geGxhdGUgZnVuY3Rpb25zIGluIHRoZSBzYW1lIG1hbm5lciBhcyBhYm92ZS4K
CkkgaG9wZSB0aGlzIGlzbid0IHRlcnJpYmx5IHVuY2xlYXIgb3IgY29tcGxpY2F0ZWQ/Ck90aGVy
d2lzZSB0ZWxsIG1lIGFuZCBJIHdpbGwgdHJ5IHRvIC4uLiBleHBsYWluIG1vcmUgb3IgZ2l2ZQp1
cCBhbmQgc2F5IHlvdSBjYW4gdXNlIGEgc2luZ2xlIDk2LXBpbiBncGlvX2NoaXAuCgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
