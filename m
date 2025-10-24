Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C99CCD1AB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 07:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoFB1NPft3tAfFh+DVVove5FQnJqBLhh0MImOnL1Onk=; b=SV3YeYyWLy1y+4
	TVSP5A+qXGS05rv92dxr5OibUVVHnRqFPnaQIQgBdDyf7k5rTVhrpB/EIywUEfXAv8wv8UM3U4Ty6
	HDXiXPTgkb9EMWNuE0mm7n9CF0ETjQI26Qs8ST4BQaT6Hs7w5qknbGBYqgmzGSkzy0ej51Ud8f5Ow
	NuM/2tI+OJIJ0kM3He5VVOx7U7HzSdbTc4NMZPWKuDIgzgtYMo5A/Xf5mp9jD3OZW4qTImV8OlU/5
	Nlo4xLj0rIEHeGK5e7HBkeI0bg6Qfwa18iUbmTgDH5x7Th3tHnyapXn2Rfp8yH0tx/6YaLp+t403w
	8abeCvgxBCLX5FD9X5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCHU-00000008VGX-2C32;
	Fri, 24 Oct 2025 07:32:12 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCHR-00000008VFL-3dgg
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 07:32:11 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-93e7d3648a8so68706239f.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 00:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761291129; x=1761895929; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpBZbjtJGLMlozwkX0b76PHQF1zYhL0A3YtxCDGJbdU=;
        b=pxqtHcBW/qBKICO9gG5kyfpRDG3szi1MJEgXxxI8IBPxvlAYK/NquSSeLNqCaGd2Ln
         2xk/ftqTYMVMfFAT6F3vkK75eoxsaP+WRAErAUoiFo1QlPvpvK36jNLQho81STZh6gUC
         vm7Q9G6QEgDh7J6v3WsLDR8p8lt736WWEhWdotOIdD9xftRN5DddZdK4AoXra4v2Qpvi
         jGF9X25qOHGnNfOcOnFRGxRgAFdNecANBdqjZBkd/CecJzC/T5qS197ZYBxRSbHeEw46
         Y+hI4kwH6WOODJFD82BZzwxrUZk32sNg7G91XhjEu3MtWQss/Zw7tqiheH7OjtMl9B62
         NEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761291129; x=1761895929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpBZbjtJGLMlozwkX0b76PHQF1zYhL0A3YtxCDGJbdU=;
        b=fIEuf1fhOjTlAHkurRYNtq6phxBAbenqHstqTyXIiN0Ul/Hhvsoey0gwjX0KAcQW9p
         tBmP6apTg2IZ4qpIgbeiAx330JSV9wBXxz3jHwiUeDdGngFSYeVHFVA7vY1kjFXKr5LD
         4ueS7HHb/PZOk2FPmOBAPyk3pegxeWu68YOuMO9mZ8+8QIrH6gjlnPPksKgCg4IWJLCB
         zh0opwUgxKtNyZbE/9XW473xbHD+gweROkbvXb4KOzsFwKkrYn4cl4oHRDbM1qVBq6bA
         j3xzTEPbd60N8rXQKBE/TMFOPWHHOG6/jQf4qa1x77Tnn3xu54G4oAj4p5kSMReDg1h2
         BfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO8oawknKe31yNLbhZiQ0CZ2tzViLIJesFv7xdM+vWtdZ724fCDCKL9AcqhFB6uD6hFzMFbJJfLlLcBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVINCa7am8QdYYAh6r2GKk8371j4wJJmtUF5ku9dfddeFFRlui
	W93WN7xIJsd7h+y5/92AgsFhyjFgRAkL9X3Tl1xNGlI9eVpKZllJWFpjtKwFKbCRi45wEEtDy7X
	dnjAML1NBFYl/fNAnYHNKbV53rv54k2x0vR+G5JOwdA==
