Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5CEC369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+0Tbb6oiI1V+Of8x0ysniydoyqQi9H+4PxIo1+xDyE=; b=B1QVDS/56tDO4m
	f8ICqAVnREU304kuY6pUQJHEdwOaF8zyKG2oFuYUw4qigkQd8gXyqEEQK1cgKGVQsBi8J3XeeLiJy
	HEYglw5s/JDpfKGCMlEt2DYPMgJXT8TItNUKWsdsO78KOnyNu8rujh4eT6TZqE0lwnqECwA90BUBA
	g0rXFw3jxtRq4TzhwWsNOjhPFoufkMdH1I+SVL8EhUB9e2GBtIetwkxZoVOu12TTVs25l9dA2WpEd
	S/78xgS+bfex1RjRa+6UVOFIK5yqSbApZiu0ZzWYeCIkDnQli9EWzjvMBrgculiOVvsZlhM/mN9jL
	xH4hMaSgEiswwK0kOc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wzh-0000000EGdf-3TNl;
	Thu, 24 Apr 2025 13:52:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wl7-0000000ECG5-3DbH
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 13:36:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3912387cf48so38084f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 06:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745501816; x=1746106616; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u72nfMy9zYS5aW9xBcDq6LESieHcry02Dg/8XEt7OSw=;
        b=pl5iFlDhWexe2EjkTAAGNXvyVnV26ZqJuE4mO22D/3NjqYPP7tKvHv/dLf2l5Z7BqE
         FcnFXlqFdStlIzpxPea9JI7DMPyNCDb6Fqtk7ODNaHheEQ56hbD6awwPNUsgFzRC/WMN
         JKw9P/9fB4FUwXK/NIM9zAvEj/WpiJ8TBoE6/hObR9RGRhUKWQPCOi5Q6R8A9sPuu/W1
         tKtdaNXQMdYPBFKv5nbPEFwxFt7zsRzes0hUW7Fr8JGzGu4n0ibfSPyW5MuYxEIcgjDS
         PJ8Lqy5524IU7YRc9WCqxgkOcRGxl7DCgrNedWkeXTGIaJUZZoK78Iikfy2X2Q0Cnevg
         YGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745501816; x=1746106616;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u72nfMy9zYS5aW9xBcDq6LESieHcry02Dg/8XEt7OSw=;
        b=ue9gbjeQMmATpWFvTc23I/M2FBBqcIRtV8qPm4ZdZpwlXUeaySfqePEmDwpV5R7ehb
         ilUMoVW3p5+C8RcE/6yfQPzHrTW1o7pCxbaSaf1P54gZbLaujdYgJB/HNfmt4wvKuDyk
         Ot2/H3R1aZoZfXlMn9Fbt55WXa7UdkQwAyzgUZGLMJa89N85likMpqo7lLRZNDk/yEel
         rEmdKJK5RRPIHiA5c3GHZAK/ea8UsCksSSjayqqyHLNRWgr9a+cN1k+trQfW8qAGIlyO
         MsookG/Mg9RizcARSjdVmd6scVUVrCOKtfoFsHL0Gh+EDF6A/QaQpIHhXhRbx00CaxDt
         qRyw==
X-Forwarded-Encrypted: i=1; AJvYcCWlzRGzJRx+H4l/DvLFH18WCh5wzlMG5EFWbL3L0+tiLXeCM2en6XausUZgH9MDDJ+qwb//yAg0/4M95g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9dUKw+dppvmODzIOJSMyjWUttUgWr+O8SDQ5S1HWM+7uM6Omm
	liA9bfdLNDZpAyAwzTlNuO9SDjZnvXT0uxZcJlyWc4pTyR5YqAHAHcxBpJh1Ri8=
