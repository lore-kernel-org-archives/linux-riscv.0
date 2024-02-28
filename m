Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE49C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 18:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=491PhnFhbLmFew/E5ZY4cC19bH5du2efs05DS1zQKRU=; b=GXxPyFe+ZUUv9y
	fkDHoiNqvlQYTz9OtcdrcAl5ZDCzApsQt0LW2p7qRGWS8hkBrykWllESKZ0JDEmIOdj+03iv0IXdo
	8nJaeIa7bro86ORab4Bz3s96kKR1xEaeqwCdfZyMuKxxrefmwxptOVf/qiREMrbdblQQzJh6LsSRk
	sEO0t148BJdmxFsB6xejm8ZKHo6KYB40ikJeuLDsw2L8rbSNLe0ZK9/RjP8lH7qsCnZNOqj8CIRcV
	1fxVPwQ9TeGIRiZi76HFD/hBCHmvniEFUZx10t/BR/60Yr7ajGjzAXnAFRlAWyAbOyxQ4q4BnAgr6
	vzGDOtTnCt+MTscPosLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOYS-0000000AUTH-0sIs;
	Wed, 28 Feb 2024 18:21:20 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfOYP-0000000AUSZ-2dOj
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 18:21:19 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7c40863de70so347937339f.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 10:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709144474; x=1709749274; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08d0NHfoqroa1V4eYj1iLjIHMDy0L3o0VRrTUb12x9c=;
        b=JXabnCGBxcPIrQ1W+ViGerX9WE8ijVM2y1blsTTWg4leapB0wzWTIviZ+thg2OFh2C
         RZ/Xf8up6DN4qMjK/3lSogGdhqdIba6W9yo3rMY0Mn73kLuPeYYaCeH4yqJXjvCzXrtg
         ag4rAuzyzE/g/U3bPq2y0IvvUc2IdEi2HJvBzPL1N4HZPT8+boTgPwwfGRHTTza/eVjf
         ByX7JQAxdY8tBy9kjfatj2oZXa/am63m+Eqm0Gm8y/uIoA3ujdxDq9RWfGcWRCUmbJ9Y
         MJZR5oQz3Rmw82r+G/L+QGcheKyNf+HOz5ZU5QEgILjNUIFs5vW1iOZQNShPITy2fiuM
         p6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709144474; x=1709749274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08d0NHfoqroa1V4eYj1iLjIHMDy0L3o0VRrTUb12x9c=;
        b=pQQZ/TNQOH1h9zla4kEqNcccfm3MSEB13myD9qnHS4rfOXOrD5veKGik9jhEDcIm+B
         Fij71K+kGUeUhex9th7bt7tsWP9CrmGLaSTXdGxBp1NwfiFWybNjHlmkK8K9zb/H8WC5
         x0Nr9h3eaSzS8I/Pgp/j+0KEzmXHx9P3HBltEtzCx9xyE/Ab7HL33psqtRQ4Y+shd2Gr
         XHop39AQNlPEBBXx7RdcjyH/koOA46Le0YuOGTat8prP737VBj7goPBF78HOvfokxUZ/
         CG6H64SablF3C7gUm6CnhrAmak6e3TkjU0PNh7nJ1+XY+UqgpwiVk/H/MQTTbEKq45NU
         Zi1g==
X-Forwarded-Encrypted: i=1; AJvYcCXsuzebs12II5XzM8idIZrVEGQWAVTRTIkpP4gptOzcUqV/6yLqaQsuGxbks6Rus4LPQyEthGWMVUeC7slE+eIjnQseuayN6rY0gBLi59IO
X-Gm-Message-State: AOJu0YzCS+XzzjJLsd7lkkAr0xbnGb1qjVZitA5L3+ZMEt6FkWCbC1SQ
	96WhS39rXkmEZ7s//eXDPRqZQyL2D+57TkNO/sbLKOGVqZmh2ZQQ1YYxfHX1ODM=
