Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE50CCFA13
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 02:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veXRofcprZLPJdqSMx508+Yq5im26YE3oCRz1O2qGDI=; b=i0eWN37xRTzzjX
	uewV+dNc3826o58PuE5rhVaR66r0Fl7cHfdZH8rbbznRqbSs2dRXiYyGrr9AW2v4NAsiFAiGdfEGl
	zNDadDAIaivbWn33Dl052Ewt6f2TYjAJ0Ruz9vGcAyXZoe/njMj2XHn53FoB2qXlXTH/c//OB3pwx
	uvTkRkI36J5WKLEq6N07+2CV+EHt3Dex984rT8pvHbv8aWDeISsSj6xlrJI/q15qRKAI/jlC9+roG
	6IqA06Oh2IHiGg5gjzE1ZMT9wOxfJORGQWrgrrOK743hEncuYA47YAm9ArwxUVFMK+FdQO4Loxzgs
	F+EzsPpf9STjyQ2RpCaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCR3-0000000GaHg-1RsR;
	Fri, 07 Nov 2025 02:42:45 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHCR0-0000000GaGd-1g9l
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 02:42:44 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7c284d4867eso76366a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Nov 2025 18:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762483357; x=1763088157; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta4pHybjsRd5oAb5H49GhrRgg2InYaGc8HOWjDuWw8Q=;
        b=Jo4DktC7AN9cffe2cTWsZaiIauzEcLPplykUvEy1V8fkk9JRsTrWtWY/frhQDF4eLG
         f2RmQuG03EW17y0FQV3VUTwqXFL/4BAPsIccM+5kKTqsuxeMWuv47fMFGXetnFWPSfCa
         xR+bI8q1S2sgjdJ3lBMkcu7f9pzD5IrdsY91YGZo1Jwm+1fF5dXKeJZJJKGiN/0pVft0
         cIhYxVHkfcQXvIwpFyo5VG1gqzWTh7bh2KjSODhLofpZ+CGGWafWwJDCcXzsTSZL8SR5
         3iVA9mvoVlpa+E/33HDYJT0mE8yJ4TD5JFK3a6wjXfV8Y6ZjJC4TqIWBDq/ia8EWl2dE
         pYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762483357; x=1763088157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ta4pHybjsRd5oAb5H49GhrRgg2InYaGc8HOWjDuWw8Q=;
        b=UIgzcSQeVuxlu6TQSrsOopvXvTpIy6SKB0CGjAQts4Ho/caXxmKfW4KWeWJJN4OuVB
         jXvDn4zvtSaN0pfT2vPXxj/ggY8b9TfkW2FVTDUrH+4gUtDVMeKu/f1FYzkuEC9nDNlV
         1GnqgKXj6v6OS5IpzLE4qUWU0Lbzae9gRh96JxcpcC5oeKgtfgKOB1H9U+0wUv+YpRF8
         gKMH8eSxlmd6eNd64t8f0mDrjE0i0zI2ayGJbA9CCP/1CyMNmYTenCiCImHKHD5BycB6
         S/9r8KmO4xzMdjnrBxf7RyQLvTNg5L9epQveczGtSws52HGuc8L4/M+jnKfTyRpQHtjD
         muXw==
X-Forwarded-Encrypted: i=1; AJvYcCXytKOI4zmL6rafxZfaMhCO4yImLoW9eHVC9ufNcyQMhWnD7/vLlbwwkdyfB6OZ+ouQ2m8SCYJV+VXJ7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdZlayy8HkcaRgt7k2ynDVfHYbSbSLD9+VzgT7FMjnDOW7Qv9K
	fO0bBXlVx9Vk229xNo62Bm8tlj4ALH13pLc49R6w4BkD6hs6n5hPU7Jquk0u15jv1bsRjAW+1t4
	Itg7Qky7DLG7gaQ2jSG2g+7iqGt5R5vBoQkgNOXtDsw==
