Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532B3C83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfPhQOOrmb/qJllidJb480VQYmdXAtAyz0ZuRSYsMbk=; b=ZVVnM9ATlb85yf
	2N36hoLk77kz+t9yhDCi4auyECn8+/iJGePf728+7VQiP0dHLIKExuFEmSyl38jU+r3gUf4sw1EG4
	7YcaOnwegT/4rz0rbIGPXN5HGBifQsAjSDZRm8uF4iD1xCUElw0fSEhBDilGZPbxPqW8Tv/QhYolG
	ClqSQen9MoayRQcf7h/Xx17lJBap3qeOXdkYRYGSfa/OcqFdBdSI+7VWQhLe0LyWmEcLgjJ43Yjaj
	ajTzi6+pyQEQ7wCf8zaAnD0uvQhKOP7ehPwoDtpqhJZ5wiUQC7SZLCVPSrRv4riAfC9EQAxmVqviT
	SBGCRkXYGGBApduRVnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRaA-0000000F5ph-0Gmi;
	Mon, 28 Jul 2025 17:24:14 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQb5-0000000Expa-2Z0A
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:21:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-55b50590cb2so4871251e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753719666; x=1754324466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdcfVN+MxsrGTHCCym31hzeoZnEEz01BYzSO86n5f30=;
        b=I8o0p7Xu4B7w4q8OR5Ivvg2bHXp9DHpCzPkDKWImDDVhMLHobEAJMz3DJ+5tqLTSFz
         cSvm37ACp4e+y6K8AfpXye7r8vLWIKAIjvstGvf46HAuL574kkQ5GM9rgVieBdFSF0Sr
         gsgq3a8TA3quQblpDch9oYPix8PPkd9Fundy3U1cmvzQ/boNL1Aql9UEIbQ0cSroHScd
         Xm05Ax9K3SslookE5c6FEOcoRmSh52R7lIy2uoVDGFyTqSYTf2GjvN4tRdMpq7+ISVJp
         MxeSqZEnGAA4Y6DMq9jVOEkf4svDd2xCHV8QgqWeLWbFgARGC15ExaPmWjB5OBjL3Vxp
         TV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753719666; x=1754324466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdcfVN+MxsrGTHCCym31hzeoZnEEz01BYzSO86n5f30=;
        b=kl2HZ7hoaBe7ZX7nwDKx6xC+l4ymIW1v/u1n4SK3LDdEYB3ZKwlbfY3lFYImhB6EVC
         ftomMhx3Tt4zu47D2L+tDG2/BjXYcaJcI8BmRiWIO02kZvrnK4MSnDUu9N9WNfwjbgfe
         bjKNfzlxksIOskA2wGga0cNQe7jSgbMf+ft9MhkoNGonDkbsd1swEwvelpudEE1UaV4l
         XCxAF1vMwVJyY8mtUBOWZeP0ScnHxd6dQb42iIzQh+rnZl7PiNyJsw/HUS8iQPxArXVf
         WzX10N6QYxtdKzGIOwfUMFw7CgE9C3Lbm73uDGuRKkRay9+Vbrab+pZRsLRIslozkL1j
         4ETQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9XJ6885pdNQRVuaC5syl8/IE8rZwqbIOP/I5P2mzavkvPuUh3rJkQddXt1Mw4/kNOLQm7xe7ujcVl6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YydJ/WwJYWsRopFipIRhG/q+mFRxRkQZp+JVndm82A7DTriUsnG
	jJRbUC4T3KmFAai7pnTg/jZp9sTCM1k2NpX2IIYEiY8LTOba3BuOqmipmwqZqxwBytWbuoemdcW
	SbR8PpBykz77iic34oNjwKTYSylU3EcxDEWGyMmcFXQ==
X-Gm-Gg: ASbGncuSNXBe34FqFq6Nn0XjEesfg/OwbriZzYW+kp1UDiOqYnkQAJ8VISpU5QEpoP2
	m+gNUUGiLFRwQGuIcnB0chkCC2LTs9cg1FaZQ+T7gROUfQTy6HYU+nGoGNIehAy2OhMqVLCqURv
	0xWmuCZjVabLer7GsIVfPpG8ORLKUMvRuEFIk3F0PthZGh12TNaPR5t7qk22vYS4xNIiERb93e9
	McRA80HVdHTb2Fh8Q==
