Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDC6E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 19:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dse4OPB4ZQkYtAaCRnOszd5se6bOPsClfBdTaOKXIwg=; b=0FlaKWeZIf9ivV
	BIsOV1nq5t74NZsQiC+hUzbtUe3xP9etONRWe6M1SENciNqsN80H7RiWQJabWYXRQjnKNVxgNyewd
	E0twqpURj35hhViIcv0gJYa3huVeMvmHgBl0O374xDPZ7KDgxEpKaZxK4+xrDOP+Sg11k6+XtoQo6
	R+ymq485Wpv1Jaz7H4TGSXna+qlvHWMxtGsGlI8kTfP2rACwf9lkkyT9gz19deioR8nXn4rXlGjBU
	PzZJoMq8zGnlXq4AGTsJpnbemKW+GVfNmPugVIaBvdH4MUYOdq+MIGvaraQmCOEW7y3g9Xu8vFku5
	fh7rZ0zImNwnzIrPZSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzeR-0000000HX6k-3ccY;
	Wed, 18 Dec 2024 19:24:07 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzeO-0000000HX5f-1QwU
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 19:24:05 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so13885ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 11:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734549843; x=1735154643; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9hTXlPZWSVEYCQ2lSahVNinUrx56wFSX/a32nzhIVI=;
        b=wjoMXmOpDc6zcupMhGwBZCGKBK9CGFr5eu0uevjuZuyss6NuQ3CSse8ASVg82VD8Dg
         DFEP7nrEG8HdWn+jF17K5gkpscgNa7GA1XxN39GB8CTdvc4FpkuVngMFpRpGYFJju2Xo
         0SxpYpv4TrIZZGNo0PswSfJPzoCLW6A6iCz0CBW4FIQUR6sgxjCXtHNYkt3YlckPPddS
         euEMYiNnO7bF4DW5TD6zmVTSPEipB+Q6koCtnJBSw7DrjuV3DeWpMIpYZ/UN5h7Cja/g
         hTbjvy/XIbBmU5toEocglGbcRZZkvvfDnfsSaqKBRGMM/eMyw+309dWCI/UHs5p74zo1
         +EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734549843; x=1735154643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9hTXlPZWSVEYCQ2lSahVNinUrx56wFSX/a32nzhIVI=;
        b=sZXMAyHonHTs31E129Sugh4Pabqn8QziqC3EsW2IlNvqn5H2bQSvGwLgHlDfS866uJ
         r5FVL3f1P0MX/FOHcBecyrlcd65UYA946V3fT4xFwQ4k8uReLybNA4Grs8F/ORGXlul2
         ZFlLXwIqsqK95tnTXc6cwocaFxGAq+UQWWw8Abi6CKV5DFOTMVICrf40odvc2aET3/UJ
         QdkREjLiG44cXN8FHk4yvvpNw/0IokYeq0GKo6GDjaA0J3w9leK9XzD23EhgR03BDlzn
         a31q185VESSsnex0OUU+uiSeWP2bBcYTm1ZzJ6JdlIv8p9nA3dOmRXZ4Ma2X7GNqAO3p
         IzfA==
X-Forwarded-Encrypted: i=1; AJvYcCW8DeNjLVeheAyx69cAXoy1Wcyd4tqtEOJlCLyc5B9UZekGl4lFB6qppIYPtX4jPH2ItOL1McxpnnpZBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCkrhQ+j8SdcjJauqFhoKGwGqe2UZMyvM1I0gRKG/U1SlQQSiM
	loopVbXtyiWNmYO6l3TjgdV2Bh0C2BR0Uy0mda2bjMq5r4Wy+Q2uw5NGixPamvqqwsq7JHtAueD
	2eyShmFTmuAaHIzladcRWK3ige+WsgUZsGlqm
X-Gm-Gg: ASbGncvXKWL+FCcj021WpBthVNCTa3RsOLGzUWYMcQkTY4iNyQIYKy9d5uI+rSyb5KE
	I65t/lntCfh+EYvXQH2GA+JuiyQhI2OEYJggU+Tk=
