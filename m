Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48ABEFCE53
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 23:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLtBHBXOyUOlI5zASxRwhPpcNnWerXvCF3ujnc7gxNk=; b=eGguN+AGTorfx2
	HQJUGKf9Jikrxtk5otCDSkXGoApuEJIQPnjUgwded/GHwubfdqiem+5Xb/BXDHoMYIj0cs3W5bBnO
	ymTmIUy9BDKTHhN8R+puT/7wOnw0bqCPw0aTdQzBRsExZKlXPWMwZO5g6FDRH2bRSAnWQyMWh+GFH
	HW60XePUv99q3Mpz0RFm/yjo8VNu59VYlX4SDG5MdHnQOHB1/mEYXCSPZDXAPqyZ/IPtxY5g2adhE
	oaslZmy9bHGQRYiuTXzbXbVwgXJK26jvsVUtSTU3VkUTk7qRuDz8JpzSmQlLRwQZ/XKxRA/7vNDMf
	TmLTJP2q7UO/tm6+W78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvsV-00000000djA-3oC6;
	Wed, 04 Mar 2026 23:43:43 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvsT-00000000dil-0LDa
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 23:43:42 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-79885f4a8ffso56859537b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 15:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772667820; cv=none;
        d=google.com; s=arc-20240605;
        b=XJU5cT6wdB4di+7ztpznkdmwUEiIY30B7+AEdQ9bRVFTwVktnANZ5yjcjY9J9m6Pfk
         Xxr9wKopNE9s5yAPvX4PIhcuztVbD9GM/j9DcUAj79lwVWgXe8/G5Ue8V0XhCamvPUHE
         KpN5VheO7mlSdvwot8e5PCyCTMun4mU3MmCAFibvEowCmMFHcD1KIA9MoTJ/JoQZwiDR
         yIocehvxtZZIgBq8d+HMiaYqIS1AxUlbrU2nEkQYd7nPqaE9Qm2pfmGR4b02KzCefhtA
         qrJr0Lz6/8s4wekJ6G652OQnQYLWCEw9ZG13JmCxlHPHSVHPIbgr0WXbY5jWeWViqHSC
         Lb4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=th9Dubm5MZo7OqHj9TXvS+R0ZyOofjALKbBnj/rhigU=;
        fh=jiUTpLA3Wk5R9tHzV9m//SJWgQNmTNHsWgFC3oDP/fs=;
        b=UjjskZR/hmGYqxnZ9dmsR/E3duOiUUPIRDX8u6b+bHF1dwIaORkx2kOvxx7YEhxCh1
         FP8r0LjIZerfPM7pS1r43o38x4aiGnd2j0gsqJMeSchd1r6n+ja0f/xH6hc0Q1uxGLUQ
         h/Jdy+i8zURDwwpBGFUWN5NYHGCnQiccY5TEy1PvDOH/WkMge4WUBS4aVgPhGRbczuVv
         FHRO6KP8BNPM9Dhis5C/0FEr/JXzeDZGgs0Ktxg+Vl6bRlgPUuzcoj3hfvpSiqYrmJSw
         UMYEDY2gmnMopFW6LtNT/fuxhdne8MJxh8b8LdzvtNBOkRh+1JkEZXKsxOsQya7z3/Y6
         huIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772667820; x=1773272620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th9Dubm5MZo7OqHj9TXvS+R0ZyOofjALKbBnj/rhigU=;
        b=bNff24d2M2GJwNOWpKkINWZQ0YDF5PNtoYsJ1dyn1QGlLd1Qpl2Nmoy0OJA12Q24Bz
         YaLoS6OZHGoTSf0dqFD1zUAD+WnMEWEsWQmnGJRh2oNb8t0LqcuJWTcQ7hvz8y2O+ux2
         18ZJKQAgnKPmYWFKfZVYDXvWw0NaV6eDDFuJLmoMaEz0dxl8W6igGUzxsq5I//sa3WoU
         iL/R5d9EB2BHgkBN0CxZ09xVDmAhpj8hJYAE+hewya9w0JkzTcw0gavpBaVGheg6mZin
         AILjgLGFw3jjHJdEfpy5mC6S78wr+qkZcNO+S/DKca1bAkM+X0ifI+anlZ7j4Gxolc3J
         CM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772667820; x=1773272620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=th9Dubm5MZo7OqHj9TXvS+R0ZyOofjALKbBnj/rhigU=;
        b=G5XKpwQJwVdLe8NV8BLaFVFWuOzzl32TkdpQP09eaSkuNijqL8C2Jg0vRCxIvjO7K/
         TaWfxk+rrNWVC2aO/12qTjYXPnp7PhEFU0hEjOh0yNM+LWieMi169GgRcG0Ijen4yvpG
         XEkxqB4CALf23hmJNk6JupWfnFXaKTq+lWa7ooN+24lMi/nCIWVnfRSpwYZZx8gJhRND
         HP0lO39SCq7JWPHkLhsTbj3lbMblm+IxcxdLT7S8RP5BpDke2yfT00jZojB0fmaFXOy1
         vnFllOMsORf9b5zlbZsMVDm9Cpu8R7KPTfBw0S5nNfKS0rsbFJv7fC/NgxAE0lYkuB13
         4Dzw==
