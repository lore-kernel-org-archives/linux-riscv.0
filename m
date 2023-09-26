Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38153E7F138
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 21:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h+V2bgbKzBcAEPEwk/LKMA0E3DB6LMs6TN57uY/Ivt8=; b=l/EobvYjdgMrGQ
	1mTFig4NcXC7E/h1duec8nvFSlu3Irs61udkhzBdnyI7x5RrkYPVYgb7JwP70Eh6ATX13ozdAfyP6
	zsyMOSUeAbRcgyIe+qggqNmul5j76eTwXINuw8UsvDTDb+Fy7bCWrXkY/B8UKrHqlefILSjVgvAtU
	US2+UD3NQRXmRFnkpCiFJQv8TgJ/B5uE/YRdhkdimuE5DG409Zoj3WVjxaXygGFM0DAM5jE8umRAn
	ih+yxOHHbcGzDI3sm604v5wMLwpxI1+12pzd9Ap19TaQSFOcRymWhLdhSTImcITFeValJnsRn/WOY
	2ewcVIQ4+3FwUNi2EXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlFr6-00H4MQ-1t;
	Tue, 26 Sep 2023 21:44:32 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlFr3-00H4Lu-2R
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 21:44:31 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5041335fb9cso15700099e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 14:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695764665; x=1696369465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7VhIC7MPBFXpVR7FFEbYlo6XAUw3yl/JVeppNvmRog=;
        b=xaJPLx3+UUppI+7mJmYsq8Okv2Z/SdLkg7gc0L0i7M5isWyFHA5gmRxaVOOgPeTd+d
         PkTNvYZHQeUNKLbkh2+TvSkOZqi6wBdZT04+bu/v3ZTWwUsES8l3BjnbXW3UYNqehZvh
         d1rzCGVVD4+BMkoX5VDaU5NnNaZFL9/CkkEI17HeD6Ud75thLo+Tk3rmXWvz7/P9/x/1
         3UD497Wuf7rPfS5AxQ0nKSUf30JxDI0LdjK9KfM+A80YEKQLjC2Wi0ycyFBsnnlQ9ZQG
         f/B3Gh1GJ9mp6J9+Hbf5BYVVDWl+eycMTqnJUU2GYFUJzof7I7aa4aIEm00WZ5kjHcO6
         /fLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764665; x=1696369465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7VhIC7MPBFXpVR7FFEbYlo6XAUw3yl/JVeppNvmRog=;
        b=HlhIJvetsP1Kad95JGumn/ZTzOSyT6My8ytdEHvAh+flXP9kl9NjAgiIGBh732NbgW
         prlekoR0emeYVCi9nWbCw2MkpNiZdPTqmkjR0lmHNuEbUksb+nhFNjJUpoQtPGTmLQnV
         kWPCw8+bWk/wJoa9YRrBSS5g7gTqMxvKofMPBewqrWlfMTN+3B+n1v1c8+oRMW8fhBJP
         4dR+cvPIfHuSyjMi9CRe+//WKFPvIgcDWMYTC4T3fizi3JatadqceHjv2NyLlq2cKFMt
         xneHIsENoeocg8x+zuy1aRns7YY8v/kaT21Wa6zCp8JWGXx7b+buq9nhrINqGSSHvQTo
         UpQQ==
X-Gm-Message-State: AOJu0YzTeNd4W/aB2tarysOCpD63Q7N2CGmeN13Qsyd1iF6hzWnFKbTz
	IHyLqzl5bHAkk8t8HoPtjEr9jLwnL4uk5JAF5IwZpA==
X-Google-Smtp-Source: AGHT+IFUe4OXQrOywucEgxAU9oFTIqCD6Pj6P3s5airMHJJmqoktJErzvmPUON/DDlodShPgnaFkP9Gb4cOPlW2JAR8=
X-Received: by 2002:a19:5e55:0:b0:4ff:9efd:8a9e with SMTP id
 z21-20020a195e55000000b004ff9efd8a9emr45660lfi.7.1695764665489; Tue, 26 Sep
 2023 14:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230926150316.1129648-1-cleger@rivosinc.com>
In-Reply-To: <20230926150316.1129648-1-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 26 Sep 2023 14:43:49 -0700
Message-ID: <CALs-Hss+OK-vJy_ZKjVbGh7rTBZA+GditWcdM1XjDDskGF76Dw@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ron Minnich <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_144430_012973_CC8BB3BC 
X-CRM114-Status: GOOD (  18.43  )
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

