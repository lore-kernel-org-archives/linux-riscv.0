Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA43C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 03:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUEH8zuApAFcCEQo0hfxGU9uj6e0ssnFl/fXp73yP9c=; b=M6R+QCHnj9rP9e
	nPQywSjb/hDYSwBarN5szAIU9cqAhJPsAj+yS/HqfFGRvwkXXKKDsmOgT18yCzdP/h9dD7xjB58yJ
	8RsZXdvrMv2NEWRRh/SD5usMYi+4RXoRoJySz7HVhepAUe1BTnet/K0tc/SPZ0a4d1AiKi1+o8eZA
	lR9Y5T24CMrFLB9344u5dcIkWLGLgj8X2U8Uv/0Vzd2zmZkRT5o9vMFeQGkeURX/JKZOfXmCTCUeC
	nHUvNJ1du4baCMibHCtBnItU6flyV6MO8BTN6s7Ap22wErxmEQdqbixEQv6TEg/MDvyRxWRntjgoO
	b+eFvQj4ZhnoWITxpsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZkr-0000000Ah4w-10K6;
	Tue, 16 Apr 2024 03:45:09 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwZkn-0000000Ah35-1xoV
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 03:45:08 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-36aff02f998so14849175ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 20:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713239103; x=1713843903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjVNvZt22r+EWb4gHg+TxC04BE92vOXLHjn3wNYwKN4=;
        b=ce508o/wLnvW1DdFeQ5qz22aamzj2SyJ+plHwoa3lVysC714ofikeRDxoYuboLqrAz
         md7QUnwDGLwvOCr5gRYf7M1IEiKlah4MOe19q6zBdZ40jTy4Ld8mzkaJhFIiNcvh3PAV
         9GzsUQOqP4eTG1NtUtNE2u7MGXhUw4ZNQnqiTd2jgRrqVGPc3gv7olM3egW/1ZW7AolQ
         Een2u+RPqNmyDoHl0bFXz0QRkv11nw0c2OhN3ENW+3m8vx5SaoxulHJLCzN++PGaU3U5
         oed7149VVxQRwDKlFhxKjCIEuIJHOncBkoZwrAM+lQI5Qj/wG407KF6LJMyViqDYPvg3
         D0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713239103; x=1713843903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjVNvZt22r+EWb4gHg+TxC04BE92vOXLHjn3wNYwKN4=;
        b=xCB73UUhtEhLMCMVqHjDbHoCulJtKoHF+b+3ZpunJr4wTKbbiT8t8BbL7NrGJP2V1h
         1SVD416PkXftXdKudWiEEQ6fTVXlGUQPg15wqIw2vpFJQuPSlS/Z79hwj8YjIFgnAH9E
         wVG26fKT7RevE6Z1k39nrkChJXcG1tXs1dlrocmS/j+jItUc5KvsNuMZyfdkG9CBpauR
         3Zlv93B842rJdYSGCA3TkmfNcdxdtbrqcoxZfm8ez9zvXhipxSH9XZ3VUsluX3jCD/nZ
         o6ztAhcmJljKsbzF0ZD9hjBxZa1UQAeN1I/MlIWSoQGDycanAyNBTM/w19WdVeJDykN4
         EeDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhihIFbhA8gzn9//0591LjQDO4v4wcM7BmtIB42/Ouk5S4O6IrRh1qZKcX/uFxnyx0KSK/DsDoRmnoDnLVrdJ+AVN/ay5oPa0B+xrljHuB
X-Gm-Message-State: AOJu0YzKg3Yk8piyHxDAtpqjvFNEbxGoLdZQp+EqjjWwD9qCOxsxtMwb
	/uCtqEQTJ30TVLeNlXqTQxYXE8kHj6NlmgFhD6oi2Yph5MiucYwabiD8U7lMjpuumJWnBs5EZbz
	EV0x/h6vP7sLci2HizNQfjLfq3q/VccqzREHe5Q==
X-Google-Smtp-Source: AGHT+IFEdx6IwRBvg4lNdFx2fXV/SWpM2kkTaLW4RM2l5CIWFBgkJACESXjv1JNdZwpHPIEff6N3sNB/wyIhY+32lZw=
X-Received: by 2002:a05:6e02:1a0f:b0:36b:46b:133b with SMTP id
 s15-20020a056e021a0f00b0036b046b133bmr14616355ild.13.1713239103552; Mon, 15
 Apr 2024 20:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240415031131.23443-1-liangshenlin@eswincomputing.com> <20240415031131.23443-2-liangshenlin@eswincomputing.com>
