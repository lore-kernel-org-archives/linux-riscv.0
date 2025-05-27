Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0037C5B543
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fc/cyDAQ/iHxzsw1JUnHtedKUjMsDPv3wEkAcUriPMc=; b=E14GOKR8hN5CRE
	SrxuBiMPQC5hMnjZCId5yoPxioseL/z4NarKWA6kBDZXCWtniPMx05ybUedzcIh2LL23BCpuuavlC
	uGmtErZG7ZkVcke/W6TY1CzAbpXby3HHhMbk6k85L03y8B4P7kUKJJYmVCW5DGqk+N7HmpCz17sdg
	9zq5kUo+JJEgc4BeEigonAIih8k4Q98jR1vmUfjqdn8dbioJDRZ9YuLmzORLQFF0D+gkz4gSeXjHW
	TewDYeAbBsaIvv0Eq9O8cug3q+xUCoXKr5/QXgqlAUYgfD3fRC2WUA1pJFBNg15iAsOBq1IBpDmu7
	MiQdHcCYTwTZ8y89vTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr6y-0000000AQO9-3I3n;
	Tue, 27 May 2025 10:00:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJr6C-0000000AQDy-0GSo
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 09:59:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a37ed01aa0so3128752f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748339994; x=1748944794; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4DLlx+hKQhw+ENgyFAqY2PL5hW4DHMG/cxZu2R2Xik=;
        b=Hv5Z3xJtBUKLC2LMyueQaBrgLBc1mSCjp7U0OZZHoRdtahKpO/3Q7lAQ7Ztr/tVKzZ
         sRtZd1VEny8OFmrgrFjj4XGP2gbYyCZj1+oGTd6WdOEhOp0E/eKdzv+gDk/ErvQnu1T5
         wrNiYWrv+hySOyryw0bc5XrVcZnBQjVCji6rSjZUlh+tvI458gKMBLm0TvnAj7CrbwWi
         NBqXdWYhwLJGw1PQz8Yh9NqH/TJNCqEcUSobET/LZidQMh/9VePrgiDigwgXojn453wT
         ptFllgBvqc8WibKYmyIreQ15hwA63NuXmTtrAjpFlKWhSIg5Q7DP6kWGJU67f8h5vdak
         0PhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748339994; x=1748944794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4DLlx+hKQhw+ENgyFAqY2PL5hW4DHMG/cxZu2R2Xik=;
        b=eoEt8V2tIFbTgB74hsCdZvvZXum4dV+v4v6FYzaeG65wManVlaHnmXdAxympktJC/f
         7kLZYkmrlozCCgfrC54bFJSIejRAS1XVkprnk0V1Lu1S81QWRXOs/MZkHevZlnY3JMH1
         QewnNeuIDtD0Vg+BsAA9PlmKHSF5d5lJeISBOrELPgWPb7SQyE1NuP92jEnynKpBFgQu
         DI5dcuyltvM5qns4TRzoUkNVaiRQGKyauK2P9p7vZP4D80qqeHRcYOVTe4p741L6S9th
         M4p6lHnd1eAJE+x3guUaSRM/Lsc5ZCVxbIBz2a1+dV6Bqnxx3bns6wK2EThae5GW7Z4V
         K6ew==
X-Forwarded-Encrypted: i=1; AJvYcCW+xa2spFE0C3iFzCehSqssjryP0IaXUgBQ40nol6D3lKm30uAH8W15vQHKRTiCjtiiGCtrRYtLKg0O1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCJPEuv/0386IqKosuLUQzOwKzMQ/zMKow8tE1mxsIPsmHJeLS
	IuDniu70fpmB8MWhWuJDYyJHJbbgYQ9fnd5adpLUWIHjIvCk9kh1oPbqpZrdbdCFZUcirSCJBUv
	/uKnKfAl8SuQI1U6pVMlCcImMHyz17+lD8E+XLXcUWA==
