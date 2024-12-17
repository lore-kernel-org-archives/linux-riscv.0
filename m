Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20577E7716A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 04:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dgbemk9v83J1qLulpg/YxAHu0XEOilSeqcn/VMv7Kw=; b=thx7PlXtv3lgzY
	tE7/MXO0kcKwvZ8qfvDxnb/zWuPafgjL0ODzDTcdPKia8fC3wfEoEapGv8hVKOKJgkM3dgl1nVn/6
	8THTOie+j9W4ALLTgsISp42r9Wj681hfHU+EH1m5GRkK+Mh1f0++xZcung5sVmE5/g+RhY6WB38t0
	1ItDLL+Xj0/fdhKCjom6GX/U+HfH0qNQP0vh+DIq5Xia0DBidmuqOHNNBZBpVjZ3VGoYqlM+YrxYa
	FvviwrY2/lCAy0UtiBnCV3VWUXXPpAGO5SHo0YxQE8TsOZBWMsIdxqSiHLr+ZzosxnnpdSTWG5hm4
	U/65kkcgpemQNs1ft7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPeJ-0000000CBoC-3Cj7;
	Tue, 17 Dec 2024 04:57:35 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNPeH-0000000CBnX-2Ia8
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 04:57:34 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so86905ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Dec 2024 20:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734411452; x=1735016252; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=362/6wPaNoggwJpGGOdG6RgZlj612Z1MukeYbnnzsUo=;
        b=cG053gsTYmORsfAPe3+AmJ6gmz2JI5qV4B+S18nQjqTlN1v41C/1TT6HAdwvBtY6kK
         1Pp33n3kPEn5OJidxDOh8j/GC0NKPiCKxr4rVoi6xkddw5qQfSGcoiUWGhNWypel3Ihg
         L5krfz1wcXnRu17uOpECVPJYYEsGo64VAOAEL1ECO8Bi1jF/5rxdp7WRbROXv9fGU//Q
         twNwi9n96iSGqcWEnvP9c5qDQFIV6BMwIUkTRLePaY9wjt7lw1fkHWZlI3PmAyXyiVg8
         zIlKjGEfvSIC4zRnGvsgMMYzlWBUhdq7JbUXW/g2+Ql5B7yEpmseYAy5bjVToWIaB6vL
         lJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734411452; x=1735016252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=362/6wPaNoggwJpGGOdG6RgZlj612Z1MukeYbnnzsUo=;
        b=TLIw6ngjdpUZ0mQseB7hX7pCpPQ3Yl1wlR2h8oA+4KExyCxoeOpc96djEmLrAkuEaO
         bHPyJG2XdS+obZpbSp0z6tHwul4DOdbIZpCN7LtTsylQ892l2ZcAASyMI/HkR+wBY4as
         dVLpFOQfFwP9e7qDEbB2ePb4hNxTp/c2K3QfvjQz+5v/a4zQ0zs3BPX1WuXD1xpBQQ2r
         iSEUP4WpCoYnnYO7NzMtQKEPjkHKmt2VLkaZl9UK/thwmVBhUOJAjgcBvBBfcUACGooG
         kP+XSvGqcEmbLNCGBBGdVeUNPTOqOWnoWeojvS8GgnOG6o5fkKKACyYWL8lakSvx3T6W
         HyzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxuHTu3ClM3BjAAFqkUtyLmGyI3cJfg1uaoqitV1xWOyv6oDesSuOVekMO6bsmS2C47QoaZznVhSvDdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/rhMVgiLINTTKOZA3eGiXmtn3g+TyPuM1AE5Mxdt7ELPm5TZ+
	8b811TlUSMhEen1Mx5sdKS+jLWobaNQt8e/V57Hg+NIWrGsJhBDVXXovXk7nEbvEXRiAypkmKhT
	HyhR38z1AhWYqXILZrWsKMr4C7iNS/9r2IpxY
X-Gm-Gg: ASbGncu6njRM2dTOm04H+cyezwtOsWKU1IilHcJIzgDda5tYqYcky04qb9/acEqxYzD
	QjbgsaI9YgLpaZdsPaSVLOTi7/N3nWET8xIeGbS0=
X-Google-Smtp-Source: AGHT+IEon0H5P/SgKkxsKeFtvxthHZIZFm7pK/6IZOgc7rOanq4HBnSG1t4asn1594qBhXnfuxhIF4Hwq5/vBKcKGhQ=
X-Received: by 2002:a92:ccc4:0:b0:3a7:ddbb:1b19 with SMTP id
 e9e14a558f8ab-3bb8430e0d7mr995405ab.27.1734411452091; Mon, 16 Dec 2024
 20:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20241216-perf_fix_riscv_obj_reading-v1-0-b75962660a9b@rivosinc.com>
 <20241216-perf_fix_riscv_obj_reading-v1-2-b75962660a9b@rivosinc.com>
