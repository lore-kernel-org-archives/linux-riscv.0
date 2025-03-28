Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E805DC28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfy2qi7AfXmeAnWclAlTJocylniCth2vQQSlBRw2ht8=; b=3QPSxhgzq0KOdU
	cZt7EOKJILd5ElHpEicydN+iljURlXDu2K4OmTCXxVYMSIcFej+t7nULyYOOQSkIpFdsKCAUf7vzf
	MQdKaCURUkqHMBAm011kw75AETjvdnI/whdmm26UQPKDLboHD3qz62oDxdGrXRKUR/ZwSOSGEN5QM
	AlMVwAGwreD+BolMb4qXbOwnnO/8+6hbcxH/sabeKfO0Eqcw4fb5LfK2T5TFeggr0ht/YYOEJ+BVu
	1RBFAikjOVaCh5iyk3GWEbmRDWCOknXLyRImQeiEDeDYSyCooqmF9IqBmF7EbQ70y/GmD4N7jMFUW
	j1k6b4Zc2vZk9gYQKgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6Do-0000000D3IU-428b;
	Fri, 28 Mar 2025 09:41:52 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6Dm-0000000D3Hb-27hO
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 09:41:51 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so2749918241.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1743154909; x=1743759709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1b0hX/zsu3e/MFK5kXhrakxPDVZLxz0+s0CCuIkG+I=;
        b=b/yRueu4GbYXh+31asRmDXxjpblgNcHjCB+9gKKToDJHWueEHtG/DTfPwcQX6k6rM4
         b2D621a7tvuQbnp+0w/PcY5GlXWDLKoKUxa10G+kGfPX8gOtHpFOZkh+gpaW1++j7yVn
         nYmnPZpr9PO9uGRxoQ4J0p9gnw1Cuc7Ty96McGI40GuYjI2+4c84gBCs+9EjUimN7jAs
         9SnOJeT1gyaAW4c7cgs404HQOMFWl3LtsgP0xDvW1CmfCQOKJd6NApelnNCeTekAFQVt
         KHnCeRieoP2twpF1PmkFQaXABAYKmhXPOEVk/PQRiSgbVPFyd1T2X8RcxAoZmTH8pcsh
         LroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154909; x=1743759709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1b0hX/zsu3e/MFK5kXhrakxPDVZLxz0+s0CCuIkG+I=;
        b=RcFrfG9lxLnh1DSQJK2/YY1sNqe0ADi9jJU50Rp6WOAybcuVGGqmsIYJXuCKGVUo+Y
         PUuDZbIzFiNFgmWN3C1ttH/VWJsqsdq+x04a/nKsfet9tLLnFHyKio3IwAZB6aAvZRB+
         c/nFDox31UHU5xMz5iYU5qvwZijZ2d4kl8nECTX819OQejKecRHwvdX/kmvYX2mHRdMG
         1B9VFRST6OVk1YD6TYwbQnUPNPX2Lfeh2elcMH46gXyrrJPPc2DhKKVGquM15CYCWkI0
         B9SOmyNfi/wW/bsjPLYdDNKLsnEDaZ1jNZO3sRy1wnSUNKDNA2toywRZdcXsf7NpotlN
         yU0g==
X-Forwarded-Encrypted: i=1; AJvYcCXooNEN0S1rSQBZhs4JnKdX0KY+wveDb0vY1bD1z+eK9m0eQm6ldx1+0qQf6E1t4yLmsoWcR+k/EzSkew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwAODsCWWKRYvBuvXDTJPQQ/jXAeV7C42+IbQJVooYDeBfrz99B
	bpw/JeOVfAFj/XhO9nctL56thIE0CTBbQwazaKaA1iZFRojeS6uWnJ9GoKAW4HSfyNZZ5V5vwuo
	BMNdDIFzRwz0UdJYY1tAD/ZIViI7kNju/fSHJQA==
X-Gm-Gg: ASbGncsOPv6vxP3Jk8Uuygh2D2fh8+/H8ZyyiIKTxRoGCmN4KuTCk63BZSKaG+nggsd
	g7XA9WDqiEWNiPrM4BL2BzXILFKLoNPWJtHg1NT3r7dxaBcbv+kUkmPwYShvM1NKWbARI6K7eEN
	4obItZfk6piTYb0iIMexBxiOx8YnD7
X-Google-Smtp-Source: AGHT+IHAfA7U5ABlgiwkdwG5YFKYhP7zz3TIEVTOcbnJ0BCTQpH0ybwGPzt5hi7ByZc+Ofz77emzNeHplbMnGuIyChc=
X-Received: by 2002:a05:6102:a90:b0:4c3:878:6a62 with SMTP id
 ada2fe7eead31-4c6c2816727mr954406137.8.1743154908552; Fri, 28 Mar 2025
 02:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241224093902.1632627-1-nylon.chen@sifive.com> <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
