Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438B5C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 07:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2jj5ff3EsB+vR4mPsnWNJW17axoy//zByt2F4XDCGE=; b=CFbD5P80s75VSk
	JuNu7XEmaLj3anbHjc9Fg6nMFKunFxjV/o2eGxoPRUR5he1x5+Diuh5252si4tvu+Kp8dtmwCdWKX
	x69yvKkqzrTBWL2oVCg1N41ZwHqJpXLTX1C4xw7WnPlcMslrZ9EBawuEBaggNiqt//1JbFPy7Da+a
	WLdotB7GgOlPeZ36eJ+hgSSDkoiC824buxLWkifNixQN65MpzxoGIp5foKOMMHNtrVxnDxBVAreFB
	IxOGSzbxeyVQpsJoUsGhXov/5H2lRlVUsZDNc/IAw5paw5PkxFRrWMGl8yOgOY4HxP/oEdUINweCL
	1RTaSdEN/HKOB50R9omA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWvr-000000034g0-1Oho;
	Wed, 24 Apr 2024 07:20:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWvo-000000034dp-0q6S
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 07:20:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-34801b1bc4aso1106001f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 00:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713943237; x=1714548037; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wh6IUVzLnqPSctdxo0NfypwPQgB70lPKXDdkbVAdAck=;
        b=zxlv9fLH5FLFpT2Yjxu7UBbTIyCzW3A3I0JJ3GyZZlg9S3/XxvTo7EMAp2pMvzZC3k
         xBxO3uj9a7d0B8U1XQckaMgVYPOiPs3jtTyHgFddcbnzcmtnBMWVmgmW+jLFnbgvlfEN
         xuHrD0VVxpmeBqQdq2C2f31W9yfyVTVrdWMmwVrwO6n1ixKRRxsZ8AL9XlatTBtSdPC1
         STJrqc8belvqVDHWYWqML7LkoX1xn/E9UIi17jiCqCimZ7wIoduzzFezIHZ+m+HNM7Fd
         er6VSS2dakqjlOpKSZwaSKBkM1oXytqpy5vADOCn0uavdTY1QNKteJb+8v1/BXUoLO2d
         tHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713943237; x=1714548037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh6IUVzLnqPSctdxo0NfypwPQgB70lPKXDdkbVAdAck=;
        b=eVO9+/kcleZ1XmNl9bsahp5dMT9VN7livPJFHjL4+55yfClBlKZEFTCcpP373KItw3
         9sVNtBQMph2L7mvYVdkRBnm99meCi0h4Q0ziKXWkEcxVoZOc2RxladnhuM6HFTRNWyom
         9PTYI0h7ka/eKP3KmpE5B2qdS55k9hTsMktTSue3E+8R4LWYnkRkBI72I11YlYkIXBcS
         gszyaPmE46vSDjApl8jRCsbn6hvnLC88XIlkivmJEDmQz2wvTj5/66aDrxAPs8p3M/Ao
         w7Ldod4yGpCYjX5yialZuS7JkpjwL56pKVtqv6f0ZUT65hMvUp51FfxAXIaGob+/eW8d
         beeA==
X-Forwarded-Encrypted: i=1; AJvYcCXMkL5r6vt1hiMhKpvs6N8o5gy9+8IJgDRpZwgkoBYJWGKdKcL7doMAh3vYZPrZBaQeDq2qDl7Nx7oBVwXbcfMn+IYFVKO4J4O23TH409IJ
X-Gm-Message-State: AOJu0YwO/me0rDcnpvQq671f0oFiZJp7s1aWTISbBvVw+ICRY3DHJaW9
	9seBIqFn72J7s37EJg+Gm3Ud88qmgHcMouuB+P4BF3I5/vxXL4H2le1GJTxZSK4YTRNEeUk+BAW
	Jp2Q=
X-Google-Smtp-Source: AGHT+IHP+69RlO5qIlo2n+3DPXpuAbjWbkk3HWWythfI/NUvNEynCKTR9B5rbrkI3aaY3f989CRFvg==
X-Received: by 2002:a05:600c:46cb:b0:41a:b9a1:3ecc with SMTP id q11-20020a05600c46cb00b0041ab9a13eccmr1021588wmo.3.1713943237148;
        Wed, 24 Apr 2024 00:20:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6057:6f32:d1e5:d4d7? ([2a01:e0a:999:a3a0:6057:6f32:d1e5:d4d7])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b0041a3e724fc5sm10907059wmo.19.2024.04.24.00.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 00:20:36 -0700 (PDT)
