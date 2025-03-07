Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C03C282D0
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhqxNxebPAuqqaurNXG2g8ICm7C/OIb9vY59sp5iKTA=; b=rWatH8StzwT3pZ
	OrBFHAFI025Y6uQWlaz6/HiqIJj+DqYOMZ2TKOiCnZlaR5MXrrPN6NggeF9OsWiOEjCx4uT7im4lX
	goJVNbMENnoAMEvM8KqdOpU/NvKodHRGlMRE2u/AiAdyRkXSI/LOkLTW/I7rs+EBdJG3K+yxP4bjn
	4CPJjgGcSx46s4iWTyE+Y11MTUQhIE78BiuvW7K1djQjBsoOHrC5yHQscM/g+VkwM3xYxMvBAFy5o
	nyj27Bs66Xzc7sUThkj6eZRTs+bFQW8ISq0wHgZY7trBLK08wii1TN+xXA1HGn1JVB9YA60JHbLSU
	msGQfHiAy40kylCM4REQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqT4p-0000000DZ9F-3nR0;
	Fri, 07 Mar 2025 08:29:03 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqT4m-0000000DZ8R-3XXW
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:29:02 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-85ae131983eso122164639f.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Mar 2025 00:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1741336139; x=1741940939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YlIiXhwG4KRcbOBdAmDvGTlkxDSVAhUX3csscpKyVg=;
        b=MPf8/LKuwpYxNqNgjJ5Z3Kxten572YEaqZ5MFmLu9SHNVbKR2uO32N1YsXLmzq4XZx
         o9z/khRKVaG7wibYVEp6ItmI5YwlnwITpo9gKrfRAluo++ojXz4micBYWFddpwTgbeYo
         XekxrL8VYO25isLI57BMl53QYUAUCasBhQSNQOCgzhEKHF2KFkcwrGb5vqWFCeT+pk7B
         ekE9yRP/fNv4oTMu+SmiY97O2vzH6OeeDKToH/mGXOmArQzKjNxlzYH9o7wnnL2fWtLM
         HKMMNY5LyfGqoB82iMTcJjd6H+v6Z90E3wODVrXUObDJuUpy6LZ5JY4a/pifpY+xrXPn
         2O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336139; x=1741940939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YlIiXhwG4KRcbOBdAmDvGTlkxDSVAhUX3csscpKyVg=;
        b=lAO83Y7iPwoI2OcNnO/TSNNMbbwVz48krtYc88msBFWAxR52ztGbV/Yoo0jA+jVZiG
         NaH4nqvHZ1p5A4XzFUd7zeyTSwJYSwg4p9RzrWNubEKkSXw5SHoD8/iSninWqEVg8bXI
         Oe499eMVRUXtD6kkiiae+RFga3Q0js0ghDMno7WD32HYKr2CoLWb3IqHea/xr3HNY5V4
         e7iPFVqFnDjvwB6Td1c+LUJdOXaFWqPlbTwQhfKN9vIkSHFBkCwGXc0uC4hud1KZbOR/
         xr0RATDmEx3uaBHjuRgoP5GUU3bx2Fn+axOllSlzelvg6mglgZqsXLoZSEKtp2KUaibt
         jcyg==
X-Forwarded-Encrypted: i=1; AJvYcCWi2En2KcIIsj70GNmlYVKq/13pJE3x2GHeeivJLIec3ZzEsaaSIn9VGgm/8FNFvKQJAUNv+A7JQY6kDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLz9AdtXprLHK6N636Jmv/uAcj1R8iEVMQvBoiqrcFCvIHiwZB
	rVQWVQnHrQBV0CJF4/hZ3xs6uxHSMy6MKTRh13tA4UXokeytz+8V+8dwooBJLOl97+kKrWggwNn
	pEf/UG92YBZCePq2Yg0zMvb5YwQ6oH3VbPjOjpw==
X-Gm-Gg: ASbGncvjj815UO3p4P/Pavoq8ppjSaZ/HNCvOWejJSF3Y4cNHMm7M1W5Jka08YFgijz
	Pbhx91hAFSJwHUZDpX47b9BoJwheXWsgczeT2AtGyrozL0vUJP9oly3YpqfS7m+WUD7tu/oB5ii
	xmNzwwUZfTtLdF/C6s/sU2UR0fs/0=
