Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839A7C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 14:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GB00jB132OLt9Ey0TC2+Soiec6Mm08h9igoxPMI7kzQ=; b=1yVS113qX9zvyt
	BQ2RcqGhLXWbE4B+SZPAJab/H0/SF9FVwZ6OzbgIJ7/kVdlFi7nQ3bMKZLlg30bCzimPER87sMSrx
	5qNI+1CXF5QGcPQNYmzq0MlcfFzewp3mjUr2eWzFXOp7Z3CIdGeGlxggZxz9lSdTZp7l9W1YtADvw
	vIfevW1B/R7Q9ZAFJFu6LPbm51jroZjIcnVOHu9qrk/TPK1IlRaBOYRODtyc7CtXSJ/sTdlkIEnN2
	OUdh0TTwjrGbrVUNaBGOuKgNqTJGyYg06ugViSbE2zOuv91EXxBMbUBfcPmNGQgdaxkdlLeKeC3BC
	Y12i4AXSXRESZFzZaXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Anf-00FiWK-0e;
	Mon, 05 Jun 2023 14:03:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Anb-00FiTj-2J
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 14:03:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6ef9a928fso40754185e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685973782; x=1688565782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TpTdF2O/cApQ1f8cCRIskXNZxv29sK1ejd0fKQhf0A=;
        b=C0kOoFwZI7gBQMp/Tv/Ev346Vqn39Qz6k9uo241DZp0B0A3B9BKADk+fVB9WNfdZNz
         apwt9PWDETqF2SOX7E/h0q1yEiCJ/lx4vxtysqO9QvufT13mqG6uc1LJ+6uEsUavKEA1
         SKCzaEtMLdpl8bRC3mwCBzyvzw6lABO2K+NYuJAgZwZcqpH67c9AkVrba2xgjRAnv4a4
         eukbdi3aBYszu+O8ojl8ip3il+ThyIlWjjdQPsR674II8p5cem7ZA9GA6r/v3QSbS1XL
         brRQyn5j73kOhV36J8ELB34s5rit/+/9MGYyyMJFhDTBUjGVSRGszf7kbNe65ucMMfdA
         YGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685973782; x=1688565782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TpTdF2O/cApQ1f8cCRIskXNZxv29sK1ejd0fKQhf0A=;
        b=Q9/V2E7uaYR/Pr2Ailmu0zkpM7dDVxoHxYqkUluUogg3l5EXxNTBtAoajQvPG7DHMh
         ATA4ieMDmbvG2Wm6H/HSItg4T4lQ/2VZNnl2fJMBn8rk44UrAyK0UZCNftkW0g20pjg5
         IBYKUbz6F9S0xrKng5QTxkLOFgfaUZfHQ4wgrppR7AO5FgxR63iQoFJ4Ab6vsqQpV2Rn
         tYsBLr5X6n9H4hg2fCWeMepwvd79PCJrYBwxiPq1MzXPTr2NabLA6TJi0CTavwREp0Xl
         BCydXSp3A9Y9CAWWsTj1Ay7x8++/Ebh85iGm9fuSpQOoVyCSrl6WBdkdAvNC15WJhibU
         nbUA==
X-Gm-Message-State: AC+VfDxGfZC+q/8zystqfBy0CRLwx4rzDVXYrrK6Flvfu1BYUKqcivNe
	EgYFSu2W9w69lHmKITFcedCZAj6WUg8BUFk3lRWI4w==
X-Google-Smtp-Source: ACHHUZ7NakWJkFLD7elRYzpOCRLCQT0EUX48KZ9XktEDXyOh5eBAI+rcnWmdoAItU1aaYSTk+xTAlGnia4YfRKzxDzg=
X-Received: by 2002:a5d:5490:0:b0:30e:3e6f:3682 with SMTP id
 h16-20020a5d5490000000b0030e3e6f3682mr2185459wrv.5.1685973782326; Mon, 05 Jun
 2023 07:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
 <20230512085321.13259-11-alexghiti@rivosinc.com> <20230531-31bd9ddeaca8cb338f81ed14@orel>
 <ZH3ovt4WnTJuTinF@kernel.org>
In-Reply-To: <ZH3ovt4WnTJuTinF@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 5 Jun 2023 16:02:51 +0200
Message-ID: <CAHVXubgr5=c0c7wMWTHjJw-TWE8vLtUEqcNRabNzdU4zZtnvvA@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] perf: tests: Adapt mmap-basic.c for riscv
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_070307_751273_9FBF0717 
X-CRM114-Status: GOOD (  18.58  )
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

