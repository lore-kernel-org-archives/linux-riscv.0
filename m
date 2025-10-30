Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F27CCF9F6
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 06:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0W4CfunbV24GVES1c8XngVT2uyIV2N1Elkd7FHseqsU=; b=NTADoCU8NhzJod
	iN0ODGblSBoE6iMz/ystTa4ukftSCFftRZJoXheV/3Ptg+muJgvUSK+Zn0lAzahql06WGGeCh7AiD
	9Pq/SzA+LOnHqIlAxqu+E/t9we0eI47yvMdZvQ4bxxPlIeDZvv0hCjWKiUFQPsNK4bXJsN9aY0p8D
	yMXn324YSVJLnLvJC0n1xbTtUttKF1kbnesFVrPGQYWJcfQwiTLQj8mfFW9rabUihUGDeNjedreom
	tz24H/I/Tq+Oy3C4Ej+OhlsRU6Sa/O7EkrckVxzB+TdS4Celfu9hVm6WH5Xy4qYx8A7tabnzsrbea
	tclUApbOmyoxyfPuCPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELoa-00000003Xpi-378L;
	Thu, 30 Oct 2025 06:07:16 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELoY-00000003XpJ-3Lq0
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 06:07:15 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-430e182727dso2490805ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 23:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1761804434; x=1762409234; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2oOVPuOCfFeYpVN2DHmuplgz6ll1JdAv6+U3SGE1nM=;
        b=Pqh/STUbfRb/+vYTTVoceuuNZPA6hmPSoCIMcxMLRqN2i5Rvo6rhD/v10X7CI+Jy12
         G2ni/Yx3ZRhy4XTBLpjbhpomvP/yVfylqVSOtEjKW96ltWWa75t8Bcd3ppfOY6hHwYUm
         YMFUNZy7U++aHOWrxqKiy4A3BTj5OTJ8yr6r71ESUKgksr2PIZOgEgS7cDGPPkdye4oT
         Sn+yOk6HoA9+/N1Kd1lJB0cQvTviSdHx/Ej0LJIllEHT2Sa8ze+G2LEv7ZcG34zmfwY9
         nR8ZZymBnEasM8W6G3pxYDBwKKDgs/g42UbcDLK/ceEI0BgNgl+8gVMPWfDvnG8MDKrA
         +Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761804434; x=1762409234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2oOVPuOCfFeYpVN2DHmuplgz6ll1JdAv6+U3SGE1nM=;
        b=qNkqTXK3sRnwkrGqwJo6yybzKGf5rOtfIdk5JiVTYKlP9oBI+QAgxpUIbEgUxZH3pq
         KoXj7QF7PjB75KBF/Lr3ABsquFuy0wnCh+Cc9kTMVqpMDVDla62RwaaBBgve0YRIYuFu
         O2TnC9F79F62KlrEIt28UYxJPsorn+K49BhtkVYIQvTQ5q06RcUYT1pMjT3Ss+R4cSi7
         bHFYYUQF/rgYLxVplEMukzxy8Yonw8oJ/8u8udAWtI+O2DNovnIt9ZLoveNkxmwaQ2bA
         WKgsJ5DnJXoJLYijjyrk7S13ZSLYJBNlcJyNHWDPvEC3XDzQuHNYNU3/EXCYPxFCzX49
         kudg==
X-Forwarded-Encrypted: i=1; AJvYcCV1UknfYjutNM+rhJDvpET9N7CkZPAHXdyRe4dSkPbwmK/Bp+is36uNg0hUMYel2opw64+QU4WBIiZDEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXkA3RN7PYVvWGXKghck7doi4LpVdNDflm+mGoB2Kd7NsxSg4u
	MqfZW7f0hWyHTAXxvLJ6QLFZjSFZAAE/vN1lomKregE98ebPTWvCe+zXr/PGXl6fk/xCPMqVAAg
	IKaxFc5PlqjSNsLrHQJiZJy4063AfGGsyNEg/jiHf0g==
X-Gm-Gg: ASbGncvbZmJzNGDuobxoN3iVaZJsrLNDBJ48W7cATLSbg5P2cBISLkL1b3DXmagJsUk
	Z8qBCuT1W62kyIG3QBCh+UI6HXYpNcaLlp8aMJAAZzxE6l12xkicS8OrV1XaRZRAPkwvO/U7lQy
	11C36ZTauJuW7DCxyg8wqwrZ5ZMAoy03ghvx+/F4s6xrs4lGKsS4xRp9xgINUJumu1NPiQBv6i5
	bElsYHgqAUzHa/CIAgHhoPEBgWgaqSZ7ssrAm3yKQglSaNODiWuiBaswjsKJT/vUee0Af/KrGTx
	l2N0CMfrNOkz0SUcewznUjaIuguz
