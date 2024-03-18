Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DADAC54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NptbztMY/ivJGlQrVENGnl1+g674Y+B/RbgMMa7Xfgo=; b=Jsxvv0Cnmpef1j
	i1aaYkRqayX8Ns61hjdEzojnvRmRSArwpSsqlUM4szzjURn28q9gUR9mY7RKSpVJ0Obnz3Yx+DEEC
	98tmSJhNhbKx0vNei285ks5ii/U6ffhHwXRz7HkAc5cTDBL2LoGnq0Q3zzUgBieog9ZGO4XjqvKiy
	G0VklhXnlUDH37Vliu/Jdse5GC6PXm1O7iPi4hjP5o8jgCZq+VQedmoF12YAQMHnKHXbI4JNY/0LW
	ykJYEuoOOgILEMCeXn1IQmcu32Sp2PiscIAyjkn2GlLgnGktcnroe/X3ocdXLpvYGvYMeRF6CR0lx
	/i4LpKX/l2EbMvsynIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAAZ-000000088nf-03Rh;
	Mon, 18 Mar 2024 10:24:39 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmAAS-000000088kA-3fxS
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 10:24:36 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-513dd2d2415so2580458e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2024 03:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710757471; x=1711362271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kntj7D+3C8Siu9Mte/gOo4b2BDgoQlvmaeXCzlwHfd0=;
        b=Y+f3RFOPajIoi3d8rvCJfNI2qDhgexYadjfiAgb5bkGuSK0JwBN9x4bau+jaOy1INr
         foq7EX88r3b+DxdGfrvj1gkufSQv0wcwyuhrxC1nxOMooidW2AhqpFX1P0XsNmHr9Fg+
         0ffrXBFGEh2j59NS5prrGFpg0oyi9VJ7kFpihpqRUv7bAzv8CqyEXvSbZvimb7csWaF1
         iEppQDxdVzAw+4VVxr5CllKYZwG42exL76Bd6jDl/5ns8Ci56Jqx9IoGdK5l+YHvBXEW
         EgemKt/0fyNfXSwyzxIZKpppEkpS2EQQLyZkgOcZ2YTCI6JMBImVqbJqbdTIKzwMpEou
         pGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710757471; x=1711362271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kntj7D+3C8Siu9Mte/gOo4b2BDgoQlvmaeXCzlwHfd0=;
        b=N3Fq7S17UHTqthWz6dRQp1f/h0806c234aqYWoMb8rwkXv96f84nkjXWNyFexWYBYY
         nIo+G5noiaJnjyktF1HPov7DnlQzj6fSHNXKAcAZeu5X1yLh/UHzM9aZEiXl8ogeIOP3
         HKNAx1y4MtU26h3qp+JfgzJTSOqfdFNeMzEtrdlDcBFa9jzCYDBnsPmMPdj1ZzrW49cD
         kPwhVkFYz5T9Y7ZKEcmm/P19Rd91m22Ek/0Wa2tlujLZepiWQzetgzaZJiNTgam8rXMB
         t00ztvKxHAXuBnrzE0GC4la0Z4ngAdztBhGUB7b43SFhdw6CNz0WEm3VgCnqeWsbtmJf
         VAuw==
X-Gm-Message-State: AOJu0Yzm9Lfj/NndZa9PXiyiIx3d9J5ixyVmb4p1mBvCpHQLY0rHE69M
	vTO+QFvD9+6Gae4HNImou0QtrRZxYBRkrhE6purMEvfHTS8rSIVfWPPyXQ+TwHIJigfvBX4sF3i
	7MVvDKafILLG4GRRaG9oBh0SgrnC8QIraiYS1mg==
X-Google-Smtp-Source: AGHT+IHkUAoaQCQVB1qIDuqXpEBKlFEHkJrtN5qFI394gASFx2wCpRpaQSzqetL2Hg5oBfbO6L7QeYXCho3lGQksddk=
X-Received: by 2002:a05:6512:485c:b0:513:ca84:3a0e with SMTP id
 ep28-20020a056512485c00b00513ca843a0emr6709998lfb.58.1710757470631; Mon, 18
 Mar 2024 03:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
 <20240317222718.3e03edb1@namcao> <CA+eeCSMiqcvzrQcgRr7AZWJQTv-c9-uSX5jbPZPzmsDjy08z=A@mail.gmail.com>
 <20240318100108.4fafd72b@namcao>
In-Reply-To: <20240318100108.4fafd72b@namcao>
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Mon, 18 Mar 2024 12:24:18 +0200
Message-ID: <CA+eeCSN+tsyL0OdR2owrFHiSj_dWNyw0Z46mUMND41O5xxTWKg@mail.gmail.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev, 
	linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com, 
	dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_032433_459862_D4E47AC1 
X-CRM114-Status: GOOD (  12.81  )
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