X-Forwarded-Encrypted: i=1; AJvYcCUq03iVcAQRv+fo/FbN9qF76WhEfj992Qd8TPEfp7sLmegBl+fQ/Og/tMEw22UDfX6Ix9X2RKjJKoAidw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1rbjOToHzwPhcqo1Ft1mb3dGl5zDMySI4a6aLdB3qcGpJE1Ky
	63aMbes3crRf1CI11NaqM/yvLtD/hcOyFg5l84mpPuZguY4XZHHTqSGP3U9Rp+g7sFc1bsFB7mM
	HsB9wq5VYv8nTAAqgWH/ZIHQROCqJsvRhDV2m+Yrv5Q==
X-Gm-Gg: ATEYQzxUm5/9p8HRTAikIjtJmOgh8PDSr1N7gSgRaTdwCqBmQUIocb7FPkjqnG0ca7w
	whS5sxG7TgFVK/AbaUMaxUkpGD/SWrhjdLFbJFtggFfA39m/IXQK6Fs3+zvYFX9hx30Iq5SbMyk
	e8i/CXR2ZOial1VTSMwpJKmgWpDGAiwyLwqHGHtuVUaLPj1Mlrx5YVv4//Dp6YEX66WL55q446d
	IvST3MVzTWfXxaM8322/GVScbjG7RdpKA053atYazaF3DoIBLHVhT3AAsZMgcJ4/hl3xnslc4Gg
	vmu40Xm7+Xj5CJDk1D9Mlx+Vs82Znb19MrD7sqogLfRIyrtr1Y6gdUHCbDwSMgcwiUccN++uHfU
	+D9Nu1iU=
X-Received: by 2002:a05:690c:64ca:b0:798:77ee:cc0b with SMTP id
 00721157ae682-798c6d250a2mr28157897b3.64.1772667819690; Wed, 04 Mar 2026
 15:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
 <20260303-atlantis-clocks-v7-3-415c9dda086a@oss.tenstorrent.com>
 <aadhd3LwZQPkT3A4@redhat.com> <CAEev2e_hxUBQjVdxisqBXHQRzspQq6dHT0kCZHUW-6dEyV4faQ@mail.gmail.com>
 <CAEev2e9fEsFqN5b4sAT9cbjVAvJEPvqxoqy74e5mG8K10xBQdg@mail.gmail.com> <aaiwYxQuoptMDbBk@redhat.com>
In-Reply-To: <aaiwYxQuoptMDbBk@redhat.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 4 Mar 2026 17:43:28 -0600
X-Gm-Features: AaiRm51XS5TgJvKLSFcENIB5eXoLABmGDu_OTsDM4l8lKFxkTWPNl6bFP6Nwjco
Message-ID: <CAEev2e80Rs1gO7-cUCRaJiYGbhMMmR8V=X=9hHQ4AFoLLiFpMA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_154341_139964_0B75DAC6 
X-CRM114-Status: GOOD (  32.53  )
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