X-Google-Smtp-Source: AGHT+IHiR99D2BpM734RwDyOoiFWYbAyNElJ0/muIImLUYBA5CvXwg5wO0mpbjv4vAMqzrgZg+2hhg==
X-Received: by 2002:a92:c00c:0:b0:365:c5c:dfa7 with SMTP id q12-20020a92c00c000000b003650c5cdfa7mr67118ild.1.1709144473768;
        Wed, 28 Feb 2024 10:21:13 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.201])
        by smtp.gmail.com with ESMTPSA id ck13-20020a056e02370d00b00364372c5b5asm2956326ilb.15.2024.02.28.10.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 10:21:13 -0800 (PST)
Message-ID: <74d7adee-8293-4fad-82c3-f4458b2e3960@sifive.com>
Date: Wed, 28 Feb 2024 12:21:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: Fix text patching when IPI are used
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrea Parri <andrea@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20240228175149.162646-1-alexghiti@rivosinc.com>
 <20240228175149.162646-3-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240228175149.162646-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_102117_793460_B034F9A9 
X-CRM114-Status: GOOD (  24.78  )
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

SGkgQWxleCwKCk9uIDIwMjQtMDItMjggMTE6NTEgQU0sIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToK
PiBGb3Igbm93LCB3ZSB1c2Ugc3RvcF9tYWNoaW5lKCkgdG8gcGF0Y2ggdGhlIHRleHQgYW5kIHdo
ZW4gd2UgdXNlIElQSXMgZm9yCj4gcmVtb3RlIGljYWNoZSBmbHVzaGVzICh3aGljaCBpcyBlbWl0
dGVkIGluIHBhdGNoX3RleHRfbm9zeW5jKCkpLCB0aGUgc3lzdGVtCj4gaGFuZ3MuCj4gCj4gU28g
aW5zdGVhZCwgbWFrZSBzdXJlIGV2ZXJ5IGNwdSBleGVjdXRlcyB0aGUgc3RvcF9tYWNoaW5lKCkg
cGF0Y2hpbmcKPiBmdW5jdGlvbiBhbmQgZW1pdCBhIGxvY2FsIGljYWNoZSBmbHVzaCB0aGVyZS4K
PiAKPiBDby1kZXZlbG9wZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhdGNoLmggfCAgMSArCj4gIGFyY2gvcmlzY3Yv
a2VybmVsL2Z0cmFjZS5jICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYyAgICAgIHwgMTggKysrKysrKysrLS0tLS0t
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGF0Y2guaAo+IGluZGV4IGU4OGI1MmQzOWVhYy4uOWY1ZDZlMTRjNDA1
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaAo+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaAo+IEBAIC02LDYgKzYsNyBAQAo+ICAjaWZuZGVm
IF9BU01fUklTQ1ZfUEFUQ0hfSAo+ICAjZGVmaW5lIF9BU01fUklTQ1ZfUEFUQ0hfSAo+ICAKPiAr
aW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90
IGxlbik7Cj4gIGludCBwYXRjaF90ZXh0X25vc3luYyh2b2lkICphZGRyLCBjb25zdCB2b2lkICpp
bnNucywgc2l6ZV90IGxlbik7Cj4gIGludCBwYXRjaF90ZXh0X3NldF9ub3N5bmModm9pZCAqYWRk
ciwgdTggYywgc2l6ZV90IGxlbik7Cj4gIGludCBwYXRjaF90ZXh0KHZvaWQgKmFkZHIsIHUzMiAq
aW5zbnMsIGludCBuaW5zbnMpOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJh
Y2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4gaW5kZXggZjVhYTI0ZDllMWMxLi41
NjU0OTY2YzRlN2QgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZnRyYWNlLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwo+IEBAIC04LDYgKzgsNyBAQAo+ICAjaW5j
bHVkZSA8bGludXgvZnRyYWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9tZW1vcnkuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3N0b3BfbWFjaGluZS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiAgI2luY2x1ZGUgPGFzbS9wYXRjaC5o
Pgo+ICAKPiBAQCAtNzUsOCArNzYsNyBAQCBzdGF0aWMgaW50IF9fZnRyYWNlX21vZGlmeV9jYWxs
KHVuc2lnbmVkIGxvbmcgaG9va19wb3MsIHVuc2lnbmVkIGxvbmcgdGFyZ2V0LAo+ICAJCW1ha2Vf
Y2FsbF90MChob29rX3BvcywgdGFyZ2V0LCBjYWxsKTsKPiAgCj4gIAkvKiBSZXBsYWNlIHRoZSBh
dWlwYy1qYWxyIHBhaXIgYXQgb25jZS4gUmV0dXJuIC1FUEVSTSBvbiB3cml0ZSBlcnJvci4gKi8K
PiAtCWlmIChwYXRjaF90ZXh0X25vc3luYwo+IC0JICAgICgodm9pZCAqKWhvb2tfcG9zLCBlbmFi
bGUgPyBjYWxsIDogbm9wcywgTUNPVU5UX0lOU05fU0laRSkpCj4gKwlpZiAocGF0Y2hfaW5zbl93
cml0ZSgodm9pZCAqKWhvb2tfcG9zLCBlbmFibGUgPyBjYWxsIDogbm9wcywgTUNPVU5UX0lOU05f
U0laRSkpCj4gIAkJcmV0dXJuIC1FUEVSTTsKPiAgCj4gIAlyZXR1cm4gMDsKPiBAQCAtODgsNyAr
ODgsNyBAQCBpbnQgZnRyYWNlX21ha2VfY2FsbChzdHJ1Y3QgZHluX2Z0cmFjZSAqcmVjLCB1bnNp
Z25lZCBsb25nIGFkZHIpCj4gIAo+ICAJbWFrZV9jYWxsX3QwKHJlYy0+aXAsIGFkZHIsIGNhbGwp
Owo+ICAKPiAtCWlmIChwYXRjaF90ZXh0X25vc3luYygodm9pZCAqKXJlYy0+aXAsIGNhbGwsIE1D
T1VOVF9JTlNOX1NJWkUpKQo+ICsJaWYgKHBhdGNoX2luc25fd3JpdGUoKHZvaWQgKilyZWMtPmlw
LCBjYWxsLCBNQ09VTlRfSU5TTl9TSVpFKSkKPiAgCQlyZXR1cm4gLUVQRVJNOwo+ICAKPiAgCXJl
dHVybiAwOwo+IEBAIC05OSw3ICs5OSw3IEBAIGludCBmdHJhY2VfbWFrZV9ub3Aoc3RydWN0IG1v
ZHVsZSAqbW9kLCBzdHJ1Y3QgZHluX2Z0cmFjZSAqcmVjLAo+ICB7Cj4gIAl1bnNpZ25lZCBpbnQg
bm9wc1syXSA9IHtOT1A0LCBOT1A0fTsKPiAgCj4gLQlpZiAocGF0Y2hfdGV4dF9ub3N5bmMoKHZv
aWQgKilyZWMtPmlwLCBub3BzLCBNQ09VTlRfSU5TTl9TSVpFKSkKPiArCWlmIChwYXRjaF9pbnNu
X3dyaXRlKCh2b2lkICopcmVjLT5pcCwgbm9wcywgTUNPVU5UX0lOU05fU0laRSkpCj4gIAkJcmV0
dXJuIC1FUEVSTTsKPiAgCj4gIAlyZXR1cm4gMDsKPiBAQCAtMTM0LDYgKzEzNCw0MCBAQCBpbnQg
ZnRyYWNlX3VwZGF0ZV9mdHJhY2VfZnVuYyhmdHJhY2VfZnVuY190IGZ1bmMpCj4gIAo+ICAJcmV0
dXJuIHJldDsKPiAgfQo+ICsKPiArc3RydWN0IGZ0cmFjZV9tb2RpZnlfcGFyYW0gewo+ICsJaW50
IGNvbW1hbmQ7Cj4gKwlhdG9taWNfdCBjcHVfY291bnQ7Cj4gK307Cj4gKwo+ICtzdGF0aWMgaW50
IF9fZnRyYWNlX21vZGlmeV9jb2RlKHZvaWQgKmRhdGEpCj4gK3sKPiArCXN0cnVjdCBmdHJhY2Vf
bW9kaWZ5X3BhcmFtICpwYXJhbSA9IGRhdGE7Cj4gKwo+ICsJaWYgKGF0b21pY19pbmNfcmV0dXJu
KCZwYXJhbS0+Y3B1X2NvdW50KSA9PSBudW1fb25saW5lX2NwdXMoKSkgewo+ICsJCWZ0cmFjZV9t
b2RpZnlfYWxsX2NvZGUocGFyYW0tPmNvbW1hbmQpOwo+ICsJCS8qCj4gKwkJICogTWFrZSBzdXJl
IHRoZSBwYXRjaGluZyBzdG9yZSBpcyBlZmZlY3RpdmUgKmJlZm9yZSogd2UKPiArCQkgKiBpbmNy
ZW1lbnQgdGhlIGNvdW50ZXIgd2hpY2ggcmVsZWFzZXMgYWxsIHdhaXRpbmcgY3B1cwo+ICsJCSAq
IGJ5IHVzaW5nIHRoZSByZWxlYXNlIHZlcnNpb24gb2YgYXRvbWljIGluY3JlbWVudC4KPiArCQkg
Ki8KPiArCQlhdG9taWNfaW5jX3JldHVybl9yZWxlYXNlKCZwYXJhbS0+Y3B1X2NvdW50KTsKPiAr
CX0gZWxzZSB7Cj4gKwkJd2hpbGUgKGF0b21pY19yZWFkKCZwYXJhbS0+Y3B1X2NvdW50KSA8PSBu
dW1fb25saW5lX2NwdXMoKSkKPiArCQkJY3B1X3JlbGF4KCk7Cj4gKwl9Cj4gKwo+ICsJbG9jYWxf
Zmx1c2hfaWNhY2hlX2FsbCgpOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICt2b2lkIGFy
Y2hfZnRyYWNlX3VwZGF0ZV9jb2RlKGludCBjb21tYW5kKQo+ICt7Cj4gKwlzdHJ1Y3QgZnRyYWNl
X21vZGlmeV9wYXJhbSBwYXJhbSA9IHsgY29tbWFuZCwgQVRPTUlDX0lOSVQoMCkgfTsKPiArCj4g
KwlzdG9wX21hY2hpbmUoX19mdHJhY2VfbW9kaWZ5X2NvZGUsICZwYXJhbSwgY3B1X29ubGluZV9t
YXNrKTsKPiArfQo+ICAjZW5kaWYKPiAgCj4gICNpZmRlZiBDT05GSUdfRFlOQU1JQ19GVFJBQ0Vf
V0lUSF9SRUdTCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gaW5kZXggMGI1YzE2ZGZlM2Y0Li44MmQ4NTA4Yzc2NWIg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3BhdGNoLmMKPiBAQCAtMTg4LDcgKzE4OCw3IEBAIGludCBwYXRjaF90ZXh0X3Nl
dF9ub3N5bmModm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbikKPiAgfQo+ICBOT0tQUk9CRV9T
WU1CT0wocGF0Y2hfdGV4dF9zZXRfbm9zeW5jKTsKPiAgCj4gLXN0YXRpYyBpbnQgcGF0Y2hfaW5z
bl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQo+ICtpbnQg
cGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVu
KQo+ICB7Cj4gIAlzaXplX3QgcGF0Y2hlZCA9IDA7Cj4gIAlzaXplX3Qgc2l6ZTsKPiBAQCAtMjEx
LDExICsyMTEsOSBAQCBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zbl93cml0ZSk7Cj4gIAo+ICBp
bnQgcGF0Y2hfdGV4dF9ub3N5bmModm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbnMsIHNpemVf
dCBsZW4pCj4gIHsKPiAtCXUzMiAqdHAgPSBhZGRyOwo+ICAJaW50IHJldDsKPiAgCj4gLQlyZXQg
PSBwYXRjaF9pbnNuX3dyaXRlKHRwLCBpbnNucywgbGVuKTsKPiAtCj4gKwlyZXQgPSBwYXRjaF9p
bnNuX3dyaXRlKGFkZHIsIGluc25zLCBsZW4pOwo+ICAJaWYgKCFyZXQpCj4gIAkJZmx1c2hfaWNh
Y2hlX3JhbmdlKCh1aW50cHRyX3QpIHRwLCAodWludHB0cl90KSB0cCArIGxlbik7CgpUaGlzIG9u
bHkgaGFwcGVucyB0byBjb21waWxlIGJlY2F1c2UgZmx1c2hfaWNhY2hlX3JhbmdlKCkgaXMgYSBt
YWNybyB0aGF0Cmlnbm9yZXMgaXRzIHBhcmFtZXRlcnMuIFlvdSBjb3VsZCByZXBsYWNlIHRwIHdp
dGggYWRkciBpbiB0aGlzIGxpbmUgYXMgd2VsbCwgYnV0CnRoYXQgc2VlbXMgbGlrZSBtb3JlIG9m
IGEgY29zbWV0aWMgY2hhbmdlIGFuZCBzaG91bGQgYmUgYSBzZXBhcmF0ZSBwYXRjaCAobGlrZQpp
biBbMV0gd2hpY2ggY292ZXJzIGJvdGggcmVsYXRlZCBmdW5jdGlvbnMpIGlmIHlvdSByZXNwaW4g
dGhpcy4KClJlZ2FyZHMsClNhbXVlbAoKWzFdOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1yaXNjdi8yMDI0MDIxMjAyNTUyOS4xOTcxODc2LTgtc2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNv
bS8KCj4gIAo+IEBAIC0yMzIsMTUgKzIzMCwyMSBAQCBzdGF0aWMgaW50IHBhdGNoX3RleHRfY2Io
dm9pZCAqZGF0YSkKPiAgCWlmIChhdG9taWNfaW5jX3JldHVybigmcGF0Y2gtPmNwdV9jb3VudCkg
PT0gbnVtX29ubGluZV9jcHVzKCkpIHsKPiAgCQlmb3IgKGkgPSAwOyByZXQgPT0gMCAmJiBpIDwg
cGF0Y2gtPm5pbnNuczsgaSsrKSB7Cj4gIAkJCWxlbiA9IEdFVF9JTlNOX0xFTkdUSChwYXRjaC0+
aW5zbnNbaV0pOwo+IC0JCQlyZXQgPSBwYXRjaF90ZXh0X25vc3luYyhwYXRjaC0+YWRkciArIGkg
KiBsZW4sCj4gLQkJCQkJCSZwYXRjaC0+aW5zbnNbaV0sIGxlbik7Cj4gKwkJCXJldCA9IHBhdGNo
X2luc25fd3JpdGUocGF0Y2gtPmFkZHIgKyBpICogbGVuLCAmcGF0Y2gtPmluc25zW2ldLCBsZW4p
Owo+ICAJCX0KPiAtCQlhdG9taWNfaW5jKCZwYXRjaC0+Y3B1X2NvdW50KTsKPiArCQkvKgo+ICsJ
CSAqIE1ha2Ugc3VyZSB0aGUgcGF0Y2hpbmcgc3RvcmUgaXMgZWZmZWN0aXZlICpiZWZvcmUqIHdl
Cj4gKwkJICogaW5jcmVtZW50IHRoZSBjb3VudGVyIHdoaWNoIHJlbGVhc2VzIGFsbCB3YWl0aW5n
IGNwdXMKPiArCQkgKiBieSB1c2luZyB0aGUgcmVsZWFzZSB2ZXJzaW9uIG9mIGF0b21pYyBpbmNy
ZW1lbnQuCj4gKwkJICovCj4gKwkJYXRvbWljX2luY19yZXR1cm5fcmVsZWFzZSgmcGF0Y2gtPmNw
dV9jb3VudCk7Cj4gIAl9IGVsc2Ugewo+ICAJCXdoaWxlIChhdG9taWNfcmVhZCgmcGF0Y2gtPmNw
dV9jb3VudCkgPD0gbnVtX29ubGluZV9jcHVzKCkpCj4gIAkJCWNwdV9yZWxheCgpOwo+ICAJfQo+
ICAKPiArCWxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwoKTsKPiArCj4gIAlyZXR1cm4gcmV0Owo+ICB9
Cj4gIE5PS1BST0JFX1NZTUJPTChwYXRjaF90ZXh0X2NiKTsKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