X-Google-Smtp-Source: AGHT+IHpyge1YXB1VBykLP/dh9ft8HFAB3zzw6CmKWnhV8/XYcR00xSa4YW+S5Z3jF04shZ9TO0vf5OuS0Vy70VC954=
X-Received: by 2002:a05:6e02:16c7:b0:3d0:239a:c46a with SMTP id
 e9e14a558f8ab-3d44194816cmr30189715ab.9.1741336139186; Fri, 07 Mar 2025
 00:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
In-Reply-To: <20250303-kvm_pmu_improve-v2-0-41d177e45929@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Mar 2025 13:58:46 +0530
X-Gm-Features: AQ5f1JqfLRDl2sXghMrs9tGiGCXrhEWfy1IvZjbEz2be6tiJtFVbpcg_wKAhY44
Message-ID: <CAAhSdy3KncYJhPAa20oH=bB1Zi5-=sD8m69OYFS451q3_EMiEA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] RISC-V KVM PMU fix and selftest improvement
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_002901_006668_32BDCDA3 
X-CRM114-Status: GOOD (  12.92  )
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

T24gVHVlLCBNYXIgNCwgMjAyNSBhdCA0OjIz4oCvQU0gQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgYWRkcyBhIGZpeCBmb3IgS1ZNIFBNVSBj
b2RlIGFuZCBpbXByb3ZlcyB0aGUgcG11IHNlbGZ0ZXN0Cj4gYnkgYWxsb3dpbmcgZ2VuZXJhdGlu
ZyBwcmVjaXNlIG51bWJlciBvZiBpbnRlcnJ1cHRzLiBJdCBhbHNvIHByb3ZpZGVkCj4gYW5vdGhl
ciBhZGRpdGlvbmFsIG9wdGlvbiB0byB0aGUgb3ZlcmZsb3cgdGVzdCB0aGF0IGFsbG93cyB1c2Vy
IHRvCj4gZ2VuZXJhdGUgY3VzdG9tIG51bWJlciBvZiBMQ09GSSBpbnRlcnJ1cHRzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MjoKPiAtIEluaXRpYWxpemVkIHRoZSBsb2NhbCBvdmVyZmxvdyBpcnEgdmFyaWFi
bGUgdG8gMCBpbmRpY2F0ZSB0aGF0IGl0J3Mgbm90IGEKPiAgIGFsbG93ZWQgdmFsdWUuCj4gLSBN
b3ZlZCB0aGUgaW50cm9kdWN0aW9uIG9mIGFyZ3VtZW50IG9wdGlvbiBgbmAgdG8gdGhlIGxhc3Qg
cGF0Y2guCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMjI2
LWt2bV9wbXVfaW1wcm92ZS12MS0wLTc0YzA1OGMyYmY2ZEByaXZvc2luYy5jb20KPgo+IC0tLQo+
IEF0aXNoIFBhdHJhICg0KToKPiAgICAgICBSSVNDLVY6IEtWTTogRGlzYWJsZSB0aGUga2VybmVs
IHBlcmYgY291bnRlciBkdXJpbmcgY29uZmlndXJlCj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRl
c3RzOiBEbyBub3Qgc3RhcnQgdGhlIGNvdW50ZXIgaW4gdGhlIG92ZXJmbG93IGhhbmRsZXIKPiAg
ICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IENoYW5nZSBjb21tYW5kIGxpbmUgb3B0aW9uCj4g
ICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBbGxvdyBudW1iZXIgb2YgaW50ZXJydXB0cyB0
byBiZSBjb25maWd1cmFibGUKClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNi4xNS4KClRo
YW5rcywKQW51cAoKPgo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9zYmlf
cG11X3Rlc3QuYyB8IDgxICsrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDU3IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0
OiAwYWQyNTA3ZDVkOTNmMzk2MTlmYzQyMzcyYzM0N2Q2MDA2YjY0MzE5Cj4gY2hhbmdlLWlkOiAy
MDI1MDIyNS1rdm1fcG11X2ltcHJvdmUtZmZmZDAzOGIyNDA0Cj4gLS0KPiBSZWdhcmRzLAo+IEF0
aXNoIHBhdHJhCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
