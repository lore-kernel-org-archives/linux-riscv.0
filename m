Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE62CCA470
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42aK6a3mx6mtiE4qo9B7JH4+AuVgNm1CVWlRvBEMHK8=; b=3wye8lSsFXxRdS
	DNBR/XaATLciz8eJenE5ADZyxU1uOlEVmBS9VQq6DNZBSP28cs0NZIu4+SCkFXGk1Oj7FXrMDGVBO
	WS2+oZ49Kk8sjsfZ4w9IOV4J2SNx/JKMWvDE+Jt2aS774txeX1FdVnVJEViCp04gK8mKlWpUdNvt1
	DM9I5tmN82Mihd+M9YeM2aPg/NJ40lGpIYUaEyoy4tCTxnJHG3n85KjiAixb1YpLDX7PmyJlJqVDY
	v9mTx2ArQVRDmJmgbUYxI3W1gbsPSZWLv1LDls6ije4BWUhsnhK188Qir7HVNJPki24Ora744z/ys
	PpSC07fH7aHLMgxZXLfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5pSE-00000000X9n-16lq;
	Mon, 06 Oct 2025 17:56:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5pSC-00000000X9M-0yrL
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 17:56:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-27eeafd4882so30905ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Oct 2025 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759773415; x=1760378215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgNIO/Vg03wOgHjezxsvevp0MBXeQPhEmL6wrOMft2c=;
        b=21q6xXeOjaBB8uhnL9zS8P/ThiTKlD+XlP0CQN0wi37ZprVz1OzN+pGbRqti6mOg9d
         ewNDTXZ188tJYYMAEHKDIbebk/SOM4hZQVXJq/sjBRqppyuXlECqXDO2hvvOxJ2U4dM1
         q4pKZoXLEeSbB284eqWVvCQ6aHRkC+LAwpPupD3IIHA1kDkIBhbz4kpdktXJ9DY/q8Xt
         LE4wo1qW/qbcSllZuCVvz1LEg7f8vJ4QLTYfnYGEnJiFqBOhGw6mgSJHmfHoroAyrmn4
         WZu4vkIdBsuIIfdodpnS53iOzQdAbDAru4TlDj2Lxe/EbRziRBxQwi1j6FLcYs+QYgS2
         Iapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759773415; x=1760378215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgNIO/Vg03wOgHjezxsvevp0MBXeQPhEmL6wrOMft2c=;
        b=G1DwobHvt/++VgkrzmQY/cnWG7zKyhqYQlG/RtopzPnJfcshkAUwZqfXj9TSu6H82L
         +5mm3LNjm0KsImrO5vB1HNIWHiODjL9icXWwzXISaak3a6bF1V68fOIm0WU+PzCH/elz
         wjsDUuDxtkCOlps2fQtGBf7lVC3CUW3vxiaHAsfBdVU3Q/UN89bhPFEqfZf6xSTRJUrq
         fOe6cpSn6P9jXiJmeo4yrMRpqmC/TIgV4q3OfgCnqkAzV1SeW2klcdSGteV/oBbSeHXA
         iCXM/5eaKq2ucDL4B4Ujmca0rGwwY5yj8ougLRDx/Rpm4MIWrZ/Ek8Cslkep31pUMWUh
         1/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB3bqzeyIG90013Q5T7ucLA3CkDTCA3NvodSu8Mi0hhKU7pIbMuw95FX3tI8cfCAKhCkYVBgdYC5kTMA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/dKNcJALe8qZwVEPln5hY+x4RPIjpvE9rAVmI9Yvazu/Lnj8o
	IA72f7sqMdVgSGmTvacaMzMKq3+k8F7TIgzkSBBWuHxJa7gIyBdaNhmIRrEUmgn6prbwm92TWD2
	3QURhgoGIUeYa3SpygMGqeY+oq8ckHexLbeT9u4Ts
X-Gm-Gg: ASbGncvwhLW4X/SW+Lls/Yl+niY1xX07ZFl5j7hF3dIMMDu+O7q1B/V0kyjBFdroQwy
	/jDqHgP6b6Xmh6UNiCMzYOS7YYg3rq5xbHGM2a7hORtvg2muXe/nWxfArlTC9T+7K6oaPxZV9q8
	h2BW65C5Zm8dVc7mUb7+D72HaQaItCmxFgChf0sTtAFaJF2xT1RekEoA+/xsMFvt+5XQibaCFSr
	edbcv34uh1f8maub7WXkASWM1578RoKzb/NrtcAB7FfI4kS6f+r8UXAM32ojDr1IlcMNB18eEoN
	VIs=
