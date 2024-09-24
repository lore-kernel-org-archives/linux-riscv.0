Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F06CF9C72
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NzrUoeI4naEsiAdzavA0gwIDKkMdlHYrvCJA4EJjPo=; b=Np4wnNaaSBpQBh
	zFBQ2dneeB2JpLHvNQK62ojnjAE37VLUMwAA0rTkB1dT1JpH0H4EvRJqqVb/6t5iJ66G1A0Dsuvxr
	e7BKe3pyu7Yj7D9/IzeO+KFFuUEz7MfM8DKySIHI+CUXS8JJpSZKhTvY5qWSjE19mcdx/GCdGKR+g
	yZvEkIncJe6+8AAVXPLg9vL2sXCCzXvURhr3USPY20/+jw1IEyce4KwpKzFYygaa3pYM/NVy4u8KC
	PSTdWnGplAgLf7tlE3FMx8fF2n9PGbkxqxSd8eGLKcsW1Y2kGAuptyIQ7SEc7Fa3T4nSkBgNbrkpU
	AawAvzBOw35aqz1EuQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st8Ao-00000002mBd-3WMW;
	Tue, 24 Sep 2024 16:13:58 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st88r-00000002lYz-31lD
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 16:11:59 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a1a4f2cc29so215255ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727194316; x=1727799116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aK+8nqvRO7dO5/4/shw4l0Rx/ZNh1LhM3L6aL1WqmLo=;
        b=Ma0iiPL7qYo6p/32cHRoM+Zq46FeFv4Hho7S6QhTLtz+kOxh8iXjgdlaKkPEhyw3oZ
         2prW4fi31lwMCD0Gt/UEF5/8j2Nu6HzyOAbXYBYkZmXAZ+kZGImLOiW3hWxkKnWTxE2r
         En9p+nVTMQIW+VQYH7pc9Ux62rCFu0P5UcSOFlBgMQZTeuNfIZdFjD4fCoeU+u0uE2n1
         H/UfXOwwxDnc2McUG12T2Q6wapzdSZf/mfRxCxp206xZA3FQ4zXxR9ntQ6CgA83d+wfT
         Cw+4aLWagFC9BF/gXpsGqMQpRg1fnyIVDsHFFaxltxSfkA4cC6iaIcY/2e9r/1iaVtxH
         G4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727194316; x=1727799116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aK+8nqvRO7dO5/4/shw4l0Rx/ZNh1LhM3L6aL1WqmLo=;
        b=dyas+frWF/+L3GYWVuVai3R83j/MeGwNNgFxTCEQ8qkwywI1qj/GOj3gEPIfbvrttd
         xIqrEG+/qiQ5JRXPGj2j7k1OlK2U+hIkfHQALq3z2uK9ylXuniAaqxRrlz6mIUzFiBH1
         igETwOGZv2mKkKPwbw2phm7NlRKOl8xdAt4ePf+0fxFKCqLwsHfpr2vPdNGm3A9kjeEf
         j2gy3m5xhxp/5ALEl6vNIhz+1DutkqUiiKfszA8jYgvauIK7c5hPnAsj6+BY31o6C9Ce
         Cul2xsgXzlb7v7mJqY1BuarxK0t1wDtxziTmv22iwZM6obSfjA97OYUHnzz0xpJnoWtD
         1YGA==
X-Forwarded-Encrypted: i=1; AJvYcCXRG/34PJF4TFd6HJsKfPM4TKn8pe4DPjtKYnLk2PYhW3lkdWdMJPxiKl+wr63u5QJ2f5JG8hYPE2sE1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmqyMuq76sn/KiS7CoVZQm5jjYoGEa71wqwQVDNC270Bl5CBnB
	egMYXR3H4CNsO3mRdizLYBri9xcfC6K72IwGGi4cLvq7i1N4T1fEz5Tjbdz1eyEWGFKuorxUadp
	iT0SbO6jkJUr7pw1Rfli8mNDFTf0bmCUytD50
X-Google-Smtp-Source: AGHT+IEDgO319xABlz3mm6Gouan+c85GCidD435zCa45qz34uLpw1tJ1xfxblbnmMiqV9LbkkULcbf/jlji4psKbtjg=
X-Received: by 2002:a05:6e02:170b:b0:376:3026:9dfc with SMTP id
 e9e14a558f8ab-3a1a3f9fb73mr4541725ab.24.1727194315929; Tue, 24 Sep 2024
 09:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-perf_syscalltbl_fix-v1-1-e2ff61ee5e8e@rivosinc.com> <ZvLaGy7jRa9Q/5fQ@ghost>