X-Google-Smtp-Source: AGHT+IFsB3hzBCDfntbKQfvxjP3mGyPhCDyK07+5uTgdW6OxgZh8AuhBDcTf1TpnOVq02GGpwyEGtwa9dzqWj325I5g=
X-Received: by 2002:a05:6e02:221c:b0:3a7:9082:50f6 with SMTP id
 e9e14a558f8ab-3c05c1aa647mr259455ab.22.1734549842734; Wed, 18 Dec 2024
 11:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost> <Z2MXXFhUzoQmW4xV@x1>
In-Reply-To: <Z2MXXFhUzoQmW4xV@x1>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Dec 2024 11:23:51 -0800
Message-ID: <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_112404_414876_C452D2D6 
X-CRM114-Status: GOOD (  27.80  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMTA6NDHigK9BTSBBcm5hbGRvIENhcnZhbGhvIGRlIE1l
bG8KPGFjbWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAw
NDozMDoxNVBNIC0wODAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiBPbiBUdWUsIERlYyAx
NywgMjAyNCBhdCAwNDoxODozMlBNIC0wODAwLCBJYW4gUm9nZXJzIHdyb3RlOgo+ID4gPiBPbiBU
dWUsIERlYyAxNywgMjAyNCBhdCAzOjUy4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4gQWZ0ZXIgYmludXRpbHMgY29tbWl0IGU0M2Q4NzYg
d2hpY2ggd2FzIGZpcnN0IGluY2x1ZGVkIGluIGJpbnV0aWxzIDIuNDEsCj4gPiA+ID4gcmlzY3Yg
bm8gbG9uZ2VyIHN1cHBvcnRzIGR1bXBpbmcgaW4gdGhlIG1pZGRsZSBvZiBpbnN0cnVjdGlvbnMu
IEluY3JlYXNlCj4gPiA+ID4gdGhlIG9iamR1bXAgd2luZG93IGJ5IDItYnl0ZXMgdG8gZW5zdXJl
IHRoYXQgYW55IGluc3RydWN0aW9uIHRoYXQgc2l0cwo+ID4gPiA+IG9uIHRoZSBib3VuZGFyeSBv
ZiB0aGUgc3BlY2lmaWVkIHN0b3AtYWRkcmVzcyBpcyBub3QgY3V0IGluIGhhbGYuCj4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+
Cj4gPiA+IFJldmlld2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+Cj4KPiA+
ID4gPiBBIGJpbnV0aWxzIHBhdGNoIGhhcyBiZWVuIHNlbnQgYXMgd2VsbCB0byBmaXggdGhpcyBp
biBvYmpkdW1wIFsxXS4KPgo+ID4gPiA+IExpbms6IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlw
ZXJtYWlsL2JpbnV0aWxzLzIwMjQtRGVjZW1iZXIvMTM4MTM5Lmh0bWwgWzFdCj4KPiA+ID4gPiBD
aGFuZ2VzIGluIHYyOgo+ID4gPiA+IC0gRG8gb2JqZHVtcCB2ZXJzaW9uIGRldGVjdGlvbiBhdCBy
dW50aW1lIChJYW4pCj4gPiA+ID4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjQxMjE2LXBlcmZfZml4X3Jpc2N2X29ial9yZWFkaW5nLXYxLTAtYjc1OTYyNjYwYTli
QHJpdm9zaW5jLmNvbQo+Cj4gPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRp
bmcuYwo+ID4gPiA+IEBAIC0xODMsOSArMjQ0LDMwIEBAIHN0YXRpYyBpbnQgcmVhZF92aWFfb2Jq
ZHVtcChjb25zdCBjaGFyICpmaWxlbmFtZSwgdTY0IGFkZHIsIHZvaWQgKmJ1ZiwKPiA+ID4gPiAg
ICAgICAgIGNvbnN0IGNoYXIgKmZtdDsKPiA+ID4gPiAgICAgICAgIEZJTEUgKmY7Cj4gPiA+ID4g
ICAgICAgICBpbnQgcmV0Owo+ID4gPiA+ICsgICAgICAgdTY0IHN0b3BfYWRkcmVzcyA9IGFkZHIg
KyBsZW47Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoX19yaXNjdikp
IHsKPgo+ID4gPiBOb3Qgc3VyZSBpZiB0aGVyZSBpcyBhIGNvbnNpc3RlbmN5IGlzc3VlIGhlcmUu
IEVsc2V3aGVyZSB3ZSdyZSBqdXN0Cj4gPiA+IHVzaW5nIGlmZGVmLCBzdWNoIGFzOgo+ID4gPiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wZXJmL3BlcmYt
dG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJmL3V0aWwvaW5jbHVkZS9kd2FyZi1yZWdzLmg/
aD1wZXJmLXRvb2xzLW5leHQjbjY5Cj4KPiA+IEkgZG9uJ3QgaGF2ZSBhbnkgc3Ryb25nIGZlZWxp
bmdzIGFib3V0IHRoYXQuIEkgY2FuIGNoYW5nZSBpdCB0byBiZSBhbgo+ID4gaWZkZWYuIE9uIG90
aGVyIGxpc3RzIEkgaGF2ZSBiZWVuIHRvbGQgdG8gdXNlIElTX0VOQUJMRUQgd2hlbmV2ZXIKPiA+
IHBvc3NpYmxlLCBidXQgaXQncyBvbmx5IGEgc21hbGwgZGlmZmVyZW5jZS4KPgo+IENhbid0IHdl
IGp1c3QgdXNlIHVuYW1lIGhlcmU/Cj4KPiBTbyB0aGF0IHdlIGRvbid0IHVzZSBrY29uZmlnLmgg
c2luY2UgaXRzIG5vdCB1c2VkIGluIHRvb2xzL3BlcmYvIGFuZAo+IG1ha2VzIGl0IGxvb2tzIGxp
a2UgcGVyZiBpcyBpbiBsb2Nrc3RlcCB3aXRoIHRoZSBrZXJuZWwgc291cmNlIHRyZWUKPiB2ZXJz
aW9uIGl0IHdhcyBjb21waWxlZCBmcm9tPwo+Cj4gJCBnaXQgZ3JlcCBrY29uZmlnLmggdG9vbHMv
cGVyZi8KPiAkCj4KPiBCVFcsIHdoYXQgd291bGQgaGFwcGVuIGlmIEkgY29sbGVjdGVkIGEgcGVy
Zi5kYXRhIGZpbGUgb24geDg2XzY0IGFuZAo+IHdvdWxkIHJlYWQgaXQgaW4gYSBSaXNjViBtYWNo
aW5lIHdpdGggc3VjaCBhIG9iamR1bXAgdmVyc2lvbj8gVGhlIHNhbWUKPiBwcm9ibGVtPwoKVGhp
cyBjb2RlIGlzIGluIHRlc3RzIGhlbmNlIHRoaW5raW5nIHRoYXQgYSBzZXBhcmF0ZSBmaXggaXMg
bmVlZGVkIGZvcgp0aGF0IHByb2JsZW0uIEhvcGVmdWxseSB0aGUgdXNlIG9mIGVsZiBtYWNoaW5l
L2ZsYWdzIHRhY2tsZXMgaXQ6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC9p
bmNsdWRlL2R3YXJmLXJlZ3MuaD9oPXBlcmYtdG9vbHMtbmV4dCNuMjUKV2UgYXJlIGdldHRpbmcg
c29tZXdoYXQgZGlzYXNzZW1ibGVyIGhlYXZ5LiBXZSBoYXZlIGxsdm0gYXMgYSBsaWJyYXJ5LApj
YXBzdG9uZSBhcyBhIGxpYnJhcnksIGJpbnV0aWxzIG9iamR1bXAgYW5kIGxsdm0gb2JqZHVtcC4g
R2l2ZW4gdGhlCnBhaW4gd2l0aCBwYXJzaW5nIHRleHQsIGNvdWxkIHdlIGxvc2UgdGhlIG9iamR1
bXBzPyBTaW1pbGFybHkgZm9yCmFkZHIybGluZT8KClRoYW5rcywKSWFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
