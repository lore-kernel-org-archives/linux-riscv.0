Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A9DCE7D1F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dYMEOqX7Q5TRQjRi4vbCtiweWX92EIwKf+Hh7tW7Yk=; b=LE7RLeFu97l7+s
	v11kpOprMHgpO+H7OCwOZpJLVNIXMS+KMDwhVYuo2s04JFeRA5spVLkKMjRPtvILE1ReX3W9CFlCo
	hdDPrMPbBhLA31l/Bbn/0ZLYfCU8AjY55W09maOMYQPv7e/vZBpXplDsauHyuWA0RDEOxYHWsJe8C
	TM9lNxBiGEEob3ADJYc81h8Mb4Q4QGLWfpe4BPyAJG1XwUUrJ0C7743TvRSWL4No3SQuC3wzvcPBN
	oOs0oESZolzKIi2PkOZ5pkdoefVkUJYf0Do6z7da2Kd65hQQyXCjQIUdAmp4EUqjBd7jU29E09y0X
	iz7igb8xhEw3fdbP8hhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svcUz-00000002qZM-0FHK;
	Tue, 01 Oct 2024 13:01:05 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svbSl-00000002bT2-0ZpA
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 11:54:44 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-82ceab75c27so335795839f.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 04:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1727783681; x=1728388481; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQP2eZATwaIQBSh4BYLJSNDYNoTYQ7d10X28PMhH36I=;
        b=VVAmKB6AwFKCumL7IFmf+B+yPh7Pg/BaF8/eOSJ7DWKqWfzVsoJpKhE3xgKzJpk1Su
         nIXR0twzyyljFW1XrNlPc0ZENcxzGBfWSjWFTVDY5NLdBeqo0745IngtT55qysCJOcZ9
         E14Fyayyb+o2poZfIRoOkFYZpshT4zZNUaVHCUc0ATbX/8zIPzda0PWkFs0lx6b6AmWe
         7W/Wz/FPs27lMLkHrF9EGbCtQ6zo4JvQd8aGViXcSKL/Oku9lYCpN1Y+vrnTr/fWowor
         OUbXLZ66pkMXRpMXgWwceg876x5BPdjpq2xQvdvTNFHPJ2w8MJIKvSpwkJNH4uDgagyP
         h49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727783681; x=1728388481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mQP2eZATwaIQBSh4BYLJSNDYNoTYQ7d10X28PMhH36I=;
        b=ademXa7rVOoWTeLwN6rj7CV33curL/rHepPoXEGcGtR5lmGbrMJ+aP/bOsRSdXKL72
         V9Y2il96ELQqmFNhYf87RKRaH8i7QPXybxbkaz7rs2jhzglH0MO5G0x9VxN9O1dId+5L
         kTqqPj4Kj8/DoAF/aadk23auzsRH1jM8xK9nxRtaPLC4G/xdC2w5qhDpMbmLwoESsjy7
         OZ+Gy+cR+VuqU/3m9sN8lCoTE0lOiXWXfdajAwPrwqDbs1DCMVqXgR2zi6j4AtQdj28S
         nKm34I1ZdunRD3AIs/FA0qatQSJxtJgw4C7fZ7J9K4+Qj5jFHA3H3HLv0pRHaVjga21Y
         aZwg==
X-Forwarded-Encrypted: i=1; AJvYcCUA/DJE1dHDT2Rx0YZ8RcKUhg4lx7G0IZSZU6miZYL7qSxanfPpS+ggE8GDj30+xJ8U8YZsYdeBnj7xQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYK3aEHcKlYuu83N1OI1NDy3IDxKMUjZvF4MF9Qt35plP48enE
	xHIAQilXc3CST/gs5YYIyjjTv34RN8S/QH2nlbMAL+q5ZBls0kGh56NW9I/SwCilq2hpHI2tt8f
	fUWZu0UgEPZd11Kloa4qnmp0V7RfQlUF/xajCnA==
X-Google-Smtp-Source: AGHT+IHO9w1tNfJws5dAu3OtUP0xCbtsEcfYHhj3flsEJDRvG0kU3OBkokYTY3BvOuYT9zYQT3ITjpbWIIBh684lZtA=
X-Received: by 2002:a05:6e02:17c7:b0:3a3:4164:eec9 with SMTP id
 e9e14a558f8ab-3a34517ab5dmr148340195ab.14.1727783681191; Tue, 01 Oct 2024
 04:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240903-correct_error_codes_sifive_plic-v1-1-d929b79663a2@rivosinc.com>
