Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B545C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TGuCwwxg2ywS78xWjLrIGfT3r7tDIUtbe3kmQozwLE=; b=y21cIOSXWgmhVK
	oRZEsFFhtS5HiXGuBWRpCQ0h73jfROflif0MBrl4u/FcazzFIuqJRxEr4/OHqlcK0NmtzGKQs4MAx
	BeJlkKBrxsKVFifMGTyAl7+POcU3p6ubag6+Sku9Bf5dGPV4wj7ypyXbzNrS1DvfA8o+/RlqRbaXg
	SV0ETVftVA7Ga7tp6oHz6SuswtN+yZ6/raRYon6BhbkWbwEnoXBz1Zo3TkIibDFQK1/srovIEq+fC
	kOKhzN6r3mXWWI/PxObMjQOsNUIJUa/aDdW7x5mqSV0IiL5gDIqJ8eCh5CphN6XCLptOnWBpypjJF
	egzATN8VR45aMHewOHDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjeW-00000002C5v-2mGs;
	Fri, 19 Jul 2024 09:11:48 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUjeS-00000002C50-3zpl
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 09:11:46 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a77cb7c106dso183040866b.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 02:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721380303; x=1721985103; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLucreB4C7Cq/x6iCkzClVthNh5Hb9jZ55GIvzS0dF8=;
        b=sz9VH570XtW1SYi6CB7EICYtnaaamVV50e1nFD0mwlmOB+x4rbWEkq4hx5fQ+qBKBm
         t8T24j8c/+qdh+I1Exv0xTTEpqqtS2pjngukEdiBN5GmxBa2A185jaUM6lOl8W1UvZDe
         d0vQYizmNo+Z6JC8d8fV8MUV1jqqXzFdsMfMSKem+RdpEwCGBfx4aCX6gyzOr+BgKw7T
         hv4hR7Ofw02bcZzTuaDghDYINhdD8vrtrWNaF+FxBlFE+uvBG5qq7Y/dCRx2JKVQSx3K
         WR0oTNhxBH2GH+Y9gchD0FMIA4nkj1V1OYifqimfOjvRs/o6b+IVXN2KSbRTmrkN4n7u
         ev9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721380303; x=1721985103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLucreB4C7Cq/x6iCkzClVthNh5Hb9jZ55GIvzS0dF8=;
        b=AX3dI0t3tx3UZuxkud2toSomnmPB/LT1ASxQLV8TkXklp6HqlCOdpCpVZpPcmJVR4h
         UpE7h8FQRKF0H2qzcXAhMABFr1yEe9pS8j0ezN/Fq9H63U81GuF1CRyIBOmtrwoIejMX
         NqlE8AiRf0nulnxnmv33ftAo577Q74APbjZKh2vBj/NRsVC1x00Rk6ZOI81yHrKbxFe7
         mSh4JZx3t1PXkMHRilyDtXB/WKsdSivmV8NhHy2IkiDroqguS+snwSJ1ka2S1nhrVup5
         7pCXaafAoBX6L0usjCd2XU9ptr8E9OVYyo4NUE2a478ZhKV2j/YjaZjmU1K06zNhx1To
         8MAA==
X-Forwarded-Encrypted: i=1; AJvYcCVyQNrM0onG42o9//WYhHNf8g3Mk8WKOwXuQxnszaJsM9nDO8aeiRy8H5Ms2Mfj6zTW6GNI6mdhk2G3Oj7xtf9Zr2NSjOMgMa8y3e9Cdg/N
X-Gm-Message-State: AOJu0YzJSF/n4cpf3CSilV4WJd0SYLoY6TUFD5L+bj18GBaTLXA1RWWJ
	I2zB2PVPMUtCjy6qGia+ZML9xDK0ebRVVU8mORgJwfiBI2ewkKyqmnnpj0YRihs6EMNaLanpVtT
	KBNO5vB1EmlJEUpFkqA6YS9gOX1iynDL6UrAj9w==
X-Google-Smtp-Source: AGHT+IFO6hf+5HOcO5Mu3nZVEBJhdhYQsXgwhq2XadyFC/SlzZiV7DtJ0QY08kz7HxyLbxCqNNPbNHwc+UPc/5DYNsY=
X-Received: by 2002:a17:906:bb0b:b0:a77:c8a8:fd71 with SMTP id
 a640c23a62f3a-a7a01192e56mr514488966b.32.1721380303298; Fri, 19 Jul 2024
 02:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-10-alexghiti@rivosinc.com> <da5ba38a-8848-439e-b80a-3d6584111a78@sifive.com>
In-Reply-To: <da5ba38a-8848-439e-b80a-3d6584111a78@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 19 Jul 2024 11:11:32 +0200
Message-ID: <CAHVXubiUfyPJtTzhm2N7yuv6CPqdDvL+Lm3Fq=8XT=gn77qPMA@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] riscv: Add ISA extension parsing for Ziccrse
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_021145_013536_C5C9CE93 
X-CRM114-Status: GOOD (  16.29  )
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

T24gRnJpLCBKdWwgMTksIDIwMjQgYXQgMjo1M+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFsZXgsCj4KPiBPbiAyMDI0LTA3LTE3
IDE6MTkgQU0sIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IEFkZCBzdXBwb3J0IHRvIHBhcnNl
IHRoZSBaaWNjcnNlIHN0cmluZyBpbiB0aGUgcmlzY3YsaXNhIHN0cmluZy4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiAt
LS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxICsKPiA+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IGluZGV4IGY3MWRkZDJj
YTE2My4uODYzYjliN2Q0YTRmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPiA+IEBA
IC04Miw2ICs4Miw3IEBACj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pBQ0FTICAgICAgICAg
IDczCj4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1hBTkRFU1BNVSAgICAgICAgICAgICAgNzQK
PiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFCSEEgICAgICAgICAgNzUKPiA+ICsjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWklDQ1JTRSAgICAgICAgICAgICAgICA3Ngo+ID4KPiA+ICAjZGVmaW5l
IFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHICAgMTI3Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1
cmUuYwo+ID4gaW5kZXggYzEyNWQ4MmM4OTRiLi45M2Q4Y2M3ZTIzMmMgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYwo+ID4gQEAgLTMwNiw2ICszMDYsNyBAQCBjb25zdCBzdHJ1Y3Qgcmlz
Y3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiA+ICAgICAgIF9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHN2bmFwb3QsIFJJU0NWX0lTQV9FWFRfU1ZOQVBPVCksCj4gPiAgICAgICBfX1JJ
U0NWX0lTQV9FWFRfREFUQShzdnBibXQsIFJJU0NWX0lTQV9FWFRfU1ZQQk1UKSwKPiA+ICAgICAg
IF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHhhbmRlc3BtdSwgUklTQ1ZfSVNBX0VYVF9YQU5ERVNQTVUp
LAo+ID4gKyAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemljY3JzZSwgUklTQ1ZfSVNBX0VYVF9a
SUNDUlNFKSwKPgo+IFBsZWFzZSBzb3J0IHRoaXMgZW50cnkgcGVyIHRoZSBjb21tZW50IGF0IHRo
ZSBiZWdpbm5pbmcgb2YgdGhlIGFycmF5LgoKRG9uZSwgdGhhbmtzCgpBbGV4Cgo+Cj4gUmVnYXJk
cywKPiBTYW11ZWwKPgo+ID4gIH07Cj4gPgo+ID4gIGNvbnN0IHNpemVfdCByaXNjdl9pc2FfZXh0
X2NvdW50ID0gQVJSQVlfU0laRShyaXNjdl9pc2FfZXh0KTsKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