In-Reply-To: <ZvLaGy7jRa9Q/5fQ@ghost>
From: Ian Rogers <irogers@google.com>
Date: Tue, 24 Sep 2024 09:11:41 -0700
Message-ID: <CAP-5=fVWFUA4LpchM1MZdMhDvSFhTUtqdVR-s59WtAcpj1fO=g@mail.gmail.com>
Subject: Re: [PATCH] perf syscalltbl: Add syscalltbl__id_at_idx() with no
 syscall table support
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Howard Chu <howardchu95@gmail.com>, David Abdurachmanov <davidlt@rivosinc.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_091157_767945_9AD83464 
X-CRM114-Status: GOOD (  33.29  )
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

T24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgODoyNuKAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBBdWcgMzAsIDIwMjQgYXQgMDk6MzA6
NTBQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gV2hlbiBIQVZFX1NZU0NBTExf
VEFCTEVfU1VQUE9SVCBpcyBub3QgZGVmaW5lZCwgbmVpdGhlciBpcwo+ID4gc3lzY2FsbHRibF9f
aWRfYXRfaWR4KCkuIEhvd2V2ZXIsIHRoaXMgZnVuY3Rpb24gaXMgZXhwZWN0ZWQgdG8gYmUKPiA+
IGRlZmluZWQgd2hlbiBIQVZFX0JQRl9TS0VMIGlzIGRlZmluZWQuCj4gPgo+ID4gUmV0dXJuIC0x
IGZyb20gc3lzY2FsbHRibF9faWRfYXRfaWR4KCkgdG8gbWF0Y2ggdGhlIG90aGVyIGZ1bmN0aW9u
cyB3aGVuCj4gPiBIQVZFX1NZU0NBTExfVEFCTEVfU1VQUE9SVCBpcyBub3QgZGVmaW5lZC4KPiA+
Cj4gPiBXaXRob3V0IHRoaXMsIGNvbXBpbGluZyBwZXJmIG9uIHJpc2N2IHdoZW4gbGlidHJhY2Vl
dmVudHMsIGxpYmVsZiwgYW5kCj4gPiBjbGFuZyBhcmUgYXZhaWxhYmxlIHdpbGwgY2F1c2UgdGhl
IGZ1bmN0aW9ucyB0cnlpbmcgdG8gY2FsbAo+ID4gc3lzY2FsbHRibF9faWRfYXRfaWR4KCkgdG8g
YmUgY29tcGlsZWQuIFRoaXMgcmVzdWx0cyBpbiB0aGUgZm9sbG93aW5nCj4gPiBlcnJvcjoKPiA+
Cj4gPiAvdXNyL2Jpbi9sZDogcGVyZi1pbi5vOiBpbiBmdW5jdGlvbiBgLkwwICc6Cj4gPiBidWls
dGluLXRyYWNlLmM6KC50ZXh0KzB4NjBiMTQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBzeXNj
YWxsdGJsX19pZF9hdF9pZHgnCj4gPiAvdXNyL2Jpbi9sZDogYnVpbHRpbi10cmFjZS5jOigudGV4
dCsweDYwYzZjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc3lzY2FsbHRibF9faWRfYXRfaWR4
Jwo+ID4gL3Vzci9iaW4vbGQ6IHBlcmYtaW4ubzogaW4gZnVuY3Rpb24gYC5MMjU2NCc6Cj4gPiBi
dWlsdGluLXRyYWNlLmM6KC50ZXh0KzB4NjBjYjYpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBz
eXNjYWxsdGJsX19pZF9hdF9pZHgnCj4gPiBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEg
ZXhpdCBzdGF0dXMKPiA+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGUucGVyZjo3OTM6IHBlcmZdIEVy
cm9yIDEKPiA+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGUucGVyZjoyOTA6IHN1Yi1tYWtlXSBFcnJv
ciAyCj4gPiBtYWtlOiAqKiogW01ha2VmaWxlOjcwOiBhbGxdIEVycm9yIDIKPiA+IG1ha2U6IExl
YXZpbmcgZGlyZWN0b3J5ICcvc3JjL2xpbnV4LTYuMTEtcmM1L3Rvb2xzL3BlcmYnCj4gPgo+ID4g
VGhpcyBwYXRjaCByZXNvbHZlcyB0aGlzIGlzc3VlIGZvciBhbGwgYXJjaGl0ZWN0dXJlcyB3aGlj
aCBkbyBub3QgZGVmaW5lCj4gPiBIQVZFX1NZU0NBTExfVEFCTEVfU1VQUE9SVC4KPiA+Cj4gPiAk
IC4vcGVyZiB0cmFjZSAtZSBzeXNjYWxsczpzeXNfZW50ZXJfbW1hcCAtLW1heC1ldmVudHM9MSBs
cwo+ID4gMC4wMDAgbHMvMjg3IHN5c2NhbGxzOnN5c19lbnRlcl9tbWFwKF9fc3lzY2FsbF9ucjog
MjIyLCBsZW46IDk5MzksIHByb3Q6IFJFQUQsIGZsYWdzOiBQUklWQVRFLCBmZDogMykKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+
ID4gUmVwb3J0ZWQtYnk6IERhdmlkIEFiZHVyYWNobWFub3YgPGRhdmlkbHRAcml2b3NpbmMuY29t
Pgo+ID4gU3VnZ2VzdGVkLWJ5OiBEYXZpZCBBYmR1cmFjaG1hbm92IDxkYXZpZGx0QHJpdm9zaW5j
LmNvbT4KPiA+IEZpeGVzOiA3YTJmYjU2MTljYzEgKCJwZXJmIHRyYWNlOiBGaXggaXRlcmF0aW9u
IG9mIHN5c2NhbGwgaWRzIGluIHN5c2NhbGx0YmwtPmVudHJpZXMiKQo+ID4gLS0tCj4gPiAgdG9v
bHMvcGVyZi91dGlsL3N5c2NhbGx0YmwuYyB8IDUgKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvdXRpbC9zeXNj
YWxsdGJsLmMgYi90b29scy9wZXJmL3V0aWwvc3lzY2FsbHRibC5jCj4gPiBpbmRleCAwZGQyNmI5
OTFiM2YuLjEyNjU0NDYwNDI4ZiAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3BlcmYvdXRpbC9zeXNj
YWxsdGJsLmMKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9zeXNjYWxsdGJsLmMKPiA+IEBAIC0x
ODgsNCArMTg4LDkgQEAgaW50IHN5c2NhbGx0YmxfX3N0cmdsb2JtYXRjaF9maXJzdChzdHJ1Y3Qg
c3lzY2FsbHRibCAqdGJsLCBjb25zdCBjaGFyICpzeXNjYWxsX2cKPiA+ICB7Cj4gPiAgICAgICBy
ZXR1cm4gc3lzY2FsbHRibF9fc3RyZ2xvYm1hdGNoX25leHQodGJsLCBzeXNjYWxsX2dsb2IsIGlk
eCk7Cj4gPiAgfQo+ID4gKwo+ID4gK2ludCBzeXNjYWxsdGJsX19pZF9hdF9pZHgoc3RydWN0IHN5
c2NhbGx0YmwgKnRibCBfX2Fsd2F5c191bnVzZWQsIGludCBpZHggX19hbHdheXNfdW51c2VkKQo+
ID4gK3sKPiA+ICsgICAgIHJldHVybiAtMTsKPiA+ICt9Cj4gPiAgI2VuZGlmIC8qIEhBVkVfU1lT
Q0FMTF9UQUJMRV9TVVBQT1JUICovCj4gPgo+ID4gLS0tCj4gPiBiYXNlLWNvbW1pdDogOTg1YmY0
MGVkZjQzNDNkY2IwNGMzM2Y1OGI0MGI0YTg1YzE3NzZkNAo+ID4gY2hhbmdlLWlkOiAyMDI0MDgz
MC1wZXJmX3N5c2NhbGx0YmxfZml4LTRmNTg2MjIxNzk1ZQo+ID4gLS0KPiA+IC0gQ2hhcmxpZQo+
ID4KPgo+IENhbiB0aGlzIHBsZWFzZSBiZSBwaWNrZWQgdXA/IENvbXBpbGF0aW9uIG9uIHJpc2N2
IChhbG9uZyB3aXRoIGFueSBvZgo+IHRoZSBvdGhlciBhcmNoaXRlY3R1cmVzIHRoYXQgZG9uJ3Qg
aGF2ZSBzeXNjYWxsIHRhYmxlIHN1cHBvcnQpIGlzCj4gYnJva2VuLiBUaGUgbG9uZyB0ZXJtIHNv
bHV0aW9uIGlzIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgc3lzY2FsbCB0YWJsZQo+IG9uIHJpc2N2
LiBJIHdpbGwgc2VuZCBvdXQgYSBwYXRjaCBmb3IgdGhhdCwgYnV0IGluIHRoZSBtZWFudGltZSBp
dCB3b3VsZAo+IGJlIGdyZWF0IHRvIGhhdmUgdGhpcyBpbiB0aGUgdHJlZS4KCkkgdGhvdWdodCBz
b21ldGhpbmcgaGFkIGJlZW4gZG9uZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC83Mzkw
MDFhNC00ZGYxLTRkZWMtYTE0MS05MjZjNzhjNWMwN2VAa2VybmVsLm9yZy8KTm90IHN1cmUgd2hh
dCdzIGhhcHBlbmVkLgoKVGhhbmtzLApJYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
