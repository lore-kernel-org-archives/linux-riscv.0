Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F195FEA7951
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 02:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E2tmyKAxZR59ZhCz762CYE2TtPpjvhRtgdnAeJvfidI=; b=SfaWH7E9KSOqFY
	KzbMA0rfAV5/Vpf7D/qAK9FPtckyoeluG2CJ9T0SjhVwrniyTNDx/Yv9hz5EQ53b/VioFOn8peguk
	Hbgw/bfS/vnSpq2XFKlrCEmHASUANJxo/ewcnGQ3pabP8r2U1A9JKe/DxaVuau05aA2mKLJ9F4xkV
	ZMnt7ITxV6B4GUNVJJdGTjWMavkSamDDwz3pxziV4SW+tiz+3ogz05f8JojIDLIT2pJIkUKZx8Ek+
	d7HdYu4v0a05sGEuYxnqWHqxRFPCbu+8pKkWdTf19n1NfTQLAZ3sAmV9yibuFloRGGk+sqv2RxFX/
	/s3IlNyuEHdgCQXaRXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoqL-00000009IpB-2643;
	Thu, 05 Feb 2026 02:11:41 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoqI-00000009Ioa-3jam
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 02:11:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b886fc047d5so66329866b.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 18:11:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770257496; cv=none;
        d=google.com; s=arc-20240605;
        b=Z5+JMJWC4cR80B+AaVBGaEfN3rHGV89/vhkzkXwAoYg0jlgxq3CiAdXhY9mq08BRNk
         bcmfzMIRi71ebNdYXkcbRcyQE/5AUsgP5e+rngxzysuRkLjESx+2gky9sxNO8ND0qCQk
         Y5dSTYdTIMsCWkJgDyuNnVhpqReb2ElD3oVqJYq6fxqf+ssRJLL4rkc4qr+MLgigUG4p
         DlQgnauB4VaEndXVp5kLL8gPuCI2CZ/wfjtvwjlc1amU/1cWFhQbG2QV14xcsgYyPA47
         sSvqrS7q0ySIBHEf5xVr34gSTkwbNIyNlbkA58MbRnoVEDja3ftqz98418RH+2EejRyJ
         thxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oXfwfxqJ3Ud1a18EjbgGs6RmrKLEcJt2awiaooMVBjk=;
        fh=p/2m7cJsSHYO3a4oPGo8GGtwlIX9Y0gs5LrGxb3vtCs=;
        b=EEtdvmJLrCHxSudR+PJDZgii5ZeOtOhPpP8LUGEfyN5VEVlkNMsub24E1DrOYvLROh
         mPk5WIDQ82RQIvqQsPQev5/M14beCczID9MB3ZsIuXyoG6cvDfdwaYyAxdgmO2ktdjq/
         jZ91L3CudxnJBTlbaVG6LZEbavXbm9e2RJeptJstlXzpgoPs3v+SdDBHiGonn2/uraQc
         WlCCK0WbUWe+HZFANTA4YK6aAdJVLNGjP/+75TdUKtnQ3UNO7ZwcqqA3jr4HR3FbTEBW
         n41LaHVYFRy6S4awiUEEOY617ZicRyIHAuO3vkacbRHhmmaIiownrElPKZXWS7WNGxmw
         ulnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1770257496; x=1770862296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXfwfxqJ3Ud1a18EjbgGs6RmrKLEcJt2awiaooMVBjk=;
        b=R095Nov3VRv0cNq5wTPxpjCQQJFAgRRvB5pD/5qi8eMne+qCjf3aNDF/Xbek+8mXDy
         nplBg7NHIu2p6LATuEs9TXsCU4Mgl4vd0trVLKcCxUoJdCohY5STNwJO9CJJfiVFQlHo
         gIYq6IZKVG64wgyrTY/fpc70ONalv+HYY+Z1EQ7DRX88e8dHy+VE15onkz7xMl7EQH2y
         CVNqqqYG/JktY/KwwaacU5ga6qLEHHmZ9LEvhidzih95eW6WXPVf5/vSzanroNft6shq
         cjuhDHDidqan4sPTnXSG1Icz/eSFEkMCEigA+MUZyazg/6yZkyvB2LRaHYAvdAyS3N4C
         3dXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770257496; x=1770862296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oXfwfxqJ3Ud1a18EjbgGs6RmrKLEcJt2awiaooMVBjk=;
        b=igO9i3xqeiJJCTJNegA5gNHP9F0+pbfpfl0F8JWH5063tBsV45hlB+WpS31JpyCOR1
         d5Fo7J0MVwGBuKCIkkkpoIxpsO+wzQQEY1oVUEZEiS6xzqADXpeh+7LYvZdq2WsSwIiN
         IpGS10x9CwncE+2S63vMDWTPcgkJ9NjSIAhVr9NlYqXCiixT+OWVAQnTMf07Nrgj6bRC
         93GZcDJHG3Dhw00Ro/RPvyBvtx+G53pITn7M4X9uRE6cNzrY7p9nBI5BvfRvf/fx32ih
         k70BS+dLPHLctmc0gftIq1o2COVr4q6WxPmcB9gQ8CjnOC2jSX7I6ls8VMkwJovTrLPz
         uwpA==
