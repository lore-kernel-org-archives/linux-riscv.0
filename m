Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EC5E77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 00:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/+a6DS14B0zrGbfBpRg+RjkNH/Okk8/7yA+Lj5bA2g=; b=xNPkqDQ/vxzUOW
	lM6B/yJDYr83+ZYmrtyRNORdHpB5WO4KUFdqzDS5rL/VmxaVqFu+We+hRyFHz+6Lx0UTwo5JAzJbQ
	hU8RCgn3RE6HQAI3KfJ/I+4rDro5bDnHvMIFUrybz0FKa32fAopjFXp9JRupiQtQijruzavd2Pz9o
	8BopSasgchzFRPwx2UmC1AxBaCtVeZpaHSlG3dlsZhEzb5MV3zGiS7EbBbdSjiCbHwcZb9yDp+rFY
	vjD6qPHUyQZ0WgH3U/UWXJ/6xjVQDSsZMTgtRfhyQuJAJt7wcT+MlsAgfvjVQIrm4ECV82/NNalkw
	le8SMub3khL+7OC69A4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNiLq-0000000FFbs-0O0X;
	Wed, 18 Dec 2024 00:55:46 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNiLn-0000000FFau-3JT4
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 00:55:45 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a814c54742so38155ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2024 16:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734483343; x=1735088143; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZA5AofWr5GSYflF6+I3hbm4qPSjZIXYxDpZkR0xiDPk=;
        b=AXVPt01OgcK2HOrGdIR5KMECS0kjgnauzXrTVIyfmpgwmjkorMZ0PtAkSzrmY65+f3
         seNtd4qYLoFcD+/H9oLbFIKxj/WWTHV2lbbMnzQBDGj4PSQpIP0wWnPhkjNerhfzbgND
         TK/TYJOppxHb9kg47Y4Zh/xtJlVWu0E99y81j52SxRfG3G8lHPApXUOmeXEmVMV6am5H
         i3QLEOcAP6LDzcKYIC2Z8L0Dxc4MNMSwRtQjVhUI/BSOW0LidYXIWwJtiDewRABPkfx3
         2XBhveIMJByMa/gxISZEhoEHISh+bdnRvY6llRhIKYOg1kbXLehoqssxowecusvO5mOk
         eaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734483343; x=1735088143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZA5AofWr5GSYflF6+I3hbm4qPSjZIXYxDpZkR0xiDPk=;
        b=tLEoCNbyhNup5U2ayQwQ5OYJ+4LzXDBnip0pkjy1sDtJ9EVs08HksRA8yJShwrCUE6
         18wCNK61XflI3MSnTcw3vNesjueC69YyFtrYFEBBtGEIlfL5/mjmB7h/5LCHhpQJmNg8
         t+hRK0DjTv/kO1C+uo4fyoLQc/DJD53j045vEVb547FmP8R40cIniO3bUli+bxKaJ3f/
         azEEvZntpoAxdwRcHMUIU18sO/X9tNPbKsRnldCFvChN9ovPZbrCfFvQZFpc/yOiaXlk
         eizE+rGcy1ED0F7UpG2SdkkKTmI3Enhd0LfO85qS80HOQIOi609GnBcOyEe7cs4Ew68L
         kBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpHf6bz5Sc3DmFsFws9rov7lQZqvK0ihUEQ854tdu2IZB7Z14Ptr2oIL5xjLg2o6ZG9YHvdqVo+8Dqtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0tJt/NtrA3t4sRzVbdIPerIS34db2Q3EpidUyXn2g3qNcNQal
	V8uXj2zrJ8qMHskLQTkE2qWBGC6+06MQS5/mM6/uj+9ee+rdIcOmQ7yK3bW3IHDMsDenreDeHFN
	rOzzu5ulBbRTlrl+2b0yLZIpxCZrzIlQr32mb
X-Gm-Gg: ASbGncsJ4nAbW9UdK5HRqvlxS6i3LhAQ62HvZFNE/qHAer8BMABlo/hZDpuukrFXs/J
	rYj5ky989SvWSS01JVEJ8KxtUrj2uBJrDoMm6lsI=
