Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D678FC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AvOpkf3BngeqszZ1vD5lDvw/SV8mFeOgQOZxubgu1+I=; b=dLFng/awXcsS3pX/g4GzlYPoNE
	08UVN0TOky0ZUMJjtvno+pADuA+VqZ+2XlHPsiyS4hBbtSSUi+ooSItW7N9PnHB6DknTUYfcK2/Fz
	XSyAMWku3DjdYRQQO+uuwJXg0GPc6hHpN6W2+3jF0jzF8SnG62uARA1f43XBH/epbMBoHCVi2FR47
	dCc936NHjav6kU0oUZDB1CX05DlQrS5JwuzZMUtK90om0KUtwoDxGaKM1lhrhTxYscCpk86AGRbBT
	bJ92Cf7Opxe4ZWyWkTXDoUuixjaloa2bXEi7w0uGSIn+ntRjLMh1RhDBdMUOE75XqFAYrnXxK680P
	awPYqSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLrWq-00000000jt0-16IB;
	Mon, 24 Jun 2024 21:47:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLrWl-00000000jpU-40cs
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 21:47:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fa3086cf25so19705ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 14:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719265627; x=1719870427; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryU5o2yVn1i6Iaousq7WSn7w6bux8oEB7sHmGtnV9uI=;
        b=OUWXm9i/wtwgQx3CQApNwU0z6GIO77R23EJwnVTIj6J5q9Bb3K1n+UTQekhnUMUREh
         ePXal4XU7sFOw2r2zhqJ8TXVatvfZurqxoel6MsgXPwrvh6++WpDu5cQkK7/HskI878E
         BbWtlo8axhotgpdMVxjYntweBNhBaUosj/a4T8WTYnPsS3NIhmgtyy+fl/t8b9Af+v4m
         3P+QnNTiO9SRYtnIU4Bujbh6Sao55Hps8QEsx2h1ye/2nM3RW/up0lln1Favi5UYvA8B
         aZARO2sHnQNckA3IQKFtlf9zFfYqgzBWEocjK3aD+1Q6SXVnzlKGDxFedyny9p9HdDl3
         1yIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719265627; x=1719870427;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryU5o2yVn1i6Iaousq7WSn7w6bux8oEB7sHmGtnV9uI=;
        b=dfpdHOCVLKh3dHx3Y5mASye/g+uMW9DriGxD/W8++687xlyuI/WKLPVL8LT/yPeEwt
         BOHBdgq0tfl06SKcLL9O/W/0j6B6DBnrBAO/FPJcbufzfBIn5raKYYVcRQk//Ec0hz6l
         pQ9+8AtxNON7cWiQ3eGonqSyXjWHKtzS/rvuJr0VLLcZUZnxmk+Yj5D40eltDi403K7W
         PkAW9ZNU0acyU2AQWU+PLEJ8IlAPPPLy0UNDiXCPvQxdT/AMgwKlDvt3yvTd+D+3LObc
         Iuk4nEy/vH91Dko4Xn5pbVF3LP1AfmKYH8i57vg7mFS7g6FL8VpnxaQ7Qsb6uD5I9i2l
         IMZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4RrPQHp1ttjCUloE+pJXNcALxWOw90W/UWYELfbwnCGcGiyNfHdXleWYZawOSf8UTsKk2np0JpbMh3T2vswk8dqRX9HuNGqdop3rdz2Ts
X-Gm-Message-State: AOJu0YyaP+3VfEtC3STlsFlMupId7lsr0Cx0lqkXIja10AgS7SPXr6Ip
	WoZ14j/Sf3QVVK324TJP5SgwlWr8+jH4bUoGph6XmCmP8VwiXT6ayuYWWeB/Ekj0urppAtHbIM2
	YHCRNUwhM1rJ5+Vza8iZJj000z4ob241ICyI6
X-Google-Smtp-Source: AGHT+IEJrMsRDVKc4wpx0FBdMJnJosYDDYfqfwciz733n6udVWvghsvDjxQCFEC37EnR/1LLitbb/jf7rxP7dJ9fEkQ=
X-Received: by 2002:a17:902:bd47:b0:1f7:1c96:d2e8 with SMTP id
 d9443c01a7336-1fa68fb23efmr1044215ad.10.1719265626724; Mon, 24 Jun 2024
 14:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240613233122.3564730-1-irogers@google.com>