X-Forwarded-Encrypted: i=1; AJvYcCXx7GrXx+h8cfg0QJfhIRryJThrjo5Q6eX1JHWOsRQfCJ2Dsz6rDk/G+KSLKIZmxYwwZ1Xub31O49iHKg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb3QBRGBomYeEX5nfUJyBE2F4M4QneRLxKNjkzxJioFfqlDor3
	1zKMvODAam83UiDrYW7WtDOzFSo5Rrmm3MxXdC7Ty4MJuPqxW7MZYyJv9wrIe8FyFfBnKUZLosr
	qA4chGXVdKXsGBy98oPvzRBl0arhGPdjJF7A8vRcREA==
X-Gm-Gg: AZuq6aLpxZF6bGltEViovlEd332PFonY3+peYVALDL+m9a+Pn/c2CyiHOAVXh2+YCPm
	EyOAO2Afnn7KCCbtxVsk3BKrovy/Uy8tWgzOvNc1OuxICndWW/zVcb+Dnsm3VtvatfX71f2NO0V
	P/G41XJBLRe1pwZ/5+uC8kPGpKN+6hBotKn6uQ1YCgPMiuHMUaFgz27RlBx76k38G4GjynXaFAf
	SVaEWFU4kT22Xm25gZ4wURtLLqSXpB3XzmpimllXSaA1k2F3c6AR+MnJuqNTHrfcHMNZCcX3w==
X-Received: by 2002:a17:907:26c9:b0:b87:892:f43b with SMTP id
 a640c23a62f3a-b8e9f196585mr325916866b.42.1770257496389; Wed, 04 Feb 2026
 18:11:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769562575.git.lv.zheng@spacemit.com> <cover.1770195980.git.lv.zheng@linux.spacemit.com>
 <9C0A2AD4850D179B+524146e74e808db90d5f28fcb6ee791cf1d1bfaa.1770195980.git.lv.zheng@linux.spacemit.com>
 <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
In-Reply-To: <p74snip7yykhogvzqld4gyjlygmd2z4kqnat7w3qj63fwebnmm@dlz6tloevgbs>
From: Zong Li <zong.li@sifive.com>
Date: Thu, 5 Feb 2026 10:11:26 +0800
X-Gm-Features: AZwV_QhMZOXglwbGVqgOIj-KY2N0eLcLOg3n2x9z4Uh395TNa1CEOvBa9sxLG3g
Message-ID: <CANXhq0oi9nE7ffLGsz5j8GnC1UDTD-4bE4cantRjW2fXHYrjHA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] iommu/riscv: Add HPM support for performance monitoring
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Lv Zheng <lv.zheng@linux.spacemit.com>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>, 
	Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_181138_967816_328BB578 
X-CRM114-Status: GOOD (  25.01  )
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