In-Reply-To: <20240415031131.23443-2-liangshenlin@eswincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Apr 2024 09:14:51 +0530
Message-ID: <CAAhSdy1D9x4GJVrXJMzzqU-2iYLxduSHeRvxezmeBTQhgcruJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] RISCV: KVM: add tracepoints for entry and exit events
To: Shenlin Liang <liangshenlin@eswincomputing.com>
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_204505_703068_82BB48A0 
X-CRM114-Status: GOOD (  16.37  )
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

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgODo0NeKAr0FNIFNoZW5saW4gTGlhbmcKPGxpYW5nc2hl
bmxpbkBlc3dpbmNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gTGlrZSBvdGhlciBhcmNoaXRlY3R1
cmVzLCBSSVNDViBLVk0gYWxzbyBuZWVkcyB0byBhZGQgdGhlc2UgZXZlbnQKPiB0cmFjZXBvaW50
cyB0byBjb3VudCB0aGUgbnVtYmVyIG9mIHRpbWVzIGt2bSBndWVzdCBlbnRyeS9leGl0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogU2hlbmxpbiBMaWFuZyA8bGlhbmdzaGVubGluQGVzd2luY29tcHV0aW5n
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3RyYWNlLmggfCA2NyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdS5jICB8ICA3ICsrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygr
KQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rdm0vdHJhY2UuaAo+Cj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3RyYWNlLmggYi9hcmNoL3Jpc2N2L2t2bS90cmFjZS5oCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjNkNTQxNzVkODA1Ywo+
IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS90cmFjZS5oCj4gQEAgLTAsMCAr
MSw2NyBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsvKgo+ICsg
KiBUcmFjZXBvaW50cyBmb3IgUklTQy1WIEtWTQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgMjAyNCBC
ZWlqaW5nIEVTV0lOIENvbXB1dGluZyBUZWNobm9sb2d5IENvLiwgTHRkLgo+ICsgKgo+ICsgKi8K
PiArI2lmICFkZWZpbmVkKF9UUkFDRV9LVk1fSCkgfHwgZGVmaW5lZChUUkFDRV9IRUFERVJfTVVM
VElfUkVBRCkKPiArI2RlZmluZSBfVFJBQ0VfS1ZNX0gKPiArCj4gKyNpbmNsdWRlIDxsaW51eC90
cmFjZXBvaW50Lmg+Cj4gKwo+ICsjdW5kZWYgVFJBQ0VfU1lTVEVNCj4gKyNkZWZpbmUgVFJBQ0Vf
U1lTVEVNIGt2bQo+ICsKPiArVFJBQ0VfRVZFTlQoa3ZtX2VudHJ5LAo+ICsgICAgICAgVFBfUFJP
VE8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KSwKPiArICAgICAgIFRQX0FSR1ModmNwdSksCj4gKwo+
ICsgICAgICAgVFBfU1RSVUNUX19lbnRyeSgKPiArICAgICAgICAgICAgICAgX19maWVsZCh1bnNp
Z25lZCBsb25nLCBwYykKPiArICAgICAgICksCj4gKwo+ICsgICAgICAgVFBfZmFzdF9hc3NpZ24o
Cj4gKyAgICAgICAgICAgICAgIF9fZW50cnktPnBjICAgICA9IHZjcHUtPmFyY2guZ3Vlc3RfY29u
dGV4dC5zZXBjOwo+ICsgICAgICAgKSwKPiArCj4gKyAgICAgICBUUF9wcmludGsoIlBDOiAweDAx
NiVseCIsIF9fZW50cnktPnBjKQo+ICspOwo+ICsKPiArVFJBQ0VfRVZFTlQoa3ZtX2V4aXQsCj4g
KyAgICAgICBUUF9QUk9UTyhzdHJ1Y3Qga3ZtX2NwdV90cmFwICp0cmFwKSwKPiArICAgICAgIFRQ
X0FSR1ModHJhcCksCj4gKwo+ICsgICAgICAgVFBfU1RSVUNUX19lbnRyeSgKPiArICAgICAgICAg
ICAgICAgX19maWVsZCh1bnNpZ25lZCBsb25nLCBzZXBjKQo+ICsgICAgICAgICAgICAgICBfX2Zp
ZWxkKHVuc2lnbmVkIGxvbmcsIHNjYXVzZSkKPiArICAgICAgICAgICAgICAgX19maWVsZCh1bnNp
Z25lZCBsb25nLCBzdHZhbCkKPiArICAgICAgICAgICAgICAgX19maWVsZCh1bnNpZ25lZCBsb25n
LCBodHZhbCkKPiArICAgICAgICAgICAgICAgX19maWVsZCh1bnNpZ25lZCBsb25nLCBodGluc3Qp
Cj4gKyAgICAgICApLAo+ICsKPiArICAgICAgIFRQX2Zhc3RfYXNzaWduKAo+ICsgICAgICAgICAg
ICAgICBfX2VudHJ5LT5zZXBjICAgICAgICAgICA9IHRyYXAtPnNlcGM7Cj4gKyAgICAgICAgICAg
ICAgIF9fZW50cnktPnNjYXVzZSAgICAgICAgID0gdHJhcC0+c2NhdXNlOwo+ICsgICAgICAgICAg
ICAgICBfX2VudHJ5LT5zdHZhbCAgICAgICAgICA9IHRyYXAtPnN0dmFsOwo+ICsgICAgICAgICAg
ICAgICBfX2VudHJ5LT5odHZhbCAgICAgICAgICA9IHRyYXAtPmh0dmFsOwo+ICsgICAgICAgICAg
ICAgICBfX2VudHJ5LT5odGluc3QgICAgICAgICA9IHRyYXAtPmh0aW5zdDsKPiArICAgICAgICks
Cj4gKwo+ICsgICAgICAgVFBfcHJpbnRrKCJTRVBDOjB4JWx4LCBTQ0FVU0U6MHglbHgsIFNUVkFM
OjB4JWx4LCBIVFZBTDoweCVseCwgSFRJTlNUOjB4JWx4IiwKPiArICAgICAgICAgICAgICAgX19l
bnRyeS0+c2VwYywKPiArICAgICAgICAgICAgICAgX19lbnRyeS0+c2NhdXNlLAo+ICsgICAgICAg
ICAgICAgICBfX2VudHJ5LT5zdHZhbCwKPiArICAgICAgICAgICAgICAgX19lbnRyeS0+aHR2YWws
Cj4gKyAgICAgICAgICAgICAgIF9fZW50cnktPmh0aW5zdCkKPiArKTsKPiArCj4gKyNlbmRpZiAv
KiBfVFJBQ0VfUlNJQ1ZfS1ZNX0ggKi8KPiArCj4gKyN1bmRlZiBUUkFDRV9JTkNMVURFX1BBVEgK
PiArI2RlZmluZSBUUkFDRV9JTkNMVURFX1BBVEggLgo+ICsjdW5kZWYgVFJBQ0VfSU5DTFVERV9G
SUxFCj4gKyNkZWZpbmUgVFJBQ0VfSU5DTFVERV9GSUxFIHRyYWNlCj4gKwo+ICsvKiBUaGlzIHBh
cnQgbXVzdCBiZSBvdXRzaWRlIHByb3RlY3Rpb24gKi8KPiArI2luY2x1ZGUgPHRyYWNlL2RlZmlu
ZV90cmFjZS5oPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMKPiBpbmRleCBiNWNhOWYyZTk4YWMuLmY0ZTI3MDA0Y2ViOCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
LmMKPiBAQCAtMjEsNiArMjEsOSBAQAo+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiAg
I2luY2x1ZGUgPGFzbS9rdm1fdmNwdV92ZWN0b3IuaD4KPgo+ICsjZGVmaW5lIENSRUFURV9UUkFD
RV9QT0lOVFMKPiArI2luY2x1ZGUgInRyYWNlLmgiCj4gKwo+ICBjb25zdCBzdHJ1Y3QgX2t2bV9z
dGF0c19kZXNjIGt2bV92Y3B1X3N0YXRzX2Rlc2NbXSA9IHsKPiAgICAgICAgIEtWTV9HRU5FUklD
X1ZDUFVfU1RBVFMoKSwKPiAgICAgICAgIFNUQVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBlY2FsbF9l
eGl0X3N0YXQpLAo+IEBAIC03ODIsNiArNzg1LDggQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxf
cnVuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAgICovCj4gICAgICAg
ICAgICAgICAgIGt2bV9yaXNjdl9sb2NhbF90bGJfc2FuaXRpemUodmNwdSk7Cj4KPiArICAgICAg
ICAgICAgICAgdHJhY2Vfa3ZtX2VudHJ5KHZjcHUpOwo+ICsKPiAgICAgICAgICAgICAgICAgZ3Vl
c3RfdGltaW5nX2VudGVyX2lycW9mZigpOwo+Cj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92
Y3B1X2VudGVyX2V4aXQodmNwdSk7Cj4gQEAgLTgyMCw2ICs4MjUsOCBAQCBpbnQga3ZtX2FyY2hf
dmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Cj4gICAgICAgICAgICAgICAg
IGxvY2FsX2lycV9lbmFibGUoKTsKPgo+ICsgICAgICAgICAgICAgICB0cmFjZV9rdm1fZXhpdCgm
dHJhcCk7Cj4gKwo+ICAgICAgICAgICAgICAgICBwcmVlbXB0X2VuYWJsZSgpOwo+Cj4gICAgICAg
ICAgICAgICAgIGt2bV92Y3B1X3NyY3VfcmVhZF9sb2NrKHZjcHUpOwo+IC0tCj4gMi4zNy4yCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
