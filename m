Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7AFE77184
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 00:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVRV16enlQWkRmk10PB9nDFdoe713PJtjKWRwNHOfxU=; b=IrsSmavHOARmGF
	m/pPbAF+mwRlt+d4NgHGXAEnp0Dv0GC3DFZQBJUDZuMu4u3l2KBQ7DaxF4T+a7cAYx+gUx7EhDUhT
	EVZl0FE7GuBwDNkq2LtzKYLrImr071gbCS/hFnzLjwmAMWLehn8EsHMSM46GAjFr5qOl0EwOQbdXz
	BX5Twxq4NnhXpTyuz69V9kQ0Ku+z5C1fDWF8In/IiPTkUUFewIaJvrV9IgGs0L6qZeZ5A5VW90t2O
	7FB4p6mqE/jUw4LW/cxQl5cVt8dsNYob9RWM13O9Z2Gj3fBkdA/MOeL0JQfXb1CV4MzR1h8IYNRp4
	dkiS31egMnVqswe2/mfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhm3-0000000FCAV-39se;
	Wed, 18 Dec 2024 00:18:47 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNhm1-0000000FC9M-2b5I
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 00:18:46 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3a815a5fb60so60205ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2024 16:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734481124; x=1735085924; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VgS75oUAz4sbyrMvBGeF09Mw4wz7d5kDQKFYPnPV2Q=;
        b=EQr1jVPV4dNGv+tD/c9dNV/OTxcE3jylBCI2ew0y6sjAzE6lEbELYND3J8bG7jzB4p
         T6Lb1Npk/FSD5c+kRinOveMlEEbRA3Zj/FqbI4HvAFukRZRFDoDnjoJirFdlxgMfT9X3
         l1g0zLz8bwRjIUnUjHUL4yuon85DvgSACvOCFkSb6Oc8tzRm1/SpGuJ+kZ6KhFUrFHZk
         fw8CRKiuPULEd8akaiGaVIQxrZhKScGfbOI0htwQLLN/Cyyx3zVy0l8/QepxquXRwJxu
         n6f3Hoxm7b6qTsKdCUuSf00QslRQ16fv9rFoe0LkLH2pcS3m8SRUNmxg4mD+3zlsFrV2
         4f/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734481124; x=1735085924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VgS75oUAz4sbyrMvBGeF09Mw4wz7d5kDQKFYPnPV2Q=;
        b=bXoHPhIjPSoucxaZv5Vyg0vFY0aaCqQMUKuO2hulyFabymGcTovt4Xjb/LQfJPtsv/
         nuABx9OJmgiENx03gN58md6wj9fye0oFJ4Ml8Z6GNyk3WeXgyxLSshIJ080o8H1trnU5
         eHPovXI8OnqcxTs/1O0MY+ieoPSDQQZIP5kY7B7eGvk7swy8VTZIGytbsOxhtckDl1jU
         nPDvlR0hpMKcY1scj9PdmRijFgXytOtjDc5poQH6uQ2PjTpT6+prSq8vaWpnF1asouEn
         vcgDuOYVaNH/aZyloSdT8tHwMltgI889kQQAX06oYoqDOn8cv9KWMeJYaziVCU4SXjCT
         RUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkFIo8Ouo9wkoh8ac5AunDnP9ifVhdsGFq0oN5HwtPvHaJz2v4aEMcTTiBYIuV+uAWw+XNWMrqFhYFDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6EtVXHoF4XC3Er1aCucgyZmsjPlHv3P/lfiOpgEUxuNV65Vqx
	BV+y+/dyVHOpXAvA1GzdrNXSeMjKVPYVLrTuj7Av/qa6GaaAKZqbn8CNv+/C1tc6x6TxbKKBwly
	VlRawATDadRnWHUEcqr9dSxT9tFtxM8mg7Zhr