T24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgODowM+KAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTaW5jZSBjb21taXQgNjFjYWRiOSAoIlByb3ZpZGUg
bmV3IGRlc2NyaXB0aW9uIG9mIG1pc2FsaWduZWQgbG9hZC9zdG9yZQo+IGJlaGF2aW9yIGNvbXBh
dGlibGUgd2l0aCBwcml2aWxlZ2VkIGFyY2hpdGVjdHVyZS4iKSBpbiB0aGUgUklTQy1WIElTQQo+
IG1hbnVhbCwgaXQgaXMgc3RhdGVkIHRoYXQgbWlzYWxpZ25lZCBsb2FkL3N0b3JlIG1pZ2h0IG5v
dCBiZSBzdXBwb3J0ZWQuCj4gSG93ZXZlciwgdGhlIFJJU0MtViBrZXJuZWwgdUFCSSBkZXNjcmli
ZXMgdGhhdCBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFyZQo+IHN1cHBvcnRlZC4gSW4gb3JkZXIgdG8g
c3VwcG9ydCB0aGF0LCB0aGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIFMtbW9kZQo+IGhhbmRs
aW5nIG9mIG1pc2FsaWduZWQgYWNjZXNzZXMgYXMgd2VsbCBzdXBwb3J0IGZvciBwcmN0bChQUl9V
TkFMSUdOKS4KPgo+IEhhbmRsaW5nIG1pc2FsaWduZWQgYWNjZXNzIGluIGtlcm5lbCBhbGxvd3Mg
Zm9yIGEgZmluZXIgZ3JhaW4gY29udHJvbAo+IG9mIHRoZSBtaXNhbGlnbmVkIGFjY2Vzc2VzIGJl
aGF2aW9yLCBhbmQgdGhhbmtzIHRvIHRoZSBwcmN0bCBjYWxsLCBjYW4KPiBhbGxvdyBkaXNhYmxp
bmcgbWlzYWxpZ25lZCBhY2Nlc3MgZW11bGF0aW9uIHRvIGdlbmVyYXRlIFNJR0JVUy4gVXNlcgo+
IHNwYWNlIGNhbiB0aGVuIG9wdGltaXplIGl0cyBzb2Z0d2FyZSBieSByZW1vdmluZyBzdWNoIGFj
Y2VzcyBiYXNlZCBvbgo+IFNJR0JVUyBnZW5lcmF0aW9uLgo+Cj4gQ3VycmVudGx5LCB0aGlzIHNl
cmllcyBpcyB1c2VmdWwgZm9yIHBlb3BsZSB0aGF0IHVzZXMgYSBTQkkgdGhhdCBkb2VzCj4gbm90
IGhhbmRsZWQgbWlzYWxpZ25lZCB0cmFwcy4gSW4gYSBuZWFyIGZ1dHVyZSwgdGhpcyBzZXJpZXMg
d2lsbCBtYWtlCj4gdXNlIGEgU0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dpbmcgdG8gcmVxdWVzdCBk
ZWxlZ2F0aW9uIG9mIHRoZQo+IG1pc2FsaWduZWQgbG9hZC9zdG9yZSB0cmFwcyB0byB0aGUgUy1t
b2RlIHNvZnR3YXJlLiBUaGlzIGV4dGVuc2lvbiBoYXMKPiBiZWVuIHN1Ym1pdHRlZCBmb3IgcmV2
aWV3IHRvIHRoZSByaXNjdiB0ZWNoLXBycyBncm91cC4gQW4gT3BlblNCSQo+IGltcGxlbWVudGF0
aW9uIGZvciB0aGlzIHNwZWMgaXMgYXZhaWxhYmxlIGF0IFsyXS4KCkZvciBteSBvd24gZWR1Y2F0
aW9uLCBob3cgZG9lcyB0aGUgbmV3IFNCSSBjYWxsIGJlaGF2ZSB3aXRoIHJlc3BlY3QgdG8KbXVs
dGlwbGUgaGFydHM/IERvZXMgYSBjYWxsIHRvIGNoYW5nZSBhIGZlYXR1cmUgcGVyZm9ybSB0aGF0
IGNoYW5nZQphY3Jvc3MgYWxsIGhhcnRzLCBvciBqdXN0IHRoZSBoYXJ0IHRoZSBTQkkgY2FsbCB3
YXMgbWFkZSBvbj8gSWYgdGhlCmFuc3dlciBpcyAiYWxsIGhhcnRzIiwgd2hhdCBpZiBub3QgYWxs
IGhhcnRzIGFyZSBleGFjdGx5IHRoZSBzYW1lLCBhbmQKc29tZSBjYW4gZW5hYmxlIHRoZSBmZWF0
dXJlIHN3aXRjaCB3aGlsZSBvdGhlcnMgY2Fubm90PyBBbHNvIGlmIHRoZQphbnN3ZXIgaXMgImFs
bCBoYXJ0cyIsIGRvZXMgaXQgYWxzbyBhcHBseSB0byBob3RwbHVnZ2VkIGNwdXMsIHdoaWNoCm1h
eSBub3QgaGF2ZSBldmVuIGV4aXN0ZWQgYXQgYm9vdCB0aW1lPwoKV2hhdCBoYXBwZW5zIGlmIGEg
aGFydCBnb2VzIHRocm91Z2ggYSBjb250ZXh0IGxvc3MgZXZlbnQsIGxpa2UKc3VzcGVuZC9yZXN1
bWU/IElzIHRoZSBzZXR0aW5nIGV4cGVjdGVkIHRvIGJlIHN0aWNreSwgb3IgaXMgdGhlIGtlcm5l
bApleHBlY3RlZCB0byByZXBsYXkgdGhlc2UgY2FsbHM/CgotRXZhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
