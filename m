Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F12E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1m+HKhXO7DIr3LXUs2er14VTDVk0fptilkNYnSn3tw=; b=SSf9eTcnE6EtPc
	JqXL99yu5mx/9nsKhxTgxd9ap47kfeckyAirvCzbt3e8JZ5lCeInipLkGbPvWFJEBSlwIP5avGWRP
	nKu9/KceYc0xNKThyBsUcrARXePF5wrs2lEigrDg4Wvk86lHJ2weQ8olnovTaWBiWcRim616Eyb2m
	N+QKvqL1gkM9FXRKMSSUdYQwkXNmfr7dkejPIF6yj3TKZyd9ebkJ8udrg6NmsXqQyBnfbrO8Ysa/J
	bMaoLvQjHw3cPFrjga+Kt+rNcU590F5DcySB3YLjgT/fVelba9VWgvIWfoF8K6/7bwuMg7KWRTs0p
	jq4FC1ijMikjmOmcB6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2ag-00000000F2z-0xPM;
	Wed, 18 Dec 2024 22:32:26 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2ad-00000000F2E-2SUD
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 22:32:25 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7273967f2f0so221224b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 14:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734561142; x=1735165942; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tR2taGENppW/iUu90JVKcmqf0YwVCgPjkxt8Ee6iXLM=;
        b=h4nlCpdkK7hjtar+B+OlZXYHJSyYAdyCUJubsS2YAGtfzScWG/0jX2FtNrAULdFfcS
         Zod7CHj9K0cb6hZ64uX+EZID6+mc06XdeUT9wwdnemF4jqjeHE29zg124mJfFfRaSbxr
         W5RqDF8gqz2qKiW+y+1ntHi6dZmazoFpWwGrHU64lWp+6iMI+EpRiOg6gpPmCTw2MYzq
         qO+M7T7OwvfpzFrV/izfZwTqqw9ly7y9o5hr8GQ6i6tsHbGGS+4vgWiIAYHo5pwcDDQ9
         zCwIUGP5dESKcY5P2yb1EnftxaA61Ce0LVqlNOOisvdv4QixrmZhh0WdA8vtjyzmIPSy
         +Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734561142; x=1735165942;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tR2taGENppW/iUu90JVKcmqf0YwVCgPjkxt8Ee6iXLM=;
        b=LPn8+ES3uDJtU2U72tj4hbPiMwBjVy5B5MLoCGCDNhmkM1/1V9gjVJjS+JwWF9lrBe
         YeWymheRP4MrRJ/qJWeQpSVhRG/uQceIwJv8LL7LhsvDuQZUYPGkTbId3X+o4qLQHTrg
         SU+Qu0P37/wD4ieLMNa4o/r82BDkvFfIaWloF8zO6nmcZhjjjmx4TF+aV3SIkTNC0Rjs
         6u6pdPOu/Q+DdiO78sSA4mftcP5+d4UBryMkKthq8E3v5YJVLRF/86dWuebQUpJvdDjH
         qS7p6F9SrXQZnmJwzneU3CuXSAFKulX9kECeoo+tyiVkD0mDoo9z+iIUrrZHpXjVKBwC
         he2w==
X-Forwarded-Encrypted: i=1; AJvYcCVhe95iPbN7HplGwOC52TmplAlOMIo05UC2PQZgyHrdFyyX4ybZolQDoO0P+MVFdQyD2bISo67y5iaFiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ44qbkH6UuHvcOdeotdQHuxVlu2UGnnoU+1Sa977Gx2kZWair
	/KMTKp5kNQIFVJ2jsqd+dy/s8kOfzGOybFoYYoC9FNfan/FdPzWRfbSqE5MxXyU=
X-Gm-Gg: ASbGncutVw9jmz8zLK0yZveAA4CBloUhql1Bvfv3YHDrDFQEn5zgieZNL8ZE1nhQbyP
	cF1kI5Y0F01knePhBaruj39CuEY1qwEAwzzpczggFLqPjEUlTGZ6BnyE5h/om0conRXFHFPiiIG
	719b1MzdgJ1SJzPMrrrKijrmDg9O3V6UMm0iZzZMDny6gL2NtHEoKW51V9i9G71YnBS/Mf1tzA6
	/HhkWKJNfSkPLiAiWncn7MrLCnVikpNmoJeprptaRlV7Po=
X-Google-Smtp-Source: AGHT+IHkiFcBa5uPuKT7UiL19eDTHUTi6KXt8+yHtGVZYu79llIqo/wEI2THlg8fTSaZjVFrzOex2Q==
X-Received: by 2002:a05:6a20:7487:b0:1db:ec6b:ba13 with SMTP id adf61e73a8af0-1e5c7527e1emr1560271637.12.1734561142517;
        Wed, 18 Dec 2024 14:32:22 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ac52bfsm9384916b3a.26.2024.12.18.14.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:32:21 -0800 (PST)