X-Google-Smtp-Source: AGHT+IF2w8g1ojnDyGQLFzRzdE61uNp4FTHmi/dw+D9zx9iGIJ1bDIJjlMRj6txF7f56YSZyhxHtxSGceOGnH7lmkQU=
X-Received: by 2002:a05:6e02:4714:b0:432:fbe2:3605 with SMTP id
 e9e14a558f8ab-432fbe23809mr44060065ab.11.1761804433543; Wed, 29 Oct 2025
 23:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251014132106.181155-1-apatel@ventanamicro.com>
 <20251014132106.181155-2-apatel@ventanamicro.com> <012aaa39-a37b-e682-0e34-9b7d7cd87f75@kernel.org>
In-Reply-To: <012aaa39-a37b-e682-0e34-9b7d7cd87f75@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Oct 2025 11:37:00 +0530
X-Gm-Features: AWmQ_bmMf5OoHFiUJY6zI6JVVcFsxCAmo8ACbrb1vAID1QwfAgdvKVsJ-cC2OvY
Message-ID: <CAAhSdy0iwq_ZPzFY5_x_wsbM_H+npSDVv1F=wP=O-_25VChh6Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
To: Paul Walmsley <pjw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_230714_846058_922A2E1D 
X-CRM114-Status: GOOD (  23.15  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Atish Patra <atish.patra@linux.dev>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMzAsIDIwMjUgYXQgMTI6MzXigK9BTSBQYXVsIFdhbG1zbGV5IDxwandAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gT24gVHVlLCAxNCBPY3QgMjAyNSwgQW51
cCBQYXRlbCB3cm90ZToKPgo+ID4gSW4gUklTQy1WLCB0aGVyZSBpcyBubyBDU1IgcmVhZC93cml0
ZSBpbnN0cnVjdGlvbiB3aGljaCB0YWtlcyBDU1IKPiA+IG51bWJlciB2aWEgcmVnaXN0ZXIgc28g
YWRkIGNvbW1vbiBjc3JfcmVhZF9udW0oKSBhbmQgY3NyX3dyaXRlX251bSgpCj4gPiBmdW5jdGlv
bnMgd2hpY2ggYWxsb3cgYWNjZXNzaW5nIGNlcnRhaW4gQ1NScyBieSBwYXNzaW5nIENTUiBudW1i
ZXIKPiA+IGFzIHBhcmFtZXRlci4gVGhlc2UgY29tbW9uIGZ1bmN0aW9ucyB3aWxsIGJlIGZpcnN0
IHVzZWQgYnkgdGhlCj4gPiBBQ1BJIENQUEMgZHJpdmVyIGFuZCBSSVNDLVYgUE1VIGRyaXZlci4K
PiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNv
bT4KPiA+IFJldmlld2VkLWJ5OiBTdW5pbCBWIEwgPHN1bmlsdmxAdmVudGFuYW1pY3JvLmNvbT4K
PiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+
ID4gUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gUmV2
aWV3ZWQtYnk6IE51dHR5IExpdSA8bnV0dHkubGl1QGhvdG1haWwuY29tPgo+Cj4gVGhpcyBwYXRj
aCBhbHNvIChzaWxlbnRseSkgcmVtb3ZlcyB0aGUgQ1NSIG51bWJlciBmaWx0ZXJpbmcsIGUuZy4K
Pgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMgYi9kcml2ZXJzL2Fj
cGkvcmlzY3YvY3BwYy5jCj4gPiBpbmRleCA0MmMxYTkwNTI0NzAuLmZlNDkxOTM3ZWQyNSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHBjLmMKPiA+ICsrKyBiL2RyaXZlcnMv
YWNwaS9yaXNjdi9jcHBjLmMKPiA+IEBAIC02NSwyNCArNjUsMTkgQEAgc3RhdGljIHZvaWQgc2Jp
X2NwcGNfd3JpdGUodm9pZCAqd3JpdGVfZGF0YSkKPiA+ICBzdGF0aWMgdm9pZCBjcHBjX2ZmaF9j
c3JfcmVhZCh2b2lkICpyZWFkX2RhdGEpCj4gPiAgewo+ID4gICAgICAgc3RydWN0IHNiaV9jcHBj
X2RhdGEgKmRhdGEgPSAoc3RydWN0IHNiaV9jcHBjX2RhdGEgKilyZWFkX2RhdGE7Cj4gPiArICAg
ICBpbnQgZXJyOwo+ID4KPiA+IC0gICAgIHN3aXRjaCAoZGF0YS0+cmVnKSB7Cj4gPiAtICAgICAv
KiBTdXBwb3J0IG9ubHkgVElNRSBDU1IgZm9yIG5vdyAqLwo+ID4gLSAgICAgY2FzZSBDU1JfVElN
RToKPiA+IC0gICAgICAgICAgICAgZGF0YS0+cmV0LnZhbHVlID0gY3NyX3JlYWQoQ1NSX1RJTUUp
Owo+ID4gLSAgICAgICAgICAgICBkYXRhLT5yZXQuZXJyb3IgPSAwOwo+ID4gLSAgICAgICAgICAg
ICBicmVhazsKPiA+IC0gICAgIGRlZmF1bHQ6Cj4gPiAtICAgICAgICAgICAgIGRhdGEtPnJldC5l
cnJvciA9IC1FSU5WQUw7Cj4gPiAtICAgICAgICAgICAgIGJyZWFrOwo+ID4gLSAgICAgfQo+Cj4g
Li4uIHRoZSBhYm92ZSBjb2RlLCBhbmQ6CgpUaGUgc3dpdGNoIGNhc2UgaXMgaW5jb21wbGV0ZSBm
b3IgY3BwY19mZmhfY3NyX3JlYWQoKS4KQWxzbywgY3NyX3JlYWRfbnVtKCkgYWxyZWFkeSBkb2Vz
IGFwcHJvcHJpYXRlIGZpbHRlcmluZwpzbyB0aGUgc3dpdGNoIGNhc2Ugb3ZlciBoZXJlIGlzIG5v
dyByZWR1bmRhbnQuCgo+Cj4gPiAgLyoKPiA+ICAgKiBSZWFkIHRoZSBDU1Igb2YgYSBjb3JyZXNw
b25kaW5nIGNvdW50ZXIuCj4gPiAgICovCj4gPiAgdW5zaWduZWQgbG9uZyByaXNjdl9wbXVfY3Ry
X3JlYWRfY3NyKHVuc2lnbmVkIGxvbmcgY3NyKQo+ID4gIHsKPiA+IC0gICAgIGlmIChjc3IgPCBD
U1JfQ1lDTEUgfHwgY3NyID4gQ1NSX0hQTUNPVU5URVIzMUggfHwKPiA+IC0gICAgICAgIChjc3Ig
PiBDU1JfSFBNQ09VTlRFUjMxICYmIGNzciA8IENTUl9DWUNMRUgpKSB7Cj4gPiAtICAgICAgICAg
ICAgIHByX2VycigiSW52YWxpZCBwZXJmb3JtYW5jZSBjb3VudGVyIGNzciAlbHhcbiIsIGNzcik7
Cj4gPiAtICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gLi4uIHRoZSBhYm92ZSBjb2Rl
Lgo+Cj4gSSdtIHRoaW5raW5nIHRoYXQgd2UgcHJvYmFibHkgd2FudCB0byBrZWVwIHRoZSBDU1Ig
bnVtYmVyIGZpbHRlcmluZyBjb2RlCj4gaW47IGF0IGxlYXN0LCBJIGNhbid0IHRoaW5rIG9mIGEg
Z29vZCByZWFzb24gdG8gcmVtb3ZlIGl0LiAgQ2FyZSB0byBhZGQgaXQKPiBiYWNrIGluPwoKV2Ug
Y2FuIHBvdGVudGlhbGx5IGhhdmUgY3VzdG9tIENTUnMgYXMgaGFyZHdhcmUgY291bnRlcnMKaGVu
Y2UgdGhlIENTUiBmaWx0ZXJpbmcgb3ZlciBoZXJlIGlzIGFscmVhZHkgaW5jb21wbGV0ZS4gUGx1
cywKY3NyX3JlYWRfbnVtKCkgYWxyZWFkeSBkb2VzIHRoZSBDU1IgZmlsdGVyaW5nIGFuZCByZXR1
cm5zCmZhaWx1cmUgZm9yIGluYXBwcm9wcmlhdGUgQ1NSIG51bWJlci4KClJlZ2FyZHMsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