In-Reply-To: <20241216-perf_fix_riscv_obj_reading-v1-2-b75962660a9b@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 16 Dec 2024 20:57:20 -0800
Message-ID: <CAP-5=fVvLv-OtkK57ri1EpM_v=PQZDZijYBpGv_9Smyz8EOm2g@mail.gmail.com>
Subject: Re: [PATCH 2/2] tools: perf: tests: Fix code reading for riscv
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nelson Chu <nelson@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-security-module@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_205733_605474_A23F6065 
X-CRM114-Status: GOOD (  24.24  )
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

T24gTW9uLCBEZWMgMTYsIDIwMjQgYXQgMzoxM+KAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gQWZ0ZXIgYmludXRpbHMgY29tbWl0IGU0M2Q4NzYg
d2hpY2ggd2FzIGZpcnN0IGluY2x1ZGVkIGluIGJpbnV0aWxzIDIuNDEsCj4gcmlzY3Ygbm8gbG9u
Z2VyIHN1cHBvcnRzIGR1bXBpbmcgaW4gdGhlIG1pZGRsZSBvZiBpbnN0cnVjdGlvbnMuIEluY3Jl
YXNlCj4gdGhlIG9iamR1bXAgd2luZG93IGJ5IDItYnl0ZXMgdG8gZW5zdXJlIHRoYXQgYW55IGlu
c3RydWN0aW9uIHRoYXQgc2l0cwo+IG9uIHRoZSBib3VuZGFyeSBvZiB0aGUgc3BlY2lmaWVkIHN0
b3AtYWRkcmVzcyBpcyBub3QgY3V0IGluIGhhbGYuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGll
IEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25m
aWcgICAgICAgICAgICAgIHwgIDUgKysrKysKPiAgdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRp
bmcuYyB8IDE3ICsrKysrKysrKysrKysrKystCgpGaWxlcyB1bmRlciB0b29scyB1c2UgYSBkaWZm
ZXJlbnQgQnVpbGQgc3lzdGVtIHRoYW4gdGhlIGtlcm5lbC4gVGhlCktjb25maWcgdmFsdWUgd29u
J3QgaGF2ZSBhbiBlZmZlY3QuIENoZWNrIG91dCBNYWtlZmlsZS5jb25maWc6Cmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0
LmdpdC90cmVlL3Rvb2xzL3BlcmYvTWFrZWZpbGUuY29uZmlnP2g9cGVyZi10b29scy1uZXh0Cndo
aWNoIGlzIGluY2x1ZGVkIGludG8gdGhlIGJ1aWxkIGhlcmU6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVl
L3Rvb2xzL3BlcmYvTWFrZWZpbGUucGVyZj9oPXBlcmYtdG9vbHMtbmV4dCNuMzEzCgo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCBkNGE3
Y2EwMzg4YzA3MWI1MzZkZjU5YzBlYjExZDU1ZjkwODBjN2NkLi5mMTY0MDQ3NDcxMjY3OTM2YmM2
MjM4OWI3ZDdkOWE3Y2JkY2E4Zjk3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+
ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC0yMjksNiArMjI5LDExIEBAIGNvbmZpZyBH
Q0NfU1VQUE9SVFNfRFlOQU1JQ19GVFJBQ0UKPiAgICAgICAgIGRlZl9ib29sIENDX0lTX0dDQwo+
ICAgICAgICAgZGVwZW5kcyBvbiAkKGNjLW9wdGlvbiwtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRy
eT04KQo+Cj4gK2NvbmZpZyBSSVNDVl9PQkpEVU1QX1NVUFBPUlRTX1NQTElUX0lOU1RSVUNUSU9O
Cj4gKyAgICAgICAjIFNvbWUgdmVyc2lvbnMgb2Ygb2JqZHVtcCBkbyBub3Qgc3VwcG9ydCBkdW1w
aW5nIHBhcnRpYWwgaW5zdHJ1Y3Rpb25zCj4gKyAgICAgICBkZWZfYm9vbCB5Cj4gKyAgICAgICBk
ZXBlbmRzIG9uICEoT0JKRFVNUF9JU19HTlUgJiYgT0JKRFVNUF9WRVJTSU9OID4gMjQxMDApCj4g
Kwo+ICBjb25maWcgSEFWRV9TSEFET1dfQ0FMTF9TVEFDSwo+ICAgICAgICAgZGVmX2Jvb2wgJChj
Yy1vcHRpb24sLWZzYW5pdGl6ZT1zaGFkb3ctY2FsbC1zdGFjaykKPiAgICAgICAgICMgaHR0cHM6
Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtZWxmLXBzYWJpLWRvYy9jb21taXQvYTQ4
NGU4NDNlNmVlYjUxZjBjYjdiODgxOWU1MGRhNmQyNDQ0ZDc2OQo+IGRpZmYgLS1naXQgYS90b29s
cy9wZXJmL3Rlc3RzL2NvZGUtcmVhZGluZy5jIGIvdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRp
bmcuYwo+IGluZGV4IDI3YzgyY2ZiN2U3ZGU0MjI4NGJmNWFmOWNmNzU5NGEzYTk2MzA1MmUuLjYw
NWY0YThlMWRiYzAwZDhhNTcyNTAzZjQ1MDUzYzJmMzBhZDE5ZTMgMTAwNjQ0Cj4gLS0tIGEvdG9v
bHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRpbmcuYwo+ICsrKyBiL3Rvb2xzL3BlcmYvdGVzdHMvY29k
ZS1yZWFkaW5nLmMKPiBAQCAtMSw1ICsxLDYgQEAKPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKPiAgI2luY2x1ZGUgPGVycm5vLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rY29u
ZmlnLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+Cj4gICNpbmNsdWRlIDxpbnR0eXBlcy5oPgo+IEBAIC0xODMsOSArMTg0LDIzIEBAIHN0
YXRpYyBpbnQgcmVhZF92aWFfb2JqZHVtcChjb25zdCBjaGFyICpmaWxlbmFtZSwgdTY0IGFkZHIs
IHZvaWQgKmJ1ZiwKPiAgICAgICAgIGNvbnN0IGNoYXIgKmZtdDsKPiAgICAgICAgIEZJTEUgKmY7
Cj4gICAgICAgICBpbnQgcmV0Owo+ICsgICAgICAgdTY0IHN0b3BfYWRkcmVzcyA9IGFkZHIgKyBs
ZW47Cj4gKwo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoX19yaXNjdikgJiYgIUlTX0VOQUJMRUQo
Q09ORklHX1JJU0NWX09CSkRVTVBfU1VQUE9SVFNfU1BMSVRfSU5TVFJVQ1RJT04pKSB7CgpJdCB3
b3VsZCBiZSBuaWNlIGlmIHRoaXMgY291bGQgYmUgYSBydW50aW1lIHJhdGhlciB0aGFuIGJ1aWxk
IHRpbWUgZGV0ZWN0ZWQuCgpUaGFua3MsCklhbgoKPiArICAgICAgICAgICAgICAgLyoKPiArICAg
ICAgICAgICAgICAgICogT24gc29tZSB2ZXJzaW9ucyBvZiByaXNjdiBvYmpkdW1wLCBkdW1waW5n
IGluIHRoZSBtaWRkbGUgb2YKPiArICAgICAgICAgICAgICAgICogaW5zdHJ1Y3Rpb25zIGlzIG5v
dCBzdXBwb3J0ZWQuIHJpc2N2IGluc3RydWN0aW9ucyBhcmUgYWxpZ25lZCBhbG9uZwo+ICsgICAg
ICAgICAgICAgICAgKiAyLWJ5dGUgaW50ZXJ2YWxzIGFuZCBjYW4gYmUgZWl0aGVyIDItYnl0ZXMg
b3IgNC1ieXRlcy4gVGhpcyBtYWtlcyBpdAo+ICsgICAgICAgICAgICAgICAgKiBwb3NzaWJsZSB0
aGF0IHRoZSBzdG9wLWFkZHJlc3MgbGFuZHMgaW4gdGhlIG1pZGRsZSBvZiBhIDQtYnl0ZQo+ICsg
ICAgICAgICAgICAgICAgKiBpbnN0cnVjdGlvbi4gSW5jcmVhc2UgdGhlIHN0b3BfYWRkcmVzcyBi
eSB0d28gdG8gZW5zdXJlIGFuCj4gKyAgICAgICAgICAgICAgICAqIGluc3RydWN0aW9uIGlzIG5v
dCBjdXQgaW4gaGFsZiwgYnV0IGxlYXZlIHRoZSBsZW4gYXMtaXMgc28gb25seSB0aGUKPiArICAg
ICAgICAgICAgICAgICogZXhwZWN0ZWQgbnVtYmVyIG9mIGJ5dGVzIGFyZSBjb2xsZWN0ZWQuCj4g
KyAgICAgICAgICAgICAgICAqLwo+ICsgICAgICAgICAgICAgICBzdG9wX2FkZHJlc3MgKz0gMjsK
PiArICAgICAgIH0KPgo+ICAgICAgICAgZm10ID0gIiVzIC16IC1kIC0tc3RhcnQtYWRkcmVzcz0w
eCUiUFJJeDY0IiAtLXN0b3AtYWRkcmVzcz0weCUiUFJJeDY0IiAlcyI7Cj4gLSAgICAgICByZXQg
PSBzbnByaW50ZihjbWQsIHNpemVvZihjbWQpLCBmbXQsIHRlc3Rfb2JqZHVtcF9wYXRoLCBhZGRy
LCBhZGRyICsgbGVuLAo+ICsgICAgICAgcmV0ID0gc25wcmludGYoY21kLCBzaXplb2YoY21kKSwg
Zm10LCB0ZXN0X29iamR1bXBfcGF0aCwgYWRkciwgc3RvcF9hZGRyZXNzLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgZmlsZW5hbWUpOwo+ICAgICAgICAgaWYgKHJldCA8PSAwIHx8IChzaXplX3Qp
cmV0ID49IHNpemVvZihjbWQpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4KPiAtLQo+
IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