In-Reply-To: <20240613233122.3564730-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 24 Jun 2024 14:46:54 -0700
Message-ID: <CAP-5=fWZDZWvrysEzL7H2kAXNBhFd3=kcmz1N=W+HgwGPsBPDg@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Refactor perf python module build
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Terrell <terrelln@fb.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Kees Cook <keescook@chromium.org>, 
	Andrei Vagin <avagin@google.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Ze Gao <zegao2021@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, coresight@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_144708_044870_03E7BD5F 
X-CRM114-Status: GOOD (  18.83  )
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

T24gVGh1LCBKdW4gMTMsIDIwMjQgYXQgNDozMeKAr1BNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBSZWZhY3RvciB0aGUgcGVyZiBweXRob24gbW9kdWxlIGJ1aWxk
IHRvIGluc3RlYWQgb2YgYnVpbGRpbmcgQyBmaWxlcwo+IGl0IGxpbmtzIGxpYnJhcmllcy4gVG8g
c3VwcG9ydCB0aGlzIG1ha2Ugc3RhdGljIGxpYnJhcmllcyBmb3IgdGVzdHMsCj4gdWksIHV0aWwg
YW5kIHBtdS1ldmVudHMuIERvaW5nIHRoaXMgYWxsb3dzIGZld2VyIGZ1bmN0aW9ucyB0byBiZQo+
IHN0dWJiZWQgb3V0LCBpbXBvcnRhbnRseSBwYXJzZV9ldmVudHMgaXMgbm8gbG9uZ2VyIHN0dWJi
ZWQgb3V0IHdoaWNoCj4gd2lsbCBpbXByb3ZlIHRoZSBhYmlsaXR5IHRvIHdvcmsgd2l0aCBoZXRl
cm9nZW5lb3VzIGNvcmVzLgo+Cj4gQnkgbm90IGJ1aWxkaW5nIC5jIGZpbGVzIGZvciB0aGUgcHl0
aG9uIG1vZHVsZSBhbmQgZm9yIHRoZSBidWlsZCBvZgo+IHBlcmYsIHRoaXMgc2hvdWxkIGFsc28g
aGVscCBidWlsZCB0aW1lcy4KPgo+IFBhdGNoIDEgYWRkcyAnKi5hJyBjbGVhbnVwIHRvIHRoZSBj
bGVhbiB0YXJnZXQuCj4KPiBQYXRjaGVzIDIgdG8gNiBhZGQgc3RhdGljIGxpYnJhcmllcyBmb3Ig
ZXhpc3RpbmcgcGFydHMgb2YgdGhlIHBlcmYKPiBidWlsZC4KPgo+IFBhdGNoIDcgYWRkcyB0aGUg
cHl0aG9uIGJ1aWxkIHVzaW5nIGxpYnJhcmllcyByYXRoZXIgdGhhbiBDIHNvdXJjZQo+IGZpbGVz
Lgo+Cj4gUGF0Y2ggOCBjbGVhbnMgdXAgdGhlIHB5dGhvbiBkZXBlbmRlbmNpZXMgYW5kIHJlbW92
ZXMgdGhlIG5vIGxvbmdlcgo+IG5lZWRlZCBweXRob24tZXh0LXNvdXJjZXMuCj4KPiB2MzogQWRk
IG1pc3NlZCB4dGVuc2EgZGlyZWN0b3J5IGZvciB0aGUgdXRpbCBidWlsZC4gUmVtb3ZlIGFkZGlu
ZyB0aGUKPiAgICAgYXJjaCBkaXJlY3RvcnkgdG8gcGVyZi15IGFzIGl0IGNyZWF0ZXMgYW4gZW1w
dHkgb2JqZWN0IGZpbGUgdGhhdAo+ICAgICBicmVha3Mgd2l0aCBHQ0MgYW5kIExUTy4KPiB2Mjog
QWRkICcqLmEnIGNsZWFudXAgdG8gY2xlYW4gdGFyZ2V0LiBBZGQgcmV2aWV3ZWQtYnkgSmFtZXMg
Q2xhcmsuCgpQaW5nLgoKVGhhbmtzLApJYW4KCj4gSWFuIFJvZ2VycyAoOCk6Cj4gICBwZXJmIGJ1
aWxkOiBBZGQgJyouYScgdG8gY2xlYW4gdGFyZ2V0cwo+ICAgcGVyZiB1aTogTWFrZSB1aSBpdHMg
b3duIGxpYnJhcnkKPiAgIHBlcmYgcG11LWV2ZW50czogTWFrZSBwbXUtZXZlbnRzIGEgbGlicmFy
eQo+ICAgcGVyZiB0ZXN0OiBNYWtlIHRlc3RzIGl0cyBvd24gbGlicmFyeQo+ICAgcGVyZiBiZW5j
aDogTWFrZSBiZW5jaCBpdHMgb3duIGxpYnJhcnkKPiAgIHBlcmYgdXRpbDogTWFrZSB1dGlsIGl0
cyBvd24gbGlicmFyeQo+ICAgcGVyZiBweXRob246IFN3aXRjaCBtb2R1bGUgdG8gbGlua2luZyBs
aWJyYXJpZXMgZnJvbSBidWlsZGluZyBzb3VyY2UKPiAgIHBlcmYgcHl0aG9uOiBDbGVhbiB1cCBi
dWlsZCBkZXBlbmRlbmNpZXMKPgo+ICB0b29scy9wZXJmL0J1aWxkICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTQgKy0KPiAgdG9vbHMvcGVyZi9NYWtlZmlsZS5jb25maWcgICAgICAg
ICAgICAgICAgICAgIHwgICA1ICsKPiAgdG9vbHMvcGVyZi9NYWtlZmlsZS5wZXJmICAgICAgICAg
ICAgICAgICAgICAgIHwgIDgzICsrKy0KPiAgdG9vbHMvcGVyZi9hcmNoL0J1aWxkICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA1ICstCj4gIHRvb2xzL3BlcmYvYXJjaC9hcm0vQnVpbGQgICAg
ICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICB0b29scy9wZXJmL2FyY2gvYXJtL3Rlc3RzL0J1
aWxkICAgICAgICAgICAgICAgfCAgIDggKy0KPiAgdG9vbHMvcGVyZi9hcmNoL2FybS91dGlsL0J1
aWxkICAgICAgICAgICAgICAgIHwgIDEwICstCj4gIHRvb2xzL3BlcmYvYXJjaC9hcm02NC9CdWls
ZCAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICB0b29scy9wZXJmL2FyY2gvYXJtNjQvdGVz
dHMvQnVpbGQgICAgICAgICAgICAgfCAgIDggKy0KPiAgdG9vbHMvcGVyZi9hcmNoL2FybTY0L3V0
aWwvQnVpbGQgICAgICAgICAgICAgIHwgIDIwICstCj4gIHRvb2xzL3BlcmYvYXJjaC9jc2t5L0J1
aWxkICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICB0b29scy9wZXJmL2FyY2gvY3NreS91
dGlsL0J1aWxkICAgICAgICAgICAgICAgfCAgIDYgKy0KPiAgdG9vbHMvcGVyZi9hcmNoL2xvb25n
YXJjaC9CdWlsZCAgICAgICAgICAgICAgIHwgICAyICstCj4gIHRvb2xzL3BlcmYvYXJjaC9sb29u
Z2FyY2gvdXRpbC9CdWlsZCAgICAgICAgICB8ICAgOCArLQo+ICB0b29scy9wZXJmL2FyY2gvbWlw
cy9CdWlsZCAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgdG9vbHMvcGVyZi9hcmNoL21p
cHMvdXRpbC9CdWlsZCAgICAgICAgICAgICAgIHwgICA2ICstCj4gIHRvb2xzL3BlcmYvYXJjaC9w
b3dlcnBjL0J1aWxkICAgICAgICAgICAgICAgICB8ICAgNCArLQo+ICB0b29scy9wZXJmL2FyY2gv
cG93ZXJwYy90ZXN0cy9CdWlsZCAgICAgICAgICAgfCAgIDYgKy0KPiAgdG9vbHMvcGVyZi9hcmNo
L3Bvd2VycGMvdXRpbC9CdWlsZCAgICAgICAgICAgIHwgIDI0ICstCj4gIHRvb2xzL3BlcmYvYXJj
aC9yaXNjdi9CdWlsZCAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICB0b29scy9wZXJmL2Fy
Y2gvcmlzY3YvdXRpbC9CdWlsZCAgICAgICAgICAgICAgfCAgIDggKy0KPiAgdG9vbHMvcGVyZi9h
cmNoL3MzOTAvQnVpbGQgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIHRvb2xzL3BlcmYv
YXJjaC9zMzkwL3V0aWwvQnVpbGQgICAgICAgICAgICAgICB8ICAxNiArLQo+ICB0b29scy9wZXJm
L2FyY2gvc2gvQnVpbGQgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgdG9vbHMvcGVy
Zi9hcmNoL3NoL3V0aWwvQnVpbGQgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIHRvb2xzL3Bl
cmYvYXJjaC9zcGFyYy9CdWlsZCAgICAgICAgICAgICAgICAgICB8ICAgMiArLQo+ICB0b29scy9w
ZXJmL2FyY2gvc3BhcmMvdXRpbC9CdWlsZCAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgdG9vbHMv
cGVyZi9hcmNoL3g4Ni9CdWlsZCAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCj4gIHRvb2xz
L3BlcmYvYXJjaC94ODYvdGVzdHMvQnVpbGQgICAgICAgICAgICAgICB8ICAyMCArLQo+ICB0b29s
cy9wZXJmL2FyY2gveDg2L3V0aWwvQnVpbGQgICAgICAgICAgICAgICAgfCAgNDIgKy0KPiAgdG9v
bHMvcGVyZi9hcmNoL3h0ZW5zYS9CdWlsZCAgICAgICAgICAgICAgICAgIHwgICAyICstCj4gIHRv
b2xzL3BlcmYvYmVuY2gvQnVpbGQgICAgICAgICAgICAgICAgICAgICAgICB8ICA0NiArLQo+ICB0
b29scy9wZXJmL3NjcmlwdHMvQnVpbGQgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0KPiAg
dG9vbHMvcGVyZi9zY3JpcHRzL3BlcmwvUGVyZi1UcmFjZS1VdGlsL0J1aWxkIHwgICAyICstCj4g
IC4uLi9wZXJmL3NjcmlwdHMvcHl0aG9uL1BlcmYtVHJhY2UtVXRpbC9CdWlsZCB8ICAgMiArLQo+
ICB0b29scy9wZXJmL3Rlc3RzL0J1aWxkICAgICAgICAgICAgICAgICAgICAgICAgfCAxNDAgKysr
LS0tLQo+ICB0b29scy9wZXJmL3Rlc3RzL3dvcmtsb2Fkcy9CdWlsZCAgICAgICAgICAgICAgfCAg
MTIgKy0KPiAgdG9vbHMvcGVyZi91aS9CdWlsZCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDE4ICstCj4gIHRvb2xzL3BlcmYvdWkvYnJvd3NlcnMvQnVpbGQgICAgICAgICAgICAgICAgICB8
ICAxNCArLQo+ICB0b29scy9wZXJmL3VpL3R1aS9CdWlsZCAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDggKy0KPiAgdG9vbHMvcGVyZi91dGlsL0J1aWxkICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMzk0ICsrKysrKysrKy0tLS0tLS0tLQo+ICB0b29scy9wZXJmL3V0aWwvYXJtLXNwZS1kZWNv
ZGVyL0J1aWxkICAgICAgICAgfCAgIDIgKy0KPiAgdG9vbHMvcGVyZi91dGlsL2NzLWV0bS1kZWNv
ZGVyL0J1aWxkICAgICAgICAgIHwgICAyICstCj4gIHRvb2xzL3BlcmYvdXRpbC9oaXNpLXB0dC1k
ZWNvZGVyL0J1aWxkICAgICAgICB8ICAgMiArLQo+ICB0b29scy9wZXJmL3V0aWwvaW50ZWwtcHQt
ZGVjb2Rlci9CdWlsZCAgICAgICAgfCAgIDIgKy0KPiAgdG9vbHMvcGVyZi91dGlsL3BlcmYtcmVn
cy1hcmNoL0J1aWxkICAgICAgICAgIHwgIDE4ICstCj4gIHRvb2xzL3BlcmYvdXRpbC9weXRob24t
ZXh0LXNvdXJjZXMgICAgICAgICAgICB8ICA1MyAtLS0KPiAgdG9vbHMvcGVyZi91dGlsL3B5dGhv
bi5jICAgICAgICAgICAgICAgICAgICAgIHwgMjcxICsrKysrLS0tLS0tLQo+ICB0b29scy9wZXJm
L3V0aWwvc2NyaXB0aW5nLWVuZ2luZXMvQnVpbGQgICAgICAgfCAgIDQgKy0KPiAgdG9vbHMvcGVy
Zi91dGlsL3NldHVwLnB5ICAgICAgICAgICAgICAgICAgICAgIHwgIDMzICstCj4gIDUwIGZpbGVz
IGNoYW5nZWQsIDYyNSBpbnNlcnRpb25zKCspLCA3MjkgZGVsZXRpb25zKC0pCj4gIGRlbGV0ZSBt
b2RlIDEwMDY0NCB0b29scy9wZXJmL3V0aWwvcHl0aG9uLWV4dC1zb3VyY2VzCj4KPiAtLQo+IDIu
NDUuMi42MjcuZzdhMmM0ZmQ0NjQtZ29vZwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