X-Gm-Gg: ASbGncuWL02RY1zMoKfhoeVKBnJGxsfYs7p+DKr7QFcqLUqZHsjWotOiFNEzBGUqZgn
	RhRTkluGyE4PKgP8CjbV4KFhDfrM1dOGKmtLI7zNInSs4fS8+QK7R28QaTra4YTxtSytzV5qIps
	oQF6vLZ57Tm5DLlAFJFbIkMD57XGthMSzzwu1D/TsTGV/m4G6p+1HdZIcsqMzYSE+GoHHWCnMUL
	MyNVVKgHG7ROiNbo4BvxctgxOa5xWJHQeusvKTAIis8AZ7klLin4eFAImeFXdoqUhSbAtA3qU3l
	xhcPY5LBBlmg+LgxQw==
X-Google-Smtp-Source: AGHT+IE8lJniclhto/l+RH48c18UKMSGetx2EifcCSozWch7G7Fgd/VVGLw9VfrEOhdG/fnB1nKrZd3e4LUYvBidL4I=
X-Received: by 2002:a05:6e02:156c:b0:430:ad98:981f with SMTP id
 e9e14a558f8ab-430c524b96bmr356886075ab.4.1761291128790; Fri, 24 Oct 2025
 00:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com> <CAJF2gTRwHJsA7jFvAXbqy-6LyfaVTqfsFXgHfAeOZ8M3JNsikg@mail.gmail.com>
In-Reply-To: <CAJF2gTRwHJsA7jFvAXbqy-6LyfaVTqfsFXgHfAeOZ8M3JNsikg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 24 Oct 2025 13:01:57 +0530
X-Gm-Features: AWmQ_blwhFmtWb2XCxa4JYOc1i2equWNv_ps6eVK8LyUUbV_-WLoCb0ZdIQIWZo
Message-ID: <CAAhSdy1j4HZ86V6VsSF80LuNoxB3L3fmYYtvT7LU93fhbgCuug@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: Guo Ren <guoren@kernel.org>
Cc: fangyu.yu@linux.alibaba.com, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	jiangyifei@huawei.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, jgg@nvidia.com, 
	alex.williamson@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_003209_909976_9A1752B4 
X-CRM114-Status: GOOD (  21.19  )
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

