Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E34C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbc30dhj2PL1xF0+4o3gU+ONURX7fmDMJ+J5Hifspos=; b=2cn7K3QCjnXPFW
	MuYV/FAGDIbCrIasc+9OkjBCyCzgXhBhBmprGzqwfEGqns32CcsOK+0vS1LR3P+JxhrhaqahECbqY
	2QWYYdG1eOU5mmEDIjJbtAt419PkFBs6clWiO0kRTDq4MKUZAyYzZhbO9NbKsmXLuIthb2VsT3kIl
	kWdsPIeCPLhvzcu3CW1wEmaz237ZjU694C4+o6at6La6Lt6zw3NbW4f7O47gJ19EnOJePb7cw8JZN
	OG/5Ck2HVzhFxzMBBEQFmoX0/LcWfnNscZKjccsLnPAitJ5M4Uu5wewD3Hxk9K5JYDKpuyZmuaqEY
	1zOfT0HUCiebhzqkyvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyF7-0000000GttZ-3oPl;
	Fri, 01 Mar 2024 08:27:45 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfyF4-0000000GtsI-3sGy
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 08:27:44 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3bc21303a35so577135b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 00:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709281661; x=1709886461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u+1gYR9fNMcL6Yz70ujlHI/EnqcOVjeumCs1fZJGDkY=;
        b=GcZen4Te3x2fR0vWE7pfP1ZlmdVWvt8FotcFGR/u07pTQ1QhvOEZjsA5eNKrvUlJ6P
         jWbyDfg6a4pxqM5rLZjEJEmF/EhkM+Uhssezg0L8YrNekEAb8SlqzVLtWoZeY0Y8o3ry
         VG7LaNfApklkx2zkMM6KyFQv9SSESMRS0ILer0JAhdl5KiPrV8eZKoZcA/1LIAKU6SfG
         XX+ZvbEsprqZtcgkzt+4o86eUDaNipQx+dVEaVTaMqt3gRDxdtsFyhy9+5uWXzrQYytb
         o0MjrmPEg5uU6tvcbkmJzn4urm9NsDQvFGQJXTtsODOV9fPAYEQDKnG3Ox75lel5t/dB
         mGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709281661; x=1709886461;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+1gYR9fNMcL6Yz70ujlHI/EnqcOVjeumCs1fZJGDkY=;
        b=nBlEnosa5NudeiyQEuSuFon7779+BkniPcw5Vt/ucYku208qY6cgoioP4698vcBNYv
         E2+TPopwYKe+R4+Hdct3lxWzGYJ9nMI4kITrp+e9zwxXG/DRIVlyiS4YFmhVPjdw3Mtg
         4ro3SKSwJwYrWiGfPYmXKCJEuapiQk8Mjwdt5CDcxAcOZackaReFcEKCH1a5QG5eJ9Mk
         3UuEJOpnXlHzumvFQEMSwBual2XJGkTvk9YSX9DlsxdTBmy+8GqBLieaiWLvjcGWjESr
         79DkewI8l2Sy1q5UIA+wwnxg/MIiu7CsaZZhHRcvoQVNpy1RirIP/ww/HPBmJjQp16DT
         Z9Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW0joIYZGtI7xj4Jkk5RbJLJq8hC7t2PW6vy7KZ8N4YryXyPu8Owb8a2/T132HoQcrwUhysNzNRKPZpN72eHVExYtFcw48aK3w0FDGOYMM+
X-Gm-Message-State: AOJu0YyKMWz2+rvw6v29JsA9PWhqHwGnpTmyGhrh1J0WwcDXBwIvKJOJ
	469BaoUtVdiobQnsCNMlg8Cm98US2aS75id29+AXdEEzgX8AOyz5NBnQFPVqn6w=
X-Google-Smtp-Source: AGHT+IEdyiT1lfztdP7slsQZvQ1H9ibF+1htyyfiSkFgE7uzu3qWKNguG9y0uIjwtsPG01jsOQ/DmQ==
X-Received: by 2002:a05:6808:211a:b0:3c1:aa85:7ab4 with SMTP id r26-20020a056808211a00b003c1aa857ab4mr1284563oiw.3.1709281661587;
        Fri, 01 Mar 2024 00:27:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:1070:febd:b4af:e79a? ([2a01:e0a:999:a3a0:1070:febd:b4af:e79a])
        by smtp.gmail.com with ESMTPSA id r7-20020aa78b87000000b006e13e202914sm2449292pfd.56.2024.03.01.00.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 00:27:40 -0800 (PST)
Message-ID: <8e3003f0-ec27-47d4-9b1f-89de2afbb8b8@rivosinc.com>
Date: Fri, 1 Mar 2024 09:27:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/15] RISC-V: Add FIRMWARE_READ_HI definition
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>,
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-3-atishp@rivosinc.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240229010130.1380926-3-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_002742_985988_E6DAFB1F 
X-CRM114-Status: GOOD (  12.30  )
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

CgpPbiAyOS8wMi8yMDI0IDAyOjAxLCBBdGlzaCBQYXRyYSB3cm90ZToKPiBTQkkgdjIuMCBhZGRl
ZCBhbm90aGVyIGZ1bmN0aW9uIHRvIFNCSSBQTVUgZXh0ZW5zaW9uIHRvIHJlYWQKPiB0aGUgdXBw
ZXIgYml0cyBvZiBhIGNvdW50ZXIgd2l0aCB3aWR0aCBsYXJnZXIgdGhhbiBYTEVOLgo+IAo+IEFk
ZCB0aGUgZGVmaW5pdGlvbiBmb3IgdGhhdCBmdW5jdGlvbi4KPiAKPiBBY2tlZC1ieTogQ29ub3Ig
RG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8
YXRpc2hwQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmku
aCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmgKPiBpbmRleCA2ZTY4ZjhkZmY3NmIuLmVmODMxMWRhZmI5MSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaAo+IEBAIC0xMzEsNiArMTMxLDcgQEAgZW51bSBzYmlfZXh0X3BtdV9maWQgewo+ICAJ
U0JJX0VYVF9QTVVfQ09VTlRFUl9TVEFSVCwKPiAgCVNCSV9FWFRfUE1VX0NPVU5URVJfU1RPUCwK
PiAgCVNCSV9FWFRfUE1VX0NPVU5URVJfRldfUkVBRCwKPiArCVNCSV9FWFRfUE1VX0NPVU5URVJf
RldfUkVBRF9ISSwKPiAgfTsKPiAgCj4gIHVuaW9uIHNiaV9wbXVfY3RyX2luZm8gewoKUmV2aWV3
ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNs
w6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
