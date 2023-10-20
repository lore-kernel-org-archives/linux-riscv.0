Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF8ECDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BE9d5Kq9q4mFNLYU2IA9cJMCS5y+s0NYPvbuBk/CAj0=; b=ny9g3pplz/jpcG
	WuSkg1ivrZStPdYLihbS9Hhs836riB1q9IRdEfnq5L+XOcL5Kobro5IiMvLRun9z7S+UzEBXhcGmd
	tt/P9yV7HvUPJyZAh92PvAjVZGi/m/VCz30/d3h5JcCtpHcv7XnsS2veoRMS0q4YpuHe192DlokNA
	2gJyqv7fPWo0cwdSozWyh0nM/ZpNTQjEUOURIQZf8yx+BMuExrRbEKYBN8HBbWN7kMpHIdjHrA/tn
	TR85h9mYxh77C+OCMLIuDUeFfIIVtn8FjyMgnHeA4vkrtsJPdmt2Kp7ayTHcMNo3+HjFvTraNhq83
	hYBkiQjp1GF0MIVSs/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmOw-001k23-35;
	Fri, 20 Oct 2023 10:06:42 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmOt-001k18-1W
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 10:06:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso506784b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 03:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697796398; x=1698401198; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0YOpu7rT/QqTy8iuI5dRazXgRC1Ukab7cBL+9gy4Ic=;
        b=OzdQCWAvRZkkl7i+S7pW5amTsBRV2xmPGGYrCGqn/txUWezXxm00QBC3rUjKLvDIEL
         tlmaiMCGN6Cv2V7Q4wW+JnfRb1FjR3QgWPTD0+JgeIGzNPnh1o9t8xkes3friE/2q55w
         TzYbd+imMDD9Gmf7yxRqAat8EQsLZfaLmGwaGFkkiUQMoNe46sRRhzqyPUlkSz3QZAiu
         ToelwjaSOhz+T84RFuR770qkTk9XhNtnnLXKX5oF/mEagKsu+i/7xZRXZ9i5YwW6P8he
         4a3Y+iK5CMNupdNV/iSlOY3y0omyoKGupafuhDhkmft6h7A3GGIAjnQmGTtWhkU45vRE
         f2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697796398; x=1698401198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0YOpu7rT/QqTy8iuI5dRazXgRC1Ukab7cBL+9gy4Ic=;
        b=swqncgxLOoUGtrSc/aebHGwbcJmtNUHkvB6MOkBYr9Gh7d7ngNLVyvMzjVoUkSSwEr
         6UCDkf6Amxml9jEHEHgaoc8tqNeNRTw7RzPES5WRU0yQb9Hrhb1aIg4U5isH7Vt2u4v9
         bfhoFrh0ht6qCn32DRur6Zq2wc87kkEti9R7DwAomElVwQKVvgFHD73oLbyYPN9yHjsV
         RF2cf0KANexvlDoqFtYax4Qg6kgp6XZF2k+1+InheCN69UZwLd4ezLj1SWZSVeK/JMBu
         ZjjVOZt3vZqr5OIJuYhRgHdlwdhCUsz+UYHXFlHjv4sDogPVsMdgeTte8VQVrqH0UXzq
         R+pw==
X-Gm-Message-State: AOJu0Yxp4FqGSsfjn9gm/u3vl+C1FNPyuNZBhoZCFMN8fkBmCYwZncAs
	LHkGPFsUIDdzraDayvMauWG3X0R+R5gPZ8DQcvQPtw==
X-Google-Smtp-Source: AGHT+IEBzXt8JfC9x1TW5x5JgWjODdGFRcged+43rxtT/zbYgt03X8xn6eJrhjX3Tc0jf12JuE1HThvuDkHZ4TvXIUs=
X-Received: by 2002:a05:6a21:1a5:b0:17a:e981:817e with SMTP id
 le37-20020a056a2101a500b0017ae981817emr1962557pzb.3.1697796398116; Fri, 20
 Oct 2023 03:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com> <87mswdbot2.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87mswdbot2.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 15:36:25 +0530
Message-ID: <CAK9=C2XrDCpq6cGCJu2CVowiksxunGwfF4JxwEZ_k85+3bU1+Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI driver
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_030639_536337_00F79152 
X-CRM114-Status: GOOD (  19.92  )
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