X-Gm-Gg: ASbGncsqRSLY0maJ2BIYd7onkwPluegyRiD5GpKPmjQHPkPwq9GoACqyxe20a63RQBw
	nhpwqfHDb4ZGW8FVcD6twd+CaU3kTaxcKS0Z3uLlmvuVfgv8Vem5be6pOdFVQxZ4abo+K/qwA1E
	Sceh8bKnkHtcZqnP8eGFHvt71Hhi56b0fCggJnVUvEc69rfUUKFZDQBIhwg9BQ6DajIc88wkZSy
	+ARzJCy3p8I3Pm+DUbFEMEbHB2lmdFTNK4kfWjdq8j06okyFrjjXy9/T9pf6ln/6++9qque5KYJ
	yLJfxFEr
X-Google-Smtp-Source: AGHT+IGb0n2soPVhA9HW3Yi/ug81lmtTpcvsCQ9ShMeI3zEImc6F3+dHOysOTdbZsRZbSPkSfqhccOrjI+KKkLT4UmA=
X-Received: by 2002:a05:6808:f8d:b0:44f:e3d2:59db with SMTP id
 5614622812f47-45015d583cemr1045696b6e.16.1762483357292; Thu, 06 Nov 2025
 18:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20251014031425.93284-1-cuiyunhui@bytedance.com>
 <20251014031425.93284-2-cuiyunhui@bytedance.com> <aQixsIQXTjYyhRVj@willie-the-truck>
In-Reply-To: <aQixsIQXTjYyhRVj@willie-the-truck>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 7 Nov 2025 10:42:25 +0800
X-Gm-Features: AWmQ_bkNdWjndV3isxnVf7u1V6RwPPlMP2i7v5fPfn_48ruw1DHahvSQ2HKDsok
Message-ID: <CAEEQ3wk5Ru4-=4Ecnc6kQAAbR57806xxYTz0o1z4KfgZE6Cg6w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 1/2] watchdog: move arm64 watchdog_hld
 into common code
To: Will Deacon <will@kernel.org>
Cc: akpm@linux-foundation.org, alex@ghiti.fr, anup@brainfault.org, 
	aou@eecs.berkeley.edu, atish.patra@linux.dev, catalin.marinas@arm.com, 
	dianders@chromium.org, johannes@sipsolutions.net, lihuafei1@huawei.com, 
	mark.rutland@arm.com, masahiroy@kernel.org, maz@kernel.org, mingo@kernel.org, 
	nicolas.schier@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	suzuki.poulose@arm.com, thorsten.blum@linux.dev, wangjinchao600@gmail.com, 
	yangyicong@hisilicon.com, zhanjie9@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_184242_752305_E9215812 
X-CRM114-Status: GOOD (  15.26  )
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

