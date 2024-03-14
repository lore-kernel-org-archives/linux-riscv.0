Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBBFC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OERkhR+k7zS5/9dQ70+y1Ja1zthg1qYCB+jPzAuhzgo=; b=ML52uFzx71987r
	oww66XaiTEtSWTWTO6tVDriMtQszvGla1kX0+HlYq6IY6KBkfJe4GprKBPXilC7Onf8OsheR/RHFE
	wzGCtfmNEqw/i4KS2lJLGizVKfd+BpMivKRtX11wbZGdIHVODQWxsmPhdly3Ww1yn5KnuvX0uJ9vT
	2enHSPU6Ydir81goH1Fsk5D6z4EPQ7gPaECXnphdUWXwXokQQTjfUkIlEINQiXn3s5WS6NLlGPrz+
	5xXgosyNrPpeuZSLf+eUQM+RnCfiVxzv4tQUMkdZ3re7G84+xe4OmeKtF09zPiRZYOvAEVBiVXMsr
	8ZIEOVZA4SlaMgTEqKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmgO-0000000Elcj-0Klj;
	Thu, 14 Mar 2024 15:07:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmgL-0000000ElW7-3oKu
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 15:07:47 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33e9115d501so400865f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 08:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710428862; x=1711033662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RSGt8d54vBG5b4ebKCKe8b/ADp8mnZQZPrMr1mNW5EU=;
        b=Ch0nEfycXw6XqY9tz15s8zAMm697tG6Cvkmd3zJuW9dm0Yz6T71OVlVU5inmrrXszQ
         RUO1Up5jMrNMAe1C7IanumybIehccspuXPHOBSAm49E8P5bWthvrm6W7OvqjzrfwLk92
         rtjR0bOfsUk0vN0VV2P/jkP0z7nKzV0y0aEaseLiFJOn6CTrQQwY8kYZ2XFtdVN5S1C4
         /znp71NYWZRF2sqm+4rn1iwBF4CoELnOrX/onFklwn4Y32+ex49NT/AVfKqRgcGXzswM
         iY7gO9VYN1vszRSX65hEL++wqd3ngNNGPvp8xLp2xIQc+jpyAJhKhJkgNo2Xf0K8mGF/
         1E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710428862; x=1711033662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RSGt8d54vBG5b4ebKCKe8b/ADp8mnZQZPrMr1mNW5EU=;
        b=Zdu9jk2DgQwJIF4xfAA33BmvlSGbp916/SLab43KvKBiIYlgx3OeseECWcjxKe4AnB
         SvmREGoA2uezWZ3CUQLGmNuG+33b6a8TpefVS2pygdznbZ00MgNsspOJC3AyGs6zJtY2
         zt0ht2SHLnqyk9YDRhG4Ng4oOpap5hDY223oqcjqw6wbdirDtDmgqRv/Il1EHW+Ne4y0
         W4fzwgRV/QIwB6xf1a3ry6J48b5sBGNTeE0fKDj9e0RSTKua/q01YSo/zxPES2eUmOn3
         9SELp+VicgOEhghjI8aFxc/HMdWxJcjvnqitBxczkKNwfMhCyseqE7YTKcOgi02l1q8q
         VWEA==
X-Forwarded-Encrypted: i=1; AJvYcCWLWc4h1f38L4EusBGP2YtBurcklI1s76eEQF36P1xtW9RpM2teH4Pqno0UDbo6umPpFUKwERG8asHuclDfz0n4UUsxcIY8T8R/BuDvPNUl
X-Gm-Message-State: AOJu0YydcOxLCfIkWTrqKXJZlzRthDQNmd3HDgZ7zRUnKzomPAJwkVbL
	ZtNoToffMthd2X+zGewXjDYRXeMqmmkpMx2RjXxY2nRTMCr0AeSOptcRSQJFN5Q=
X-Google-Smtp-Source: AGHT+IFDQKRjZrpPiyPH9En6yKYOsxwkXUpVRS8DN85v9BJggdoYNPwGKxUjtK9ltgJjq2/qDvQf5w==
X-Received: by 2002:a05:600c:4e03:b0:413:4299:ecd7 with SMTP id b3-20020a05600c4e0300b004134299ecd7mr1659471wmq.0.1710428862330;
        Thu, 14 Mar 2024 08:07:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:e0ee:a1ff:5362:7e06? ([2a01:e0a:999:a3a0:e0ee:a1ff:5362:7e06])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b00412ee7d65a6sm2695473wmb.6.2024.03.14.08.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:07:41 -0700 (PDT)
Message-ID: <348f67d9-7520-4cba-89a8-c10ec2bf8c61@rivosinc.com>
Date: Thu, 14 Mar 2024 16:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2, 3/7] riscv: cpufeature: call match_isa_ext() for
 single-letter extensions
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: greentime.hu@sifive.com, conor.dooley@microchip.com,
 guoren@linux.alibaba.com, bjorn@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>