X-Google-Smtp-Source: AGHT+IHwkmkKSwBW1bBsKvRuQE7csGF2fmrEZdMaG0n2s2039ybngebg2ODDRWHlQCtACc0FmnNxrqqX7i0nPNraaJI=
X-Received: by 2002:a05:6e02:1d0f:b0:3a7:e616:8d36 with SMTP id
 e9e14a558f8ab-3be373b3533mr388085ab.9.1734483342525; Tue, 17 Dec 2024
 16:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20241217-perf_fix_riscv_obj_reading-v2-1-58f81b7b4c7d@rivosinc.com>
 <CAP-5=fXK6HRzBKHzF=T_w9cn7ohWOdmZNRMXvJzN6QG11HE6tA@mail.gmail.com> <Z2IXl5cuKQJInJb0@ghost>
In-Reply-To: <Z2IXl5cuKQJInJb0@ghost>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Dec 2024 16:55:31 -0800
Message-ID: <CAP-5=fW9wKgBN7vn6gK98iNjt6TpbGV1qhCv_qup_30iQP+o3g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241217_165543_832058_8FEC4E2E 
X-CRM114-Status: GOOD (  29.89  )
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

T24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgNDozMOKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMTcsIDIwMjQgYXQgMDQ6MTg6
MzJQTSAtMDgwMCwgSWFuIFJvZ2VycyB3cm90ZToKPiA+IE9uIFR1ZSwgRGVjIDE3LCAyMDI0IGF0
IDM6NTLigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gQWZ0ZXIgYmludXRpbHMgY29tbWl0IGU0M2Q4NzYgd2hpY2ggd2FzIGZpcnN0
IGluY2x1ZGVkIGluIGJpbnV0aWxzIDIuNDEsCj4gPiA+IHJpc2N2IG5vIGxvbmdlciBzdXBwb3J0
cyBkdW1waW5nIGluIHRoZSBtaWRkbGUgb2YgaW5zdHJ1Y3Rpb25zLiBJbmNyZWFzZQo+ID4gPiB0
aGUgb2JqZHVtcCB3aW5kb3cgYnkgMi1ieXRlcyB0byBlbnN1cmUgdGhhdCBhbnkgaW5zdHJ1Y3Rp
b24gdGhhdCBzaXRzCj4gPiA+IG9uIHRoZSBib3VuZGFyeSBvZiB0aGUgc3BlY2lmaWVkIHN0b3At
YWRkcmVzcyBpcyBub3QgY3V0IGluIGhhbGYuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gPgo+ID4gUmV2aWV3ZWQtYnk6
IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xlLmNvbT4KPiA+Cj4gPiA+IC0tLQo+ID4gPiBBIGJp
bnV0aWxzIHBhdGNoIGhhcyBiZWVuIHNlbnQgYXMgd2VsbCB0byBmaXggdGhpcyBpbiBvYmpkdW1w
IFsxXS4KPiA+ID4KPiA+ID4gTGluazoKPiA+ID4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9waXBl
cm1haWwvYmludXRpbHMvMjAyNC1EZWNlbWJlci8xMzgxMzkuaHRtbCBbMV0KPiA+ID4gLS0tCj4g
PiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+IC0gRG8gb2JqZHVtcCB2ZXJzaW9uIGRldGVjdGlvbiBh
dCBydW50aW1lIChJYW4pCj4gPiA+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI0MTIxNi1wZXJmX2ZpeF9yaXNjdl9vYmpfcmVhZGluZy12MS0wLWI3NTk2MjY2MGE5
YkByaXZvc2luYy5jb20KPiA+ID4gLS0tCj4gPiA+ICB0b29scy9wZXJmL3Rlc3RzL2NvZGUtcmVh
ZGluZy5jIHwgODQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+
Cj4gPiA+IGRpZmYgLS1naXQgYS90b29scy9wZXJmL3Rlc3RzL2NvZGUtcmVhZGluZy5jIGIvdG9v
bHMvcGVyZi90ZXN0cy9jb2RlLXJlYWRpbmcuYwo+ID4gPiBpbmRleCAyN2M4MmNmYjdlN2RlNDIy
ODRiZjVhZjljZjc1OTRhM2E5NjMwNTJlLi43ZTI0ZDEwYTU0M2FjMThhYzJiZTcwYjgyOWQwODg4
NzRlMGVkZmQ1IDEwMDY0NAo+ID4gPiAtLS0gYS90b29scy9wZXJmL3Rlc3RzL2NvZGUtcmVhZGlu
Zy5jCj4gPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdGVzdHMvY29kZS1yZWFkaW5nLmMKPiA+ID4gQEAg
LTEsNSArMSw2IEBACj4gPiA+ICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+
ID4gPiAgI2luY2x1ZGUgPGVycm5vLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgva2NvbmZpZy5o
Pgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+Cj4gPiA+ICAjaW5jbHVkZSA8aW50dHlwZXMuaD4KPiA+ID4gQEAgLTE3Niw2ICsx
NzcsNjYgQEAgc3RhdGljIGludCByZWFkX29iamR1bXBfb3V0cHV0KEZJTEUgKmYsIHZvaWQgKmJ1
Ziwgc2l6ZV90ICpsZW4sIHU2NCBzdGFydF9hZGRyKQo+ID4gPiAgICAgICAgIHJldHVybiBlcnI7
Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICsvKgo+ID4gPiArICogT25seSBnZXRzIEdOVSBvYmpkdW1w
IHZlcnNpb24uIFJldHVybnMgMCBmb3IgbGx2bS1vYmpkdW1wLgo+ID4gPiArICovCj4gPiA+ICtz
dGF0aWMgaW50IG9iamR1bXBfdmVyc2lvbih2b2lkKQo+ID4gPiArewo+ID4gPiArICAgICAgIHNp
emVfdCBsaW5lX2xlbjsKPiA+ID4gKyAgICAgICBjaGFyIGNtZFtQQVRIX01BWCAqIDJdOwo+ID4g
PiArICAgICAgIGNoYXIgKmxpbmUgPSBOVUxMOwo+ID4gPiArICAgICAgIGNvbnN0IGNoYXIgKmZt
dDsKPiA+ID4gKyAgICAgICBGSUxFICpmOwo+ID4gPiArICAgICAgIGludCByZXQ7Cj4gPiA+ICsK
PiA+ID4gKyAgICAgICBpbnQgdmVyc2lvbl90bXAsIHZlcnNpb25fbnVtID0gMDsKPiA+ID4gKyAg
ICAgICBjaGFyICp2ZXJzaW9uID0gMCwgKnRva2VuOwo+ID4gPiArCj4gPiA+ICsgICAgICAgZm10
ID0gIiVzIC0tdmVyc2lvbiI7Cj4gPiA+ICsgICAgICAgcmV0ID0gc25wcmludGYoY21kLCBzaXpl
b2YoY21kKSwgZm10LCB0ZXN0X29iamR1bXBfcGF0aCk7Cj4gPiA+ICsgICAgICAgaWYgKHJldCA8
PSAwIHx8IChzaXplX3QpcmV0ID49IHNpemVvZihjbWQpKQo+ID4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIC0xOwo+ID4gPiArICAgICAgIC8qIElnbm9yZSBvYmpkdW1wIGVycm9ycyAqLwo+ID4g
PiArICAgICAgIHN0cmNhdChjbWQsICIgMj4vZGV2L251bGwiKTsKPiA+ID4gKyAgICAgICBmID0g
cG9wZW4oY21kLCAiciIpOwo+ID4gPiArICAgICAgIGlmICghZikgewo+ID4gPiArICAgICAgICAg
ICAgICAgcHJfZGVidWcoInBvcGVuIGZhaWxlZFxuIik7Cj4gPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLTE7Cj4gPiA+ICsgICAgICAgfQo+ID4gPiArICAgICAgIC8qIEdldCBmaXJzdCBsaW5l
IG9mIG9iamR1bXAgLS12ZXJzaW9uIG91dHB1dCAqLwo+ID4gPiArICAgICAgIHJldCA9IGdldGxp
bmUoJmxpbmUsICZsaW5lX2xlbiwgZik7Cj4gPiA+ICsgICAgICAgcGNsb3NlKGYpOwo+ID4gPiAr
ICAgICAgIGlmIChyZXQgPCAwKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBwcl9kZWJ1ZygiZ2V0
bGluZSBmYWlsZWRcbiIpOwo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+ID4gPiAr
ICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAgIHRva2VuID0gc3Ryc2VwKCZsaW5lLCAiICIp
Owo+ID4gPiArICAgICAgIGlmICh0b2tlbiAhPSBOVUxMICYmICFzdHJjbXAodG9rZW4sICJHTlUi
KSkgewo+ID4gPiArICAgICAgICAgICAgICAgLy8gdmVyc2lvbiBpcyBsYXN0IHBhcnQgb2YgZmly
c3QgbGluZSBvZiBvYmpkdW1wIC0tdmVyc2lvbiBvdXRwdXQuCj4gPiA+ICsgICAgICAgICAgICAg
ICB3aGlsZSAoKHRva2VuID0gc3Ryc2VwKCZsaW5lLCAiICIpKSkKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgdmVyc2lvbiA9IHRva2VuOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAg
ICAvLyBDb252ZXJ0IHZlcnNpb24gaW50byBhIGZvcm1hdCB3ZSBjYW4gY29tcGFyZSB3aXRoCj4g
PiA+ICsgICAgICAgICAgICAgICB0b2tlbiA9IHN0cnNlcCgmdmVyc2lvbiwgIi4iKTsKPiA+ID4g
KyAgICAgICAgICAgICAgIHZlcnNpb25fbnVtID0gYXRvaSh0b2tlbik7Cj4gPiA+ICsgICAgICAg
ICAgICAgICBpZiAodmVyc2lvbl9udW0pCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHZl
cnNpb25fbnVtICo9IDEwMDAwOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICB0b2tlbiA9
IHN0cnNlcCgmdmVyc2lvbiwgIi4iKTsKPiA+ID4gKyAgICAgICAgICAgICAgIHZlcnNpb25fdG1w
ID0gYXRvaSh0b2tlbik7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAodG9rZW4pCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHZlcnNpb25fbnVtICs9IHZlcnNpb25fdG1wICogMTAwOwo+
ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICB0b2tlbiA9IHN0cnNlcCgmdmVyc2lvbiwgIi4i
KTsKPiA+ID4gKyAgICAgICAgICAgICAgIHZlcnNpb25fdG1wID0gYXRvaSh0b2tlbik7Cj4gPiA+
ICsgICAgICAgICAgICAgICBpZiAodG9rZW4pCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHZlcnNpb25fbnVtICs9IHZlcnNpb25fdG1wOwo+ID4gPiArICAgICAgIH0KPiA+ID4gKwo+ID4g
PiArICAgICAgIHJldHVybiB2ZXJzaW9uX251bTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiAgc3Rh
dGljIGludCByZWFkX3ZpYV9vYmpkdW1wKGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB1NjQgYWRkciwg
dm9pZCAqYnVmLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGxlbikK
PiA+ID4gIHsKPiA+ID4gQEAgLTE4Myw5ICsyNDQsMzAgQEAgc3RhdGljIGludCByZWFkX3ZpYV9v
YmpkdW1wKGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB1NjQgYWRkciwgdm9pZCAqYnVmLAo+ID4gPiAg
ICAgICAgIGNvbnN0IGNoYXIgKmZtdDsKPiA+ID4gICAgICAgICBGSUxFICpmOwo+ID4gPiAgICAg
ICAgIGludCByZXQ7Cj4gPiA+ICsgICAgICAgdTY0IHN0b3BfYWRkcmVzcyA9IGFkZHIgKyBsZW47
Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoSVNfRU5BQkxFRChfX3Jpc2N2KSkgewo+ID4KPiA+
IE5vdCBzdXJlIGlmIHRoZXJlIGlzIGEgY29uc2lzdGVuY3kgaXNzdWUgaGVyZS4gRWxzZXdoZXJl
IHdlJ3JlIGp1c3QKPiA+IHVzaW5nIGlmZGVmLCBzdWNoIGFzOgo+ID4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGVyZi9wZXJmLXRvb2xzLW5leHQuZ2l0
L3RyZWUvdG9vbHMvcGVyZi91dGlsL2luY2x1ZGUvZHdhcmYtcmVncy5oP2g9cGVyZi10b29scy1u
ZXh0I242OQo+Cj4gSSBkb24ndCBoYXZlIGFueSBzdHJvbmcgZmVlbGluZ3MgYWJvdXQgdGhhdC4g
SSBjYW4gY2hhbmdlIGl0IHRvIGJlIGFuCj4gaWZkZWYuIE9uIG90aGVyIGxpc3RzIEkgaGF2ZSBi
ZWVuIHRvbGQgdG8gdXNlIElTX0VOQUJMRUQgd2hlbmV2ZXIKPiBwb3NzaWJsZSwgYnV0IGl0J3Mg
b25seSBhIHNtYWxsIGRpZmZlcmVuY2UuCgpBZ3JlZWQuIExldCdzIHNlZSB3aGF0IEFybmFsZG8g
YW5kIE5hbWh5dW5nIHRoaW5rLgoKVGhhbmtzLApJYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