SGkgV2lsbCwKCk9uIE1vbiwgTm92IDMsIDIwMjUgYXQgOTo0NOKAr1BNIFdpbGwgRGVhY29uIDx3
aWxsQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMTE6MTQ6
MjRBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEBAIC0zMDYsMyArMzA3LDg1IEBAIHZv
aWQgX19pbml0IGhhcmRsb2NrdXBfY29uZmlnX3BlcmZfZXZlbnQoY29uc3QgY2hhciAqc3RyKQo+
ID4gICAgICAgd2RfaHdfYXR0ci50eXBlID0gUEVSRl9UWVBFX1JBVzsKPiA+ICAgICAgIHdkX2h3
X2F0dHIuY29uZmlnID0gY29uZmlnOwo+ID4gIH0KPiA+ICsKPiA+ICsjaWZkZWYgQ09ORklHX1dB
VENIRE9HX1BFUkZfQURKVVNUX1BFUklPRAo+ID4gKy8qCj4gPiArICogU2FmZSBtYXhpbXVtIENQ
VSBmcmVxdWVuY3kgaW4gY2FzZSBhIHBhcnRpY3VsYXIgcGxhdGZvcm0gZG9lc24ndCBpbXBsZW1l
bnQKPiA+ICsgKiBjcHVmcmVxIGRyaXZlci4gQWx0aG91Z2gsIGFyY2hpdGVjdHVyZSBkb2Vzbid0
IHB1dCBhbnkgcmVzdHJpY3Rpb25zIG9uCj4gPiArICogbWF4aW11bSBmcmVxdWVuY3kgYnV0IDUg
R0h6IHNlZW1zIHRvIGJlIHNhZmUgbWF4aW11bSBnaXZlbiB0aGUgYXZhaWxhYmxlCj4gPiArICog
Q1BVcyBpbiB0aGUgbWFya2V0IHdoaWNoIGFyZSBjbG9ja2VkIG11Y2ggbGVzcyB0aGFuIDUgR0h6
LiBPbiB0aGUgb3RoZXIKPiA+ICsgKiBoYW5kLCB3ZSBjYW4ndCBtYWtlIGl0IG11Y2ggaGlnaGVy
IGFzIGl0IHdvdWxkIGxlYWQgdG8gYSBsYXJnZSBoYXJkLWxvY2t1cAo+ID4gKyAqIGRldGVjdGlv
biB0aW1lb3V0IG9uIHBhcnRzIHdoaWNoIGFyZSBydW5uaW5nIHNsb3dlciAoZWcuIDFHSHogb24K
PiA+ICsgKiBEZXZlbG9wZXJib3gpIGFuZCBkb2Vzbid0IHBvc3Nlc3MgYSBjcHVmcmVxIGRyaXZl
ci4KPiA+ICsgKi8KPiA+ICsjZGVmaW5lIFNBRkVfTUFYX0NQVV9GUkVRICAgIDUwMDAwMDAwMDBV
TCAvLyA1IEdIego+ID4gK19fd2VhayB1NjQgaHdfbm1pX2dldF9zYW1wbGVfcGVyaW9kKGludCB3
YXRjaGRvZ190aHJlc2gpCj4gPiArewo+ID4gKyAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9w
cm9jZXNzb3JfaWQoKTsKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcgbWF4X2NwdV9mcmVxOwo+ID4g
Kwo+ID4gKyAgICAgbWF4X2NwdV9mcmVxID0gY3B1ZnJlcV9nZXRfaHdfbWF4X2ZyZXEoY3B1KSAq
IDEwMDBVTDsKPiA+ICsgICAgIGlmICghbWF4X2NwdV9mcmVxKQo+ID4gKyAgICAgICAgICAgICBt
YXhfY3B1X2ZyZXEgPSBTQUZFX01BWF9DUFVfRlJFUTsKPiA+ICsKPiA+ICsgICAgIHJldHVybiAo
dTY0KW1heF9jcHVfZnJlcSAqIHdhdGNoZG9nX3RocmVzaDsKPiA+ICt9Cj4KPiBXaHkgZG9lcyB0
aGlzIGZ1bmN0aW9uIGJlY29tZSBfX3dlYWs/IE5laXRoZXIgYXJtNjQgbm9yIHJpc2N2IG92ZXJy
aWRlCj4gaXQgYWZhaWN0LgoKV291bGQgeW91IHNheSB0aGVyZeKAmXMgYW55IHBhcnRpY3VsYXIg
aXNzdWUgaGVyZT8gSWYgc29tZSBhcmNoaXRlY3R1cmVzCm1pZ2h0IG5lZWQgdG8gb3ZlcnJpZGUg
dGhlIGh3X25taV9nZXRfc2FtcGxlX3BlcmlvZCgpIGZ1bmN0aW9uIGxhdGVyCm9uLCB3b3VsZG7i
gJl0IF9fd2VhayBiZSBhIG1vcmUgcmVhc29uYWJsZSBjaG9pY2U/Cgo+Cj4gV2lsbAoKVGhhbmtz
LApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