Date: Wed, 18 Dec 2024 14:32:19 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
Message-ID: <Z2NNcy1jCLqb62h2@ghost>
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
 <Z2IXl5cuKQJInJb0@ghost>
 <Z2MXXFhUzoQmW4xV@x1>
 <CAP-5=fXPPfHHVPh0nYgR96VM+smuZKepO+GoE4X+aZsQE4tHSw@mail.gmail.com>
 <Z2M4ZparbNRvRHpz@ghost>
 <CAP-5=fXL6YaEq1cvBh2iESmQ_kqfm5VH5thJ0zrkOCcaWv5s+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fXL6YaEq1cvBh2iESmQ_kqfm5VH5thJ0zrkOCcaWv5s+Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_143223_619205_FA8A47C3 
X-CRM114-Status: GOOD (  45.89  )
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

T24gV2VkLCBEZWMgMTgsIDIwMjQgYXQgMDI6MTM6MjBQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBXZWQsIERlYyAxOCwgMjAyNCBhdCAxOjAy4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxj
aGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBEZWMgMTgsIDIwMjQg
YXQgMTE6MjM6NTFBTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+ID4gT24gV2VkLCBEZWMg
MTgsIDIwMjQgYXQgMTA6NDHigK9BTSBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8KPiA+ID4gPGFj
bWVAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUdWUsIERlYyAxNywgMjAy
NCBhdCAwNDozMDoxNVBNIC0wODAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiA+ID4gPiBP
biBUdWUsIERlYyAxNywgMjAyNCBhdCAwNDoxODozMlBNIC0wODAwLCBJYW4gUm9nZXJzIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAzOjUy4oCvUE0gQ2hhcmxpZSBK
ZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gQWZ0ZXIg
YmludXRpbHMgY29tbWl0IGU0M2Q4NzYgd2hpY2ggd2FzIGZpcnN0IGluY2x1ZGVkIGluIGJpbnV0
aWxzIDIuNDEsCj4gPiA+ID4gPiA+ID4gcmlzY3Ygbm8gbG9uZ2VyIHN1cHBvcnRzIGR1bXBpbmcg
aW4gdGhlIG1pZGRsZSBvZiBpbnN0cnVjdGlvbnMuIEluY3JlYXNlCj4gPiA+ID4gPiA+ID4gdGhl
IG9iamR1bXAgd2luZG93IGJ5IDItYnl0ZXMgdG8gZW5zdXJlIHRoYXQgYW55IGluc3RydWN0aW9u
IHRoYXQgc2l0cwo+ID4gPiA+ID4gPiA+IG9uIHRoZSBib3VuZGFyeSBvZiB0aGUgc3BlY2lmaWVk
IHN0b3AtYWRkcmVzcyBpcyBub3QgY3V0IGluIGhhbGYuCj4gPiA+ID4KPiA+ID4gPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+ID4g
PiA+Cj4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5j
b20+Cj4gPiA+ID4KPiA+ID4gPiA+ID4gPiBBIGJpbnV0aWxzIHBhdGNoIGhhcyBiZWVuIHNlbnQg
YXMgd2VsbCB0byBmaXggdGhpcyBpbiBvYmpkdW1wIFsxXS4KPiA+ID4gPgo+ID4gPiA+ID4gPiA+
IExpbms6IGh0dHBzOi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2JpbnV0aWxzLzIwMjQtRGVj
ZW1iZXIvMTM4MTM5Lmh0bWwgWzFdCj4gPiA+ID4KPiA+ID4gPiA+ID4gPiBDaGFuZ2VzIGluIHYy
Ogo+ID4gPiA+ID4gPiA+IC0gRG8gb2JqZHVtcCB2ZXJzaW9uIGRldGVjdGlvbiBhdCBydW50aW1l
IChJYW4pCj4gPiA+ID4gPiA+ID4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjQxMjE2LXBlcmZfZml4X3Jpc2N2X29ial9yZWFkaW5nLXYxLTAtYjc1OTYyNjYwYTli
QHJpdm9zaW5jLmNvbQo+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gLS0tIGEvdG9vbHMvcGVyZi90ZXN0
cy9jb2RlLXJlYWRpbmcuYwo+ID4gPiA+ID4gPiA+IEBAIC0xODMsOSArMjQ0LDMwIEBAIHN0YXRp
YyBpbnQgcmVhZF92aWFfb2JqZHVtcChjb25zdCBjaGFyICpmaWxlbmFtZSwgdTY0IGFkZHIsIHZv
aWQgKmJ1ZiwKPiA+ID4gPiA+ID4gPiAgICAgICAgIGNvbnN0IGNoYXIgKmZtdDsKPiA+ID4gPiA+
ID4gPiAgICAgICAgIEZJTEUgKmY7Cj4gPiA+ID4gPiA+ID4gICAgICAgICBpbnQgcmV0Owo+ID4g
PiA+ID4gPiA+ICsgICAgICAgdTY0IHN0b3BfYWRkcmVzcyA9IGFkZHIgKyBsZW47Cj4gPiA+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoX19yaXNjdikpIHsK
PiA+ID4gPgo+ID4gPiA+ID4gPiBOb3Qgc3VyZSBpZiB0aGVyZSBpcyBhIGNvbnNpc3RlbmN5IGlz
c3VlIGhlcmUuIEVsc2V3aGVyZSB3ZSdyZSBqdXN0Cj4gPiA+ID4gPiA+IHVzaW5nIGlmZGVmLCBz
dWNoIGFzOgo+ID4gPiA+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJmL3V0aWwv
aW5jbHVkZS9kd2FyZi1yZWdzLmg/aD1wZXJmLXRvb2xzLW5leHQjbjY5Cj4gPiA+ID4KPiA+ID4g
PiA+IEkgZG9uJ3QgaGF2ZSBhbnkgc3Ryb25nIGZlZWxpbmdzIGFib3V0IHRoYXQuIEkgY2FuIGNo
YW5nZSBpdCB0byBiZSBhbgo+ID4gPiA+ID4gaWZkZWYuIE9uIG90aGVyIGxpc3RzIEkgaGF2ZSBi
ZWVuIHRvbGQgdG8gdXNlIElTX0VOQUJMRUQgd2hlbmV2ZXIKPiA+ID4gPiA+IHBvc3NpYmxlLCBi
dXQgaXQncyBvbmx5IGEgc21hbGwgZGlmZmVyZW5jZS4KPiA+ID4gPgo+ID4gPiA+IENhbid0IHdl
IGp1c3QgdXNlIHVuYW1lIGhlcmU/Cj4gPiA+ID4KPiA+ID4gPiBTbyB0aGF0IHdlIGRvbid0IHVz
ZSBrY29uZmlnLmggc2luY2UgaXRzIG5vdCB1c2VkIGluIHRvb2xzL3BlcmYvIGFuZAo+ID4gPiA+
IG1ha2VzIGl0IGxvb2tzIGxpa2UgcGVyZiBpcyBpbiBsb2Nrc3RlcCB3aXRoIHRoZSBrZXJuZWwg
c291cmNlIHRyZWUKPiA+ID4gPiB2ZXJzaW9uIGl0IHdhcyBjb21waWxlZCBmcm9tPwo+ID4gPiA+
Cj4gPiA+ID4gJCBnaXQgZ3JlcCBrY29uZmlnLmggdG9vbHMvcGVyZi8KPiA+ID4gPiAkCj4gPiA+
ID4KPiA+ID4gPiBCVFcsIHdoYXQgd291bGQgaGFwcGVuIGlmIEkgY29sbGVjdGVkIGEgcGVyZi5k
YXRhIGZpbGUgb24geDg2XzY0IGFuZAo+ID4gPiA+IHdvdWxkIHJlYWQgaXQgaW4gYSBSaXNjViBt
YWNoaW5lIHdpdGggc3VjaCBhIG9iamR1bXAgdmVyc2lvbj8gVGhlIHNhbWUKPiA+ID4gPiBwcm9i
bGVtPwo+ID4gPgo+ID4gPiBUaGlzIGNvZGUgaXMgaW4gdGVzdHMgaGVuY2UgdGhpbmtpbmcgdGhh
dCBhIHNlcGFyYXRlIGZpeCBpcyBuZWVkZWQgZm9yCj4gPiA+IHRoYXQgcHJvYmxlbS4gSG9wZWZ1
bGx5IHRoZSB1c2Ugb2YgZWxmIG1hY2hpbmUvZmxhZ3MgdGFja2xlcyBpdDoKPiA+ID4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGVyZi9wZXJmLXRvb2xz
LW5leHQuZ2l0L3RyZWUvdG9vbHMvcGVyZi91dGlsL2luY2x1ZGUvZHdhcmYtcmVncy5oP2g9cGVy
Zi10b29scy1uZXh0I24yNQo+ID4gPiBXZSBhcmUgZ2V0dGluZyBzb21ld2hhdCBkaXNhc3NlbWJs
ZXIgaGVhdnkuIFdlIGhhdmUgbGx2bSBhcyBhIGxpYnJhcnksCj4gPiA+IGNhcHN0b25lIGFzIGEg
bGlicmFyeSwgYmludXRpbHMgb2JqZHVtcCBhbmQgbGx2bSBvYmpkdW1wLiBHaXZlbiB0aGUKPiA+
ID4gcGFpbiB3aXRoIHBhcnNpbmcgdGV4dCwgY291bGQgd2UgbG9zZSB0aGUgb2JqZHVtcHM/IFNp
bWlsYXJseSBmb3IKPiA+ID4gYWRkcjJsaW5lPwo+ID4KPiA+IEFyZSB5b3Ugc3VnZ2VzdGluZyB0
byByZW1vdmUgdGhpcyB0ZXN0IGNhc2UgZW50aXJlbHkgdG8gZ2V0IHJpZCBvZiB0aGUKPiA+IG9i
amR1bXAgZGVwZW5kZW5jeT8gVGhlIGdvYWwgb2YgdGhpcyB0ZXN0IGNhc2Ugc2VlbXMgdG8gYmUg
dG8gY2hlY2sKPiA+IG9iamR1bXAgYW5kIHBlcmYgcmV0dXJuIHRoZSBzYW1lIGRhdGEsIHNvIGl0
IGRvZXNuJ3Qgc2VlbSBsaWtlIHRoZXJlCj4gPiB3b3VsZCBiZSBhbiBhbHRlcm5hdGl2ZSB0byB1
c2luZyBvYmpkdW1wLgo+IAo+IEkgY2FuIGltYWdpbmUgaGF2aW5nIGFuIG9iamR1bXAgZGVwZW5k
ZW5jeSBmb3IgYSB0ZXN0IGJ1dCBub3QgZm9yIHNvbWUKPiBtb3JlIGNvcmUgbGlrZSBgcGVyZiBh
bm5vdGF0ZWAuIFdlIGhhdmUgdG8gZG8gd2VpcmQgdGhpbmdzIHdoZW4KPiBwYXJzaW5nIHRleHQs
IGxpa2UgdGhpcyBjb2RlIEknbSBub3QgcHJvdWQgb2Y6Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGVyZi9wZXJmLXRvb2xzLW5leHQuZ2l0L3RyZWUv
dG9vbHMvcGVyZi91dGlsL3NyY2xpbmUuYz9oPXBlcmYtdG9vbHMtbmV4dCNuNTIzCj4gVGhlIGlz
c3VlIHdpdGggdGhhdCBjb2RlIGlzIHRoYXQgTExWTSBvYmpkdW1wIGhhcyBjaGFuZ2VkIGl0cyBv
dXRwdXQKPiBpbiBuZXdlciB2ZXJzaW9ucyB0byBiZSBjbG9zZXIgdG8gYmludXRpbHMgb2JqZHVt
cC4gRGlkIHRoYXQgYnJlYWsKPiBwZXJmPyBNYXliZSBpdCBqdXN0IGJyb2tlIHdoYXQgb3VyIHZh
cmlhYmxlcyB0aGluayBpcyBhbiBMTFZNIG9iamR1bXAsCj4gYnV0IHRoaW5ncyBhcmVuJ3QgcmVh
bGx5IGJyb2tlbi4gVGhpcyBraW5kIG9mIGlzc3VlIGRvZXNuJ3Qgb2NjdXIgd2l0aAo+IGEgbGli
cmFyeSwgYWx0aG91Z2ggdGhlIGRpZmZlcmluZyBuZWVkcyBvZiBsaWJyYXJ5IHZlcnNpb25zIGlz
IGEgcmVhbAo+IHRoaW5nLgoKWWVhaCBkb2luZyB0aGUgcGFyc2luZyBvZiB0aGUgdGV4dCBvdXRw
dXQgaXMgbm90IGlkZWFsLi4uIEZvciB0aGlzIHRlc3QKY2FzZSBpdCBzaG91bGQgYmUgcG9zc2li
bGUgdG8gZHluYW1pY2FsbHkgbGluayBhZ2FpbnN0IGxpYmJmZC4gSSB3b3VsZApndWVzcyBzb21l
dGhpbmcgc2ltaWxhciBjb3VsZCBiZSBkb25lIHdpdGggbGx2bS1vYmpkdW1wIGJ1dCBJIGFtIGxl
c3MKZmFtaWxpYXIgd2l0aCB0aGF0LiBJIGRvbid0IGtub3cgaWYgdGhhdCdzIGEgZ29vZCBwYXRo
IHRvIGdvIGRvd24KdGhvdWdoLgoKLSBDaGFybGllCgo+IAo+IFRoYW5rcywKPiBJYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
