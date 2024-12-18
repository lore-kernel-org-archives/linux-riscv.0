Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53B9E77184
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 00:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PTdpIN8ifBQxGQGpuZrD/uhNEs3Sk08QugsgfUOWIE=; b=zAJu9n+2CSH5PE
	5SFaeCjglk8F5qVhTBfUN2ub1v5KnYLIFESP3TsGuuVweA8SpzWhZMWf8im82/zCXW/UVxBN0pAvT
	OttNYyqkhzFXd2G1OtIjSva2N+n+9E2DxiW6Z6aTarVmzTIqZCDFJBWF+vgLsA/nbHonyRHrqh9wE
	rVPGNGN2J/Waq724rCTv8oeKkm99zq3Vl+GYeuqR0cF7u9KJnpu8Ph977rV857p8jqZZYddK0V/Xo
	tl2D46XC2/FJJEPObBOgjjPRSWIYkYQLGJzrZHa7UMIaPAJX3YroNSeQu4URW6Bo4sIZXbP8cTrVa
	Jrl1IiQT8yWlG5uym1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhxI-0000000FDTH-0mPX;
	Wed, 18 Dec 2024 00:30:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhxE-0000000FDSe-3kgK
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 00:30:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-725c86bbae7so5080945b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2024 16:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734481819; x=1735086619; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cw55AKdZY3Iyzi7xSZCsR45xkksNMr90DAnnsKl2gF4=;
        b=qJwVAHXoPASkDKbo56/O5Z1uVcRTOwTnSUboQZL31ZxqoscEOfeM61ZyFeWO9RCEvu
         XB2hjO+49kwogv6QiK775ooNrukKenlaYK2xmBfbI77Om5I2PYNUWEB08oPZ3Me+oOJG
         8o3H5tqokkb+pSE2+B/qqJs3C+ddKvFCgNW/5aiM0cWt+dKHiGomsngv+ngRqC3RlDLX
         wrovuoZuT87uBgQcubKgOXAa+BVOM4v9M0PgRY1W1ap/VjSlzXX0iOdB6URmSoboVXd9
         dPLH+xvxT9aiPA0yYGtvDAquDuaPYqW6NSTJoTDCWQTsIjEXpq+KvcuRvLpl0nZYHqKy
         zgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481819; x=1735086619;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cw55AKdZY3Iyzi7xSZCsR45xkksNMr90DAnnsKl2gF4=;
        b=sai4v+TQXwSrLn0/sxH0ytO1MCHxeaeIwj1qHLSXejZlVLIxTQoRROmqgH5DMBwsQM
         hTNZzWkMUbc7K/Zr3rDgpMGclB55qUtXLEKhaqIiZTcUoSkwoYg40WG7UKTn6Ke5MXpT
         R3nLGdlOqdvHTaVb0aNYVXA6CVMwtUFjJya7M+1BZNM69FH0CgSe94ufNd/DmVnA7rYI
         tJQ5miZcPuwdDGmHeCQOZVwWqoyJ080kEt7uW366m2TOqczBYJZ8LIvNSXYSGI97SuL6
         hPG5oKDmDDZxX+N2bPf9PySs4wFeDX2T/CuBblIpZdUHqRlotX3EPiUAFmXT1o5N38tN
         eGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpfYcF1CNgrja6g+ylAvKEpBHw4u22u8WhKqObGrTIroEgNhm4lcd5ZiGuGkUBNXUxlUgmnlPffO4xeg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw39Gg6aNsNE1jhZjjh2nFbGwo4V0+WTl++4P6esKOlmrW7/fZW
	vMDUHTYSTHcXy7UfhnTDyPc0sul+DSmEWSACstSfOmvrEA7KQsC6mQrWiYI2534=
X-Gm-Gg: ASbGnctJARQt4gFCvDEwhTu0cpXfYK6DaOp3mYWyaIf69WITGHW+b9qK3bdOh9jLNeC
	t7dKf/GyQ9et4CA38TUGZBSVw175/1N3zevs15SDy3iphuoiWmahyDVOwCnnLsKzxwGG/Ip1W1N
	R4Y7l/4u+yzDX3BhlwP48whFj3kVjo/+uDdT32a4f1ja2tbvCHDOK4LFUzGykksUSRZUiujAcYN
	GsGumbcP82L/6Q2eYEYfPDP8QnwduyNhBqdyGHiDEVy9Fg=