X-Gm-Gg: ASbGncszlz7/6ltUWOq8iFe++xZUO24PdoF+3l+7vDXHkgothcyCLdfdqOrfkAgXhQq
	usaymOUix5bFA0lGLCHenhkBIcnUT9VDCS/h497ce4CnHw5l2hMvcT23uHdDzmdDSE4SxWQrPWE
	5RgJEMW2AhiKBtimnj7T1091gnIYgfd3o=
X-Google-Smtp-Source: AGHT+IEW4jiGzBYUUJeQ+hZ9q3VAC3c3XCEXdCJkYQj3sC6I500v3SraZXfwDAQYqmh+I1E3eL9qo1sRnEJZg8HQc9I=
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8e07 with SMTP id
 ffacd0b85a97d-3a4d6eda68cmr5556606f8f.32.1748339993821; Tue, 27 May 2025
 02:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com> <20250523-b4-ctr_upstream_v3-v3-1-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-1-ad355304ba1c@rivosinc.com>
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Tue, 27 May 2025 10:59:41 +0100
X-Gm-Features: AX0GCFvLUhtMwBzFmk1b4gn3Tur4pK0okxD3qyqun7XWisCr-irbPglToM7Uhec
Message-ID: <CAECbVCvPCsHVvm5QKQrw+DDLsZGaHMgCHyJ=cp_gFcAyiFA4ow@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
To: ak@linux.intel.com, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Kumar Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_025956_355702_B656CDE0 
X-CRM114-Status: GOOD (  20.12  )
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