T24gVGh1LCBGZWIgNSwgMjAyNiBhdCAyOjM54oCvQU0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBIb3cgZG9lcyB0aGlzIHJlbGF0ZSB0bwo+
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMTE1MDMwMzA2LjI5NzM1LTEtem9u
Zy5saUBzaWZpdmUuY29tLwo+Cj4gRnJvbSBhIHF1aWNrIHNraW0gaXQgbG9va3MgbGlrZSB0aGVy
ZSdzIHBsZW50eSBvZiBvdmVybGFwLgo+Cj4gVGhhbmtzLAo+IGRyZXcKPgoKSGkgYWxsLAoKVGhh
bmtzIEFuZHJldyBmb3IgYnJpbmdpbmcgbWUgaGVyZSwgYW5kIHNvcnJ5IGZvciB0aGUgbG9uZyBk
ZWxheSBvbgp0aGUgSU9NTVUgUE1VIGRyaXZlciBzZXJpZXMuCgpJ4oCZbSBjdXJyZW50bHkgd29y
a2luZyBvbiB0aGUgbmV4dCB2ZXJzaW9uIHRvIGluY29ycG9yYXRlIHRoZSBmZWVkYmFjawpmcm9t
IG15IGVhcmxpZXIgc2VyaWVzLiBUaGUgbWFpbiBnb2FscyBhcmUgdG8gZGVjb3VwbGUgdGhlIElP
TU1VIHBlcmYKZHJpdmVyIGZyb20gdGhlIElPTU1VIGRyaXZlciBpdHNlbGYsIGFuZCB0byBtYWtl
IGl0IGVhc2llciB0byBhZGQKY3VzdG9tIGV2ZW50cy4KVGhlIGltcGxlbWVudGF0aW9uIGlzIGFs
bW9zdCBkb25lLCBidXQgSeKAmW0gc3RpbGwgd29ya2luZyBvbiBiaW5kaW5nICBhCm5hbWUgYmV0
d2VlbiB0aGUgUE1VIGRyaXZlciB3aXRoIHRoZSBJT01NVSBkcml2ZXIgb24gUENJZSBhbmQgQUNQ
SQpjYXNlcy4gVGhpcyBwYXJ0IGlzIHJlbGF0ZWQgdG8gaG93IGN1c3RvbSBldmVudHMgc2hvdWxk
IGJlIGFkZGVkLgpUaGF0IHNhaWQsIEnigJltIHRoaW5raW5nIHRoYXQgSSBjb3VsZCBzdWJtaXQg
dGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24KZmlyc3QsIGFuZCB0aGVuIHNlbmQgYSBzZXBhcmF0
ZSBwYXRjaCBzZXJpZXMgbGF0ZXIgdG8gaGFuZGxlIHRoZQpjdXN0b20gZXZlbnQgc3VwcG9ydC4K
CkFsc28sIEnigJlkIGxpa2UgdG8gbWVudGlvbiB0aGF0IFlheGluZyBoYXMgYSBzaW1pbGFyIGlt
cGxlbWVudGF0aW9uLiBXZQpoYWQgc29tZSBkaXNjdXNzaW9uIGFib3V0IHRoaXMgbGFzdCBtb250
aC4KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMmNlOWQ4YmUtMTBiMy00OGRk
LWI5OWUtNzM1ODM0N2ZjMTcxQGJvc2MuYWMuY24vCgpJIHRoaW5rIEkgc2hvdWxkIGJlIGFibGUg
dG8gc3VibWl0IHRoaXMgbmV4dCB3ZWVrLgoKVGhhbmtzLAoKCj4KPiBPbiBXZWQsIEZlYiAwNCwg
MjAyNiBhdCAwNTowOTowMVBNICswODAwLCBMdiBaaGVuZyB3cm90ZToKPiA+IEZyb206IEppbmd5
dSBMaSA8am9leS5saUBzcGFjZW1pdC5jb20+Cj4gPgo+ID4gSW50cm9kdWNlcyBwZXJmLWJhc2Vk
IEhQTSBkcml2ZXIgZm9yIFJJU0MtViBJT01NVSwgZW5hYmxpbmcgcGVyZm9ybWFuY2UKPiA+IG1v
bml0b3JpbmcgY2FwYWJpbGl0aWVzLgo+ID4KPiA+IE5vdGUgdGhhdCB0aGUgUklTQy1WIElPTU1V
IEhQTSBtb2R1bGUgdXNlcyBDT1VOVEVSX01BWC0xIGFzIGEgc3RhdGljCj4gPiBjb3VudGVyIGlu
ZGV4IG9mIEhQTUNZQ0xFUywgYW5kIDB+Q09VTlRFUl9NQVgtMiBhcyB0aGUgZHluYW1pYyBjb3Vu
dGVyCj4gPiBpbmRleGVzIG9mIG90aGVyIEhQTUVWRU5UUyBpbiBvcmRlciB0byBjb3JyZWN0bHkg
aW5kZXggaW50byBJT0hQTUVWVCBhbmQKPiA+IElPSFBNQ1RSIHJlZ2lzdGVycyB0aGF0IGhhdmUg
YWxyZWFkeSBiZWVuIGRlZmluZWQgaW4gdGhlIGlvbW11LWJpdHMuaC4KPiA+IEhvd2V2ZXIgdGhl
IHVzZXJzIHRyZWF0IDAgYXMgdGhlIGluZGV4IG9mIEhQTUNZQ0xFUyBhbmQgMX5DT1VOVEVSX01B
WC0xIGFzCj4gPiB0aGUgaW5kZXhlcyBvZiBvdGhlciBIUE1FVkVOVFMsIHRodXMgY2FyZSBzaG91
bGQgYmUgdGFrZW4gaW4gZGVhbGluZyB3aXRoCj4gPiBjb3VudGVyIGluZGV4ZXMgYmV0d2VlbiB1
c2Vyc3BhY2UgYW5kIGtlcm5lbCBzcGFjZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaW5neXUg
TGkgPGpvZXkubGlAc3BhY2VtaXQuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogTHYgWmhlbmcgPGx2
LnpoZW5nQGxpbnV4LnNwYWNlbWl0LmNvbT4KPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi1ub24taXNhL3Jpc2N2LWlvbW11Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2
L0tjb25maWcgICAgICAgICAgfCAgIDkgKwo+ID4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZp
bGUgICAgICAgICB8ICAgMSArCj4gPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1iaXRzLmgg
ICAgIHwgICA2ICsKPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LWhwbS5jICAgICAgfCA4
NDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS1wY2kuYyAgICAgIHwgIDEzICstCj4gPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1w
bGF0Zm9ybS5jIHwgICA4ICstCj4gPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5oICAgICAg
ICAgIHwgIDQyICsrCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCA5MTkgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS1ocG0uYwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