T24gTW9uLCBNYXIgMTgsIDIwMjQgYXQgMTE6MDHigK9BTSBOYW0gQ2FvIDxuYW1jYW9AbGludXRy
b25peC5kZT4gd3JvdGU6Cj4gTmljZSEgSSBhc3N1bWUgSSBjYW4gYWRkCj4gICAgIFJlcG9ydGVk
LWFuZC10ZXN0ZWQtYnk6IEV2YSBLdXJjaGF0b3ZhIDxueWFuZGFya25lc3NnaXJsQGdtYWlsLmNv
bT4KPiB0byB0aGUgcGF0Y2g/Cj4KClllcy4KWW91IGNhbiBhbHNvIGFkZCBsaW5rIHRvIHVwc3Ry
ZWFtIFJWVk0gcmVwbyBpZiBhbnlvbmUgaXMgaW50ZXJlc3RlZCBpbgpyZXByb2R1Y3Rpb24uIFRo
aXMgUlZWTSBwYXRjaCBhcHBsaWVkIHRvIDAuNiBtYWtlcyBhIGtleXN0cm9rZSBzdG9ybToKKHdp
bmRvd191cGRhdGUoKSBpcyBjYWxsZWQgb24gZWFjaCBkaXNwbGF5IHJlZHJhdyBhbmQgaGFzIGFj
Y2VzcyB0byBoaWRfa2IpCgpkaWZmIC0tZ2l0IGEvc3JjL2RldmljZXMvZmJfd2luZG93LmMgYi9z
cmMvZGV2aWNlcy9mYl93aW5kb3cuYwppbmRleCBmMTcwZTJkLi4xN2UyNTE5IDEwMDY0NAotLS0g
YS9zcmMvZGV2aWNlcy9mYl93aW5kb3cuYworKysgYi9zcmMvZGV2aWNlcy9mYl93aW5kb3cuYwpA
QCAtNzcsNiArNzcsMTEgQEAgc3RhdGljIGNvbnN0IHVpbnQ4X3QgcnZ2bV9sb2dvX3BpeFtdID0g
ewoKc3RhdGljIHZvaWQgd2luZG93X3VwZGF0ZShydnZtX21taW9fZGV2X3QqIGRldmljZSkKewor
ICAgIGZiX3dpbmRvd190KiB3aW4gPSBkZXZpY2UtPmRhdGE7CisgICAgZm9yIChzaXplX3QgaT0w
OyBpPDEwMDAwMDsgKytpKSB7CisgICAgICAgIGhpZF9rZXlib2FyZF9wcmVzcyh3aW4tPmtleWJv
YXJkLCBISURfS0VZX0xFRlRDVFJMKTsKKyAgICAgICAgaGlkX2tleWJvYXJkX3JlbGVhc2Uod2lu
LT5rZXlib2FyZCwgSElEX0tFWV9MRUZUQ1RSTCk7CisgICAgfQogICAgZmJfd2luZG93X3VwZGF0
ZSgoZmJfd2luZG93X3QqKWRldmljZS0+ZGF0YSk7Cn0KCj4gSSBhbSBzdGlsbCBjb25mdXNlZCB3
aHkgUlQgdGhyb3R0bGluZyBkb2Vzbid0IHVuc3R1Y2sgdGhlIGtlcm5lbCBpbiB0aGlzCj4gY2Fz
ZS4gSSB3aWxsIGNvbnN1bHQgc29tZSBwZW9wbGUgYW5kIGludmVzdGlnYXRlIG1vcmUgb24gdGhp
cy4gQnV0IEkgdGhpbmsKPiB0aGlzIHBhdGNoIGlzIGdvb2Qgb24gaXRzIG93biwgc28gSSB3aWxs
IHNlbmQgYSBwcm9wZXIgcGF0Y2ggc2hvcnRseS4KPgo+IEJlc3QgcmVnYXJkcywKPiBOYW0KClJU
IHRocm90dGxpbmcga2lja2VkIGluICp2ZXJ5KiByYXJlbHksIGluIG1vc3QgY2FzZXMgd2hlcmUg
dGhlIHVucGF0Y2hlZAprZXJuZWwgd2FzIGFjdHVhbGx5IHN0dWNrIFJUIHRocm90dGxpbmcgd2Fz
bid0IHJlcG9ydGVkIGF0IGFsbC4KCkl0IGRpZG4ndCBoYW5nIGV2ZXJ5IHRpbWUgZWl0aGVyLCBz
byBpdCdzIHBvc3NpYmxlIHRoYXQgUlQgdGhyb3R0bGluZwpoZWxwZWQgc29tZXRpbWVzLCBidXQg
bm90IGVub3VnaCB0byBhbHdheXMgcmVjb3ZlciBmcm9tIHN1Y2ggYSBsb29wOgpbaW5jb21pbmcg
SVJRXS0+W0lSUSBjbGFpbWVkXS0+W25vIGhhbmRsaW5nXS0+W0lSUSBjb21wbGV0aW9uICh3aGlj
aAppbW1lZGlhdGVseSB0cmlnZ2VycyBwaGFzZSAxIGFnYWluKV0KCkJlc3QgcmVnYXJkcywKRXZh
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