In-Reply-To: <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 28 Mar 2025 17:41:37 +0800
X-Gm-Features: AQ5f1JrdaQFUJm63vOfH9GWXIi95vV8JEVeEsIoDHq3ca33AIZRvXLmLu0ehrcM
Message-ID: <CAHh=Yk_j1ZnJ+=XQ_geN1sXMaye=P4jk-vduwj0-1soM7d+wQw@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_024150_552179_DCDBCB01 
X-CRM114-Status: GOOD (  25.93  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDI0
5bm0MTLmnIgyN+aXpSDpgLHkupQg5LiL5Y2INDoyMOWvq+mBk++8mgo+Cj4gSGVsbG8gTnlsb24s
Cj4KPiBPbiBUdWUsIERlYyAyNCwgMjAyNCBhdCAwNTozODo1OFBNICswODAwLCBOeWxvbiBDaGVu
IHdyb3RlOgo+ID4gQWNjb3JkaW5nIHRvIHRoZSBjaXJjdWl0IGRpYWdyYW0gb2YgVXNlciBMRURz
IC0gUkdCIGRlc2NyaWJlZCBpbiB0aGUKPiA+IG1hbnVhbCBoaWZpdmUtdW5sZWFzaGVkLWEwMC5w
ZGZbMF0gYW5kIGhpZml2ZS11bm1hdGNoZWQtc2NoZW1hdGljcy12My5wZGZbMV0uCj4gPgo+ID4g
VGhlIGJlaGF2aW9yIG9mIFBXTSBpcyBhY2l0dmUtaGlnaC4KPiA+Cj4gPiBBY2NvcmRpbmcgdG8g
dGhlIGRlc2NyaXB0aW9ub2YgUFdNIGZvciBwd21jbXAgaW4gU2lGaXZlIEZVNzQwLUMwMDAgTWFu
dWFsWzJdLgo+ID4KPiA+IFRoZSBwd20gYWxnb3JpdGhtIGlzIChQVykgcHVsc2UgYWN0aXZlIHRp
bWUgID0gKEQpIGR1dHkgKiAoVCkgcGVyaW9kLgo+ID4gVGhlIGBmcmFjYCB2YXJpYWJsZSBpcyBw
dWxzZSAiaW5hY3RpdmUiIHRpbWUgc28gd2UgbmVlZCB0byBpbnZlcnQgaXQuCj4KPiBJJ20gdHJ5
aW5nIHRvIHVuZGVyc3RhbmQgdGhhdC4gWW91J3JlIHNheWluZyB0aGF0IHRoZSBQV01DTVAgcmVn
aXN0ZXIKPiBob2xkcyB0aGUgaW5hY3RpdmUgdGltZS4gTG9va2luZyBhdCB0aGUgbG9naWMgZGlh
Z3JhbSAoRmlndXJlIDI5KSBvZgo+ICJTaUZpdmUgRlU3NDAtQzAwMCBNYW51YWwgdjFwNiIgdGhh
dCBpcyBiZWNhdXNlIHB3bXMgaXMgZmVlZCBpbnRvIHRoZQo+IGNvbXBhcmF0b3IgYWZ0ZXIgZ29p
bmcgdGhyb3VnaCB0aGF0IFhOT1Igd2hlcmUgdGhlIGxvd2VyIGlucHV0IGlzIGFsd2F5cwo+IDAg
KGFzIHB3bWNtcFhjZW50ZXIgaXMgYWx3YXlzIDApIGFuZCBzbyBlZmZlY3RpdmVseSBjb3VudHMg
YmFja3dhcmRzLAo+IHJpZ2h0Pwo+IEluIHRoYXQgY2FzZSB0aGUgc2VudGVuY2UgIlRoZSBvdXRw
dXQgb2YgZWFjaCBjb21wYXJhdG9yIGlzIGhpZ2gKPiB3aGVuZXZlciB0aGUgdmFsdWUgb2YgcHdt
cyBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gdGhlIGNvcnJlc3BvbmRpbmcKPiBwd21jbXBY
LiIgZnJvbSB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIENvbXBhcmUgUmVnaXN0ZXJzIGlzIHdyb25n
Lgo+CkhpIFV3ZSwgSSd2ZSBjb250YWN0ZWQgdGhlIHNwZWMncyBhdXRob3IsIGFuZCBoZSBpcyB3
aWxsaW5nIHRvIGNvcnJlY3QKdGhlIHNwZWMtcmVsYXRlZCBlcnJvci4KCkJhc2VkIG9uIHlvdXIg
c3VnZ2VzdGlvbnMsIEkgdGhpbmsgd2UgaGF2ZSB0d28gYXBwcm9hY2hlcwoxLiBGaXJzdCBhZGQg
Y29tbWVudHMgZXhwbGFpbmluZyB3aGVyZSB0aGUgc3BlYyBhbmQgaW1wbGVtZW50YXRpb24KZG9u
J3QgbWF0Y2gsIHRoZW4gYWZ0ZXIgdGhlIHNwZWMgaXMgY29ycmVjdGVkLCBzdWJtaXQgYW5vdGhl
ciBwYXRjaCB0bwpyZW1vdmUgdGhlIGNvbW1lbnRzCjIuIE5vIG5lZWQgdG8gYWRkIHRoaXMgZXJy
b3IgZXhwbGFuYXRpb24gcGFydCwgYmVjYXVzZSB0aGUgc3BlYyB3aWxsCmJlIGNvcnJlY3RlZCBs
YXRlci4KCkkgZG9uJ3QgaGF2ZSBhIHByZWZlcmVuY2UsIHNvIEkgd2FudGVkIHRvIGNoZWNrIHdp
dGggeW91IC0gZG8geW91IGxlYW4KbW9yZSB0b3dhcmQgb3B0aW9uIDEgb3Igb3B0aW9uIDIKPiBX
aXRoIHRoYXQgYXNzdW1wdGlvbiB0aGVyZSBhcmUgYSBmZXcgaXNzdWVzIHdpdGggdGhlIHNlY29u
ZCBwYXRjaDoKPgo+ICAtIFRoZSBMaW1pdGF0aW9ucyBwYXJhZ3JhcGggc3RpbGwgc2F5cyAiVGhl
IGhhcmR3YXJlIGNhbm5vdCBnZW5lcmF0ZSBhCj4gICAgMTAwJSBkdXR5IGN5Y2xlLiIKPiAgLSBJ
ZiBwd21fc2lmaXZlX2FwcGx5KCkgaXMgY2FsbGVkIHdpdGggc3RhdGUtPmR1dHlfY3ljbGUgPSAw
IHRoZSBQV01DTVAKPiAgICByZWdpc3RlciBiZWNvbWVzICgxVSA8PCBQV01fU0lGSVZFX0NNUFdJ
RFRIKSAtIDEgd2hpY2ggcmVzdWx0cyBpbiBhCj4gICAgd2F2ZSBmb3JtIHRoYXQgaXMgYWN0aXZl
IGZvciAxIGNsb2NrIHRpY2sgZWFjaCBwZXJpb2QuIFRoYXQncyBib2d1cy4KPiAgICBJZiBkdXR5
X2N5Y2xlID0gMCBpcyByZXF1ZXN0ZWQsIGVpdGhlciBtYWtlIHN1cmUgdGhlIG91dHB1dCBpcwo+
ICAgIGluYWN0aXZlIHRoZSB3aG9sZSB0aW1lLCBvciByZXR1cm4gYW4gZXJyb3IuCj4gIC0gV2l0
aCB0aGUgYWJvdmUgZXJyb3IgaW4gdGhlIG9mZmljaWFsIGRvY3VtZW50YXRpb24sIEknZCBsaWtl
IHRvIGhhdmUKPiAgICBhIGNvZGUgY29tbWVudCB0aGF0IGV4cGxhaW5zIHRoZSBtaXNtYXRjaCBz
dWNoIHRoYXQgYSBmdXR1cmUgcmVhZGVyCj4gICAgb2YgdGhlIGNvZGUgaGFzIGEgY2hhbmNlIHRv
IHVuZGVyc3RhbmQgdGhlIHNpdHVhdGlvbiB3aXRob3V0IGluCj4gICAgZGV0YWlsIHJldmlldyBv
ZiB0aGUgbWFudWFsIGFuZCB0aGUgZHJpdmVyLgo+Cj4gT3J0aG9nb25hbCB0byB5b3VyIHBhdGNo
ZXMsIEkgd29uZGVyIGFib3V0Cj4KPiAgICAgICAgIGZyYWMgPSBESVY2NF9VNjRfUk9VTkRfQ0xP
U0VTVChudW0sIHN0YXRlLT5wZXJpb2QpOwo+Cj4gLiBSb3VuZC1jbG9zZXN0IGlzIHVzdWFsbHkg
d3JvbmcgaW4gYW4gLmFwcGx5KCkgY2FsbGJhY2suIEkgZGlkbid0IGRvCj4gdGhlIGRldGFpbGVk
IG1hdGgsIGJ1dCBJIHRoaW5rIHlvdSBuZWVkIHRvIHJvdW5kIHVwIGhlcmUuCj4KPiBCZXN0IHJl
Z2FyZHMKPiBVd2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
