Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502E8C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPXlE6eT1sOQqxZmDms/guUs13emLpzNPxfHYO0lkoU=; b=YnTa3Myez/QI9X
	D9WaS32y1ATiqg1TJuOELUfo5M4lC6wFKVADGm3lwTkfR3d+YWIlCc7gQ/3km9Kz9z1qmDeYh7kwX
	Vs2cT4JdoDJGRHKuBwCHxzvSnC0gCmZ4RiIoqoH6e+L2OhSqRt6d8UxIYSZxHUaQHEZOcHp5F2mCW
	L+0bridvoSjcf2THjnXU9bEKxtRt0yGTce/AG/f3vbygjh9Nb/vYMQwtNzL1bet+oT9xZwi3gmPSI
	7Ngnsrwl86/+JsE4Hlpg1y3uBkxBskPsF8MSxmzPSKq3GdFNoBSBYZKnoRKlG9vqtQcSY9zHDH4Le
	l2wBQfmQyAC7EwiX8xlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5w9-000000018tX-0AoT;
	Fri, 01 Mar 2024 16:40:41 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg5w5-000000018rt-1Y9I
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 16:40:39 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-365c96e2605so8770225ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 08:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1709311236; x=1709916036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xpVEUPupFJ4mY5Qxb0D2y0+A3GchrSV23FNcC1i+jo=;
        b=F0vjarbES0DcCzPngot10Yc3IIB/wn21alqnB5Y30xp3tcTYQg6bPwGRr8HP0RQRAr
         b7zHdFwLb0lZfUwrr6xt9sNNZA1n3j0tY/Xw/vApXV2cGWgO3DcLP7nOB4/GAlWKJzwH
         Oyt/zVOeyG8C4/FY3w3Ltz+bvHRcFSe/YrFkEQENvwIperhqy5N6XgtYly0sgQJfToGB
         DRSOkkMrlbrHbkbPJv1H4UMUtWSopzL6VLHjP9+iJIoVRxLbfN3e/CqbVOy1wjCqXZPA
         2LTNYVKoPcuE96qtONQNmvNf4alsTqONUyiJbCwRkRFF7dA02+qU0LDpi4Y4N0VsxlVP
         FmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709311236; x=1709916036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xpVEUPupFJ4mY5Qxb0D2y0+A3GchrSV23FNcC1i+jo=;
        b=aU13+vJjgowR39LUhqE+KmvEXQ+P8i0+Ib8qkHuiGWMVtvfzrjoLNQ8/NRFtt28LV6
         Sizdm4VNYLW3Sl+2qRz831z+HIIiDMqneuamT2bklzJo+T3RTjkUV2SGynlICffrUE9G
         Zk+kC3Is9Xa8KRJefYFr7E8+Fuc2tYn+2INP4pQLrd7tsu4Jfe4g05FRMaa3rT7RcZkg
         e7dFVxrZ/3WUwVN9k2znl2pCEahkIN5CqlkC/C1tPW7dfKz6ggv7KSxJCWpF/cNj2VDv
         b0XDRiZzlXUkuvRZATKr1dGlLizxanydlI3ccVnobb2KBqJAF/Pk3Opz52DJ46k3dOcp
         +5DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTNFpp+shwPUCGyfFg9Eh3MtGSfnrxm2k6Pg2GfTX4irSUVxZDGln5dufPpfOHgPlQ6WYMxr6YuNL5suqI103fyAWQUTCVmbMxPBLvRO/J
X-Gm-Message-State: AOJu0Yzm0qw26S4DJwY9xAi3ygtCqPKrqPJXxntpu2XwzVxKohZjinkp
	3EOBCdeiBW6x40QDeXWiz79kjbbWs9NalZWd8r66ZY7oIGqdc02e14dpPGpuV1tI2k7PR+1bt9O
	WIwirmtshngSwPD3XQ1DwyDDGUoJhN+EjFG14XQ==
X-Google-Smtp-Source: AGHT+IFA/8ZsTPlrzqpqMe1C7sAim+Tu77L5L4EC5Mu3PiP55/jHP04OSuPWwGne0ZjJhx4bUxIrY3D6GoIF2d46Q1U=
X-Received: by 2002:a92:c24e:0:b0:365:c1fc:dc07 with SMTP id
 k14-20020a92c24e000000b00365c1fcdc07mr2509460ilo.0.1709311235987; Fri, 01 Mar
 2024 08:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20240214123757.305347-1-apatel@ventanamicro.com>
In-Reply-To: <20240214123757.305347-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Mar 2024 22:10:25 +0530
Message-ID: <CAAhSdy3ObzJHgF0QL9QqKVm37F83HzdF28A5107fm0dLFxoOLQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] KVM RISC-V report few more ISA extensions through ONE_REG
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Shuah Khan <shuah@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_084037_672231_434F1FEC 
X-CRM114-Status: GOOD (  12.87  )
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

T24gV2VkLCBGZWIgMTQsIDIwMjQgYXQgNjowOOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGV4dGVuZHMgdGhlIEtWTSBSSVND
LVYgT05FX1JFRyBpbnRlcmZhY2UgdG8gcmVwb3J0IGZldyBtb3JlCj4gSVNBIGV4dGVuc2lvbnMg
bmFtZWx5OiBadHNvIGFuZCBaYWNhcy4gVGhlc2UgZXh0ZW5zaW9ucyBhcmUgYWxyZWFkeQo+IHN1
cHBvcnRlZCBieSB0aGUgSFdQUk9CRSBpbnRlcmZhY2UgaW4gTGludXgtNi44IGtlcm5lbC4KPgo+
IFRvIHRlc3QgdGhlc2UgcGF0Y2hlcywgdXNlIEtWTVRPT0wgZnJvbSB0aGUgcmlzY3ZfbW9yZV9l
eHRzX3JvdW5kMl92MQo+IGJyYW5jaCBhdDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwva3Zt
dG9vbC5naXQKPgo+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gdGhlIHJpc2N2
X2t2bV9tb3JlX2V4dHNfcm91bmQyX3YxCj4gYnJhbmNoIGF0OiBodHRwczovL2dpdGh1Yi5jb20v
YXZwYXRlbC9saW51eC5naXQKPgo+IEFudXAgUGF0ZWwgKDUpOgo+ICAgUklTQy1WOiBLVk06IEZv
cndhcmQgU0VFRCBDU1IgYWNjZXNzIHRvIHVzZXIgc3BhY2UKPiAgIFJJU0MtVjogS1ZNOiBBbGxv
dyBadHNvIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czog
QWRkIFp0c28gZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0Cj4gICBSSVNDLVY6IEtWTTog
QWxsb3cgWmFjYXMgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQo+ICAgS1ZNOiByaXNjdjogc2VsZnRl
c3RzOiBBZGQgWmFjYXMgZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0CgpRdWV1ZWQgdGhp
cyBzZXJpZXMgZm9yIExpbnV4LTYuOQoKVGhhbmtzLApBbnVwCgo+Cj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaCAgICAgICAgICAgICAgICB8ICAyICsrCj4gIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfaW5zbi5jICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrKysK
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgICAgIHwgIDQg
KysrKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMg
fCAgOCArKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykKPgo+IC0t
Cj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
