Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C701EC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2AH/wrC+fThiPNxHWsJQjndKTkajCbaq+jnSAu8als=; b=t9GF52LqM2w0Hf
	dJGnIA4doHIVuloYHAVUYyDzqXq0HsocVNXHLD/qLYD4/xEY8y58g6tbNj4HmEzBegaXe9tPtT8IC
	M78n6GiJuMc++JghAW+9L43GCI33G284ZSB8h4SnGTkjq0Smcq3O+NPzN2RxQRXtALhzUiyixzf8Y
	BxzvSDBRLGNb8RL3X6VuElfkFmkEJus014wuvlPU5vT91BB/v3i7kO/rL28paDa3e/zUImk3qCgQi
	lkmp1Wx/ayp+CMzgE9muuhZv8XOt6Z5QBlVc3voRXA+zshVdGWUep7pSba4sOol3vn3SHo1A41ruT
	a3Nrq5b7QraVmYS62dUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmjb-0000000Ema4-0XqW;
	Thu, 14 Mar 2024 15:11:07 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmjY-0000000EmYC-1neb
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 15:11:05 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50e4e36c09cso396869e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710429061; x=1711033861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2MZiHvUx8Et+58L2AKerTbFp0nDFuxXEtX5aHB6h40=;
        b=Wq7Wtl9v3/XJ8N3NpGSOT0rmt8Mi6vOM6JYXlg8F1mS605zztAkwS34SnFP0AM7LJn
         SMrWwihd0l6mUNcNRcrhSRTQlCOK4rnmknc/eQ7PcDjIULF5p19MBWus6nV252pNBzZk
         OrF7d/CNKjQxFGsgSkNBz0guESjVNyTLl3lCtV34smy7wz0nZ4KOVzUIE24rk/aeCDl6
         w20s23mazfUJ/7QpFTPFEgr0GzSG1BWzhgzKzy+Ny3uL92B0o5zrzmNrJrRMNO8GV51i
         SnZMU/8Lj1SZ2BRWSvLmtHV7Ms0vfMEVDf7u3MOmbqedjfKT2iLrjKgQTaH44aruTrGM
         sIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710429061; x=1711033861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2MZiHvUx8Et+58L2AKerTbFp0nDFuxXEtX5aHB6h40=;
        b=bUZgMoUZ9qmXypHPa1BwnNQSyjxpgJ/JsxZ9qVwCMmMBPotOun8Bl8sgsdAVleIsDt
         j+OfNZdSqJc0w4bu8ixSJ2HNT8XBhM9AxXbtjapGPZk8FqVjDwdiY6b4nc/riAiarrcd
         KyF3qq5o8ec4Ni3qR6afUk06QBmypjrKQV8oKx3rLvrIo6iEI5+LqhUjc8/HG/pWe56M
         OIHBQSRLJK1F6BQW7r61AaMQD0jtt/nY98nkutmPvGVGmhvXa0VEDPD9wSnrE+Mx3Js8
         2XVJuje1A8aR3XGB3C3R2u6KWgoOfSnmjEyZdT/P3TBlJeaQtU8AZLOxnWXjK4u5CjBW
         dvwA==
X-Forwarded-Encrypted: i=1; AJvYcCUApleGH6Puj19tJisjRZGFOgBqMjQ2/wMBLrw7KzY8MkLJp6G2s2MYHOZpmEt1a4pOv2igYabK3VT4WTPXO0y+fY9J2dkXu+l2ELBdizKj
X-Gm-Message-State: AOJu0Yw8XhgenFYW/OEFk8QpJOvSaB+0yWDFEv7r3JK8UWVkgo61+Q0L
	jiWE/Xngl9KQsgtwY3pxEDu8wJVBWrfnFWM0ZuTX0Lqhj1j3ACuubWmYBBCtL6Q=
X-Google-Smtp-Source: AGHT+IGBZvsTUGFp+6SwwcCxFby9GEeV89Dokq8m5bPfWxklTEwfEi0TARVG8zMt/jTH/X3JwAd6qg==
X-Received: by 2002:ac2:5bdc:0:b0:513:aef5:b431 with SMTP id u28-20020ac25bdc000000b00513aef5b431mr1317190lfn.4.1710429061269;
        Thu, 14 Mar 2024 08:11:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:e0ee:a1ff:5362:7e06? ([2a01:e0a:999:a3a0:e0ee:a1ff:5362:7e06])
        by smtp.gmail.com with ESMTPSA id je20-20020a05600c1f9400b00413e6af1bd5sm2637160wmb.47.2024.03.14.08.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:11:00 -0700 (PDT)