KHNvcnJ5IG1haWwgY2xpZW50IHN3aXRjaGVkIHRvIGh0bWwgb24gaXRzIG93bikKCk9uIE1vbiwg
SnVuIDUsIDIwMjMgYXQgMzo1M+KAr1BNIEFybmFsZG8gQ2FydmFsaG8gZGUgTWVsbyA8YWNtZUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEVtIFdlZCwgTWF5IDMxLCAyMDIzIGF0IDA1OjE1OjE1UE0g
KzAyMDAsIEFuZHJldyBKb25lcyBlc2NyZXZldToKPiA+IE9uIEZyaSwgTWF5IDEyLCAyMDIzIGF0
IDEwOjUzOjIxQU0gKzAyMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+ID4gcmlzY3Ygbm93
IHN1cHBvcnRzIG1tYXBpbmcgaGFyZHdhcmUgY291bnRlcnMgdG8gdXNlcnNwYWNlIHNvIGFkYXB0
IHRoZSB0ZXN0Cj4gPiA+IHRvIHJ1biBvbiB0aGlzIGFyY2hpdGVjdHVyZS4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+
ID4gPiAtLS0KPiA+ID4gIHRvb2xzL3BlcmYvdGVzdHMvbW1hcC1iYXNpYy5jIHwgNCArKy0tCj4g
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMgYi90b29s
cy9wZXJmL3Rlc3RzL21tYXAtYmFzaWMuYwo+ID4gPiBpbmRleCBlNjhjYTYyMjk3NTYuLmY1MDc1
Y2E3NzRmOCAxMDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMK
PiA+ID4gKysrIGIvdG9vbHMvcGVyZi90ZXN0cy9tbWFwLWJhc2ljLmMKPiA+ID4gQEAgLTI4NCw3
ICsyODQsNyBAQCBzdGF0aWMgc3RydWN0IHRlc3RfY2FzZSB0ZXN0c19fYmFzaWNfbW1hcFtdID0g
ewo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAicGVybWlzc2lvbnMiKSwKPiA+ID4gICAgIFRF
U1RfQ0FTRV9SRUFTT04oIlVzZXIgc3BhY2UgY291bnRlciByZWFkaW5nIG9mIGluc3RydWN0aW9u
cyIsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgIG1tYXBfdXNlcl9yZWFkX2luc3RyLAo+ID4g
PiAtI2lmIGRlZmluZWQoX19pMzg2X18pIHx8IGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5l
ZChfX2FhcmNoNjRfXykKPiA+ID4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9f
eDg2XzY0X18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pIHx8IF9fcmlzY3ZfeGxlbiA9PSA2NAo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAicGVybWlzc2lvbnMiCj4gPiA+ICAjZWxzZQo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAidW5zdXBwb3J0ZWQiCj4gPiA+IEBAIC0yOTIsNyArMjky
LDcgQEAgc3RhdGljIHN0cnVjdCB0ZXN0X2Nhc2UgdGVzdHNfX2Jhc2ljX21tYXBbXSA9IHsKPiA+
ID4gICAgICAgICAgICAgKSwKPiA+ID4gICAgIFRFU1RfQ0FTRV9SRUFTT04oIlVzZXIgc3BhY2Ug
Y291bnRlciByZWFkaW5nIG9mIGN5Y2xlcyIsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgIG1t
YXBfdXNlcl9yZWFkX2N5Y2xlcywKPiA+ID4gLSNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZp
bmVkKF9feDg2XzY0X18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pCj4gPiA+ICsjaWYgZGVmaW5l
ZChfX2kzODZfXykgfHwgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9f
KSB8fCBfX3Jpc2N2X3hsZW4gPT0gNjQKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgInBlcm1p
c3Npb25zIgo+ID4gPiAgI2Vsc2UKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgInVuc3VwcG9y
dGVkIgo+ID4gPiAtLQo+ID4gPiAyLjM3LjIKPiA+ID4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogQW5k
cmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPgo+IFdhcyB0aGUga2VybmVsIHBh
cnQgbWVyZ2VkIHVwc3RyZWFtPwoKTm8sIEkgc3RpbGwgaGF2ZW4ndCBhbnN3ZXJlZCB0aGUgcmV2
aWV3cyA6KQoKPgo+IC0gQXJuYWxkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