X-Gm-Gg: ASbGnctYGF9IBFdTRPrQ3QqAWTsrHPXnDNMGB7aHGmNsbvN/Q3Uw+Zhzl2qzLw/Xr6w
	aScnIRhk1/7CDNyZ9eNDUABcGxa+sCTf4hdwWmByEWhByIXiWpo4FjR2swpw2jjgfDPPE73WRxl
	oEZoEnAVHnSpvuTPPtR40KM309Qcic+pddbonDYGdNKlV0vwZGi1S8GUnW+/c5Be6N4BCAKRZ9L
	XY3qZsZ6+kCGABJjK5v9CSwTac0tW0qF4JxKwF5ohUIssCapQnGpJ8l83K9EqacKC4GTvrt+2cF
	CXUWffmunnevHXvZdOswEk2m2FVFDpWGa9KYWi6x+EkC1whG
X-Google-Smtp-Source: AGHT+IEvTiSK1Lb+RPBdQ/DuDmeOaJEszTrN5CFCiZtbJdEyNkpwKicv/xW9sGpiPTRfU1AmU+RxSg==
X-Received: by 2002:a05:6000:2483:b0:3a0:65ab:89d5 with SMTP id ffacd0b85a97d-3a06cfaf02fmr812129f8f.15.1745501815962;
        Thu, 24 Apr 2025 06:36:55 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b30c:ee4d:9e10:6a46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c30d7sm2135597f8f.44.2025.04.24.06.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:36:55 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 24 Apr 2025 15:36:54 +0200
Message-Id: <D9EWR3RQK0FD.3GF55KNS53YSR@ventanamicro.com>
Subject: Re: [PATCH v12 12/28] riscv: Implements arch agnostic shadow stack
 prctls
Cc: "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar"
 <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Conor Dooley" <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Eric Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann
 Horn" <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-12-e51202b53138@rivosinc.com>
 <D92V2NPNZYV0.136MJ2HOK48HE@ventanamicro.com>
 <aAnBmexbL4XmVxQk@debug.ba.rivosinc.com>
In-Reply-To: <aAnBmexbL4XmVxQk@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_063657_804828_76AB1ABB 
X-CRM114-Status: GOOD (  38.98  )
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

