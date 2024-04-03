Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEB2CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 05:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0airLeU1bWJQDE+5yWoul3spwepsvVaCIaij5bnKlFk=; b=akHZi28NxfL2sD
	WHPRq4PVI+AZsmtGR4r1maK8DZ2hQzZc1XXo9CCTp+Mq9NEAMl/f8y3rP+JUcs6SCa2ai24Xxrxtk
	iuGMs0Me/pZR6frddbT69IrRl+TYi2vnBbm7gvdVAjvhAlEJXHpcDy3k4z8eZGkzZzlHfDYIuwsrx
	isLzp2iLgv6yOBHpam6wubdP4K3pY73thxljI3XFNzdUEF5jICDTMeOho6tQiqFoMctFfUx4sxz4l
	4zbcKYz50/HWj0zuWhoVPj/VxfRyJWvHCFyHzyUS9jC3gpTm4wFO5oidcIA1MjC7+1Egn/ZxLTv6J
	tlJTc3BkWucqS6eoHh8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtD1-0000000E6Qx-3NZY;
	Wed, 03 Apr 2024 05:30:51 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtCx-0000000E6Mk-1og3
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 05:30:50 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-61461580403so41745497b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 22:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712122246; x=1712727046; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FGC0ogSAewDWnDccn9HyW8lHJXe75+YXBIJHLHFGHI=;
        b=uEGlbLED1mXZwSLVQFza58UhgAj5r+BBEiUTqbplamS3Dko8BKZ8wDI6Bu0ZnGm2Tr
         AX1exSiuUSe/bBGGElKB9RQYdRzOKIQboZila81ofCPGut1ubcfbsoYg5GOQou38ocSV
         U9TQz6UOCHCUC888pVJmRU6427wg/F68DT8XOq2cmsq1P9pSeYF04iDpuEI3/Bsn7/WF
         8shW5zNXyEK6R4IgwWkgqz8W3nS/qvhGhLj7TkFNbwzAF2JnWqeYKjV5AGeleQOP5Em1
         V0PDX94leoHEpbIVT5mPYv47T7pbZuipt5xZHPd0Zh1/pAv0OXgC6WgDEY3/A32ZZ4it
         XeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712122246; x=1712727046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FGC0ogSAewDWnDccn9HyW8lHJXe75+YXBIJHLHFGHI=;
        b=HUJqk2HtB9A3FKh2TselcwxZ2VQzoSWKCeQ+b5ywF0TVavGvG1r003w85NZANIUBQr
         yG18GfV5xxwovjawRnCyU8HVRGX5DFds0XPpYE2JCiKusEVwce66kVqoYt9X1qrb5+Ib
         lfUFRgqChhswTVX/zlt5Q6wo+yWSUkKLzH6PZhk6VN2vyGpqMx5AgLkueK82qzlMRJyb
         JzfXNxaMWZKw47sIW8BUK7XVkaHn4ZtRey+M8VqCylyCTWBtdOYDKHEHfkWBrtFdAfLs
         7WnLPfWFfn12Zcj88Cq/oFnw8IisHRazilRwd5WIKqsJl6F8cwhbpf3GorXz3g4uhHfC
         hGKw==
X-Forwarded-Encrypted: i=1; AJvYcCWhe0InzdnhCEwxlT/OIScudhssk7wVfh/oMmL0DndHUrRVT5zwiJ7PaTuNDv5GdnDt0jaQ78A/eyZQjGHomnv5hWgDmTBe6tPtSbwqtyZl
X-Gm-Message-State: AOJu0YzmjNqRJJ68GxnDP6/wyF0RFl5QlWXHC7jyNh1EjEvgHWlSe3fm
	knqeGbBWBefZtjPrvVf9u2pU1DCfnDQAANXUEAq7wYmCiUa8MXlioqJMKhouMxFEWVJo9anVbOo
	DcWl62mdCoS3F6TBpxMai7neluzN5AZM06ZLJ
X-Google-Smtp-Source: AGHT+IERcF+ZJQdvucNfySTOQI0rZqXN5JPmGGJueefxP3/c8KUs6v78wwHnFWFD/9UuBTtutSqFi5LiGSrexLI5jh0=
X-Received: by 2002:a25:ce10:0:b0:dcc:cadf:3376 with SMTP id
 x16-20020a25ce10000000b00dcccadf3376mr13231486ybe.18.1712122245862; Tue, 02
 Apr 2024 22:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-4-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-4-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:30:34 -0700
Message-ID: <CAJuCfpE7txgXZQG=xvzKYtKUs=3V5C9pe7OOzf71BGPfb+Qqxw@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm: mm: accelerate pagefault when VM_FAULT_BADACCESS
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_223047_690634_BED51173 
X-CRM114-Status: GOOD (  16.23  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMjo1M+KAr0FNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdm1fZmxhZ3Mgb2Ygdm1hIGFscmVhZHkg
Y2hlY2tlZCB1bmRlciBwZXItVk1BIGxvY2ssIGlmIGl0IGlzIGEKPiBiYWQgYWNjZXNzLCBkaXJl
Y3RseSBzZXQgZmF1bHQgdG8gVk1fRkFVTFRfQkFEQUNDRVNTIGFuZCBoYW5kbGUgZXJyb3IsCj4g
c28gbm8gbmVlZCB0byBsb2NrX21tX2FuZF9maW5kX3ZtYSgpIGFuZCBjaGVjayB2bV9mbGFncyBh
Z2Fpbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVh
d2VpLmNvbT4KClJldmlld2VkLWJ5OiBTdXJlbiBCYWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUu
Y29tPgoKCgo+IC0tLQo+ICBhcmNoL2FybS9tbS9mYXVsdC5jIHwgNCArKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL2FybS9tbS9mYXVsdC5jIGIvYXJjaC9hcm0vbW0vZmF1bHQuYwo+IGluZGV4IDQzOWRjNmEy
NmJiOS4uNWM0YjQxN2UyNGY5IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL21tL2ZhdWx0LmMKPiAr
KysgYi9hcmNoL2FybS9tbS9mYXVsdC5jCj4gQEAgLTI5NCw3ICsyOTQsOSBAQCBkb19wYWdlX2Zh
dWx0KHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgaW50IGZzciwgc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpCj4KPiAgICAgICAgIGlmICghKHZtYS0+dm1fZmxhZ3MgJiB2bV9mbGFncykpIHsKPiAg
ICAgICAgICAgICAgICAgdm1hX2VuZF9yZWFkKHZtYSk7Cj4gLSAgICAgICAgICAgICAgIGdvdG8g
bG9ja19tbWFwOwo+ICsgICAgICAgICAgICAgICBjb3VudF92bV92bWFfbG9ja19ldmVudChWTUFf
TE9DS19TVUNDRVNTKTsKPiArICAgICAgICAgICAgICAgZmF1bHQgPSBWTV9GQVVMVF9CQURBQ0NF
U1M7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gYmFkX2FyZWE7Cj4gICAgICAgICB9Cj4gICAgICAg
ICBmYXVsdCA9IGhhbmRsZV9tbV9mYXVsdCh2bWEsIGFkZHIsIGZsYWdzIHwgRkFVTFRfRkxBR19W
TUFfTE9DSywgcmVncyk7Cj4gICAgICAgICBpZiAoIShmYXVsdCAmIChWTV9GQVVMVF9SRVRSWSB8
IFZNX0ZBVUxUX0NPTVBMRVRFRCkpKQo+IC0tCj4gMi4yNy4wCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