In-Reply-To: <20240903-correct_error_codes_sifive_plic-v1-1-d929b79663a2@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Oct 2024 17:24:29 +0530
Message-ID: <CAAhSdy2OXsFx973MnE0LBEzKK0r4OWYWXbKrNnuW6Gbanfo-bQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: Fix error codes
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_045443_465871_C0E6852A 
X-CRM114-Status: GOOD (  16.13  )
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

T24gV2VkLCBTZXAgNCwgMjAyNCBhdCA1OjEx4oCvQU0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTZXQgZXJyb3IgdG8gLUVOT01FTSBpZiBrY2FsbG9j
KCkgZmFpbHMgb3IgaWYgaXJxX2RvbWFpbl9hZGRfbGluZWFyKCkKPiBmYWlscyBpbnNpZGUgb2Yg
cGxpY19wcm9iZSgpLgo+CgpMaWtlIEFsZXggbWVudGlvbmVkLCBwbGVhc2UgaW5jbHVkZSBhIEZp
eGVzIHRhZy4KCj4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9z
aW5jLmNvbT4KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
Cj4gUmVwb3J0ZWQtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4K
PiBDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA5MDMxMTIyLnlCaDhIcnhB
LWxrcEBpbnRlbC5jb20vCgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJx
LXNpZml2ZS1wbGljLmMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2ly
cS1zaWZpdmUtcGxpYy5jIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gaW5k
ZXggMmY2ZWY1YzQ5NWJkLi4wYjczMGUzMDU3NDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFj
aGlwL2lycS1zaWZpdmUtcGxpYy5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUt
cGxpYy5jCj4gQEAgLTYyNiw4ICs2MjYsMTAgQEAgc3RhdGljIGludCBwbGljX3Byb2JlKHN0cnVj
dCBmd25vZGVfaGFuZGxlICpmd25vZGUpCj4KPiAgICAgICAgICAgICAgICAgaGFuZGxlci0+ZW5h
YmxlX3NhdmUgPSBrY2FsbG9jKERJVl9ST1VORF9VUChucl9pcnFzLCAzMiksCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2YoKmhhbmRsZXItPmVu
YWJsZV9zYXZlKSwgR0ZQX0tFUk5FTCk7Cj4gLSAgICAgICAgICAgICAgIGlmICghaGFuZGxlci0+
ZW5hYmxlX3NhdmUpCj4gKyAgICAgICAgICAgICAgIGlmICghaGFuZGxlci0+ZW5hYmxlX3NhdmUp
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBlcnJvciA9IC1FTk9NRU07Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgZ290byBmYWlsX2NsZWFudXBfY29udGV4dHM7Cj4gKyAgICAgICAgICAg
ICAgIH0KPiAgZG9uZToKPiAgICAgICAgICAgICAgICAgZm9yIChod2lycSA9IDE7IGh3aXJxIDw9
IG5yX2lycXM7IGh3aXJxKyspIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBwbGljX3RvZ2ds
ZShoYW5kbGVyLCBod2lycSwgMCk7Cj4gQEAgLTYzOSw4ICs2NDEsMTAgQEAgc3RhdGljIGludCBw
bGljX3Byb2JlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUpCj4KPiAgICAgICAgIHByaXYt
PmlycWRvbWFpbiA9IGlycV9kb21haW5fY3JlYXRlX2xpbmVhcihmd25vZGUsIG5yX2lycXMgKyAx
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZw
bGljX2lycWRvbWFpbl9vcHMsIHByaXYpOwo+IC0gICAgICAgaWYgKFdBUk5fT04oIXByaXYtPmly
cWRvbWFpbikpCj4gKyAgICAgICBpZiAoV0FSTl9PTighcHJpdi0+aXJxZG9tYWluKSkgewo+ICsg
ICAgICAgICAgICAgICBlcnJvciA9IC1FTk9NRU07Cj4gICAgICAgICAgICAgICAgIGdvdG8gZmFp
bF9jbGVhbnVwX2NvbnRleHRzOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICAvKgo+ICAgICAgICAg
ICogV2UgY2FuIGhhdmUgbXVsdGlwbGUgUExJQyBpbnN0YW5jZXMgc28gc2V0dXAgZ2xvYmFsIHN0
YXRlCj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogNjgwNGYwZWRiZTc3NDc3NzRlNmFlNjBmMjBjZWM0
ZWUzYWQ3YzE4Nwo+IGNoYW5nZS1pZDogMjAyNDA5MDMtY29ycmVjdF9lcnJvcl9jb2Rlc19zaWZp
dmVfcGxpYy00NjExZjU5MjkxZGYKPiAtLQo+IC0gQ2hhcmxpZQo+Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