References: <20240314142542.19957-1-andy.chiu@sifive.com>
 <20240314142542.19957-4-andy.chiu@sifive.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240314142542.19957-4-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_080746_071234_DAF68EE6 
X-CRM114-Status: GOOD (  15.71  )
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

CgpPbiAxNC8wMy8yMDI0IDE1OjI1LCBBbmR5IENoaXUgd3JvdGU6Cj4gU2luZ2xlLWxldHRlciBl
eHRlbnNpb25zIG1heSBhbHNvIGltcGx5IG11bHRpcGxlIHN1YmV4dGVuc2lvbnMuIEZvcgo+IGV4
YW1wbGUsIFZlY3RvciBleHRlbnNpb24gaW1wbGllcyB6dmU2NGQsIGFuZCB6dmU2NGQgaW1wbGll
cyB6dmU2NGYuCj4gCj4gRXh0ZW5zaW9uIHBhcnNpbmcgZm9yICJyaXNjdixpc2EtZXh0ZW5zaW9u
cyIgaGFzIHRoZSBhYmlsaXR5IHRvIHJlc29sdmUKPiB0aGUgZGVwZW5kZW5jeSBieSBjYWxsaW5n
IG1hdGNoX2lzYV9leHQoKS4gVGhpcyBwYXRjaCBtYWtlcyBkZXByZWNhdGVkCj4gcGFyc2VyIGNh
bGwgdGhlIHNhbWUgZnVuY3Rpb24gZm9yIHNpbmdsZSBsZXR0ZXIgZXh0ZW5zaW9ucy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA3ICsrKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCj4gaW5kZXggMzZlZmM4ZTc3YWNlLi5kODM2MjQxYTFmMTEgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gQEAgLTQ3MCw2ICs0NzAsMTAgQEAgc3RhdGljIHZvaWQgX19pbml0IHJpc2N2
X3BhcnNlX2lzYV9zdHJpbmcodW5zaWduZWQgbG9uZyAqdGhpc19od2NhcCwgc3RydWN0IHJpc2MK
PiAgCj4gIAkJaWYgKHVubGlrZWx5KGV4dF9lcnIpKQo+ICAJCQljb250aW51ZTsKPiArCj4gKwkJ
Zm9yIChpbnQgaSA9IDA7IGkgPCByaXNjdl9pc2FfZXh0X2NvdW50OyBpKyspCj4gKwkJCW1hdGNo
X2lzYV9leHQoJnJpc2N2X2lzYV9leHRbaV0sIGV4dCwgZXh0X2VuZCwgaXNhaW5mbyk7Cj4gKwo+
ICAJCWlmICghZXh0X2xvbmcpIHsKPiAgCQkJaW50IG5yID0gdG9sb3dlcigqZXh0KSAtICdhJzsK
PiAgCj4gQEAgLTQ3Nyw5ICs0ODEsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmlzY3ZfcGFyc2Vf
aXNhX3N0cmluZyh1bnNpZ25lZCBsb25nICp0aGlzX2h3Y2FwLCBzdHJ1Y3QgcmlzYwo+ICAJCQkJ
KnRoaXNfaHdjYXAgfD0gaXNhMmh3Y2FwW25yXTsKPiAgCQkJCXNldF9iaXQobnIsIGlzYWluZm8t
PmlzYSk7CgpIaSBBbmR5LAoKRldJVSwgdGhpcyBzZXRfYml0KCkgd2lsbCBhbHNvIGJlIGNhbGxl
ZCBpbiBtYXRjaF9pc2FfZXh0KCkgc2luY2UgaXQKc2V0cyBib3RoIHRoZSAic3ViZXh0ZW5zaW9u
cyIgYml0cyBhcyB3ZWxsIGFzIHRoZSAibWFpbiIgZXh0ZW5zaW9uIGJpdC4KU28gYmFzaWNhbGx5
LCB0aGlzIGxhc3QgImlmICghZXh0X2xvbmcpIiBjYW4gb25seSBzZXQgdGhlIGh3Y2FwIGJpdHMg
YW5kCnlvdSBjYW4gcmVtb3ZlIHRoZSBzZXRfYml0KCkgbm93IHRoYXQgbWF0Y2hfaXNhX2V4dCBp
cyBjYWxsZWQKdW5jb25kaXRpb25hbGx5IChhdCBsZWFzdCBJIHRoaW5rIHNvKS4KClRoYW5rcywK
CkNsw6ltZW50Cgo+ICAJCQl9Cj4gLQkJfSBlbHNlIHsKPiAtCQkJZm9yIChpbnQgaSA9IDA7IGkg
PCByaXNjdl9pc2FfZXh0X2NvdW50OyBpKyspCj4gLQkJCQltYXRjaF9pc2FfZXh0KCZyaXNjdl9p
c2FfZXh0W2ldLCBleHQsIGV4dF9lbmQsIGlzYWluZm8pOwo+ICAJCX0KPiAgCX0KPiAgfQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
