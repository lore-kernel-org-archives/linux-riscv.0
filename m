Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C09EE14C3
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 23:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgB6dMZJAnXCjVUksVuPFyrYFZs3tiNFJKCTWfEIcAY=; b=R6ZeN+dQA8W19W
	jJm27d4/xH6WNhI4fqU2AyDm9ZyWAz0e5XFLiwVxVN+ByTqbLiyRRU4vt83QEpG8iwLdmv3FxN0HG
	/i+Zm46nbnNX0tgA1Kj9kTP1Q8zISE3VK49ywlWnDYmx240REkT/VLDYhRt7scf1ERxlQGB9WKohW
	1d7PdCDl4mqF0EeORBUU0nzSynvVj0S5Kb4nsfipf48mwj1nAdPMr9xMX3d7RRNzx8qUDiAR1SncG
	cwcX3JEWhuQR+5NQW8nipdb811Swf9u8vWkRXyfDSzIPtYwfkAvKLvbeojoUiK9coaryrA1/KohES
	xdiI6Ec/wdt4RFe0kKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe1wN-00B1uR-09;
	Wed, 06 Sep 2023 23:28:07 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe1wI-00B1tD-3A
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 23:28:05 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-34df008b0cbso1359855ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 16:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694042880; x=1694647680; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AFyiC8eHkWIMwsI59KIjZiFw1+6YiNLMABtanoGSqWg=;
        b=axPWtq6+IGrOzkoppJdfcWR97vTycbBD1YToWuVJUpCZ/m/LqkeDoxNRdX0mTDLmHk
         oGHzFvKi55aA7m84UKZN/uXYQbJwGxKXS6wB88/6prwWCvXl0okQFXzi6n3YwyjFgWVP
         HYQJ64KzoP85iaHbXnARNWol8R7N28eb2Etd/mzx0b3F0I5tVAv2AJ0RIM1Fl5MJRW/4
         3cx25vq35QV/ivS4FrhZH97gXpI3IMwKitMsHxzOSPOZqErtbR0wrxv+1ZXDVOsUYDR8
         mnzbHM3Qb6sYj2ajq0FHjdGWMTVjl9T8BaFNC0BvucLf/BvBl0dedhhX46nxpmvrrxWh
         Z0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694042880; x=1694647680;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFyiC8eHkWIMwsI59KIjZiFw1+6YiNLMABtanoGSqWg=;
        b=esfKFSReuUr03hOCWa0mdK7tNe3b3wQzPNs6BmvW9Hl6Z//NvmVC8UAR3wFWTf1trl
         GHaSzGz/Ndrvu+8ucR9WjtN3AwMEZmHOosryaDqES4yb2W7sRiW4xHmgOZNKRTUyw9v2
         VRdg+jHGaM4fuG5+SmFHhT9+fYjGQQlzobdsb6JXdG3kTo8ScjV6OqhhLV6L2tkZHgu7
         1bixf5cB5ylNDYOnnd0PVR0TJfeNkTF9enNYys8dIalLGWo94/3JH78v6O+V6Es5h6Rm
         5jnZdV6j+a7OFh8P3EXEHtZyYfnmiDbZvSbNst2N42J3vbROYecdSLRlPeigCYXwGBhW
         ZkXg==
X-Gm-Message-State: AOJu0Yxey8hN4KwmHSS4keV68Qa6M9dLwwPpUzizMl63CPwoXip5PulS
	V7hqPYIuzhFWmv3sPDy61anoIw==
X-Google-Smtp-Source: AGHT+IEW3bEf1qwaoHwHqiJ2ntB4DNfwsVgOuUsOTx0tFEGdDUuCnEPdyg3nAaGE1emGXhAqinGv/Q==
X-Received: by 2002:a05:6e02:cb1:b0:34c:dd54:10c6 with SMTP id 17-20020a056e020cb100b0034cdd5410c6mr17981765ilg.12.1694042879889;
        Wed, 06 Sep 2023 16:27:59 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id ca1-20020a17090af30100b00260a5ecd273sm296537pjb.1.2023.09.06.16.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 16:27:59 -0700 (PDT)