X-Google-Smtp-Source: AGHT+IEc0OvHtFH5e8JUnvIJenLMDF0rFXPhnKj1FxC7gkK5Xn2psBR9dBkn9cD2lkoGGsFgB9c6AUjOaYgzf5qGaJo=
X-Received: by 2002:a17:903:3d07:b0:268:cc5:5e3c with SMTP id
 d9443c01a7336-28eca40ef40mr356805ad.10.1759773414620; Mon, 06 Oct 2025
 10:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com> <20251006-perf_build_android_ndk-v3-4-4305590795b2@arm.com>
In-Reply-To: <20251006-perf_build_android_ndk-v3-4-4305590795b2@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 6 Oct 2025 10:56:43 -0700
X-Gm-Features: AS18NWBYM4S-kQkaLa4kp8LfC_m-pnaoulSPmNbf8CExHNpB0ol_xCKKyPKhVEQ
Message-ID: <CAP-5=fUVs8Dn+kQDgPW08SNC=W5ZQKMFEETjjqkOJ_Mvbv22dw@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] perf build: Disable thread safety analysis for
 perl header
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_105656_277163_0C366522 
X-CRM114-Status: GOOD (  18.52  )
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

T24gTW9uLCBPY3QgNiwgMjAyNSBhdCA5OjIx4oCvQU0gTGVvIFlhbiA8bGVvLnlhbkBhcm0uY29t
PiB3cm90ZToKPgo+IFdoZW4gYnVpbGQgd2l0aCBwZXJsNSwgaXQgcmVwb3J0cyBlcnJvcjoKPgo+
ICAgICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3Vzci9saWIvcGVybDUvNS40Mi4wL3g4Nl82NC1s
aW51eC10aHJlYWQtbXVsdGkvQ09SRS9wZXJsLmg6NzkzMzoKPiAgICAgL3Vzci9saWIvcGVybDUv
NS40Mi4wL3g4Nl82NC1saW51eC10aHJlYWQtbXVsdGkvQ09SRS9pbmxpbmUuaDoyOTg6NTogZXJy
b3I6Cj4gICAgICAgICAgIG11dGV4ICdQTF9lbnZfbXV0ZXgubG9jaycgaXMgbm90IGhlbGQgb24g
ZXZlcnkgcGF0aCB0aHJvdWdoCj4gICAgICAgICAgIGhlcmUgWy1XZXJyb3IsLVd0aHJlYWQtc2Fm
ZXR5LWFuYWx5c2lzXQo+ICAgICAgIDI5OCB8ICAgICBFTlZfVU5MT0NLOwo+ICAgICAgICAgICB8
ICAgICBeCj4gICAgIC91c3IvbGliL3Blcmw1LzUuNDIuMC94ODZfNjQtbGludXgtdGhyZWFkLW11
bHRpL0NPUkUvcGVybC5oOjcwOTE6MzE6IG5vdGU6Cj4gICAgICAgICAgIGV4cGFuZGVkIGZyb20g
bWFjcm8gJ0VOVl9VTkxPQ0snCj4gICAgICA3MDkxIHwgIyAgZGVmaW5lIEVOVl9VTkxPQ0sgICAg
ICAgICAgUEVSTF9SRUVOVFJBTlRfVU5MT0NLKCJlbnYiLi4uCj4gICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgICAvdXNyL2xpYi9wZXJsNS81LjQyLjAveDg2
XzY0LWxpbnV4LXRocmVhZC1tdWx0aS9DT1JFL3BlcmwuaDo2NDY1Ojc6IG5vdGU6Cj4gICAgICAg
ICAgIGV4cGFuZGVkIGZyb20gbWFjcm8gJ1BFUkxfUkVFTlRSQU5UX1VOTE9DSycKPiAgICAgIDY0
NjUgfCAgICAgfSBTVE1UX0VORAo+ICAgICAgICAgICB8ICAgICAgIF4KPiAgICAgL3Vzci9saWIv
cGVybDUvNS40Mi4wL3g4Nl82NC1saW51eC10aHJlYWQtbXVsdGkvQ09SRS9wZXJsLmg6ODY1OjI4
OiBub3RlOgo+ICAgICAgICAgICBleHBhbmRlZCBmcm9tIG1hY3JvICdTVE1UX0VORCcKPiAgICAg
ICA4NjUgfCAjICAgZGVmaW5lIFNUTVRfRU5EICAgICB3aGlsZSAoMCkKPiAgICAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+Cj4gVGhlIGVycm9yIGlzIGNhdXNlZCBi
eSBwZXJsIGhlYWRlciBidXQgbm90IHBlcmYgY29kZSwgZGlzYWJsZSB0aHJlYWQKPiBzYWZldHkg
YW5hbHlzaXMgaWYgaW5jbHVkaW5nIHRoZSBoZWFkZXIuCj4KPiBUaG91Z2ggR0NDIGRvZXMgbm90
IHN1cHBvcnQgdGhlIHRocmVhZCBzYWZldHkgYW5hbHlzaXMgb3B0aW9uLCB0aGlzCj4gbmVnYXRp
dmUgd2FybmluZyBmbGFnIGlzIHNpbGVudGx5IGlnbm9yZWQgYnkgaXQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBMZW8gWWFuIDxsZW8ueWFuQGFybS5jb20+Cj4gLS0tCj4gIHRvb2xzL3BlcmYvc2NyaXB0
cy9wZXJsL1BlcmYtVHJhY2UtVXRpbC9CdWlsZCB8IDIgKy0KPiAgdG9vbHMvcGVyZi91dGlsL3Nj
cmlwdGluZy1lbmdpbmVzL0J1aWxkICAgICAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9wZXJm
L3NjcmlwdHMvcGVybC9QZXJmLVRyYWNlLVV0aWwvQnVpbGQgYi90b29scy9wZXJmL3NjcmlwdHMv
cGVybC9QZXJmLVRyYWNlLVV0aWwvQnVpbGQKPiBpbmRleCA5YjBlNWE4YjUwNzBmMWExNjQwNTE4
ZmFlNzU1NTdmODI0ZWYyMWVlLi4wMWExYTBlZDUxYWVmZDcyMWI0YmM3ZWJhNzI4YzI5YThmZmNk
NTUxIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvc2NyaXB0cy9wZXJsL1BlcmYtVHJhY2UtVXRp
bC9CdWlsZAo+ICsrKyBiL3Rvb2xzL3BlcmYvc2NyaXB0cy9wZXJsL1BlcmYtVHJhY2UtVXRpbC9C
dWlsZAo+IEBAIC0yLDcgKzIsNyBAQCBwZXJmLXV0aWwteSArPSBDb250ZXh0Lm8KPgo+ICBDRkxB
R1NfQ29udGV4dC5vICs9ICQoUEVSTF9FTUJFRF9DQ09QVFMpIC1Xbm8tcmVkdW5kYW50LWRlY2xz
IC1Xbm8tc3RyaWN0LXByb3RvdHlwZXMgLVduby1iYWQtZnVuY3Rpb24tY2FzdCAtV25vLWRlY2xh
cmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtV25vLXN3aXRjaC1lbnVtCj4gIENGTEFHU19Db250ZXh0
Lm8gKz0gLVduby11bnVzZWQtcGFyYW1ldGVyIC1Xbm8tbmVzdGVkLWV4dGVybnMgLVduby11bmRl
Zgo+IC1DRkxBR1NfQ29udGV4dC5vICs9IC1Xbm8tc3dpdGNoLWRlZmF1bHQgLVduby1zaGFkb3cK
PiArQ0ZMQUdTX0NvbnRleHQubyArPSAtV25vLXN3aXRjaC1kZWZhdWx0IC1Xbm8tc2hhZG93IC1X
bm8tdGhyZWFkLXNhZmV0eS1hbmFseXNpcwoKSSB3YXNuJ3QgYWJsZSB0byByZXByb2R1Y2UgdGhp
cyBvbiBEZWJpYW4gd2l0aCBwZXJmLXRvb2xzLW5leHQgYW5kOgptYWtlIC1DIHRvb2xzL3BlcmYg
Tz0vdG1wL3BlcmYgREVCVUc9MSBDQz1jbGFuZyBDWFg9Y2xhbmcrKwpIT1NUQ0M9Y2xhbmcgTElC
UEVSTD0xIGNsZWFuIGFsbApidXQgbXkgbGlicGVybCBpcyA1LjQwLiBJJ20gYSBsaXR0bGUgY29u
Y2VybmVkIHRoYXQgdGhlIHdhcm5pbmcgbWF5CmNhdXNlIGFuIHVucmVjb2duaXplZCBjb21waWxl
ciBvcHRpb24gd2FybmluZy9lcnJvciB3aXRoIEdDQyBnaXZlbgpwcm9ncmVzcyBvbiB0aHJlYWQt
c2FmZXR5LWFuYWx5c2lzIGhhcyBlbmRlZCB0aGVyZS4gQW55d2F5LCB0aGVzZQphcmVuJ3QgYmxv
Y2tlcnMuCgpSZXZpZXdlZC1ieTogSWFuIFJvZ2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgoKVGhh
bmtzLApJYW4KCj4KPiAgaWZlcSAoJChDQ19OT19DTEFORyksIDEpCj4gICAgQ0ZMQUdTX0NvbnRl
eHQubyArPSAtV25vLXVudXNlZC1jb21tYW5kLWxpbmUtYXJndW1lbnQKPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvcGVyZi91dGlsL3NjcmlwdGluZy1lbmdpbmVzL0J1aWxkIGIvdG9vbHMvcGVyZi91dGls
L3NjcmlwdGluZy1lbmdpbmVzL0J1aWxkCj4gaW5kZXggMjI4MmZlMzc3MmYzYmRjMzUwNTZjYjVl
NjZlZmIzNDYyZGMxYzJlMy4uMjRmMDg3YjBjZDExYjNlMDZhMzM4YzM5NGRjMmM2NTBiYzJjNjBi
MSAxMDA2NDQKPiAtLS0gYS90b29scy9wZXJmL3V0aWwvc2NyaXB0aW5nLWVuZ2luZXMvQnVpbGQK
PiArKysgYi90b29scy9wZXJmL3V0aWwvc2NyaXB0aW5nLWVuZ2luZXMvQnVpbGQKPiBAQCAtMyw3
ICszLDcgQEAgaWZlcSAoJChDT05GSUdfTElCVFJBQ0VFVkVOVCkseSkKPiAgZW5kaWYKPiAgcGVy
Zi11dGlsLSQoQ09ORklHX0xJQlBZVEhPTikgKz0gdHJhY2UtZXZlbnQtcHl0aG9uLm8KPgo+IC1D
RkxBR1NfdHJhY2UtZXZlbnQtcGVybC5vICs9ICQoUEVSTF9FTUJFRF9DQ09QVFMpIC1Xbm8tcmVk
dW5kYW50LWRlY2xzIC1Xbm8tc3RyaWN0LXByb3RvdHlwZXMgLVduby11bnVzZWQtcGFyYW1ldGVy
IC1Xbm8tc2hhZG93IC1Xbm8tbmVzdGVkLWV4dGVybnMgLVduby11bmRlZiAtV25vLXN3aXRjaC1k
ZWZhdWx0IC1Xbm8tYmFkLWZ1bmN0aW9uLWNhc3QgLVduby1kZWNsYXJhdGlvbi1hZnRlci1zdGF0
ZW1lbnQgLVduby1zd2l0Y2gtZW51bQo+ICtDRkxBR1NfdHJhY2UtZXZlbnQtcGVybC5vICs9ICQo
UEVSTF9FTUJFRF9DQ09QVFMpIC1Xbm8tcmVkdW5kYW50LWRlY2xzIC1Xbm8tc3RyaWN0LXByb3Rv
dHlwZXMgLVduby11bnVzZWQtcGFyYW1ldGVyIC1Xbm8tc2hhZG93IC1Xbm8tbmVzdGVkLWV4dGVy
bnMgLVduby11bmRlZiAtV25vLXN3aXRjaC1kZWZhdWx0IC1Xbm8tYmFkLWZ1bmN0aW9uLWNhc3Qg
LVduby1kZWNsYXJhdGlvbi1hZnRlci1zdGF0ZW1lbnQgLVduby1zd2l0Y2gtZW51bSAtV25vLXRo
cmVhZC1zYWZldHktYW5hbHlzaXMKPgo+ICAjIC1Xbm8tZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVt
ZW50OiBUaGUgcHl0aG9uIGhlYWRlcnMgaGF2ZSBtaXhlZCBjb2RlIHdpdGggZGVjbGFyYXRpb25z
IChkZWNscyBhZnRlciBhc3NlcnRzLCBmb3IgaW5zdGFuY2UpCj4gIENGTEFHU190cmFjZS1ldmVu
dC1weXRob24ubyArPSAkKFBZVEhPTl9FTUJFRF9DQ09QVFMpIC1Xbm8tcmVkdW5kYW50LWRlY2xz
IC1Xbm8tc3RyaWN0LXByb3RvdHlwZXMgLVduby11bnVzZWQtcGFyYW1ldGVyIC1Xbm8tc2hhZG93
IC1Xbm8tZGVwcmVjYXRlZC1kZWNsYXJhdGlvbnMgLVduby1zd2l0Y2gtZW51bSAtV25vLWRlY2xh
cmF0aW9uLWFmdGVyLXN0YXRlbWVudAo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