QWRkaW5nIEFuZGkgS2xlZW4gYXMgdGhpcyB3YXMgb3JpZ2luYWxseSB3cml0dGVuIGJ5IGhpbS4K
Ci1SYWpuZXNoCgpPbiBGcmksIE1heSAyMywgMjAyNSBhdCAxMjoyNuKAr0FNIFJham5lc2ggS2Fu
d2FsIDxya2Fud2FsQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBSSVNDViBDVFIgZXh0ZW5zaW9u
IHN1cHBvcnRzIGEgbWF4aW11bSBkZXB0aCBvZiAyNTYgbGFzdCBicmFuY2ggcmVjb3Jkcy4KPiBD
dXJyZW50bHkgcmVtb3ZlX2xvb3BzKCkgY2FuIG9ubHkgcHJvY2VzcyAxMjcgZW50cmllcyBhdCBt
YXguIFRoaXMgbGVhZHMKPiB0byBzYW1wbGVzIHdpdGggbW9yZSB0aGFuIDEyNyBlbnRyaWVzIGJl
aW5nIHNraXBwZWQuIFRoaXMgY2hhbmdlIHNpbXBseQo+IHVwZGF0ZXMgdGhlIHJlbW92ZV9sb29w
cygpIGxvZ2ljIHRvIGJlIGFibGUgdG8gcHJvY2VzcyAyNTYgZW50cmllcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFJham5lc2ggS2Fud2FsIDxya2Fud2FsQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgdG9v
bHMvcGVyZi91dGlsL21hY2hpbmUuYyB8IDIxICsrKysrKysrKysrKysrLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS90b29scy9wZXJmL3V0aWwvbWFjaGluZS5jIGIvdG9vbHMvcGVyZi91dGlsL21hY2hpbmUu
Ywo+IGluZGV4IDJkNTFiYWRmYmYyZTJkMTU4OGZhNGZkZDQyZWY2YzhmZWEzNWJmMGUuLjU0MTQ1
MjhiOWQzMzY3OTBkZWNmYjQyYTRmNmE0ZGE2YzZiNjhiMDcgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMv
cGVyZi91dGlsL21hY2hpbmUuYwo+ICsrKyBiL3Rvb2xzL3BlcmYvdXRpbC9tYWNoaW5lLmMKPiBA
QCAtMjE3NiwyNSArMjE3NiwzMiBAQCBzdGF0aWMgdm9pZCBzYXZlX2l0ZXJhdGlvbnMoc3RydWN0
IGl0ZXJhdGlvbnMgKml0ZXIsCj4gICAgICAgICAgICAgICAgIGl0ZXItPmN5Y2xlcyArPSBiZVtp
XS5mbGFncy5jeWNsZXM7Cj4gIH0KPgo+IC0jZGVmaW5lIENIQVNIU1ogMTI3Cj4gLSNkZWZpbmUg
Q0hBU0hCSVRTIDcKPiAtI2RlZmluZSBOT19FTlRSWSAweGZmCj4gKyNkZWZpbmUgQ0hBU0hCSVRT
IDgKPiArI2RlZmluZSBOT19FTlRSWSAweGZmVQo+Cj4gLSNkZWZpbmUgUEVSRl9NQVhfQlJBTkNI
X0RFUFRIIDEyNwo+ICsjZGVmaW5lIFBFUkZfTUFYX0JSQU5DSF9ERVBUSCAyNTYKPgo+ICAvKiBS
ZW1vdmUgbG9vcHMuICovCj4gKy8qIE5vdGU6IExhc3QgZW50cnkgKGk9PWZmKSB3aWxsIG5ldmVy
IGJlIGNoZWNrZWQgYWdhaW5zdCBOT19FTlRSWQo+ICsgKiBzbyBpdCdzIHNhZmUgdG8gaGF2ZSBh
biB1bnNpZ25lZCBjaGFyIGFycmF5IHRvIHByb2Nlc3MgMjU2IGVudHJpZXMKPiArICogd2l0aG91
dCBjYXVzaW5nIGNsYXNoIGJldHdlZW4gbGFzdCBlbnRyeSBhbmQgTk9fRU5UUlkgdmFsdWUuCj4g
KyAqLwo+ICBzdGF0aWMgaW50IHJlbW92ZV9sb29wcyhzdHJ1Y3QgYnJhbmNoX2VudHJ5ICpsLCBp
bnQgbnIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGl0ZXJhdGlvbnMgKml0ZXIp
Cj4gIHsKPiAgICAgICAgIGludCBpLCBqLCBvZmY7Cj4gLSAgICAgICB1bnNpZ25lZCBjaGFyIGNo
YXNoW0NIQVNIU1pdOwo+ICsgICAgICAgdW5zaWduZWQgY2hhciBjaGFzaFtQRVJGX01BWF9CUkFO
Q0hfREVQVEhdOwo+Cj4gICAgICAgICBtZW1zZXQoY2hhc2gsIE5PX0VOVFJZLCBzaXplb2YoY2hh
c2gpKTsKPgo+IC0gICAgICAgQlVHX09OKFBFUkZfTUFYX0JSQU5DSF9ERVBUSCA+IDI1NSk7Cj4g
KyAgICAgICBCVUdfT04oUEVSRl9NQVhfQlJBTkNIX0RFUFRIID4gMjU2KTsKPgo+ICAgICAgICAg
Zm9yIChpID0gMDsgaSA8IG5yOyBpKyspIHsKPiAtICAgICAgICAgICAgICAgaW50IGggPSBoYXNo
XzY0KGxbaV0uZnJvbSwgQ0hBU0hCSVRTKSAlIENIQVNIU1o7Cj4gKyAgICAgICAgICAgICAgIC8q
IFJlbWFpbmRlciBkaXZpc2lvbiBieSBQRVJGX01BWF9CUkFOQ0hfREVQVEggaXMgbm90Cj4gKyAg
ICAgICAgICAgICAgICAqIG5lZWRlZCBhcyBoYXNoXzY0IHdpbGwgYW55d2F5IGxpbWl0IHRoZSBo
YXNoCj4gKyAgICAgICAgICAgICAgICAqIHRvIENIQVNIQklUUwo+ICsgICAgICAgICAgICAgICAg
Ki8KPiArICAgICAgICAgICAgICAgaW50IGggPSBoYXNoXzY0KGxbaV0uZnJvbSwgQ0hBU0hCSVRT
KTsKPgo+ICAgICAgICAgICAgICAgICAvKiBubyBjb2xsaXNpb24gaGFuZGxpbmcgZm9yIG5vdyAq
Lwo+ICAgICAgICAgICAgICAgICBpZiAoY2hhc2hbaF0gPT0gTk9fRU5UUlkpIHsKPgo+IC0tCj4g
Mi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