SGkgQnJpYW4sCgpPbiBXZWQsIE1hciA0LCAyMDI2IGF0IDQ6MjHigK9QTSBCcmlhbiBNYXNuZXkg
PGJtYXNuZXlAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBIaSBBbmlydWRoLAo+Cj4gT24gV2VkLCBN
YXIgMDQsIDIwMjYgYXQgMTE6NTM6MzhBTSAtMDYwMCwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3Rl
Ogo+ID4gU29ycnkgZm9yIHRoZSBmb2xsb3cgdXAsIGJ1dCB3YW50ZWQgdG8gcnVuIHNvbWV0aGlu
ZyBieSB5b3UuCj4gPgo+ID4gT24gV2VkLCBNYXIgNCwgMjAyNiBhdCAxMDo0MOKAr0FNIEFuaXJ1
ZGggU3Jpbml2YXNhbiA8Cj4gPiBhc3Jpbml2YXNhbkBvc3MudGVuc3RvcnJlbnQuY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gSGVsbG8gQnJpYW4sCj4gPiA+Cj4gPiA+IE9uIFR1ZSwgTWFyIDMsIDIw
MjYgYXQgNDozMuKAr1BNIEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IEhpIEFuaXJ1ZGgsCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MgZm9yIHRo
ZSBwYXRjaC4gQSBmZXcgbWlub3IgY29tbWVudHMgYmVsb3cgd2l0aCBzb21lIG1pbm9yCj4gPiA+
ID4gbml0cGlja3MsIGFkZGl0aW9uYWwgcGxhY2VzIHRvIHVzZSBGSUVMRF9HRVQoKSwgcGx1cyBz
b21lIHN1Z2dlc3Rpb25zCj4gPiA+ID4gZm9yIGFkZGl0aW9uYWwgcmVnbWFwIGhlbHBlcnMgdG8g
dXNlLgo+ID4gPiA+Cj4gPgo+ID4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgaW50IGF0
bGFudGlzX2Nsa19wbGxfaXNfZW5hYmxlZChzdHJ1Y3QgY2xrX2h3ICpodykKPiA+ID4gPiA+ICt7
Cj4gPiA+ID4gPiArICAgICBzdHJ1Y3QgYXRsYW50aXNfY2xrX3BsbCAqcGxsID0gaHdfdG9fYXRs
YW50aXNfcGxsKGh3KTsKPiA+ID4gPiA+ICsgICAgIHUzMiB2YWwsIGVuX3ZhbCwgY2dfdmFsOwo+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgcmVnbWFwX3JlYWQocGxsLT5jb21tb24ucmVnbWFw
LCBwbGwtPmNvbmZpZy5yZWdfb2Zmc2V0LCAmdmFsKTsKPiA+ID4gPiA+ICsgICAgIHJlZ21hcF9y
ZWFkKHBsbC0+Y29tbW9uLnJlZ21hcCwgcGxsLT5jb25maWcuZW5fcmVnX29mZnNldCwKPiA+ICZl
bl92YWwpOwo+ID4gPiA+ID4gKyAgICAgcmVnbWFwX3JlYWQocGxsLT5jb21tb24ucmVnbWFwLCBw
bGwtPmNvbmZpZy5jZ19yZWdfb2Zmc2V0LAo+ID4gJmNnX3ZhbCk7Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArICAgICAvKiBDaGVjayBpZiBQTEwgaXMgcG93ZXJlZCBvbiwgbG9ja2VkLCBub3QgYnlw
YXNzZWQgYW5kIEdhdGUKPiA+IGNsayBpcyBlbmFibGVkICovCj4gPiA+ID4gPiArICAgICByZXR1
cm4gISEoZW5fdmFsICYgUExMX0NGR19FTl9CSVQpICYmICEhKHZhbCAmCj4gPiBQTExfQ0ZHX0xP
Q0tfQklUKSAmJgo+ID4gPiA+ID4gKyAgICAgICAgICAgICghcGxsLT5jb25maWcuY2dfcmVnX2Vu
YWJsZSB8fCAoY2dfdmFsICYKPiA+IHBsbC0+Y29uZmlnLmNnX3JlZ19lbmFibGUpKSAmJgo+ID4g
PiA+ID4gKyAgICAgICAgICAgICEodmFsICYgUExMX0NGR19CWVBBU1NfQklUKTsKPiA+ID4gPgo+
ID4gPiA+IENvdWxkIHJlZ21hcF90ZXN0X2JpdHMoKSBtYWtlIHRoaXMgYSBiaXQgY2xlYW5lcj8K
PiA+ID4gPgo+ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdGF0aWMgaW50IGF0
bGFudGlzX2Nsa19wbGxfZW5hYmxlKHN0cnVjdCBjbGtfaHcgKmh3KQo+ID4gPiA+ID4gK3sKPiA+
ID4gPiA+ICsgICAgIHN0cnVjdCBhdGxhbnRpc19jbGtfcGxsICpwbGwgPSBod190b19hdGxhbnRp
c19wbGwoaHcpOwo+ID4gPiA+ID4gKyAgICAgdTMyIHZhbCwgZW5fdmFsLCBjZ192YWw7Cj4gPiA+
ID4gPiArICAgICBpbnQgcmV0Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgcmVnbWFwX3Jl
YWQocGxsLT5jb21tb24ucmVnbWFwLCBwbGwtPmNvbmZpZy5yZWdfb2Zmc2V0LCAmdmFsKTsKPiA+
ID4gPiA+ICsgICAgIHJlZ21hcF9yZWFkKHBsbC0+Y29tbW9uLnJlZ21hcCwgcGxsLT5jb25maWcu
ZW5fcmVnX29mZnNldCwKPiA+ICZlbl92YWwpOwo+ID4gPiA+ID4gKyAgICAgcmVnbWFwX3JlYWQo
cGxsLT5jb21tb24ucmVnbWFwLCBwbGwtPmNvbmZpZy5jZ19yZWdfb2Zmc2V0LAo+ID4gJmNnX3Zh
bCk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAvKiBDaGVjayBpZiBQTEwgaXMgYWxyZWFk
eSBlbmFibGVkLCBsb2NrZWQsIG5vdCBieXBhc3NlZCBhbmQKPiA+IEdhdGUgY2xrIGlzIGVuYWJs
ZWQgKi8KPiA+ID4gPiA+ICsgICAgIGlmICgoZW5fdmFsICYgUExMX0NGR19FTl9CSVQpICYmICh2
YWwgJiBQTExfQ0ZHX0xPQ0tfQklUKSAmJgo+ID4gPiA+ID4gKyAgICAgICAgICghcGxsLT5jb25m
aWcuY2dfcmVnX2VuYWJsZSB8fCAoY2dfdmFsICYKPiA+IHBsbC0+Y29uZmlnLmNnX3JlZ19lbmFi
bGUpKSAmJgo+ID4gPiA+ID4gKyAgICAgICAgICEodmFsICYgUExMX0NGR19CWVBBU1NfQklUKSkg
ewo+ID4gPiA+Cj4gPiA+ID4gU2FtZSBhYm91dCByZWdtYXBfdGVzdF9iaXRzKCkgaGVyZS4KPiA+
ID4KPiA+ID4gVGhlc2UgaW5zdGFuY2VzIGhhdmUgaXQgcmVhZGluZyAzIGRpZmZlcmVudCByZWdp
c3RlcnMgKHVubGlrZSBhbG1vc3QKPiA+ID4gYWxsIHRoZSBvdGhlciBleGFtcGxlcyB0aGF0IGp1
c3QgcmVhZCBvbmUpIGFuZCB0ZXN0aW5nIGJpdHMgYWNyb3NzCj4gPiA+IHRoZW0uIEJ1dCBJIGd1
ZXNzIGl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byB1c2UgdGVzdF9iaXRzIGhlcmUgdG9vLiBJCj4g
PiA+IHdpbGwgdXBkYXRlIHRoZW0uCj4gPgo+ID4gVGhpcyBlbmRzIHVwIGJlY29taW5nIGxpa2Ug
dGhpcy4KPiA+Cj4gPiBzdGF0aWMgaW50IGF0bGFudGlzX2Nsa19wbGxfaXNfZW5hYmxlZChzdHJ1
Y3QgY2xrX2h3ICpodykKPiA+Cj4gPiB7Cj4gPgo+ID4gICAgICAgICBzdHJ1Y3QgYXRsYW50aXNf
Y2xrX3BsbCAqcGxsID0gaHdfdG9fYXRsYW50aXNfcGxsKGh3KTsKPiA+Cj4gPgo+ID4KPiA+Cj4g
PiAgICAgICAgIC8qIENoZWNrIGlmIFBMTCBpcyBwb3dlcmVkIG9uLCBsb2NrZWQsIG5vdCBieXBh
c3NlZCBhbmQgR2F0ZSBjbGsgaXMKPiA+IGVuYWJsZWQgKi8KPiA+ICAgICAgICAgcmV0dXJuIHJl
Z21hcF90ZXN0X2JpdHMocGxsLT5jb21tb24ucmVnbWFwLCBwbGwtPmNvbmZpZy5yZWdfb2Zmc2V0
LAo+ID4gUExMX0NGR19MT0NLX0JJVCkgJiYKPiA+Cj4gPiAgICAgICAgICAgICAgICAgcmVnbWFw
X3Rlc3RfYml0cyhwbGwtPmNvbW1vbi5yZWdtYXAsCj4gPiBwbGwtPmNvbmZpZy5lbl9yZWdfb2Zm
c2V0LCBQTExfQ0ZHX0VOX0JJVCkgJiYKPiA+Cj4gPiAgICAgICAgICAgICAgICAgcmVnbWFwX3Rl
c3RfYml0cyhwbGwtPmNvbW1vbi5yZWdtYXAsCj4gPiBwbGwtPmNvbmZpZy5jZ19yZWdfb2Zmc2V0
LCBwbGwtPmNvbmZpZy5jZ19yZWdfZW5hYmxlKSAmJgo+ID4KPiA+ICAgICAgICAgICAgICAgICAh
cmVnbWFwX3Rlc3RfYml0cyhwbGwtPmNvbW1vbi5yZWdtYXAsCj4gPiBwbGwtPmNvbmZpZy5yZWdf
b2Zmc2V0LCBQTExfQ0ZHX0JZUEFTU19CSVQpOwo+ID4KPiA+IH0KPiA+Cj4gPiBXZSBjYW4ndCB1
c2UgYSBzaW5nbGUgY2FsbCBvZiByZWdtYXBfdGVzdF9iaXRzIHRvIHRoZQo+ID4gcGxsLT5jb25m
aWcucmVnX29mZnNldCByZWdpc3RlciBjYXVzZSB3ZSBuZWVkIHRvIGNoZWNrIGlmIFBMTF9DRkdf
TE9DS19CSVQKPiA+IGlzIHNldCBhbmQgUExMX0NGR19CWVBBU1NfQklUIGlzIHVuc2V0LiBXZSBl
bmQgdXAgbmVlZGluZyB0byBtYWtlIDIgcmVhZHMKPiA+IHRvIHRoYXQgcmVnaXN0ZXIuCj4gPgo+
ID4gQW55IHRob3VnaHRzIG9uIHdoZXRoZXIgSSBzaG91bGQgc3RpbGwgYmUgdXNpbmcgcmVnbWFw
X3Rlc3RfYml0cyBoZXJlPwo+Cj4gSWYgaXQncyBub3QgbG9va2luZyBnb29kIGluIHByYWN0aWNl
IG9uY2UgeW91IGltcGxlbWVudCBpdCwgdGhlbiBqdXN0Cj4gZmFsbCBiYWNrIHRvIHRoZSBvbGRl
ciBiZWhhdmlvci4gSXQgd2FzIGp1c3QgYSBzdWdnZXN0aW9uLgoKVW5kZXJzdG9vZC4KCj4KPiBJ
IGhhdmVuJ3QgdXNlZCB0aGlzIHlldCwgaG93ZXZlciB0aGVyZSBhcmUgYWxzbyB0aGUgcmVnbWFw
X2ZpZWxkX3h4eCgpCj4gaGVscGVycyB0aGF0IGFyZSBhbHNvIGF2YWlsYWJsZS4gZHJpdmVycy9j
bGsvbXN0YXIvY2xrLW1zYzMxMy1tcGxsLmMKPiB1c2VzIHRoZXNlIGhlbHBlcnMuIEkgZG9uJ3Qg
a25vdyBpZiBpdCB3b3VsZCBoZWxwIHRvIHNpbXBsaWZ5IHlvdXIgY29kZS4KCkRvZXNuJ3QgbG9v
ayBsaWtlIGl0J2xsIGhlbHAgc2ltcGxpZnkgdGhpbmdzIHRvIG1lLCBzbyBJJ2xsIGtlZXAgdGhp
bmdzIGFzIGlzLgoKPgo+IEJyaWFuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