X-Google-Smtp-Source: AGHT+IG5Cx6yPttPbYg5wTTofbNuEwnlOQqyTrXYd/ruQPCVe05gCE7tcoBeRNxbyUyUCgfsg6Vu2g==
X-Received: by 2002:a05:6a20:a103:b0:1e1:9f57:eac3 with SMTP id adf61e73a8af0-1e5b480f77bmr1790673637.18.1734481819597;
        Tue, 17 Dec 2024 16:30:19 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aaea84sm5297831a12.26.2024.12.17.16.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:30:18 -0800 (PST)
Date: Tue, 17 Dec 2024 16:30:15 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
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
Message-ID: <Z2IXl5cuKQJInJb0@ghost>
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_163020_936573_08DC5C76 
X-CRM114-Status: GOOD (  37.99  )
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

T24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMDQ6MTg6MzJQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBUdWUsIERlYyAxNywgMjAyNCBhdCAzOjUy4oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxj
aGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWZ0ZXIgYmludXRpbHMgY29tbWl0
IGU0M2Q4NzYgd2hpY2ggd2FzIGZpcnN0IGluY2x1ZGVkIGluIGJpbnV0aWxzIDIuNDEsCj4gPiBy
aXNjdiBubyBsb25nZXIgc3VwcG9ydHMgZHVtcGluZyBpbiB0aGUgbWlkZGxlIG9mIGluc3RydWN0
aW9ucy4gSW5jcmVhc2UKPiA+IHRoZSBvYmpkdW1wIHdpbmRvdyBieSAyLWJ5dGVzIHRvIGVuc3Vy
ZSB0aGF0IGFueSBpbnN0cnVjdGlvbiB0aGF0IHNpdHMKPiA+IG9uIHRoZSBib3VuZGFyeSBvZiB0
aGUgc3BlY2lmaWVkIHN0b3AtYWRkcmVzcyBpcyBub3QgY3V0IGluIGhhbGYuCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiAKPiBS
ZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgo+IAo+ID4gLS0tCj4g
PiBBIGJpbnV0aWxzIHBhdGNoIGhhcyBiZWVuIHNlbnQgYXMgd2VsbCB0byBmaXggdGhpcyBpbiBv
YmpkdW1wIFsxXS4KPiA+Cj4gPiBMaW5rOgo+ID4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9waXBl
cm1haWwvYmludXRpbHMvMjAyNC1EZWNlbWJlci8xMzgxMzkuaHRtbCBbMV0KPiA+IC0tLQo+ID4g
Q2hhbmdlcyBpbiB2MjoKPiA+IC0gRG8gb2JqZHVtcCB2ZXJzaW9uIGRldGVjdGlvbiBhdCBydW50
aW1lIChJYW4pCj4gPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NDEyMTYtcGVyZl9maXhfcmlzY3Zfb2JqX3JlYWRpbmctdjEtMC1iNzU5NjI2NjBhOWJAcml2b3Np
bmMuY29tCj4gPiAtLS0KPiA+ICB0b29scy9wZXJmL3Rlc3RzL2NvZGUtcmVhZGluZy5jIHwgODQg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgODMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS90b29scy9wZXJmL3Rlc3RzL2NvZGUtcmVhZGluZy5jIGIvdG9vbHMvcGVyZi90ZXN0cy9jb2Rl
LXJlYWRpbmcuYwo+ID4gaW5kZXggMjdjODJjZmI3ZTdkZTQyMjg0YmY1YWY5Y2Y3NTk0YTNhOTYz
MDUyZS4uN2UyNGQxMGE1NDNhYzE4YWMyYmU3MGI4MjlkMDg4ODc0ZTBlZGZkNSAxMDA2NDQKPiA+
IC0tLSBhL3Rvb2xzL3BlcmYvdGVzdHMvY29kZS1yZWFkaW5nLmMKPiA+ICsrKyBiL3Rvb2xzL3Bl
cmYvdGVzdHMvY29kZS1yZWFkaW5nLmMKPiA+IEBAIC0xLDUgKzEsNiBAQAo+ID4gIC8vIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiAgI2luY2x1ZGUgPGVycm5vLmg+Cj4gPiAr
I2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+
Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4gPiAgI2luY2x1ZGUgPGludHR5cGVzLmg+
Cj4gPiBAQCAtMTc2LDYgKzE3Nyw2NiBAQCBzdGF0aWMgaW50IHJlYWRfb2JqZHVtcF9vdXRwdXQo
RklMRSAqZiwgdm9pZCAqYnVmLCBzaXplX3QgKmxlbiwgdTY0IHN0YXJ0X2FkZHIpCj4gPiAgICAg
ICAgIHJldHVybiBlcnI7Cj4gPiAgfQo+ID4KPiA+ICsvKgo+ID4gKyAqIE9ubHkgZ2V0cyBHTlUg
b2JqZHVtcCB2ZXJzaW9uLiBSZXR1cm5zIDAgZm9yIGxsdm0tb2JqZHVtcC4KPiA+ICsgKi8KPiA+
ICtzdGF0aWMgaW50IG9iamR1bXBfdmVyc2lvbih2b2lkKQo+ID4gK3sKPiA+ICsgICAgICAgc2l6
ZV90IGxpbmVfbGVuOwo+ID4gKyAgICAgICBjaGFyIGNtZFtQQVRIX01BWCAqIDJdOwo+ID4gKyAg
ICAgICBjaGFyICpsaW5lID0gTlVMTDsKPiA+ICsgICAgICAgY29uc3QgY2hhciAqZm10Owo+ID4g
KyAgICAgICBGSUxFICpmOwo+ID4gKyAgICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgICBp
bnQgdmVyc2lvbl90bXAsIHZlcnNpb25fbnVtID0gMDsKPiA+ICsgICAgICAgY2hhciAqdmVyc2lv
biA9IDAsICp0b2tlbjsKPiA+ICsKPiA+ICsgICAgICAgZm10ID0gIiVzIC0tdmVyc2lvbiI7Cj4g
PiArICAgICAgIHJldCA9IHNucHJpbnRmKGNtZCwgc2l6ZW9mKGNtZCksIGZtdCwgdGVzdF9vYmpk
dW1wX3BhdGgpOwo+ID4gKyAgICAgICBpZiAocmV0IDw9IDAgfHwgKHNpemVfdClyZXQgPj0gc2l6
ZW9mKGNtZCkpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+ID4gKyAgICAgICAvKiBJ
Z25vcmUgb2JqZHVtcCBlcnJvcnMgKi8KPiA+ICsgICAgICAgc3RyY2F0KGNtZCwgIiAyPi9kZXYv
bnVsbCIpOwo+ID4gKyAgICAgICBmID0gcG9wZW4oY21kLCAiciIpOwo+ID4gKyAgICAgICBpZiAo
IWYpIHsKPiA+ICsgICAgICAgICAgICAgICBwcl9kZWJ1ZygicG9wZW4gZmFpbGVkXG4iKTsKPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4gPiArICAgICAgIH0KPiA+ICsgICAgICAgLyog
R2V0IGZpcnN0IGxpbmUgb2Ygb2JqZHVtcCAtLXZlcnNpb24gb3V0cHV0ICovCj4gPiArICAgICAg
IHJldCA9IGdldGxpbmUoJmxpbmUsICZsaW5lX2xlbiwgZik7Cj4gPiArICAgICAgIHBjbG9zZShm
KTsKPiA+ICsgICAgICAgaWYgKHJldCA8IDApIHsKPiA+ICsgICAgICAgICAgICAgICBwcl9kZWJ1
ZygiZ2V0bGluZSBmYWlsZWRcbiIpOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtMTsKPiA+
ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICB0b2tlbiA9IHN0cnNlcCgmbGluZSwgIiAiKTsK
PiA+ICsgICAgICAgaWYgKHRva2VuICE9IE5VTEwgJiYgIXN0cmNtcCh0b2tlbiwgIkdOVSIpKSB7
Cj4gPiArICAgICAgICAgICAgICAgLy8gdmVyc2lvbiBpcyBsYXN0IHBhcnQgb2YgZmlyc3QgbGlu
ZSBvZiBvYmpkdW1wIC0tdmVyc2lvbiBvdXRwdXQuCj4gPiArICAgICAgICAgICAgICAgd2hpbGUg
KCh0b2tlbiA9IHN0cnNlcCgmbGluZSwgIiAiKSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICB2ZXJzaW9uID0gdG9rZW47Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgLy8gQ29udmVydCB2
ZXJzaW9uIGludG8gYSBmb3JtYXQgd2UgY2FuIGNvbXBhcmUgd2l0aAo+ID4gKyAgICAgICAgICAg
ICAgIHRva2VuID0gc3Ryc2VwKCZ2ZXJzaW9uLCAiLiIpOwo+ID4gKyAgICAgICAgICAgICAgIHZl
cnNpb25fbnVtID0gYXRvaSh0b2tlbik7Cj4gPiArICAgICAgICAgICAgICAgaWYgKHZlcnNpb25f
bnVtKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbl9udW0gKj0gMTAwMDA7Cj4g
PiArCj4gPiArICAgICAgICAgICAgICAgdG9rZW4gPSBzdHJzZXAoJnZlcnNpb24sICIuIik7Cj4g
PiArICAgICAgICAgICAgICAgdmVyc2lvbl90bXAgPSBhdG9pKHRva2VuKTsKPiA+ICsgICAgICAg
ICAgICAgICBpZiAodG9rZW4pCj4gPiArICAgICAgICAgICAgICAgICAgICAgICB2ZXJzaW9uX251
bSArPSB2ZXJzaW9uX3RtcCAqIDEwMDsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICB0b2tlbiA9
IHN0cnNlcCgmdmVyc2lvbiwgIi4iKTsKPiA+ICsgICAgICAgICAgICAgICB2ZXJzaW9uX3RtcCA9
IGF0b2kodG9rZW4pOwo+ID4gKyAgICAgICAgICAgICAgIGlmICh0b2tlbikKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHZlcnNpb25fbnVtICs9IHZlcnNpb25fdG1wOwo+ID4gKyAgICAgICB9
Cj4gPiArCj4gPiArICAgICAgIHJldHVybiB2ZXJzaW9uX251bTsKPiA+ICt9Cj4gPiArCj4gPiAg
c3RhdGljIGludCByZWFkX3ZpYV9vYmpkdW1wKGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB1NjQgYWRk
ciwgdm9pZCAqYnVmLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBsZW4p
Cj4gPiAgewo+ID4gQEAgLTE4Myw5ICsyNDQsMzAgQEAgc3RhdGljIGludCByZWFkX3ZpYV9vYmpk
dW1wKGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB1NjQgYWRkciwgdm9pZCAqYnVmLAo+ID4gICAgICAg
ICBjb25zdCBjaGFyICpmbXQ7Cj4gPiAgICAgICAgIEZJTEUgKmY7Cj4gPiAgICAgICAgIGludCBy
ZXQ7Cj4gPiArICAgICAgIHU2NCBzdG9wX2FkZHJlc3MgPSBhZGRyICsgbGVuOwo+ID4gKwo+ID4g
KyAgICAgICBpZiAoSVNfRU5BQkxFRChfX3Jpc2N2KSkgewo+IAo+IE5vdCBzdXJlIGlmIHRoZXJl
IGlzIGEgY29uc2lzdGVuY3kgaXNzdWUgaGVyZS4gRWxzZXdoZXJlIHdlJ3JlIGp1c3QKPiB1c2lu
ZyBpZmRlZiwgc3VjaCBhczoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9wZXJmL3BlcmYtdG9vbHMtbmV4dC5naXQvdHJlZS90b29scy9wZXJmL3V0aWwv
aW5jbHVkZS9kd2FyZi1yZWdzLmg/aD1wZXJmLXRvb2xzLW5leHQjbjY5CgpJIGRvbid0IGhhdmUg
YW55IHN0cm9uZyBmZWVsaW5ncyBhYm91dCB0aGF0LiBJIGNhbiBjaGFuZ2UgaXQgdG8gYmUgYW4K
aWZkZWYuIE9uIG90aGVyIGxpc3RzIEkgaGF2ZSBiZWVuIHRvbGQgdG8gdXNlIElTX0VOQUJMRUQg
d2hlbmV2ZXIKcG9zc2libGUsIGJ1dCBpdCdzIG9ubHkgYSBzbWFsbCBkaWZmZXJlbmNlLgoKLSBD
aGFybGllCgoKPiAKPiBUaGFua3MsCj4gSWFuCj4gCj4gPiArICAgICAgICAgICAgICAgaW50IHZl
cnNpb24gPSBvYmpkdW1wX3ZlcnNpb24oKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAvKiBE
ZWZhdWx0IHRvIHRoaXMgd29ya2Fyb3VuZCBpZiB2ZXJzaW9uIHBhcnNpbmcgZmFpbHMgKi8KPiA+
ICsgICAgICAgICAgICAgICBpZiAodmVyc2lvbiA8IDAgfHwgdmVyc2lvbiA+IDI0MTAwKSB7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICogU3RhcnRpbmcgYXQgcmlzY3Ygb2JqZHVtcCB2ZXJzaW9uIDIuNDEsIGR1bXBpbmcgaW4KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHRoZSBtaWRkbGUgb2YgYW4gaW5zdHJ1Y3Rpb24g
aXMgbm90IHN1cHBvcnRlZC4gcmlzY3YKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGlu
c3RydWN0aW9ucyBhcmUgYWxpZ25lZCBhbG9uZyAyLWJ5dGUgaW50ZXJ2YWxzIGFuZAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICogY2FuIGJlIGVpdGhlciAyLWJ5dGVzIG9yIDQtYnl0ZXMu
IFRoaXMgbWFrZXMgaXQKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHBvc3NpYmxlIHRo
YXQgdGhlIHN0b3AtYWRkcmVzcyBsYW5kcyBpbiB0aGUgbWlkZGxlIG9mCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgKiBhIDQtYnl0ZSBpbnN0cnVjdGlvbi4gSW5jcmVhc2UgdGhlIHN0b3Bf
YWRkcmVzcyBieQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICogdHdvIHRvIGVuc3VyZSBh
biBpbnN0cnVjdGlvbiBpcyBub3QgY3V0IGluIGhhbGYsIGJ1dAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICogbGVhdmUgdGhlIGxlbiBhcy1pcyBzbyBvbmx5IHRoZSBleHBlY3RlZCBudW1i
ZXIgb2YKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGJ5dGVzIGFyZSBjb2xsZWN0ZWQu
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHN0b3BfYWRkcmVzcyArPSAyOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAg
fQo+ID4KPiA+ICAgICAgICAgZm10ID0gIiVzIC16IC1kIC0tc3RhcnQtYWRkcmVzcz0weCUiUFJJ
eDY0IiAtLXN0b3AtYWRkcmVzcz0weCUiUFJJeDY0IiAlcyI7Cj4gPiAtICAgICAgIHJldCA9IHNu
cHJpbnRmKGNtZCwgc2l6ZW9mKGNtZCksIGZtdCwgdGVzdF9vYmpkdW1wX3BhdGgsIGFkZHIsIGFk
ZHIgKyBsZW4sCj4gPiArICAgICAgIHJldCA9IHNucHJpbnRmKGNtZCwgc2l6ZW9mKGNtZCksIGZt
dCwgdGVzdF9vYmpkdW1wX3BhdGgsIGFkZHIsIHN0b3BfYWRkcmVzcywKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgZmlsZW5hbWUpOwo+ID4gICAgICAgICBpZiAocmV0IDw9IDAgfHwgKHNpemVf
dClyZXQgPj0gc2l6ZW9mKGNtZCkpCj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+ID4K
PiA+IC0tLQo+ID4gYmFzZS1jb21taXQ6IGZhYzA0ZWZjNWM3OTNkY2NiZDA3ZTJkNTlhZjlmOTBi
N2ZjMGRjYTQKPiA+IGNoYW5nZS1pZDogMjAyNDEyMTMtcGVyZl9maXhfcmlzY3Zfb2JqX3JlYWRp
bmctY2FiZjAyYmUzYzg1Cj4gPiAtLQo+ID4gLSBDaGFybGllCj4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