Date: Wed, 6 Sep 2023 16:27:56 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	Kees Cook <keescook@chromium.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/5] riscv: Introduce KASLR
Message-ID: <ZPkK/MNGKZIW2mvc@ghost>
References: <20230722123850.634544-1-alexghiti@rivosinc.com>
 <CABCJKucj78p4TBtXYmMdJ=vYK69XC=XU06uB+_fyfZLRnC4h0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABCJKucj78p4TBtXYmMdJ=vYK69XC=XU06uB+_fyfZLRnC4h0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_162803_239843_7F0C004D 
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMDI6MzA6MzFQTSAtMDcwMCwgU2FtaSBUb2x2YW5lbiB3
cm90ZToKPiBIaSBBbGV4YW5kcmUsCj4gCj4gT24gU2F0LCBKdWwgMjIsIDIwMjMgYXQgNTozOeKA
r0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gVGhlIGZvbGxvd2luZyBLQVNMUiBpbXBsZW1lbnRhdGlvbiBhbGxvd3MgdG8gcmFuZG9taXpl
IHRoZSBrZXJuZWwgbWFwcGluZzoKPiA+Cj4gPiAtIHZpcnR1YWxseTogd2UgZXhwZWN0IHRoZSBi
b290bG9hZGVyIHRvIHByb3ZpZGUgYSBzZWVkIGluIHRoZSBkZXZpY2UtdHJlZQo+ID4gLSBwaHlz
aWNhbGx5OiBvbmx5IGltcGxlbWVudGVkIGluIHRoZSBFRkkgc3R1YiwgaXQgcmVsaWVzIG9uIHRo
ZSBmaXJtd2FyZSB0bwo+ID4gICBwcm92aWRlIGEgc2VlZCB1c2luZyBFRklfUk5HX1BST1RPQ09M
LiBhcm02NCBoYXMgYSBzaW1pbGFyIGltcGxlbWVudGF0aW9uCj4gPiAgIGhlbmNlIHRoZSBwYXRj
aCAzIGZhY3Rvcml6ZXMgS0FTTFIgcmVsYXRlZCBmdW5jdGlvbnMgZm9yIHJpc2N2IHRvIHRha2UK
PiA+ICAgYWR2YW50YWdlLgo+ID4KPiA+IFRoZSBuZXcgdmlydHVhbCBrZXJuZWwgbG9jYXRpb24g
aXMgbGltaXRlZCBieSB0aGUgZWFybHkgcGFnZSB0YWJsZSB0aGF0IG9ubHkKPiA+IGhhcyBvbmUg
UFVEIGFuZCB3aXRoIHRoZSBQTUQgYWxpZ25tZW50IGNvbnN0cmFpbnQsIHRoZSBrZXJuZWwgY2Fu
IG9ubHkgdGFrZQo+ID4gPCA1MTIgcG9zaXRpb25zLgo+ID4KPiA+IGJhc2UtY29tbWl0LXRhZzog
djYuNS1yYzEKPiAKPiBUaGFua3MgZm9yIGNvbnRpbnVpbmcgdG8gd29yayBvbiB0aGlzIQo+IAo+
IEkgcmV2aWV3ZWQgdGhlIHBhdGNoZXMgYW5kIHRoZSBjb2RlIGxvb2tzIGNvcnJlY3QgdG8gbWUu
IEkgYWxzbwo+IGFwcGxpZWQgdGhlIHNlcmllcyBvbiB0b3Agb2YgdjYuNSBhbmQgYWZ0ZXIgcGF0
Y2hpbmcgcWVtdSB0byBwcm92aWRlIGEKPiBrYXNsci1zZWVkLCBJIGNvbmZpcm1lZCB0aGF0IHRo
ZSB2aXJ0dWFsIG9mZnNldCBhcHBlYXJzIHRvIGJlIHJhbmRvbQo+IGFuZCBpcyBwcmludGVkIG91
dCB3aGVuIEkgcGFuaWMgdGhlIG1hY2hpbmU6Cj4gCj4gIyBlY2hvIFBBTklDID4gL3N5cy9rZXJu
ZWwvZGVidWcvcHJvdm9rZS1jcmFzaC9ESVJFQ1QKPiBbICAgMTcuNTEwMDEyXSBsa2R0bTogUGVy
Zm9ybWluZyBkaXJlY3QgZW50cnkgUEFOSUMKPiBbICAgMTcuNTEwNDExXSBLZXJuZWwgcGFuaWMg
LSBub3Qgc3luY2luZzogZHVtcHRlc3QKPiBbLi4uXQo+IFsgICAxNy41MTg2OTNdIEtlcm5lbCBP
ZmZzZXQ6IDB4MzJjMDAwMDAgZnJvbSAweGZmZmZmZmZmODAwMDAwMDAKPiAKPiBGb3IgdGhlIHNl
cmllczoKPiBSZXZpZXdlZC1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5j
b20+Cj4gCj4gSSBkaWRuJ3QgdGVzdCB0aGUgRUZJIGJpdHMsIGJ1dCB0aGUgcmVzdCBvZiB0aGUg
c2VyaWVzOgo+IFRlc3RlZC1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5j
b20+Cj4gCj4gQ29ub3IsIGluIGFub3RoZXIgcmVwbHkgeW91IG1lbnRpb25lZCB5b3UncmUgcGxh
bm5pbmcgb24gcmV2aWV3aW5nIHRoZQo+IHBhdGNoZXMgYXMgd2VsbC4gRGlkIHlvdSBoYXZlIGFu
eSBmZWVkYmFjayBvciBjb25jZXJucz8KPiAKPiBTYW1pCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKSW4gYWRkaXRpb24gdG8gdGVzdGlu
ZyB0aGlzIHBhdGNoIGluIFFFTVUgYnkgcGF0Y2hpbmcgbGlrZSBTYW1pIGRpZCwgSQphbHNvIGJv
b3RlZCB0aGlzIHdpdGggYSBEZWJpYW4ga2VybmVsIGFuZCB0ZXN0ZWQgaXQgd2l0aCBFRkkuIEkg
d2FzIGFibGUKdG8gdXNlIGxrZHRtIGFzIFNhbWkgZGlkIHRvIGZvcmNlIGEgcGFuaWMgYW5kIHNl
ZSB0aGUga2VybmVsIG9mZnNldApjaGFuZ2luZyBpbiBib3RoIHNjZW5hcmlvcy4KClRlc3RlZC1i
eTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KCi0gQ2hhcmxpZQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