MjAyNS0wNC0yM1QyMTo0NDowOS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDExOjQ1OjU4QU0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTAzLTE0VDE0OjM5OjMxLTA3OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS91c2VyY2ZpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmkuaAo+Pj4gQEAg
LTE0LDcgKzE1LDggQEAgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzOwo+Pj4gIHN0cnVjdCBjZmlf
c3RhdHVzIHsKPj4+ICAJdW5zaWduZWQgbG9uZyB1YmNmaV9lbiA6IDE7IC8qIEVuYWJsZSBmb3Ig
YmFja3dhcmQgY2ZpLiAqLwo+Pj4gLQl1bnNpZ25lZCBsb25nIHJzdmQgOiAoKHNpemVvZih1bnNp
Z25lZCBsb25nKSAqIDgpIC0gMSk7Cj4+PiArCXVuc2lnbmVkIGxvbmcgdWJjZmlfbG9ja2VkIDog
MTsKPj4+ICsJdW5zaWduZWQgbG9uZyByc3ZkIDogKChzaXplb2YodW5zaWduZWQgbG9uZykgKiA4
KSAtIDIpOwo+Pgo+PlRoZSByc3ZkIGZpZWxkIHNob3VsZG4ndCBiZSBuZWNlc3NhcnkgYXMgdGhl
IGNvbnRhaW5lciBmb3IgdGhlIGJpdGZpZWxkCj4+aXMgJ3Vuc2lnbmVkIGxvbmcnIHNpemVkLgo+
Pgo+PldoeSBkb24ndCB3ZSB1c2UgYm9vbHMgaGVyZSwgdGhvdWdoPwo+Pkl0IG1pZ2h0IHByb2R1
Y2UgYSBiZXR0ZXIgYmluYXJ5IGFuZCB3ZSdyZSBub3QgaHVydGluZyBmb3Igc3RydWN0IHNpemUu
Cj4KPiBJZiB5b3UgcmVtZW1iZXIgb25lIG9mIHRoZSBwcmV2aW91cyBwYXRjaCBkaXNjdXNzaW9u
LCB0aGlzIGdvZXMgaW50bwo+IGB0aHJlYWRfaW5mb2AgRG9uJ3Qgd2FudCB0byBibG9hdCBpdC4g
RXZlbiBpZiB3ZSBlbmQgc2hvdmluZyBpbnRvIHRhc2tfc3RydWN0LAo+IGRvbid0IHdhbnQgdG8g
YmxvYXQgdGhhdCBlaXRoZXIuIEkgY2FuIGp1c3QgY29udmVydCBpdCBpbnRvIGJpdG1hc2sgaWYK
PiBiaXRmaWVsZHMgYXJlIGFuIGV5ZXNvcmUgaGVyZS4KCiAgInVuc2lnbmVkIGxvbmcgcnN2ZCA6
ICgoc2l6ZW9mKHVuc2lnbmVkIGxvbmcpICogOCkgLSAyKTsiCgppcyBhbiBleWVzb3JlIHRoYXQg
ZGVmaW5lcyBleGFjdGx5IHRoZSBzYW1lIGFzIHRoZSB0d28gbGluZXMgYWxvbmUKCiAgdW5zaWdu
ZWQgbG9uZyB1YmNmaV9lbiA6IDE7CiAgdW5zaWduZWQgbG9uZyB1YmNmaV9sb2NrZWQgOiAxOwoK
VGhhdCBvbmUgc2hvdWxkIGJlIHJlbW92ZWQuCgpJZiB3ZSBoYXZlIG9ubHkgNCBiaXRzIGluIDQv
OCBieXRlcywgdGhlbiBiaXRmaWVsZHMgZG8gZ2VuZXJhdGUgd29yc2UKY29kZSB0aGFuIDQgYm9v
bHMgYW5kIGEgMC80IGJ5dGUgaG9sZS4gIFRoZSBzdHJ1Y3Qgc2l6ZSBzdGF5cyB0aGUgc2FtZS4K
CkkgZG9uJ3QgY2FyZSBtdWNoIGFib3V0IHRoZSBzd2l0Y2ggdG8gYm9vbHMsIHRob3VnaCwgYmVj
YXVzZSB0aGlzIGNvZGUKaXMgbm90IGNhbGxlZCBvZnRlbi4KCj4+PiBAQCAtMjYyLDMgKzI5Miw4
MyBAQCB2b2lkIHNoc3RrX3JlbGVhc2Uoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCj4+PiAraW50
IGFyY2hfc2V0X3NoYWRvd19zdGFja19zdGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0LCB1bnNp
Z25lZCBsb25nIHN0YXR1cykKPj4+ICt7Cj4+PiArCS8qIFJlcXVlc3QgaXMgdG8gZW5hYmxlIHNo
YWRvdyBzdGFjayBhbmQgc2hhZG93IHN0YWNrIGlzIG5vdCBlbmFibGVkIGFscmVhZHkgKi8KPj4+
ICsJaWYgKGVuYWJsZV9zaHN0ayAmJiAhaXNfc2hzdGtfZW5hYmxlZCh0KSkgewo+Pj4gKwkJLyog
c2hhZG93IHN0YWNrIHdhcyBhbGxvY2F0ZWQgYW5kIGVuYWJsZSByZXF1ZXN0IGFnYWluCj4+PiAr
CQkgKiBubyBuZWVkIHRvIHN1cHBvcnQgc3VjaCB1c2VjYXNlIGFuZCByZXR1cm4gRUlOVkFMLgo+
Pj4gKwkJICovCj4+PiArCQlpZiAoaXNfc2hzdGtfYWxsb2NhdGVkKHQpKQo+Pj4gKwkJCXJldHVy
biAtRUlOVkFMOwo+Pj4gKwo+Pj4gKwkJc2l6ZSA9IGNhbGNfc2hzdGtfc2l6ZSgwKTsKPj4+ICsJ
CWFkZHIgPSBhbGxvY2F0ZV9zaGFkb3dfc3RhY2soMCwgc2l6ZSwgMCwgZmFsc2UpOwo+Pgo+Pldo
eSBkb24ndCB3ZSB1c2UgdGhlIHVzZXJzcGFjZS1hbGxvY2F0ZWQgc3RhY2s/Cj4+Cj4+SSdtIGNv
bXBsZXRlbHkgbWlzc2luZyB0aGUgZGVzaWduIGlkZWEgaGVyZS4uLiAgVXNlcnNwYWNlIGhhcyBh
YnNvbHV0ZQo+Pm92ZXIgdGhlIHNoYWRvdyBzdGFjayBwb2ludGVyIENTUiwgc28gd2UgZG9uJ3Qg
bmVlZCB0byBkbyBtdWNoIGluIExpbnV4Ogo+Pgo+PjEuIGludGVyZmFjZSB0byBzZXQgdXAgcGFn
ZSB0YWJsZXMgd2l0aCAtVy0gUFRFIGFuZAo+PjIuIGludGVyZmFjZSB0byBjb250cm9sIHNlbnZj
ZmcuU1NFLgo+Pgo+PlVzZXJzcGFjZSBjYW4gZG8gdGhlIHJlc3QuCj4KPiBEZXNpZ24gaXMgbGlr
ZSBmb2xsb3dpbmc6Cj4KPiBXaGVuIGEgdXNlciB0YXNrIHdhbnRzIHRvIGVuYWJsZSBzaGFkb3cg
c3RhY2sgZm9yIGl0c2VsZiwgaXQgaGFzIHRvIGlzc3VlCj4gYSBzeXNjYWxsIHRvIGtlcm5lbCAo
bGlrZSB0aGlzIHByY3RsKS4gTm93IGl0IGNhbiBiZSBkb25lIGluZGVwZW5kZW50bHkgYnkKPiB1
c2VyIHRhc2sgYnkgZmlyc3QgaXNzdWluZyBgbWFwX3NoYWRvd19zdGFja2AsIHRoZW4gYXNraW5n
IGtlcm5lbCB0byBsaWdodAo+IHVwIGVudmNmZyBiaXQgYW5kIGV2ZW50dWFsbHkgd2hlbiByZXR1
cm4gdG8gdXNlcm1vZGUgaGFwcGVucywgaXQgY2FuIHdyaXRlCj4gdG8gQ1NSLiBJdCBpcyBubyBk
aWZmZXJlbnQgZnJvbSBkb2luZyBhbGwgb2YgdGhlIGFib3ZlIHRvZ2V0aGVyIGluIHNpbmdsZQo+
IGBwcmN0bGAgY2FsbC4gVGhleSBhcmUgZXF1aXZhbGVudCBpbiB0aGF0IG5hdHVyZS4KPgo+IEJh
Y2tncm91bmQgaXMgdGhhdCB4ODYgZm9sbG93ZWQgdGhpcyBiZWNhdXNlIHg4NiBoYWQgd29ya2xv
YWRzL2JpbmFyaWVzLwo+IGZ1bmN0aW9ucyB3aXRoIChkZWVwKXJlY3Vyc2l2ZSBmdW5jdGlvbnMg
YW5kIHRodXMgYnkgZGVmYXVsdCB3ZXJlIGZvcmNlZAo+IHRvIGFsd2F5cyBhbGxvY2F0ZSBzaGFk
b3cgc3RhY2sgdG8gYmUgb2YgdGhlIHNhbWUgc2l6ZSBhcyBkYXRhIHN0YWNrLiBUbwo+IHJlZHVj
ZSBidXJkZW4gb24gdXNlcnNwYWNlIGZvciBkZXRlcm1pbmluZyBhbmQgdGhlbiBhbGxvY2F0aW5n
IHNhbWUgc2l6ZQo+IChzaXplIG9mIGRhdGEgc3RhY2spIHNoYWRvdyBzdGFjaywgcHJjdGwgd291
bGQgZG8gdGhlIGpvYiBvZiBjYWxjdWxhdGluZwo+IGRlZmF1bHQgc2hhZG93IHN0YWNrIHNpemUg
KGFuZCByZWR1Y2UgcHJvZ3JhbW1pbmcgZXJyb3IgaW4gdXNlcm1vZGUpLiBhcm02NAo+IGZvbGxv
d2VkIHRoZSBzdWl0ZS4gSSBkb24ndCB3YW50IHRvIGZpbmQgb3V0IHdoYXQncyB0aGUgY29tcGF0
aWJsaXR5IGlzc3Vlcwo+IHdlIHdpbGwgc2VlIGFuZCB0aHVzIGp1c3QgZm9sbG93aW5nIHRoZSBz
dWl0ZSAoZ2l2ZW4gdGhhdCBib3RoIGFwcHJvYWNoZXMKPiBhcmUgZXF1aXZhbGVudCkuIFRha2Ug
YSBsb29rIGF0IHN0YXRpYyBgY2FsY19zaHN0a19zaXplKHVuc2lnbmVkIGxvbmcgc2l6ZSlgLgo+
Cj4gQ29taW5nIGJhY2sgdG8geW91ciBxdWVzdGlvbiBvZiB3aHkgbm90IGFsbG93aW5nIHVzZXJz
cGFjZSB0byBtYW5hZ2UgaXRzCj4gb3duIHNoYWRvdyBzdGFjay4gQW5zd2VyIGlzIHRoYXQgaXQg
Y2FuIG1hbmFnZSBpdHMgb3duIHNoYWRvdyBzdGFjay4gSWYgaXQKPiBkb2VzLCBpdCBqdXN0IGhh
dmUgdG8gYmUgYXdhcmUgb2Ygc2l6ZSBpdHMgYWxsb2NhdGluZyBmb3Igc2hhZG93IHN0YWNrLgoK
SXQncyBqdXN0IHRoYXQgdXNlcnNwYWNlIGNhbm5vdCBwcmV2ZW50IGFsbG9jYXRpb24gb2YgdGhl
IGRlZmF1bHQgc3RhY2sKd2hlbiBlbmFibGluZyBpdCwgd2hpY2ggaXMgdGhlIHdlaXJkIHBhcnQg
dG8gbWUuClRoZSBhbGxvY2F0ZSBhbmQgZW5hYmxlIHN5c2NhbGxzIGNvdWxkIGhhdmUgYmVlbiBu
aWNlbHkgY29tcG9zYWJsZS4KCj4gVGhlcmUgaXMgYWxyZWFkeSBhIHBhdGNoIHNlcmllcyBnb2lu
ZyBvbiB0byBtYW5hZ2UgdGhpcyB1c2luZyBjbG9uZTMuCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjUwNDA4LWNsb25lMy1zaGFkb3ctc3RhY2stdjE1LTQtM2ZhMjQ1YzZlM2JlQGtl
cm5lbC5vcmcvCgpBIG5ldyBpb2N0bCBkb2VzIHNlZW0gdG8gc29sdmUgbW9zdCBvZiB0aGUgcHJh
Y3RpY2FsIGlzc3VlcywgdGhhbmtzLgoKPiBJIGZ1bGx5IGV4cGVjdCBncmVlbiB0aHJlYWQgaW1w
bGVtZW50YXRpb25zIGluIHJ1c3QvZ28gb3Igc3dhcGNvbnRleHQKPiBiYXNlZCB0aHJlYWQgbWFu
YWdlbWVudCBkb2luZyB0aGlzIG9uIHRoZWlyIG93bi4KPgo+IEN1cnJlbnQgZGVzaWduIGlzIHRv
IGVuc3VyZSBleGlzdGluZyBhcHBzIGRvbnQgaGF2ZSB0byBjaGFuZ2UgYSBsb3QgaW4KPiB1c2Vy
c3BhY2UgYW5kIGJ5IGRlZmF1bHQga2VybmVsIGdpdmVzIGNvbXBhdGliaWxpdHkuIEFueW9uZSBl
bHNlIHdhbnRpbmcKPiB0byBvcHRpbWl6ZSB0aGUgdXNhZ2Ugb2Ygc2hhZG93IHN0YWNrIGNhbiBk
byBzbyB3aXRoIGN1cnJlbnQgZGVzaWduLgoKUmlnaHQsIGNoYW5naW5nIHJsaW1pdF9zdGFjayBh
cm91bmQgc2hhZG93IHN0YWNrIGFsbG9jYXRpb24gaXMgbm90IHRoZQptb3N0IGVsZWdhbnQgd2F5
LCBidXQgaXQgZG9lcyB3b3JrLgoKPj4+ICtpbnQgYXJjaF9sb2NrX3NoYWRvd19zdGFja19zdGF0
dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAo+Pj4gKwkJCQkgIHVuc2lnbmVkIGxvbmcgYXJn
KQo+Pj4gK3sKPj4+ICsJLyogSWYgc2h0c3RrIG5vdCBzdXBwb3J0ZWQgb3Igbm90IGVuYWJsZWQg
b24gdGFzaywgbm90aGluZyB0byBsb2NrIGhlcmUgKi8KPj4+ICsJaWYgKCFjcHVfc3VwcG9ydHNf
c2hhZG93X3N0YWNrKCkgfHwKPj4+ICsJICAgICFpc19zaHN0a19lbmFibGVkKHRhc2spIHx8IGFy
ZyAhPSAwKQo+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+Cj4+VGhlIHRhc2sgbWlnaHQgd2FudCB0
byBwcmV2ZW50IHNoYWRvdyBzdGFjayBmcm9tIGJlaW5nIGVuYWJsZWQ/Cj4KPiBCdXQgV2h5IHdv
dWxkIGl0IHdhbnQgdG8gZG8gdGhhdD8gVGFzayBjYW4gc2ltcGx5IG5vdCBpc3N1ZSB0aGUgcHJj
dGwuIFRoZXJlCj4gYXJlIGdsaWJjIHR1bmFibGVzIGFzIHdlbGwgdXNpbmcgd2hpY2ggaXQgY2Fu
IGJlIGRpc2FibGVkLgoKVGhlIHRhc2sgbWlnaHQgZG8gaXQgYXMgc29tZSBsYXN0IHJlc29ydCB0
byBwcmV2ZW50IGEgYnVnZ3kgY29kZSBmcm9tCmVuYWJsaW5nIHNoYWRvdyBzdGFja3MgdGhhdCB3
b3VsZCBqdXN0IGNyYXNoLiAgT3Igd2hhdGV2ZXIgY29tcGxpY2F0ZWQKcmVhc29uIHVzZXJzcGFj
ZSBjYW4gdGhpbmsgb2YuCgpJdCdzIG1vcmUgdGhlIG90aGVyIHdheSBhcm91bmQuICBJIHdvbmRl
ciB3aHkgd2UncmUgcmVtb3ZpbmcgdGhpcyBvcHRpb24Kd2hlbiB3ZSBkb24ndCByZWFsbHkgY2Fy
ZSB3aGF0IHVzZXJzcGFjZSBkb2VzIHRvIGl0c2VsZi4KSSB0aGluayBpdCdzIGNvbXBsaWNhdGlu
ZyB0aGUga2VybmVsIHdpdGhvdXQgYW4gb2J2aW91cyBnYWluLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
