Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49D5C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSkhKC6OCrQbhx2xmvvXJyS4vJKOpV5adD+5n7TT+oQ=; b=k5rxeieVLMmdaV
	tAkfrnRJPNHpyQ8v0ju9z0obp2oCA7A5pWKPlyBU0BdtOHQY2GMJuKf77I4nl+mJL5abyGPenUDO8
	W0rsTNpTgV3e7oy38Nu3L550Y9UcnDU/4pEcUTNSoY5ojf6f6wvOhYqJcLW56uuaeADsgNUqoe4ML
	MLPeGLYqRA/yg3MZzZrBsLnVUUjOnteIBgH3o5SgIvnL+gJq/d5wvSzv/dGVJAC1WPcsGYwuMAGkF
	1z74Wqd2UUxMXiH931VpZyW9US4ZnbHtWIqGPB/TeSHXFUadE7KGZ4Fa8k75XrdPGSe5Y63upDZFD
	XKkPS4nLXMWt9YDQj5ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCO82-00000005E0c-3xgC;
	Wed, 29 May 2024 18:34:26 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCO7y-00000005E06-0yHU
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:34:24 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a59a609dd3fso4302866b.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717007659; x=1717612459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hD6ZFR8cVhkF2jyWECX8kqG1Td4lUwUC/HVkt49WWDc=;
        b=v0IMuCDvMQnYTu6eWdvFXMcpqdPT7qclEdrgD4evlrt0Vjib7SUpst3AGtg4LJ75ZB
         FUzKbvNx/XsdDDoNaMqJnwI8DjfHJVQbiubtrWddNiasQD0DEECodTOyWPSB++Aw4uab
         yIfb+xQtqlAUpLfr3SIkmgdmNmA0Ysrq2AIInHlILSwO4KzpTfWfHoEHKTakzT8f0xfD
         QiZmhuE3LKb5vJvxrsdzERE+k33xu10q6Cd1bmtiSyAasuU6I2Hu0fLE7nCDxPw0j0Ja
         OYiGY0hM9hXm+I9w9ZG12HsNwvY+RW8Cy98WQxqHEKQx+ecUvrPaFQzAY25/RZXcmgWD
         R1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717007659; x=1717612459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hD6ZFR8cVhkF2jyWECX8kqG1Td4lUwUC/HVkt49WWDc=;
        b=WdlR3itmJyOGaWe7lDbP+csCM60/kUldUJQ+6oye0cMFa48uH7BS7qr4YaiWjvw0d6
         o8AlO46mYrDYGyqDLtUK8WVx4qezJboN8vGs4ky2UdTI0AKbFBCkDMGypzRBwU5VauHg
         2V8WqsPuNIMU5TY0Zpx/59ePaB0/U4gIfws9gOhAi3c0vVOPO4u34Ngl3Hs3d+C6s0je
         f6/+4Jj4RQrcLUJDfA0jXlqBxqLLe2rmy0+r9B/Rh/s7JwCmXMTFrawQxaxuH7yYKP40
         aMNTL1brJJwveoZqVL+fZNKZtsa1p7LTF+rN61rXVs73t3pTURusvzXmMyceRFu0c7ml
         8jDg==
X-Gm-Message-State: AOJu0Yxz+YmbddLgMCllWbubXBkrO2JkCiRROjnBfaLTnurwiS3GfQme
	LrLs1pHudnITa+7i2R6XSka7tmsbQjstjQjEblD0+nCEb33fIs261E1Nw3aUKCTxch0dTT5hP/E
	J0ZIeET8AddpoDuO6ZkIHPHu1Jut35oSDW3q/Vg==
X-Google-Smtp-Source: AGHT+IFfrfi+FZNye+Mi5cT1d9Y5frgn3oR/psuzmdDX57yFj6cbdF7CKYfEIUYsI39iYQu9pPkVIxjamQlqxGS+pZo=
X-Received: by 2002:a17:906:66d0:b0:a59:be21:3587 with SMTP id
 a640c23a62f3a-a642d2780fbmr270278866b.8.1717007658800; Wed, 29 May 2024
 11:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_1E3506F09D08066B8F3BAEE136C4F887540A@qq.com> <tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com>
In-Reply-To: <tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 29 May 2024 11:33:42 -0700
Message-ID: <CALs-Hst_TpjuQw0t-p9GbcCY4FAwXSjWziHJJuToi3rWXo7mJw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: hwprobe: not treat KEY_CPUPERF_0 as bitmask
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Elliott Hughes <enh@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_113422_400521_6F6803AF 
X-CRM114-Status: GOOD (  15.64  )
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

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgODozNuKAr1BNIFlhbmd5dSBDaGVuIDxjeXlAY3l5c2Vs
Zi5uYW1lPiB3cm90ZToKPgo+IFNpbmNlIHRoZSB2YWx1ZSBpbiBLRVlfQ1BVUEVSRl8wIGlzIG5v
dCBiaXRtYXNrLCByZW1vdmUgdGhlIHdyb25nIGNvZGUKPiBpbiBod3Byb2JlLmguCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4KCkknZCBleHBlY3QgYSBG
aXhlcyB0YWcsIGFuZCBpZGVhbGx5IHNvbWUgZGlzY3Vzc2lvbiBvbiB0aGUgcmVhc29uaW5nCmFu
ZCByYW1pZmljYXRpb25zIG9mIHRoaXMgY2hhbmdlLgoKSSBwb3N0ZWQgdGhlIG90aGVyIHBvc3Np
YmxlIGZpeCwgZGVjbGFyaW5nIGEgbmV3IGtleSwgYXQgWzFdLCBtb3N0bHkKc28gd2UgY291bGQg
c2VlIHRoZSB0d28gb3B0aW9ucyBhbmQgZGlzY3Vzcy4gSSdtIG9rYXkgd2l0aCBlaXRoZXIKcGF0
Y2guCi1FdmFuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0MDUyOTE4MjY0
OS4yNjM1MTIzLTEtZXZhbkByaXZvc2luYy5jb20vVC8jdQoKPiAtLS0KPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmggfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4gaW5kZXggNjMwNTA3ZGZmNWVhLi5mMjRj
YWQyMmJiZTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3Byb2JlLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3cHJvYmUuaAo+IEBAIC0yMCw3ICsyMCw2
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBod3Byb2JlX2tleV9pc19iaXRtYXNrKF9fczY0IGtleSkK
PiAgICAgICAgIHN3aXRjaCAoa2V5KSB7Cj4gICAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZ
X0JBU0VfQkVIQVZJT1I6Cj4gICAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRf
MDoKPiAtICAgICAgIGNhc2UgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8wOgo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgICAgICAgIH0KPgo+IC0tCj4gMi40NS4xCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