Message-ID: <e39f2fea-868a-4a79-b7a5-bef8f15de688@rivosinc.com>
Date: Wed, 24 Apr 2024 09:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] dt-bindings: riscv: add Ssdbltrp ISA extension
 description
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-3-cleger@rivosinc.com>
 <20240423-poser-splashed-56ab5340af48@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240423-poser-splashed-56ab5340af48@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_002040_252978_28CFA28A 
X-CRM114-Status: GOOD (  17.23  )
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

CgpPbiAyMy8wNC8yMDI0IDE4OjMwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgMDQ6MjY6NDFQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgZGVzY3JpcHRpb24gZm9yIHRoZSBTc2RibHRycCBJU0EgZXh0ZW5zaW9uIHdoaWNoIGlzIG5v
dCB5ZXQKPj4gcmF0aWZpZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgNiArKysrKysKPj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+IGluZGV4IDYzZDgxZGM4
OTVlNS4uY2U3MDIxZGJiNTU2IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPj4gQEAgLTE0Nyw2ICsx
NDcsMTIgQEAgcHJvcGVydGllczoKPj4gICAgICAgICAgICAgIGFuZCBtb2RlLWJhc2VkIGZpbHRl
cmluZyBhcyByYXRpZmllZCBhdCBjb21taXQgMDFkMWRmMCAoIkFkZCBhYmlsaXR5Cj4+ICAgICAg
ICAgICAgICB0byBtYW51YWxseSB0cmlnZ2VyIHdvcmtmbG93LiAoIzIpIikgb2YgcmlzY3YtY291
bnQtb3ZlcmZsb3cuCj4+ICAKPj4gKyAgICAgICAgLSBjb25zdDogc3NkYmx0cnAKPj4gKyAgICAg
ICAgICBkZXNjcmlwdGlvbjogfAo+PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFNzZGJsdHJw
IHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciBkb3VibGUgdHJhcAo+PiArICAgICAgICAg
ICAgaGFuZGxpbmcgYXMgY3VycmVudGx5IGRlZmluZWQgYnkgY29tbWl0IGU4NTg0N2IgKCJNZXJn
ZSBwdWxsIHJlcXVlc3QKPj4gKyAgICAgICAgICAgICMzMiBmcm9tIHZlZC1yaXZvcy8wNDE1XzEg
Iikgb2YgcmlzY3YtZG91YmxlLXRyYXAuCj4gCj4gSSBzZWUgdGhlIHByb3Bvc2VkIHJhdGlmaWNh
dGlvbiBmb3IgdGhpcyBpcyBTZXB0IDIwMjQsIGFuZCBpcyBtYXJrZWQgYXMKPiAiRnJlZXplIEFw
cHJvdmVkIi4gRG8geW91IGtub3cgd2hlbiBpdCBpcyBnb2luZyB0byBiZSBmcm96ZW4/IFVudGls
Cj4gdGhpcywgSSBjYW4ndCBhY2sgdGhpcyBwYXRjaC4gSSBoYWQgYSBsb29rIGluIHRoZSBSVkkg
SklSQQo+IGh0dHBzOi8vamlyYS5yaXNjdi5vcmcvYnJvd3NlL1JWUy0yMjkxP3NyYz1jb25mbWFj
cm8KPiBhbmQgaXQgbG9va3MgaW1taW5lbnQsIGJ1dCBpdCdzIHVuY2xlYXIgdG8gbWUgd2hldGhl
ciBpdCBhY3R1YWxseSBoYXMKPiBiZWVuIG9yIG5vdC4KCkhpIENvbm9yLAoKWWVhaCwgdGhpcyBz
ZXJpZXMgaXMgYSBSRkMgc2luY2UgdGhlIHNwZWMgaXMgbm90IHlldCByYXRpZmllZCBub3IgZnJv
emVuCmFuZCBpdHMgcHVycG9zZSBpcyBhY3R1YWxseSB0byBnZXQgdG8gYSBmcm96ZW4gc3RhdGUu
IEFzIHRvIHdoZW4gdGhpcwp3aWxsIGJlIHJhdGlmaWVkLCBJIGd1ZXNzIFZlZCBjYW4gcHJvYmFi
bHkgYW5zd2VyIHRoYXQuCgpDbMOpbWVudAoKPiAKPj4gKwo+PiAgICAgICAgICAtIGNvbnN0OiBz
c3RjCj4+ICAgICAgICAgICAgZGVzY3JpcHRpb246IHwKPj4gICAgICAgICAgICAgIFRoZSBzdGFu
ZGFyZCBTc3RjIHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciB0aW1lIGNvbXBhcmUgYXMK
Pj4gLS0gCj4+IDIuNDMuMAo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