X-Gm-Gg: ASbGnct/MrHp1AbdBxDVapqCA0CeCCqH+gztBxsAyY9FB922l9FS537nsqUPaaWf2I3
	eFDkPpDpa/7yKwc3l/Bczb+WRuZv6FSDG1MyRW90=
X-Google-Smtp-Source: AGHT+IFeicWsO3v+Iottx16JJQKcUQ0sqHuKfIXsWy0nEqaNcbAiUwHCGOeSwyFewGDSDRzXDE9GUe83Y7kVhJlr7Ts=
X-Received: by 2002:a92:ca49:0:b0:3a7:dcc1:9936 with SMTP id
 e9e14a558f8ab-3be37d49881mr326395ab.23.1734481124308; Tue, 17 Dec 2024
 16:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
In-Reply-To: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Dec 2024 16:18:32 -0800
Message-ID: <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com>
Subject: Re: [PATCH v2] tools: perf: tests: Fix code reading for riscv
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_161845_657032_1F04DDD5 
X-CRM114-Status: GOOD (  31.07  )
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

T24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMzo1MuKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gQWZ0ZXIgYmludXRpbHMgY29tbWl0IGU0M2Q4NzYg
d2hpY2ggd2FzIGZpcnN0IGluY2x1ZGVkIGluIGJpbnV0aWxzIDIuNDEsCj4gcmlzY3Ygbm8gbG9u
Z2VyIHN1cHBvcnRzIGR1bXBpbmcgaW4gdGhlIG1pZGRsZSBvZiBpbnN0cnVjdGlvbnMuIEluY3Jl
YXNlCj4gdGhlIG9iamR1bXAgd2luZG93IGJ5IDItYnl0ZXMgdG8gZW5zdXJlIHRoYXQgYW55IGlu
c3RydWN0aW9uIHRoYXQgc2l0cwo+IG9uIHRoZSBib3VuZGFyeSBvZiB0aGUgc3BlY2lmaWVkIHN0
b3AtYWRkcmVzcyBpcyBub3QgY3V0IGluIGhhbGYuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGll
IEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgoKUmV2aWV3ZWQtYnk6IElhbiBSb2dlcnMg
PGlyb2dlcnNAZ29vZ2xlLmNvbT4KCj4gLS0tCj4gQSBiaW51dGlscyBwYXRjaCBoYXMgYmVlbiBz
ZW50IGFzIHdlbGwgdG8gZml4IHRoaXMgaW4gb2JqZHVtcCBbMV0uCj4KPiBMaW5rOgo+IGh0dHBz
Oi8vc291cmNld2FyZS5vcmcvcGlwZXJtYWlsL2JpbnV0aWxzLzIwMjQtRGVjZW1iZXIvMTM4MTM5
Lmh0bWwgWzFdCj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIERvIG9iamR1bXAgdmVyc2lvbiBk
ZXRlY3Rpb24gYXQgcnVudGltZSAoSWFuKQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MTIxNi1wZXJmX2ZpeF9yaXNjdl9vYmpfcmVhZGluZy12MS0wLWI3NTk2
MjY2MGE5YkByaXZvc2luYy5jb20KPiAtLS0KPiAgdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRp
bmcuYyB8IDg0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRpbmcuYyBiL3Rvb2xzL3BlcmYvdGVzdHMv
Y29kZS1yZWFkaW5nLmMKPiBpbmRleCAyN2M4MmNmYjdlN2RlNDIyODRiZjVhZjljZjc1OTRhM2E5
NjMwNTJlLi43ZTI0ZDEwYTU0M2FjMThhYzJiZTcwYjgyOWQwODg4NzRlMGVkZmQ1IDEwMDY0NAo+
IC0tLSBhL3Rvb2xzL3BlcmYvdGVzdHMvY29kZS1yZWFkaW5nLmMKPiArKysgYi90b29scy9wZXJm
L3Rlc3RzL2NvZGUtcmVhZGluZy5jCj4gQEAgLTEsNSArMSw2IEBACj4gIC8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gICNpbmNsdWRlIDxlcnJuby5oPgo+ICsjaW5jbHVkZSA8
bGludXgva2NvbmZpZy5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPgo+ICAjaW5jbHVkZSA8aW50dHlwZXMuaD4KPiBAQCAtMTc2LDYgKzE3
Nyw2NiBAQCBzdGF0aWMgaW50IHJlYWRfb2JqZHVtcF9vdXRwdXQoRklMRSAqZiwgdm9pZCAqYnVm
LCBzaXplX3QgKmxlbiwgdTY0IHN0YXJ0X2FkZHIpCj4gICAgICAgICByZXR1cm4gZXJyOwo+ICB9
Cj4KPiArLyoKPiArICogT25seSBnZXRzIEdOVSBvYmpkdW1wIHZlcnNpb24uIFJldHVybnMgMCBm
b3IgbGx2bS1vYmpkdW1wLgo+ICsgKi8KPiArc3RhdGljIGludCBvYmpkdW1wX3ZlcnNpb24odm9p
ZCkKPiArewo+ICsgICAgICAgc2l6ZV90IGxpbmVfbGVuOwo+ICsgICAgICAgY2hhciBjbWRbUEFU
SF9NQVggKiAyXTsKPiArICAgICAgIGNoYXIgKmxpbmUgPSBOVUxMOwo+ICsgICAgICAgY29uc3Qg
Y2hhciAqZm10Owo+ICsgICAgICAgRklMRSAqZjsKPiArICAgICAgIGludCByZXQ7Cj4gKwo+ICsg
ICAgICAgaW50IHZlcnNpb25fdG1wLCB2ZXJzaW9uX251bSA9IDA7Cj4gKyAgICAgICBjaGFyICp2
ZXJzaW9uID0gMCwgKnRva2VuOwo+ICsKPiArICAgICAgIGZtdCA9ICIlcyAtLXZlcnNpb24iOwo+
ICsgICAgICAgcmV0ID0gc25wcmludGYoY21kLCBzaXplb2YoY21kKSwgZm10LCB0ZXN0X29iamR1
bXBfcGF0aCk7Cj4gKyAgICAgICBpZiAocmV0IDw9IDAgfHwgKHNpemVfdClyZXQgPj0gc2l6ZW9m
KGNtZCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtMTsKPiArICAgICAgIC8qIElnbm9yZSBv
YmpkdW1wIGVycm9ycyAqLwo+ICsgICAgICAgc3RyY2F0KGNtZCwgIiAyPi9kZXYvbnVsbCIpOwo+
ICsgICAgICAgZiA9IHBvcGVuKGNtZCwgInIiKTsKPiArICAgICAgIGlmICghZikgewo+ICsgICAg
ICAgICAgICAgICBwcl9kZWJ1ZygicG9wZW4gZmFpbGVkXG4iKTsKPiArICAgICAgICAgICAgICAg
cmV0dXJuIC0xOwo+ICsgICAgICAgfQo+ICsgICAgICAgLyogR2V0IGZpcnN0IGxpbmUgb2Ygb2Jq
ZHVtcCAtLXZlcnNpb24gb3V0cHV0ICovCj4gKyAgICAgICByZXQgPSBnZXRsaW5lKCZsaW5lLCAm
bGluZV9sZW4sIGYpOwo+ICsgICAgICAgcGNsb3NlKGYpOwo+ICsgICAgICAgaWYgKHJldCA8IDAp
IHsKPiArICAgICAgICAgICAgICAgcHJfZGVidWcoImdldGxpbmUgZmFpbGVkXG4iKTsKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIC0xOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHRva2VuID0g
c3Ryc2VwKCZsaW5lLCAiICIpOwo+ICsgICAgICAgaWYgKHRva2VuICE9IE5VTEwgJiYgIXN0cmNt
cCh0b2tlbiwgIkdOVSIpKSB7Cj4gKyAgICAgICAgICAgICAgIC8vIHZlcnNpb24gaXMgbGFzdCBw
YXJ0IG9mIGZpcnN0IGxpbmUgb2Ygb2JqZHVtcCAtLXZlcnNpb24gb3V0cHV0Lgo+ICsgICAgICAg
ICAgICAgICB3aGlsZSAoKHRva2VuID0gc3Ryc2VwKCZsaW5lLCAiICIpKSkKPiArICAgICAgICAg
ICAgICAgICAgICAgICB2ZXJzaW9uID0gdG9rZW47Cj4gKwo+ICsgICAgICAgICAgICAgICAvLyBD
b252ZXJ0IHZlcnNpb24gaW50byBhIGZvcm1hdCB3ZSBjYW4gY29tcGFyZSB3aXRoCj4gKyAgICAg
ICAgICAgICAgIHRva2VuID0gc3Ryc2VwKCZ2ZXJzaW9uLCAiLiIpOwo+ICsgICAgICAgICAgICAg
ICB2ZXJzaW9uX251bSA9IGF0b2kodG9rZW4pOwo+ICsgICAgICAgICAgICAgICBpZiAodmVyc2lv
bl9udW0pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgdmVyc2lvbl9udW0gKj0gMTAwMDA7Cj4g
Kwo+ICsgICAgICAgICAgICAgICB0b2tlbiA9IHN0cnNlcCgmdmVyc2lvbiwgIi4iKTsKPiArICAg
ICAgICAgICAgICAgdmVyc2lvbl90bXAgPSBhdG9pKHRva2VuKTsKPiArICAgICAgICAgICAgICAg
aWYgKHRva2VuKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHZlcnNpb25fbnVtICs9IHZlcnNp
b25fdG1wICogMTAwOwo+ICsKPiArICAgICAgICAgICAgICAgdG9rZW4gPSBzdHJzZXAoJnZlcnNp
b24sICIuIik7Cj4gKyAgICAgICAgICAgICAgIHZlcnNpb25fdG1wID0gYXRvaSh0b2tlbik7Cj4g
KyAgICAgICAgICAgICAgIGlmICh0b2tlbikKPiArICAgICAgICAgICAgICAgICAgICAgICB2ZXJz
aW9uX251bSArPSB2ZXJzaW9uX3RtcDsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1cm4g
dmVyc2lvbl9udW07Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgcmVhZF92aWFfb2JqZHVtcChjb25z
dCBjaGFyICpmaWxlbmFtZSwgdTY0IGFkZHIsIHZvaWQgKmJ1ZiwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2l6ZV90IGxlbikKPiAgewo+IEBAIC0xODMsOSArMjQ0LDMwIEBAIHN0YXRp
YyBpbnQgcmVhZF92aWFfb2JqZHVtcChjb25zdCBjaGFyICpmaWxlbmFtZSwgdTY0IGFkZHIsIHZv
aWQgKmJ1ZiwKPiAgICAgICAgIGNvbnN0IGNoYXIgKmZtdDsKPiAgICAgICAgIEZJTEUgKmY7Cj4g
ICAgICAgICBpbnQgcmV0Owo+ICsgICAgICAgdTY0IHN0b3BfYWRkcmVzcyA9IGFkZHIgKyBsZW47
Cj4gKwo+ICsgICAgICAgaWYgKElTX0VOQUJMRUQoX19yaXNjdikpIHsKCk5vdCBzdXJlIGlmIHRo
ZXJlIGlzIGEgY29uc2lzdGVuY3kgaXNzdWUgaGVyZS4gRWxzZXdoZXJlIHdlJ3JlIGp1c3QKdXNp
bmcgaWZkZWYsIHN1Y2ggYXM6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3BlcmYvcGVyZi10b29scy1uZXh0LmdpdC90cmVlL3Rvb2xzL3BlcmYvdXRpbC9p
bmNsdWRlL2R3YXJmLXJlZ3MuaD9oPXBlcmYtdG9vbHMtbmV4dCNuNjkKClRoYW5rcywKSWFuCgo+
ICsgICAgICAgICAgICAgICBpbnQgdmVyc2lvbiA9IG9iamR1bXBfdmVyc2lvbigpOwo+ICsKPiAr
ICAgICAgICAgICAgICAgLyogRGVmYXVsdCB0byB0aGlzIHdvcmthcm91bmQgaWYgdmVyc2lvbiBw
YXJzaW5nIGZhaWxzICovCj4gKyAgICAgICAgICAgICAgIGlmICh2ZXJzaW9uIDwgMCB8fCB2ZXJz
aW9uID4gMjQxMDApIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAqIFN0YXJ0aW5nIGF0IHJpc2N2IG9iamR1bXAgdmVyc2lvbiAyLjQxLCBk
dW1waW5nIGluCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogdGhlIG1pZGRsZSBvZiBhbiBp
bnN0cnVjdGlvbiBpcyBub3Qgc3VwcG9ydGVkLiByaXNjdgo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAqIGluc3RydWN0aW9ucyBhcmUgYWxpZ25lZCBhbG9uZyAyLWJ5dGUgaW50ZXJ2YWxzIGFu
ZAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGNhbiBiZSBlaXRoZXIgMi1ieXRlcyBvciA0
LWJ5dGVzLiBUaGlzIG1ha2VzIGl0Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogcG9zc2li
bGUgdGhhdCB0aGUgc3RvcC1hZGRyZXNzIGxhbmRzIGluIHRoZSBtaWRkbGUgb2YKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgKiBhIDQtYnl0ZSBpbnN0cnVjdGlvbi4gSW5jcmVhc2UgdGhlIHN0
b3BfYWRkcmVzcyBieQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIHR3byB0byBlbnN1cmUg
YW4gaW5zdHJ1Y3Rpb24gaXMgbm90IGN1dCBpbiBoYWxmLCBidXQKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgKiBsZWF2ZSB0aGUgbGVuIGFzLWlzIHNvIG9ubHkgdGhlIGV4cGVjdGVkIG51bWJl
ciBvZgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGJ5dGVzIGFyZSBjb2xsZWN0ZWQuCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Rv
cF9hZGRyZXNzICs9IDI7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPgo+ICAgICAg
ICAgZm10ID0gIiVzIC16IC1kIC0tc3RhcnQtYWRkcmVzcz0weCUiUFJJeDY0IiAtLXN0b3AtYWRk
cmVzcz0weCUiUFJJeDY0IiAlcyI7Cj4gLSAgICAgICByZXQgPSBzbnByaW50ZihjbWQsIHNpemVv
ZihjbWQpLCBmbXQsIHRlc3Rfb2JqZHVtcF9wYXRoLCBhZGRyLCBhZGRyICsgbGVuLAo+ICsgICAg
ICAgcmV0ID0gc25wcmludGYoY21kLCBzaXplb2YoY21kKSwgZm10LCB0ZXN0X29iamR1bXBfcGF0
aCwgYWRkciwgc3RvcF9hZGRyZXNzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgZmlsZW5hbWUp
Owo+ICAgICAgICAgaWYgKHJldCA8PSAwIHx8IChzaXplX3QpcmV0ID49IHNpemVvZihjbWQpKQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gLTE7Cj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogZmFjMDRl
ZmM1Yzc5M2RjY2JkMDdlMmQ1OWFmOWY5MGI3ZmMwZGNhNAo+IGNoYW5nZS1pZDogMjAyNDEyMTMt
cGVyZl9maXhfcmlzY3Zfb2JqX3JlYWRpbmctY2FiZjAyYmUzYzg1Cj4gLS0KPiAtIENoYXJsaWUK
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