X-Google-Smtp-Source: AGHT+IHPLWkIq2Hzkwnhy9Ql1/JeVtlbcWB5zYvVu9QjQS7I5BuWgmz/R499rplid2VZ9bWvtdvBHjhnVq21Gaelowo=
X-Received: by 2002:a05:6512:3c88:b0:556:2764:d1f7 with SMTP id
 2adb3069b0e04-55b5f3d5c4dmr3655639e87.12.1753719665845; Mon, 28 Jul 2025
 09:21:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com> <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
In-Reply-To: <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Jul 2025 21:50:53 +0530
X-Gm-Features: Ac12FXxd7LAtATGvK2Wpz-J7Et8u7nnsl8CdfP7VqiT2IgK5SUBwlBJP0RG-15Q
Message-ID: <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_092107_651224_BDAC5BD4 
X-CRM114-Status: GOOD (  12.19  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgOTo0M+KAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgNTo1NeKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
SnVsIDI4LCAyMDI1IGF0IDk6MjLigK9QTSBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMjowNuKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4gPiA+ICAgICAgIFJJ
U0MtVjogcGVyZi9rdm06IEFkZCByZXBvcnRpbmcgb2YgaW50ZXJydXB0IGV2ZW50cwo+ID4gPgo+
ID4gPiBTb21ldGhpbmcgaGVyZSBhdGUgUXVhbiBaaG91J3MgU2lnbmVkLW9mZi1ieSBsaW5lLCB3
aGljaCBpcyBwcmVzZW50IGF0Cj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvOTY5MzEz
MmRmNGQwZjg1N2I4YmUzYTc1NzUwYzM2YjQwMjEzZmNjMC4xNzI2MjExNjMyLmdpdC56aG91cXVh
bkBpc2Nhcy5hYy5jbgo+ID4gPiBidXQgbm90IGluIHlvdXIgYnJhbmNoLgo+ID4KPiA+IFRoZXJl
IHdlcmUgY291cGxlIG9mICItLS0iIGxpbmVzIGluIHBhdGNoIGRlc2NyaXB0aW9uIHdoaWNoCj4g
PiBjcmVhdGVkIHByb2JsZW1zIGZvciBtZSBzbyBJIHRyaWVkIGZpeGluZyBtYW51YWxseSBhbmQK
PiA+IGFjY2lkZW50YWxseSBhdGUgU2lnbmVkLW9mZi1ieS4KPiA+Cj4gPiBTb3JyeSBhYm91dCB0
aGF0Lgo+Cj4gTm8gcHJvYmxlbS4gQW5vdGhlciAoYW5kIG1vcmUgaW1wb3J0YW50KSBxdWVzdGlv
biwgZm9yIFNCSSBGV0ZUIEkKPiBkb24ndCBzZWUgYW55IHdheSBmb3IgdXNlcnNwYWNlIHRvIDEp
IHBpY2sgd2hpY2ggZmVhdHVyZXMgYXJlCj4gYXZhaWxhYmxlIDIpIHJldHJpZXZlIHRoZSBzdGF0
ZSBhbmQgcHV0IGl0IGJhY2sgaW50byBLVk0uIEFtIEkgbWlzc2luZwo+IHNvbWV0aGluZz8KCkN1
cnJlbnRseSwgdXNlcnNwYWNlIG9ubHkgaGFzIGEgd2F5IHRvIGVuYWJsZS9kaXNhYmxlIHRoZSBl
bnRpcmUKU0JJIEZXRlQgZXh0ZW5zaW9uLiBXZSBkZWZpbml0ZWx5IG5lZWQgdG8gZXh0ZW5kIE9O
RV9SRUcKaW50ZXJmYWNlIHRvIGFsbG93IHVzZXJzcGFjZSBzYXZlL3Jlc3RvcmUgU0JJIEZXRlQg
c3RhdGUuIEkgYW0Kc3VyZSB0aGlzIHdpbGwgaGFwcGVuIHByZXR0eSBzb29uIChwcm9iYWJseSBu
ZXh0IG1lcmdlIHdpbmRvdykuCgpBdCB0aGUgbW9tZW50LCBJIGFtIG5vdCBzdXJlIHdoZXRoZXIg
dXNlcnNwYWNlIGFsc28gbmVlZHMgYQp3YXkgdG8gZW5hYmxlL2Rpc2FibGUgaW5kaXZpZHVhbCBm
ZWF0dXJlcyBvZiBTQkkgRldGVCBleHRlbnNpb24uCldoYXQgZG8geW91IHRoaW5rID8KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