T24gVHVlLCBPY3QgMjEsIDIwMjUgYXQgODo1OOKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDIwLCAyMDI1IGF0IDY6MDjigK9BTSA8ZmFuZ3l1
Lnl1QGxpbnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBGYW5neXUgWXUgPGZh
bmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBBcyBvZiBjb21taXQgYWFjNmRiNzVh
OWZjICgidmZpby9wY2k6IFVzZSB1bm1hcF9tYXBwaW5nX3JhbmdlKCkiKSwKPiA+IHZtX3Bnb2Zm
IG1heSBubyBsb25nZXIgZ3VhcmFudGVlZCB0byBob2xkIHRoZSBQRk4gZm9yIFZNX1BGTk1BUAo+
ID4gcmVnaW9ucy4gVXNpbmcgdm1hLT52bV9wZ29mZiB0byBkZXJpdmUgdGhlIEhQQSBoZXJlIG1h
eSB0aGVyZWZvcmUKPiA+IHByb2R1Y2UgaW5jb3JyZWN0IG1hcHBpbmdzLgo+ID4KPiA+IEluc3Rl
YWQsIEkvTyBtYXBwaW5ncyBmb3Igc3VjaCByZWdpb25zIGNhbiBiZSBlc3RhYmxpc2hlZCBvbi1k
ZW1hbmQKPiA+IGR1cmluZyBnLXN0YWdlIHBhZ2UgZmF1bHRzLCBtYWtpbmcgdGhlIHVwZnJvbnQg
aW9yZW1hcCBpbiB0aGlzIHBhdGgKPiA+IGlzIHVubmVjZXNzYXJ5Lgo+ID4KPiA+IEZpeGVzOiA5
ZDA1YzFmZWU4MzcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdlMiBwYWdlIHRhYmxlIHBy
b2dyYW1taW5nIikKPiBUaGUgRml4ZXMgdGFnIHNob3VsZCBiZSAnY29tbWl0IGFhYzZkYjc1YTlm
YyAoInZmaW8vcGNpOiBVc2UKPiB1bm1hcF9tYXBwaW5nX3JhbmdlKCkiKScuCj4KPiBBIHN0YWJs
ZSB0cmVlIG5lY2Vzc2l0YXRlcyBtaW5pbWl6aW5nIHRoZSAiRml4ZXMgdGFnIiBpbnRlcmZlcmVu
Y2UuCj4KPiBXZSBhbHNvIG5lZWQgdG8KPiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlh
LmNvbT4KPiBDYzogQWxleCBXaWxsaWFtc29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4K
PiBGb3IgcmV2aWV3Lgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZhbmd5dS55dUBs
aW51eC5hbGliYWJhLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgMjAg
Ky0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDE5IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUu
YyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gPiBpbmRleCA1MjVmYjVhMzMwYzAuLjg0YzA0Yzhm
MDg5MiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS9tbXUuYwo+ID4gQEAgLTE5Nyw4ICsxOTcsNyBAQCBpbnQga3ZtX2FyY2hfcHJl
cGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwKPiA+Cj4gPiAgICAgICAgIC8qCj4g
PiAgICAgICAgICAqIEEgbWVtb3J5IHJlZ2lvbiBjb3VsZCBwb3RlbnRpYWxseSBjb3ZlciBtdWx0
aXBsZSBWTUFzLCBhbmQKPiA+IC0gICAgICAgICogYW55IGhvbGVzIGJldHdlZW4gdGhlbSwgc28g
aXRlcmF0ZSBvdmVyIGFsbCBvZiB0aGVtIHRvIGZpbmQKPiA+IC0gICAgICAgICogb3V0IGlmIHdl
IGNhbiBtYXAgYW55IG9mIHRoZW0gcmlnaHQgbm93Lgo+ID4gKyAgICAgICAgKiBhbnkgaG9sZXMg
YmV0d2VlbiB0aGVtLCBzbyBpdGVyYXRlIG92ZXIgYWxsIG9mIHRoZW0uCj4gPiAgICAgICAgICAq
Cj4gPiAgICAgICAgICAqICAgICArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rCj4gPiAgICAgICAgICAqICstLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0t
LSsgICArLS0tLS0tLS0tLS0tLS0tLSsKPiA+IEBAIC0yMjksMzIgKzIyOCwxNSBAQCBpbnQga3Zt
X2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwKPiA+ICAgICAgICAg
ICAgICAgICB2bV9lbmQgPSBtaW4ocmVnX2VuZCwgdm1hLT52bV9lbmQpOwo+ID4KPiA+ICAgICAg
ICAgICAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX1BGTk1BUCkgewo+ID4gLSAgICAgICAg
ICAgICAgICAgICAgICAgZ3BhX3QgZ3BhID0gYmFzZV9ncGEgKyAodm1fc3RhcnQgLSBodmEpOwo+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcGh5c19hZGRyX3QgcGE7Cj4gPiAtCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICBwYSA9IChwaHlzX2FkZHJfdCl2bWEtPnZtX3Bnb2ZmIDw8IFBB
R0VfU0hJRlQ7Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBwYSArPSB2bV9zdGFydCAtIHZt
YS0+dm1fc3RhcnQ7Cj4gPiAtCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBJTyByZWdp
b24gZGlydHkgcGFnZSBsb2dnaW5nIG5vdCBhbGxvd2VkICovCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBpZiAobmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKSB7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgfQo+ID4gLQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2
X21tdV9pb3JlbWFwKGt2bSwgZ3BhLCBwYSwgdm1fZW5kIC0gdm1fc3RhcnQsCj4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd3JpdGFibGUsIGZh
bHNlKTsKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpCj4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+IERlZmVyaW5nIHRoZSBpb3JlbWFwIHRvIHRo
ZSBnLXN0YWdlIHBhZ2UgZmF1bHQgbG9va3MgZ29vZCB0byBtZSwgYXMgaXQKPiBzaW1wbGlmaWVz
IHRoZSBpbXBsZW1lbnRhdGlvbiBoZXJlLgo+Cj4gQWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBr
ZXJuZWwub3JnPgoKSSB0aGluayB5b3UgbWVhbnQgUmV2aWV3ZWQtYnkgYW5kIG5vdCBBY2tlZC1i
eS4KCkkgaGF2ZSB1cGRhdGVkIHRoZSBGaXhlcyB0YWcgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZy4K
ClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