T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMzoyNeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+
IHdyaXRlczoKPgo+ID4gRnJvbTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4g
Pgo+ID4gUklTQy1WIFNCSSBzcGVjaWZpY2F0aW9uIHN1cHBvcnRzIGFkdmFuY2VkIGRlYnVnIGNv
bnNvbGUKPiA+IHN1cHBvcnQgdmlhIFNCSSBEQkNOIGV4dGVuc2lvbi4KPiA+Cj4gPiBFeHRlbmQg
dGhlIEhWQyBTQkkgZHJpdmVyIHRvIHN1cHBvcnQgaXQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVw
IFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvdHR5
L2h2Yy9LY29uZmlnICAgICAgICAgfCAgMiArLQo+ID4gIGRyaXZlcnMvdHR5L2h2Yy9odmNfcmlz
Y3Zfc2JpLmMgfCA4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdHR5L2h2Yy9LY29uZmlnIGIvZHJpdmVycy90dHkvaHZjL0tjb25m
aWcKPiA+IGluZGV4IDRmOTI2NGQwMDVjMC4uNmUwNWM1YzdiY2ExIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy90dHkvaHZjL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L2h2Yy9LY29uZmln
Cj4gPiBAQCAtMTA4LDcgKzEwOCw3IEBAIGNvbmZpZyBIVkNfRENDX1NFUklBTElaRV9TTVAKPiA+
Cj4gPiAgY29uZmlnIEhWQ19SSVNDVl9TQkkKPiA+ICAgICAgIGJvb2wgIlJJU0MtViBTQkkgY29u
c29sZSBzdXBwb3J0Igo+ID4gLSAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQklfVjAxCj4gPiArICAg
ICBkZXBlbmRzIG9uIFJJU0NWX1NCSQo+ID4gICAgICAgc2VsZWN0IEhWQ19EUklWRVIKPiA+ICAg
ICAgIGhlbHAKPiA+ICAgICAgICAgVGhpcyBlbmFibGVzIHN1cHBvcnQgZm9yIGNvbnNvbGUgb3V0
cHV0IHZpYSBSSVNDLVYgU0JJIGNhbGxzLCB3aGljaAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMgYi9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5j
Cj4gPiBpbmRleCAzMWY1M2ZhNzdlNGEuLjU2ZGExYTRiNWFjYSAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvdHR5L2h2Yy9odmNfcmlzY3Zfc2JpLmMKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L2h2Yy9o
dmNfcmlzY3Zfc2JpLmMKPiA+IEBAIC0zOSwyMSArMzksODkgQEAgc3RhdGljIGludCBodmNfc2Jp
X3R0eV9nZXQodWludDMyX3QgdnRlcm1ubywgY2hhciAqYnVmLCBpbnQgY291bnQpCj4gPiAgICAg
ICByZXR1cm4gaTsKPiA+ICB9Cj4gPgo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHZfb3BzIGh2
Y19zYmlfb3BzID0gewo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHZfb3BzIGh2Y19zYmlfdjAx
X29wcyA9IHsKPiA+ICAgICAgIC5nZXRfY2hhcnMgPSBodmNfc2JpX3R0eV9nZXQsCj4gPiAgICAg
ICAucHV0X2NoYXJzID0gaHZjX3NiaV90dHlfcHV0LAo+ID4gIH07Cj4gPgo+ID4gLXN0YXRpYyBp
bnQgX19pbml0IGh2Y19zYmlfaW5pdCh2b2lkKQo+ID4gK3N0YXRpYyBpbnQgaHZjX3NiaV9kYmNu
X3R0eV9wdXQodWludDMyX3QgdnRlcm1ubywgY29uc3QgY2hhciAqYnVmLCBpbnQgY291bnQpCj4g
PiAgewo+ID4gLSAgICAgcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhodmNfYWxsb2MoMCwgMCwgJmh2
Y19zYmlfb3BzLCAxNikpOwo+ID4gKyAgICAgcGh5c19hZGRyX3QgcGE7Cj4gPiArICAgICBzdHJ1
Y3Qgc2JpcmV0IHJldDsKPiA+ICsKPiA+ICsgICAgIGlmIChpc192bWFsbG9jX2FkZHIoYnVmKSkg
ewo+ID4gKyAgICAgICAgICAgICBwYSA9IHBhZ2VfdG9fcGh5cyh2bWFsbG9jX3RvX3BhZ2UoYnVm
KSkgKyBvZmZzZXRfaW5fcGFnZShidWYpOwo+ID4gKyAgICAgICAgICAgICBpZiAoUEFHRV9TSVpF
IDwgKG9mZnNldF9pbl9wYWdlKGJ1ZikgKyBjb3VudCkpCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgY291bnQgPSBQQUdFX1NJWkUgLSBvZmZzZXRfaW5fcGFnZShidWYpOwo+Cj4gVGhhbmtzIGZv
ciBmaXhpbmcgdGhlIGNyb3NzLXBhZ2UgaXNzdWUuIE5vdyB5b3UncmUgY3V0dGluZyB0aGUgYnVm
ZmVyCj4gb2ZmLiBXaGF0IGFib3V0IGRvaW5nIHR3byBTQkkgY2FsbHMgaW5zdGVhZD8gKERpdG8g
b24gdGhlIGdldCBzaWRlKQoKV2UgZG9uJ3QgbmVlZCB0byBoYW5kbGUgdGhhdCBiZWNhdXNlIHRo
ZSBodmNfY29uc29sZSBmcmFtZXdvcmsKd2lsbCBlbnN1cmUgcmVtYWluaW5nIGNoYXJhY3RlcnMg
YXJlIHNlbnQtb3V0LiBTYW1lIGFwcGxpZXMgdG8KZ2V0IHNpZGUgYXMgd2VsbC4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
