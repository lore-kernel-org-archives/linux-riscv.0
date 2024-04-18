Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD931C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMtKXdCBQ/cU2iGj6B0b25di3qBWi8nY3rkfxvKCxdc=; b=F3BNypVYJ9rRqp
	phfjOkGvDu9MizOdFXzUaPsIZ3tbATOImwtnSk41x+kJ8//ULb+M8Y4tfmXhWQjWw1Q6olUopezdp
	xE2uVK7E+avMRuxotUBw++HylRqQft5B9hURwtg7lx4pBXVigX5oaDhissTtGY2UHjLQVLwusCr8g
	Xoz+mb0I4RueaNtIYNDme3MROt+YAGBRXAVA08zvQeVBxg0v/sFHKj0UTSZd9+Lco6bPDcJ/XVh2n
	5UlB54pGIpHwNU+Pt+nNxb0+LIZnHrrcu1KOE2zPlhwJ3RjTXapyZ41eteit3/w9ZpzaqpF8sMxZ0
	VU3X1IWVyX0riLk4K+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRhp-00000002MMG-0X42;
	Thu, 18 Apr 2024 13:21:37 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRhi-00000002MHV-2XQ1
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 13:21:36 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-36b30909b01so3067125ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713446488; x=1714051288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JO0ozNsqTpxBsROn3x3SanAr//Rutf3lUig74CS14aw=;
        b=XRkMrBUaaqqrCTTwPdhZ+x+iOqFnwOSFr8Fk7cO8jVsPB+LVtvLuFIlF42duh6UNAM
         fomplLK8UNaHLto+pR6JRS1m4tIa9COPpwOVaU7ci1/DMhveYgDCeOE2rXdK4UlRfOsn
         ktU49bch4LedAjv0up7oUU/Za17+Hrl2Ma5+dofrIMUJf2f1amjNvMM5kBoXjIOMlrqZ
         EF7KR1EQzI8QA603nGLFgPEGkAAf4qoI18IlWEuV6tKHRKorwXnQ754PJ3AP63OFJ8Cw
         WHeABdeFq9QQn/8gde6sKwHyQHFj1cSDaJA7vYQMMdPylB7EhRrMzLezALuiEfgZ9wAJ
         yDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446488; x=1714051288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JO0ozNsqTpxBsROn3x3SanAr//Rutf3lUig74CS14aw=;
        b=LtSiLJUBHf/A2hidmjU5iKpbhW5cjvdeQ5gzGvCuaQKXLW6xuLh5MX/WMVdWoZd+4o
         9G1tXgKZzxUoYWNJlwq60PYDaNy9rYi56BAiZivfZUkSLJnH8L8LUXYvtDnwFj1q1/K1
         /fa0YSi0YzuXv/4RiCeKIvGgL6K85HeHkhSbIFtOL6w9uzBx9EprP7Yegb79x4z8BMLJ
         Gv0P1aDYtZcoWtie+zfZrgdF609bSJWmdo2u+8mRUWsPy0TBzrVlSWMzeUFlFWYtY1pO
         t+ly9DqkDzb8Rgt+5gXj2R83BeTSOaJ1AZR81+d1PyVBQnAARvfE+vjLA/eH3C5x9rGc
         0WLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEX04qi1fYBny6zcbTwQlDzUiFnYOK6WGtQ3e/mgETYaUf+lAyp1t2ZhEcMxgdL4Kbte0mDagE46Wly+wWY4kfLFNVicgtYYubnVX4f4II
X-Gm-Message-State: AOJu0YybS46Xos4TANgtjh4iV35VcFsR5LDw5Jriqpjoy/1mTQboJuXB
	0gGKpZ8ykP7LJWDzfUoxy8mUkkP/ZCEWBCBkJsKg7nrtR7tMTzGhwxviZwkdA6+L2HMwAx4sl7E
	VQXnNr3pDDzwuZ4XlmQz5m2N7fFKdRnNgA3QQ0A==
X-Google-Smtp-Source: AGHT+IFYxMvNR0jXCZIG1KPR1/WCDVRMgUDvpXntlv1WYC3zuUPdvb9LjVkJtYSDV5Al2WTKHOMIUCYgVBtJncbys6A=
X-Received: by 2002:a05:6e02:219c:b0:36a:3ef4:aa0a with SMTP id
 j28-20020a056e02219c00b0036a3ef4aa0amr3216818ila.24.1713446488311; Thu, 18
 Apr 2024 06:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-12-cleger@rivosinc.com>
In-Reply-To: <20240418124300.1387978-12-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:51:16 +0530
Message-ID: <CAAhSdy3bjKQhRRFLhNtCGNG=f9cj=LHhr0sPWdeFFR9KpC3RVw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] RISC-V: KVM: Allow Zcmop extension for Guest/VM
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_062130_725610_28552F1F 
X-CRM114-Status: GOOD (  13.75  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgNjoxNOKAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHRlbmQgdGhlIEtWTSBJU0EgZXh0ZW5zaW9uIE9O
RV9SRUcgaW50ZXJmYWNlIHRvIGFsbG93IEtWTSB1c2VyIHNwYWNlCj4gdG8gZGV0ZWN0IGFuZCBl
bmFibGUgWmNtb3AgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTS4KPgo+IFNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaCB8IDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5j
ICAgICAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggNTdkYjNmZWE2NzlmLi4wMzY2Mzg5YTBiYWUg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAgLTE3Miw2ICsxNzIsNyBAQCBl
bnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pD
QiwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRCwKPiAgICAgICAgIEtWTV9SSVNDVl9J
U0FfRVhUX1pDRiwKPiArICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAo+ICAgICAgICAg
S1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gaW5kZXgg
YTI3NDdhNmRiZGI2Li43N2EwZDMzN2ZhZWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9vbmVyZWcuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiBAQCAt
NTIsNiArNTIsNyBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJb
XSA9IHsKPiAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQ0IpLAo+ICAgICAgICAgS1ZNX0lTQV9F
WFRfQVJSKFpDRCksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkNGKSwKPiArICAgICAgIEtW
TV9JU0FfRVhUX0FSUihaQ01PUCksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkZBKSwKPiAg
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihaRkgpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpG
SE1JTiksCj4gQEAgLTEzNiw2ICsxMzcsNyBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9p
c2FfZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQo+ICAgICAgICAgY2FzZSBLVk1f
UklTQ1ZfSVNBX0VYVF9aQ0I6Cj4gICAgICAgICBjYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pDRDoK
PiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNGOgo+ICsgICAgICAgY2FzZSBLVk1f
UklTQ1ZfSVNBX0VYVF9aQ01PUDoKPiAgICAgICAgIGNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZB
Ogo+ICAgICAgICAgY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6Cj4gICAgICAgICBjYXNlIEtW
TV9SSVNDVl9JU0FfRVhUX1pGSE1JTjoKPiAtLQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