Message-ID: <dba8002b-b77e-4d83-8478-76319415a8ce@rivosinc.com>
Date: Thu, 14 Mar 2024 16:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2, 4/7] riscv: cpufeature: add zve32[xf] and zve64[xfd] isa
 detection
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: greentime.hu@sifive.com, conor.dooley@microchip.com,
 guoren@linux.alibaba.com, bjorn@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Anup Patel <apatel@ventanamicro.com>, Xiao Wang <xiao.w.wang@intel.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
 <20240314142542.19957-5-andy.chiu@sifive.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240314142542.19957-5-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_081104_492447_B254B46C 
X-CRM114-Status: GOOD (  17.18  )
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

CgpPbiAxNC8wMy8yMDI0IDE1OjI1LCBBbmR5IENoaXUgd3JvdGU6Cj4gTXVsdGlwbGUgVmVjdG9y
IHN1YmV4dGVuc2lvbnMgYXJlIGFkZGVkLiBBbHNvLCB0aGUgcGF0Y2ggdGFrZXMgY2FyZSBvZgo+
IHRoZSBkZXBlbmRlbmNpZXMgb2YgVmVjdG9yIHN1YmV4dGVuc2lvbnMgYnkgbWFjcm8gZXhwYW5z
aW9ucy4gU28sIGlmCj4gc29tZSAiZW1iZWRkZWQiIHBsYXRmb3JtIG9ubHkgcmVwb3J0cyAienZl
NjRmIiBvbiB0aGUgSVNBIHN0cmluZywgdGhlCj4gcGFyc2VyIGlzIGFibGUgdG8gZXhwYW5kIGl0
IHRvIHp2ZTMyeCB6dmUzMmYgenZlNjR4IGFuZCB6dmU2NGYuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiAtLS0KPiBDaGFuZ2Vsb2cgdjI6Cj4g
IC0gcmVtb3ZlIHRoZSBleHRlbnNpb24gaXRzZWxmIGZyb20gaXRzIGlzYV9leHRzW10gbGlzdCAo
Q2zDqW1lbnQpCj4gIC0gdXNlIHJpc2N2X3p2ZTY0ZF9leHRzIGZvciB2J3MgZXh0ZW5zaW9uIGxp
c3QgKFNhbXVlbCkKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgIDUg
KysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMzYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gaW5kZXggNTM0MGY4
MTg3NDZiLi4yNGVmZWE0NGYxYWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gQEAgLTgw
LDYgKzgwLDExIEBACj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkEJCTcxCj4gICNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9aVFNPCQk3Mgo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFDQVMJCTcz
Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkUzMlgJCTc0Cj4gKyNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9aVkUzMkYJCTc1Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NFgJCTc2Cj4gKyNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkU2NEYJCTc3Cj4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9a
VkU2NEQJCTc4Cj4gIAo+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkxMjgKPiAgI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX0lOVkFMSUQJCVUzMl9NQVgKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4g
aW5kZXggZDgzNjI0MWExZjExLi5kZGFjMjVhNWZlM2UgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCj4gQEAgLTIwMSw2ICsyMDEsMzUgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNj
dl96dmJiX2V4dHNbXSA9IHsKPiAgCVJJU0NWX0lTQV9FWFRfWlZLQgo+ICB9Owo+ICAKPiArI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1pWRTMyRl9JTVBMWV9MSVNUCVwKPiArCVJJU0NWX0lTQV9FWFRf
WlZFMzJYLAo+ICsKPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRTY0Rl9JTVBMWV9MSVNUCVwK
PiArCVJJU0NWX0lTQV9FWFRfWlZFNjRYLAkJXAo+ICsJUklTQ1ZfSVNBX0VYVF9aVkUzMkYsCQlc
Cj4gKwlSSVNDVl9JU0FfRVhUX1pWRTMyRl9JTVBMWV9MSVNUCj4gKwo+ICsjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfWlZFNjREX0lNUExZX0xJU1QJXAo+ICsJUklTQ1ZfSVNBX0VYVF9aVkU2NEYsCQlc
Cj4gKwlSSVNDVl9JU0FfRVhUX1pWRTY0Rl9JTVBMWV9MSVNUCj4gKwo+ICtzdGF0aWMgY29uc3Qg
dW5zaWduZWQgaW50IHJpc2N2X3p2ZTMyZl9leHRzW10gPSB7Cj4gKwlSSVNDVl9JU0FfRVhUX1pW
RTMyRl9JTVBMWV9MSVNUCj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJp
c2N2X3p2ZTY0Zl9leHRzW10gPSB7Cj4gKwlSSVNDVl9JU0FfRVhUX1pWRTY0Rl9JTVBMWV9MSVNU
Cj4gK307Cj4gKwo+ICtzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2ZTY0ZF9leHRz
W10gPSB7Cj4gKwlSSVNDVl9JU0FfRVhUX1pWRTY0RF9JTVBMWV9MSVNUCj4gK307Cj4gKwo+ICtz
dGF0aWMgY29uc3QgdW5zaWduZWQgaW50IHJpc2N2X3p2ZTY0eF9leHRzW10gPSB7Cj4gKwlSSVND
Vl9JU0FfRVhUX1pWRTMyWCwKPiArCVJJU0NWX0lTQV9FWFRfWlZFNjRYCj4gK307Cj4gKwo+ICAv
Kgo+ICAgKiBUaGUgY2Fub25pY2FsIG9yZGVyIG9mIElTQSBleHRlbnNpb24gbmFtZXMgaW4gdGhl
IElTQSBzdHJpbmcgaXMgZGVmaW5lZCBpbgo+ICAgKiBjaGFwdGVyIDI3IG9mIHRoZSB1bnByaXZp
bGVnZWQgc3BlY2lmaWNhdGlvbi4KPiBAQCAtMjQ4LDcgKzI3Nyw3IEBAIGNvbnN0IHN0cnVjdCBy
aXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ICAJX19SSVNDVl9JU0FfRVhU
X0RBVEEoZCwgUklTQ1ZfSVNBX0VYVF9kKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHEsIFJJ
U0NWX0lTQV9FWFRfcSksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQShjLCBSSVNDVl9JU0FfRVhU
X2MpLAo+IC0JX19SSVNDVl9JU0FfRVhUX0RBVEEodiwgUklTQ1ZfSVNBX0VYVF92KSwKPiArCV9f
UklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh2LCBSSVNDVl9JU0FfRVhUX3YsIHJpc2N2X3p2ZTY0ZF9l
eHRzKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKGgsIFJJU0NWX0lTQV9FWFRfaCksCj4gIAlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6aWNib20sIFJJU0NWX0lTQV9FWFRfWklDQk9NKSwKPiAgCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKHppY2JveiwgUklTQ1ZfSVNBX0VYVF9aSUNCT1opLAo+IEBAIC0y
ODMsNiArMzEyLDExIEBAIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNh
X2V4dFtdID0gewo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenRzbywgUklTQ1ZfSVNBX0VYVF9a
VFNPKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmJiLCBSSVNDVl9JU0FfRVhUX1pW
QkIsIHJpc2N2X3p2YmJfZXh0cyksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmJjLCBSSVND
Vl9JU0FfRVhUX1pWQkMpLAo+ICsJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKHp2ZTMyZiwgUklT
Q1ZfSVNBX0VYVF9aVkUzMkYsIHJpc2N2X3p2ZTMyZl9leHRzKSwKPiArCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHp2ZTMyeCwgUklTQ1ZfSVNBX0VYVF9aVkUzMlgpLAo+ICsJX19SSVNDVl9JU0FfRVhU
X1NVUEVSU0VUKHp2ZTY0ZiwgUklTQ1ZfSVNBX0VYVF9aVkU2NEYsIHJpc2N2X3p2ZTY0Zl9leHRz
KSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NGQsIFJJU0NWX0lTQV9FWFRfWlZF
NjRELCByaXNjdl96dmU2NGRfZXh0cyksCgpTaG91bGQgYmUgc29ydGVkIGFscGhhYmV0aWNhbGx5
IChpZSB6dmU2NGQgYmVmb3JlIHp2ZTY0ZikuCgpUaGFua3MsCgpDbMOpbWVudAoKPiArCV9fUklT
Q1ZfSVNBX0VYVF9TVVBFUlNFVCh6dmU2NHgsIFJJU0NWX0lTQV9FWFRfWlZFNjRYLCByaXNjdl96
dmU2NHhfZXh0cyksCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6dmZoLCBSSVNDVl9JU0FfRVhU
X1pWRkgpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZmaG1pbiwgUklTQ1ZfSVNBX0VYVF9a
VkZITUlOKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2IsIFJJU0NWX0lTQV9FWFRfWlZL
QiksCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
